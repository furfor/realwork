{*********************************************************}
{*                   STDICT.PAS 3.01                     *}
{*   Copyright (c) TurboPower Software Co., 1996-2000    *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$I STDEFINE.INC}

{$IFNDEF WIN32}
  {$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ENDIF}

{Notes:
  Nodes stored in the dictionary must be of type TStDictNode.

  Duplicate strings are not allowed in the dictionary.

  Calling Exists moves the found node to the front of its hash bin list.

  Iterate scans the nodes in hash order.

  Hashing and comparison is case-insensitive by default.

  In 16-bit mode, HashSize must be in the range 1..16380. In 32-bit
  mode, there is no practical limit on HashSize. A particular value
  of HashSize may lead to a better distribution of symbols in the
  dictionary, and therefore to better performance. Generally HashSize
  should be about the same size as the number of symbols expected in
  the dictionary. A prime number tends to give a better distribution.
  Based on analysis by D. Knuth, the following values are good
  choices for HashSize when the dictionary keys are alphanumeric
  strings:

    59 61 67 71 73 127 131 137 191 193 197 199 251 257 263 311 313
   317 379 383 389 439 443 449 457 503 509 521 569 571 577 631 641
   643 647 701 709 761 769 773 823 827 829 839 887 953 967

  Good values for larger tables can be computed by the GOODHASH.PAS
  bonus program.
}

unit STDict;
{-Dictionary class}

interface

uses
  {$IFDEF WIN32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  SysUtils, Classes,
  STConst, STBase;

type
  TStDictNode = class(TStNode)
{.Z+}
    protected
      dnNext : TStDictNode;     {Next node in hash list}
{$IFDEF HStrings}
      dnName : string;          {Name of symbol, already a pointer}
{$ELSE}
      dnName : PShortString;    {Pointer to name of symbol}
{$ENDIF}
      function GetName : string;

{.Z-}
    public
      constructor CreateStr(const Name : string; AData : Pointer);
        {-Initialize node}
      destructor Destroy; override;
        {-Free name string and destroy node}

      property Name : string
         read GetName;
  end;

{.Z+}
  TSymbolArray = array[0..(StMaxBlockSize div SizeOf(TStDictNode))-1] of TStDictNode;
  PSymbolArray = ^TSymbolArray;
{.Z-}

  TDictHashFunc =
    function(const S : string; Size : Integer) : Integer;

  TStDictionary = class(TStContainer)
{.Z+}
  protected
    {property instance variables}
    FHashSize : Integer;            {Bins in symbol array}
    FEqual    : TStringCompareFunc; {String compare function}
    FHash     : TDictHashFunc;

    {event variables}
    FOnEqual  : TStStringCompareEvent;

    {private instance variables}
    dySymbols : PSymbolArray;     {Pointer to symbol array}
    dyIgnoreDups : Boolean;       {Ignore duplicates during Join?}

    {protected undocumented methods}
    procedure dySetEqual(E : TStringCompareFunc);
    procedure dySetHash(H : TDictHashFunc);
    procedure dySetHashSize(Size : Integer);
    procedure dyFindNode(const Name : string; var H : Integer;
                         var Prev, This : TStDictNode);
{.Z-}
  public
    constructor Create(AHashSize : Integer); virtual;
      {-Initialize an empty dictionary}
    destructor Destroy; override;
      {-Destroy a dictionary}

    procedure LoadFromStream(S : TStream); override;
      {-Read a dictionary and its data from a stream}
    procedure StoreToStream(S : TStream); override;
      {-Write a dictionary and its data to a stream}

    procedure Clear; override;
      {-Remove all nodes from container but leave it instantiated}
    function DoEqual(const String1, String2 : string) : Integer;
      virtual;
    function Exists(const Name : string; var Data : Pointer) : Boolean;
      {-Return True and the Data pointer if Name is in the dictionary}
    procedure Add(const Name : string; Data : Pointer);
      {-Add new Name and Data to the dictionary}
    procedure Delete(const Name : string);
      {-Delete a Name from the dictionary}
    procedure GetItems(S : TStrings);
      {-Fill the string list with all stored strings}
    procedure SetItems(S : TStrings);
      {-Fill the container with the strings and objects in S}
    procedure Update(const Name : string; Data : Pointer);
      {-Update the data for an existing element}
    function Find(Data : Pointer; var Name : string) : Boolean;
      {-Return True and the element Name that matches Data}

    procedure Assign(Source: TPersistent); override;
      {-Assign another container's contents to this one}
    procedure Join(D : TStDictionary; IgnoreDups : Boolean);
      {-Add dictionary D into this one and dispose D}

    function Iterate(Action : TIterateFunc;
                     OtherData : Pointer) : TStDictNode;
      {-Call Action for all the nodes, returning the last node visited}

    function BinCount(H : Integer) : LongInt;
      {-Return number of names in a hash bin (for testing)}

    property Equal : TStringCompareFunc
      read FEqual
      write dySetEqual;

    property Hash : TDictHashFunc
      read FHash
      write dySetHash;

    property HashSize : Integer
      read FHashSize
      write dySetHashSize;

    property OnEqual : TStStringCompareEvent
      read FOnEqual
      write FOnEqual;
  end;


function AnsiHashText(const S : string; Size : Integer) : Integer;
  {-Case-insensitive hash function that uses the current language driver}
function AnsiHashStr(const S : string; Size : Integer) : Integer;
  {-Case-sensitive hash function}
function AnsiELFHashText(const S : string; Size : Integer) : Integer;
  {-Case-insensitive ELF hash function that uses the current language driver}
function AnsiELFHashStr(const S : string; Size : Integer) : Integer;
  {-Case-sensitive ELF hash function}


implementation


{$IFDEF ThreadSafe}
var
  ClassCritSect : TRTLCriticalSection;
{$ENDIF}

procedure EnterClassCS;
begin
{$IFDEF ThreadSafe}
  EnterCriticalSection(ClassCritSect);
{$ENDIF}
end;

procedure LeaveClassCS;
begin
{$IFDEF ThreadSafe}
  LeaveCriticalSection(ClassCritSect);
{$ENDIF}
end;


{The following routine was extracted from LockBox and modified}
function HashElf(const Buf;  BufSize : LongInt) : LongInt;
var
  Bytes : TByteArray absolute Buf;
  I, X  : LongInt;
begin
  Result := 0;
  for I := 0 to BufSize - 1 do begin
    Result := (Result shl 4) + Bytes[I];
    X := Result and $F0000000;
    if (X <> 0) then
      Result := Result xor (X shr 24);
    Result := Result and (not X);
  end;
end;

function AnsiELFHashText(const S : string; Size : Integer) : Integer;
begin
  {$IFDEF WStrings}
  Result := AnsiELFHashStr(AnsiUpperCaseShort32(S), Size);
  {$ELSE}
  Result := AnsiELFHashStr(AnsiUpperCase(S), Size);
  {$ENDIF}
end;

function AnsiELFHashStr(const S : string; Size : Integer) : Integer;
begin
  Result := HashElf(S[1], Length(S)) mod Size;
  if Result < 0 then
    Inc(Result, Size);
end;

constructor TStDictNode.CreateStr(const Name : string; AData : Pointer);
begin
  Create(AData);
  {dnNext := nil;}
  {$IFDEF HStrings}
  dnName := Name;
  {$ELSE}
  dnName := StNewStr(Name);
  {$ENDIF}
end;

destructor TStDictNode.Destroy;
begin
  {$IFDEF HStrings}
  dnName := '';
  {$ELSE}
  StDisposeStr(dnName);
  {$ENDIF}
  inherited Destroy;
end;

function TStDictNode.GetName : string;
begin
  {$IFDEF HStrings}
  Result := dnName;
  {$ELSE}
  Result := dnName^;
  {$ENDIF}
end;

function AnsiHashStr(const S : string; Size : Integer) : Integer;
{$IFDEF HStrings}
  {32-bit huge string}
register;
asm
  push ebx
  push esi
  push edi
  mov esi,S
  mov edi,Size
  xor ebx,ebx      {ebx will be hash}
  or esi,esi       {empty literal string comes in as a nil pointer}
  jz @2
  mov edx,[esi-4]  {edx = length}
  or edx,edx       {length zero?}
  jz @2
  xor ecx,ecx      {ecx is shift counter}
@1:xor eax,eax
  mov al,[esi]     {eax = character}
  inc esi
  rol eax,cl       {rotate character}
  xor ebx,eax      {xor with hash}
  inc ecx          {increment shift counter (rol uses only bottom 5 bits)}
  dec edx
  jnz @1
@2:mov eax,ebx
  xor edx,edx
  div edi          {edi = Size}
  mov eax,edx      {return hash mod size}
  pop edi
  pop esi
  pop ebx
end;
{$ENDIF}

{$IFDEF WStrings}
{32-bit short string}
{$IFDEF WIN32} register; {$ENDIF}
asm
  push ebx
  push esi
  push edi
  mov esi,S
  mov edi,Size
  xor ebx,ebx      {ebx will be hash}
  xor edx,edx
  mov dl,[esi]     {edx = length}
  inc esi
  or edx,edx       {length zero?}
  jz @2
  xor ecx,ecx      {ecx is shift counter}
@1:xor eax,eax
  mov al,[esi]     {eax = character}
  inc esi
  rol eax,cl       {rotate character}
  xor ebx,eax      {xor with hash}
  inc ecx          {increment shift counter (rol uses only bottom 5 bits)}
  dec edx
  jnz @1
@2:mov eax,ebx
  xor edx,edx
  div edi          {edi = Size}
  mov eax,edx      {return hash mod size}
  pop edi
  pop esi
  pop ebx
end;
{$ENDIF}

{$IFDEF NStrings}
{16-bit short string}
assembler;
asm
  push ds
  lds si,S
  xor cx,cx
  mov cl,[si]      {cx = length}
  xor bx,bx        {bx will be hash}
  or cx,cx
  jz @2
  inc si
  xor dx,dx        {dx is shift counter}
@1:xor ax,ax
  mov al,[si]      {ax = character}
  inc si
  xchg dx,cx
  rol ax,cl        {rotate character}
  xor bx,ax        {xor with hash}
  xchg dx,cx
  inc dx
  and dx,15
  dec cx
  jnz @1
@2:pop ds
  mov ax,bx
  xor dx,dx
  div Size
  mov ax,dx        {return hash mod size}
end;
{$ENDIF}

function AnsiHashText(const S : string; Size : Integer) : Integer;
begin
{$IFDEF WStrings}
  Result := AnsiHashStr(AnsiUpperCaseShort32(S), Size);
{$ELSE}
  Result := AnsiHashStr(AnsiUpperCase(S), Size);
{$ENDIF}
end;

function FindNodeData(Container : TStContainer;
                      Node : TStNode;
                      OtherData : Pointer) : Boolean; far;
begin
  Result := (OtherData <> Node.Data);
end;

function JoinNode(Container : TStContainer;
                  Node : TStNode;
                  OtherData : Pointer) : Boolean; far;
var
  H : Integer;
  P, T : TStDictNode;
begin
  Result := True;
  with TStDictionary(OtherData) do begin
{$IFDEF HStrings}
    dyFindNode(TStDictNode(Node).dnName, H, P, T);
{$ELSE}
    dyFindNode(TStDictNode(Node).dnName^, H, P, T);
{$ENDIF}
    if Assigned(T) then
      if dyIgnoreDups then begin
        Node.Free;
        Exit;
      end else
        RaiseContainerError(stscDupNode);
    T := dySymbols^[H];
    dySymbols^[H] := TStDictNode(Node);
    dySymbols^[H].dnNext := T;
    Inc(FCount);
  end;
end;

function AssignNode(Container : TStContainer;
                    Node : TStNode;
                    OtherData : Pointer) : Boolean; far;
  var
    DictNode : TStDictNode absolute Node;
    OurDict : TStDictionary absolute OtherData;
  begin
    OurDict.Add(DictNode.Name, DictNode.Data);
    Result := true;
  end;

{----------------------------------------------------------------------}

procedure TStDictionary.Add(const Name : string; Data : Pointer);
var
  H : Integer;
  P, T : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    dyFindNode(Name, H, P, T);
    if Assigned(T) then
      RaiseContainerError(stscDupNode);
    T := dySymbols^[H];
    dySymbols^[H] := TStDictNode.CreateStr(Name, Data);
    dySymbols^[H].dnNext := T;
    Inc(FCount);
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.Assign(Source: TPersistent);
  var
    i : integer;
  begin
    {The only two containers that we allow to be assigned to a string
     dictionary are (1) another string dictionary and (2) a Delphi string
     list (TStrings)}
    if (Source is TStDictionary) then
      begin
        Clear;
        TStDictionary(Source).Iterate(AssignNode, Self);
      end
    else if (Source is TStrings) then
      begin
        Clear;
        for i := 0 to pred(TStrings(Source).Count) do
          Add(TStrings(Source).Strings[i], TStrings(Source).Objects[i]);
      end
    else
      inherited Assign(Source);
  end;

function TStDictionary.BinCount(H : Integer) : LongInt;
var
  C : LongInt;
  T : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    C := 0;
    T := dySymbols^[H];
    while Assigned(T) do begin
      inc(C);
      T := T.dnNext;
    end;
    Result := C;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.Clear;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    if FCount <> 0 then begin
      Iterate(DestroyNode, nil);
      FCount := 0;
      FillChar(dySymbols^, LongInt(FHashSize)*SizeOf(TStDictNode), 0);
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

constructor TStDictionary.Create(AHashSize : Integer);
begin
  CreateContainer(TStDictNode, 0);
  {FHashSize := 0;}
{$IFDEF WStrings}
  FEqual := AnsiCompareTextShort32;
{$ELSE}
  FEqual := AnsiCompareText;
{$ENDIF}
  FHash := AnsiHashText;
  HashSize := AHashSize;
end;

procedure TStDictionary.Delete(const Name : string);
var
  H : Integer;
  P, T : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    dyFindNode(Name, H, P, T);
    if Assigned(T) then begin
      if Assigned(P) then
        P.dnNext := T.dnNext
      else
        dySymbols^[H] := T.dnNext;
      DestroyNode(Self, T, nil);
      Dec(FCount);
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

destructor TStDictionary.Destroy;
begin
  if conNodeProt = 0 then
    Clear;
  if Assigned(dySymbols) then
    FreeMem(dySymbols, LongInt(FHashSize)*SizeOf(TStDictNode));
  IncNodeProtection;
  inherited Destroy;
end;

function TStDictionary.DoEqual(const String1, String2 : string) : Integer;
begin
  Result := 0;
  if Assigned(FOnEqual) then
    FOnEqual(Self, String1, String2, Result)
  else if Assigned(FEqual) then
    Result := FEqual(String1, String2);
end;

procedure TStDictionary.dyFindNode(const Name : string; var H : Integer;
                                   var Prev, This : TStDictNode);
var
  P, T : TStDictNode;
begin
  Prev := nil;
  This := nil;
  H := Hash(Name, HashSize);
  T := dySymbols^[H];
  P := nil;
  while Assigned(T) do begin
{$IFDEF HStrings}
    if DoEqual(Name, T.dnName) = 0 then begin
{$ELSE}
    if DoEqual(Name, T.dnName^) = 0 then begin
{$ENDIF}
      Prev := P;
      This := T;
      Exit;
    end;
    P := T;
    T := T.dnNext;
  end;

  {Not found}
  This := nil;
end;

procedure TStDictionary.dySetEqual(E : TStringCompareFunc);
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    if Count = 0 then
      FEqual := E;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.dySetHash(H : TDictHashFunc);
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    if Count = 0 then
      FHash := H;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.dySetHashSize(Size : Integer);
var
  H, OldSize :  Integer;
  TableSize : LongInt;
  T, N : TStDictNode;
  OldSymbols : PSymbolArray;
  OldDisposeData : TDisposeDataProc;
  OldOnDisposeData : TStDisposeDataEvent;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    TableSize := LongInt(Size)*SizeOf(TStDictNode);
    if (Size <= 0) {or (TableSize > MaxBlockSize)} then
      RaiseContainerError(stscBadSize);

    if Size <> FHashSize then begin
      OldSymbols := dySymbols;
      OldSize := FHashSize;

      {Get a new hash table}
      GetMem(dySymbols, TableSize);
      FillChar(dySymbols^, TableSize, 0);
      FCount := 0;
      FHashSize := Size;

      if OldSize <> 0 then begin
        {Prevent disposing of the user data while transferring elements}
        OldDisposeData := DisposeData;
        DisposeData := nil;
        OldOnDisposeData := OnDisposeData;
        OnDisposeData := nil;
        {Add old symbols into new hash table}
        for H := 0 to OldSize-1 do begin
          T := OldSymbols^[H];
          while Assigned(T) do begin
{$IFDEF HStrings}
            Add(T.dnName, T.Data);
{$ELSE}
            Add(T.dnName^, T.Data);
{$ENDIF}
            N := T.dnNext;
            {free the node just transferred}
            T.Free;
            T := N;
          end;
        end;
        {Dispose of old hash table}
        FreeMem(OldSymbols, OldSize*SizeOf(TStDictNode));
        {Reassign the dispose data routine}
        DisposeData := OldDisposeData;
        OnDisposeData := OldOnDisposeData;
      end;

      {FHashSize := Size;}
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

function TStDictionary.Exists(const Name : string; var Data : Pointer) : Boolean;
var
  H : Integer;
  P, T : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    dyFindNode(Name, H, P, T);
    if Assigned(T) then begin
      if Assigned(P) then begin
        {Move T to front of list}
        P.dnNext := T.dnNext;
        T.dnNext := dySymbols^[H];
        dySymbols^[H] := T;
      end;
      Result := True;
      Data := T.Data;
    end else
      Result := False;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

function TStDictionary.Find(Data : Pointer; var Name : string) : Boolean;
var
  T : TStDictNode;
begin
  Name := '';
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    T := Iterate(FindNodeData, Data);
    if Assigned(T) then begin
      Result := True;
  {$IFDEF HStrings}
      Name := T.dnName;
  {$ELSE}
      Name := T.dnName^;
  {$ENDIF}
    end else
      Result := False;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.GetItems(S : TStrings);
var
  H : Integer;
  T : TStDictNode;
begin
  S.Clear;
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    if FCount <> 0 then begin
      for H := 0 to FHashSize-1 do begin
        T := dySymbols^[H];
        while Assigned(T) do begin
          S.AddObject(T.Name, T.Data);
          T := T.dnNext;
        end;
      end;
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.SetItems(S : TStrings);
var
  I : Integer;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    Clear;
    for I := 0 to S.Count-1 do
      Add(S.Strings[I], S.Objects[I]);
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

function TStDictionary.Iterate(Action : TIterateFunc;
                               OtherData : Pointer) : TStDictNode;
var
  H    : Integer;
  T, N : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    if FCount <> 0 then begin
      for H := 0 to FHashSize-1 do begin
        T := dySymbols^[H];
        while Assigned(T) do begin
          N := T.dnNext;
          if Action(Self, T, OtherData) then
            T := N
          else begin
            Result := T;
            Exit;
          end;
        end;
      end;
    end;
    Result := nil;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.Join(D : TStDictionary; IgnoreDups : Boolean);
begin
{$IFDEF ThreadSafe}
  EnterClassCS;
  EnterCS;
  D.EnterCS;
  try
{$ENDIF}
    dyIgnoreDups := IgnoreDups;
    D.Iterate(JoinNode, Self);

    {Dispose of D, but not its nodes}
    D.IncNodeProtection;
    D.Free;
{$IFDEF ThreadSafe}
  finally
    D.LeaveCS;
    LeaveCS;
    LeaveClassCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.Update(const Name : string; Data : Pointer);
var
  H : Integer;
  P, T : TStDictNode;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    dyFindNode(Name, H, P, T);
    if Assigned(T) then
      T.Data := Data;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.LoadFromStream(S : TStream);
var
  Data : pointer;
  Reader : TReader;
  StreamedClass : TPersistentClass;
  StreamedNodeClass : TPersistentClass;
  StreamedClassName : string;
  StreamedNodeClassName : string;
  St : string;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    Clear;
    Reader := TReader.Create(S, 1024);
    try
      with Reader do
        begin
          StreamedClassName := ReadString;
          StreamedClass := GetClass(StreamedClassName);
          if (StreamedClass = nil) then
            RaiseContainerErrorFmt(stscUnknownClass, [StreamedClassName]);
          if (StreamedClass <> Self.ClassType) then
            RaiseContainerError(stscWrongClass);
          StreamedNodeClassName := ReadString;
          StreamedNodeClass := GetClass(StreamedNodeClassName);
          if (StreamedNodeClass = nil) then
            RaiseContainerErrorFmt(stscUnknownNodeClass, [StreamedNodeClassName]);
          if (StreamedNodeClass <> conNodeClass) then
            RaiseContainerError(stscWrongNodeClass);
          HashSize := ReadInteger;
          ReadListBegin;
          while not EndOfList do
            begin
              St := ReadString;
              Data := DoLoadData(Reader);
              Add(St, Data);
            end;
          ReadListEnd;
        end;
    finally
      Reader.Free;
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

procedure TStDictionary.StoreToStream(S : TStream);
var
  H      : Integer;
  Walker : TStDictNode;
  Writer : TWriter;
begin
{$IFDEF ThreadSafe}
  EnterCS;
  try
{$ENDIF}
    Writer := TWriter.Create(S, 1024);
    try
      with Writer do
        begin
          WriteString(Self.ClassName);
          WriteString(conNodeClass.ClassName);
          WriteInteger(HashSize);
          WriteListBegin;
          if (Count <> 0) then
            for H := 0 to FHashSize-1 do
              begin
                Walker := dySymbols^[H];
                while Assigned(Walker) do
                  begin
                    {$IFDEF HStrings}
                    WriteString(Walker.dnName);
                    {$ELSE}
                    WriteString(Walker.dnName^);
                    {$ENDIF}
                    DoStoreData(Writer, Walker.Data);
                    Walker := Walker.dnNext;
                  end;
              end;
          WriteListEnd;
        end;
    finally
      Writer.Free;
    end;
{$IFDEF ThreadSafe}
  finally
    LeaveCS;
  end;
{$ENDIF}
end;

{$IFDEF ThreadSafe}
initialization
  Windows.InitializeCriticalSection(ClassCritSect);
finalization
  Windows.DeleteCriticalSection(ClassCritSect);
{$ENDIF}
end.