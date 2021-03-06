unit nsDayTipsDictCache;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Diction\nsDayTipsDictCache.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsDayTipsDictCache" MUID: (5571B3100338)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nsDictCachePrim
 , DynamicTreeUnit
;

type
 TnsDayTipsDictCache = class(TnsDictCachePrim)
  private
   f_Root: INodeBase;
  protected
   function DoGetRoot: INodeBase; override;
  public
   class function Instance: TnsDayTipsDictCache;
    {* ����� ��������� ���������� ���������� TnsDayTipsDictCache }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TnsDayTipsDictCache
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , DataAdapter
 , nsTypes
 , SysUtils
 , l3Base
 //#UC START# *5571B3100338impl_uses*
 //#UC END# *5571B3100338impl_uses*
;

var g_TnsDayTipsDictCache: TnsDayTipsDictCache = nil;
 {* ��������� ���������� TnsDayTipsDictCache }

procedure TnsDayTipsDictCacheFree;
 {* ����� ������������ ���������� ���������� TnsDayTipsDictCache }
begin
 l3Free(g_TnsDayTipsDictCache);
end;//TnsDayTipsDictCacheFree

function TnsDayTipsDictCache.DoGetRoot: INodeBase;
//#UC START# *5571C22C03A5_5571B3100338_var*
//#UC END# *5571C22C03A5_5571B3100338_var*
begin
//#UC START# *5571C22C03A5_5571B3100338_impl*
 defDataAdapter.NativeAdapter.MakeTipsManager.GetTipsTreeRoot(Result);
//#UC END# *5571C22C03A5_5571B3100338_impl*
end;//TnsDayTipsDictCache.DoGetRoot

class function TnsDayTipsDictCache.Instance: TnsDayTipsDictCache;
 {* ����� ��������� ���������� ���������� TnsDayTipsDictCache }
begin
 if (g_TnsDayTipsDictCache = nil) then
 begin
  l3System.AddExitProc(TnsDayTipsDictCacheFree);
  g_TnsDayTipsDictCache := Create;
 end;
 Result := g_TnsDayTipsDictCache;
end;//TnsDayTipsDictCache.Instance

class function TnsDayTipsDictCache.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsDayTipsDictCache <> nil;
end;//TnsDayTipsDictCache.Exists
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
