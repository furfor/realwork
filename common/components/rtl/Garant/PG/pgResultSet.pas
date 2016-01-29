unit pgResultSet;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "PG"
// ������: "w:/common/components/rtl/Garant/PG/pgResultSet.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::PG::Provider::TpgResultSet
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\PG\pgDefine.inc}

interface

{$If defined(UsePostgres)}
uses
  l3ProtoObject,
  daInterfaces,
  daParamList,
  LibPQ,
  daSelectFieldList,
  pgInterfaces,
  pgConnection,
  daFieldList
  ;
{$IfEnd} //UsePostgres

{$If defined(UsePostgres)}
type
 TpgResultSet = class(Tl3ProtoObject, IdaResultSet, IdaResultBuffer)
 private
 // private fields
   f_Result : PPGresult;
   f_CurrentPos : LongInt;
   f_EOF : Boolean;
   f_FieldsDescription : TdaSelectFieldList;
   f_Fields : TdaFieldList;
   f_DataConverter : IpgDataConverter;
 protected
 // realized methods
   procedure Next;
   function EOF: Boolean;
   function IsEmpty: Boolean;
   function Get_Field(const anAlias: AnsiString): IdaField;
   procedure RegisterField(const aField: IdaField);
   procedure UnregisterField(const aField: IdaField);
   function FieldBufferPtr(FieldIndex: Integer): Pointer;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // public methods
   constructor Create(aConnection: TpgConnection;
     const aDataConverter: IpgDataConverter;
     const aQueryName: AnsiString;
     aParams: TdaParamList;
     aSelectFields: TdaSelectFieldList;
     Unidirectional: Boolean); reintroduce;
   class function Make(aConnection: TpgConnection;
     const aDataConverter: IpgDataConverter;
     const aQueryName: AnsiString;
     aParams: TdaParamList;
     aSelectFields: TdaSelectFieldList;
     Unidirectional: Boolean): IdaResultSet; reintroduce;
     {* ��������� ������� TpgResultSet.Make }
 end;//TpgResultSet
{$IfEnd} //UsePostgres

implementation

{$If defined(UsePostgres)}
uses
  SysUtils,
  pgField,
  l3Types
  ;
{$IfEnd} //UsePostgres

{$If defined(UsePostgres)}

// start class TpgResultSet

constructor TpgResultSet.Create(aConnection: TpgConnection;
  const aDataConverter: IpgDataConverter;
  const aQueryName: AnsiString;
  aParams: TdaParamList;
  aSelectFields: TdaSelectFieldList;
  Unidirectional: Boolean);
//#UC START# *560B99890062_560B961401E4_var*
var
 l_ParamsValue: array of AnsiString;
 l_ParamsValuePtr: TPQparamValues;
 l_IDX: Integer;
//#UC END# *560B99890062_560B961401E4_var*
begin
//#UC START# *560B99890062_560B961401E4_impl*
 inherited Create;

 f_DataConverter := aDataConverter;
 f_Fields := TdaFieldList.Make;
 aSelectFields.SetRefTo(f_FieldsDescription);

 SetLength(l_ParamsValue, aParams.Count);
 SetLength(l_ParamsValuePtr, aParams.Count);
 for l_IDX := 0 to aParams.Count - 1 do
 begin
  l_ParamsValue[l_IDX] := aParams[l_IDX].AsString;
  l_ParamsValuePtr[l_IDX] := @l_ParamsValue[l_IDX][1];
 end;
 
 f_Result := PQexecPrepared(aConnection.Handle, PAnsiChar(aQueryName), aParams.Count, l_ParamsValuePtr, nil, 0, 0);
 if not (PQresultStatus(f_Result) in [PGRES_EMPTY_QUERY, PGRES_COMMAND_OK, PGRES_TUPLES_OK]) then
  raise EpgError.Create(PQresultErrorMessage(f_Result));

 if not IsEmpty then
 begin
  f_CurrentPos := 0;
  f_EOF := False;
 end
 else
 begin
  f_CurrentPos := -1;
  f_EOF := True;
 end;
//#UC END# *560B99890062_560B961401E4_impl*
end;//TpgResultSet.Create

class function TpgResultSet.Make(aConnection: TpgConnection;
  const aDataConverter: IpgDataConverter;
  const aQueryName: AnsiString;
  aParams: TdaParamList;
  aSelectFields: TdaSelectFieldList;
  Unidirectional: Boolean): IdaResultSet;
var
 l_Inst : TpgResultSet;
begin
 l_Inst := Create(aConnection, aDataConverter, aQueryName, aParams, aSelectFields, Unidirectional);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TpgResultSet.Next;
//#UC START# *5549C44C037A_560B961401E4_var*
//#UC END# *5549C44C037A_560B961401E4_var*
begin
//#UC START# *5549C44C037A_560B961401E4_impl*
 Inc(f_CurrentPos);
 if f_CurrentPos >= PQntuples(f_Result) then
 begin
  f_CurrentPos := PQntuples(f_Result) - 1;
  f_EOF := True;
 end
 else
  f_EOF := False;
//#UC END# *5549C44C037A_560B961401E4_impl*
end;//TpgResultSet.Next

function TpgResultSet.EOF: Boolean;
//#UC START# *5549C45A025C_560B961401E4_var*
//#UC END# *5549C45A025C_560B961401E4_var*
begin
//#UC START# *5549C45A025C_560B961401E4_impl*
 Result := f_EOF;
//#UC END# *5549C45A025C_560B961401E4_impl*
end;//TpgResultSet.EOF

function TpgResultSet.IsEmpty: Boolean;
//#UC START# *558BF63203D7_560B961401E4_var*
//#UC END# *558BF63203D7_560B961401E4_var*
begin
//#UC START# *558BF63203D7_560B961401E4_impl*
 Result := (PQresultStatus(f_Result) = PGRES_EMPTY_QUERY) or (PQntuples(f_Result) = 0);
//#UC END# *558BF63203D7_560B961401E4_impl*
end;//TpgResultSet.IsEmpty

function TpgResultSet.Get_Field(const anAlias: AnsiString): IdaField;
//#UC START# *5590FD57027D_560B961401E4get_var*
var
 l_IDX: Integer;
//#UC END# *5590FD57027D_560B961401E4get_var*
begin
//#UC START# *5590FD57027D_560B961401E4get_impl*
 if f_Fields.FindData(anAlias, l_IDX, l3_siUnsorted) then
  Result := f_Fields[l_IDX]
 else
  if f_FieldsDescription.FindData(anAlias, l_IDX) then
   Result := TpgField.Make(Self, f_DataConverter, f_FieldsDescription[l_IDX], l_IDX)
  else
   Result := nil;
//#UC END# *5590FD57027D_560B961401E4get_impl*
end;//TpgResultSet.Get_Field

procedure TpgResultSet.RegisterField(const aField: IdaField);
//#UC START# *55A63E22019B_560B961401E4_var*
var
 l_Dummy: Integer;
//#UC END# *55A63E22019B_560B961401E4_var*
begin
//#UC START# *55A63E22019B_560B961401E4_impl*
 Assert(f_Fields.FindData(aField, l_Dummy) = False);
 f_Fields.Add(aField);
//#UC END# *55A63E22019B_560B961401E4_impl*
end;//TpgResultSet.RegisterField

procedure TpgResultSet.UnregisterField(const aField: IdaField);
//#UC START# *55A63E3D0122_560B961401E4_var*
//#UC END# *55A63E3D0122_560B961401E4_var*
begin
//#UC START# *55A63E3D0122_560B961401E4_impl*
 f_Fields.Remove(aField);
//#UC END# *55A63E3D0122_560B961401E4_impl*
end;//TpgResultSet.UnregisterField

function TpgResultSet.FieldBufferPtr(FieldIndex: Integer): Pointer;
//#UC START# *55C8996702B1_560B961401E4_var*
//#UC END# *55C8996702B1_560B961401E4_var*
begin
//#UC START# *55C8996702B1_560B961401E4_impl*
 Result := PQgetvalue(f_Result, f_CurrentPos, FieldIndex);
//#UC END# *55C8996702B1_560B961401E4_impl*
end;//TpgResultSet.FieldBufferPtr

procedure TpgResultSet.Cleanup;
//#UC START# *479731C50290_560B961401E4_var*
//#UC END# *479731C50290_560B961401E4_var*
begin
//#UC START# *479731C50290_560B961401E4_impl*
 FreeAndNil(f_Fields);
 PQclear(f_Result);
 f_DataConverter := nil;
 FreeAndNil(f_FieldsDescription);
 inherited;
//#UC END# *479731C50290_560B961401E4_impl*
end;//TpgResultSet.Cleanup

{$IfEnd} //UsePostgres

end.