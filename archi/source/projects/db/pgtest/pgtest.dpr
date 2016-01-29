program pgtest;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  l3Base,
  l3Types,
  l3FileUtils,
  l3Interfaces,
  l3CRT,
  l3String,
  l3Nodes,
  l3Tree_TLB,
  l3TreeInterfaces,
  l3Stream,
  Ht_Const,
  Ht_DLL,
  dt_Table,
  dt_dictTree,
  vtDebug,
  ZConnection,
  ZDataset,
  ZDbcCache,
  ZAbstractRODataset,
  ZDbcMySQL,
  ZDbcPostgreSQL,
  DB,
  ZSqlUpdate,
  ZDbcInterbase6,
  ZSqlMonitor,
  ZAbstractDataset,
  ZSequence,
  ZPlainPostgreSqlDriver,
  DBAccess;

const
 cPhaseSample = 'Split : %s';
 cPhasePercentage = '%d/%d';

var
 //lPhaseCnt : byte = 1;
 lPhaseStr : string;

 //lPhaseStr := Format(cPhaseSample, [lPhaseCnt, cPhasePercentage]);

type
 TProgressor = class(Tl3Base)
 private
  lMaxCount : Longint;
  lMsg: String;
 public
  procedure FilesProcessedExProc(aCurrentID : Longint; aMaxID : Longint; aTime : TDateTime);
  procedure ProgressProc(aState: Byte; aValue: Longint; const aMsg: String);
 end;

procedure TProgressor.ProgressProc(aState: Byte; aValue: Longint; const aMsg: String);
begin
 case aState of
  piStart :
   begin
    lMaxCount := aValue;
    lMsg := aMsg;
   end;

  piEnd : begin
           CRT.ReWrite((aMsg + ' done'));
           WriteLN;
          end;
  piCurrent : CRT.ReWrite(lMsg + ' ' + Format(cPhasePercentage, [aValue, lMaxCount]));

 end;
end;


var
gProgressObj : TProgressor = nil;

procedure fn_OnProgressStart(
                 nPindID: SmallInt;(* ����� ��������� ��������-���������� *)
                 dwLimit: Cardinal;(* ���������� ����� ��������� ���������� *)
                 fpName:  PChar    (* ��������� (ASCIIZ) �������� *)
                ); stdcall;

begin
 gProgressObj := TProgressor.Create;
 gProgressObj.ProgressProc(piStart, dwLimit, 'strPas(fpName)');
end;

procedure fn_OnProgress(wDelta: Word(* ��������� ����� ������������ ��������� *)); stdcall;

begin
 gProgressObj.ProgressProc(piStart, wDelta, '');
end;

procedure fn_OnProgressEnd; stdcall;
begin
 gProgressObj.ProgressProc(piEnd, 0, '');
 l3Free(gProgressObj);
end;

procedure fn_OnIOError(fpFileName: PChar;
                       nIoCode:    SmallInt;
                       nDosError:  SmallInt); stdcall;
var
 l_Buff220: array[0..220] of Char;
begin
 htIOMessage(@l_Buff220);
 raise Exception.Create(StrPas(l_Buff220) + StrPas(fpFileName));
end;

procedure fn_OnHtError(nMessID: SmallInt); stdcall;
var
 l_Buff220: array[0..220] of Char;
begin
 // ������������ ������
 if nMessID in [
  72, // "������� ������������� � �����������" (��� ����� �� ������)
  25  // "Unique key doublet value found" - ��������� ��� ��������� ������,
      //   ��� ���� ��������� ��������� �������������, ��� ��� ����� �� ������������
 ] then
  Exit;

 htMessage(nMessID, @l_Buff220);
 raise Exception.Create(StrPas(l_Buff220) + ' ��� ������: ' + IntToStr(nMessID));
end;

procedure TProgressor.FilesProcessedExProc(aCurrentID : Longint; aMaxID : Longint; aTime : TDateTime);
begin
 CRT.ReWrite(Format(lPhaseStr, [aCurrentID, aMaxID]));
end;

var
 STATION_NAME : String = 'util';
 l_DirTemp    : String;
 l_DirLocks   : String;


 lDirName : TFileName;

procedure InitHt;
var
 l_Init :Init;
begin
 l3FillChar(l_Init, SizeOf(l_Init));
 with l_Init do
 begin
  nTableCnt      := 50;
  nTaskCnt       := 20;
  nHtCnt         := 4 + 20 * 6 + 1;
  nLockTimeOut   := 40;
  nPollDelay     := 40;
  nTransTimeOut  := 40;
  nTrsMode       := TRS_HARD;
  fpTmpPath      := PChar(lDirName);//Pointer(-1);//PChar(f_DirTemp);
  fpNetPath      := PChar(lDirName);//Pointer(-1);//PChar(f_DirLocks);
  fpTrtPath      := PChar(lDirName);//Pointer(-1);//PChar(f_DirLocks);
  fpNetName      := PChar(STATION_NAME);
  fpfInfo        := Pointer(-1);
  fpfIoMess      := @fn_OnIOError;
  fpfErrMess     := @fn_OnHtError;

  //fpfPiStart     := @fn_OnProgressStart;
  //fpfPiDraw      := @fn_OnProgress;
  //fpfPiStop      := @fn_OnProgressEnd;
  fpfPiStart     := Pointer(-1);
  fpfPiDraw      := Pointer(-1);
  fpfPiStop      := Pointer(-1);

  fpfYield       := Pointer(-1);
  gHeapCtrl      := 10000000;
  gHeapTask      := 120000;
 end;
 htGlobalInit(HInstance);
 htInit(@l_Init, SizeOf(l_Init));
end;

procedure CloseHt;
begin
 htShut;
 htGlobalShut;
end;

var
 lHTPath : String;

const
 c_TablePass : string = 'corvax';

function GetPass(aTableName : String) : string;
var
 l_Mode: Integer;
 l_Success: Boolean;
 l_TableName: string;
begin
 l_Success := htTableHeadPswd(PChar(aTableName), l_Mode) = 0;
 if l_Mode = 0 then
  Result := ''
 else
  Result := c_TablePass;
end;

var
 s : String;
 gDBConnection : TZConnection;
 //lQuery : TZQuery;

function HTType2SQL(aHTType : Byte; aLen : word) : string;
begin
 Result := '';
 case aHTType of
  ET_CHAR,  (* ������ �������� ������ �� ����� �������� *)
  ET_ARRA : (* ������ ������ �������� ����� *)
   {if aLen > 255 then
    Result := 'Text'
   else}
    Result := 'Text';
  ET_BYTE :   (* ������� - �������� ����� (1 ����) ��� ����� *)
   Result := 'int2';
  ET_INTR,   (* ������� - ����� �� ������ *)
  ET_WORD:   (* ������� - ����� ��� ����� *)
   Result := 'int4';

  ET_DATE :   (* ����    - ����� ��� ����� *)
   Result := 'date';
  ET_NMBR :   (* �����   - 3-� �������� ����� ��� ����� *)
   Result := 'int4';
  ET_LONG :   (* ������� - ������� ����� �� ������ *)
   Result := 'int8'; //8
  ET_DWRD :   (* ������� - ������� ����� ��� ����� *)
   Result := 'int8'; //8
  //ET_FLOA = 9;   (* ������� - single *)
  //ET_CURR =10;   (* ������  - double *)
  //ET_DFLT =11;   (* ������� - double *)
 end;
end;


function HTKey2SQL(aHTKey : Byte) : string;
begin
 case aHTKey of
  EK_NOTKEY: (* ������� �� ����  *)
   Result := '';
  EK_COMMON:  (* ������� ����     *)
   Result := '';
  EK_UNIQUE : (* ���������� ����  *)
   Result := 'UNIQUE';
 end;
end;

function Write2Log(const aStr : String) : String;
 begin
  WriteLN(aStr);
  dbgAppendToLogLN(aStr);
  Result := aStr;
 end;

var
 lBasePrefix : string;

procedure MigrateTable(const aHTTable : String);
var
 l_TableElementList: ThtElementInfoArray;
 l_TableHandle: ThtTblHandle;
 l_ElementCount: Smallint;
 l_Res: Integer;
 l_TableInfo: ThtTableInfoRec;
 lSQLString : String;
 lQuery : TZQuery;
 i : Integer;
 lHTTableOut : String;
 lTableName : String;
 lTable : TdtTable;
 lTimeCounter : Cardinal;
 lIsFirst : boolean;
 lFldName : String;

 function NormFldName(const aTableName : String) : String;
 var
  I : Integer;
 begin
  Result := aTableName;
  if Result = 'Limit' then
   Result := 'Till'
  else
  if Result = 'AbsNum' then
   Result := 'ID'
  else
   if (Result = 'Author') or (Result = 'Auther') or (Result = 'User') then
     Result := 'UserID';
 end;

 function lGetFieldsOfGroup(aElemIdx : word) : string;
 var
  I : Integer;
 begin
  Result := '';
  with lTable, Element[aElemIdx] do
   for I := 0 to Pred(wLength) do
   begin
    Result := Result + NormFldName(ElementName[wOffset + I]);
    if I < Pred(wLength) then
     Result := Result + ','
   end;
 end;

 function NormTblName(const aTableName : String) : String;
 var
  I : Integer;
 begin
  Result := aTableName;
  if Copy(Result, Length(Result) - 2, 3) = '001' then
   SetLength(Result, Length(Result) - 3);
  for I := Length(Result) downto 1 do
   if Result[I] = '#' then
    Delete(Result, I, 1);

  Result := UpperCase(Result);
  Result := lBasePrefix + Result;
 end;

 procedure ExportTreeToFile(const aHTTable : String);
  var
   lStream : Tl3TextStream;
   lTreeStruct : TTreeStrorage;
   lRootNode : Tl3HandleNode;

  function IterHandler_MakeTreeInfo(const CurNode : Il3Node) : Boolean; far;
  begin
   Result := False;
   with CurNode, (CurNode as Il3HandleNode) do
    lStream.WriteLN([Format('%d'#9'%d'#9'%d',[Handle, (Parent as Il3HandleNode).Handle, GetNumInParent(True)])]);
  end;

 begin
  lTreeStruct := TTreeStrorage.Create(ChangeFileExt(aHTTable, ''));
  try
   //lTreeStruct.ChildNodeClass:=fChildNodeClass;
   lRootNode := Tl3UsualNode.Create;
   try
    lTreeStruct.Load(lRootNode);

    lStream := Tl3TextStream.Create(ChangeFileExt(aHTTable, '.tree'), l3_fmCreateReadWrite);
    try
     lRootNode.IterateF(l3L2NA(@IterHandler_MakeTreeInfo), 0);
    finally
     lStream.Free;
    end;
   finally
    l3Free(lRootNode);
   end;
  finally
   l3Free(lTreeStruct);
  end;
 end;

begin
 lSQLString := '';

 Write2Log('Table : ' + aHTTable);

 lHTTableOut := ChangeFileExt(aHTTable, '.txt');

 lTable := TdtTable.CreateWithOpen(ExtractFilePath(aHTTable), GetPass(aHTTable), ExtractOnlyFileName(aHTTable), TAB_SHARE);
 try
  lTableName := NormTblName(lTable.TblName);
  if lTableName = 'CTRL' then
   Exit;
  lQuery := TZQuery.Create(nil);
  try
   lQuery.Connection := gDBConnection;

   lQuery.SQL.Add('DROP TABLE IF EXISTS ' + lTableName +';');
   lQuery.SQL.Add(Write2Log('CREATE TABLE ' + lTableName + ' ('));
   for I := 1 to lTable.fldCount do
   begin
    lFldName := NormFldName(lTable.ElementName[I]);
    lSQLString := lFldName + ' ' + HTType2SQL(lTable.ElementType[I], lTable.FldLength[I]) {+' '+ HTKey2SQL(lTable.ElementKeyKind[I])};
    if I < lTable.fldCount then
     lSQLString := lSQLString +','
    else
     lSQLString := lSQLString +');';

     lQuery.SQL.Add(Write2Log(lSQLString));
   end;

   lTimeCounter := dbgStartTimeCounter;
   try
    lQuery.ExecSQL;
   finally
    Write2Log(dbgFinishTimeCounter(lTimeCounter, 'ExecSQL time : %d ms'));
   end;

   if lTableName <> 'mBB_LOG' then
   begin
    Write2Log('ExportToFile');
    lTimeCounter := dbgStartTimeCounter;
    try
     lTable.ExportToFile(lHTTableOut, #0);
    finally
     Write2Log(dbgFinishTimeCounter(lTimeCounter, 'ExportToFile time : %d ms'));
    end;

    lQuery.SQL.Clear;
    lQuery.ParamCheck := false;
    lQuery.SQL.Add(Write2Log('COPY '+ lTableName + ' FROM ''' +  lHTTableOut + ''''));

    lTimeCounter := dbgStartTimeCounter;
    try
     lQuery.ExecSQL;
    finally
     Write2Log(dbgFinishTimeCounter(lTimeCounter, 'ExecSQL time : %d ms'));
    end;
   end;

   // CREATE INDEX
   lTimeCounter := dbgStartTimeCounter;
   try
    lIsFirst := True;
    lQuery.SQL.Clear;
    for I := 1 to lTable.fldCount do
    begin
     lFldName := NormFldName(lTable.ElementName[I]);
     if lTable.ElementKeyKind[I] = EK_UNIQUE then
     begin
      if lIsFirst then
      begin
       lQuery.SQL.Add(Write2Log(Format('ALTER TABLE %s ADD PRIMARY KEY (%s);',[lTableName, lFldName])));
       lIsFirst := False;
      end
      else
       lQuery.SQL.Add(Write2Log(Format('ALTER TABLE %s ADD UNIQUE (%s);',[lTableName, lFldName])));
     end
     else
      if lTable.ElementKeyKind[I] = EK_COMMON then
       lQuery.SQL.Add(Write2Log(Format('CREATE INDEX %s_%s ON %s (%s);',[lTableName, lFldName, lTableName, lFldName])));
    end;

    for I := (lTable.fldCount + 1) to lTable.ElementsCount do
    begin
     lFldName := NormFldName(lTable.ElementName[I]);
     if (lTable.ElementKeyKind[I] = EK_UNIQUE) and (lTableName <> 'DTB') then
      lQuery.SQL.Add(Write2Log(Format('CREATE UNIQUE INDEX %s_%s ON %s (%s);',[lTableName, lFldName, lTableName, lGetFieldsOfGroup(I)])))
     else
      lQuery.SQL.Add(Write2Log(Format('CREATE INDEX %s_%s ON %s (%s);',[lTableName, lFldName, lTableName, lGetFieldsOfGroup(I)])));
    end;
    if lQuery.SQL.Count > 0 then
     lQuery.ExecSQL;
   finally
    Write2Log(dbgFinishTimeCounter(lTimeCounter, 'Create index time : %d ms'));
   end; // CREATE INDEX

   //���������� ������ � �������
   if (lTableName = 'DT1') or
      (lTableName = 'DT2') or
      (lTableName = 'DT3') or
      (lTableName = 'DT5') or
      (lTableName = 'DT6') or
      (lTableName = 'DT8') or
      (lTableName = 'DTA') or
      (lTableName = 'DtC') or
      (lTableName = 'DtD') or
      (lTableName = 'DtE') or
      (lTableName = 'DTF') or
      (lTableName = 'DTG') or
      (lTableName = 'DtI') or
      (lTableName = 'DTJ') then
    begin
     lTimeCounter := dbgStartTimeCounter;
     try
      ExportTreeToFile(aHTTable);
      lQuery.SQL.Clear;
      lQuery.SQL.Add(Write2Log('DROP TABLE IF EXISTS TREE;'));
      lQuery.SQL.Add(Write2Log('CREATE TEMP TABLE TREE (ID int8, ParentID int8, OrderNum int8);'));
      lQuery.SQL.Add(Write2Log('COPY TREE FROM ''' +  ChangeFileExt(aHTTable, '.tree') + ''';'));
      lQuery.SQL.Add(Write2Log(Format('ALTER TABLE %s ADD COLUMN ParentID int8;',[lTableName])));
      lQuery.SQL.Add(Write2Log(Format('ALTER TABLE %s ADD COLUMN OrderNum int8;',[lTableName])));
      lQuery.SQL.Add(Write2Log(Format('UPDATE %s d SET ParentID = t.ParentID, OrderNum = t.OrderNum FROM TREE t WHERE t.ID = d.ID;',[lTableName])));
      lQuery.SQL.Add(Write2Log(Format('CREATE INDEX %s_order ON %s (ParentID, OrderNum);',[lTableName, lTableName])));
      lTimeCounter := dbgStartTimeCounter;
      try
       lQuery.ExecSQL;
      finally
       Write2Log(dbgFinishTimeCounter(lTimeCounter, 'ExecSQL time : %d ms'));
      end;

     finally
      Write2Log(dbgFinishTimeCounter(lTimeCounter, 'Make tree data time : %d ms'));
     end;
    end; //���������� ������ � �������

  finally
   l3Free(lQuery);
  end;
 finally
  lTable.CloseTbl;
  l3Free(lTable);
 end;
end;

procedure SpeedTest(const aTableName : string);
var
 lQuery : TZQuery;
 lTimeCounter : Cardinal;
 lTimeCounter2 : Cardinal;
 x : Integer;
 I : Integer;
begin
 lQuery := TZQuery.Create(nil);
 try
  lQuery.Connection := gDBConnection;
  lQuery.ReadOnly := True;
  lQuery.SQL.Clear;
  //lQuery.SQL.Add(Write2Log(Format('SELECT * FROM %s ORDER BY ParentID, OrderNum;',[aTableName])));
  lQuery.SQL.Add(Write2Log(Format('SELECT * FROM %s ORDER BY absnum;',[aTableName])));
  //lQuery.SQL.Add(Write2Log('SELECT * FROM file f offset 1500000 limit 100;'));
  //lQuery.SQL.Add(Write2Log('SELECT * FROM file'));
  lTimeCounter := dbgStartTimeCounter;
  try
   lTimeCounter2 := dbgStartTimeCounter;
   lQuery.Open;
   Write2Log(dbgFinishTimeCounter(lTimeCounter2, 'Open time : %d ms'));
   lTimeCounter2 := dbgStartTimeCounter;
   try
    {with lQuery.Resultset do
    for I := 1 to RowCount do
    begin
     //X := lQuery.FieldByName('absnum').AsInteger;
     x := GetLongByName('absnum');
     Next;
    end;}
    Write2Log(dbgFinishTimeCounter(lTimeCounter2, 'Fetch time : %d ms'));
   finally
    lTimeCounter2 := dbgStartTimeCounter;
    lQuery.Close;
    Write2Log(dbgFinishTimeCounter(lTimeCounter2, 'Open time : %d ms'));
   end;
  finally
   //Write2Log(dbgFinishTimeCounter(lTimeCounter, 'Make tree data time : %d ms'));
  end;
 finally
  l3Free(lQuery);
 end;
end;

function FileProcessingFunc(const aFileName: string; aData: Pointer): Boolean;
begin
 Result := True;
 try
  MigrateTable(aFileName);
 except
  on E : Exception  do
   Write2Log('!!Exception:'+ l3ANSI2OEM(E.Message));
 end;
end;



procedure DoLowAcceess;

var
  lTotalTimeCounter : Cardinal;
  lSQLResult : PZPostgreSQLResult;
  lPQDriver : TZPostgreSQL8PlainDriver;
  lPQConnect : PZPostgreSQLConnect;
  lCnt : integer;
  lRes : integer;
  lVal : PChar;
  lStatus : TZPostgreSQLExecStatusType;

  lConnect : IdbaConnect;
  lQryResult : IdbaQueryResult;
  lRowCount : Cardinal;
  lCurID : Cardinal;
  lPrevID : Cardinal;
  I : Cardinal;

  lParentID_fld : Cardinal;
  lOrderNum_fld : Cardinal;


 procedure AddChildren(aParentNode : Il3Node);
 begin
 
 end;

begin
  lCnt := 0;
  lConnect := TdbaConnect.Make('host=localhost port=5432 dbname=archivarius user=postgres password=sysadm');
  with lConnect.GetQueryResult(Format('SELECT * FROM %s ORDER BY ParentID, OrderNum;',['dt5'{aTableName}])) do
  begin
   lParentID_fld := FieldNumByName('ParentID');
   //lOrderNum_fld := FieldNumberByName('OrderNum');

   lStatus := Status;
   //lVal := GetValue(0, 0);
   lRowCount := RowCount;

   lPrevID := High(lPrevID);
   for I := 0 to pred(lRowCount) do
   begin
    lCurID := GetValueAsInt(lParentID_fld, I);
    if lPrevID <> lCurID then
    begin
     lPrevID := lCurID;
     //lParentIDIndex.Add(lCurID, I);
    end;
   end;

   for I := 0 to pred(lRowCount) do
   begin
    lCurID := GetValueAsInt(lParentID_fld, I);
    if lPrevID <> lCurID then
    begin
     lPrevID := lCurID;
     //Add(lCurID, I);
    end;
   end;

  end;

  {
  with lPQDriver do
  begin
   Initialize;  //TZPostgreSQL8PlainDriver
   lPQConnect := ConnectDatabase('host=localhost port=5432 dbname=archivarius user=postgres password=sysadm');

   //lSQLResult := ExecuteQuery(lPQConnect, 'SELECT * FROM file ORDER BY absnum;');
   lSQLResult := ExecuteQuery(lPQConnect, 'begin');
   lTotalTimeCounter := dbgStartTimeCounter;
   //lSQLResult := ExecuteQuery(lPQConnect, 'begin; DECLARE curs CURSOR FOR select * from file; MOVE FORWARD ALL IN curs; commit;');
   lSQLResult := ExecuteQuery(lPQConnect, 'SELECT Count(*) FROM file');
   lStatus := GetResultStatus(lSQLResult);
   lVal := GetValue(lSQLResult, 0, 0);
   Write2Log(dbgFinishTimeCounter(lTotalTimeCounter, format('Count = %s; Query time : %%d ms', [lVal])));
   Clear(lSQLResult);

   lTotalTimeCounter := dbgStartTimeCounter;
   if SendQuery(lPQConnect, 'SELECT * FROM file' (* ORDER BY absnum;'*)) <> 0 then
   begin
    Write2Log(dbgFinishTimeCounter(lTotalTimeCounter, 'Query time : %d ms'));
    lTotalTimeCounter := dbgStartTimeCounter;
    lRes := SetSingleRowMode(lPQConnect);
    repeat
     lSQLResult := GetResult(lPQConnect);
     if lSQLResult = nil then
      break;

     inc(lCnt); //, GetRowCount(lSQLResult));
     //Clear(lSQLResult);
    until false;
    Write2Log(dbgFinishTimeCounter(lTotalTimeCounter, 'Fetch time : %d ms'));
   end;
   lSQLResult := ExecuteQuery(lPQConnect, 'commit');
  end;
}
end;

procedure TestProc;
var
 lRec : IdbaRecord;

begin
 with GConnect.MakeRecord('t4') do
 begin
  AddField('docid', 48);
  AddField('comment', 'archivarius');
  try
   DBInsert;
  except
   lRec := GConnect.MakeRecord('t4');
   lRec.AddField('docid', '(docid + 1)');

   lRec.DBUpdate(GenDBUpdateParamStr);
  end;
 end;

end;

var
  lTotalTimeCounter : Cardinal;
begin
 try
 //DoLowAcceess;
 //TestProc;

   gDBConnection := TZConnection.Create(nil);
   try
    with gDBConnection do
    begin
     Protocol := 'postgresql';
     HostName := 'localhost';//'cooker3';
     Database := 'archivarius';
     User := 'postgres';
     Password := 'sysadm';
     Connect;
     if Connected then Write2Log(Format('Connected, port : %d', [Port]));
    end;

   SpeedTest('file');

   finally
    gDBConnection.Disconnect;
    l3Free(gDBConnection);
   end;


 //Write2Log(dbgFinishTimeCounter(lTotalTimeCounter, 'Total time : %d ms'));

 finally
  Write2Log('All done. Press <Enter>');
  ReadLN(s);
 end;
end.


