unit NOT_FINISHED_evDocumentPartGenerator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/NOT_FINISHED_evDocumentPartGenerator.pas"
// �����: 09.02.1999 17:29
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Generators::TevDocumentPartGenerator
//
// ���������� ���������� ��� ������� ������ � �� ����� ���� ��������� ������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ���� ���� ������������ ������ ��� �������������, � �� ��� ����������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevTools,
  evDocumentPartGeneratorPrim,
  l3Variant
  ;

type
 TevDocumentPartGenerator = class(TevDocumentPartGeneratorPrim)
  {* ���������� ���������� ��� ������� ������ � �� ����� ���� ��������� ������. }
 protected
 // realized methods
   procedure AtEndChanged; override;
 protected
 // protected methods
   procedure SetInsertionPoint(const aPoint: InevBasePoint;
     aPID: Integer); virtual;
   procedure InsertPara(aChild: Tl3Variant); virtual;
   procedure StartInsertion; virtual;
   procedure FinishInsertion; virtual;
   function InsertTable(aChild: Tl3Variant): Boolean; virtual;
 end;//TevDocumentPartGenerator

implementation

// start class TevDocumentPartGenerator

procedure TevDocumentPartGenerator.SetInsertionPoint(const aPoint: InevBasePoint;
  aPID: Integer);
//#UC START# *4D9359AA01A2_48030DE6002F_var*
//#UC END# *4D9359AA01A2_48030DE6002F_var*
begin
//#UC START# *4D9359AA01A2_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4D9359AA01A2_48030DE6002F_impl*
end;//TevDocumentPartGenerator.SetInsertionPoint

procedure TevDocumentPartGenerator.InsertPara(aChild: Tl3Variant);
//#UC START# *48E4B7DA0313_48030DE6002F_var*
//#UC END# *48E4B7DA0313_48030DE6002F_var*
begin
//#UC START# *48E4B7DA0313_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4B7DA0313_48030DE6002F_impl*
end;//TevDocumentPartGenerator.InsertPara

procedure TevDocumentPartGenerator.StartInsertion;
//#UC START# *48E4B7E90296_48030DE6002F_var*
//#UC END# *48E4B7E90296_48030DE6002F_var*
begin
//#UC START# *48E4B7E90296_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4B7E90296_48030DE6002F_impl*
end;//TevDocumentPartGenerator.StartInsertion

procedure TevDocumentPartGenerator.FinishInsertion;
//#UC START# *48E4B7F403D6_48030DE6002F_var*
//#UC END# *48E4B7F403D6_48030DE6002F_var*
begin
//#UC START# *48E4B7F403D6_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4B7F403D6_48030DE6002F_impl*
end;//TevDocumentPartGenerator.FinishInsertion

function TevDocumentPartGenerator.InsertTable(aChild: Tl3Variant): Boolean;
//#UC START# *48E4B802032E_48030DE6002F_var*
//#UC END# *48E4B802032E_48030DE6002F_var*
begin
//#UC START# *48E4B802032E_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *48E4B802032E_48030DE6002F_impl*
end;//TevDocumentPartGenerator.InsertTable

procedure TevDocumentPartGenerator.AtEndChanged;
//#UC START# *4A8BBFBE02D4_48030DE6002F_var*
//#UC END# *4A8BBFBE02D4_48030DE6002F_var*
begin
//#UC START# *4A8BBFBE02D4_48030DE6002F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4A8BBFBE02D4_48030DE6002F_impl*
end;//TevDocumentPartGenerator.AtEndChanged

end.