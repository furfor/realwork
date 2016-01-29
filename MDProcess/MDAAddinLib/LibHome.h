////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/MDProcess/MDAAddinLib/LibHome.h"
// ��������� ������������ ������ C++ (.h)
// Generated from UML model, root element: <<Library::Category>> MDProcess::MDAAddinLib
//
// ����������� ������� ��� ������ ������� � Rose
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __MDPROCESS_MDAADDINLIB_H__
#define __MDPROCESS_MDAADDINLIB_H__

#include "shared/Core/sys/std_inc.h"
#include "shared/Core/impl/Root_i/StdLibHomeBase.h"

namespace MDAAddinLib {

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
	
	void print_usage () const;
	
	bool check_params () const;
};
} // namespace MDAAddinLib


#endif //__MDPROCESS_MDAADDINLIB_H__
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
