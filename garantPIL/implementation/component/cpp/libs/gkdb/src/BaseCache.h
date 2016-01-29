//
// BaseCache.h : header file
//

#ifndef __BASE_CACHE_H
#define __BASE_CACHE_H

#include "shared/Core/sys/std_inc.h"
#include "shared/Morpho/Def/Def.h"

#include "DBComm.h"

typedef std::map <unsigned long, GCL::StrVector> MorphoHashes;
typedef std::map <std::string, std::string> TypingErrors;
typedef std::map <std::string, std::vector <long> > RequestCacheOffset;
typedef std::map <long, std::set <long> > DocDataMap;
typedef std::map <long, std::pair <std::string, std::string> > BaseInfoMap;

class BaseCache {
	typedef ACE_Singleton <BaseCache, ACE_SYNCH_RECURSIVE_MUTEX> Singleton;
	friend class ACE_Singleton <BaseCache, ACE_SYNCH_RECURSIVE_MUTEX>;

public:
	static BaseCache* instance () {
		return Singleton::instance ();
	}

public:
	BaseCache ();

	virtual ~BaseCache ();

public:
	const GCL::StrSet& get_good_words (Base* base);
	const MorphoHashes& get_morpho_hashes (Base* base);
	const TypingErrors& get_typing_errors (Base* base);

	const BaseInfoMap& get_map_baseinfos (Base *base);

	const DocDataMap& get_map_doc_edis (Base* base);
	const RequestCacheOffset& get_request_cache_offset (Base* base);

	const std::vector <short>& get_here_seg (Base* base);
	const std::vector <short>& get_ignore_segs (Base* base);

	Morpho::Def::ICache* get_morpho_cache_ptr ();
	Morpho::Def::INormalizer* make (DBCore::IBase* base);

	long get_short_list_size (Base* base);

	void init_protected_para (Base* base);
	void release ();

private:
	char* load_aux (Base* base, const void* key, long& size);

private:
	typedef Core::Aptr <char, Core::ArrayDeleteDestructor <char> > Buffer;

	Core::Mutex m_find_in_cache_mutex;
	Core::Mutex m_morpho_hashes_mutex;
	Core::Mutex m_typing_errors_mutex;
	Core::Mutex m_mutex;

	GCL::StrSet m_good_words;

	MorphoHashes m_morpho_hashes;
	TypingErrors m_typing_errors;

	Morpho::Def::ICache_var m_cache;

	std::vector <short> m_here_segs;
	std::vector <short> m_ignore_segs;

	BaseInfoMap m_map_baseinfos;
	DocDataMap m_map_doc_edis;
	RequestCacheOffset m_request_cache_offset;

	long m_short_list_size;

	bool is_protected_para_init;
};

#endif // __BASE_CACHE_H
