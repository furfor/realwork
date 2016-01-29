unit Main;

{ $Id: Main.pas,v 1.14 2015/04/10 08:27:14 lukyanets Exp $ }

// $Log: Main.pas,v $
// Revision 1.14  2015/04/10 08:27:14  lukyanets
// ������� ��������
//
// Revision 1.13  2015/04/08 08:34:18  lukyanets
// ��������� �������
//
// Revision 1.12  2015/04/07 13:57:34  lukyanets
// ��������� �������
//
// Revision 1.11  2015/03/26 06:46:39  lukyanets
// �������� ���������
//
// Revision 1.10  2014/10/08 13:07:34  lukyanets
// ��������� ��������� � ���������� �����
//
// Revision 1.9  2012/01/11 10:40:41  narry
// ������� � ��������� ����� ���������
//
// Revision 1.8  2012/01/04 11:34:36  narry
// ������� ���������� ������ ���������� (325261072)
//

interface

uses
  Windows, ActiveX, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcBase, l3Types,  W95Meter, ExtCtrls, Buttons,
  vtSpin, l3InterfacedComponent, m3DBInterfaces, Mask, ToolEdit,
  afwControlPrim, afwBaseControl, afwControl, XPMan, ComCtrls, daInterfaces,
  daTypes,
  l3LongintList, {m3StorageElementIDList,} ddChangedByExtractor,
  m3StorageInterfaces, DT_Sab, DT_Types, SewerPipe, l3Stream;

type
  TMainForm = class(TForm, IdaLongProcessSubscriber)
    btWork: TButton;
    btStop: TButton;
    pnStatus: TPanel;
    lbPercent: TLabel;
    Progress: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edBaseDir: TDirectoryEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    comboWhat: TComboBox;
    lblTopicListFN: TLabel;
    edTopicListFN: TFilenameEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btWorkClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure comboWhatChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    f_ChangedNumbers: Tl3NamedTextStream;
    { Private declarations }
    f_DB        : Im3DB;
    f_Stopped   : Bool;
    f_InProcess : Bool;
    f_NeedClose : Bool;
    f_Start: TDateTime;
    f_Topics: Tl3LongintList;
    function  pm_GetBaseDir: String;
    procedure pm_SetBaseDir(const aValue: String);
    procedure DoWork;
    procedure TotalProgress(aState     : Byte; aValue     : Long; const aMsg : String = '');
      {-}
    procedure StopWork;
      {-}
  protected
    // IdaLongProcessSubscriber
    function DoLongProcessNotify(aState: TdaProcessState): Boolean;

    function AllDocsList: Im3DBRange;
    procedure DocumentStatus(DocID: Integer; DocStatus: TddDocStatus);
    function ListDocsList(const aFileName: String): Im3DBRange;
    function Sab2Range(aSab: ISab): Im3DBRange;
    procedure Yield(Sender: TObject);
  public
    function GetAppFolderFileName(const aFileName: String; aUnique: Boolean =
        False): String;
    { Public declarations }
    property BaseDir: String
      read pm_GetBaseDir
      write pm_SetBaseDir;
      {-}
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  l3InternalInterfaces,
  l3Base,
  l3Filer,
  l3FileUtils,
  l3Parser,
  l3Memory,

  k2Types,
  k2Tags,
  k2TagGen,
  k2StackGenerator,

  m3DB,
  m3DBActions,

  evdReader,
  evdWriter,
  evEvdRd,

  evInfoFilter, ddUtils, L3Math, StrUtils,
  daDataProvider,
  ddHTInit, DT_Const,
  DT_LinkServ, dt_ListUtils, 
  l3LongintListPrim, DT_Doc,
  m3Interfaces,
  m3StorageElementIDList;



function TMainForm.AllDocsList: Im3DBRange;
var
 l_Sab: ISab;
begin
 l_Sab:= MakeAllRecords(DocumentServer(CurrentFamily).FileTbl);
 l_Sab.ValuesOfKey(fID_fld);
 Result:= Sab2Range(l_Sab);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 FreeAndNil(f_Topics);
 SaveSettings(Self);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 LoadSettings(Self);
 f_Topics := Tl3LongintList.Create();
 comboWhatChange(Self);
end;

procedure TMainForm.btWorkClick(Sender: TObject);
var
 l_Total : TDateTime;

begin
 f_Stopped := false;
 f_InProcess := true;
 btWork.Enabled := false;
 btStop.Enabled := true;
 Progress.Visible:= True;
 try
  l_Total := 0;
  try
   if InitBaseEngine(BaseDir, editLogin.Text, editPassword.Text) then
   try
    GlobalDataProvider.SubscribeLongProcess(Self);
    try
     l3System.Msg2Log('������ ���������');
     DoWork;
     if f_Stopped then
      l3System.Msg2Log('��������� �������� �������������')
     else
      l3System.Msg2Log('��������� ���������');
    finally
     GlobalDataProvider.UnSubscribeLongProcess(Self);
    end;
   finally
    DoneClientBaseEngine;
   end;
  finally
   f_InProcess := false;
  end;//try..finally
 finally
  btWork.Enabled := true;
  btStop.Enabled := false;
  Progress.Visible:= False;
 end;//try..finally
 pnStatus.Caption:= '';
 lbPercent.Caption:= '';
 if f_NeedClose then Close;
end;

procedure TMainForm.btStopClick(Sender: TObject);
begin
 f_Stopped := true;
 StopWork;
end;

procedure TMainForm.comboWhatChange(Sender: TObject);
begin
 edTopicListFN.Visible  := comboWhat.ItemIndex = 1;
 lblTopicListFN.Visible := edTopicListFN.Visible;
end;

function TMainForm.pm_GetBaseDir: String;
  {-}
begin
 Result := edBaseDir.Text;
end;

procedure TMainForm.pm_SetBaseDir(const aValue: String);
begin
 edBaseDir.Text := aValue;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if f_InProcess then begin
  if (MessageDlg('�� ������ �������� ���������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
   f_NeedClose := true;
   f_Stopped := true;
   StopWork;
  end;
  CanClose := false;
 end;//f_InProcess
end;

procedure TMainForm.DocumentStatus(DocID: Integer; DocStatus: TddDocStatus);
var
 l_S: ShortString;
 l_ID: TDocID;
begin
 l_ID:= LinkServer(CurrentFamily).Renum.GetExtDocID(DocID);
 case DocStatus of
  dd_dsChanged:
   begin
    l_S:= '���������';
    f_ChangedNumbers.PutInteger(l_ID);
    f_ChangedNumbers.PutEndOfLine;
   end;
  dd_dsAbsent: l_S:= '���������� �� ���������� �� �������';
  dd_dsNotFinished: l_S:= '�� ���������';
  dd_dsIDAbsent: l_S:= '��� ID ���������';
 end;
 l3System.Msg2Log('%10d: %s', [l_ID, l_S]);
end;

procedure TMainForm.DoWork;
var
 l_Filter : Tk2TagGenerator;
 l_Range  : Im3DBRange;
 l_D      : TDiapasonRec;
begin//DoWork
 f_ChangedNumbers:= Tl3NamedTextStream.Create(GetAppFolderFileName('ChangedTopics.txt'), l3_fmWrite);
 try
  f_DB := Tm3DB.Make(ConcatDirName(g_BaseEngine.DataParams.DocStoragePath, 'garant\bserv001'),
                     Yield,
                     nil,
                     TotalProgress);
  try
   l_Filter:= nil;
   try
    TddChangedByFilter.SetTo(l_Filter);
    TddChangedByFilter(l_Filter).OnDocumentStatus:= DocumentStatus;
    pnStatus.Caption := '����������� ����������...';
    if comboWhat.ItemIndex = 0 then
     l_Range := AllDocsList
    else
     l_Range := ListDocsList(edTopicListFN.Text);
    if l_Range <> nil then
    try
     l_Range.Iterate(l_Filter, True, [m3_dsMain]);
     MessageDlg('����������� ���������', mtInformation, [mbOK], 0);
    except
     on E: Exception do
     begin
      l3System.Exception2Log(E);
      MessageDlg(Format('�� ����� ����������� ��������� ������ "%s".'#10'����������� � ���-�����', [E.Message]), mtError, [mbOK], 0);
     end;
    end
    else
     MessageDlg('�� ������� ���������� ��� �����������', mtWarning, [mbOK], 0);
   finally
    FreeAndNil(l_Filter);
   end;
  finally
   f_DB := nil;
  end;//try..finally
 finally
  FreeAndNil(f_ChangedNumbers);
 end;
end;//DoWork

function TMainForm.GetAppFolderFileName(const aFileName: String; aUnique:
    Boolean = False): String;
var
 l_Folder: String;
begin
 l_Folder:= ExtractFileDir(Application.ExeName);
 Result:= ConcatDirName(l_Folder, aFileName);
 if aUnique then
  Result:= MakeUniqueFileName(Result);
end;

function TMainForm.ListDocsList(const aFileName: String): Im3DBRange;
begin
 Result:= Sab2Range(LoadDocNumbers(aFileName));
end;

function TMainForm.Sab2Range(aSab: ISab): Im3DBRange;
var
 l_SabList: Tl3LongintList;
 l_RangeList: Im3StorageElementIDList;
 i: Integer;
begin
 Result := nil;
 if aSab <> nil then
 begin
  l_RangeList := Tm3StorageElementIDList.MakeI;
  try
   l_SabList:= dtMakeSortedIDListBySab(aSab);
   try
    for i:= 0 to l_SabList.Hi do
     l_RangeList.Add(l_SabList[i]);
    Result:= f_DB.FilesInList(l_RangeList);
   finally
    FreeAndNil(l_SabList);
   end;
  finally
   l_RangeList:= nil;
  end;
 end;
end;

procedure TMainForm.StopWork;
begin
 if f_DB <> nil then
  f_DB.Stop;
end;

procedure TMainForm.TotalProgress(aState: Byte; aValue: Long; const aMsg: String = '');
begin
 case aState of
  0: begin
      Progress.Position:= 0;
      Progress.Max:= aValue;
     end;
  1: begin
      Progress.Position:= aValue;
     end; // aState = 1
  2: Progress.Position:= Progress.Max;
 end;
 Application.ProcessMessages;
end;

procedure TMainForm.Yield(Sender: TObject);
begin
 Application.ProcessMessages;
end;

function TMainForm.DoLongProcessNotify(aState: TdaProcessState): Boolean;
begin
 Result := False;
 Application.ProcessMessages;
end;

end.
