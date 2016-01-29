////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garant6x/implementation/Garant/GblAdapterLib/impl/DynamicTree_i/PHARM_CHAPTER_tree_factory.h"
// ��������� ������������ ������ ��� ������ ����������� (.h)
// Generated from UML model, root element: <<Servant::Class>> garant6x::GblAdapterLib::DynamicTree_i::PHARM_CHAPTER_tree
// �������� ���������� ������ ���������  ��� �������� PHARM_CHAPTER_tree
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __GARANT6X_GBLADAPTERLIB_DYNAMICTREE_I_PHARM_CHAPTER_TREE_FCTR_H__
#define __GARANT6X_GBLADAPTERLIB_DYNAMICTREE_I_PHARM_CHAPTER_TREE_FCTR_H__

#include "shared/CoreSrv/sys/std_inc.h"
#include "garant6x/implementation/Garant/GblAdapterLib/DynamicTree/DynamicTreeFactories.h"
#include "garant6x/implementation/Garant/GblAdapterLib/impl/DynamicTree_i/DynamicTree_i.h"

namespace GblAdapterLib {

/// Interface-factory implementation for PHARM_CHAPTER_tree
class PHARM_CHAPTER_tree_factory: virtual public ::Core::RefCountObjectBase, virtual public NodeBaseAbstractFactory {
public:
	PHARM_CHAPTER_tree_factory ();

	void registrate_me (Core::Root::FactoryPriority priority) /*throw (Core::Root::DuplicatedFactoryKey)*/;

protected:
	const char* key () const;

	NodeBase* make () /*throw (CanNotFindData)*/;

	NodeBase* make (FakeFacetForFactory* owner_tree, const GTree::Node& snode);

};

typedef ::Core::Var<PHARM_CHAPTER_tree_factory> PHARM_CHAPTER_tree_factory_var;

} // namespace GblAdapterLib


#endif //__GARANT6X_GBLADAPTERLIB_DYNAMICTREE_I_PHARM_CHAPTER_TREE_FCTR_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

