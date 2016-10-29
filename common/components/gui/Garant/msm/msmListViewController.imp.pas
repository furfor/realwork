{$IfNDef msmListViewController_imp}

// ������: "w:\common\components\gui\Garant\msm\msmListViewController.imp.pas"
// ���������: "Impurity"
// ������� ������: "msmListViewController" MUID: (57B6C958008A)
// ��� ����: "_msmListViewController_"

{$Define msmListViewController_imp}

 _msmListLikeViewController_Parent_ = _msmListViewController_Parent_;
 {$Include w:\common\components\gui\Garant\msm\msmListLikeViewController.imp.pas}
 _msmListViewController_ = {abstract} class(_msmListLikeViewController_)
  private
   procedure DoGetStrItem(Sender: TObject;
    Index: LongInt;
    var ItemString: Il3CString);
  protected
   procedure CallDropDrawPoints; virtual; abstract;
   procedure DoListContentChangedEvent(anEvent: TmsmEvent);
   procedure DoListChangedEvent(anEvent: TmsmEvent);
   procedure InitOwnView; override;
   procedure LinkDataToView; override;
   procedure LinkEventHandlers; override;
 end;//_msmListViewController_

{$Else msmListViewController_imp}

{$IfNDef msmListViewController_imp_impl}

{$Define msmListViewController_imp_impl}

{$Include w:\common\components\gui\Garant\msm\msmListLikeViewController.imp.pas}

procedure _msmListViewController_.DoGetStrItem(Sender: TObject;
 Index: LongInt;
 var ItemString: Il3CString);
//#UC START# *57AB0F1703C1_57B6C958008A_var*
//#UC END# *57AB0F1703C1_57B6C958008A_var*
begin
//#UC START# *57AB0F1703C1_57B6C958008A_impl*
 ItemString := Self.Model.List.Strings[Index];
//#UC END# *57AB0F1703C1_57B6C958008A_impl*
end;//_msmListViewController_.DoGetStrItem

procedure _msmListViewController_.DoListContentChangedEvent(anEvent: TmsmEvent);
//#UC START# *57B6C958008A_57E2C2970206_57B6C958008A_var*
//#UC END# *57B6C958008A_57E2C2970206_57B6C958008A_var*
begin
//#UC START# *57B6C958008A_57E2C2970206_57B6C958008A_impl*
 inherited;
 if (Self.Model.List = nil) then
  OwnView.Total := 0
 else
  OwnView.Total := Self.Model.List.Count;
 if OwnView.MultiStrokeItem then
  CallDropDrawPoints;
 OwnView.Invalidate;
//#UC END# *57B6C958008A_57E2C2970206_57B6C958008A_impl*
end;//_msmListViewController_.DoListContentChangedEvent

procedure _msmListViewController_.DoListChangedEvent(anEvent: TmsmEvent);
//#UC START# *57B6C958008A_57ADBA39026E_57B6C958008A_var*
//#UC END# *57B6C958008A_57ADBA39026E_57B6C958008A_var*
begin
//#UC START# *57B6C958008A_57ADBA39026E_57B6C958008A_impl*
 inherited;
 LinkDataToView;
//#UC END# *57B6C958008A_57ADBA39026E_57B6C958008A_impl*
end;//_msmListViewController_.DoListChangedEvent

procedure _msmListViewController_.InitOwnView;
//#UC START# *57ADFB33027D_57B6C958008A_var*
//#UC END# *57ADFB33027D_57B6C958008A_var*
begin
//#UC START# *57ADFB33027D_57B6C958008A_impl*
 inherited;
 OwnView.OnGetStrItem := Self.DoGetStrItem;
 OwnView.AllowWithoutCurrent := true;
//#UC END# *57ADFB33027D_57B6C958008A_impl*
end;//_msmListViewController_.InitOwnView

procedure _msmListViewController_.LinkDataToView;
//#UC START# *57B6A49900F4_57B6C958008A_var*
var
 l_Index : Integer;
 l_E : ImsmModelElement;
//#UC END# *57B6A49900F4_57B6C958008A_var*
begin
//#UC START# *57B6A49900F4_57B6C958008A_impl*
 inherited;
 if (Self.Model.List = nil) then
  OwnView.Total := 0
 else
  OwnView.Total := Self.Model.List.Count;
 l_Index := 0; 
 if (Self.Model.List = nil) then
  OwnView.Current := 0
 else
 begin
  l_Index := Self.Model.List.IndexOfElementView(Self.Model.CurrentElement);
  if (l_Index < 0) then
  begin
   if (Self.Model.List.Count > 0) then
   begin
    OwnView.Current := 0;
    l_E := Self.Model.List[0];
    if (l_E <> nil) then
    begin
     if (Self.Model.CurrentElement = nil) OR
        not Self.Model.CurrentElement.IsSameElementView(l_E) then
      Self.Model.CurrentElement := l_E;
    end;//l_E <> nil
   end//Self.Model.List.Count > 0
   else
   begin
    //OwnView.Current := -1;
    OwnView.Current := 0;
    Self.Model.CurrentElement := nil;
   end;//Self.Model.List.Count > 0
  end//l_Index < 0
  else
   OwnView.Current := l_Index;
 end;//Self.Model.List = nil
 if (OwnView.Total = 0) then
  //DoCurrentChanged(Self, -1, -1)
 else
  DoCurrentChanged(Self, l_Index, -1);
 if OwnView.MultiStrokeItem then
  CallDropDrawPoints;
 OwnView.Invalidate;
//#UC END# *57B6A49900F4_57B6C958008A_impl*
end;//_msmListViewController_.LinkDataToView

procedure _msmListViewController_.LinkEventHandlers;
begin
 inherited;
 Self.LinkEventHandler(ListContentChangedEvent.Instance, DoListContentChangedEvent);
 Self.LinkEventHandler(ListChangedEvent.Instance, DoListChangedEvent);
end;//_msmListViewController_.LinkEventHandlers

{$EndIf msmListViewController_imp_impl}

{$EndIf msmListViewController_imp}

