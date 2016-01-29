unit atCommon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "AdapterTest"
// ������: "w:/quality/test/garant6x/AdapterTest/atCommon.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> garant6x_test::AdapterTest::Common::atCommon
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

uses
  ActiveX
  ;

function GetRandomStr(const strLength: Integer): AnsiString;
function GetTimeStamp: AnsiString;
function Less(anItem1: Pointer;
  anItem2: Pointer): Integer;
function ReadStream(const aStream: IStream): Integer;

implementation

uses
  SysUtils
  ;

// unit methods

function GetRandomStr(const strLength: Integer): AnsiString;
//#UC START# *48172C380180_48172C290190_var*
  const
    chars = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabxdefghijklmnopqratuvwxyz�����Ũ����������������������������������������������������������';
  var
    i, chrLen : integer;
//#UC END# *48172C380180_48172C290190_var*
begin
//#UC START# *48172C380180_48172C290190_impl*
  chrLen := Length(chars);
  SetLength(Result, strLength);
  for i := 1 to strLength do
    Result[i] := chars[1+Random(chrLen)];
//#UC END# *48172C380180_48172C290190_impl*
end;//GetRandomStr

function GetTimeStamp: AnsiString;
//#UC START# *4877882C03CF_48172C290190_var*
//#UC END# *4877882C03CF_48172C290190_var*
begin
//#UC START# *4877882C03CF_48172C290190_impl*
  Result := FormatDateTime('hh-nn-ss-zzz_dd-mm-yyyy', Now)
//#UC END# *4877882C03CF_48172C290190_impl*
end;//GetTimeStamp

function Less(anItem1: Pointer;
  anItem2: Pointer): Integer;
//#UC START# *4B75913601D9_48172C290190_var*
//#UC END# *4B75913601D9_48172C290190_var*
begin
//#UC START# *4B75913601D9_48172C290190_impl*
  if Integer(anItem1) > Integer(anItem2) then
    Result := 1
  else if Integer(anItem1) = Integer(anItem2) then
    Result := 0
  else
    Result := -1;
//#UC END# *4B75913601D9_48172C290190_impl*
end;//Less

function ReadStream(const aStream: IStream): Integer;
//#UC START# *4CB8650F023B_48172C290190_var*
  const
    BUF_SIZE = 4096;
  var
    l_Buf : array [0..BUF_SIZE-1] of Char;
    l_ReadBytes : Longint;
    l_NewPos : Int64;
//#UC END# *4CB8650F023B_48172C290190_var*
begin
//#UC START# *4CB8650F023B_48172C290190_impl*
  Result := 0;
  aStream.Seek(0, 0, l_NewPos);
  repeat
    aStream.Read(@l_Buf[0], BUF_SIZE, @l_ReadBytes);
    Inc(Result, l_ReadBytes);
  until l_ReadBytes < BUF_SIZE;
//#UC END# *4CB8650F023B_48172C290190_impl*
end;//ReadStream

end.