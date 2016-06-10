unit csServerCommandsManager;

interface

Uses
 //l3Base,
 Classes,
 CsDataPipe,
 csCommandsManager,
 csCommandsTypes//,
 //ddAppConfigTypes,
 //ddServerTask
 ;

type
  TExecuteCommandEvent = procedure(aCommandID: Integer) of object;

  TcsServerCommandsManager = class(TcsCommandsManager)
  private
    f_OnExecuteServerCommand: TExecuteCommandEvent;
  public
   procedure ExecuteCommand(Sender: TObject); override;
   procedure AddCommand(aID: TcsCommands; const aCaption: String; aOnExecute: TcsCommandExecuteEvent{TNotifyEvent}); overload;
   procedure AddCommand(const aCaption: String; aNeedRespond: Boolean; aOnExecute: TcsCommandExecuteEvent{TNotifyEvent}{; aLinkTask: TddTaskClass = nil}; aRequireAdminRights: Boolean = False); overload;
   procedure cs_GetCommands(aPipe: TCSDataPipe);
   property OnExecuteServerCommand: TExecuteCommandEvent read f_OnExecuteServerCommand write f_OnExecuteServerCommand;
  end;//TcsServerCommandsManager

implementation

uses
 l3Memory,
 daInterfaces,
 daDataProvider,
 csQueryTypes,
 SysUtils,
 csCommandsConst,
 //DT_UserConst,
 csProcessTask,
 dt_User
 ;

procedure TcsServerCommandsManager.AddCommand(aID: TcsCommands; const aCaption: String; aOnExecute:
    TcsCommandExecuteEvent{TNotifyEvent});
var
 l_Command: TcsCommand;
begin
 if CommandExists(Ord(aID), l_Command) then
 begin
  Assert(false);
  //l_Command.Caption:= aCaption;
  //l_Command.OnExecute:= aOnExecute;
 end
 else
 begin
  l_Command := TcsCommand.Create(Ord(aID), aCaption, aOnExecute);
  try
   //l_Command.CommandID:= Ord(aID);
   //l_Command.Caption:= aCaption;
   //l_Command.OnExecute:= aOnExecute;
   Add(l_Command);
  finally
   FreeAndNil(l_Command);
  end;//try..finally
 end;
end;

procedure TcsServerCommandsManager.AddCommand(const aCaption: String; aNeedRespond: Boolean; aOnExecute:
    TcsCommandExecuteEvent{TNotifyEvent}{; aLinkTask: TddTaskClass = nil}; aRequireAdminRights: Boolean = False);
var
 l_Command: TcsCommand;
begin
 l_Command := TcsCommand.Create(c_CommandBaseIndex + Succ(Count), aCaption, aOnExecute);
 try
  l_Command.NeedRespond:= aNeedRespond;
  l_Command.RequireAdminRights := aRequireAdminRights;
  Add(l_Command);
 finally
  FreeAndNil(l_Command);
 end;//try..finally
end;

procedure TcsServerCommandsManager.cs_GetCommands(aPipe: TCSDataPipe);
var
 l_Stream: TStream;
 i, l_Count: Integer;
 l_User: IdaArchiUser;
begin
 Acquire;
 try
  l_Stream:= Tl3MemoryStream.Create;
  try
   l_User := GlobalDataProvider.UserManager.UserByID(aPipe.ClientID);
   Assert(Assigned(l_User), Format('�� ������ ������������ � ID = %d', [aPipe.ClientID]));
   l_Count := 0;
   for i := 0 to Count - 1 do
    if l_User.HasAdminRights or not Commands[i].RequireAdminRights then
     Inc(l_Count);
   l_Stream.Write(l_Count, SizeOf(l_Count));
   for i:= 0 to Pred(Count) do
    if l_User.HasAdminRights or not Commands[i].RequireAdminRights then
     Commands[i].Save(l_Stream);
   aPipe.WriteStream(l_Stream);
  finally
   FreeAndNil(l_Stream);
  end;
 finally
  Leave;
 end;
end;

procedure TcsServerCommandsManager.ExecuteCommand(Sender: TObject);
begin
 if Assigned(f_OnExecuteServerCommand) then
  f_OnExecuteServerCommand(TComponent(Sender).Tag);
end;

end.
