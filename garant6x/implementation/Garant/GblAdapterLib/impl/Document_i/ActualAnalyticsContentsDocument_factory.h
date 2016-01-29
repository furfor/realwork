////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garant6x/implementation/Garant/GblAdapterLib/impl/Document_i/ActualAnalyticsContentsDocument_factory.h"
// ��������� ������������ ������ ��� ������ ����������� (.h)
// Generated from UML model, root element: <<Servant::Class>> garant6x::GblAdapterLib::Document_i::ActualAnalyticsContentsDocument
// �������� ���������� ������ ���������  ��� �������� ActualAnalyticsContentsDocument
//
// ���-����������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __GARANT6X_GBLADAPTERLIB_DOCUMENT_I_ACTUALANALYTICSCONTENTSDOCUMENT_FCTR_H__
#define __GARANT6X_GBLADAPTERLIB_DOCUMENT_I_ACTUALANALYTICSCONTENTSDOCUMENT_FCTR_H__

#include "shared/CoreSrv/sys/std_inc.h"
#include "garant6x/implementation/Garant/GblAdapterLib/Document/DocumentFactories.h"

namespace GblAdapterLib {

/// Interface-factory implementation for ActualAnalyticsContentsDocument
class ActualAnalyticsContentsDocument_factory:
	virtual public ::Core::RefCountObjectBase
	, virtual public DocumentAbstractFactory
{
public:
	ActualAnalyticsContentsDocument_factory ();

	void registrate_me (Core::Root::FactoryPriority priority) /*throw (Core::Root::DuplicatedFactoryKey)*/;

protected:
	const FactoryKey key () const;

	Document* make (GblPilot::Document* document);

	Document* make (const GCD::PID& pid, bool is_edition, const char* name);

};

typedef ::Core::Var<ActualAnalyticsContentsDocument_factory> ActualAnalyticsContentsDocument_factory_var;

} // namespace GblAdapterLib


#endif //__GARANT6X_GBLADAPTERLIB_DOCUMENT_I_ACTUALANALYTICSCONTENTSDOCUMENT_FCTR_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

