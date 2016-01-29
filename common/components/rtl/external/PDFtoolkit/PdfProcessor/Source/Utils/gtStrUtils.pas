
unit gtStrUtils;

interface

uses
  SysUtils;

{ AnsiResemblesText returns true if the two strings are similar (using a
  Soundex algorithm or something similar) }

function AnsiResemblesText(const AText, AOther: Ansistring): Boolean;

{ AnsiContainsText returns true if the subtext is found, without
  case-sensitivity, in the given text }

function AnsiContainsText(const AText, ASubText: Ansistring): Boolean;

{ AnsiStartsText & AnsiEndText return true if the leading or trailing part
  of the given text matches, without case-sensitivity, the subtext }

function AnsiStartsText(const ASubText, AText: Ansistring): Boolean;
function AnsiEndsText(const ASubText, AText: Ansistring): Boolean;

{ AnsiReplaceText will replace all occurrences of a substring, without
  case-sensitivity, with another substring (recursion substring replacement
  is not supported) }

function AnsiReplaceText(const AText, AFromText, AToText: Ansistring): Ansistring;

{ AnsiMatchText & AnsiIndexText provide case like function for dealing with
  strings }

function AnsiMatchText(const AText: Ansistring;
  const AValues: array of Ansistring): Boolean;
function AnsiIndexText(const AText: Ansistring;
  const AValues: array of Ansistring): Integer;

{ These function are similar to some of the above but are case-sensitive }

function AnsiContainsStr(const AText, ASubText: Ansistring): Boolean;
function AnsiStartsStr(const ASubText, AText: Ansistring): Boolean;
function AnsiEndsStr(const ASubText, AText: Ansistring): Boolean;
function AnsiReplaceStr(const AText, AFromText, AToText: Ansistring): Ansistring;
function AnsiMatchStr(const AText: Ansistring;
  const AValues: array of Ansistring): Boolean;
function AnsiIndexStr(const AText: Ansistring;
  const AValues: array of Ansistring): Integer;

{ DupeString will return N copies of the given Ansistring }

function DupeString(const AText: Ansistring; ACount: Integer): Ansistring;

{ ReverseString simply reverses the given Ansistring }

function ReverseString(const AText: Ansistring): Ansistring;

{ StuffString replaces a segment of a Ansistring with another one }

function StuffString(const AText: Ansistring; AStart, ALength: Cardinal;
  const ASubText: Ansistring): Ansistring;

{ RandomFrom will randomly return one of the given strings }

function RandomFrom(const AValues: array of Ansistring): Ansistring; overload;

{ IfThen will return the true Ansistring if the value passed in is true, else
  it will return the false Ansistring }

function IfThen(AValue: Boolean; const ATrue: Ansistring;
  AFalse: Ansistring = ''): Ansistring; overload;

{ Basic-like functions }

function LeftStr(const AText: Ansistring; const ACount: Integer): Ansistring;
function RightStr(const AText: Ansistring; const ACount: Integer): Ansistring;
function MidStr(const AText: Ansistring; const AStart, ACount: Integer): Ansistring;

function AnsiLeftStr(const AText: AnsiString; const ACount: Integer): AnsiString;
function AnsiSameText(const S1, S2: string): Boolean; 

const
  { Default word delimiters are any character except the core alphanumerics. }
  WordDelimiters: set of AnsiChar = [#0..#255] - ['a'..'z','A'..'Z','1'..'9','0'];

type
  TStringSeachOption = (soDown, soMatchCase, soWholeWord);
  TStringSearchOptions = set of TStringSeachOption;

{ SearchBuf is a search routine for arbitrary text buffers.  If a match is
  found, the function returns a pointer to the start of the matching
  Ansistring in the buffer.  If no match, the function returns nil.  Specify
  soDown to search forward otherwise the search is performs
  backwards through the text.  Use SelStart and SelLength skip "selected"
  text thus the search will start before or after (soDown) the specified text. }

function SearchBuf(Buf: PAnsiChar; BufLen: Integer; SelStart, SelLength: Integer;
  SearchString: Ansistring; Options: TStringSearchOptions = [soDown]): PAnsiChar;

{ Soundex function returns the Soundex code for the given Ansistring.  Unlike
  the original Soundex routine this function can return codes of varying
  lengths.  This function is loosely based on SoundBts which was written
  by John Midwinter.  For more information about Soundex see:

    http://www.nara.gov/genealogy/coding.html

  The general theory behind this function was originally patented way back in
  1918 (US1261167 & US1435663) but are now in the public domain.

  NOTE: This function does not attempt to deal with 'names with prefixes'
        issue.
  }

type
  TSoundexLength = 1..MaxInt;

function Soundex(const AText: Ansistring; ALength: TSoundexLength = 4): Ansistring;

{ SoundexInt uses Soundex but returns the resulting Soundex code encoded
  into an integer.  However, due to limits on the size of an integer, this
  function is limited to Soundex codes of eight characters or less.

  DecodeSoundexInt is designed to decode the results of SoundexInt back to
  a normal Soundex code.  Length is not required since it was encoded into
  the results of SoundexInt. }

type
  TSoundexIntLength = 1..8;

function SoundexInt(const AText: Ansistring; ALength: TSoundexIntLength = 4): Integer;
function DecodeSoundexInt(AValue: Integer): Ansistring;

{ SoundexWord is a special case version of SoundexInt that returns the
  Soundex code encoded into a word.  However, due to limits on the size of a
  word, this function uses a four character Soundex code.

  DecodeSoundexWord is designed to decode the results of SoundexWord back to
  a normal Soundex code. }

function SoundexWord(const AText: Ansistring): Word;
function DecodeSoundexWord(AValue: Word): Ansistring;

{ SoundexSimilar and SoundexCompare are simple comparison functions that use
  the Soundex encoding function. }

function SoundexSimilar(const AText, AOther: Ansistring;
  ALength: TSoundexLength = 4): Boolean;
function SoundexCompare(const AText, AOther: Ansistring;
  ALength: TSoundexLength = 4): Integer;

{ Default entry point for AnsiResemblesText }

function SoundexProc(const AText, AOther: Ansistring): Boolean;

type
  TCompareTextProc = function(const AText, AOther: Ansistring): Boolean;

{ If the default behavior of AnsiResemblesText (using Soundex) is not suitable
  for your situation, you can redirect it to a function of your own choosing }

var
  AnsiResemblesProc: TCompareTextProc = SoundexProc;

implementation

{$IFDEF MSWINDOWS}
uses
  Windows;
{$ENDIF}
{$IFDEF LINUX}
uses
  Libc;
{$ENDIF}

function AnsiResemblesText(const AText, AOther: Ansistring): Boolean;
begin
  Result := False;
  if Assigned(AnsiResemblesProc) then
    Result := AnsiResemblesProc(AText, AOther);
end;

function AnsiContainsText(const AText, ASubText: Ansistring): Boolean;
begin
  Result := AnsiPos(AnsiUppercase(ASubText), AnsiUppercase(AText)) > 0;
end;

function AnsiStartsText(const ASubText, AText: Ansistring): Boolean;
var
{$IFDEF MSWINDOWS}
  P: PAnsiChar;
{$ENDIF}
  L, L2: Integer;
begin
{$IFDEF MSWINDOWS}
  P := PAnsiChar(AText);
{$ENDIF}
  L := Length(ASubText);
  L2 := Length(AText);
  if L > L2 then
    Result := False
  else
{$IFDEF MSWINDOWS}
    Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE,
      P, L, PAnsiChar(ASubText), L) = 2;
{$ENDIF}
{$IFDEF LINUX}
    Result := WideSameText(ASubText, Copy(AText, 1, L));
{$ENDIF}
end;

function AnsiEndsText(const ASubText, AText: Ansistring): Boolean;
var
  SubTextLocation: Integer;
begin
  SubTextLocation := Length(AText) - Length(ASubText) + 1;
  Result := SubTextLocation <= 0;
  if not Result and (ASubText <> '') and
    (ByteType(AText, SubTextLocation) <> mbTrailByte) then
  begin
    Result := AnsiStrIComp(Pointer(ASubText), Pointer(@AText[SubTextLocation])) = 0;
  end;
end;

function AnsiReplaceStr(const AText, AFromText, AToText: Ansistring): Ansistring;
begin
  Result := StringReplace(AText, AFromText, AToText, [rfReplaceAll]);
end;

function AnsiReplaceText(const AText, AFromText, AToText: Ansistring): Ansistring;
begin
  Result := StringReplace(AText, AFromText, AToText, [rfReplaceAll, rfIgnoreCase]);
end;

function AnsiMatchText(const AText: Ansistring;
  const AValues: array of Ansistring): Boolean;
begin
  Result := AnsiIndexText(AText, AValues) <> -1;
end;

function AnsiIndexText(const AText: Ansistring;
  const AValues: array of Ansistring): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(AValues) to High(AValues) do
    if AnsiSameText(AText, AValues[I]) then
    begin
      Result := I;
      Break;
    end;
end;

function AnsiContainsStr(const AText, ASubText: Ansistring): Boolean;
begin
  Result := AnsiPos(ASubText, AText) > 0;
end;

function AnsiStartsStr(const ASubText, AText: Ansistring): Boolean;
begin
  Result := AnsiSameStr(ASubText, Copy(AText, 1, Length(ASubText)));
end;

function AnsiEndsStr(const ASubText, AText: Ansistring): Boolean;
var
  L : Integer;
begin
  Result := False;
  if ASubText = '' then exit;
  L := Length(AText) - Length(ASubText) + 1;
  if ByteType(AText, L) = mbTrailByte then exit;

  Result := AnsiSameStr(ASubText,
                        Copy(AText, L, Length(ASubText)));
end;

function AnsiMatchStr(const AText: Ansistring;
  const AValues: array of Ansistring): Boolean;
begin
  Result := AnsiIndexStr(AText, AValues) <> -1;
end;

function AnsiIndexStr(const AText: Ansistring;
  const AValues: array of Ansistring): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(AValues) to High(AValues) do
    if AnsiSameStr(AText, AValues[I]) then
    begin
      Result := I;
      Break;
    end;
end;

function DupeString(const AText: Ansistring; ACount: Integer): Ansistring;
var
  P: PAnsiChar;
  C: Integer;
begin
  C := Length(AText);
  SetLength(Result, C * ACount);
  P := Pointer(Result);
  if P = nil then Exit;
  while ACount > 0 do
  begin
    Move(Pointer(AText)^, P^, C);
    Inc(P, C);
    Dec(ACount);
  end;
end;

function ReverseString(const AText: Ansistring): Ansistring;
var
  I: Integer;
  P: PAnsiChar;
begin
  SetLength(Result, Length(AText));
  P := PAnsiChar(Result);
  for I := Length(AText) downto 1 do
  begin
    P^ := AText[I];
    Inc(P);
  end;
end;

function StuffString(const AText: Ansistring; AStart, ALength: Cardinal;
  const ASubText: Ansistring): Ansistring;
begin
  Result := Copy(AText, 1, AStart - 1) +
            ASubText +
            Copy(AText, AStart + ALength, MaxInt);
end;

function RandomFrom(const AValues: array of Ansistring): Ansistring;
begin
  Result := AValues[Random(High(AValues) + 1)];
end;

function IfThen(AValue: Boolean; const ATrue: Ansistring;
  AFalse: Ansistring = ''): Ansistring;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function LeftStr(const AText: Ansistring; const ACount: Integer): Ansistring;
begin
  Result := Copy(AText, 1, ACount);
end;

function RightStr(const AText: Ansistring; const ACount: Integer): Ansistring;
begin
  Result := Copy(AText, Length(AText) + 1 - ACount, ACount);
end;

function MidStr(const AText: Ansistring; const AStart, ACount: Integer): Ansistring;
begin
  Result := Copy(AText, AStart, ACount);
end;

function SearchBuf(Buf: PAnsiChar; BufLen: Integer; SelStart, SelLength: Integer;
  SearchString: Ansistring; Options: TStringSearchOptions): PAnsiChar;
var
  SearchCount, I: Integer;
  C: AnsiChar;
  Direction: Shortint;
  ShadowMap: array[0..256] of AnsiChar;
  CharMap: array [AnsiChar] of AnsiChar absolute ShadowMap;

  function FindNextWordStart(var BufPtr: PAnsiChar): Boolean;
  begin                   { (True XOR N) is equivalent to (not N) }
                          { (False XOR N) is equivalent to (N)    }
     { When Direction is forward (1), skip non delimiters, then skip delimiters. }
     { When Direction is backward (-1), skip delims, then skip non delims }
    while (SearchCount > 0) and
          ((Direction = 1) xor (BufPtr^ in WordDelimiters)) do
    begin
      Inc(BufPtr, Direction);
      Dec(SearchCount);
    end;
    while (SearchCount > 0) and
          ((Direction = -1) xor (BufPtr^ in WordDelimiters)) do
    begin
      Inc(BufPtr, Direction);
      Dec(SearchCount);
    end;
    Result := SearchCount > 0;
    if Direction = -1 then
    begin   { back up one AnsiChar, to leave ptr on first non delim }
      Dec(BufPtr, Direction);
      Inc(SearchCount);
    end;
  end;

begin
  Result := nil;
  if BufLen <= 0 then Exit;
  if soDown in Options then
  begin
    Direction := 1;
    Inc(SelStart, SelLength);  { start search past end of selection }
    SearchCount := BufLen - SelStart - Length(SearchString) + 1;
    if SearchCount < 0 then Exit;
    if Longint(SelStart) + SearchCount > BufLen then Exit;
  end
  else
  begin
    Direction := -1;
    Dec(SelStart, Length(SearchString));
    SearchCount := SelStart + 1;
  end;
  if (SelStart < 0) or (SelStart > BufLen) then Exit;
  Result := @Buf[SelStart];

  { Using a AnsiChar map array is faster than calling AnsiUpper on every character }
  for C := Low(CharMap) to High(CharMap) do
    CharMap[C] := C;
  { Since CharMap is overlayed onto the ShadowMap and ShadowMap is 1 byte longer,
    we can use that extra byte as a guard NULL }
  ShadowMap[256] := #0;

  if not (soMatchCase in Options) then
  begin
{$IFDEF MSWINDOWS}
    AnsiUpperBuff(PAnsiChar(@CharMap), sizeof(CharMap));
    AnsiUpperBuff(@SearchString[1], Length(SearchString));
{$ENDIF}
{$IFDEF LINUX}
    AnsiStrUpper(@CharMap[#1]);
    SearchString := AnsiUpperCase(SearchString);
{$ENDIF}
  end;

  while SearchCount > 0 do
  begin
    if (soWholeWord in Options) and (Result <> @Buf[SelStart]) then
      if not FindNextWordStart(Result) then Break;
    I := 0;
    while (CharMap[Result[I]] = SearchString[I+1]) do
    begin
      Inc(I);
      if I >= Length(SearchString) then
      begin
        if (not (soWholeWord in Options)) or
           (SearchCount = 0) or
           (Result[I] in WordDelimiters) then
          Exit;
        Break;
      end;
    end;
    Inc(Result, Direction);
    Dec(SearchCount);
  end;
  Result := nil;
end;

{ This function is loosely based on SoundBts which was written by John Midwinter }
function Soundex(const AText: Ansistring; ALength: TSoundexLength): Ansistring;
const

  // This table gives the Soundex score for all characters upper- and lower-
  // case hence no need to convert.  This is faster than doing an UpCase on the
  // whole input Ansistring.  The 5 non characters in middle are just given 0.
  CSoundexTable: array[65..122] of ShortInt =
  // A  B  C  D  E  F  G  H   I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W   X  Y  Z
    (0, 1, 2, 3, 0, 1, 2, -1, 0, 2, 2, 4, 5, 5, 0, 1, 2, 6, 2, 3, 0, 1, -1, 2, 0, 2,
  // [  /  ]  ^  _  '
     0, 0, 0, 0, 0, 0,
  // a  b  c  d  e  f  g  h   i  j  k  l  m  n  o  p  q  r  s  t  u  v  w   x  y  z
     0, 1, 2, 3, 0, 1, 2, -1, 0, 2, 2, 4, 5, 5, 0, 1, 2, 6, 2, 3, 0, 1, -1, 2, 0, 2);

  function Score(AChar: Integer): Integer;
  begin
    Result := 0;
    if (AChar >= Low(CSoundexTable)) and (AChar <= High(CSoundexTable)) then
      Result := CSoundexTable[AChar];
  end;

var
  I, LScore, LPrevScore: Integer;
begin
  Result := '';
  if AText <> '' then
  begin
    Result := Upcase(AText[1]);
    LPrevScore := Score(Ord(AText[1]));
    for I := 2 to Length(AText) do
    begin
      LScore := Score(Ord(AText[I]));
      if (LScore > 0) and (LScore <> LPrevScore) then
      begin
        Result := Result + IntToStr(LScore);
        if Length(Result) = ALength then
          Break;
      end;
      if LScore <> -1 then
        LPrevScore := LScore;
    end;
    if Length(Result) < ALength then
      Result := Copy(Result + DupeString('0', ALength), 1, ALength);
  end;
end;

function SoundexInt(const AText: Ansistring; ALength: TSoundexIntLength): Integer;
var
  LResult: Ansistring;
  I: Integer;
begin
  LResult := Soundex(AText, ALength);
  Result := Ord(LResult[1]) - Ord('A');
  if ALength > 1 then
  begin
    Result := Result * 26 + StrToInt(LResult[2]);
    for I := 3 to ALength do
      Result := Result * 7 + StrToInt(LResult[I]);
  end;
  Result := Result * 9 + ALength;
end;

function DecodeSoundexInt(AValue: Integer): Ansistring;
var
  I, LLength: Integer;
begin
  Result := '';
  LLength := AValue mod 9;
  AValue := AValue div 9;
  for I := LLength downto 3 do
  begin
    Result := IntToStr(AValue mod 7) + Result;
    AValue := AValue div 7;
  end;
  if LLength > 2 then
    Result := IntToStr(AValue mod 26) + Result;
  AValue := AValue div 26;
  Result := AnsiChar(AValue + Ord('A')) + Result;
end;

function SoundexWord(const AText: Ansistring): Word;
var
  LResult: Ansistring;
begin
  LResult := Soundex(AText, 4);
  Result := Ord(LResult[1]) - Ord('A');
  Result := Result * 26 + StrToInt(LResult[2]);
  Result := Result * 7 + StrToInt(LResult[3]);
  Result := Result * 7 + StrToInt(LResult[4]);
end;

function DecodeSoundexWord(AValue: Word): Ansistring;
begin
  Result := IntToStr(AValue mod 7) + Result;
  AValue := AValue div 7;
  Result := IntToStr(AValue mod 7) + Result;
  AValue := AValue div 7;
  Result := IntToStr(AValue mod 26) + Result;
  AValue := AValue div 26;
  Result := AnsiChar(AValue + Ord('A')) + Result;
end;

function SoundexSimilar(const AText, AOther: Ansistring; ALength: TSoundexLength): Boolean;
begin
  Result := Soundex(AText, ALength) = Soundex(AOther, ALength);
end;

function SoundexCompare(const AText, AOther: Ansistring; ALength: TSoundexLength): Integer;
begin
  Result := AnsiCompareStr(Soundex(AText, ALength), Soundex(AOther, ALength));
end;

function SoundexProc(const AText, AOther: Ansistring): Boolean;
begin
  Result := SoundexSimilar(AText, AOther);
end;

function AnsiLeftStr(const AText: AnsiString; const ACount: Integer): AnsiString;
begin
  Result := Copy(WideString(AText), 1, ACount);
end;

function AnsiSameText(const S1, S2: string): Boolean;
begin
  Result := AnsiCompareText(S1, S2) = 0;
end;

end.
