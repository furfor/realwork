unit SearchProgressIndicatorUnit; {$Z4}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "GblAdapterLib"
// ������: "w:/garant6x/implementation/Garant/GblAdapterLib/SearchProgressIndicatorUnit.pas"
// Delphi ���������� ��� �������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> garant6x::GblAdapterLib::SearchProgressIndicator
//
// ������������������ ��� ������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

interface

uses
	BaseTypesUnit
	, ProgressIndicatorSupportUnit
	;

type

ICancelSearch = interface;
{ - ��������������� �������� ICancelSearch. }


IProgressIndicatorForSearch = interface (IProgressIndicator) ['{C403A3AE-7807-49A8-807F-B2FEA60F7695}']
	procedure FinishProcess (
		const aEntity: ISearchEntity
	); stdcall;
end;

ICancelSearch = interface (ICancelLongProcess) ['{77C1D94F-084E-4430-8FE6-796A9817D990}']

end;

implementation
end.