////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/garantPIL/implementation/component/cpp/garantCore/MorphoAdapter/MorphoAdapter.cpp"
// ��������� ������ ���������� C++ (.cpp)
// Generated from UML model, root element: <<AdapterTarget::Category>> garantCore::MorphoAdapter
//
// Dll ����������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "shared/Core/sys/start_stop.h"
#include "shared/Core/sys/std_inc.h"
#include "garantCore/MorphoAdapter/MorphoAdapter.h"
#include "shared/Core/GDS/MemoryWatcher.h"
#include "shared/Core/GDS/ObjectWatcher.h"	
#include "shared/Core/impl/Root_i/StdLibHomeManager_factory.h"
#include "shared/Core/impl/ParamsImpl/ParamManagerImpl_factory.h"
#include "shared/GCI/I18N/I18N.h"
#include "shared/GCI/impl/I18N_i/Environment.h"
#include "shared/GCI/impl/I18N_i/GarantWinLocaleOperations_factory.h"
#include "shared/GCI/impl/I18N_i/PosixLocaleOperations_factory.h"
#include "shared/GCI/LibHome.h"
#include "shared/GCL/LibHome.h"
#include "garantCore/MorphoAdapterLib/LibHome.h"
#include "shared/Morpho/LibHome.h"
#include "shared/GCL/LibHome.h"
#include "shared/DB/LibHome.h"



namespace MorphoAdapter {
	Core::Mutex DllInintializator::s_init_mutex;
	unsigned long DllInintializator::s_count = 0;
	
	void DllInintializator::init (unsigned long client_version, const char* locale_string) {
		GUARD (s_init_mutex);
		if (s_count++ != 0) {
			return;
		}
		Core::init ();
		{
			Core::Root_i::StdLibHomeManager_factory_var f = new Core::Root_i::StdLibHomeManager_factory ();
			f->registrate_me(0);
		}
		{
			Core::ParamsImpl::ParamManagerImpl_factory_var f = new Core::ParamsImpl::ParamManagerImpl_factory ();
			f->registrate_me(0);
		}
		
		{
			#if defined (WIN32)
				GCI::I18N_i::GarantWinLocaleOperations_factory_var fctr = new GCI::I18N_i::GarantWinLocaleOperations_factory ();
				fctr->registrate_me(0);
			#else
				GCI::I18N_i::PosixLocaleOperations_factory_var fctr = new GCI::I18N_i::PosixLocaleOperations_factory ();
				fctr->registrate_me(0);
			#endif
		}
		try {
			Core::ParamManagerInitData init = {"MorphoAdapter", "Core::RegistryHelper::KEY_LOCAL_MACHINE\\Software\\Garant\\garantCore\\MorphoAdapter"};
			Core::ParamManagerFactory::get ().init (Core::ParamConvert::make_arg_list (0, 0), init);
		} CATCH_AND_LOG ("while init ParamManager executed")
		Core::Root::LibHomeManager& lhm = Core::Root::LibHomeManagerFactory::get();
	
		lhm.registrate_lib_home (&GCL::LibHomeFactory::get ());
		lhm.registrate_lib_home (&GCI::LibHomeFactory::get ());
		lhm.registrate_lib_home (&DB::LibHomeFactory::get ());
		lhm.registrate_lib_home (&Morpho::LibHomeFactory::get ());
		lhm.registrate_lib_home (&MorphoAdapterLib::LibHomeFactory::get ());

		GCI::I18N_i::Environment::set_default_locale (GCI::I18N::SL_RU_CP1251);
		GCI::I18N::SupportedLocales locale = GCI::I18N::LocaleOperationsFactory::make ().string_to_locale (locale_string);
		GCI::I18N::LocaleOperationsFactory::make ().set_locale (locale);
		
		if (dll_version () != client_version) {
			Core::Root::WrongVersion ex (client_version, dll_version ());
			LOG_D (("%s: %s", GDS_CURRENT_FUNCTION, ex.what ()));
			throw ex;
		}
		try {
			lhm.execute ();
		} CATCH_AND_LOG ("while HomeManager processed")
	}
	
	void DllInintializator::done () {
		GUARD (s_init_mutex);
		if (--s_count != 0) {
			return;
		}
		Core::Root::LibHomeManager& lhm = Core::Root::LibHomeManagerFactory::get();
		lhm.finalize ();

		Core::fini ();
	}

} //namespace MorphoAdapter
extern "C" __declspec (dllexport) void __stdcall dll_init (unsigned long client_version) {
_DLL_TRY
	MorphoAdapter::DllInintializator::init (client_version, "ru");
_DLL_CATCH
}

extern "C" __declspec (dllexport) void __stdcall dll_init_with_locale (unsigned long client_version, const char* locale_string) {
_DLL_TRY
	MorphoAdapter::DllInintializator::init (client_version, locale_string);
_DLL_CATCH
}

extern "C" __declspec (dllexport) void __stdcall dll_done () {
_DLL_TRY
	MorphoAdapter::DllInintializator::done ();
_DLL_CATCH
}

extern "C" __declspec (dllexport) void __stdcall dll_get_root(
	MorphoAdapter::Root*& root
) {
_DLL_TRY
	root = MorphoAdapter::Root::Singleton::instance();
	root->addref ();
_DLL_CATCH
}
extern "C" __declspec (dllexport) unsigned long __stdcall dll_version () {
	return 11;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
