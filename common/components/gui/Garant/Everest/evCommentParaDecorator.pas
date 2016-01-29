unit evCommentParaDecorator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCommentParaDecorator.pas"
// �����: 14.04.2009 17:07
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Generators::TevCommentParaDecorator
//
// ������, ������������ ������������ ������� ������������� ����������. [$140285546]
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evdLeafParaFilter,
  l3Variant
  ;

type
 TevCheckStyle = (
   ev_cstNone
 , ev_cstTxtComment
 , ev_cstVerComment
 );//TevCheckStyle

 TevCommentParaDecorator = class(TevdLeafParaFilter)
  {* ������, ������������ ������������ ������� ������������� ����������. [$140285546] }
 private
 // private fields
   f_CheckComment : TevCheckStyle;
 protected
 // overridden protected methods
   procedure OpenStream; override;
     {* ���������� ���� ��� ��� ������ ���������. ��� ���������� � ��������. }
   procedure DoWritePara(aLeaf: Tl3Variant); override;
     {* ������ ����������� ������ � ���������. ��������� ������� ��������� � ���������� ������ }
 end;//TevCommentParaDecorator

implementation

uses
  evdStyles,
  k2Tags,
  TextPara_Const,
  Graphics,
  nevInterfaces
  ;

// start class TevCommentParaDecorator

procedure TevCommentParaDecorator.OpenStream;
//#UC START# *4836D49800CA_49E48A670254_var*
//#UC END# *4836D49800CA_49E48A670254_var*
begin
//#UC START# *4836D49800CA_49E48A670254_impl*
 inherited;
 f_CheckComment := ev_cstNone;
//#UC END# *4836D49800CA_49E48A670254_impl*
end;//TevCommentParaDecorator.OpenStream

procedure TevCommentParaDecorator.DoWritePara(aLeaf: Tl3Variant);
//#UC START# *49E4883E0176_49E48A670254_var*

 procedure lp_OutStyleDecor;
 begin
  Generator.StartChild(k2_typTextPara);
  try
   Generator.AddIntegerAtom(k2_tiStyle, ev_saTxtComment);
   Generator.AddStringAtom(k2_tiText, aLeaf.Attr[k2_tiStyle].PCharLenA[k2_tiShortName]);
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=297712959
   Generator.StartTag(k2_tiFont);
   try
    Generator.AddIntegerAtom(k2_tiForeColor, clBlack);
    Generator.AddIntegerAtom(k2_tiSize, 8);
   finally
    Generator.Finish;
   end;//try..finally
  finally
   Generator.Finish;
  end;//try..finally
 end;

var
 l_Style: Integer;
//#UC END# *49E4883E0176_49E48A670254_var*
begin
//#UC START# *49E4883E0176_49E48A670254_impl*
 l_Style := aLeaf.IntA[k2_tiStyle];
 if (l_Style = ev_saTxtComment) then
 begin
  if (f_CheckComment = ev_cstVerComment) or (f_CheckComment = ev_cstNone) then
  begin
   f_CheckComment := ev_cstTxtComment;
   lp_OutStyleDecor;
  end; // if (f_CheckComment = ev_cstVerComment) or (f_CheckComment = ev_cstNone) then
 end
 else
  if (l_Style = ev_saVersionInfo) then
  begin
   if (f_CheckComment = ev_cstTxtComment) or (f_CheckComment = ev_cstNone) then
   begin
    f_CheckComment := ev_cstVerComment;
    lp_OutStyleDecor;
   end; // if (f_CheckComment = ev_cstVerComment) or (f_CheckComment = ev_cstNone) then
  end
  else
   f_CheckComment := ev_cstNone;
 inherited;
//#UC END# *49E4883E0176_49E48A670254_impl*
end;//TevCommentParaDecorator.DoWritePara

end.