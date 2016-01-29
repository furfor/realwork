//
// Base class description
//
// Author: Alex V. Boreskoff
//
/*
 * cvs id was here
 */

#ifndef	__BASE__
#define	__BASE__

#include "doccol.h"
#include "indices.h"
#include "document.h"
#include "basemsgs.h"

#define MAX_STATUS_DESK_SIZE	64

// base status values
#define	BS_OK               0  // base ok
#define	BS_FILESNULL        1  // one of the files is 0
#define	BS_FILESLOCKED      2
#define	BS_CANNOTOPENFILES  3  // one of the files was not opened
#define	BS_INVALIDSIGN      4  // signature is invalid
#define	BS_NOTOK            5  // one of the files is not Ok
#define	BS_DOCINDERROR      6  // error in docIndex
#define	BS_STREAMERROR      7  // error in stream file

// ops masks
#define	SM_VALOPS   	0x000F	// value ops mask
#define	SM_MRGOPS   	0x0B00	// merging ops mask

// value ops
#define	SV_LIST			0x0000	// list of items
#define	SV_RANGE		0x0001	// range [Item0, Item1]
#define	SV_LE			0x0002	// items in range (-inf, Item0]
#define	SV_GE			0x0003	// items in range [Item0, inf)
#define	SV_INIT			0x0005	// Specify operation with init collection
#define	SV_MBODIES		0x0009	// ����������, � ������
#define	SV_MTITLES		0x000A	// ����������, � ���������

// merging ops
#define	SO_OR			0x0000	// OR results
#define	SO_AND			0x0100	// AND results
#define	SO_MINUS		0x0200	// SUBtrack result
#define	SO_KEYS_AND		0x0400	// SUBtrack result
#define	SO_SMARTMINUS	0x0800

// other special ops flags
#define	OF_FIRSTTIME	0x0010

#define	MAX_BLOCKS	64
#define	MAX_RUNS	64

struct statusDesck {
	short status;
	char desck [MAX_STATUS_DESK_SIZE];
};

#define	SDT_UNKNOWN  0
#define SDT_DOCS	 1
#define SDT_REFS	 2
#define SDT_REFRELES 3
#define	SDT_CORRREFS 4

long GetDataType (Index*);
long GetDataType (const char* name);

struct EndedBlockHeader {
	long DocID;
	int runCount;
	int blockCount;
	int textPageCount;
	int blockParaCount;
	int ParaCount;
	unsigned short pos;
}__PACKED__;

#define MAX_NDT_DISK_COUNT 3

typedef struct G_OTHER_INDEX_TAG
{
	PagedFile* pKey;
	StreamFile* pStreamFile;
	int m_iFirstKeyHandleOnCD [MAX_NDT_DISK_COUNT];
	int m_iFirstStrHandleOnCD [MAX_NDT_DISK_COUNT];
} G_OTHER_INDEX, *LPG_OTHER_INDEX;

#if !defined(WIN32) && defined(_WINDOWS)
#else
	#define O_NOT_FAT       0x100000
#endif

class Base {
protected:
	virtual Index *makeMorphoIndex (::PagedFile* tf, const char* name, StreamFile* s);
	LPG_OTHER_INDEX OpenStreams (const char*, LPG_OTHER_INDEX pOther= 0);
	void initMultiIndex (const char*, int, int ndt_cache = -1);
public:
	int	m_iFirstCD;
	int m_iFirstKeyHandleOnCD [MAX_NDT_DISK_COUNT];
	int m_iFirstStrHandleOnCD [MAX_NDT_DISK_COUNT];

	LPG_OTHER_INDEX pOtherNextIndex, pOtherIndex;
	int bLoadFatInOpened;
	int curr_mode;
	virtual Index* FindIndexOther(const char *, LPG_OTHER_INDEX pOther= 0);
	virtual Index* FindIndex (const char *);
	Index* FindIndexFor (const char *, BTKEY key);
	Index* FindIndexFor (const char *, const char *key);
	virtual Index* FindBlobIndexFor (long id);
	virtual	int	IsCreateBase();
	virtual	StreamFile *make_StreamsPool(PagedFile *pFile, int bLoadFat);
	virtual void reConnectKeyAndStr (const char* name, int mode);
	long GetSizeInKbytes(int AsUnPacked= 0);
	int IsPagedFilesOk();
	void DeletePagedFiles(int Full= 0);
	virtual IGarDoc *GetGarDoc( long id, DocInfo *local_docInfo= 0 );
	Document* pDocFromCurrentRD;
	virtual bool check_version () { return true; }

	void not_del_attr () {
		m_not_del_attr = true;
	}
public:
	int	currentBlockSize;
	char *pDocsBlockBuffer, *pDocsBlockBufferOut;
	int countDocsBlockBuffer;

	EndedBlockHeader* m_docs_block;

	void flushShortBlocks ();
	void ClearAllTextInNextNewDocument () { clearAllTexts= 1; }

	int lastBlockPageFree;
	int clearAllTexts;
	long lastBlockPage;

	StrList* GetFileList ();

	PagedFile* keyFile;    // .key file
	PagedFile* strFile;    // .str file
	PagedFile* textFile;   // .ndt file
	StreamFile* streamFile;

	Index* subNames;
	Index* indTable [70];
	
	const char* strBaseStatus ();
	DocCollection* cacheAllDocs;
	DocCollection* cacheAllMDocs;
	DocCollection* cacheAllFDocs;

	char* utmp;
	char* new_docBuf;

	PageRun* new_runs;
	BlockRec* new_blocks;

	int indCount;
	int baseStatus;

	int max_runs;
	int max_blocks;

	std::map<long, std::pair<std::string, std::string> > baseInfos;

	Base ();
	virtual ~Base ();

	virtual int	IsOk();					// check whether all is ok
	virtual int IsPacked();
	virtual int IsOkWithoutText();

	int32_t CheckReady (int16_t sUtilId);
	int32_t SetReady (int16_t sUtilId);
	int32_t GetReady ();

	long FindBaseInfo(int no, BaseInfo& ); // get base record with given no
	long ReplaceBaseInfo (int id, BaseInfo*);  // replase BaseInfo if it exsist (by max)

	RevInfo* LoadRevInfo (int &iCount);	// return array of structures contains seg's name and rev

	virtual long GetDocCount (); // return sum of data count in index Status by key DC_ACTIVE & DC_ABOLISHED
	virtual int FindDocAttr (long Id, int Tag, void * buf, int size);
	virtual Document* GetDoc (long Doc, const DocInfo* p_DocInfo = 0); // creates Document object
	virtual Base* FindBaseForDoc (long Doc) {return this;};

	int FindDocInfo (long docId, DocInfo&);
	virtual int FindDocName (long Id, char * buf);	// returns size of name
	virtual int FindSubName (long Id, long sub, char * buf);// returns size of name
	int FindDoc     (long Id);			// return true if document present
	int DelDoc      (long Doc);
	int DelText     (long Doc, PageRun* runs = 0, long RunCount = 0, BlockRec* blocks = 0, long BlockCount = 0);
	int RenameDoc   (long fromId, long toId);

	DocCollection* get_cache_all_docs ();  // returns list of all documents (active or abolished)
	DocCollection* AllDocs ();             // returns list of all documents (active or abolished)
	DocCollection* AllMDocs ();            // returns list of all inpharm documents
	DocCollection* AllTopics (long borderId = 0, int aIterator = 0); // returns list of all topics
	DocCollection* inpharm_medtopics ();
	DocCollection* inpharm_firmtopics ();
	RefCollection* get_all_drugs_with_forms ();

	long find_firm (const char*);
	RefCollection* find_drugs (const char*);

   	long SubToPara (Ref& ref);             // convert SubId to para's position in doc

	char* GetDealerInfo (long& lSize);	// return dilller defined string. Free mem after use!

	short IsBaseOn1CD() { return (((PagedFileHeader *)textFile->SystemPageBuf)->TomPerPages == 0); }
	int GetDocTmNumber(long Id); //  0 - doc body on First Tom or Not CD maping
								 //  1 - doc body on Second Tom
								 //  2 - doc body on Third Tom
								 //  0 > - not find document in base

	int GetObjTmNumber();		 //  0 - Object in Str-sub-File
								 //  1 - obj body on First Tom
								 //  2 - obj body on Second Tom
								 //  3 - obj body on Third Tom
								 // -1 - not find object in base

	int FillSmallInfoDoc( long Id, char* &aName, char** &aSegNames, short& aSegs, int aRussian = 1 );

protected:
	void FreeIndices ();

public:
	virtual	void InitProgress( long aTotal, int* aState );
	virtual	void ShowCheckedProgress( long );
	virtual	void DoneProgress();

public:
	static const int dfKeyFileSize;
	static const int dfStrFileSize;
	static const int dfNdtFileSize;

	void gk_huge* LoadExRuns (long DocId, long& size, Stream **ppRet) {
		return docInd->LoadEx(DocId, IDD_RUNS, size, ppRet);
	}
	void gk_huge* LoadExBlocks (long DocId, long& size, Stream **ppRet) {
		return docInd->LoadEx(DocId, IDD_BLOCKS, size, ppRet);
	}

	int	PutAttr (long DocId, int tag, const void* data, int size) {
		return docInd->Put (DocId, tag, data, size);
	}
	int DelAttr (long DocId, int tag) {
		return docInd->Del (DocId, tag);
	}

	void CloseAtrrStr (Stream* s) {
		docInd->Close (s);
	}

	//void LoadRunsBlocks (long DocId, long& size_runs, long& size_blocks, std::pair <void gk_huge*, void gk_huge*> &data);

	virtual void gk_huge* LoadAttr (long DocId, int tag, long& size) {
		return docInd->Load (DocId, tag, size);
	}

	virtual int LoadAttr (long DocId, int tag, DBCore::Storable& storable) {
		return docInd->Load (DocId, tag, storable);
	}
	void gk_huge* LoadAttr (Stream*str, long& size) {
		return docInd->Load (str, size);
	}
	virtual int	ReplaceAttr (long DocId, int tag, void* buf, int size) {
		return docInd->Replace (DocId, tag, buf, size);
	}

	Stream* AttrKeyOpen (BTKEY k, int sn);

	virtual void gk_huge* LoadAttrEx (long DocId, int tag, long& size) {
		if (!docInd2) docInd2 = (AttrIndex*) FindIndex ("Attribs");
		return docInd2->Load (DocId, tag, size);
	}
	int	ReplaceAttrEx (long DocId, int tag, void* buf, int size) {
		if (!docInd2) docInd2 = (AttrIndex*) FindIndex ("Attribs");
		return docInd2->Replace (DocId, tag, buf, size);
	}

	int NewPageOnText () {
		return textFile->NewPage ();
	}

	bool isAnnoPresent ();
	bool is_consulting_present ();
	bool is_translation_present (long docid);
	bool is_samedocs_presents (long);

	long GetClientInfo ();
	char* GetPersInfo ();

	long translation_topic (long docid);
	
	DocCollection* docs_wo_class ();
	DocCollection* docs_wo_key ();
	DocCollection* anonced_wo_included ();

	virtual void createIndices ();

protected:
	AttrIndex* docInd;
	AttrIndex* docInd2;
#if (!(defined(MIN_MEM_CONTEXT)) && !(defined(BRDR32)))
	virtual PagedFile *makePagedFile(const char * name, int mode);
#endif

private:
	bool m_not_del_attr;

	Index*	index_aux;

	/*
protected:
	void	LoadRunsBlocksCache ();
	void	FreeRunsBlocksCache ();
	*/
public:
	static const char m_SubNamesName[12];
	static const char m_SWordsName[11];
	static const char m_CorrNewName[12];

	static const char m_SubNamesExt[5];
	static const char m_SWordsExt[5];
protected:
	virtual LPG_OTHER_INDEX checkOtherFiles(const char *, LPG_OTHER_INDEX);
};

//////////////////////////////////////////////////////////////////////////////////////////////

struct DataDestructor {
	static inline void destroy (void* p) {
		if (p) {
			gk_free (p);
			p = 0;
		}
	}
};

struct BufDestructor {
	static inline void destroy (void* p) {
		if (p) {
			ACE_OS::free (p);
			p = 0;
		}
	}
};

#define INDEX_DATA(TYPE) Core::Aptr <TYPE, DataDestructor>

class IndexLoader {
public:
	IndexLoader (Base* base) : m_base (base) {
	}

	template <typename T>
	T* load (long doc_id, int tag, long& size, bool is_array = true) {
		Core::Aptr <T, DataDestructor> ret;
		size = 0;

		if (m_base) {
			if (tag == IDD2_PARAIDS) {
				ret = (T*)m_base->LoadAttrEx (doc_id, tag, size);
			} else {
				ret = (T*)m_base->LoadAttr (doc_id, tag, size);
			}

			if (is_array) {
				size = size / sizeof (T);
			} 
		}

		return ret._retn ();
	}

private:
	Base* m_base;
};

IndexReq* build_req (Base *base, const char* index_name, std::vector<std::string>& keys, bool &b_inpharm);
IndexReq* build_morpho_req (std::vector<std::string>& keys, short search_op);

std::vector<std::string> get_base_files (Base *base);

#endif
