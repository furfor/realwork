////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/MDProcess/MDAFormat/ViewPartDef/RootPackage.cpp"
// ��������� ������ ���������� C++ (.cpp)
// Generated from UML model, root element: <<DataElement::Class>> MDProcess::MDAFormat::ViewPartDef::RootPackage
//
// �������� �������� ��������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "shared/Core/sys/std_inc.h"
#include "MDProcess/MDAFormat/ViewPartDef/RootPackage.h"


namespace MDAFormat {
namespace ViewPartDef {

std::ostream& operator << (std::ostream& out_stream, const RootPackage& item) {
	if (item.namespaces ().empty () == false) {
		NamespaceList::const_iterator it = item.get_namespaces ().begin ();
		NamespaceList::const_iterator it_end = item.get_namespaces ().end ();
		
		for (; it != it_end; ++it) {
			out_stream << **it << std::endl;
		}
		
	}
	out_stream << item.get_root () << std::endl;

	return out_stream;
}

//////////////////////////////////////////////////////////////////////////////////////////
// self data accessors
const NamespaceList& RootPackage::get_namespaces () const {
	//#UC START# *48AE51C70127_GET_ACCESSOR*
	return m_namespaces;
	//#UC END# *48AE51C70127_GET_ACCESSOR*
}

void RootPackage::set_namespaces (const NamespaceList& namespaces) {
	//#UC START# *48AE51C70127_SET_ACCESSOR*
	m_namespaces = namespaces;
	//#UC END# *48AE51C70127_SET_ACCESSOR*
}

const PackageDef& RootPackage::get_root () const {
	//#UC START# *48AE51EE01A0_GET_ACCESSOR*
	return m_root;
	//#UC END# *48AE51EE01A0_GET_ACCESSOR*
}

void RootPackage::set_root (const PackageDef& root) {
	//#UC START# *48AE51EE01A0_SET_ACCESSOR*
	m_root = root;
	//#UC END# *48AE51EE01A0_SET_ACCESSOR*
}

const std::string& RootPackage::get_file_name () const {
	return m_file_name;
}

void RootPackage::set_file_name (const std::string& file_name) {
	m_file_name = file_name;
}

} // namespace ViewPartDef
} // namespace MDAFormat


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

