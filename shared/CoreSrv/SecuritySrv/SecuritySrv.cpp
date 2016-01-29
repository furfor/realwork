
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/shared/CoreSrv/SecuritySrv/SecuritySrv.cpp"
// ��������� ������ ���������� C++ (.cpp)
// Generated from UML model, root element: <<ServerInterfaces::Category>> shared::CoreSrv::SecuritySrv
//
// ��������� �������������� ���������� ���������� ������������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "shared/CoreSrv/sys/std_inc.h"
#include "shared/CoreSrv/SecuritySrv/SecuritySrv.h"
#include "shared/CoreSrv/LibHome.h"

namespace CoreSrv {
namespace SecuritySrv {

Core::Mutex SessionManagerFactory::s_init_mutex;
bool SessionManagerFactory::s_renew_mode = false;
Core::Mutex SessionManagerFactory::s_mutex_for_get;
CORBA::ULong SessionManagerFactory::s_cached_object_hash_for_get = 0;


// ���������� ���������� ��������� ������
SessionManager& SessionManagerFactory::get () /*throw (CoreSrv::NoActiveFactory)*/ {
	if (FactoryManagerSrvSingleton::instance()->ptr() == 0) {
		GUARD (s_init_mutex);
		if (FactoryManagerSrvSingleton::instance()->ptr() == 0) {
			try {
				CORBA::Object_var obj = CoreSrv::resolve_path (&LibHomeFactory::get().get_orb_facet().get_ns_root(), "CoreSrv::SecuritySrv::SessionManager");
				*FactoryManagerSrvSingleton::instance() = SessionManagerFactoryManagerSrv::_narrow (obj);
			} CATCH_AND_LOG ("COS Naming can't find FactoryManagerSrv for SessionManager");
		}
		if (FactoryManagerSrvSingleton::instance()->ptr() == 0) {
			throw CoreSrv::NoActiveFactory ();
		}
	}
	try {

		bool created_new = false; //���� � ���, ��� ������ ��� ������, � �� ������� �� ����
		if (CachedObjectForGet::instance()->ptr() == 0) {
			GUARD(s_mutex_for_get);
			if (CachedObjectForGet::instance()->ptr() == 0) {
				*CachedObjectForGet::instance() = (*FactoryManagerSrvSingleton::instance())->get ();
				s_cached_object_hash_for_get = (*CachedObjectForGet::instance())->_hash (std::numeric_limits<CORBA::ULong>::max ());
				created_new = true;
			}
		}
		if (created_new == false) {
			//���� ������ �������� �� ���� - ����� ���������, ��� �� �������
			bool need_recreate = false;
			try {
				need_recreate = CachedObjectForGet::instance()->ptr()->_non_existent ();
			} catch (...) {
				need_recreate = true;
			}
			if (need_recreate) {
				GUARD(s_mutex_for_get);
				*CachedObjectForGet::instance() = 0;
				*CachedObjectForGet::instance() = (*FactoryManagerSrvSingleton::instance())->get ();
				s_cached_object_hash_for_get = (*CachedObjectForGet::instance())->_hash (std::numeric_limits<CORBA::ULong>::max ());
			}
		}
		return *CachedObjectForGet::instance()->ptr();
	} catch (CORBA::TRANSIENT& ) {
		if (s_renew_mode) {
			s_renew_mode = false;
			LOG_W (("SessionManagerFactoryManagerSrv is in invalid (inactive) state"));
			throw CoreSrv::NoActiveFactory ();
		}
		GUARD (s_init_mutex);
		LOG_D (("Try to renew SessionManagerFactoryManagerSrv"));
		
		s_renew_mode = true;
		(*FactoryManagerSrvSingleton::instance()) = 0;
		SessionManager& ret = get ();
		s_renew_mode = false;
		
		return ret;
	}
}


} // namespace SecuritySrv
} // namespace CoreSrv

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

