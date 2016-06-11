(*
 * This code was generated by the TaskGen tool from file
 *   "ILINK32Task.xml"
 * Version: 24.0.0.0
 * Runtime Version: v2.0.50727
 * Changes to this file may cause incorrect behavior and will be
 * overwritten when the code is regenerated.
 *)

unit ILinkStrs;

interface

const

	sTaskName = 'ilink32';
	sLibraryPath = 'ILINK_LibraryPath';
	sSysLibraryPath = 'ILINK_SysLibraryPath';
	sSysRoot = 'ILINK_SysRoot';
	sFrameworks = 'ILINK_Frameworks';

	// ILINKOutputParameters
	sOutputFileName = 'ILINK_OutputFileName';
	sMapFileName = 'ILINK_MapFileName';

	// ILINKPaths
	sObjectSearchPath = 'ILINK_ObjectSearchPath';
	sIntermediateOutputPath = 'ILINK_IntermediateOutputPath';
	sBpiLibOutputDir = 'ILINK_BpiLibOutputDir';

	// ILINKLinking
	sImageChecksum = 'ILINK_ImageChecksum';
	sAdditionalOptions = 'ILINK_AdditionalOptions';
	sFastTLS = 'ILINK_FastTLS';
	sReplaceResources = 'ILINK_ReplaceResources';
	sClearState = 'ILINK_ClearState';
	sCaseSensitive = 'ILINK_CaseSensitive';
	sVerbose = 'ILINK_Verbose';
	sDelayLoadDll = 'ILINK_DelayLoadDll';
	sSymbolsToExport = 'ILINK_SymbolsToExport';
	siOSMinimumVersion = 'ILINK_iOSMinimumVersion';
	sLinkwithSQL = 'ILINK_LinkwithSQL';
	sLinkwithIntebaseTogo = 'ILINK_LinkwithIntebaseTogo';
	sLinkwithMidas = 'ILINK_LinkwithMidas';
	sLinkwithSSLandCrypto = 'ILINK_LinkwithSSLandCrypto';
	sLinkwithZLib = 'ILINK_LinkwithZLib';
	sLinkwithSQLite = 'ILINK_LinkwithSQLite';
	sLinkwithIndy = 'ILINK_LinkwithIndy';
	sLinkwithRegEx = 'ILINK_LinkwithRegEx';
	sLinkwithDUnitXRuntime = 'ILINK_LinkwithDUnitXRuntime';
	sAdditionalLinkerFiles = 'ILINK_AdditionalLinkerFiles';
	sFileAlignment = 'ILINK_FileAlignment';
	sObjectAlignment = 'ILINK_ObjectAlignment';
	sFullDebugInfo = 'ILINK_FullDebugInfo';
	sGenerateMapFile = 'ILINK_GenerateMapFile';
	sRemoveTmpLnkFile = 'ILINK_RemoveTmpLnkFile';
	sGenerateImportLibrary = 'ILINK_GenerateImportLibrary';
	sGenerateLibFile = 'ILINK_GenerateLibFile';
	sGenerateDRC = 'ILINK_GenerateDRC';
	sDisableIncrementalLinking = 'ILINK_DisableIncrementalLinking';
	sMaxErrors = 'ILINK_MaxErrors';
	sSuppressBanner = 'ILINK_SuppressBanner';
	sKeepOutputFiles = 'ILINK_KeepOutputFiles';
	sDisplayTime = 'ILINK_DisplayTime';

	// ILINKInternalOptions
	sFilenameAlias = 'ILINK_FilenameAlias';

	// ILINKTargetOptions
	sAppType = 'ILINK_AppType';
		sAppType_Console = 'Console';
		sAppType_Windows = 'Windows';
		sAppType_DeviceDriver = 'DeviceDriver';
	sWinAppType = 'ILINK_WinAppType';
		sWinAppType_Executable = 'Executable';
		sWinAppType_DLL = 'DLL';
		sWinAppType_Package = 'Package';

	// ILINKOutput
	sMapWithMangledNames = 'ILINK_MapWithMangledNames';
	sMapFileType = 'ILINK_MapFileType';
		sMapFileType_Segments = 'Segments';
		sMapFileType_Publics = 'Publics';
		sMapFileType_DetailedSegments = 'DetailedSegments';
		sMapFileType_None = 'None';
	sBaseAddress = 'ILINK_BaseAddress';
	sHeapReserveSize = 'ILINK_HeapReserveSize';
	sHeapCommitSize = 'ILINK_HeapCommitSize';
	sStackReserveSize = 'ILINK_StackReserveSize';
	sStackCommitSize = 'ILINK_StackCommitSize';
	sDescription = 'ILINK_Description';
	sImageComment = 'ILINK_ImageComment';
	sSectionFlags = 'ILINK_SectionFlags';
	sImageFlags = 'ILINK_ImageFlags';
	sOSVersion = 'ILINK_OSVersion';
	sUserVersion = 'ILINK_UserVersion';

	// ILINKPackageOptions
	sPackageType = 'ILINK_PackageType';
		sPackageType_Runtime = 'Runtime';
		sPackageType_Designtime = 'Designtime';
		sPackageType_Both = 'Both';
	sPackageBaseName = 'ILINK_PackageBaseName';

	// ILINKWarnings
	sAllWarnings = 'ILINK_AllWarnings';
	sDisableWarnings = 'ILINK_DisableWarnings';
	sSelectedWarnings = 'ILINK_SelectedWarnings';
	swexp = 'ILINK_wexp';
	swrty = 'ILINK_wrty';
	swdup = 'ILINK_wdup';
	swdpl = 'ILINK_wdpl';
	swnou = 'ILINK_wnou';
	swuld = 'ILINK_wuld';
	swsrd = 'ILINK_wsrd';
	swdee = 'ILINK_wdee';
	swsnf = 'ILINK_wsnf';
	// Outputs
	sOutput_OutputFile = 'OutputFile';
	sOutput_StateFiles = 'StateFiles';
	sOutput_MapFile = 'MapFile';
	sOutput_SymbolFile = 'SymbolFile';
	sOutput_ImportLibrary = 'ImportLibrary';
	sOutput_PackageStaticLibrary = 'PackageStaticLibrary';

implementation

end.
