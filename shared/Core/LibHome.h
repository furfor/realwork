////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/shared/Core/LibHome.h"
// ��������� ������������ ������ C++ (.h)
// Generated from UML model, root element: <<Library::Category>> shared::Core
//
// ����. ��������� ������� ��������� ����� � �������. ������� ������������ � �������� ��� ���������
// � ������. �������� ��������� GCM2
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __SHARED_CORE_H__
#define __SHARED_CORE_H__

#include "shared/Core/sys/std_inc.h"
#include "shared/Core/impl/Root_i/StdLibHomeBase.h"

namespace Core {

class LibHomeFactory {
public:
	static Core::Root::LibHome& get ();
};

class LibHomeImpl : virtual public Core::Root_i::StdLibHomeBase {
	SET_OBJECT_COUNTER (LibHomeImpl)


private:
	friend class LibHomeFactory;
	
	REFCOUNT_SINGLETON(LibHomeImpl)
	
	LibHomeImpl ();

	void registrate_all_factories () const;
	
	void finalize ();
};
} // namespace Core


#endif //__SHARED_CORE_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
