////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garant6x/implementation/Garant/GblAdapterLib/impl/DynamicTree_i/PHARM_UNRECIPE_tree_factory.cpp"
// ��������� ������ ���������� ��� ������ ����������� (.cpp)
// Generated from UML model, root element: <<Servant::Class>> garant6x::GblAdapterLib::DynamicTree_i::PHARM_UNRECIPE_tree
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "shared/CoreSrv/sys/std_inc.h"
#include "garant6x/implementation/Garant/GblAdapterLib/impl/DynamicTree_i/PHARM_UNRECIPE_tree_factory.h"
#include "garant6x/implementation/Garant/GblAdapterLib/impl/DynamicTree_i/PHARM_UNRECIPE_tree.h"

namespace GblAdapterLib {

PHARM_UNRECIPE_tree_factory::PHARM_UNRECIPE_tree_factory () {
}

void PHARM_UNRECIPE_tree_factory::registrate_me (
	Core::Root::FactoryPriority priority
) /*throw (
	Core::Root::DuplicatedFactoryKey
)*/ {
	NodeBaseFactoryManager::register_factory (this, priority);
}

const char* PHARM_UNRECIPE_tree_factory::key () const {
	return AT_PHARM_UNRECIPE;
}

NodeBase* PHARM_UNRECIPE_tree_factory::make () /*throw (CanNotFindData)*/ {
	//#UC START# *45EEB95901C547E3C5D503A5_45F6694A01B5_IMPL*
	return make_tree_and_root (this->key ());
	//#UC END# *45EEB95901C547E3C5D503A5_45F6694A01B5_IMPL*
}

NodeBase* PHARM_UNRECIPE_tree_factory::make (FakeFacetForFactory* owner_tree, const GTree::Node& snode) {
	//#UC START# *45EEB95901C547E3C5D503A5_45FFF849002E_IMPL*
	GDS_ASSERT (false);
	return 0; // make_from_owner_tree (owner_tree, snode);
	//#UC END# *45EEB95901C547E3C5D503A5_45FFF849002E_IMPL*
}

} // namespace GblAdapterLib

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

