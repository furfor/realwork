////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garant6x/implementation/Garant/GblAdapterLib/impl/Search_i/QueryCreator_i_factory.h"
// ��������� ������������ ������ ��� ������ ����������� (.h)
// Generated from UML model, root element: <<Servant::Class>> garant6x::GblAdapterLib::Search_i::QueryCreator_i
// �������� ���������� ������ ��������� QueryCreator ��� �������� QueryCreator_i
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __GARANT6X_GBLADAPTERLIB_SEARCH_I_QUERYCREATOR_I_FCTR_H__
#define __GARANT6X_GBLADAPTERLIB_SEARCH_I_QUERYCREATOR_I_FCTR_H__

#include "shared/CoreSrv/sys/std_inc.h"
#include "garant6x/implementation/Garant/GblAdapterLib/Search/SearchFactories.h"
#include "garant6x/implementation/Garant/GblAdapterLib/impl/Search_i/Search_i.h"

namespace GblAdapterLib {

/// Interface-factory implementation for QueryCreator_i
class QueryCreator_i_factory: virtual public ::Core::RefCountObjectBase, virtual public QueryCreatorAbstractFactory {
public:
	QueryCreator_i_factory ();

	void registrate_me (Core::Root::FactoryPriority priority) /*throw (Core::Root::DuplicatedFactoryKey)*/;

protected:
	const char* key () const;

	QueryCreator* make ();

};

typedef ::Core::Var<QueryCreator_i_factory> QueryCreator_i_factory_var;

} // namespace GblAdapterLib


#endif //__GARANT6X_GBLADAPTERLIB_SEARCH_I_QUERYCREATOR_I_FCTR_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

