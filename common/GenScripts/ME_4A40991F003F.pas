unit ChatInterfacesUnit;
 {* ���������� ��� ��������� ���� }

// ������: "w:\garant6x\implementation\Garant\tie\Garant\GblAdapterLib\ChatInterfacesUnit.pas"
// ���������: "Interfaces"
// ������� ������: "ChatInterfaces" MUID: (4A40991F003F)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 , IOUnit
 , BaseTypesUnit
 , DynamicTreeUnit
 , NotifyUnit
 , SecurityUnit
;

type
 TUserInfo = record
  {* ���������� � ������������ }
  email: IString;
   {* email ������������ }
  login: IString;
   {* ��������������� ��� ������������ }
  name: IString;
   {* ��� ������������ }
 end;//TUserInfo

 UnknownUser = class
  {* ����� ������������� ������������ ������������ }
 end;//UnknownUser

 IChatManager = interface
  {* ���������� ����� }
  ['{F9DEFC6A-0DF4-4DC4-B863-62E0A7D8E68A}']
  function IsEmbedChatEnabled: ByteBool; stdcall;
   {* ���������� true, ���� �� ������� ���������� ��������� ���� }
  function GetContactsTree: INodeBase; stdcall;
   {* �������� ������ �������������, ����������� � �������� }
  function GetUserInfo(uid: TUid): TUserInfo; stdcall; { can raise UnknownUser }
   {* ���������� � ������������ � �������� ��������������� }
  procedure AddUser(uid: TUid); stdcall; { can raise UnknownUser }
   {* �������� ������������ � ������ ��������� }
  procedure DeleteUser(uid: TUid); stdcall; { can raise UnknownUser }
   {* ������� ������������ �� ������ ��������� }
  procedure RegisterListenerForNotify(var listener: IListener); stdcall;
   {* ���������������� ��������� }
  procedure ReceiveMessage(const message); stdcall;
   {* �������� ��������� � ������� }
  procedure TakeUnreadedMessages(uid: TUid); stdcall;
   {* ������� ��� ������������� ��������� }
  procedure Logout; stdcall;
   {* ���������� ��� ������ �� ������� }
 end;//IChatManager

 TMessage = record
  {* ������ ��������� }
  text: IStream;
   {* ��������� (��������������, ��� � evd �������) }
  time: TDateTime;
   {* ����� �������� ��������� }
  my: ByteBool;
   {* true, ���� ��������� ������� ������� �������������, ����� ��� ��������� ��� ���� }
 end;//TMessage

 IMessages = array of TMessage;
  {* ������ ��������� }

 IMessagesManager = interface
  {* ������ � ����������� }
  ['{7D3435F1-68A4-4CBE-A547-240E45D9FAE4}']
  function GetUnreadedMessages(uid: TUid): IMessages; overload; stdcall; { can raise UnknownUser }
   {* �������� ������������� ��������� �� ������������ � �������� uid }
  procedure SendMessage(var message: IStream;
   uid: TUid); stdcall; { can raise UnknownUser }
   {* ������� ��������� ��������� ������������ }
  function GetHistoryForUser(count: Cardinal;
   all_new: Boolean;
   uid: TUid): IMessages; stdcall; { can raise UnknownUser }
   {* �������� count ��������� ��������� ��������� � ������������� uid. ���� count = 0, �������� ������ ������� ���������. ���� all_new = true, ����� �������� ��� ������������� ���������, ���� ���� �� ���������� ��������� count. }
  procedure CleanHistory(uid: TUid); stdcall; { can raise UnknownUser }
   {* �������� ������� ��������� � �������� ������������� }
  procedure GetUnreadedMessages; overload; stdcall;
   {* �������� ������������� ��������� � ������� }
 end;//IMessagesManager

implementation

uses
 l3ImplUses
;

end.
