//
// Main.cpp : Defines the entry point for the console application.
//

#include "ace/ACE.h"

#include <iostream>

#include "shared/Core/sys/AutoInit.h"
#include "shared/Core/sys/start_stop.h"
#include "shared/Core/ParamsHelper/ParamConvert.h"

#include "shared/ContextSearch/impl/Manage_i/RequestTransformer_i_factory.h"
#include "shared/ContextSearch/impl/Manage_i/Query_i_factory.h"
#include "shared/ContextSearch/impl/Manage_i/SynManager_i_factory.h"
#include "shared/ContextSearch/impl/Manage_i/ViewAsParts_i_factory.h"
#include "shared/ContextSearch/impl/Manage_i/ViewAsSequence_i_factory.h"
#include "shared/ContextSearch/impl/Manage_i/ViewAsSimple_i_factory.h"

#include "garantServer/src/Global/Core/Common/ParamManagerReg.h"
#include "garantServer/src/Global/Defines/Common/ProjectConsts.h"

#include "RequestTransformer.h"

enum ExecuteStatus { es_Success, es_Error };

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// FactoryRegistrator implementation

class FactoryRegistrator {
public:
	static void execute () {
		FactoryRegistrator::registrate <ContextSearch::Manage_i::RequestTransformer_i_factory> ();
		FactoryRegistrator::registrate <ContextSearch::Manage_i::Query_i_factory> ();
		FactoryRegistrator::registrate <ContextSearch::Manage_i::SynManager_i_factory> ();
		FactoryRegistrator::registrate <ContextSearch::Manage_i::ViewAsParts_i_factory> ();
		FactoryRegistrator::registrate <ContextSearch::Manage_i::ViewAsSimple_i_factory> ();
		FactoryRegistrator::registrate <ContextSearch::Manage_i::ViewAsSequence_i_factory> ();
	}

private:
	template <typename Type>
	static void registrate () {
		Core::Var <Type> obj = new Type ();
		obj->registrate_me (0);
	}
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Executor implementation

class Executor {
public:
	Executor (int argc, char* argv []) {
		Core::ParamManagerInitData id;
		id.application_name = "RequestTransform";
		id.registry_subkey = "Core::RegistryHelper::KEY_CURRENT_USER\\";

		Core::ParamManagerReg::instance ();
		Core::ParamManagerFactory::get ().init (Core::ParamConvert::make_arg_list (argc, argv), id);	

		if (Core::ParamManagerFactory::get ().is_exist ("-in")) {
			m_in = Core::ParamManagerFactory::get ().get_string ("-in");
		}

		if (Core::ParamManagerFactory::get ().is_exist ("-out")) {
			m_out = Core::ParamManagerFactory::get ().get_string ("-out");
		}

		if (Core::ParamManagerFactory::get ().is_exist ("-path")) {
			m_path = Core::ParamManagerFactory::get ().get_string ("-path");
		}

		std::cout 
			<< std::endl
			<< "RequestTransform "
			<< "("
			<< __DATE__
			<< ", "
			<< __TIME__
			<< ")"
			<< std::endl
			<< std::endl;

		std::string default_path = argv [0];

		const char* slash = ACE_OS_String::strrchr (default_path.c_str (), '\\');

		if (slash) {
			size_t pos = default_path.find (slash);

			if (pos != std::string::npos) {
				default_path = default_path.substr (0, pos);
			}

			if (m_in.empty ()) {
				m_in = default_path;
			}

			if (m_out.empty ()) {
				m_out = default_path;
			}
		}

		std::cout << "in  : " << m_in   << std::endl;
		std::cout << "out : " << m_out  << std::endl;
		std::cout << "path: " << m_path << std::endl;

		std::cout 
			<< std::endl 
			<< "---------------------------------------------" 
			<< std::endl 
			<< std::endl;
	}

	virtual ~Executor () {
	}

	void execute () {
		if (m_path.empty ()) {
			LOG_E (("Path to base is not initialized", GDS_CURRENT_FUNCTION));
			return;
		}

		try {
			Core::GDS::StopWatch sw ("total");
			FactoryRegistrator::execute ();

			RequestTransform::RequestTransformer obj (m_path);
			obj.execute (m_in, m_out);

		} catch (...) {
			LOG_UEX (("%s", GDS_CURRENT_FUNCTION));
			throw std::exception ();
		}

		std::cout << std::endl;
	}

public:
	std::string m_in;
	std::string m_out;
	std::string m_path;
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////

int main (int argc, char* argv []) {
	Core::AutoInit init;

	ExecuteStatus ret = es_Success;

	try {
		Executor (argc, argv).execute ();
	} catch (...) {
		std::cout << std::endl << "Abnormal canceled.." << std::endl << std::endl;
		ret = es_Error;
	}

	return (int) ret;
}

//-in "C:\in.txt" -out "C:\out.txt" -path "C:\Program Files\Garant\data2\data"
