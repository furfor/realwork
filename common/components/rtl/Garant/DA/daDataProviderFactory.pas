unit daDataProviderFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "DA"
// ������: "w:/common/components/rtl/Garant/DA/daDataProviderFactory.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::DA::Provider::TdaDataProviderFactory
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\DA\daDefine.inc}

interface

uses
  l3ProtoObject,
  ddAppConfig,
  daTypes,
  daInterfaces,
  daDataProviderParams
  ;

type
 TdaDataProviderFactory = class(Tl3ProtoObject)
 private
 // private fields
   f_ParamsStorage : IdaParamsStorage;
    {* ���� ��� �������� ParamsStorage}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure ClearFields; override;
     {* ��������� ������ ClearFields }
 protected
 // protected methods
   procedure LoadCommonParams(aParams: TdaDataProviderParams);
   procedure SaveCommonParams(aParams: TdaDataProviderParams);
   function DoMakeProvider(aParams: TdaDataProviderParams;
     ForCheckLogin: Boolean;
     AllowClearLocks: Boolean): IdaDataProvider; virtual; abstract;
   procedure LoginCheckSucceed(aParams: TdaDataProviderParams); virtual; abstract;
 public
 // public methods
   function MakeFromConfig: TdaDataProviderParams; virtual; abstract;
   procedure SaveToConfig(aParams: TdaDataProviderParams); virtual; abstract;
   function ParamType: TdaDataProviderParamsClass; virtual; abstract;
   procedure CorrectByClient(aParams: TdaDataProviderParams); virtual;
   function IsParamsValid(aParams: TdaDataProviderParams;
     Quiet: Boolean = False): Boolean; virtual;
   procedure FillOutConfig(aConfig: TddAppConfiguration;
     aEtalon: TdaDataProviderParams;
     out aParams: TdaDataProviderParams); virtual; abstract;
   procedure FillInConfig(aConfig: TddAppConfiguration;
     aParams: TdaDataProviderParams;
     ForInfoOnly: Boolean = False); virtual; abstract;
   procedure BuildConfig(aConfig: TddAppConfiguration;
     const aProviderKey: AnsiString = '';
     ForInfoOnly: Boolean = False); virtual; abstract;
   function MakeProvider(aParams: TdaDataProviderParams;
     AllowClearLocks: Boolean): IdaDataProvider;
   procedure LoadDBVersion(aParams: TdaDataProviderParams); virtual; abstract;
   function CheckLogin(aParams: TdaDataProviderParams;
     const aLogin: AnsiString;
     const aPassword: AnsiString;
     IsRequireAdminRights: Boolean): TdaLoginError;
   class function Key: AnsiString; virtual; abstract;
   function ParamKey: AnsiString;
 public
 // public properties
   property ParamsStorage: IdaParamsStorage
     read f_ParamsStorage
     write f_ParamsStorage;
 end;//TdaDataProviderFactory

implementation

uses
  l3Base
  ;

// start class TdaDataProviderFactory

procedure TdaDataProviderFactory.LoadCommonParams(aParams: TdaDataProviderParams);
//#UC START# *55001D8D038F_54F85EE102D1_var*
//#UC END# *55001D8D038F_54F85EE102D1_var*
begin
//#UC START# *55001D8D038F_54F85EE102D1_impl*
 ParamsStorage.InitStorage;

 aParams.Login := ParamsStorage.Login;
 aParams.Password := ParamsStorage.Password;

 aParams.DocStoragePath := ParamsStorage.DocStoragePath; // Invalid
 aParams.DocImagePath := ParamsStorage.DocImagePath;

 aParams.HomeDirPath := ParamsStorage.HomeDirPath; // Invalid
//#UC END# *55001D8D038F_54F85EE102D1_impl*
end;//TdaDataProviderFactory.LoadCommonParams

procedure TdaDataProviderFactory.SaveCommonParams(aParams: TdaDataProviderParams);
//#UC START# *550AACDC0003_54F85EE102D1_var*
//#UC END# *550AACDC0003_54F85EE102D1_var*
begin
//#UC START# *550AACDC0003_54F85EE102D1_impl*
 ParamsStorage.InitStorage;

 ParamsStorage.Login := aParams.Login;
 ParamsStorage.Password := aParams.Password;

 ParamsStorage.DocStoragePath := aParams.DocStoragePath;
 ParamsStorage.DocImagePath := aParams.DocImagePath;

 ParamsStorage.HomeDirPath := aParams.HomeDirPath;
//#UC END# *550AACDC0003_54F85EE102D1_impl*
end;//TdaDataProviderFactory.SaveCommonParams

procedure TdaDataProviderFactory.CorrectByClient(aParams: TdaDataProviderParams);
//#UC START# *55110FBB00E5_54F85EE102D1_var*
//#UC END# *55110FBB00E5_54F85EE102D1_var*
begin
//#UC START# *55110FBB00E5_54F85EE102D1_impl*
 Assert(ParamsStorage <> nil);

 aParams.Login := ParamsStorage.Login;
 aParams.Password := ParamsStorage.Password;
//#UC END# *55110FBB00E5_54F85EE102D1_impl*
end;//TdaDataProviderFactory.CorrectByClient

function TdaDataProviderFactory.IsParamsValid(aParams: TdaDataProviderParams;
  Quiet: Boolean = False): Boolean;
//#UC START# *551166B40046_54F85EE102D1_var*
//#UC END# *551166B40046_54F85EE102D1_var*
begin
//#UC START# *551166B40046_54F85EE102D1_impl*
 Result := (aParams.DocStoragePath <> '') and (aParams.HomeDirPath <> '');
 if aParams.DocStoragePath = '' then
  l3System.Msg2Log('�� ������� ������������ �� (���.)');
//#UC END# *551166B40046_54F85EE102D1_impl*
end;//TdaDataProviderFactory.IsParamsValid

function TdaDataProviderFactory.MakeProvider(aParams: TdaDataProviderParams;
  AllowClearLocks: Boolean): IdaDataProvider;
//#UC START# *5515443E027B_54F85EE102D1_var*
//#UC END# *5515443E027B_54F85EE102D1_var*
begin
//#UC START# *5515443E027B_54F85EE102D1_impl*
 Result := DoMakeProvider(aParams, False, AllowClearLocks);
//#UC END# *5515443E027B_54F85EE102D1_impl*
end;//TdaDataProviderFactory.MakeProvider

function TdaDataProviderFactory.CheckLogin(aParams: TdaDataProviderParams;
  const aLogin: AnsiString;
  const aPassword: AnsiString;
  IsRequireAdminRights: Boolean): TdaLoginError;
//#UC START# *551BE3520031_54F85EE102D1_var*
var
 l_Provider: IdaDataProvider;
//#UC END# *551BE3520031_54F85EE102D1_var*
begin
//#UC START# *551BE3520031_54F85EE102D1_impl*
 l_Provider := DoMakeProvider(aParams, True, False);
 try
  try
   l_Provider.Start;
  except
   Result := da_leConnectionError;
   Exit;
  end;
  try
   Result := l_Provider.CheckLogin(aLogin, aPassword, IsRequireAdminRights);
   if (Result = da_leOk) then
   begin
    aParams.UserId := l_Provider.UserID;
    aParams.Login := aLogin;
    aParams.Password := aPassword;
    LoginCheckSucceed(aParams);
   end;
  finally
   l_Provider.Stop;
  end;
 finally
  l_Provider := nil;
 end;
//#UC END# *551BE3520031_54F85EE102D1_impl*
end;//TdaDataProviderFactory.CheckLogin

function TdaDataProviderFactory.ParamKey: AnsiString;
//#UC START# *550A8AC30010_54F85EE102D1_var*
//#UC END# *550A8AC30010_54F85EE102D1_var*
begin
//#UC START# *550A8AC30010_54F85EE102D1_impl*
 Result := ParamType.ParamsKey;
//#UC END# *550A8AC30010_54F85EE102D1_impl*
end;//TdaDataProviderFactory.ParamKey

procedure TdaDataProviderFactory.Cleanup;
//#UC START# *479731C50290_54F85EE102D1_var*
//#UC END# *479731C50290_54F85EE102D1_var*
begin
//#UC START# *479731C50290_54F85EE102D1_impl*
 f_ParamsStorage := nil;
 inherited;
//#UC END# *479731C50290_54F85EE102D1_impl*
end;//TdaDataProviderFactory.Cleanup

procedure TdaDataProviderFactory.ClearFields;
 {-}
begin
 ParamsStorage := nil;
 inherited;
end;//TdaDataProviderFactory.ClearFields

end.