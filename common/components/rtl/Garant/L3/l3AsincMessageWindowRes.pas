unit l3AsincMessageWindowRes;

// ������: "w:\common\components\rtl\Garant\L3\l3AsincMessageWindowRes.pas"
// ���������: "UtilityPack"
// ������� ������: "l3AsincMessageWindowRes" MUID: (4BA20A0E03B0)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ Local }
 str_l3mmLongOperation: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'l3mmLongOperation'; rValue : '����������� ���������� ��������...');
  {* '����������� ���������� ��������...' }

implementation

uses
 l3ImplUses
;

initialization
 str_l3mmLongOperation.Init;
 {* ������������� str_l3mmLongOperation }

end.
