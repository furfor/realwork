unit nsFixedHAFMacroReplacer;

{ $Id: nsFixedHAFMacroReplacer.pas,v 1.3 2010/03/02 13:34:33 lulin Exp $ }

// $Log: nsFixedHAFMacroReplacer.pas,v $
// Revision 1.3  2010/03/02 13:34:33  lulin
// {RequestLink:193823544}.
//
// Revision 1.2  2010/03/02 11:15:09  lulin
// {RequestLink:193823544}.
//
// Revision 1.1  2009/09/23 12:12:16  lulin
// - ������ ������ �������� �� ������.
//
// Revision 1.1  2008/12/29 07:39:06  oman
// - fix: MacroReplacer ��� �������� (�-122675365)
//
//

{$Include nsDefine.inc }

interface

uses
 l3Interfaces,
 l3InternalInterfaces,

 evCustomHAFMacroReplacer ;

type
 TnsFixedHAFMacroReplacer = class(TevCustomHAFMacroReplacer)
 private
  f_Name: Il3CString;
  f_FullName: Il3CString;
 protected
  function DoReplace(const aText: Il3CString): Il3CString;
   override;
   {-}
  function DoUnfold(const aMacroName: Il3CString; const aValue: Il3CString):  Il3CString;
   override;
   {-}
  procedure Cleanup;
   override;
   {-}
 public
  constructor Create(const aParent: Il3HAFMacroReplacer; const aName, aFullName: Il3CString);
   reintroduce;
   {-}
  class function Make(const aParent: Il3HAFMacroReplacer; const aName, aFullName: Il3CString): Il3HAFMacroReplacer;
   reintroduce;
   {-}
 end;

implementation

uses
 l3String,
 l3Base,

 nevInterfaces,
 evHAFPainterMacros,

 nsValueMaps
 ;

{ TnsFixedHAFMacroReplacer }

procedure TnsFixedHAFMacroReplacer.Cleanup;
begin
 f_Name := nil;
 f_FullName := nil;
 inherited;
end;

constructor TnsFixedHAFMacroReplacer.Create(
  const aParent: Il3HAFMacroReplacer; const aName, aFullName: Il3CString);
begin
 inherited Create(aParent);
 f_Name := aName;
 f_FullName := aFullName;
end;

function TnsFixedHAFMacroReplacer.DoUnfold(
  const aMacroName: Il3CString; const aValue: Il3CString): Il3CString;
begin
 if l3Same(aMacroName, l3CStr(SDocName)) then
  Result := f_Name
 else
  if l3Same(aMacroName, l3CStr(SDocFullName)) then
   Result := f_FullName
  else
   if l3Same(aMacroName, l3CStr(SDocRedactionDate)) then
    Result := nil
   else
    if l3Same(aMacroName, l3CStr(SInternalNumber)) then
     Result := str_nevpmUndefinedSize.AsCStr
    else
     if l3Same(aMacroName, l3CStr(SDataSize)) then
      Result := str_nevpmUndefinedTopic.AsCStr
     else
      Result := aValue;
end;

class function TnsFixedHAFMacroReplacer.Make(
  const aParent: Il3HAFMacroReplacer;
  const aName, aFullName: Il3CString): Il3HAFMacroReplacer;
var
 l_Inst: TnsFixedHAFMacroReplacer;
begin
 l_Inst := Create(aParent, aName, aFullName);
 try
  Result := l_Inst;
 finally
  l3Free(l_Inst);
 end;
end;

function TnsFixedHAFMacroReplacer.DoReplace(
  const aText: Il3CString): Il3CString;
begin
 Result := CheckMacro(l3CStr(SDocName), aText);
 Result := CheckMacro(l3CStr(SDocFullName), Result);
 Result := CheckMacro(l3CStr(SDocRedactionDate), Result);
 Result := CheckMacro(l3CStr(SInternalNumber), Result);
 Result := CheckMacro(l3CStr(SDataSize), Result);
end;

end.

