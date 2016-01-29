////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/shared/GSI/impl/NotifyService_i/ProxyConsumer.h"
// ��������� ������������ ������ C++ (.h)
// Generated from UML model, root element: <<SimpleClass::Class>> shared::GSI::NotifyService_i::ProxyConsumer
//
// �������������� ���������� ���������, ������� ����� � �������� �����������. ������ ���������
// ��������:
// 1. ������-��� ������ ���� ����� �������� ���������� ����� ���� ��������� (����: �������
// ��������� - ���� ����, ����� ������ ��� �������)
// 2.  ���� ������ ���� ���������� �� ������� ������, �� ��� ��������� � ����� ������ ��������� -
// ���������� ��������. � ��� ��� �� ����� ������� �� �� �����, �.�. ������ ���������� �����
// m_mutex, �� ��������� ����������� � ����� ��������� ����� ������ ����� ���� ����� �������� �
// ���������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __SHARED_GSI_NOTIFYSERVICE_I_PROXYCONSUMER_H__
#define __SHARED_GSI_NOTIFYSERVICE_I_PROXYCONSUMER_H__

#include "shared/CoreSrv/sys/std_inc.h"

namespace GSI {
namespace NotifyService_i {

class Consumer_i;
// �������������� ���������� ���������, ������� ����� � �������� �����������. ������ ���������
// ��������:
// 1. ������-��� ������ ���� ����� �������� ���������� ����� ���� ��������� (����: �������
// ��������� - ���� ����, ����� ������ ��� �������)
// 2.  ���� ������ ���� ���������� �� ������� ������, �� ��� ��������� � ����� ������ ��������� -
// ���������� ��������. � ��� ��� �� ����� ������� �� �� �����, �.�. ������ ���������� �����
// m_mutex, �� ��������� ����������� � ����� ��������� ����� ������ ����� ���� ����� �������� �
// ���������.
class ProxyConsumer;
typedef Core::Var<ProxyConsumer> ProxyConsumer_var;
typedef Core::Var<const ProxyConsumer> ProxyConsumer_cvar;

class ProxyConsumer :
	virtual public Core::RefCountObjectBase
{
	SET_OBJECT_COUNTER (ProxyConsumer)
//////////////////////////////////////////////////////////////////////////////////////////
// constructors and destructor
public:
	// �����������, � ������� ����� ����������� � �������� �����������
	explicit ProxyConsumer (Consumer_i* consumer);

public:
	virtual ~ProxyConsumer ();

//////////////////////////////////////////////////////////////////////////////////////////
// self methods
public:
	// ������� ���������� ���������� ��� ��������� ���������� ���������
	virtual void push_event (const CORBA::Any& event);

	// ���������� ��������� ��������� �� ����������� ���������
	virtual void stop_listen ();

//////////////////////////////////////////////////////////////////////////////////////////
// self data
private:
	Core::Mutex m_mutex;

	Consumer_i* m_real_consumer;
}; // class ProxyConsumer

} // namespace NotifyService_i
} // namespace GSI


#endif //__SHARED_GSI_NOTIFYSERVICE_I_PROXYCONSUMER_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

