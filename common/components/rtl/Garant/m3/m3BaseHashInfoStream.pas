unit m3BaseHashInfoStream;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "m3"
// ������: "w:/common/components/rtl/Garant/m3/m3BaseHashInfoStream.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::m3::Indexer::Tm3BaseHashInfoStream
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\m3\m3Define.inc}

interface

uses
  ActiveX,
  m3BaseHeaderStream
  ;

type
 Tm3HashInfoStreamHeader = packed record
//#UC START# *53FF324503ADpubl*
   RZerroFrontierByte: Byte;
     {* - ��������� ����. }
   RVersion: Int64;
     {* - ������ hash-info. }
   RHashCount: Word;
     {* - ���������� ��������� ����. }
   RHashSize:  LongInt;
     {* - ������������ ������ ����� ������ ��� �����������. }
   RHashVersion: Word;
     {* - ������ ��������� �����������. }
//#UC END# *53FF324503ADpubl*
 end;//Tm3HashInfoStreamHeader

 _HeaderType_ = Tm3HashInfoStreamHeader;
 {$Include ..\m3\m3CustomHeaderStream.imp.pas}
 Tm3BaseHashInfoStream = class(_m3CustomHeaderStream_)
 public
 // realized methods
   class function HeaderID: TCLSID; override;
   class function DefaultHeaderValue: _HeaderType_; override;
 end;//Tm3BaseHashInfoStream

implementation

uses
  m3IdxCla,
  m2HasLib,
  m2AddDbg,
  m2AddPrc,
  m2COMLib,
  m2MemLib,
  l3Base,
  ComObj,
  m3Const
  ;

{$Include ..\m3\m3CustomHeaderStream.imp.pas}

// start class Tm3BaseHashInfoStream

class function Tm3BaseHashInfoStream.HeaderID: TCLSID;
//#UC START# *53FDFAF900ED_53FF322603A8_var*
const
 cHeaderID : TCLSID = '{F7E473D9-ED70-478E-91C4-D80BAAAB385B}';
//#UC END# *53FDFAF900ED_53FF322603A8_var*
begin
//#UC START# *53FDFAF900ED_53FF322603A8_impl*
 Result := cHeaderID;
//#UC END# *53FDFAF900ED_53FF322603A8_impl*
end;//Tm3BaseHashInfoStream.HeaderID

class function Tm3BaseHashInfoStream.DefaultHeaderValue: _HeaderType_;
//#UC START# *53FF37DC003A_53FF322603A8_var*
const
  CHeaderData000 : Tm3HashInfoStreamHeader = (
   RZerroFrontierByte: 0;
   RVersion: Low(Int64);
   RHashCount: Cm2HASDefCount;
   RHashSize: Cm2HASDefSize;
   RHashVersion: Cm2HASVersion;
 );
//#UC END# *53FF37DC003A_53FF322603A8_var*
begin
//#UC START# *53FF37DC003A_53FF322603A8_impl*
 Result := CHeaderData000;
//#UC END# *53FF37DC003A_53FF322603A8_impl*
end;//Tm3BaseHashInfoStream.DefaultHeaderValue

end.