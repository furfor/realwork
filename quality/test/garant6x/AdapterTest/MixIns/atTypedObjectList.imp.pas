{$IfNDef atTypedObjectList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "AdapterTest"
// ������: "w:/quality/test/garant6x/AdapterTest/MixIns/atTypedObjectList.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> garant6x_test::AdapterTest::MixIns::atTypedObjectList
//
// �������������� ������ ��������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define atTypedObjectList_imp}
 _atTypedObjectList_ = {mixin} class(_atTypedObjectList_Parent_)
  {* �������������� ������ ��������. }
 protected
 // property methods
   function pm_GetItems(anIndex: Integer): _ObjectListElement_;
   procedure pm_SetItems(anIndex: Integer; const aValue: _ObjectListElement_);
   function pm_GetFirst: _ObjectListElement_;
   function pm_GetLast: _ObjectListElement_;
 public
 // public methods
   function Add(const anObject: _ObjectListElement_): Integer;
   function Extract(const anItem: _ObjectListElement_): _ObjectListElement_;
   function Remove(const anObject: _ObjectListElement_): Integer;
   function IndexOf(const anObject: _ObjectListElement_): Integer;
   procedure Insert(anIndex: Integer;
    const anObject: _ObjectListElement_);
 public
 // public properties
   property Items[anIndex: Integer]: _ObjectListElement_
     read pm_GetItems
     write pm_SetItems;
     default;
   property First: _ObjectListElement_
     read pm_GetFirst;
   property Last: _ObjectListElement_
     read pm_GetLast;
 end;//_atTypedObjectList_

{$Else atTypedObjectList_imp}

// start class _atTypedObjectList_

function _atTypedObjectList_.pm_GetItems(anIndex: Integer): _ObjectListElement_;
//#UC START# *48076B270243_4807692D0057get_var*
//#UC END# *48076B270243_4807692D0057get_var*
begin
//#UC START# *48076B270243_4807692D0057get_impl*
 Result := _ObjectListElement_(GetItem(anIndex));
//#UC END# *48076B270243_4807692D0057get_impl*
end;//_atTypedObjectList_.pm_GetItems

procedure _atTypedObjectList_.pm_SetItems(anIndex: Integer; const aValue: _ObjectListElement_);
//#UC START# *48076B270243_4807692D0057set_var*
//#UC END# *48076B270243_4807692D0057set_var*
begin
//#UC START# *48076B270243_4807692D0057set_impl*
 SetItem(anIndex, aValue);
//#UC END# *48076B270243_4807692D0057set_impl*
end;//_atTypedObjectList_.pm_SetItems

function _atTypedObjectList_.pm_GetFirst: _ObjectListElement_;
//#UC START# *48076C1B012D_4807692D0057get_var*
//#UC END# *48076C1B012D_4807692D0057get_var*
begin
//#UC START# *48076C1B012D_4807692D0057get_impl*
 Result := _ObjectListElement_(inherited First);
//#UC END# *48076C1B012D_4807692D0057get_impl*
end;//_atTypedObjectList_.pm_GetFirst

function _atTypedObjectList_.pm_GetLast: _ObjectListElement_;
//#UC START# *48076C440066_4807692D0057get_var*
//#UC END# *48076C440066_4807692D0057get_var*
begin
//#UC START# *48076C440066_4807692D0057get_impl*
 Result := _ObjectListElement_(inherited Last);
//#UC END# *48076C440066_4807692D0057get_impl*
end;//_atTypedObjectList_.pm_GetLast

function _atTypedObjectList_.Add(const anObject: _ObjectListElement_): Integer;
//#UC START# *48076B5F0329_4807692D0057_var*
//#UC END# *48076B5F0329_4807692D0057_var*
begin
//#UC START# *48076B5F0329_4807692D0057_impl*
 Result := inherited Add(anObject);
//#UC END# *48076B5F0329_4807692D0057_impl*
end;//_atTypedObjectList_.Add

function _atTypedObjectList_.Extract(const anItem: _ObjectListElement_): _ObjectListElement_;
//#UC START# *48076B940117_4807692D0057_var*
//#UC END# *48076B940117_4807692D0057_var*
begin
//#UC START# *48076B940117_4807692D0057_impl*
 Result := _ObjectListElement_(inherited Extract(anItem));
//#UC END# *48076B940117_4807692D0057_impl*
end;//_atTypedObjectList_.Extract

function _atTypedObjectList_.Remove(const anObject: _ObjectListElement_): Integer;
//#UC START# *48076BAE0300_4807692D0057_var*
//#UC END# *48076BAE0300_4807692D0057_var*
begin
//#UC START# *48076BAE0300_4807692D0057_impl*
 Result := inherited Remove(anObject);
//#UC END# *48076BAE0300_4807692D0057_impl*
end;//_atTypedObjectList_.Remove

function _atTypedObjectList_.IndexOf(const anObject: _ObjectListElement_): Integer;
//#UC START# *48076BC00116_4807692D0057_var*
//#UC END# *48076BC00116_4807692D0057_var*
begin
//#UC START# *48076BC00116_4807692D0057_impl*
 Result := inherited IndexOf(anObject);
//#UC END# *48076BC00116_4807692D0057_impl*
end;//_atTypedObjectList_.IndexOf

procedure _atTypedObjectList_.Insert(anIndex: Integer;
  const anObject: _ObjectListElement_);
//#UC START# *48076BD102FF_4807692D0057_var*
//#UC END# *48076BD102FF_4807692D0057_var*
begin
//#UC START# *48076BD102FF_4807692D0057_impl*
 inherited Insert(anIndex, anObject);
//#UC END# *48076BD102FF_4807692D0057_impl*
end;//_atTypedObjectList_.Insert

{$EndIf atTypedObjectList_imp}
