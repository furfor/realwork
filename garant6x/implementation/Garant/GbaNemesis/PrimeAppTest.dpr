program PrimeAppTest;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\PrimeAppTest.dpr"
// ���������: "VCMTestTarget"
// ������� ������: "Prime" MUID: (51237FE1009D)

{$Include w:\garant6x\implementation\Garant\GbaNemesis\nsDefine.inc}

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(Monitorings)}
uses
 l3IntfUses
 , l3ImplUses
 {$If Defined(Nemesis)}
 , nsApplication
 {$IfEnd} // Defined(Nemesis)
 , l3ExceptionsLog in 'w:\common\components\rtl\Garant\L3\l3ExceptionsLog.pas'
 {$If NOT Defined(NoScripts)}
 , ObjectFromstackWords in 'w:\common\components\rtl\Garant\ScriptEngine\ObjectFromstackWords.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwClassLike in 'w:\common\components\rtl\Garant\ScriptEngine\tfwClassLike.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRegisterableWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRegisterableWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRegisterableWordPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRegisterableWordPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptingInterfaces in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptingInterfaces.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3Interfaces in 'w:\common\components\rtl\Garant\L3\l3Interfaces.pas'
 , ActiveX {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\ActiveX.pas' {$EndIf}
 , Windows {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\Windows.pas' {$EndIf}
 , Types
 , l3Core in 'w:\common\components\rtl\Garant\L3\l3Core.pas'
 , Messages {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\Messages.pas' {$EndIf}
 , Graphics {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Graphics.pas' {$EndIf}
 , Classes {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\Classes.pas' {$EndIf}
 , SysUtils
 {$If NOT Defined(NoScripts)}
 , TtfwTypeRegistrator_Proxy in 'w:\common\components\rtl\Garant\ScriptEngine\TtfwTypeRegistrator_Proxy.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ComponentsProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\ComponentsProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , TypInfo {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\TypInfo.pas' {$EndIf}
 {$If NOT Defined(NoScripts)}
 , tfwPropertyLike in 'w:\common\components\rtl\Garant\ScriptEngine\tfwPropertyLike.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypeInfo in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypeInfo.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptingExceptions in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptingExceptions.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy in 'w:\common\components\rtl\Garant\ScriptEngine\TtfwClassRef_Proxy.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , TypeInfoPack in 'w:\common\components\rtl\Garant\ScriptEngine\TypeInfoPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwGlobalKeyWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwGlobalKeyWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordPrimPrim in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordPrimPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwSourcePointWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwSourcePointWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwKeyWordPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwKeyWordPrim.pas'
 , l3Variant in 'w:\common\components\rtl\Garant\L3\l3Variant.pas'
 , l3Variants in 'w:\common\components\rtl\Garant\L3\l3Variants.pas'
 , l3Types in 'w:\common\components\rtl\Garant\L3\l3Types.pas'
 , l3DataContainerWithoutIUnknownPrim in 'w:\common\components\rtl\Garant\L3\l3DataContainerWithoutIUnknownPrim.pas'
 , l3CastablePersistent in 'w:\common\components\rtl\Garant\L3\l3CastablePersistent.pas'
 , l3PureMixIns in 'w:\common\components\rtl\Garant\L3\l3PureMixIns.pas'
 , l3IID in 'w:\common\components\rtl\Garant\L3\l3IID.pas'
 , l3Base in 'w:\common\components\rtl\Garant\L3\l3Base.pas'
 , l3_Base in 'w:\common\components\rtl\Garant\L3\l3_Base.pas'
 , l3SimpleObject in 'w:\common\components\rtl\Garant\L3\l3SimpleObject.pas'
 , l3ProtoObjectWithCOMQI in 'w:\common\components\rtl\Garant\L3\l3ProtoObjectWithCOMQI.pas'
 , l3ProtoObject in 'w:\common\components\rtl\Garant\L3\l3ProtoObject.pas'
 , l3CastableObject in 'w:\common\components\rtl\Garant\L3\l3CastableObject.pas'
 , l3MemUtils in 'w:\common\components\rtl\Garant\L3\l3MemUtils.pas'
 , Refcounted in 'w:\common\components\rtl\Garant\L3\Refcounted.pas'
 , l3MemorySizeUtils in 'w:\common\components\rtl\Garant\L3\l3MemorySizeUtils.pas'
 , l3MemorySizeUtilsPrim in 'w:\common\components\rtl\Garant\L3\l3MemorySizeUtilsPrim.pas'
 , l3Interlocked in 'w:\common\components\rtl\Garant\L3\l3Interlocked.pas'
 , l3InterfacesMisc in 'w:\common\components\rtl\Garant\L3\l3InterfacesMisc.pas'
 , l3ObjectRefList1 in 'w:\common\components\rtl\Garant\L3\l3ObjectRefList1.pas'
 , l3ProtoDataContainer in 'w:\common\components\rtl\Garant\L3\l3ProtoDataContainer.pas'
 , l3Memory in 'w:\common\components\rtl\Garant\L3\l3Memory.pas'
 , l3BaseStream in 'w:\common\components\rtl\Garant\L3\l3BaseStream.pas'
 , l3InternalInterfaces in 'w:\common\components\rtl\Garant\L3\l3InternalInterfaces.pas'
 , l3Units in 'w:\common\components\rtl\Garant\L3\l3Units.pas'
 , l3PrinterInterfaces in 'w:\common\components\rtl\Garant\L3\l3PrinterInterfaces.pas'
 , l3ProtoDataContainerWithCOMQI in 'w:\common\components\rtl\Garant\L3\l3ProtoDataContainerWithCOMQI.pas'
 , l3Except in 'w:\common\components\rtl\Garant\L3\l3Except.pas'
 , l3MinMax in 'w:\common\components\rtl\Garant\L3\l3MinMax.pas'
 , RTLConsts {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\RTLConsts.pas' {$EndIf}
 , l3_String in 'w:\common\components\rtl\Garant\L3\l3_String.pas'
 , l3CustomString in 'w:\common\components\rtl\Garant\L3\l3CustomString.pas'
 , l3BMSearch in 'w:\common\components\rtl\Garant\L3\l3BMSearch.pas'
 , l3String in 'w:\common\components\rtl\Garant\L3\l3String.pas'
 , l3StringEx in 'w:\common\components\rtl\Garant\L3\l3StringEx.pas'
 , l3StringAdapter in 'w:\common\components\rtl\Garant\L3\l3StringAdapter.pas'
 , l3Chars in 'w:\common\components\rtl\Garant\L3\l3Chars.pas'
 , l3CProtoObject in 'w:\common\components\rtl\Garant\L3\l3CProtoObject.pas'
 , l3ObjectsMemoryManager in 'w:\common\components\rtl\Garant\L3\l3ObjectsMemoryManager.pas'
 , l3SimpleMemoryManager in 'w:\common\components\rtl\Garant\L3\l3SimpleMemoryManager.pas'
 , l3SimpleMemoryManagerPrim in 'w:\common\components\rtl\Garant\L3\l3SimpleMemoryManagerPrim.pas'
 , SyncObjs {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\SyncObjs.pas' {$EndIf}
 , l3TwoByteCString in 'w:\common\components\rtl\Garant\L3\l3TwoByteCString.pas'
 {$If NOT Defined(NoScripts)}
 , tfwIl3CStringPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIl3CStringPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIteratableParent in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIteratableParent.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIteratableParentPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIteratableParentPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwSafeArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwSafeArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwArray in 'w:\common\components\rtl\Garant\ScriptEngine\tfwArray.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStoredValuesStack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStoredValuesStack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryPrimPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPrimPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryPrimPrimPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPrimPrimPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStoredValues in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStoredValues.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledVar in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledVar.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordPrim in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordRefList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordRefList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwThreadVar in 'w:\common\components\rtl\Garant\ScriptEngine\tfwThreadVar.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwThreadVarPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwThreadVarPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordWorkerEx in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordWorkerEx.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordWorker in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordWorker.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwAnonimousWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwAnonimousWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwCompilingWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCompilingWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwAutoregisteredDiction in 'w:\common\components\rtl\Garant\ScriptEngine\tfwAutoregisteredDiction.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStandardDictionary in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStandardDictionary.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryEx in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryEx.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryExPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryExPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionary in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionary.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , Math {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\Math.pas' {$EndIf}
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMembersIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMembersIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMembersIteratorPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMembersIteratorPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngineExInterfaces in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptEngineExInterfaces.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryPtrList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPtrList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwStreamFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStreamFactory.pas'
 {$If NOT Defined(NoScripts)}
 , tfwInitCodeWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwInitCodeWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwForwardDeclarationHolder in 'w:\common\components\rtl\Garant\ScriptEngine\kwForwardDeclarationHolder.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwInitedDictionariesList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwInitedDictionariesList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryExWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryExWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwAxiomaticsResNameGetter in 'w:\common\components\rtl\Garant\ScriptEngine\tfwAxiomaticsResNameGetter.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwAxiomaticsResNameGetters in 'w:\common\components\rtl\Garant\ScriptEngine\tfwAxiomaticsResNameGetters.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwAxiomaticsResNameGetterList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwAxiomaticsResNameGetterList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryDataIteratorPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryDataIteratorPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwExportedDictionariesIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwExportedDictionariesIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryPtrListIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPtrListIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwUsedDictionariesIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwUsedDictionariesIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3DateSt in 'w:\common\components\rtl\Garant\L3\l3DateSt.pas'
 {$If Defined(seCacheDict) AND NOT Defined(NoScripts)}
 , tfwMainDictionaryCache in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMainDictionaryCache.pas'
 {$IfEnd} // Defined(seCacheDict) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMainDictionaryList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMainDictionaryList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMainDictionary in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMainDictionary.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMainDictionaryWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMainDictionaryWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptingTypes in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptingTypes.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueTypes in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypes.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypeInfoList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypeInfoList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypeInfoListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypeInfoListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueTypesCache in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypesCache.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueTypesList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypesList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueTypesListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypesListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueTypesWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypesWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwCStringFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringFactory.pas'
 , tfwCStringList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringList.pas'
 , tfwCStringListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringListPrim.pas'
 , tfwCStringArraySing in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringArraySing.pas'
 , tfwCStringArray in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringArray.pas'
 , tfwCStringArraySing2 in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCStringArraySing2.pas'
 {$If Defined(seCacheDict) AND NOT Defined(NoScripts)}
 , tfwDictionaryCache in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryCache.pas'
 {$IfEnd} // Defined(seCacheDict) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryCachePrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryCachePrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwKeywordsIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwKeywordsIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStandardDictionaries in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStandardDictionaries.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStandardDictionaryList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStandardDictionaryList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStandardDictionaryListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStandardDictionaryListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3Parser in 'w:\common\components\rtl\Garant\L3\l3Parser.pas'
 , l3ProtoPersistent in 'w:\common\components\rtl\Garant\L3\l3ProtoPersistent.pas'
 {$If NOT Defined(NoScripts)}
 , kwCompiledWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwRuntimeWordWithCodeExecution in 'w:\common\components\rtl\Garant\ScriptEngine\kwRuntimeWordWithCodeExecution.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwRuntimeWordWithCode in 'w:\common\components\rtl\Garant\ScriptEngine\kwRuntimeWordWithCode.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwLeftParam in 'w:\common\components\rtl\Garant\ScriptEngine\kwLeftParam.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwInteger in 'w:\common\components\rtl\Garant\ScriptEngine\kwInteger.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwString in 'w:\common\components\rtl\Garant\ScriptEngine\kwString.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3ParserInterfaces in 'w:\common\components\rtl\Garant\L3\l3ParserInterfaces.pas'
 {$If NOT Defined(NoScripts)}
 , kwIntegerFactory in 'w:\common\components\rtl\Garant\ScriptEngine\kwIntegerFactory.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwIntegerArray in 'w:\common\components\rtl\Garant\ScriptEngine\kwIntegerArray.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwIntegerList in 'w:\common\components\rtl\Garant\ScriptEngine\kwIntegerList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwStringFactory in 'w:\common\components\rtl\Garant\ScriptEngine\kwStringFactory.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwStringList in 'w:\common\components\rtl\Garant\ScriptEngine\kwStringList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwStringListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\kwStringListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , StrUtils {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\StrUtils.pas' {$EndIf}
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordWorker in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorker.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwTemporaryCompiledCode in 'w:\common\components\rtl\Garant\ScriptEngine\kwTemporaryCompiledCode.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordWorkerEx in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorkerEx.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , m2HasLib in 'w:\common\components\rtl\Garant\L3\m2\m2HasLib.pas'
 {$If NOT Defined(NoScripts)}
 , tfwHash16Table in 'w:\common\components\rtl\Garant\ScriptEngine\tfwHash16Table.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3OneByteCString in 'w:\common\components\rtl\Garant\L3\l3OneByteCString.pas'
 , l3CEmptyStringPrim in 'w:\common\components\rtl\Garant\L3\l3CEmptyStringPrim.pas'
 , l3CEmptyString in 'w:\common\components\rtl\Garant\L3\l3CEmptyString.pas'
 , l3FourByteCString in 'w:\common\components\rtl\Garant\L3\l3FourByteCString.pas'
 , l3Const in 'w:\common\components\rtl\Garant\L3\l3Const.pas'
 , k2BaseTypes in 'w:\common\components\rtl\Garant\L3\k2BaseTypes.pas'
 , l3Date in 'w:\common\components\rtl\Garant\L3\l3Date.pas'
 {$If NOT Defined(NoScripts)}
 , tfwStandardDictionaryListIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStandardDictionaryListIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwInitedDictionariesListIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwInitedDictionariesListIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryListIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryListIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordsIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordsIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , VarWorkingPack in 'w:\common\components\rtl\Garant\ScriptEngine\VarWorkingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwConst in 'w:\common\components\rtl\Garant\ScriptEngine\tfwConst.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwConstLike in 'w:\common\components\rtl\Garant\ScriptEngine\tfwConstLike.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwNewWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwNewWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwForwardDeclaration in 'w:\common\components\rtl\Garant\ScriptEngine\kwForwardDeclaration.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwClassRef in 'w:\common\components\rtl\Garant\ScriptEngine\tfwClassRef.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypeModifier in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypeModifier.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwModifier in 'w:\common\components\rtl\Garant\ScriptEngine\kwModifier.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRTTIProperty in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRTTIProperty.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwEnumRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwEnumRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwEnumConstantRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwEnumConstantRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIntegerConstantRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIntegerConstantRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwInteger in 'w:\common\components\rtl\Garant\ScriptEngine\tfwInteger.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRegisteredEnums in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRegisteredEnums.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRTTITypeInfoList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRTTITypeInfoList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIntegerToEnumName in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIntegerToEnumName.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStringToEnumValue in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStringToEnumValue.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypeRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypeRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwInterfaceRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwInterfaceRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwStringConstantRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStringConstantRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwString in 'w:\common\components\rtl\Garant\ScriptEngine\tfwString.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwConstLikeCompiled in 'w:\common\components\rtl\Garant\ScriptEngine\kwConstLikeCompiled.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3Math in 'w:\common\components\rtl\Garant\L3\l3Math.pas'
 , l3EtalonsWorking in 'w:\common\components\rtl\Garant\L3\l3EtalonsWorking.pas'
 , tfwParserInterfaces in 'w:\common\components\rtl\Garant\ScriptEngine\tfwParserInterfaces.pas'
 {$If NOT Defined(NoScripts)}
 , tfwWordInfoWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordInfoWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwParserService in 'w:\common\components\rtl\Garant\ScriptEngine\tfwParserService.pas'
 , l3StringList in 'w:\common\components\rtl\Garant\L3\l3StringList.pas'
 , l3StringList2 in 'w:\common\components\rtl\Garant\L3\l3StringList2.pas'
 , l3StringList1 in 'w:\common\components\rtl\Garant\L3\l3StringList1.pas'
 , l3StringListPrim in 'w:\common\components\rtl\Garant\L3\l3StringListPrim.pas'
 , l3ProtoPersistentDataContainer in 'w:\common\components\rtl\Garant\L3\l3ProtoPersistentDataContainer.pas'
 , l3Filer in 'w:\common\components\rtl\Garant\L3\l3Filer.pas'
 , l3ProgressComponent in 'w:\common\components\rtl\Garant\L3\l3ProgressComponent.pas'
 , l3InterfacedComponent in 'w:\common\components\rtl\Garant\L3\l3InterfacedComponent.pas'
 , l3FilerRes in 'w:\common\components\rtl\Garant\L3\l3FilerRes.pas'
 , l3StringIDEx in 'w:\common\components\rtl\Garant\L3\l3StringIDEx.pas'
 , l3ConstStrings in 'w:\common\components\rtl\Garant\L3\l3ConstStrings.pas'
 , l3ConstStrings1 in 'w:\common\components\rtl\Garant\L3\l3ConstStrings1.pas'
 , l3Stream in 'w:\common\components\rtl\Garant\L3\l3Stream.pas'
 , tfwParserServiceFileNameToFileNameMap in 'w:\common\components\rtl\Garant\ScriptEngine\tfwParserServiceFileNameToFileNameMap.pas'
 , IniFiles {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\IniFiles.pas' {$EndIf}
 , l3FileUtils in 'w:\common\components\rtl\Garant\L3\l3FileUtils.pas'
 {$If NOT Defined(NoScripts)}
 , tfwCS in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCS.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ArrayProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\ArrayProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwBeginLikeWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwBeginLikeWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBeginLikeCompiledCode in 'w:\common\components\rtl\Garant\ScriptEngine\kwBeginLikeCompiledCode.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCloseBracket in 'w:\common\components\rtl\Garant\ScriptEngine\kwCloseBracket.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwRevertedArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwRevertedArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwFilteredArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwFilteredArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwLambdedArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwLambdedArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwMappedArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwMappedArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIteratorFromFunctor in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIteratorFromFunctor.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwJoinIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwJoinIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTruncatedArrayView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTruncatedArrayView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwSliceView in 'w:\common\components\rtl\Garant\ScriptEngine\tfwSliceView.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , BasicsPack in 'w:\common\components\rtl\Garant\ScriptEngine\BasicsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3MessagesService in 'w:\common\components\rtl\Garant\L3\l3MessagesService.pas'
 {$If NOT Defined(NoScripts)}
 , kwValue in 'w:\common\components\rtl\Garant\ScriptEngine\kwValue.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwWordPtrPushWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwWordPtrPushWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwWordPtrWorker in 'w:\common\components\rtl\Garant\ScriptEngine\kwWordPtrWorker.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , FileProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\FileProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3TextSearch in 'w:\common\components\rtl\Garant\L3\l3TextSearch.pas'
 {$If NOT Defined(NoScripts)}
 , SysUtilsPack in 'w:\common\components\rtl\Garant\ScriptEngine\SysUtilsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3TabService in 'w:\common\components\rtl\Garant\L3\l3TabService.pas'
 , l3SysUtils in 'w:\common\components\rtl\Garant\L3\l3SysUtils.pas'
 , JclSysInfo {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\source\common\JclSysInfo.pas' {$EndIf}
 , DateUtils {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\DateUtils.pas' {$EndIf}
 {$If NOT Defined(NoVCL)}
 , Forms {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Forms.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , Controls {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Controls.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , ActnList {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ActnList.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ContainedActionsWordspack in 'w:\common\components\rtl\Garant\ScriptEngine\ContainedActionsWordspack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , CustomActionWordpack in 'w:\common\components\rtl\Garant\ScriptEngine\CustomActionWordpack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ActionListWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ActionListWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ControlsProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\ControlsProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , Menus {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Menus.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , MenuWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\MenuWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3ScreenService in 'w:\common\components\rtl\Garant\L3\l3ScreenService.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwBynameControlPush in 'w:\common\components\rtl\Garant\ScriptEngine\kwBynameControlPush.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwControlWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwControlWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3CloseFormHelper in 'w:\common\components\rtl\Garant\L3\l3CloseFormHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3FormsService in 'w:\common\components\rtl\Garant\L3\l3FormsService.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3PopupMenuHelper in 'w:\common\components\rtl\Garant\L3\l3PopupMenuHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3ControlFontService in 'w:\common\components\rtl\Garant\L3\l3ControlFontService.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , FontWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\FontWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , WinControlsProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\WinControlsProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ScrollingWinControlWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ScrollingWinControlWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ScrollInfoProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\ScrollInfoProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwPopControlScrollInfo in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopControlScrollInfo.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwScrollInfoWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwScrollInfoWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWinControlFromStackWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwWinControlFromStackWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , kwComponentFromStackWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwComponentFromStackWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwObjectFromStackWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwObjectFromStackWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwPopControlScrollInfoMin in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopControlScrollInfoMin.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwPopControlScrollInfoMax in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopControlScrollInfoMax.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwPopControlScrollInfoPageSize in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopControlScrollInfoPageSize.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwPopControlScrollInfoPosition in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopControlScrollInfoPosition.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , FormsProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\FormsProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3ObjectList in 'w:\common\components\rtl\Garant\L3\l3ObjectList.pas'
 , l3SimpleDataContainer in 'w:\common\components\rtl\Garant\L3\l3SimpleDataContainer.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , CustomFormProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\CustomFormProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , Clipbrd {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Clipbrd.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Utils in 'w:\common\components\rtl\Garant\L3\l3Utils.pas'
 , l3CStringDataObject in 'w:\common\components\rtl\Garant\L3\l3CStringDataObject.pas'
 , l3StorableDataObject in 'w:\common\components\rtl\Garant\L3\l3StorableDataObject.pas'
 , l3DataObject in 'w:\common\components\rtl\Garant\L3\l3DataObject.pas'
 , l3LongintList in 'w:\common\components\rtl\Garant\L3\l3LongintList.pas'
 , l3LongintListPrim in 'w:\common\components\rtl\Garant\L3\l3LongintListPrim.pas'
 , l3DataObjectEnum in 'w:\common\components\rtl\Garant\L3\l3DataObjectEnum.pas'
 , ShlObj {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\ShlObj.pas' {$EndIf}
 {$If NOT Defined(NoScripts)}
 , tfwWordDeleteListeners in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordDeleteListeners.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ItfwWordListenerList in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwWordListenerList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , WordsRTTIPack in 'w:\common\components\rtl\Garant\ScriptEngine\WordsRTTIPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seWordsInfo in 'w:\common\components\rtl\Garant\ScriptEngine\seWordsInfo.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwCodeIterator in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCodeIterator.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordContainer in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordContainer.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwDualCompiledWordContainer in 'w:\common\components\rtl\Garant\ScriptEngine\kwDualCompiledWordContainer.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordWorkerWordRunner in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorkerWordRunner.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordWorkerWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorkerWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledWordWorkerWordPack in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorkerWordPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledIfElse in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledIfElse.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledIF in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledIF.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordBoxPack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordBoxPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , KeyWordPack in 'w:\common\components\rtl\Garant\ScriptEngine\KeyWordPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordInfoCache in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordInfoCache.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordInfoList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordInfoList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwWordInfoListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwWordInfoListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , NewWordDefinitorPack in 'w:\common\components\rtl\Garant\ScriptEngine\NewWordDefinitorPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ItfwKeywordFinderWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwKeywordFinderWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ItfwCompilerWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwCompilerWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopClassInherits in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopClassInherits.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3RTTI in 'w:\common\components\rtl\Garant\L3\l3RTTI.pas'
 {$If NOT Defined(NoVCL) AND NOT Defined(XE)}
 , ControlResizeBugFix
 {$IfEnd} // NOT Defined(NoVCL) AND NOT Defined(XE)
 {$If NOT Defined(Admin)}
 , MonitoringsRes in 'w:\garant6x\implementation\Garant\GbaNemesis\MonitoringsRes.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , ShellAndMonitoringsRes in 'w:\garant6x\implementation\Garant\GbaNemesis\View\ShellAndMonitoringsRes.pas'
 {$IfEnd} // NOT Defined(Admin)
 , PrimF1Res in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimF1Res.pas'
 , F1LikeRes in 'w:\common\components\gui\Garant\VCM\View\F1LikeRes.pas'
 {$If NOT Defined(NoVCM)}
 , OfficeLikeRes in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLikeRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmApplication in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmApplication.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces in 'w:\common\components\gui\Garant\VCM\vcmExternalInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , afwInterfaces in 'w:\common\components\gui\Garant\AFW\afwInterfaces.pas'
 , afwTypes in 'w:\common\components\gui\Garant\AFW\afwTypes.pas'
 {$If NOT Defined(NoVCL)}
 , ImgList {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ImgList.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , l3TreeInterfaces in 'w:\common\components\rtl\Garant\L3\l3TreeInterfaces.pas'
 {$If NOT Defined(NoVCM)}
 , vcmBaseOperationState in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseOperationState.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModule in 'w:\common\components\gui\Garant\VCM\implementation\vcmModule.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBase in 'w:\common\components\gui\Garant\VCM\implementation\vcmBase.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmStringIDExHelper in 'w:\common\components\gui\Garant\VCM\implementation\vcmStringIDExHelper.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces in 'w:\common\components\gui\Garant\VCM\vcmInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormDispatcherInterfaces in 'w:\common\components\gui\Garant\VCM\vcmFormDispatcherInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUserControls in 'w:\common\components\gui\Garant\VCM\vcmUserControls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseTypes in 'w:\common\components\gui\Garant\VCM\vcmBaseTypes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormSetFormItemList in 'w:\common\components\gui\Garant\VCM\vcmFormSetFormItemList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , l3TabbedContainersDispatcher in 'w:\common\components\rtl\Garant\L3\l3TabbedContainersDispatcher.pas'
 , afwFacade in 'w:\common\components\gui\Garant\AFW\afwFacade.pas'
 , l3KeyboardLayoutService in 'w:\common\components\rtl\Garant\L3\l3KeyboardLayoutService.pas'
 , afwSettingsImplSing in 'w:\common\components\gui\Garant\AFW\afwSettingsImplSing.pas'
 , afwSettingsImplPersistent in 'w:\common\components\gui\Garant\AFW\afwSettingsImplPersistent.pas'
 , afwSettingsImpl in 'w:\common\components\gui\Garant\AFW\afwSettingsImpl.pas'
 , afwSettingsImplPrim in 'w:\common\components\gui\Garant\AFW\afwSettingsImplPrim.pas'
 , afwSettingsImplPrimPrim in 'w:\common\components\gui\Garant\AFW\afwSettingsImplPrimPrim.pas'
 , l3InterfacedString in 'w:\common\components\rtl\Garant\L3\l3InterfacedString.pas'
 , l3NCString in 'w:\common\components\rtl\Garant\L3\l3NCString.pas'
 , afwSettingsImplemented in 'w:\common\components\gui\Garant\AFW\afwSettingsImplemented.pas'
 , afwSettings in 'w:\common\components\gui\Garant\AFW\afwSettings.pas'
 , afwSettingsPrimPrim in 'w:\common\components\gui\Garant\AFW\afwSettingsPrimPrim.pas'
 , afwAString in 'w:\common\components\gui\Garant\AFW\afwAString.pas'
 , l3VCLStrings in 'w:\common\components\rtl\Garant\L3\l3VCLStrings.pas'
 , l3VCLStringsItems in 'w:\common\components\rtl\Garant\L3\l3VCLStringsItems.pas'
 , l3CastableStrings in 'w:\common\components\rtl\Garant\L3\l3CastableStrings.pas'
 , afwSettingsChangePublisher in 'w:\common\components\gui\Garant\AFW\afwSettingsChangePublisher.pas'
 , afwSettingsChangePublisherPrim in 'w:\common\components\gui\Garant\AFW\afwSettingsChangePublisherPrim.pas'
 , IafwSettingListenerPtrList in 'w:\common\components\gui\Garant\AFW\IafwSettingListenerPtrList.pas'
 , IafwSettingsReplaceListenerPtrList in 'w:\common\components\gui\Garant\AFW\IafwSettingsReplaceListenerPtrList.pas'
 , l3CClassList in 'w:\common\components\rtl\Garant\L3\l3CClassList.pas'
 , l3ClassList in 'w:\common\components\rtl\Garant\L3\l3ClassList.pas'
 {$If NOT Defined(NoVCM)}
 , vcmMakeParams in 'w:\common\components\gui\Garant\VCM\implementation\vcmMakeParams.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModuleContractImplementation in 'w:\common\components\gui\Garant\VCM\implementation\vcmModuleContractImplementation.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseMenuManager in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmBaseMenuManager.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseOperationsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseOperationsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationParams in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmOperationParams.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmPrimCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmPrimCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseOperationStates in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseOperationStates.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmActiveControlsCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmActiveControlsCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmAction in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmAction.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(XE)}
 , Actions {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\Actions.pas' {$EndIf}
 {$IfEnd} // Defined(XE)
 {$If NOT Defined(NoVCM)}
 , vcmInternalConst in 'w:\common\components\gui\Garant\VCM\implementation\vcmInternalConst.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntitiesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmEntitiesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , OvcCmd in 'w:\common\components\rtl\external\Orpheus\OvcCmd.pas'
 , OvcController in 'w:\common\components\rtl\external\Orpheus\OvcController.pas'
 {$If NOT Defined(NoVCM)}
 , vcmModulesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmModulesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseEntitiesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseEntitiesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseOperationsCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseOperationsCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationDefList in 'w:\common\components\gui\Garant\VCM\implementation\vcmOperationDefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmOperationsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmTargetedControlsCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmTargetedControlsCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmRepositoryEx in 'w:\common\components\gui\Garant\VCM\implementation\vcmRepositoryEx.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntitiesCollectionItemEntity in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmEntitiesCollectionItemEntity.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmControlsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmControlsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseEntityDef in 'w:\common\components\gui\Garant\VCM\implementation\vcmBaseEntityDef.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationableIdentifiedUserFriendly in 'w:\common\components\gui\Garant\VCM\implementation\vcmOperationableIdentifiedUserFriendly.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModuleDef in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmModuleDef.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOVCCommands in 'w:\common\components\gui\Garant\VCM\implementation\vcmOVCCommands.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmCommandIDsListPrim in 'w:\common\components\gui\Garant\VCM\implementation\vcmCommandIDsListPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmCommandIDsList in 'w:\common\components\gui\Garant\VCM\implementation\vcmCommandIDsList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModuleAction in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmModuleAction.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityAction in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmEntityAction.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmActiveControlsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmActiveControlsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseOperationDef in 'w:\common\components\gui\Garant\VCM\implementation\vcmBaseOperationDef.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUtils in 'w:\common\components\gui\Garant\VCM\implementation\vcmUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmRepOperationsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmRepOperationsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObjectRefList in 'w:\common\components\rtl\Garant\L3\l3ProtoObjectRefList.pas'
 {$If NOT Defined(NoVCM)}
 , vcmBaseEntities in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseEntities.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmComponent in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmComponent.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseEntitiesCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseEntitiesCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntitiesDefList in 'w:\common\components\gui\Garant\VCM\implementation\vcmEntitiesDefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntities in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmEntities.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmStringCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmStringCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModulesCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmModulesCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , tfwModuleOperationWordEx in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\tfwModuleOperationWordEx.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , tfwModuleOperationWord in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\tfwModuleOperationWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormsCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmFormsCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessagesCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmMessagesCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmPopupMenuPrim in 'w:\common\components\gui\Garant\VCM\vcmPopupMenuPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(XE)}
 , ToolsAPI {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Toolsapi\ToolsAPI.pas' {$EndIf}
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , DesignIntf {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Toolsapi\DesignIntf.pas' {$EndIf}
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , DesignMenus {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Toolsapi\DesignMenus.pas' {$EndIf}
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(NoVCM)}
 , vcmMenuItemClickListenerList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenuItemClickListenerList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuManagerTypes in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenuManagerTypes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenus in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenus.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmRepEntitiesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmRepEntitiesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmEntityForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityFormModelPart in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmEntityFormModelPart.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUserInteractiveForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmUserInteractiveForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Forms in 'w:\common\components\rtl\Garant\L3\l3Forms.pas'
 {$If NOT Defined(NoVCM)}
 , vcmGUI in 'w:\common\components\gui\Garant\VCM\vcmGUI.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , Dialogs {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Dialogs.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , l3MessageID in 'w:\common\components\rtl\Garant\L3\l3MessageID.pas'
 , Pl3StringIDExList in 'w:\common\components\rtl\Garant\L3\Pl3StringIDExList.pas'
 , Pl3MessageIDList in 'w:\common\components\rtl\Garant\L3\Pl3MessageIDList.pas'
 , Pl3MessageIDListPrim in 'w:\common\components\rtl\Garant\L3\Pl3MessageIDListPrim.pas'
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene)}
 , vcmDialogs in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmDialogs.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene)
 , evCustomEditorWindow in 'w:\common\components\gui\Garant\Everest\evCustomEditorWindow.pas'
 , evCustomEditorWindowPrim in 'w:\common\components\gui\Garant\Everest\evCustomEditorWindowPrim.pas'
 , nevControl in 'w:\common\components\gui\Garant\Everest\nevControl.pas'
 , afwControl in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwControl.pas'
 , afwBaseControl in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwBaseControl.pas'
 , afwControlPrim in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwControlPrim.pas'
 , OvcBase in 'w:\common\components\rtl\external\Orpheus\OvcBase.pas'
 , l3WinControlCanvas in 'w:\common\components\rtl\Garant\L3\l3WinControlCanvas.pas'
 , l3ControlCanvas in 'w:\common\components\rtl\Garant\L3\l3ControlCanvas.pas'
 , l3Canvas in 'w:\common\components\rtl\Garant\L3\l3Canvas.pas'
 , l3CanvasPrim in 'w:\common\components\rtl\Garant\L3\l3CanvasPrim.pas'
 , l3RectList in 'w:\common\components\rtl\Garant\L3\l3RectList.pas'
 , l3Region in 'w:\common\components\rtl\Garant\L3\l3Region.pas'
 , l3Defaults in 'w:\common\components\rtl\Garant\L3\l3Defaults.pas'
 , l3CacheableBase in 'w:\common\components\rtl\Garant\L3\l3CacheableBase.pas'
 , l3CanvasUtils in 'w:\common\components\rtl\Garant\L3\l3CanvasUtils.pas'
 , l3ScreenIC in 'w:\common\components\rtl\Garant\L3\l3ScreenIC.pas'
 , l3LogFont in 'w:\common\components\rtl\Garant\L3\l3LogFont.pas'
 , l3FontManager in 'w:\common\components\rtl\Garant\L3\l3FontManager.pas'
 , l3FontManagerPrim in 'w:\common\components\rtl\Garant\L3\l3FontManagerPrim.pas'
 , l3FontManagerPrimPrim in 'w:\common\components\rtl\Garant\L3\l3FontManagerPrimPrim.pas'
 , l3FontTools in 'w:\common\components\rtl\Garant\L3\l3FontTools.pas'
 , l3FormattedLines in 'w:\common\components\rtl\Garant\L3\l3FormattedLines.pas'
 , l3LineArray in 'w:\common\components\rtl\Garant\L3\l3LineArray.pas'
 , l3VirtualCanvas in 'w:\common\components\rtl\Garant\L3\l3VirtualCanvas.pas'
 , l3Bitmap in 'w:\common\components\rtl\Garant\L3\l3Bitmap.pas'
 {$If Defined(l3Requires_m0)}
 , m2XLtLib in 'w:\common\components\rtl\Garant\L3\m2\m2XLtLib.pas'
 {$IfEnd} // Defined(l3Requires_m0)
 , l3FrameLines in 'w:\common\components\rtl\Garant\L3\l3FrameLines.pas'
 , l3FrameObjectList in 'w:\common\components\rtl\Garant\L3\l3FrameObjectList.pas'
 , l3FrameObject in 'w:\common\components\rtl\Garant\L3\l3FrameObject.pas'
 , l3CoordinateMap in 'w:\common\components\rtl\Garant\L3\l3CoordinateMap.pas'
 , l3FrameLineList in 'w:\common\components\rtl\Garant\L3\l3FrameLineList.pas'
 , l3FrameLine in 'w:\common\components\rtl\Garant\L3\l3FrameLine.pas'
 , l3UnitsTools in 'w:\common\components\rtl\Garant\L3\l3UnitsTools.pas'
 , l3InterfacedIntegerList in 'w:\common\components\rtl\Garant\L3\l3InterfacedIntegerList.pas'
 , l3ProtoIntegerList in 'w:\common\components\rtl\Garant\L3\l3ProtoIntegerList.pas'
 , l3FrameLinesSpy in 'w:\common\components\rtl\Garant\L3\l3FrameLinesSpy.pas'
 {$If NOT Defined(NoVCL)}
 , StdCtrls {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\StdCtrls.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , RadioButtonWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\RadioButtonWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , vtComboBoxWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\vtComboBoxWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , vtComboTree in 'w:\common\components\gui\Garant\VT\ComboTree\vtComboTree.pas'
 , FakeBox in 'w:\common\components\gui\Garant\VT\ComboTree\FakeBox.pas'
 , EditableBox in 'w:\common\components\gui\Garant\VT\ComboTree\EditableBox.pas'
 , DropDownTree in 'w:\common\components\gui\Garant\VT\ComboTree\DropDownTree.pas'
 , AbstractDropDown in 'w:\common\components\gui\Garant\VT\ComboTree\AbstractDropDown.pas'
 , ctAbstractEdit in 'w:\common\components\gui\Garant\VT\ComboTree\ctAbstractEdit.pas'
 , ctButtonEdit in 'w:\common\components\gui\Garant\Everest\ctButtonEdit.pas'
 , elCustomButtonEdit in 'w:\common\components\gui\Garant\Everest\elCustomButtonEdit.pas'
 , elCustomEdit in 'w:\common\components\gui\Garant\Everest\elCustomEdit.pas'
 , evCustomEdit in 'w:\common\components\gui\Garant\Everest\evCustomEdit.pas'
 , evCustomMemo in 'w:\common\components\gui\Garant\Everest\evCustomMemo.pas'
 , evEditorWithOperations in 'w:\common\components\gui\Garant\Everest\evEditorWithOperations.pas'
 , evCustomEditor in 'w:\common\components\gui\Garant\Everest\evCustomEditor.pas'
 , evCustomEditorModelPart in 'w:\common\components\gui\Garant\Everest\evCustomEditorModelPart.pas'
 , evMultiSelectEditorWindow in 'w:\common\components\gui\Garant\Everest\evMultiSelectEditorWindow.pas'
 , evCustomEditorWindowModelPart in 'w:\common\components\gui\Garant\Everest\evCustomEditorWindowModelPart.pas'
 , evCustomTextSource in 'w:\common\components\gui\Garant\Everest\evCustomTextSource.pas'
 , nevTools in 'w:\common\components\gui\Garant\Everest\new\nevTools.pas'
 , k2Interfaces in 'w:\common\components\rtl\Garant\K2\k2Interfaces.pas'
 , k2PureMixIns in 'w:\common\components\rtl\Garant\K2\k2PureMixIns.pas'
 , k2Prim in 'w:\common\components\rtl\Garant\K2\k2Prim.pas'
 , k2PropertyArray in 'w:\common\components\rtl\Garant\K2\k2PropertyArray.pas'
 , k2TypeTableCreatedListeners in 'w:\common\components\rtl\Garant\K2\k2TypeTableCreatedListeners.pas'
 , k2Attributes in 'w:\common\components\rtl\Garant\K2\k2Attributes.pas'
 , k2Tags in 'w:\common\components\rtl\Garant\K2\k2Tags.pas'
 , k2Empty_Const in 'w:\common\components\rtl\Garant\K2\k2Empty_Const.pas'
 , k2BaseHack in 'w:\common\components\rtl\Garant\K2\k2BaseHack.pas'
 , nevBase in 'w:\common\components\gui\Garant\Everest\new\nevBase.pas'
 , evdTypes in 'w:\common\components\rtl\Garant\EVD\evdTypes.pas'
 , evdStyles in 'w:\common\components\rtl\Garant\EVD\evdStyles.pas'
 , evConst in 'w:\common\components\gui\Garant\Everest\evConst.pas'
 , l3Tree_TLB in 'w:\common\components\rtl\Garant\L3\l3Tree_TLB.pas'
 , evdInterfaces in 'w:\common\components\rtl\Garant\EVD\evdInterfaces.pas'
 , nevTypes in 'w:\common\components\gui\Garant\Everest\new\nevTypes.pas'
 , k2BaseStruct in 'w:\common\components\rtl\Garant\K2\k2BaseStruct.pas'
 , k2Base in 'w:\common\components\rtl\Garant\K2\k2Base.pas'
 , k2TypeModelPart in 'w:\common\components\rtl\Garant\K2\k2TypeModelPart.pas'
 , k2SortTagsList in 'w:\common\components\rtl\Garant\K2\k2SortTagsList.pas'
 , k2SortTagsListPrim in 'w:\common\components\rtl\Garant\K2\k2SortTagsListPrim.pas'
 , k2String_Const in 'w:\common\components\rtl\Garant\K2\k2String_Const.pas'
 , k2SomeDataContainer_Const in 'w:\common\components\rtl\Garant\K2\k2SomeDataContainer_Const.pas'
 , k2Object_Const in 'w:\common\components\rtl\Garant\K2\k2Object_Const.pas'
 , k2AtomWrapPrim in 'w:\common\components\rtl\Garant\K2\k2AtomWrapPrim.pas'
 , k2PropSorter in 'w:\common\components\rtl\Garant\K2\k2PropSorter.pas'
 , k2NullTagImpl in 'w:\common\components\rtl\Garant\K2\k2NullTagImpl.pas'
 , k2NullTagImplPrim in 'w:\common\components\rtl\Garant\K2\k2NullTagImplPrim.pas'
 , k2SpecialTag in 'w:\common\components\rtl\Garant\K2\k2SpecialTag.pas'
 , k2NotStructuredTag in 'w:\common\components\rtl\Garant\K2\k2NotStructuredTag.pas'
 , k2Tag in 'w:\common\components\rtl\Garant\K2\k2Tag.pas'
 , k2Strings in 'w:\common\components\rtl\Garant\K2\k2Strings.pas'
 , evResultFontInterfaces in 'w:\common\components\gui\Garant\Everest\evResultFontInterfaces.pas'
 , evResultFont in 'w:\common\components\gui\Garant\Everest\evResultFont.pas'
 , evTypes in 'w:\common\components\gui\Garant\Everest\evTypes.pas'
 , afwNavigation in 'w:\common\components\gui\Garant\AFW\afwNavigation.pas'
 , nevGUIInterfaces in 'w:\common\components\gui\Garant\Everest\new\nevGUIInterfaces.pas'
 , evExcept in 'w:\common\components\gui\Garant\Everest\evExcept.pas'
 , evEditorWindowHotSpot in 'w:\common\components\gui\Garant\Everest\evEditorWindowHotSpot.pas'
 , l3Tool in 'w:\common\components\rtl\Garant\L3\l3Tool.pas'
 , evMsgCode in 'w:\common\components\gui\Garant\Everest\evMsgCode.pas'
 , evDataObject in 'w:\common\components\gui\Garant\Everest\evDataObject.pas'
 , evOp in 'w:\common\components\gui\Garant\Everest\evOp.pas'
 , nevSelection in 'w:\common\components\gui\Garant\Everest\nevSelection.pas'
 , evBlockCursor in 'w:\common\components\gui\Garant\Everest\evBlockCursor.pas'
 , evWindowCursor in 'w:\common\components\gui\Garant\Everest\evWindowCursor.pas'
 , evCursorController in 'w:\common\components\gui\Garant\Everest\evCursorController.pas'
 , k2TagGen in 'w:\common\components\rtl\Garant\K2\k2TagGen.pas'
 , k2VariantImpl in 'w:\common\components\rtl\Garant\K2\k2VariantImpl.pas'
 , k2Long_Const in 'w:\common\components\rtl\Garant\K2\k2Long_Const.pas'
 {$If NOT Defined(NoScripts)}
 , kwFiltersAndGeneratorsPack in 'w:\common\components\rtl\Garant\ScriptEngine\kwFiltersAndGeneratorsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , k2EVDReaderService in 'w:\common\components\rtl\Garant\K2\k2EVDReaderService.pas'
 , k2CustomFileReader in 'w:\common\components\rtl\Garant\K2\k2CustomFileReader.pas'
 , k2CustomReader in 'w:\common\components\rtl\Garant\K2\k2CustomReader.pas'
 , k2CustomStackGenerator in 'w:\common\components\rtl\Garant\K2\k2CustomStackGenerator.pas'
 , k2BaseStackGenerator in 'w:\common\components\rtl\Garant\K2\k2BaseStackGenerator.pas'
 , k2EVDWriterService in 'w:\common\components\rtl\Garant\K2\k2EVDWriterService.pas'
 , k2CustomFileGenerator in 'w:\common\components\rtl\Garant\K2\k2CustomFileGenerator.pas'
 , k2CustomStackGeneratorEx in 'w:\common\components\rtl\Garant\K2\k2CustomStackGeneratorEx.pas'
 , evDocumentPartGenerator in 'w:\common\components\gui\Garant\Everest\evDocumentPartGenerator.pas'
 , evDocumentPartGeneratorPrim in 'w:\common\components\gui\Garant\Everest\evDocumentPartGeneratorPrim.pas'
 , evHighLevelDocumentGenerator in 'w:\common\components\gui\Garant\Everest\evHighLevelDocumentGenerator.pas'
 , k2DocumentGenerator in 'w:\common\components\rtl\Garant\K2\k2DocumentGenerator.pas'
 , evGeneratorsInterfaces in 'w:\common\components\gui\Garant\Everest\evGeneratorsInterfaces.pas'
 , nevNavigation in 'w:\common\components\gui\Garant\Everest\new\nevNavigation.pas'
 , LeafPara_Const in 'w:\common\components\rtl\Garant\EVD\LeafPara_Const.pas'
 , Para_Const in 'w:\common\components\rtl\Garant\EVD\Para_Const.pas'
 , k2Tag_Const in 'w:\common\components\rtl\Garant\K2\k2Tag_Const.pas'
 , k2Bool_Const in 'w:\common\components\rtl\Garant\K2\k2Bool_Const.pas'
 , k2Enum_Const in 'w:\common\components\rtl\Garant\K2\k2Enum_Const.pas'
 , k2Inch_Const in 'w:\common\components\rtl\Garant\K2\k2Inch_Const.pas'
 , k2Color_Const in 'w:\common\components\rtl\Garant\K2\k2Color_Const.pas'
 , evdFrame_Const in 'w:\common\components\rtl\Garant\EVD\evdFrame_Const.pas'
 , FramePart_Const in 'w:\common\components\rtl\Garant\EVD\FramePart_Const.pas'
 , SubLayer_Const in 'w:\common\components\rtl\Garant\EVD\SubLayer_Const.pas'
 , k2OList_Const in 'w:\common\components\rtl\Garant\K2\k2OList_Const.pas'
 , k2l3Base_Const in 'w:\common\components\rtl\Garant\K2\k2l3Base_Const.pas'
 , Sub_Const in 'w:\common\components\rtl\Garant\EVD\Sub_Const.pas'
 , DictItem_Const in 'w:\common\components\rtl\Garant\EVD\DictItem_Const.pas'
 , DictRec_Const in 'w:\common\components\rtl\Garant\EVD\DictRec_Const.pas'
 , AutoClass_Const in 'w:\common\components\rtl\Garant\EVD\AutoClass_Const.pas'
 {$If Defined(k2ForEditor)}
 , evParaTools in 'w:\common\components\gui\Garant\Everest\evParaTools.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , evInternalInterfaces in 'w:\common\components\gui\Garant\Everest\evInternalInterfaces.pas'
 , evSearch in 'w:\common\components\gui\Garant\Everest\evSearch.pas'
 , nevConfirm in 'w:\common\components\gui\Garant\Everest\new\nevConfirm.pas'
 {$If Defined(k2ForEditor) AND Defined(evNeedEditableCursors)}
 , evParaUtilClasses in 'w:\common\components\gui\Garant\Everest\evParaUtilClasses.pas'
 {$IfEnd} // Defined(k2ForEditor) AND Defined(evNeedEditableCursors)
 {$If Defined(k2ForEditor) AND Defined(evNeedEditableCursors)}
 , evCustomParaListUtils in 'w:\common\components\gui\Garant\Everest\evCustomParaListUtils.pas'
 {$IfEnd} // Defined(k2ForEditor) AND Defined(evNeedEditableCursors)
 , k2ProcessorTagTool in 'w:\common\components\rtl\Garant\K2\k2ProcessorTagTool.pas'
 , k2TagTool in 'w:\common\components\rtl\Garant\K2\k2TagTool.pas'
 , k2TagPointer in 'w:\common\components\rtl\Garant\K2\k2TagPointer.pas'
 , k2ToolPrim in 'w:\common\components\rtl\Garant\K2\k2ToolPrim.pas'
 , k2InterfaceFactory in 'w:\common\components\rtl\Garant\K2\k2InterfaceFactory.pas'
 , k2InterfaceCache in 'w:\common\components\rtl\Garant\K2\k2InterfaceCache.pas'
 , k2InterfaceList in 'w:\common\components\rtl\Garant\K2\k2InterfaceList.pas'
 , k2ToolCacheList in 'w:\common\components\rtl\Garant\K2\k2ToolCacheList.pas'
 , k2ToolPrimList in 'w:\common\components\rtl\Garant\K2\k2ToolPrimList.pas'
 , evEditorInterfaces in 'w:\common\components\gui\Garant\Everest\evEditorInterfaces.pas'
 , evEditorInterfacesTypes in 'w:\common\components\gui\Garant\Everest\evEditorInterfacesTypes.pas'
 {$If Defined(k2ForEditor)}
 , evCursorTools in 'w:\common\components\gui\Garant\Everest\evCursorTools.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , k2OpMisc in 'w:\common\components\rtl\Garant\K2\k2OpMisc.pas'
 , nevFacade in 'w:\common\components\gui\Garant\Everest\new\nevFacade.pas'
 {$If NOT Defined(NoScripts)}
 , IedTableWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\IedTableWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , TableCell_Const in 'w:\common\components\gui\Garant\Everest\TableCell_Const.pas'
 , ParaList_Const in 'w:\common\components\gui\Garant\Everest\ParaList_Const.pas'
 , TextPara_Const in 'w:\common\components\gui\Garant\Everest\TextPara_Const.pas'
 , StyledLeafPara_Const in 'w:\common\components\gui\Garant\Everest\StyledLeafPara_Const.pas'
 , evdTextStyle_Const in 'w:\common\components\rtl\Garant\EVD\evdTextStyle_Const.pas'
 , Style_Const in 'w:\common\components\rtl\Garant\EVD\Style_Const.pas'
 , ObjectWithHandle_Const in 'w:\common\components\rtl\Garant\EVD\ObjectWithHandle_Const.pas'
 , k2Handle_Const in 'w:\common\components\rtl\Garant\K2\k2Handle_Const.pas'
 , Justification_Const in 'w:\common\components\rtl\Garant\EVD\Justification_Const.pas'
 , Font_Const in 'w:\common\components\rtl\Garant\EVD\Font_Const.pas'
 , k2FontName_Const in 'w:\common\components\rtl\Garant\K2\k2FontName_Const.pas'
 , evdStyleContainer in 'w:\common\components\rtl\Garant\EVD\evdStyleContainer.pas'
 , k2DictionaryEx in 'w:\common\components\rtl\Garant\K2\k2DictionaryEx.pas'
 , k2Dictionary in 'w:\common\components\rtl\Garant\K2\k2Dictionary.pas'
 , k2DictionaryPrim in 'w:\common\components\rtl\Garant\K2\k2DictionaryPrim.pas'
 , k2NonOptimizeContext in 'w:\common\components\rtl\Garant\K2\k2NonOptimizeContext.pas'
 , k2Context in 'w:\common\components\rtl\Garant\K2\k2Context.pas'
 , k2OperationContainer in 'w:\common\components\rtl\Garant\K2\k2OperationContainer.pas'
 , k2OpRefList in 'w:\common\components\rtl\Garant\K2\k2OpRefList.pas'
 , k2Op in 'w:\common\components\rtl\Garant\K2\k2Op.pas'
 , k2NilOp in 'w:\common\components\rtl\Garant\K2\k2NilOp.pas'
 , l3IntegerValueMapManager in 'w:\common\components\rtl\Garant\L3\l3IntegerValueMapManager.pas'
 , l3ValueMapManager in 'w:\common\components\rtl\Garant\L3\l3ValueMapManager.pas'
 , l3ValueMapManagerPrim in 'w:\common\components\rtl\Garant\L3\l3ValueMapManagerPrim.pas'
 , l3ValueMap in 'w:\common\components\rtl\Garant\L3\l3ValueMap.pas'
 , l3BaseWithIDList in 'w:\common\components\rtl\Garant\L3\l3BaseWithIDList.pas'
 , l3BaseWithIDListPrim in 'w:\common\components\rtl\Garant\L3\l3BaseWithIDListPrim.pas'
 , l3BaseWithID in 'w:\common\components\rtl\Garant\L3\l3BaseWithID.pas'
 , k2DictionaryIDIndex in 'w:\common\components\rtl\Garant\K2\k2DictionaryIDIndex.pas'
 , k2DictionaryIDIndexPrim in 'w:\common\components\rtl\Garant\K2\k2DictionaryIDIndexPrim.pas'
 , evStyleInterfaceEx in 'w:\common\components\gui\Garant\Everest\evStyleInterfaceEx.pas'
 , evStyleInterface in 'w:\common\components\gui\Garant\Everest\evStyleInterface.pas'
 , evStyles_SH in 'w:\common\components\gui\Garant\Everest\evStyles_SH.pas'
 , evInterface in 'w:\common\components\gui\Garant\Everest\evInterface.pas'
 {$If NOT Defined(DesignTimeLibrary)}
 , evStyleTableSpy in 'w:\common\components\gui\Garant\Everest\evStyleTableSpy.pas'
 {$IfEnd} // NOT Defined(DesignTimeLibrary)
 , l3InterfacePtrList in 'w:\common\components\rtl\Garant\L3\l3InterfacePtrList.pas'
 , evFontInterface in 'w:\common\components\gui\Garant\Everest\evFontInterface.pas'
 , l3Nodes in 'w:\common\components\rtl\Garant\L3\l3Nodes.pas'
 , k2SimpleTagList in 'w:\common\components\rtl\Garant\K2\k2SimpleTagList.pas'
 , k2TagList in 'w:\common\components\rtl\Garant\K2\k2TagList.pas'
 , k2TagListPrim in 'w:\common\components\rtl\Garant\K2\k2TagListPrim.pas'
 , k2ListTag in 'w:\common\components\rtl\Garant\K2\k2ListTag.pas'
 , k2NonAtomicTag in 'w:\common\components\rtl\Garant\K2\k2NonAtomicTag.pas'
 , k2Facade in 'w:\common\components\rtl\Garant\K2\k2Facade.pas'
 , evStylesPrintAndExportSettingRes in 'w:\common\components\gui\Garant\Everest\evStylesPrintAndExportSettingRes.pas'
 , evStylesPrintAndExportFontSizeSettingRes in 'w:\common\components\gui\Garant\Everest\evStylesPrintAndExportFontSizeSettingRes.pas'
 , nevInternalInterfaces in 'w:\common\components\gui\Garant\Everest\new\nevInternalInterfaces.pas'
 , evOpProc in 'w:\common\components\gui\Garant\Everest\evOpProc.pas'
 , evdNativeReader in 'w:\common\components\rtl\Garant\EVD\evdNativeReader.pas'
 , k2CustomFileParser in 'w:\common\components\rtl\Garant\K2\k2CustomFileParser.pas'
 , evdNativeReaderServices in 'w:\common\components\rtl\Garant\EVD\evdNativeReaderServices.pas'
 , evStyleTableFontSizeCorrector in 'w:\common\components\gui\Garant\Everest\evStyleTableFontSizeCorrector.pas'
 , evdLeafParaFilter in 'w:\common\components\rtl\Garant\EVD\evdLeafParaFilter.pas'
 , k2TagFilter in 'w:\common\components\rtl\Garant\K2\k2TagFilter.pas'
 , k2TagTerminator in 'w:\common\components\rtl\Garant\K2\k2TagTerminator.pas'
 , evDefaultStylesFontSizes in 'w:\common\components\gui\Garant\Everest\evDefaultStylesFontSizes.pas'
 , evDefaultStylesFontSizesPrim1 in 'w:\common\components\gui\Garant\Everest\evDefaultStylesFontSizesPrim1.pas'
 , evDefaultStylesFontSizesPrim in 'w:\common\components\gui\Garant\Everest\evDefaultStylesFontSizesPrim.pas'
 , evDef in 'w:\common\components\gui\Garant\Everest\evDef.pas'
 , evdNativeWriter in 'w:\common\components\rtl\Garant\EVD\evdNativeWriter.pas'
 , evdCustomNativeWriter in 'w:\common\components\rtl\Garant\EVD\evdCustomNativeWriter.pas'
 , evdCustomNativeWriterServices in 'w:\common\components\rtl\Garant\EVD\evdCustomNativeWriterServices.pas'
 , Bullet_Const in 'w:\common\components\rtl\Garant\EVD\Bullet_Const.pas'
 , SegmentsLayer_Const in 'w:\common\components\rtl\Garant\EVD\SegmentsLayer_Const.pas'
 , TextSegment_Const in 'w:\common\components\rtl\Garant\EVD\TextSegment_Const.pas'
 , Segment_Const in 'w:\common\components\rtl\Garant\EVD\Segment_Const.pas'
 , Position_Const in 'w:\common\components\rtl\Garant\EVD\Position_Const.pas'
 , TabStop_Const in 'w:\common\components\rtl\Garant\EVD\TabStop_Const.pas'
 , TableTextPara_Const in 'w:\common\components\gui\Garant\Everest\TableTextPara_Const.pas'
 , QueryCard_Const in 'w:\common\components\gui\Garant\Everest\QueryCard_Const.pas'
 , Document_Const in 'w:\common\components\gui\Garant\Everest\Document_Const.pas'
 , Block_Const in 'w:\common\components\gui\Garant\Everest\Block_Const.pas'
 {$If Defined(k2ForEditor)}
 , evDocumentPart in 'w:\common\components\gui\Garant\Everest\evDocumentPart.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , Type_Const in 'w:\common\components\rtl\Garant\EVD\Type_Const.pas'
 , Date_Const in 'w:\common\components\rtl\Garant\EVD\Date_Const.pas'
 , PageProperties_Const in 'w:\common\components\rtl\Garant\EVD\PageProperties_Const.pas'
 , DocSubLayer_Const in 'w:\common\components\rtl\Garant\EVD\DocSubLayer_Const.pas'
 , DocumentSub_Const in 'w:\common\components\rtl\Garant\EVD\DocumentSub_Const.pas'
 , NumANDDate_Const in 'w:\common\components\rtl\Garant\EVD\NumANDDate_Const.pas'
 , LogRecordPrim_Const in 'w:\common\components\rtl\Garant\EVD\LogRecordPrim_Const.pas'
 , NSRCTag_Const in 'w:\common\components\rtl\Garant\EVD\NSRCTag_Const.pas'
 , Address_Const in 'w:\common\components\rtl\Garant\EVD\Address_Const.pas'
 , LogRecord_Const in 'w:\common\components\rtl\Garant\EVD\LogRecord_Const.pas'
 , Time_Const in 'w:\common\components\rtl\Garant\EVD\Time_Const.pas'
 , Version_Const in 'w:\common\components\gui\Garant\Everest\Version_Const.pas'
 , Stage_Const in 'w:\common\components\rtl\Garant\EVD\Stage_Const.pas'
 , StagePrim_Const in 'w:\common\components\rtl\Garant\EVD\StagePrim_Const.pas'
 , Check_Const in 'w:\common\components\rtl\Garant\EVD\Check_Const.pas'
 , PIRec_Const in 'w:\common\components\rtl\Garant\EVD\PIRec_Const.pas'
 , DictItemEx_Const in 'w:\common\components\rtl\Garant\EVD\DictItemEx_Const.pas'
 , ActiveInterval_Const in 'w:\common\components\rtl\Garant\EVD\ActiveInterval_Const.pas'
 , Alarm_Const in 'w:\common\components\rtl\Garant\EVD\Alarm_Const.pas'
 , Participant_Const in 'w:\common\components\gui\Garant\Everest\Participant_Const.pas'
 , k2Int64_Const in 'w:\common\components\rtl\Garant\K2\k2Int64_Const.pas'
 , k2RawData_Const in 'w:\common\components\rtl\Garant\K2\k2RawData_Const.pas'
 , EditablePart_Const in 'w:\common\components\gui\Garant\Everest\EditablePart_Const.pas'
 , evQueryCardInt in 'w:\common\components\gui\Garant\Everest\qf\evQueryCardInt.pas'
 , Formula_Const in 'w:\common\components\gui\Garant\Everest\Formula_Const.pas'
 , DecorTextPara_Const in 'w:\common\components\gui\Garant\Everest\DecorTextPara_Const.pas'
 , LeafParaDecorationsHolder_Const in 'w:\common\components\gui\Garant\Everest\LeafParaDecorationsHolder_Const.pas'
 , k2Const in 'w:\common\components\rtl\Garant\K2\k2Const.pas'
 , afwCaret in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCaret.pas'
 , afwCaretPair in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCaretPair.pas'
 , afwSingleCaret in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwSingleCaret.pas'
 , afwCustomCaretType in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCustomCaretType.pas'
 , afwInsCaretType in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwInsCaretType.pas'
 , afwOvrCaretType in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwOvrCaretType.pas'
 , nevBasePointList in 'w:\common\components\gui\Garant\Everest\new\nevBasePointList.pas'
 , evRange in 'w:\common\components\gui\Garant\Everest\evRange.pas'
 , k2ProcTagTool in 'w:\common\components\rtl\Garant\K2\k2ProcTagTool.pas'
 , Table_Const in 'w:\common\components\gui\Garant\Everest\Table_Const.pas'
 , TableRow_Const in 'w:\common\components\gui\Garant\Everest\TableRow_Const.pas'
 , evEditorInterfacesMisc in 'w:\common\components\gui\Garant\Everest\evEditorInterfacesMisc.pas'
 , evBitmapReader in 'w:\common\components\gui\Garant\Everest\evBitmapReader.pas'
 {$If Defined(k2ForEditor)}
 , evUsialParagraph in 'w:\common\components\gui\Garant\Everest\evUsialParagraph.pas'
 {$IfEnd} // Defined(k2ForEditor)
 {$If Defined(k2ForEditor)}
 , evParaFrame in 'w:\common\components\gui\Garant\Everest\evParaFrame.pas'
 {$IfEnd} // Defined(k2ForEditor)
 {$If NOT Defined(NoScripts)}
 , IedRangeWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\IedRangeWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evSelectConst in 'w:\common\components\gui\Garant\Everest\evSelectConst.pas'
 , evCustomFont in 'w:\common\components\gui\Garant\Everest\evCustomFont.pas'
 , nevView in 'w:\common\components\gui\Garant\Everest\new\nevView.pas'
 , nevBaseDrawView in 'w:\common\components\gui\Garant\Everest\new\nevBaseDrawView.pas'
 , nevBaseView in 'w:\common\components\gui\Garant\Everest\new\nevBaseView.pas'
 , nevShapesPainted in 'w:\common\components\gui\Garant\Everest\new\nevShapesPainted.pas'
 , nevShapePrim in 'w:\common\components\gui\Garant\Everest\new\nevShapePrim.pas'
 , nevShapePrimRefList in 'w:\common\components\gui\Garant\Everest\new\nevShapePrimRefList.pas'
 , nevShapesPaintedSpy in 'w:\common\components\gui\Garant\Everest\new\nevShapesPaintedSpy.pas'
 , nevObjectList in 'w:\common\components\gui\Garant\Everest\new\nevObjectList.pas'
 , l3PrinterIC in 'w:\common\components\rtl\Garant\L3\l3PrinterIC.pas'
 , Printers {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Printers.pas' {$EndIf}
 , l3Printer in 'w:\common\components\rtl\Garant\L3\l3Printer.pas'
 , Consts {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Consts.pas' {$EndIf}
 , nevRealTools in 'w:\common\components\gui\Garant\Everest\new\nevRealTools.pas'
 , nevViewInterfaces in 'w:\common\components\gui\Garant\Everest\new\nevViewInterfaces.pas'
 , l3ProcessMessagesManager in 'w:\common\components\rtl\Garant\L3\l3ProcessMessagesManager.pas'
 {$If NOT Defined(NoScripts)}
 , EditorFromStackKeyWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\EditorFromStackKeyWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSelectCells in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSelectCells.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwSelectCellsWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwSelectCellsWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEditorFromStackWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwEditorFromStackWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorWheelScroll in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorWheelScroll.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSelectColumn in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSelectColumn.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSelectCellsVertical in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSelectCellsVertical.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorJumpToHyperlink in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorJumpToHyperlink.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorRepaintTableLinesAndCheckWithEtalon in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorRepaintTableLinesAndCheckWithEtalon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorPrintAcnhor in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorPrintAcnhor.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorPrintTableCellsParams in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorPrintTableCellsParams.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , nevFormatInfoUtils in 'w:\common\components\gui\Garant\Everest\new\nevFormatInfoUtils.pas'
 , nevTableCellFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevTableCellFormatInfo.pas'
 , nevListFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevListFormatInfo.pas'
 , nevParaFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevParaFormatInfo.pas'
 , nevFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevFormatInfo.pas'
 , nevFormatInfoFactory in 'w:\common\components\gui\Garant\Everest\new\nevFormatInfoFactory.pas'
 , CommentPara_Const in 'w:\common\components\gui\Garant\Everest\CommentPara_Const.pas'
 , SBS_Const in 'w:\common\components\gui\Garant\Everest\SBS_Const.pas'
 , SBSRow_Const in 'w:\common\components\gui\Garant\Everest\SBSRow_Const.pas'
 , SBSCell_Const in 'w:\common\components\gui\Garant\Everest\SBSCell_Const.pas'
 , ReqRow_Const in 'w:\common\components\gui\Garant\Everest\ReqRow_Const.pas'
 , k2IUnknown_Const in 'w:\common\components\rtl\Garant\K2\k2IUnknown_Const.pas'
 , ReqCell_Const in 'w:\common\components\gui\Garant\Everest\ReqCell_Const.pas'
 , ControlPara_Const in 'w:\common\components\gui\Garant\Everest\ControlPara_Const.pas'
 , evSectionPara in 'w:\common\components\gui\Garant\Everest\new\evSectionPara.pas'
 , nevFormatInfoArray in 'w:\common\components\gui\Garant\Everest\new\nevFormatInfoArray.pas'
 , nevFormatInfoList in 'w:\common\components\gui\Garant\Everest\new\nevFormatInfoList.pas'
 , evStandardStyles in 'w:\common\components\gui\Garant\Everest\evStandardStyles.pas'
 , evStandardStylesList in 'w:\common\components\gui\Garant\Everest\evStandardStylesList.pas'
 , evStandardStylesListPrim in 'w:\common\components\gui\Garant\Everest\evStandardStylesListPrim.pas'
 , evResultFontHolder in 'w:\common\components\gui\Garant\Everest\evResultFontHolder.pas'
 , evGlyphFont in 'w:\common\components\gui\Garant\Everest\evGlyphFont.pas'
 , evdStylesRes in 'w:\common\components\rtl\Garant\EVD\evdStylesRes.pas'
 , l3ImageList in 'w:\common\components\rtl\Garant\L3\l3ImageList.pas'
 , evTextStyle_Const in 'w:\common\components\gui\Garant\Everest\evTextStyle_Const.pas'
 , HyperLink_Const in 'w:\common\components\rtl\Garant\EVD\HyperLink_Const.pas'
 , SegmentWithChildren_Const in 'w:\common\components\rtl\Garant\EVD\SegmentWithChildren_Const.pas'
 , ObjectSegment_Const in 'w:\common\components\rtl\Garant\EVD\ObjectSegment_Const.pas'
 , ImageListBitmap_Const in 'w:\common\components\gui\Garant\Everest\ImageListBitmap_Const.pas'
 , BitmapPara_Const in 'w:\common\components\gui\Garant\Everest\BitmapPara_Const.pas'
 , evBitmapParaBitmapContainer in 'w:\common\components\gui\Garant\Everest\evBitmapParaBitmapContainer.pas'
 , l3IEBitmapContainer in 'w:\common\components\rtl\Garant\L3\l3IEBitmapContainer.pas'
 , l3GraphicContainer in 'w:\common\components\rtl\Garant\L3\l3GraphicContainer.pas'
 , l3GraphicContainerStack in 'w:\common\components\rtl\Garant\L3\l3GraphicContainerStack.pas'
 , l3IEBitmapContainerStack in 'w:\common\components\rtl\Garant\L3\l3IEBitmapContainerStack.pas'
 , l3Dict in 'w:\common\components\rtl\Garant\L3\l3Dict.pas'
 , l3DictionaryPrim in 'w:\common\components\rtl\Garant\L3\l3DictionaryPrim.pas'
 , l3IDIndex in 'w:\common\components\rtl\Garant\L3\l3IDIndex.pas'
 , l3IDIndexPrim in 'w:\common\components\rtl\Garant\L3\l3IDIndexPrim.pas'
 , k2Except in 'w:\common\components\rtl\Garant\K2\k2Except.pas'
 , k2String in 'w:\common\components\rtl\Garant\K2\k2String.pas'
 , k2List in 'w:\common\components\rtl\Garant\K2\k2List.pas'
 , nevLeafRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevLeafRenderInfo.pas'
 , nevTextParaRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevTextParaRenderInfo.pas'
 {$If Defined(k2ForEditor)}
 , evSegLst in 'w:\common\components\gui\Garant\Everest\evSegLst.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , evTextParaConst in 'w:\common\components\gui\Garant\Everest\evTextParaConst.pas'
 , nevSegmentObject in 'w:\common\components\gui\Garant\Everest\nevSegmentObject.pas'
 , l3SingleLineInfo in 'w:\common\components\rtl\Garant\L3\l3SingleLineInfo.pas'
 {$If Defined(k2ForEditor)}
 , evTextParaTools in 'w:\common\components\gui\Garant\Everest\evTextParaTools.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , k2InterfacesEx in 'w:\common\components\rtl\Garant\K2\k2InterfacesEx.pas'
 , evSegOp in 'w:\common\components\gui\Garant\Everest\evSegOp.pas'
 {$If Defined(k2ForEditor)}
 , evAlignBySeparatorUtils in 'w:\common\components\gui\Garant\Everest\evAlignBySeparatorUtils.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , nevStringCache in 'w:\common\components\gui\Garant\Everest\nevStringCache.pas'
 , evParaString in 'w:\common\components\gui\Garant\Everest\evParaString.pas'
 , k2InterfacedTagList in 'w:\common\components\rtl\Garant\K2\k2InterfacedTagList.pas'
 {$If Defined(k2ForEditor)}
 , evChangeCodePage in 'w:\common\components\gui\Garant\Everest\evChangeCodePage.pas'
 {$IfEnd} // Defined(k2ForEditor)
 {$If Defined(k2ForEditor)}
 , evAACContentUtils in 'w:\common\components\gui\Garant\Everest\evAACContentUtils.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , nevRubberCellsRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevRubberCellsRenderInfo.pas'
 , nevTableRowRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevTableRowRenderInfo.pas'
 {$If Defined(k2ForEditor)}
 , evTableCellUtils in 'w:\common\components\gui\Garant\Everest\evTableCellUtils.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , nevZoomedCellsRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevZoomedCellsRenderInfo.pas'
 , nevZoomedRubberCellsRenderInfo in 'w:\common\components\gui\Garant\Everest\new\nevZoomedRubberCellsRenderInfo.pas'
 , nevDocumentPartFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevDocumentPartFormatInfo.pas'
 , nevCommentFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevCommentFormatInfo.pas'
 , nevBitmapFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevBitmapFormatInfo.pas'
 , nevControlFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevControlFormatInfo.pas'
 , nevFormulaFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevFormulaFormatInfo.pas'
 , evFormulaParaBitmapContainer in 'w:\common\components\rtl\Garant\EVD\evFormulaParaBitmapContainer.pas'
 , ExprDraw in 'w:\common\components\rtl\external\Expr\ExprDraw.pas'
 , l3Drawer in 'w:\common\components\rtl\Garant\L3\l3Drawer.pas'
 , ExprMake in 'w:\common\components\rtl\external\Expr\ExprMake.pas'
 , exprTokensList in 'w:\common\components\rtl\external\Expr\exprTokensList.pas'
 , nevControlsBlockFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevControlsBlockFormatInfo.pas'
 , nevCloakFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevCloakFormatInfo.pas'
 , ControlsBlock_Const in 'w:\common\components\gui\Garant\Everest\ControlsBlock_Const.pas'
 , evControlsBlockConst in 'w:\common\components\gui\Garant\Everest\evControlsBlockConst.pas'
 , Cloak_Const in 'w:\common\components\gui\Garant\Everest\Cloak_Const.pas'
 , nevSegmentFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevSegmentFormatInfo.pas'
 , nevObjectSegmentFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevObjectSegmentFormatInfo.pas'
 , nevDocumentFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevDocumentFormatInfo.pas'
 , nevSBSCellFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevSBSCellFormatInfo.pas'
 , nevSBSRowFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevSBSRowFormatInfo.pas'
 , nevTableRowRenderInfoEx in 'w:\common\components\gui\Garant\Everest\new\nevTableRowRenderInfoEx.pas'
 , nevReqRowFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevReqRowFormatInfo.pas'
 , evControlParaConst in 'w:\common\components\gui\Garant\Everest\evControlParaConst.pas'
 , nevPageBreakFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevPageBreakFormatInfo.pas'
 , PageBreak_Const in 'w:\common\components\rtl\Garant\EVD\PageBreak_Const.pas'
 , nevNodeGroupFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevNodeGroupFormatInfo.pas'
 , NodeGroup_Const in 'w:\common\components\gui\Garant\Everest\NodeGroup_Const.pas'
 {$If NOT Defined(NoScripts)}
 , kwPopEditorLP2DP in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorLP2DP.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorDP2LP in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorDP2LP.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorCheckContinueCells in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCheckContinueCells.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evTableSearch in 'w:\common\components\gui\Garant\EverestCommon\evTableSearch.pas'
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetLeftIndentDelta in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetLeftIndentDelta.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaDown.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEditorFromStackCursorWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwEditorFromStackCursorWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaUp.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaEnd in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaEnd.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaHome in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaHome.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSelectTable in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSelectTable.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorHasComment in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorHasComment.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEditorFromStackNextParaWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwEditorFromStackNextParaWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEditorFromStackTextParaWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwEditorFromStackTextParaWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorDeleteUserComment in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorDeleteUserComment.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorCurrentText in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCurrentText.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorUpdateCursorFromHotSpot in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorUpdateCursorFromHotSpot.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorUpdateCursorFromHotSpotEx in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorUpdateCursorFromHotSpotEx.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorTextToFile in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorTextToFile.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evdMarkEliminator in 'w:\common\components\rtl\Garant\EVD\evdMarkEliminator.pas'
 , Mark_Const in 'w:\common\components\rtl\Garant\EVD\Mark_Const.pas'
 , evdDocumentMarksEliminator in 'w:\common\components\rtl\Garant\EVD\evdDocumentMarksEliminator.pas'
 , evdDocumentBookmarksEliminator in 'w:\common\components\rtl\Garant\EVD\evdDocumentBookmarksEliminator.pas'
 , evdDocumentSubsEliminator in 'w:\common\components\rtl\Garant\EVD\evdDocumentSubsEliminator.pas'
 , evDocumentSubsChildrenCountEliminator in 'w:\common\components\gui\Garant\EverestCommon\evDocumentSubsChildrenCountEliminator.pas'
 , evdHypelinkDocIDEliminator in 'w:\common\components\rtl\Garant\EVD\evdHypelinkDocIDEliminator.pas'
 , evdEmptySubsEliminator in 'w:\common\components\rtl\Garant\EVD\evdEmptySubsEliminator.pas'
 , evdBufferedFilter in 'w:\common\components\rtl\Garant\EVD\evdBufferedFilter.pas'
 , evdStartAndTimeEliminator in 'w:\common\components\gui\Garant\Everest\evdStartAndTimeEliminator.pas'
 , evBitmapEliminator4Tests in 'w:\common\components\gui\Garant\Everest\evBitmapEliminator4Tests.pas'
 {$If NOT Defined(NoImageEn)}
 , imageenio in 'w:\common\components\rtl\external\ImageEn\src\imageenio.pas'
 {$IfEnd} // NOT Defined(NoImageEn)
 , ddPicturePathListner in 'w:\common\components\rtl\Garant\dd\ddPicturePathListner.pas'
 , l3PicturePathService in 'w:\common\components\rtl\Garant\L3\l3PicturePathService.pas'
 {$If NOT Defined(NoScripts)}
 , PictureEtalonsWorkingPack in 'w:\common\components\rtl\Garant\ScriptEngine\PictureEtalonsWorkingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , ddConst in 'w:\common\components\rtl\Garant\dd\ddConst.pas'
 , ddUtils in 'w:\common\components\rtl\Garant\dd\ddUtils.pas'
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetSelectionText in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetSelectionText.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetParaByID in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetParaByID.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetSelectionTextInFormat in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetSelectionTextInFormat.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evdBlockNameAdder in 'w:\common\components\gui\Garant\Everest\evdBlockNameAdder.pas'
 , evdHeaderHyperlinkAdder in 'w:\common\components\gui\Garant\Everest\evdHeaderHyperlinkAdder.pas'
 , ContentsElement_Const in 'w:\common\components\gui\Garant\Everest\ContentsElement_Const.pas'
 {$If NOT Defined(NoScripts)}
 , kwPopEditorBlockResize in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorBlockResize.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBlockResize in 'w:\common\components\rtl\Garant\ScriptEngine\kwBlockResize.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSelectCellByMouse in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSelectCellByMouse.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSetTextParaStyle in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSetTextParaStyle.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorSetCursorByPoint in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorSetCursorByPoint.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorRepaintAndCheckWithEtalon in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorRepaintAndCheckWithEtalon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorCopyAndPaste2DocumentBottom in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCopyAndPaste2DocumentBottom.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorResizeTableColumn in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorResizeTableColumn.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEditorFromStackTableColumnResize in 'w:\common\components\rtl\Garant\ScriptEngine\kwEditorFromStackTableColumnResize.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorResizeTableColumnEX in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorResizeTableColumnEX.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorCheckWithEtalon in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCheckWithEtalon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledCheckWithEtalon in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledCheckWithEtalon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetLMargin in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetLMargin.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorGetWrapLimit in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorGetWrapLimit.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorBlockResizeEX in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorBlockResizeEX.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorPasteRTF in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorPasteRTF.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwInsertFromStreamCommon in 'w:\common\components\rtl\Garant\ScriptEngine\kwInsertFromStreamCommon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorInsertStream in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorInsertStream.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorPasteEVDTroughClipboard in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorPasteEVDTroughClipboard.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBeginWaitPrint in 'w:\common\components\rtl\Garant\ScriptEngine\kwBeginWaitPrint.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPrintDataSaver in 'w:\common\components\rtl\Garant\ScriptEngine\kwPrintDataSaver.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evCustomPrintDataSaver in 'w:\common\components\gui\Garant\Everest\evCustomPrintDataSaver.pas'
 , afwPreviewPageSpy in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewPageSpy.pas'
 , afwPreviewPage in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewPage.pas'
 , l3Metafile in 'w:\common\components\rtl\Garant\L3\l3Metafile.pas'
 , l3MetafileHeader in 'w:\common\components\rtl\Garant\L3\l3MetafileHeader.pas'
 , afwPreviewPageList in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewPageList.pas'
 , l3DataCache in 'w:\common\components\rtl\Garant\L3\l3DataCache.pas'
 {$If NOT Defined(NoScripts)}
 , kwEndWaitPrint in 'w:\common\components\rtl\Garant\ScriptEngine\kwEndWaitPrint.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , TevCustomEditorWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\TevCustomEditorWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evMultiSelection in 'w:\common\components\gui\Garant\Everest\evMultiSelection.pas'
 , nevRangeList in 'w:\common\components\gui\Garant\Everest\new\nevRangeList.pas'
 , evMultiSelectionBlock in 'w:\common\components\gui\Garant\Everest\evMultiSelectionBlock.pas'
 , evMultiSelectionText in 'w:\common\components\gui\Garant\Everest\evMultiSelectionText.pas'
 , evMultiSelectionDataFormatting in 'w:\common\components\gui\Garant\Everest\evMultiSelectionDataFormatting.pas'
 , evMultiSelectionRange in 'w:\common\components\gui\Garant\Everest\evMultiSelectionRange.pas'
 , evMultiSelectionLocation in 'w:\common\components\gui\Garant\Everest\evMultiSelectionLocation.pas'
 , evLeafParaMultiSelectionBlock in 'w:\common\components\gui\Garant\Everest\evLeafParaMultiSelectionBlock.pas'
 , evTextParaMultiSelectionBlock in 'w:\common\components\gui\Garant\Everest\evTextParaMultiSelectionBlock.pas'
 , evdSegmentsLayerJoiner in 'w:\common\components\rtl\Garant\EVD\evdSegmentsLayerJoiner.pas'
 , k2DocumentBuffer in 'w:\common\components\rtl\Garant\K2\k2DocumentBuffer.pas'
 , evTextParaPartFilter in 'w:\common\components\gui\Garant\Everest\evTextParaPartFilter.pas'
 , nevRangeListTools in 'w:\common\components\gui\Garant\Everest\new\nevRangeListTools.pas'
 , evRangeTools in 'w:\common\components\gui\Garant\Everest\new\evRangeTools.pas'
 , evMultiSelectEditorWindowHotSpot in 'w:\common\components\gui\Garant\Everest\evMultiSelectEditorWindowHotSpot.pas'
 , evCustomMemoTextSource in 'w:\common\components\gui\Garant\Everest\evCustomMemoTextSource.pas'
 , evTextSource in 'w:\common\components\gui\Garant\Everest\evTextSource.pas'
 , evCustomMemoContainer in 'w:\common\components\gui\Garant\Everest\evCustomMemoContainer.pas'
 , nevPrintableDocumentContainer in 'w:\common\components\gui\Garant\Everest\new\nevPrintableDocumentContainer.pas'
 , nevPersistentDocumentContainer in 'w:\common\components\gui\Garant\Everest\new\nevPersistentDocumentContainer.pas'
 , evDocumentContainerWithProcessor in 'w:\common\components\gui\Garant\Everest\new\evDocumentContainerWithProcessor.pas'
 , nevDocumentContainer in 'w:\common\components\gui\Garant\Everest\new\nevDocumentContainer.pas'
 , nevObjectHolderPrim in 'w:\common\components\gui\Garant\Everest\nevObjectHolderPrim.pas'
 , nevDocumentContainerPrim in 'w:\common\components\gui\Garant\Everest\nevDocumentContainerPrim.pas'
 , nevDocumentContainerPrimPrim in 'w:\common\components\gui\Garant\Everest\nevDocumentContainerPrimPrim.pas'
 , DocumentContainer_Const in 'w:\common\components\gui\Garant\Everest\DocumentContainer_Const.pas'
 , nevFormatPool in 'w:\common\components\gui\Garant\Everest\new\nevFormatPool.pas'
 , nevFormatPoolBase in 'w:\common\components\gui\Garant\Everest\new\nevFormatPoolBase.pas'
 , nevRootFormatInfoListPrim in 'w:\common\components\gui\Garant\Everest\new\nevRootFormatInfoListPrim.pas'
 , nevRootFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevRootFormatInfo.pas'
 , m2MemLib in 'w:\common\components\rtl\Garant\L3\m2\m2MemLib.pas'
 , nevPrintingRootFormatInfo in 'w:\common\components\gui\Garant\Everest\new\nevPrintingRootFormatInfo.pas'
 , nevSectionBreakList in 'w:\common\components\gui\Garant\Everest\nevSectionBreakList.pas'
 , nevSectionBreakListPrim in 'w:\common\components\gui\Garant\Everest\nevSectionBreakListPrim.pas'
 , l3NotifyPtrList in 'w:\common\components\rtl\Garant\L3\l3NotifyPtrList.pas'
 , SectionBreak_Const in 'w:\common\components\rtl\Garant\EVD\SectionBreak_Const.pas'
 , nevWaiterList in 'w:\common\components\gui\Garant\Everest\new\nevWaiterList.pas'
 , evDocumentPreviewInfoList in 'w:\common\components\gui\Garant\Everest\new\evDocumentPreviewInfoList.pas'
 , k2InternalInterfaces in 'w:\common\components\rtl\Garant\K2\k2InternalInterfaces.pas'
 , nevInterfaces in 'w:\common\components\gui\Garant\Everest\new\nevInterfaces.pas'
 , evDocumentsCache in 'w:\common\components\gui\Garant\Everest\new\evDocumentsCache.pas'
 , evDocumentsCachePrim in 'w:\common\components\gui\Garant\Everest\new\evDocumentsCachePrim.pas'
 , l3DocumentsCacheService in 'w:\common\components\rtl\Garant\L3\l3DocumentsCacheService.pas'
 , nevDocumentContainerList in 'w:\common\components\gui\Garant\Everest\new\nevDocumentContainerList.pas'
 , nevDocumentContainerListPrim in 'w:\common\components\gui\Garant\Everest\new\nevDocumentContainerListPrim.pas'
 , nevTextSourcePool in 'w:\common\components\gui\Garant\Everest\new\nevTextSourcePool.pas'
 , afwComplexDocumentPreviewFactory in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwComplexDocumentPreviewFactory.pas'
 , afwComplexDocumentPreview in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwComplexDocumentPreview.pas'
 , afwPreviewNotifierPtrList in 'w:\common\components\gui\Garant\AFW\implementation\afwPreviewNotifierPtrList.pas'
 , evSubImplementation in 'w:\common\components\gui\Garant\Everest\new\evSubImplementation.pas'
 , evSubNode in 'w:\common\components\gui\Garant\Everest\new\evSubNode.pas'
 , evNode in 'w:\common\components\gui\Garant\Everest\new\evNode.pas'
 , l3NodesModelPart in 'w:\common\components\rtl\Garant\L3\l3NodesModelPart.pas'
 , l3DatLst in 'w:\common\components\rtl\Garant\L3\l3DatLst.pas'
 {$If NOT Defined(NoScripts)}
 , l3NodesKeyWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\l3NodesKeyWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3Bits in 'w:\common\components\rtl\Garant\L3\l3Bits.pas'
 {$If NOT Defined(NoScripts)}
 , InterfacedNodeWords in 'w:\common\components\rtl\Garant\ScriptEngine\InterfacedNodeWords.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , Bookmark_Const in 'w:\common\components\rtl\Garant\EVD\Bookmark_Const.pas'
 , evDefaultContext in 'w:\common\components\gui\Garant\Everest\evDefaultContext.pas'
 , evCustomTxtReader in 'w:\common\components\gui\Garant\Everest\evCustomTxtReader.pas'
 , evTextFormatter in 'w:\common\components\gui\Garant\Everest\evTextFormatter.pas'
 , evCustomTextFormatter in 'w:\common\components\gui\Garant\Everest\evCustomTextFormatter.pas'
 , evCustomTextFormatterModelPart in 'w:\common\components\gui\Garant\Everest\evCustomTextFormatterModelPart.pas'
 , evdDocumentFilter in 'w:\common\components\rtl\Garant\EVD\evdDocumentFilter.pas'
 , evdPlainTextWriter in 'w:\common\components\rtl\Garant\EVD\evdPlainTextWriter.pas'
 , evdCustomPlainTextWriter in 'w:\common\components\rtl\Garant\EVD\evdCustomPlainTextWriter.pas'
 , evMergedCellFilter in 'w:\common\components\gui\Garant\Everest\evMergedCellFilter.pas'
 , evCellsOffsets in 'w:\common\components\gui\Garant\Everest\evCellsOffsets.pas'
 , evEpsilonLongIntList in 'w:\common\components\gui\Garant\Everest\evEpsilonLongIntList.pas'
 , ShellAPI {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\ShellAPI.pas' {$EndIf}
 , evCustomWikiReader in 'w:\common\components\gui\Garant\Everest\evCustomWikiReader.pas'
 , evStyleTableTools in 'w:\common\components\gui\Garant\Everest\evStyleTableTools.pas'
 , afwFont in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwFont.pas'
 , evStyleHeaderAdder in 'w:\common\components\gui\Garant\Everest\evStyleHeaderAdder.pas'
 , evdNativeUnpackedWriter in 'w:\common\components\rtl\Garant\EVD\evdNativeUnpackedWriter.pas'
 , evDocumentPreview in 'w:\common\components\gui\Garant\Everest\evDocumentPreview.pas'
 , evDocumentPreviewPrim in 'w:\common\components\gui\Garant\Everest\evDocumentPreviewPrim.pas'
 , l3TimeEstimation in 'w:\common\components\rtl\Garant\L3\l3TimeEstimation.pas'
 , afwPreviewCanvas in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewCanvas.pas'
 , l3BaseWithLargeIDList in 'w:\common\components\rtl\Garant\L3\l3BaseWithLargeIDList.pas'
 , l3BaseWithLargeIDListPrim in 'w:\common\components\rtl\Garant\L3\l3BaseWithLargeIDListPrim.pas'
 , evPreviewProcessor in 'w:\common\components\gui\Garant\Everest\evPreviewProcessor.pas'
 , evNotifiedProcessor in 'w:\common\components\gui\Garant\Everest\evNotifiedProcessor.pas'
 , evParaDrawTools in 'w:\common\components\gui\Garant\Everest\evParaDrawTools.pas'
 , nevDocumentProvider in 'w:\common\components\gui\Garant\Everest\nevDocumentProvider.pas'
 , evPreviewForTestsTuning in 'w:\common\components\gui\Garant\Everest\evPreviewForTestsTuning.pas'
 , PrintRowHeightsSpy in 'w:\common\components\gui\Garant\Everest\new\PrintRowHeightsSpy.pas'
 {$If NOT Defined(NoScripts)}
 , afwAnswer in 'w:\common\components\rtl\Garant\L3\afwAnswer.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , l3AFWExceptions in 'w:\common\components\rtl\Garant\L3\l3AFWExceptions.pas'
 , l3BatchService in 'w:\common\components\rtl\Garant\L3\l3BatchService.pas'
 , l3ModalService in 'w:\common\components\rtl\Garant\L3\l3ModalService.pas'
 {$If NOT Defined(NoScripts)}
 , l3ScriptService in 'w:\common\components\rtl\Garant\ScriptEngine\l3ScriptService.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , afwCanvasEx in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCanvasEx.pas'
 , nevPrintView in 'w:\common\components\gui\Garant\Everest\new\nevPrintView.pas'
 , nevBaseDetachedView in 'w:\common\components\gui\Garant\Everest\new\nevBaseDetachedView.pas'
 , l3Prg in 'w:\common\components\rtl\Garant\L3\l3Prg.pas'
 , evAbortFilter in 'w:\common\components\gui\Garant\Everest\evAbortFilter.pas'
 , evHiddenFilter in 'w:\common\components\gui\Garant\Everest\evHiddenFilter.pas'
 , evCommentsEliminator in 'w:\common\components\gui\Garant\Everest\evCommentsEliminator.pas'
 , evdPageParamsFilter in 'w:\common\components\rtl\Garant\EVD\evdPageParamsFilter.pas'
 , evHAFPainterEx in 'w:\common\components\gui\Garant\Everest\evHAFPainterEx.pas'
 , evHAFPainter in 'w:\common\components\gui\Garant\Everest\evHAFPainter.pas'
 , evHAFPainterMacros in 'w:\common\components\gui\Garant\Everest\evHAFPainterMacros.pas'
 {$If Defined(k2ForEditor)}
 , evSBSPar in 'w:\common\components\gui\Garant\Everest\evSBSPar.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , nevHAFPainterView in 'w:\common\components\gui\Garant\Everest\new\nevHAFPainterView.pas'
 , nevVirtualDrawView in 'w:\common\components\gui\Garant\Everest\new\nevVirtualDrawView.pas'
 , nevObjectHolder in 'w:\common\components\gui\Garant\Everest\nevObjectHolder.pas'
 , evEditorWindowProcessor in 'w:\common\components\gui\Garant\Everest\evEditorWindowProcessor.pas'
 , evCustomEditorWindowProcessor in 'w:\common\components\gui\Garant\Everest\evCustomEditorWindowProcessor.pas'
 , evFormatHAFMacroReplacer in 'w:\common\components\gui\Garant\Everest\evFormatHAFMacroReplacer.pas'
 , evCustomHAFMacroReplacer in 'w:\common\components\gui\Garant\Everest\evCustomHAFMacroReplacer.pas'
 , evFixedHAFMacroReplacer in 'w:\common\components\gui\Garant\Everest\new\evFixedHAFMacroReplacer.pas'
 , nevDocumentProviderEx in 'w:\common\components\gui\Garant\Everest\nevDocumentProviderEx.pas'
 , evTagsListFilter in 'w:\common\components\gui\Garant\Everest\evTagsListFilter.pas'
 , evMemoProcessor in 'w:\common\components\gui\Garant\Everest\evMemoProcessor.pas'
 , SimpleDocument_Const in 'w:\common\components\gui\Garant\Everest\SimpleDocument_Const.pas'
 , SimpleDocumentTextPara_Const in 'w:\common\components\gui\Garant\Everest\SimpleDocumentTextPara_Const.pas'
 , evMemoContextMenu in 'w:\common\components\gui\Garant\Everest\evMemoContextMenu.pas'
 , evCustomEditTextSource in 'w:\common\components\gui\Garant\Everest\evCustomEditTextSource.pas'
 , evEditDocumentContainer in 'w:\common\components\gui\Garant\Everest\evEditDocumentContainer.pas'
 , evCustomEditDocumentContainer in 'w:\common\components\gui\Garant\Everest\evCustomEditDocumentContainer.pas'
 , evEditProcessor in 'w:\common\components\gui\Garant\Everest\evEditProcessor.pas'
 , TinyDocument_Const in 'w:\common\components\gui\Garant\Everest\TinyDocument_Const.pas'
 , evConvertTextTools in 'w:\common\components\gui\Garant\Everest\evConvertTextTools.pas'
 {$If NOT Defined(NoVCL)}
 , Themes {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Themes.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , CustomElGraphicButton in 'w:\common\components\gui\Garant\Everest\CustomElGraphicButton.pas'
 , ctTypes in 'w:\common\components\gui\Garant\VT\ComboTree\ctTypes.pas'
 , ElUxTheme in 'w:\common\components\gui\Garant\VT\elClone\Source\ElUxTheme.pas'
 , l3ListenersManager in 'w:\common\components\rtl\Garant\L3\l3ListenersManager.pas'
 , l3WndProcListenersList in 'w:\common\components\rtl\Garant\L3\l3WndProcListenersList.pas'
 , l3CBTListenersList in 'w:\common\components\rtl\Garant\L3\l3CBTListenersList.pas'
 , l3GetMessageListenersList in 'w:\common\components\rtl\Garant\L3\l3GetMessageListenersList.pas'
 , l3WndProcRetListenersList in 'w:\common\components\rtl\Garant\L3\l3WndProcRetListenersList.pas'
 , l3MouseListenersList in 'w:\common\components\rtl\Garant\L3\l3MouseListenersList.pas'
 , l3MouseWheelListenersList in 'w:\common\components\rtl\Garant\L3\l3MouseWheelListenersList.pas'
 , l3ListenersHooks in 'w:\common\components\rtl\Garant\L3\l3ListenersHooks.pas'
 , ElPopBtn in 'w:\common\components\gui\Garant\Everest\ElPopBtn.pas'
 , ElVclUtils in 'w:\common\components\gui\Garant\Everest\ElVclUtils.pas'
 {$If NOT Defined(NoVCL)}
 , l3GetCaptureHelper in 'w:\common\components\rtl\Garant\L3\l3GetCaptureHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 , l3ControlsTypes in 'w:\common\components\rtl\Garant\L3\l3ControlsTypes.pas'
 , AbsSubTree in 'w:\common\components\gui\Garant\VT\ComboTree\AbsSubTree.pas'
 , vtOutlinerWithQuickSearch in 'w:\common\components\gui\Garant\VT\vtOutlinerWithQuickSearch.pas'
 , vtOutliner in 'w:\common\components\gui\Garant\VT\vtOutliner.pas'
 , vtLister in 'w:\common\components\gui\Garant\VT\vtLister.pas'
 , vtHeader in 'w:\common\components\gui\Garant\VT\vtHeader.pas'
 , afwInputControl in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwInputControl.pas'
 , l3LogicalArray in 'w:\common\components\rtl\Garant\L3\l3LogicalArray.pas'
 , OvcColor in 'w:\common\components\rtl\external\Orpheus\OvcColor.pas'
 {$If NOT Defined(NoVCL)}
 , ExtCtrls {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ExtCtrls.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PanelProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\PanelProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , RadioGroupWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\RadioGroupWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , OvcConst in 'w:\common\components\rtl\external\Orpheus\OvcConst.pas'
 , OvcData in 'w:\common\components\rtl\external\Orpheus\OvcData.pas'
 , OvcExcpt in 'w:\common\components\rtl\external\Orpheus\OvcExcpt.pas'
 , vtStdRes in 'w:\common\components\gui\Garant\VT\vtStdRes.pas'
 , l3TabStops in 'w:\common\components\rtl\Garant\L3\l3TabStops.pas'
 , vtMultilineHint in 'w:\common\components\gui\Garant\VT\vtMultilineHint.pas'
 , vtHintManager in 'w:\common\components\gui\Garant\VT\vtHintManager.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , vtHintWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\vtHintWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3FontInfo in 'w:\common\components\rtl\Garant\L3\l3FontInfo.pas'
 , l3CustomControlCanvas in 'w:\common\components\rtl\Garant\L3\l3CustomControlCanvas.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ListerWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ListerWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , vtTreeSource in 'w:\common\components\gui\Garant\VT\vtTreeSource.pas'
 , l3Tree in 'w:\common\components\rtl\Garant\L3\l3Tree.pas'
 , l3ItemsStorage in 'w:\common\components\rtl\Garant\L3\l3ItemsStorage.pas'
 , l3TreeUtils in 'w:\common\components\rtl\Garant\L3\l3TreeUtils.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , vtOutlinerWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\vtOutlinerWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3SimpleTree in 'w:\common\components\rtl\Garant\L3\l3SimpleTree.pas'
 , ctFakeBoxStrings in 'w:\common\components\gui\Garant\VT\ComboTree\ctFakeBoxStrings.pas'
 , ComboBoxStrings in 'w:\common\components\gui\Garant\VT\ComboTree\ComboBoxStrings.pas'
 , ctComboBoxStringsItemNode in 'w:\common\components\gui\Garant\VT\ComboTree\ctComboBoxStringsItemNode.pas'
 {$If NOT Defined(NoScripts)}
 , vtComboTreeWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\vtComboTreeWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , vtComboBoxQS in 'w:\common\components\gui\Garant\VT\vtComboBoxQS.pas'
 , l3Operations in 'w:\common\components\rtl\Garant\L3\l3Operations.pas'
 , l3DropTarget in 'w:\common\components\rtl\Garant\L3\l3DropTarget.pas'
 , l3DropSource in 'w:\common\components\rtl\Garant\L3\l3DropSource.pas'
 , afwVCL in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwVCL.pas'
 , afwHintManager in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwHintManager.pas'
 {$If NOT Defined(NoScripts)}
 , evSchemaWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\evSchemaWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evEvdRd in 'w:\common\components\gui\Garant\Everest\evEvdRd.pas'
 {$If NOT Defined(NoScripts)}
 , evParaWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\evParaWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , EditorParaCoordsToScreenPack in 'w:\common\components\rtl\Garant\ScriptEngine\EditorParaCoordsToScreenPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaCoordsToScreen in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaCoordsToScreen.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwParaCoordsToScreen in 'w:\common\components\rtl\Garant\ScriptEngine\kwParaCoordsToScreen.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaEndCoordsToScreen in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaEndCoordsToScreen.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorParaMiddleCoordsToScreen in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorParaMiddleCoordsToScreen.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopEditorCursorCoordsToScreen in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCursorCoordsToScreen.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene)}
 , vcmMessageFormPrim in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMessageFormPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene)
 {$If NOT Defined(NoVCM)}
 , vcmToolbarsInterfaces in 'w:\common\components\gui\Garant\VCM\vcmToolbarsInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUserTypesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmUserTypesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseUserTypesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmBaseUserTypesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUserTypesCollectionItemPrim in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmUserTypesCollectionItemPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityFormImplementationModelPart in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmEntityFormImplementationModelPart.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmControllers in 'w:\common\components\gui\Garant\VCM\vcmControllers.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , VCMFormsProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\VCMFormsProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 , l3VCLFormPtrList in 'w:\common\components\rtl\Garant\L3\l3VCLFormPtrList.pas'
 {$If NOT Defined(NoVCM)}
 , vcmFormsUtils in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmFormsUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmControlList in 'w:\common\components\gui\Garant\VCM\implementation\vcmControlList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMainForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMainForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMainFormModelPart in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMainFormModelPart.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmContainerForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmContainerForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmContainerFormModelPart in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmContainerFormModelPart.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormSetRefList in 'w:\common\components\gui\Garant\VCM\implementation\vcmFormSetRefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmAggregateRefList in 'w:\common\components\gui\Garant\VCM\implementation\vcmAggregateRefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmIEntityList in 'w:\common\components\gui\Garant\VCM\implementation\vcmIEntityList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMainFormRes in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMainFormRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmDockManagerList in 'w:\common\components\gui\Garant\VCM\implementation\vcmDockManagerList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmLockListenerList in 'w:\common\components\gui\Garant\VCM\implementation\vcmLockListenerList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormDispatcherListenerList in 'w:\common\components\gui\Garant\VCM\implementation\vcmFormDispatcherListenerList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmDispatcher in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmDispatcher.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmIEntityFormPtrList in 'w:\common\components\gui\Garant\VCM\implementation\vcmIEntityFormPtrList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuManager in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenuManager.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoTB97)}
 , tb97vt in 'w:\common\components\rtl\external\tb97\tb97vt.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 {$If NOT Defined(NoTB97)}
 , TB97ExtInterfaces in 'w:\common\components\rtl\external\tb97\TB97ExtInterfaces.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 , evButton in 'w:\common\components\gui\Garant\Everest\evButton.pas'
 {$If NOT Defined(NoTB97)}
 , tb97Ctls in 'w:\common\components\rtl\external\tb97\tb97Ctls.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 {$If NOT Defined(NoTB97)}
 , tb97GraphicControl in 'w:\common\components\rtl\external\tb97\tb97GraphicControl.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoTB97)}
 , tb97WordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\tb97WordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoTB97)
 {$If NOT Defined(NoVCM)}
 , vcmToolbarMenuRes in 'w:\common\components\gui\Garant\VCM\implementation\vcmToolbarMenuRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuItemsCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmMenuItemsCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmUserTypeDefList in 'w:\common\components\gui\Garant\VCM\implementation\vcmUserTypeDefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , IafwMenuUnlockedPostBuildPtrList in 'w:\common\components\gui\Garant\AFW\implementation\IafwMenuUnlockedPostBuildPtrList.pas'
 {$If NOT Defined(NoVCM)}
 , vcmToolbar in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmToolbar.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoTB97)}
 , TB97 in 'w:\common\components\rtl\external\tb97\TB97.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 {$If NOT Defined(NoTB97)}
 , tb97Control in 'w:\common\components\rtl\external\tb97\tb97Control.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 , afwCustomCommonControl in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCustomCommonControl.pas'
 , afwCustomCommonControlPrim in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwCustomCommonControlPrim.pas'
 {$If NOT Defined(NoTB97)}
 , TB97Tlbr in 'w:\common\components\rtl\external\tb97\TB97Tlbr.pas'
 {$IfEnd} // NOT Defined(NoTB97)
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces in 'w:\common\components\gui\Garant\VCM\implementation\vcmLocalInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmControl in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmControl.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , ComCtrls {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ComCtrls.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , TreeNodeWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\TreeNodeWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , TreeViewWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\TreeViewWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , ToolWin {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ToolWin.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , afwDrawing in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwDrawing.pas'
 {$If NOT Defined(NoVCM)}
 , vcmToolbarUtils in 'w:\common\components\gui\Garant\VCM\vcmToolbarUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationAction in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmOperationAction.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , vtDblClickDateEdit in 'w:\common\components\gui\Garant\VT\vtDblClickDateEdit.pas'
 , vtDateEdit in 'w:\common\components\gui\Garant\VT\vtDateEdit.pas'
 , vtPanel in 'w:\common\components\gui\Garant\VT\vtPanel.pas'
 , afwTextControl in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwTextControl.pas'
 , afwTextControlPrim in 'w:\common\components\gui\Garant\AFW\implementation\Visual\afwTextControlPrim.pas'
 {$If NOT Defined(NoVCL)}
 , Buttons {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Buttons.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , vtCalendarPanel in 'w:\common\components\gui\Garant\VT\vtCalendarPanel.pas'
 , vtDateEditRes in 'w:\common\components\gui\Garant\VT\vtDateEditRes.pas'
 , vtCombo in 'w:\common\components\gui\Garant\VT\vtCombo.pas'
 {$If NOT Defined(NoVCL)}
 , Mask {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\Mask.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , vtForm in 'w:\common\components\gui\Garant\VT\vtForm.pas'
 , Spin {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Samples\Spin.pas' {$EndIf}
 , vtLabel in 'w:\common\components\gui\Garant\VT\vtLabel.pas'
 , l3GraphicControlCanvas in 'w:\common\components\rtl\Garant\L3\l3GraphicControlCanvas.pas'
 , MaskUtils {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\MaskUtils.pas' {$EndIf}
 , l3MenuManagerHelper in 'w:\common\components\rtl\Garant\L3\l3MenuManagerHelper.pas'
 , l3DispatcherHelper in 'w:\common\components\rtl\Garant\L3\l3DispatcherHelper.pas'
 {$If NOT Defined(NoVCM)}
 , vcmWinControlActionLink in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmWinControlActionLink.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntitiesDefIteratorForContextMenu in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmEntitiesDefIteratorForContextMenu.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityDefForContextMenu in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmEntityDefForContextMenu.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationsDefIteratorForContextMenu in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmOperationsDefIteratorForContextMenu.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuManagerUtils in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenuManagerUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessages in 'w:\common\components\gui\Garant\VCM\implementation\vcmMessages.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmSettings in 'w:\common\components\gui\Garant\VCM\implementation\vcmSettings.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormHandler in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmFormHandler.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuManagerRes in 'w:\common\components\gui\Garant\VCM\implementation\vcmMenuManagerRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMenuItemsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmMenuItemsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMainMenuAction in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMainMenuAction.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmChromeLikeTypes in 'w:\common\components\gui\Garant\VCM\vcmChromeLikeTypes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMainMenuBuilder in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMainMenuBuilder.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityDefList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmEntityDefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModuleDefList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmModuleDefList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , VCMApllicationSettingsPack in 'w:\common\components\rtl\Garant\ScriptEngine\VCMApllicationSettingsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVGScene)}
 , vg_scene in 'w:\common\components\rtl\external\VGScene\vg_scene.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgScenePrim in 'w:\common\components\rtl\external\VGScene\vgScenePrim.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomControl in 'w:\common\components\rtl\external\VGScene\vgCustomControl.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgInterfaces in 'w:\common\components\rtl\external\VGScene\vgInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgTypes in 'w:\common\components\rtl\external\VGScene\vgTypes.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomObject in 'w:\common\components\rtl\external\VGScene\vgCustomObject.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgComponent in 'w:\common\components\rtl\external\VGScene\vgComponent.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomCanvas in 'w:\common\components\rtl\external\VGScene\vgCustomCanvas.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgPersistent in 'w:\common\components\rtl\external\VGScene\vgPersistent.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomResources in 'w:\common\components\rtl\external\VGScene\vgCustomResources.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomBitmap in 'w:\common\components\rtl\external\VGScene\vgCustomBitmap.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgInterfacedPersistent in 'w:\common\components\rtl\external\VGScene\vgInterfacedPersistent.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgObjectList in 'w:\common\components\rtl\external\VGScene\vgObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgObject in 'w:\common\components\rtl\external\VGScene\vgObject.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgAnyObjectList in 'w:\common\components\rtl\external\VGScene\vgAnyObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgSortableObjectList in 'w:\common\components\rtl\external\VGScene\vgSortableObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgTypesPrim in 'w:\common\components\rtl\external\VGScene\vgTypesPrim.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomObjectList in 'w:\common\components\rtl\external\VGScene\vgCustomObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgVisualObject in 'w:\common\components\rtl\external\VGScene\vgVisualObject.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgBounds in 'w:\common\components\rtl\external\VGScene\vgBounds.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgPosition in 'w:\common\components\rtl\external\VGScene\vgPosition.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoScripts)}
 , VGSceneWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\VGSceneWordsPack.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoScripts)}
 , VGSceneAndWinControlPack in 'w:\common\components\rtl\Garant\ScriptEngine\VGSceneAndWinControlPack.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoVGScene)}
 , vg_controls in 'w:\common\components\rtl\external\VGScene\vg_controls.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoScripts)}
 , VGComboBoxPack in 'w:\common\components\rtl\Garant\ScriptEngine\VGComboBoxPack.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoVGScene)}
 , vg_listbox in 'w:\common\components\rtl\external\VGScene\vg_listbox.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vg_objects in 'w:\common\components\rtl\external\VGScene\vg_objects.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgSceneList in 'w:\common\components\rtl\external\VGScene\vgSceneList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgGradientPoint in 'w:\common\components\rtl\external\VGScene\vgGradientPoint.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgCustomGradientPoint in 'w:\common\components\rtl\external\VGScene\vgCustomGradientPoint.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgGradientPoints in 'w:\common\components\rtl\external\VGScene\vgGradientPoints.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgVisual in 'w:\common\components\rtl\external\VGScene\vgVisual.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vg_extctrls in 'w:\common\components\rtl\external\VGScene\vg_extctrls.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgVisualObjectList in 'w:\common\components\rtl\external\VGScene\vgVisualObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vg_services in 'w:\common\components\rtl\external\VGScene\vg_services.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVCL)}
 , l3GetComponentFromPointHelper in 'w:\common\components\rtl\Garant\L3\l3GetComponentFromPointHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3FormatObjectInfoHelper in 'w:\common\components\rtl\Garant\L3\l3FormatObjectInfoHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3FormatActionInfoHelper in 'w:\common\components\rtl\Garant\L3\l3FormatActionInfoHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3HugeMessageDlgWithWikiHelper in 'w:\common\components\rtl\Garant\L3\l3HugeMessageDlgWithWikiHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3IterateComponentParents in 'w:\common\components\rtl\Garant\L3\l3IterateComponentParents.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , l3GetComponentBoundsHelper in 'w:\common\components\rtl\Garant\L3\l3GetComponentBoundsHelper.pas'
 {$IfEnd} // NOT Defined(NoVCL)
 , vtDialogsResEx in 'w:\common\components\gui\Garant\VT\vtDialogsResEx.pas'
 , vtDialogsRes in 'w:\common\components\gui\Garant\VT\vtDialogsRes.pas'
 {$If NOT Defined(NoVGScene)}
 , vtVGButton in 'w:\common\components\gui\Garant\VT\vtVGButton.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vtVGSceneRes in 'w:\common\components\gui\Garant\VT\vtVGSceneRes.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 , vtF1InterfaceConst in 'w:\common\components\gui\Garant\VT\vtF1InterfaceConst.pas'
 {$If NOT Defined(NoVCM)}
 , vcmMessagesSupport in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMessagesSupport.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessagesCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmMessagesCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessageQueue in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMessageQueue.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessageQueuePrim in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMessageQueuePrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , vtCheckBox in 'w:\common\components\gui\Garant\VT\vtCheckBox.pas'
 , eeCheckBox in 'w:\common\components\gui\Garant\VT\eeCheckBox.pas'
 , nscSimpleEditorForDialogs in 'w:\common\components\gui\Garant\Nemesis\nscSimpleEditorForDialogs.pas'
 , nscSimpleEditor in 'w:\common\components\gui\Garant\Nemesis\nscSimpleEditor.pas'
 , nscSimpleEditorForDialogsTextSource in 'w:\common\components\gui\Garant\Nemesis\nscSimpleEditorForDialogsTextSource.pas'
 , nscSimpleEditorForDialogsContainer in 'w:\common\components\gui\Garant\Nemesis\nscSimpleEditorForDialogsContainer.pas'
 , vtFocusLabel in 'w:\common\components\gui\Garant\VT\vtFocusLabel.pas'
 , l3FormCanvas in 'w:\common\components\rtl\Garant\L3\l3FormCanvas.pas'
 , vtUtils in 'w:\common\components\gui\Garant\VT\vtUtils.pas'
 {$If NOT Defined(NoVCM)}
 , vcmLayoutImplementation in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmLayoutImplementation.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBaseMenuManagerRes in 'w:\common\components\gui\Garant\VCM\implementation\vcmBaseMenuManagerRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExportConst in 'w:\common\components\gui\Garant\VCM\implementation\vcmExportConst.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmContentConst in 'w:\common\components\gui\Garant\VCM\implementation\vcmContentConst.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmRepEntitiesCollection in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmRepEntitiesCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormsCollectionItem in 'w:\common\components\gui\Garant\VCM\implementation\Components\vcmFormsCollectionItem.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationsManager in 'w:\common\components\gui\Garant\VCM\vcmOperationsManager.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmCustomHelpers in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmCustomHelpers.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwEntityOperation in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwEntityOperation.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwEntityOperationPrim in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwEntityOperationPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwEntityOperationTest in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwEntityOperationTest.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwOperationsRegistrar in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwOperationsRegistrar.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , VCMWordsPack in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\VCMWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherLock in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherLock.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , StdRes in 'StdRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherUnlock in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherUnlock.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherBeginOp in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherBeginOp.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherEndOp in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherEndOp.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryGetBackCount in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryGetBackCount.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryGetBackItem in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryGetBackItem.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryGetForwardCount in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryGetForwardCount.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryGetForwardItem in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryGetForwardItem.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpEnabled in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpEnabled.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwOperationParamWord in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwOperationParamWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwOperationParamWordPrim in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwOperationParamWordPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpVisible in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpVisible.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpChecked in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpChecked.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpDefault in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpDefault.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpCaption in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpCaption.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpHint in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpHint.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpImageIndex in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpImageIndex.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpShortcut in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpShortcut.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmOpLongHint in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmOpLongHint.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , RegisterVcmControls in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\RegisterVcmControls.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigator in 'w:\common\components\gui\Garant\VT\vtNavigator.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , ElPgCtlConsts in 'w:\common\components\gui\Garant\VT\elClone\Source\ElPgCtlConsts.pas'
 , vtCustomCommonPanel in 'w:\common\components\gui\Garant\VT\vtCustomCommonPanel.pas'
 , ElPgCtl in 'w:\common\components\gui\Garant\VT\elClone\Source\ElPgCtl.pas'
 , ElXPThemedControl in 'w:\common\components\gui\Garant\VT\elClone\Source\ElXPThemedControl.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PageControlWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\PageControlWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3MsgList in 'w:\common\components\rtl\Garant\L3\l3MsgList.pas'
 {$If NOT Defined(NoVCM)}
 , vtNavigatorFormList in 'w:\common\components\gui\Garant\VT\vtNavigatorFormList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigatorFormListPrim in 'w:\common\components\gui\Garant\VT\vtNavigatorFormListPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigatorFormListPrimPrim in 'w:\common\components\gui\Garant\VT\vtNavigatorFormListPrimPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigatorForm in 'w:\common\components\gui\Garant\VT\vtNavigatorForm.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigatorRes in 'w:\common\components\gui\Garant\VT\vtNavigatorRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npControlsList in 'w:\common\components\gui\Garant\VT\npControlsList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npControlsListPrim in 'w:\common\components\gui\Garant\VT\npControlsListPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npControls in 'w:\common\components\gui\Garant\VT\npControls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npNavigatorList in 'w:\common\components\gui\Garant\VT\npNavigatorList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npNavigatorListCBT in 'w:\common\components\gui\Garant\VT\npNavigatorListCBT.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , npNavigatorListPrim in 'w:\common\components\gui\Garant\VT\npNavigatorListPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vtNavigatorUtils in 'w:\common\components\gui\Garant\VT\vtNavigatorUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , l3PopupControlService in 'w:\common\components\rtl\Garant\L3\l3PopupControlService.pas'
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineForm in 'w:\common\components\gui\Garant\VT\vgRemindersLineForm.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vtPopupForm in 'w:\common\components\gui\Garant\VT\vtPopupForm.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vg_layouts in 'w:\common\components\rtl\external\VGScene\vg_layouts.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVCM)}
 , vcmDockTree in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmDockTree.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , l3DockTree in 'w:\common\components\rtl\Garant\L3\l3DockTree.pas'
 , NewRemindersInterfaces in 'w:\common\components\gui\Garant\VT\NewRemindersInterfaces.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL) AND NOT Defined(NoVGScene) AND NOT Defined(NoVCM)}
 , ReminderWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ReminderWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL) AND NOT Defined(NoVGScene) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM)}
 , vtPopupFormModelPart in 'w:\common\components\gui\Garant\VT\vtPopupFormModelPart.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLine in 'w:\common\components\gui\Garant\VT\vgRemindersLine.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 , afwDockingInterfaces in 'w:\common\components\gui\Garant\AFW\afwDockingInterfaces.pas'
 , vtPngImgList in 'w:\common\components\gui\Garant\VT\vtPngImgList.pas'
 , vtInterfaces in 'w:\common\components\gui\Garant\VT\vtInterfaces.pas'
 , vtPngImgListUtils in 'w:\common\components\gui\Garant\VT\vtPngImgListUtils.pas'
 {$If NOT Defined(NoImageEn)}
 , hyieutils in 'w:\common\components\rtl\external\ImageEn\src\hyieutils.pas'
 {$IfEnd} // NOT Defined(NoImageEn)
 , l3ProcedureList in 'w:\common\components\rtl\Garant\L3\l3ProcedureList.pas'
 {$If NOT Defined(NoImageEn)}
 , hyiedefs in 'w:\common\components\rtl\external\ImageEn\src\hyiedefs.pas'
 {$IfEnd} // NOT Defined(NoImageEn)
 {$If NOT Defined(NoVGScene)}
 , vgReminderConsts in 'w:\common\components\gui\Garant\VT\vgReminderConsts.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgReminderWithAction in 'w:\common\components\gui\Garant\VT\vgReminderWithAction.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineManager in 'w:\common\components\gui\Garant\VT\vgRemindersLineManager.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineList in 'w:\common\components\gui\Garant\VT\vgRemindersLineList.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 , l3ByteList in 'w:\common\components\rtl\Garant\L3\l3ByteList.pas'
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineNotificationProxy in 'w:\common\components\gui\Garant\VT\vgRemindersLineNotificationProxy.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 , spHelpNotifyManager in 'w:\common\components\gui\Garant\AFW\spHelpNotifyManager.pas'
 , l3DwmApi in 'w:\common\components\rtl\Garant\L3\l3DwmApi.pas'
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineTabbedContainerNotificationProxy in 'w:\common\components\gui\Garant\VT\vgRemindersLineTabbedContainerNotificationProxy.pas'
 {$IfEnd} // NOT Defined(NoVGScene)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL) AND NOT Defined(NoVGScene) AND NOT Defined(NoVCM)}
 , RemindersLineWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\RemindersLineWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL) AND NOT Defined(NoVGScene) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryDeleteBackItem in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryDeleteBackItem.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmFindForm in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmFindForm.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryClear in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryClear.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmHistoryDeleteForwardItem in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryDeleteForwardItem.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwTryFocusOnForm in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwTryFocusOnForm.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwObjectCreate in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwObjectCreate.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherLockInOp in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherLockInOp.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
 , kwVcmDispatcherUnlockInOp in 'w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherUnlockInOp.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationsForRegister in 'w:\common\components\gui\Garant\VCM\vcmOperationsForRegister.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmOperationStatesForRegister in 'w:\common\components\gui\Garant\VCM\vcmOperationStatesForRegister.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModulesForRegister in 'w:\common\components\gui\Garant\VCM\vcmModulesForRegister.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmModuleOperationsForRegister in 'w:\common\components\gui\Garant\VCM\vcmModuleOperationsForRegister.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , moToolbarMenu in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\moToolbarMenu.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimToolbarMenu_Module in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\PrimToolbarMenu_Module.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , VCMCustomization_Customization_Contracts in 'w:\common\components\gui\Garant\VCM\View\VCMCustomization_Customization_Contracts.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmTaskPanelInterfaces in 'w:\common\components\gui\Garant\VCM\vcmTaskPanelInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmCustomizeAvailableToolbarOps in 'w:\common\components\gui\Garant\VCM\implementation\Visual\vcmCustomizeAvailableToolbarOps.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , CustomizeTools_Form in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\Forms\CustomizeTools_Form.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimCustomizeTools_Form in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\Forms\PrimCustomizeTools_Form.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(Nemesis)}
 , eeShortCutEdit in 'w:\common\components\gui\Garant\Everest_Engine\eeShortCutEdit.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , CustomizeTools_ut_CustomizeTools_UserType in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\Forms\CustomizeTools_ut_CustomizeTools_UserType.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , CustomizeToolsKeywordsPack in 'w:\common\components\gui\Garant\VCM\View\ToolbarMenu\Forms\CustomizeToolsKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , tfwControlString in 'w:\common\components\rtl\Garant\ScriptEngine\tfwControlString.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , OfficeLikeMain_Form in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLikeMain_Form.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Usual_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_Usual_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , evExtFormat in 'w:\common\components\gui\Garant\Everest\ext\evExtFormat.pas'
 , evdScriptHyperlinkEliminator in 'w:\common\components\gui\Garant\Everest\evdScriptHyperlinkEliminator.pas'
 , evdHyperlinkEliminator in 'w:\common\components\rtl\Garant\EVD\evdHyperlinkEliminator.pas'
 , evPDFWriter in 'w:\common\components\gui\Garant\Everest\evPDFWriter.pas'
 , evCustomPDFWriter in 'w:\common\components\gui\Garant\Everest\evCustomPDFWriter.pas'
 , ddPDFExporter in 'w:\common\components\rtl\Garant\dd\ddPDFExporter.pas'
 , GarantPDFDocument in 'w:\common\components\rtl\external\SynPDF\GarantPDFDocument.pas'
 , SynPDF in 'w:\common\components\rtl\external\SynPDF\SynPDF.pas'
 , SynCommons in 'w:\common\components\rtl\external\SynPDF\SynCommons.pas'
 , SynCrypto in 'w:\common\components\rtl\external\SynPDF\SynCrypto.pas'
 , SynZip in 'w:\common\components\rtl\external\SynPDF\SynZip.pas'
 , SynGdiPlus in 'w:\common\components\rtl\external\SynPDF\SynGdiPlus.pas'
 , SynLZ in 'w:\common\components\rtl\external\SynPDF\SynLZ.pas'
 , nevDocumentProvider4PDF in 'w:\common\components\gui\Garant\Everest\nevDocumentProvider4PDF.pas'
 {$If NOT Defined(NoVCM)}
 , moTasksPanelMenu in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\moTasksPanelMenu.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimTasksPanelMenu_Module in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\PrimTasksPanelMenu_Module.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , CustomizeTasksPanel_Form in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\Forms\CustomizeTasksPanel_Form.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimCustomizeTasksPanel_Form in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\Forms\PrimCustomizeTasksPanel_Form.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , vtCtrls in 'w:\common\components\gui\Garant\VT\vtCtrls.pas'
 , vtButton in 'w:\common\components\gui\Garant\VT\vtButton.pas'
 , eeButton in 'w:\common\components\gui\Garant\VT\eeButton.pas'
 , vtGroupBox in 'w:\common\components\gui\Garant\VT\vtGroupBox.pas'
 , eeTreeView in 'w:\common\components\gui\Garant\Everest_Engine\eeTreeView.pas'
 , eeInterfaces in 'w:\common\components\gui\Garant\Everest_Engine\eeInterfaces.pas'
 , eeConst in 'w:\common\components\gui\Garant\Everest_Engine\eeConst.pas'
 , eeTreeViewExport in 'w:\common\components\gui\Garant\Everest_Engine\eeTreeViewExport.pas'
 , vtOutlinerWithDragDrop in 'w:\common\components\gui\Garant\VT\vtOutlinerWithDragDrop.pas'
 , vtOutlinerWithDragDropRes in 'w:\common\components\gui\Garant\VT\vtOutlinerWithDragDropRes.pas'
 , eeInterfacesEx in 'w:\common\components\gui\Garant\Everest_Engine\eeInterfacesEx.pas'
 , eeNode in 'w:\common\components\gui\Garant\Everest_Engine\eeNode.pas'
 , eeNodeUtils in 'w:\common\components\gui\Garant\Everest_Engine\eeNodeUtils.pas'
 {$If NOT Defined(NoVCM)}
 , CustomizeTasksPanelRes in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\CustomizeTasksPanelRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmCustOpsRepGroupList in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\vcmCustOpsRepGroupList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , CustomizeTasksPanel_ut_CustomizeTasksPanel_UserType in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\Forms\CustomizeTasksPanel_ut_CustomizeTasksPanel_UserType.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , CustomizeTasksPanelKeywordsPack in 'w:\common\components\gui\Garant\VCM\View\TasksPanel\Forms\CustomizeTasksPanelKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , moParentAndChild in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\moParentAndChild.pas'
 , ParentAndChildPrim_Module in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\ParentAndChildPrim_Module.pas'
 , F1Like_Contracts in 'w:\common\components\gui\Garant\VCM\View\F1Like_Contracts.pas'
 , Parent_Form in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\Parent_Form.pas'
 , PrimParent_Form in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\PrimParent_Form.pas'
 , PrimParent_utHistory_UserType in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\PrimParent_utHistory_UserType.pas'
 , F1Like_FormDefinitions_Controls in 'w:\common\components\gui\Garant\VCM\View\F1Like_FormDefinitions_Controls.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ParentKeywordsPack in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\ParentKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , Child_Form in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\Child_Form.pas'
 , PrimChild_Form in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\PrimChild_Form.pas'
 , F1Like_InternalOperations_Controls in 'w:\common\components\gui\Garant\VCM\View\F1Like_InternalOperations_Controls.pas'
 {$If Defined(Nemesis)}
 , nscFormsPageControl in 'w:\common\components\gui\Garant\Nemesis\nscFormsPageControl.pas'
 {$IfEnd} // Defined(Nemesis)
 , nsFormUtils in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\nsFormUtils.pas'
 , PresentationInterfaces in 'w:\common\components\gui\Garant\VCM\View\PresentationInterfaces.pas'
 , vtProportionalPanel in 'w:\common\components\gui\Garant\VT\vtProportionalPanel.pas'
 , PrimChild_cutUsual_UserType in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\PrimChild_cutUsual_UserType.pas'
 , PrimChild_cutForDiction_UserType in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\PrimChild_cutForDiction_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ChildKeywordsPack in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\Forms\ChildKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , MainPrim_Form in 'w:\common\components\gui\Garant\VCM\View\MainPrim_Form.pas'
 {$If NOT Defined(NoVCM)}
 , OfficeLike_System_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_System_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(Nemesis)}
 , nscStatusBar in 'w:\common\components\gui\Garant\Nemesis\nscStatusBar.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscNewInterfaces in 'w:\common\components\gui\Garant\Nemesis\nscNewInterfaces.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscSizeGripPanel in 'w:\common\components\gui\Garant\Nemesis\nscSizeGripPanel.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , StatusBarUtils in 'w:\common\components\gui\Garant\Nemesis\StatusBarUtils.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscStatusBarButton in 'w:\common\components\gui\Garant\Nemesis\nscStatusBarButton.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis) AND NOT Defined(NoScripts)}
 , StatusBarButtonWords in 'w:\common\components\rtl\Garant\ScriptEngine\StatusBarButtonWords.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(NoScripts)
 {$If Defined(Nemesis)}
 , nscStatusBarPanel in 'w:\common\components\gui\Garant\Nemesis\nscStatusBarPanel.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscStatusBarSep in 'w:\common\components\gui\Garant\Nemesis\nscStatusBarSep.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis) AND NOT Defined(NoScripts)}
 , StatusBarWords in 'w:\common\components\rtl\Garant\ScriptEngine\StatusBarWords.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(NoScripts)
 , vtSizeablePanel in 'w:\common\components\gui\Garant\VT\vtSizeablePanel.pas'
 {$If Defined(Nemesis)}
 , nscNavigator in 'w:\common\components\gui\Garant\Nemesis\nscNavigator.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , nsWindowsList in 'w:\common\components\gui\Garant\VCM\UserInteraction\nsWindowsList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , nsWindowsListPrim in 'w:\common\components\gui\Garant\VCM\UserInteraction\nsWindowsListPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLikeAppInterfaces in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLikeAppInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabbedContainerFormDispatcher.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabbedContainerForm.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmChromeLikeTabbedContainerForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabbedContainerForm.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmChromeLikeTabbedContainerFormPrim in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabbedContainerFormPrim.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmGlassForm in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmGlassForm.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmGlassFrame in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmGlassFrame.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , FormFrameDecorator in 'w:\common\components\gui\Garant\ChromeLikeControls\FormFrameDecorator.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeFormFramePainter in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeFormFramePainter.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeWindowCaptionButtonsRes in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeWindowCaptionButtonsRes.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeFormCaptionData in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeFormCaptionData.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeWinUtils in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeWinUtils.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTypes in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTypes.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeBaseWindowCaptionButton in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeBaseWindowCaptionButton.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 , UxTheme {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\UxTheme.pas' {$EndIf}
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeLegacyWindowCaptionButtons in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeLegacyWindowCaptionButtons.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeThemedWindowCaptionButtons in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeThemedWindowCaptionButtons.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeBaseThemedWindowCaptionButton in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeBaseThemedWindowCaptionButton.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetControl in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetControl.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetControlPrim in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetControlPrim.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetTypes in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetTypes.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 , GDIPOBJ {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\GDIPLUS\GDIPOBJ.pas' {$EndIf}
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeDrawingContext in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeDrawingContext.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetUtils in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetUtils.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeInterfaces in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeInterfaces.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeBaseVisualObjectPrim in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeBaseVisualObjectPrim.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeBaseVisualObject in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeBaseVisualObject.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetAnimationManager in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetAnimationManager.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 , MMSystem {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\MMSystem.pas' {$EndIf}
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeBaseVisualObjectList in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeBaseVisualObjectList.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetStyles in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetStyles.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 , GDIPUTIL {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\GDIPLUS\GDIPUTIL.pas' {$EndIf}
 , GDIPAPI {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\GDIPLUS\GDIPAPI.pas' {$EndIf}
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabParams in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabParams.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetControlRes in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetControlRes.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetRes in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeTabSetRes.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmMainMenuStripForChromeLike in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmMainMenuStripForChromeLike.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmBaseMenuForChromeLike in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmBaseMenuForChromeLike.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmMenuForChromeLikeItems in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmMenuForChromeLikeItems.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmMainMenuForChromeLikeTypes in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmMainMenuForChromeLikeTypes.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)}
 , vcmTabbedMenuWordsPack in 'w:\common\components\gui\Garant\VCM\vcmTabbedMenuWordsPack.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmDropDownMenuForChromeLike in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmDropDownMenuForChromeLike.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCL)}
 , ShadowWnd {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\ShadowWnd.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , multimon {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\multimon.pas' {$EndIf}
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmPopupControlWindowService in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmPopupControlWindowService.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerRes in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabbedContainerRes.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmFormSetHistory in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmFormSetHistory.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmFormSetFormHistoryItemList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmFormSetFormHistoryItemList.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmFormSetHistoryStepList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmFormSetHistoryStepList.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmFormSetHistoryItemList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmFormSetHistoryItemList.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmFormSetHistoryStepItemList in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmFormSetHistoryStepItemList.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM)}
 , vcmIEntityFormList in 'w:\common\components\gui\Garant\VCM\implementation\vcmIEntityFormList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmFormSetContainerRegistry in 'w:\common\components\gui\Garant\VCM\implementation\vcmFormSetContainerRegistry.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmAggregate in 'w:\common\components\gui\Garant\VCM\implementation\vcmAggregate.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmTabbedContainersService in 'w:\common\components\gui\Garant\VCM\vcmTabbedContainersService.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)}
 , vcmTabsWordsPack in 'w:\common\components\gui\Garant\VCM\vcmTabsWordsPack.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcherUtils in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabbedContainerFormDispatcherUtils.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM)}
 , vcmHistory in 'w:\common\components\gui\Garant\VCM\implementation\vcmHistory.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmHistoryItemList in 'w:\common\components\gui\Garant\VCM\implementation\vcmHistoryItemList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmHistoryFormNode in 'w:\common\components\gui\Garant\VCM\implementation\vcmHistoryFormNode.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmHistoryRes in 'w:\common\components\gui\Garant\VCM\implementation\vcmHistoryRes.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabsHistoryService in 'w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabsHistoryService.pas'
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM)}
 , vcmHistoryService in 'w:\common\components\gui\Garant\VCM\vcmHistoryService.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmAggregateContainerRegistry in 'w:\common\components\gui\Garant\VCM\implementation\vcmAggregateContainerRegistry.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntityFormsIterable in 'w:\common\components\gui\Garant\VCM\implementation\vcmEntityFormsIterable.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeFormTabParamsList in 'w:\common\components\gui\Garant\ChromeLikeControls\ChromeLikeFormTabParamsList.pas'
 {$IfEnd} // NOT Defined(NoVGScene) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCM)}
 , nsWindowNode in 'w:\common\components\gui\Garant\VCM\UserInteraction\nsWindowNode.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmStringList in 'w:\common\components\gui\Garant\VCM\implementation\vcmStringList.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , nsSettingsConst in 'w:\common\components\gui\Garant\VCM\View\ParentAndChild\nsSettingsConst.pas'
 , nsPrimCachedEvent in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsPrimCachedEvent.pas'
 , nsLogEvent in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsLogEvent.pas'
 , LoggingWrapperInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\LoggingWrapperInterfaces.pas'
 , BaseTypesUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\BaseTypesUnit.pas'
 , IOUnit in 'w:\shared\GCI\IOUnit.pas'
 , LoggingUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\LoggingUnit.pas'
 , nsLogEventData in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsLogEventData.pas'
 , DataAdapter in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\DataAdapter.pas'
 {$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 , DataAdapterInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\DataAdapterInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
 , DocumentUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\DocumentUnit.pas'
 , FoldersUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\FoldersUnit.pas'
 , BaseTreeSupportUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\BaseTreeSupportUnit.pas'
 , ContextSearchSupportUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\ContextSearchSupportUnit.pas'
 , FiltersUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\FiltersUnit.pas'
 , UnderControlUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\UnderControlUnit.pas'
 , DynamicTreeUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\DynamicTreeUnit.pas'
 , SearchDefinesUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\SearchDefinesUnit.pas'
 , DynamicTreeDefinesUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\DynamicTreeDefinesUnit.pas'
 , ExternalObjectUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\ExternalObjectUnit.pas'
 , AdminDomainInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\AdminDomainInterfaces.pas'
 , nsQuestionsWithChoices in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\nsQuestionsWithChoices.pas'
 , nsLoginUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsLoginUtils.pas'
 , bsConvert in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\bsConvert.pas'
 , nsLogManager in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsLogManager.pas'
 , nsLoggingTestService in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsLoggingTestService.pas'
 {$If NOT Defined(NoScripts)}
 , LoggingWordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\LoggingWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , nsCachedEventsProcessor in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsCachedEventsProcessor.pas'
 , nsPrimCachedEventsProcessor in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsPrimCachedEventsProcessor.pas'
 , LoggingInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\LoggingInterfaces.pas'
 , InsDefferedEventList in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\InsDefferedEventList.pas'
 , F1_Application_Template_Services in 'w:\garant6x\implementation\Garant\GbaNemesis\View\F1_Application_Template_Services.pas'
 , SearchUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\SearchUnit.pas'
 , DynamicDocListUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\DynamicDocListUnit.pas'
 , SearchProgressIndicatorUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\SearchProgressIndicatorUnit.pas'
 , ProgressIndicatorSupportUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\ProgressIndicatorSupportUnit.pas'
 {$If NOT Defined(Admin)}
 , nsQueryInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsQueryInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 , moLiteSearch in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\moLiteSearch.pas'
 , LiteSearch_Module in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\LiteSearch_Module.pas'
 , SearchLite_Services in 'w:\garant6x\implementation\Garant\GbaNemesis\View\SearchLite_Services.pas'
 , SearchInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\SearchInterfaces.pas'
 , TreeInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Tree\TreeInterfaces.pas'
 , SimpleListInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\List\SimpleListInterfaces.pas'
 , SearchDomainInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\SearchDomainInterfaces.pas'
 , nsTypes in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\nsTypes.pas'
 , nsTypesNew in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\nsTypesNew.pas'
 , SearchLite_Strange_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\SearchLite_Strange_Controls.pas'
 , PrimAttributeSelect_utAttributeSelect_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimAttributeSelect_utAttributeSelect_UserType.pas'
 , TreeAttributeSelect_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\TreeAttributeSelect_Form.pas'
 , PrimTreeAttributeSelectOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelectOptions_Form.pas'
 , PrimTreeAttributeSelect_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_Form.pas'
 , TreeAttribute_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\TreeAttribute_Form.pas'
 , nsUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsUtils.pas'
 {$If NOT Defined(NoScripts)}
 , F1ShellWordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\F1ShellWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , nsShellService in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsShellService.pas'
 , nsExternalObjectPrim in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsExternalObjectPrim.pas'
 , ddHTMLWriter in 'w:\common\components\rtl\Garant\dd\ddHTMLWriter.pas'
 , ddDocument in 'w:\common\components\rtl\Garant\dd\ddDocument.pas'
 , evdAllParaEliminator in 'w:\common\components\rtl\Garant\EVD\evdAllParaEliminator.pas'
 , ddTextParagraph in 'w:\common\components\rtl\Garant\dd\ddTextParagraph.pas'
 , ddDocumentAtom in 'w:\common\components\rtl\Garant\dd\ddDocumentAtom.pas'
 , ddCustomDestination in 'w:\common\components\rtl\Garant\dd\ddCustomDestination.pas'
 , ddRTFProperties in 'w:\common\components\rtl\Garant\dd\ddRTFProperties.pas'
 , RTFtypes in 'w:\common\components\rtl\Garant\dd\RTFtypes.pas'
 , rtfListTable in 'w:\common\components\rtl\Garant\dd\rtfListTable.pas'
 , ddTypes in 'w:\common\components\rtl\Garant\dd\ddTypes.pas'
 , ddCharacterProperty in 'w:\common\components\rtl\Garant\dd\ddCharacterProperty.pas'
 , ddParagraphProperty in 'w:\common\components\rtl\Garant\dd\ddParagraphProperty.pas'
 , ddTextSegmentsList in 'w:\common\components\rtl\Garant\dd\ddTextSegmentsList.pas'
 , ddTextSegment in 'w:\common\components\rtl\Garant\dd\ddTextSegment.pas'
 , ddHyperlinkTarget in 'w:\common\components\rtl\Garant\dd\ddHyperlinkTarget.pas'
 , ddBaseObject in 'w:\common\components\rtl\Garant\dd\ddBaseObject.pas'
 , ddEVDTypesSupport in 'w:\common\components\rtl\Garant\dd\ddEVDTypesSupport.pas'
 , ddHyperlinkTargetList in 'w:\common\components\rtl\Garant\dd\ddHyperlinkTargetList.pas'
 , ddSubsList in 'w:\common\components\rtl\Garant\dd\ddSubsList.pas'
 , ddSub in 'w:\common\components\rtl\Garant\dd\ddSub.pas'
 , ddTextParaString in 'w:\common\components\rtl\Garant\dd\ddTextParaString.pas'
 , ddHTMLWriterRes in 'w:\common\components\rtl\Garant\dd\ddHTMLWriterRes.pas'
 , nsExternalObjectModelPart in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsExternalObjectModelPart.pas'
 , nsExternalObject in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsExternalObject.pas'
 , nsBrowserInfo in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsBrowserInfo.pas'
 , nsRegistryHelper in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsRegistryHelper.pas'
 , l3WinVersionHelper in 'w:\common\components\rtl\Garant\L3\l3WinVersionHelper.pas'
 , nsDocumentStreamList in 'w:\garant6x\implementation\Garant\GbaNemesis\ExternalObjects\nsDocumentStreamList.pas'
 , bsInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\bsInterfaces.pas'
 , ExternalOperationUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\ExternalOperationUnit.pas'
 , SettingsUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\SettingsUnit.pas'
 , SecurityUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\SecurityUnit.pas'
 , bsTypes in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\bsTypes.pas'
 , bsUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\bsUtils.pas'
 , L10nInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\L10nInterfaces.pas'
 {$If Defined(Nemesis)}
 , nscContextFilter in 'w:\common\components\gui\Garant\Nemesis\nscContextFilter.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscContextFilterRes in 'w:\common\components\gui\Garant\Nemesis\nscContextFilterRes.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscTreeViewHotTruck in 'w:\common\components\gui\Garant\Nemesis\nscTreeViewHotTruck.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscTreeView in 'w:\common\components\gui\Garant\Nemesis\nscTreeView.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Text_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_Text_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Tree_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_Tree_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(Nemesis)}
 , nscTreeViewRes in 'w:\common\components\gui\Garant\Nemesis\nscTreeViewRes.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , vcmDefaultOperations in 'w:\common\components\gui\Garant\VCM\vcmDefaultOperations.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , afwConsts in 'w:\common\components\gui\Garant\AFW\afwConsts.pas'
 , PrimTreeAttributeSelect_astOneLevel_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_astOneLevel_UserType.pas'
 , PrimTreeAttributeSelect_astNone_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_astNone_UserType.pas'
 , nsLogicOperationToFlags in 'w:\garant6x\implementation\Garant\GbaNemesis\Tree\nsLogicOperationToFlags.pas'
 , nsAttrBranchStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsAttrBranchStruct.pas'
 , nsAttributeOneLevelTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsAttributeOneLevelTreeStruct.pas'
 , nsOneLevelTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsOneLevelTreeStruct.pas'
 , nsDataResetTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsDataResetTreeStruct.pas'
 , nsFilterableTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsFilterableTreeStruct.pas'
 , nsTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsTreeStruct.pas'
 , nsRootManager in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsRootManager.pas'
 , nsINodeWrapBase in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeWrapBase.pas'
 , nsINodeRootWrap in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeRootWrap.pas'
 , nsINodeWrap in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeWrap.pas'
 , l3TreeFilters in 'w:\common\components\rtl\Garant\L3\l3TreeFilters.pas'
 , nsAdapterFilters in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsAdapterFilters.pas'
 , nsContextFilterParams in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsContextFilterParams.pas'
 , Il3ContextFilterParamsNotifierPtrList in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\Il3ContextFilterParamsNotifierPtrList.pas'
 , nsINodeOneLevelRootWrap in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeOneLevelRootWrap.pas'
 , nsINodeOneLevelWrap in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeOneLevelWrap.pas'
 , nsAttributeTreeFilters in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsAttributeTreeFilters.pas'
 , nsAttributeTreeCacheNew in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsAttributeTreeCacheNew.pas'
 , l3InterfacedStringList in 'w:\common\components\rtl\Garant\L3\l3InterfacedStringList.pas'
 , GblAdapter
 , nsSelectedAttributesIterators in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsSelectedAttributesIterators.pas'
 , nsTreeAttributeNodesNew in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\nsTreeAttributeNodesNew.pas'
 , nsAttributeTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsAttributeTreeStruct.pas'
 , nsConst in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsConst.pas'
 , nsValueMaps in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsValueMaps.pas'
 , nsIntegerValueMapFactory in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsIntegerValueMapFactory.pas'
 , nsStringValueMapFactory in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsStringValueMapFactory.pas'
 , nsStringValueMapFactoryRes in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsStringValueMapFactoryRes.pas'
 , nsValueMapsIDs in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsValueMapsIDs.pas'
 , nsFirstLevelStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Search\nsFirstLevelStruct.pas'
 , SearchRes in 'w:\garant6x\implementation\Garant\GbaNemesis\View\SearchRes.pas'
 , dsTreeAttributeSelect in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\dsTreeAttributeSelect.pas'
 , nsNewCachableNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsNewCachableNode.pas'
 , deSearch in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\deSearch.pas'
 {$If NOT Defined(Admin)}
 , nsQuery in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\nsQuery.pas'
 {$IfEnd} // NOT Defined(Admin)
 , SearchLite_FormDefinitions_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\SearchLite_FormDefinitions_Controls.pas'
 , tasSaveLoadProxy in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\tasSaveLoadProxy.pas'
 {$If Defined(Nemesis)}
 , nscContextFilterState in 'w:\common\components\gui\Garant\Nemesis\nscContextFilterState.pas'
 {$IfEnd} // Defined(Nemesis)
 , PrimTreeAttributeSelect_astFirstLevel_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_astFirstLevel_UserType.pas'
 , PrimTreeAttributeSelect_astTaxesPublishSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_astTaxesPublishSearch_UserType.pas'
 , PrimTreeAttributeSelect_astPharmPublishSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimTreeAttributeSelect_astPharmPublishSearch_UserType.pas'
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_Result_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , TreeAttributeSelectKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\TreeAttributeSelectKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , AttributeSelect_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\AttributeSelect_Form.pas'
 , PrimAttributeSelectOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimAttributeSelectOptions_Form.pas'
 , PrimAttributeSelect_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimAttributeSelect_Form.pas'
 {$If NOT Defined(NoVCM)}
 , OfficeLike_ResultEx_Controls in 'w:\common\components\gui\Garant\VCM\UserInteraction\OfficeLike_ResultEx_Controls.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 , PrimAttributeSelect_utSingleSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimAttributeSelect_utSingleSearch_UserType.pas'
 , nsNodes in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsNodes.pas'
 , nsBaseNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsBaseNode.pas'
 , nsPrimCacheableNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsPrimCacheableNode.pas'
 , nsPrimAdapterNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsPrimAdapterNode.pas'
 , nsPrimNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsPrimNode.pas'
 , eeVirtualNode in 'w:\common\components\gui\Garant\Everest_Engine\eeVirtualNode.pas'
 , l3VirtualNode in 'w:\common\components\rtl\Garant\L3\l3VirtualNode.pas'
 {$If NOT Defined(Admin)}
 , nsWrapperNode in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsWrapperNode.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , OldTreeInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\OldTreeInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , AttributeSelectKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\AttributeSelectKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , SelectedAttributes_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\SelectedAttributes_Form.pas'
 , PrimSelectedAttributesOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimSelectedAttributesOptions_Form.pas'
 , PrimSelectedAttributes_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimSelectedAttributes_Form.pas'
 , nscTreeViewWithAdapterDragDrop in 'w:\garant6x\implementation\Garant\GbaNemesis\Components\nscTreeViewWithAdapterDragDrop.pas'
 , nsEntitiesTreeDataObject in 'w:\garant6x\implementation\Garant\GbaNemesis\Components\nsEntitiesTreeDataObject.pas'
 , evNodeData in 'w:\common\components\gui\Garant\EverestCommon\evNodeData.pas'
 , evNodeDataObject in 'w:\common\components\gui\Garant\Everest\evNodeDataObject.pas'
 , evNodeStorable in 'w:\common\components\gui\Garant\Everest\evNodeStorable.pas'
 , evStringStorable in 'w:\common\components\gui\Garant\Everest\evStringStorable.pas'
 , evStorable in 'w:\common\components\gui\Garant\Everest\evStorable.pas'
 , evPersistentDataObjectEx in 'w:\common\components\gui\Garant\Everest\evPersistentDataObjectEx.pas'
 , evPersistentDataObject in 'w:\common\components\gui\Garant\Everest\evPersistentDataObject.pas'
 , evFormats in 'w:\common\components\gui\Garant\Everest\evFormats.pas'
 , l3TreeConst in 'w:\common\components\rtl\Garant\L3\l3TreeConst.pas'
 , ddRTFWriter in 'w:\common\components\rtl\Garant\dd\ddRTFWriter.pas'
 , ddRTFExpandedTextWriter in 'w:\common\components\rtl\Garant\dd\ddRTFExpandedTextWriter.pas'
 , ddRTFSegmentWriter in 'w:\common\components\rtl\Garant\dd\ddRTFSegmentWriter.pas'
 , ddTextSegmentQueue in 'w:\common\components\rtl\Garant\dd\ddTextSegmentQueue.pas'
 , ddHyperlink in 'w:\common\components\rtl\Garant\dd\ddHyperlink.pas'
 , ddPicture in 'w:\common\components\rtl\Garant\dd\ddPicture.pas'
 {$If NOT Defined(NoImageEn)}
 , imageenview in 'w:\common\components\rtl\external\ImageEn\src\imageenview.pas'
 {$IfEnd} // NOT Defined(NoImageEn)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoImageEn)}
 , ImageEnPack in 'w:\common\components\rtl\Garant\ScriptEngine\ImageEnPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoImageEn)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoImageEn)}
 , kwImageEnViewerSaveBitmap in 'w:\common\components\rtl\Garant\ScriptEngine\kwImageEnViewerSaveBitmap.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoImageEn)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoImageEn)}
 , kwImageEnControl in 'w:\common\components\rtl\Garant\ScriptEngine\kwImageEnControl.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoImageEn)
 , l3ImageUtils in 'w:\common\components\rtl\Garant\L3\l3ImageUtils.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoImageEn)}
 , ImageEnViewRegistrator in 'w:\common\components\rtl\Garant\ScriptEngine\ImageEnViewRegistrator.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoImageEn)
 , ddRTFUnits in 'w:\common\components\rtl\Garant\dd\ddRTFUnits.pas'
 , ddHexCharReader in 'w:\common\components\rtl\Garant\dd\ddHexCharReader.pas'
 , l3CharSkipper in 'w:\common\components\rtl\Garant\L3\l3CharSkipper.pas'
 , ddPictureSegment in 'w:\common\components\rtl\Garant\dd\ddPictureSegment.pas'
 , ddObjectSegment in 'w:\common\components\rtl\Garant\dd\ddObjectSegment.pas'
 , ddFormulaSegment in 'w:\common\components\rtl\Garant\dd\ddFormulaSegment.pas'
 , nsNodeDataObject in 'w:\garant6x\implementation\Garant\GbaNemesis\Components\nsNodeDataObject.pas'
 , nsNodeStorable in 'w:\garant6x\implementation\Garant\GbaNemesis\Components\nsNodeStorable.pas'
 , nsNodeBaseList in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\nsNodeBaseList.pas'
 , nsSelectedTreeStruct in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\nsSelectedTreeStruct.pas'
 , PrimSelectedAttributes_utSelectedAttributes_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimSelectedAttributes_utSelectedAttributes_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , SelectedAttributesKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\SelectedAttributesKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , moRealCommon in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\moRealCommon.pas'
 , PrimCommon_Module in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\PrimCommon_Module.pas'
 , F1_Application_Template_InternalOperations_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\F1_Application_Template_InternalOperations_Controls.pas'
 , ShutDown_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\ShutDown_Form.pas'
 , PrimShutDown_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\PrimShutDown_Form.pas'
 , f1NotificationManager in 'w:\garant6x\implementation\Garant\GbaNemesis\View\f1NotificationManager.pas'
 , PrimShutDown_sftNone_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\PrimShutDown_sftNone_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ShutDownKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\ShutDownKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , Login_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\Login_Form.pas'
 , PrimLogin_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\PrimLogin_Form.pas'
 {$If Defined(Nemesis)}
 , nscComboBoxWithReadOnly in 'w:\common\components\gui\Garant\Nemesis\nscComboBoxWithReadOnly.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscComboBox in 'w:\common\components\gui\Garant\Nemesis\nscComboBox.pas'
 {$IfEnd} // Defined(Nemesis)
 , nsStartupSupport in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsStartupSupport.pas'
 , nsFlashWindow in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsFlashWindow.pas'
 , Login_ut_Login_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\Login_ut_Login_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , LoginKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\LoginKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , LongProcess_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\LongProcess_Form.pas'
 , PrimLongProcess_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\PrimLongProcess_Form.pas'
 , vtGradientWaitbar in 'w:\common\components\gui\Garant\VT\vtGradientWaitbar.pas'
 , l3AsincMessageWindowRes in 'w:\common\components\rtl\Garant\L3\l3AsincMessageWindowRes.pas'
 , LongProcess_ut_LongProcess_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\LongProcess_ut_LongProcess_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , LongProcessKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\LongProcessKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , DebugStr in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\DebugStr.pas'
 {$If Defined(Nemesis)}
 , F1_Schema in 'w:\common\components\gui\Garant\Everest_Engine\F1_Schema.pas'
 {$IfEnd} // Defined(Nemesis)
 , Everest_Schema in 'w:\common\components\gui\Garant\Everest\Everest_Schema.pas'
 , evNative_Schema in 'w:\common\components\gui\Garant\Everest\evNative_Schema.pas'
 , evdNative_Schema in 'w:\common\components\rtl\Garant\EVD\evdNative_Schema.pas'
 , evdTasks_Schema in 'w:\common\components\rtl\Garant\EVD\evdTasks_Schema.pas'
 , k2Native_Schema in 'w:\common\components\rtl\Garant\K2\k2Native_Schema.pas'
 , k2Core_Schema in 'w:\common\components\rtl\Garant\K2\k2Core_Schema.pas'
 , ddTaskItemPrim in 'w:\common\components\rtl\Garant\EVD\ddTaskItemPrim.pas'
 , evdTaskTypes in 'w:\common\components\rtl\Garant\EVD\evdTaskTypes.pas'
 , csTaskListening in 'w:\common\components\rtl\Garant\EVD\csTaskListening.pas'
 , Task_Const in 'w:\common\components\rtl\Garant\EVD\Task_Const.pas'
 , DateTimeNotNull_Const in 'w:\common\components\rtl\Garant\EVD\DateTimeNotNull_Const.pas'
 , DateTime_Const in 'w:\common\components\rtl\Garant\EVD\DateTime_Const.pas'
 , ULong_Const in 'w:\common\components\rtl\Garant\EVD\ULong_Const.pas'
 , evdNative_AttrValues in 'w:\common\components\rtl\Garant\EVD\evdNative_AttrValues.pas'
 , evNative_AttrValues in 'w:\common\components\gui\Garant\Everest\evNative_AttrValues.pas'
 {$If Defined(Nemesis)}
 , eeDocument_Schema in 'w:\common\components\gui\Garant\Everest_Engine\eeDocument_Schema.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , F1_AttrValues in 'w:\common\components\gui\Garant\Everest_Engine\F1_AttrValues.pas'
 {$IfEnd} // Defined(Nemesis)
 , nsSettings in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Settings\nsSettings.pas'
 , InsUserSettingsListenerPtrList in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Settings\InsUserSettingsListenerPtrList.pas'
 , InsUserSettingsEditListenerPtrList in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Settings\InsUserSettingsEditListenerPtrList.pas'
 , nsContextFilterEventListener in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsContextFilterEventListener.pas'
 , nsContextFilterEventDataList in 'w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsContextFilterEventDataList.pas'
 , evdSchema in 'w:\common\components\gui\Garant\Everest\evdSchema.pas'
 {$If Defined(Archi)}
 , evArchi_Schema in 'w:\common\components\gui\Garant\Everest\evArchi_Schema.pas'
 {$IfEnd} // Defined(Archi)
 {$If Defined(evMyEditor)}
 , My_Schema in 'w:\common\components\gui\Garant\Everest\My_Schema.pas'
 {$IfEnd} // Defined(evMyEditor)
 {$If Defined(DesignTimeLibrary)}
 , Design_Schema in 'w:\common\components\gui\Garant\Everest\Design_Schema.pas'
 {$IfEnd} // Defined(DesignTimeLibrary)
 , Design_AttrValues in 'w:\common\components\gui\Garant\Everest\Design_AttrValues.pas'
 , Logo_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\Logo_Form.pas'
 , Logo_ut_Logo_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\Logo_ut_Logo_UserType.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , LogoKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\LogoKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , nsAppTitleData in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsAppTitleData.pas'
 , f1StartupCompleteNotificationService in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\f1StartupCompleteNotificationService.pas'
 , StartUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\StartUnit.pas'
 , BannerUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\BannerUnit.pas'
 , SPHTMLHelp in 'w:\common\components\gui\Garant\AFW\SPHTMLHelp.pas'
 , PrimMain_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimMain_Form.pas'
 , nsCustomStyleProcessor in 'w:\garant6x\implementation\Garant\GbaNemesis\f1DocumentTagsImplementation\nsCustomStyleProcessor.pas'
 , evCustomStyleManager in 'w:\common\components\gui\Garant\Everest\evCustomStyleManager.pas'
 {$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 , nscDocumentHistory in 'w:\garant6x\implementation\Garant\GbaNemesis\Components\nscDocumentHistory.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
 , PrimMainOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimMainOptions_Form.pas'
 {$If NOT Defined(Admin)}
 , moCommonSearch in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\moCommonSearch.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , CommonSearch_Module in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\CommonSearch_Module.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , Search_Services in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search_Services.pas'
 {$IfEnd} // NOT Defined(Admin)
 , ConfigInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\ConfigInterfaces.pas'
 {$If NOT Defined(Admin)}
 , SaveLoad_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\SaveLoad_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadOptionsWithUserTypes_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadOptionsWithUserTypes_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadOptions_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoad_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoad_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimBaseSearchInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\PrimBaseSearchInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , Search_Strange_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search_Strange_Controls.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPrimListInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\PrimPrimListInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimWorkJournalInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\PrimWorkJournalInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(NoVCM)}
 , vcmItems in 'w:\common\components\gui\Garant\VCM\implementation\vcmItems.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 , FoldersDomainInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\FoldersDomainInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
 {$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 , nsFolders in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsFolders.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
 {$If NOT Defined(Admin)}
 , nsbQueryUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsbQueryUtils.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 , nsFolderFilterInfo in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsFolderFilterInfo.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
 {$If NOT Defined(Admin)}
 , Search_FormDefinitions_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search_FormDefinitions_Controls.pas'
 {$IfEnd} // NOT Defined(Admin)
 , nsTabbedInterfaceTypes in 'w:\garant6x\implementation\Garant\GbaNemesis\TabInterface\nsTabbedInterfaceTypes.pas'
 , TabbedContainerRes in 'w:\garant6x\implementation\Garant\GbaNemesis\TabInterface\TabbedContainerRes.pas'
 {$If NOT Defined(Admin)}
 , nsQueryUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsQueryUtils.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , ContextHistoryInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\ContextHistoryInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsQueryAttribute in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsQueryAttribute.pas'
 {$IfEnd} // NOT Defined(Admin)
 , l3CObjectRefList in 'w:\common\components\rtl\Garant\L3\l3CObjectRefList.pas'
 {$If NOT Defined(Admin)}
 , BaseSearchInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\BaseSearchInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 , evControlParaTools in 'w:\common\components\gui\Garant\Everest\qf\evControlParaTools.pas'
 {$If NOT Defined(Admin)}
 , nsContextUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsContextUtils.pas'
 {$IfEnd} // NOT Defined(Admin)
 , nsVerifyValue in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsVerifyValue.pas'
 , nsTreeUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsTreeUtils.pas'
 {$If Defined(Nemesis)}
 , eeTreeMisc in 'w:\common\components\gui\Garant\Everest_Engine\eeTreeMisc.pas'
 {$IfEnd} // Defined(Nemesis)
 , SystemStr in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\SystemStr.pas'
 {$If NOT Defined(Admin)}
 , nsSearchClasses in 'w:\garant6x\implementation\Garant\GbaNemesis\QueryCardProcessing\nsSearchClasses.pas'
 {$IfEnd} // NOT Defined(Admin)
 , MonitoringUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\MonitoringUnit.pas'
 , nsQueryExecuteProgressIndicator in 'w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\nsQueryExecuteProgressIndicator.pas'
 , nsManagers in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsManagers.pas'
 {$If Defined(vcmUseProfilers)}
 , ProfilersInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\ProfilersInterfaces.pas'
 {$IfEnd} // Defined(vcmUseProfilers)
 , nsQuestions in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\nsQuestions.pas'
 {$If NOT Defined(Admin)}
 , nsContextHistory in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsContextHistory.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsInpharmContextHistory in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsInpharmContextHistory.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsInpharmContextHistoryPrim in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsInpharmContextHistoryPrim.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , InsContextSearchHistoryNotifierList in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\InsContextSearchHistoryNotifierList.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsDocumentContextHistory in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsDocumentContextHistory.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsDocumentContextHistoryPrim in 'w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsDocumentContextHistoryPrim.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsDataExchangeProxy in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsDataExchangeProxy.pas'
 {$IfEnd} // NOT Defined(Admin)
 , ConsultingUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\ConsultingUnit.pas'
 {$If NOT Defined(Admin)}
 , nsPostingsTreeSingle in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsPostingsTreeSingle.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsPostingsLine in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsPostingsLine.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsPrimeNode in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsPrimeNode.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimeDomainInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PrimeDomainInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 , PrimeUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\PrimeUnit.pas'
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtAttribute_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtAttribute_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtKW_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtKW_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtOldKW_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtOldKW_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtPublishSource_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtPublishSource_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtFilters_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtFilters_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtLegislationReview_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtLegislationReview_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtPostingOrder_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtPostingOrder_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtConsult_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtConsult_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimSaveLoadUserTypes_slqtInpharmSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtInpharmSearch_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , SaveLoadKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\SaveLoadKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , QueryCard_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\QueryCard_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCardOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCardOptions_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , QueryCardInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\QueryCardInterfaces.pas'
 {$IfEnd} // NOT Defined(Admin)
 , evQueryCardEditor in 'w:\common\components\gui\Garant\Everest\evQueryCardEditor.pas'
 , evEditor in 'w:\common\components\gui\Garant\Everest\evEditor.pas'
 , evTunedEditor in 'w:\common\components\gui\Garant\Everest\evTunedEditor.pas'
 , evQueryCardEditorHotSpot in 'w:\common\components\gui\Garant\Everest\evQueryCardEditorHotSpot.pas'
 , evQueryCardSelection in 'w:\common\components\gui\Garant\Everest\evQueryCardSelection.pas'
 {$If NOT Defined(NoScripts)}
 , QueryCardProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\QueryCardProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeSetWithLogicOperation in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeSetWithLogicOperation.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwQueryCardFromStackWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwQueryCardFromStackWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , evReqIterator in 'w:\common\components\gui\Garant\Everest\evReqIterator.pas'
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardSetAttribute in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardSetAttribute.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeSetCollapsed in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeSetCollapsed.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeSetFocus in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeSetFocus.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeGetFocus in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeGetFocus.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeGetCollapsed in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeGetCollapsed.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeGetLogicOperation in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeGetLogicOperation.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardAttributeIsLogicOperationEnabled in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardAttributeIsLogicOperationEnabled.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwPopQueryCardGetCurrentReqName in 'w:\common\components\rtl\Garant\ScriptEngine\kwPopQueryCardGetCurrentReqName.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_utqcSendConsultation_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_utqcSendConsultation_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_utqcLegislationReview_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_utqcLegislationReview_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_utqcPostingOrder_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_utqcPostingOrder_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_utqcAttributeSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_utqcAttributeSearch_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimQueryCard_utqcInpharmSearch_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimQueryCard_utqcInpharmSearch_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 , evControlContainerEX in 'w:\common\components\gui\Garant\Everest\qf\evControlContainerEX.pas'
 , evControlContainer in 'w:\common\components\gui\Garant\Everest\qf\evControlContainer.pas'
 , evCustomControlTool in 'w:\common\components\gui\Garant\Everest\qf\evCustomControlTool.pas'
 , evQueryGroupList in 'w:\common\components\gui\Garant\Everest\qf\evQueryGroupList.pas'
 , evQueryCardConst in 'w:\common\components\gui\Garant\Everest\qf\evQueryCardConst.pas'
 , evControlGroup in 'w:\common\components\gui\Garant\Everest\qf\evControlGroup.pas'
 , evReqList in 'w:\common\components\gui\Garant\Everest\qf\evReqList.pas'
 , evDescriptionReqList in 'w:\common\components\gui\Garant\Everest\qf\evDescriptionReqList.pas'
 , evReq in 'w:\common\components\gui\Garant\Everest\qf\evReq.pas'
 , evEditorControlFieldList in 'w:\common\components\gui\Garant\Everest\qf\evEditorControlFieldList.pas'
 , evEditorControlList in 'w:\common\components\gui\Garant\Everest\qf\evEditorControlList.pas'
 , evControl in 'w:\common\components\gui\Garant\Everest\qf\evControl.pas'
 , evButtonControl in 'w:\common\components\gui\Garant\Everest\qf\evButtonControl.pas'
 , evQueryCardDropControlsInt in 'w:\common\components\gui\Garant\Everest\qf\evQueryCardDropControlsInt.pas'
 , evDropCalendarControl in 'w:\common\components\gui\Garant\Everest\qf\evDropCalendarControl.pas'
 , evDropControl in 'w:\common\components\gui\Garant\Everest\qf\evDropControl.pas'
 , evEditControl in 'w:\common\components\gui\Garant\Everest\qf\evEditControl.pas'
 , evDropCombo in 'w:\common\components\gui\Garant\Everest\qf\evDropCombo.pas'
 , evLabel in 'w:\common\components\gui\Garant\Everest\qf\evLabel.pas'
 , evSimpleEdit in 'w:\common\components\gui\Garant\Everest\qf\evSimpleEdit.pas'
 , evMemoEdit in 'w:\common\components\gui\Garant\Everest\qf\evMemoEdit.pas'
 , evEmailEdit in 'w:\common\components\gui\Garant\Everest\qf\evEmailEdit.pas'
 , evPhoneEdit in 'w:\common\components\gui\Garant\Everest\qf\evPhoneEdit.pas'
 {$If Defined(k2ForEditor)}
 , evReqRowImplementation in 'w:\common\components\gui\Garant\Everest\evReqRowImplementation.pas'
 {$IfEnd} // Defined(k2ForEditor)
 {$If Defined(k2ForEditor)}
 , evTableImplementation in 'w:\common\components\gui\Garant\Everest\evTableImplementation.pas'
 {$IfEnd} // Defined(k2ForEditor)
 , evDescriptionReq in 'w:\common\components\gui\Garant\Everest\qf\evDescriptionReq.pas'
 , evDropCalendar in 'w:\common\components\gui\Garant\Everest\qf\evDropCalendar.pas'
 , evDropTree in 'w:\common\components\gui\Garant\Everest\qf\evDropTree.pas'
 {$If NOT Defined(Admin)}
 , MainMenuNewRes in 'w:\garant6x\implementation\Garant\GbaNemesis\View\MainMenuNewRes.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , f1QueryDocumentContainer in 'w:\garant6x\implementation\Garant\GbaNemesis\QueryCardProcessing\f1QueryDocumentContainer.pas'
 {$IfEnd} // NOT Defined(Admin)
 , evQueryDocumentContainer in 'w:\common\components\gui\Garant\Everest\qf\evQueryDocumentContainer.pas'
 , evQueryCardProcessor in 'w:\common\components\gui\Garant\Everest\qf\evQueryCardProcessor.pas'
 , evControlGenerator in 'w:\common\components\gui\Garant\Everest\qf\evControlGenerator.pas'
 , k2IUnknownTag in 'w:\common\components\rtl\Garant\K2\k2IUnknownTag.pas'
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts)}
 , PrimQueryCardWordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\PrimQueryCardWordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwFormFromControlWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwFormFromControlWord.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , nsDocumentPreview in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsDocumentPreview.pas'
 {$IfEnd} // NOT Defined(Admin)
 , evEvdDataObject in 'w:\common\components\gui\Garant\Everest\evEvdDataObject.pas'
 , evReaderDataObject in 'w:\common\components\gui\Garant\Everest\evReaderDataObject.pas'
 , evStreamedDataObject in 'w:\common\components\gui\Garant\Everest\evStreamedDataObject.pas'
 {$If NOT Defined(Admin)}
 , nsHAFPainter in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsHAFPainter.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsHAFPainterPrim in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsHAFPainterPrim.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsFixedHAFMacroReplacer in 'w:\garant6x\implementation\Garant\GbaNemesis\Search\nsFixedHAFMacroReplacer.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If Defined(Nemesis)}
 , eeDocumentContainer in 'w:\common\components\gui\Garant\Everest_Engine\eeDocumentContainer.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , eeDocumentContainerPrim in 'w:\common\components\gui\Garant\Everest_Engine\eeDocumentContainerPrim.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , eeProcessor in 'w:\common\components\gui\Garant\Everest_Engine\eeProcessor.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , eeDocumentPartGenerator in 'w:\common\components\gui\Garant\Everest_Engine\eeDocumentPartGenerator.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , eeSubExport in 'w:\common\components\gui\Garant\Everest_Engine\eeSubExport.pas'
 {$IfEnd} // Defined(Nemesis)
 , evCommentParaDecorator in 'w:\common\components\gui\Garant\Everest\evCommentParaDecorator.pas'
 , evLeafParaDecorationsHolderEliminator in 'w:\common\components\gui\Garant\EverestCommon\evLeafParaDecorationsHolderEliminator.pas'
 , evBlocksEliminator in 'w:\common\components\gui\Garant\EverestCommon\evBlocksEliminator.pas'
 , evUserCommentFilter in 'w:\common\components\gui\Garant\Everest\evUserCommentFilter.pas'
 , evCommentDecorator in 'w:\common\components\gui\Garant\Everest\evCommentDecorator.pas'
 , evNestedDocumentEliminator in 'w:\common\components\gui\Garant\Everest\evNestedDocumentEliminator.pas'
 , evCommentParaAdder in 'w:\common\components\gui\Garant\Everest\evCommentParaAdder.pas'
 , evPageBreakEliminator in 'w:\common\components\gui\Garant\Everest\evPageBreakEliminator.pas'
 , evControlParaFilter in 'w:\common\components\gui\Garant\Everest\evControlParaFilter.pas'
 , evBlocksButNotCommentsEliminator in 'w:\common\components\gui\Garant\Everest\evBlocksButNotCommentsEliminator.pas'
 , evStrictContentsElementEliminator in 'w:\common\components\gui\Garant\EverestCommon\evStrictContentsElementEliminator.pas'
 , ComObj {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Common\ComObj.pas' {$EndIf}
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , QueryCardKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\QueryCardKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , Preview_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\Preview_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPreview_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPreview_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , Search_ScalingSupport_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search_ScalingSupport_Controls.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If Defined(Nemesis)}
 , nscPreviewPanel in 'w:\common\components\gui\Garant\Nemesis\nscPreviewPanel.pas'
 {$IfEnd} // Defined(Nemesis)
 , eePreviewPanel in 'w:\common\components\gui\Garant\Everest_Engine\eePreviewPanel.pas'
 , vtCustomPreviewPanel in 'w:\common\components\gui\Garant\VT\vtCustomPreviewPanel.pas'
 {$If NOT Defined(Admin)}
 , nsTrialSupport in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsTrialSupport.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPreview_utPrintPreview_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPreview_utPrintPreview_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PreviewFormKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PreviewFormKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , PageSetup_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PageSetup_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPageSetupOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPageSetupOptions_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPageSetup_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPageSetup_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If Defined(Nemesis)}
 , nscPageControl in 'w:\common\components\gui\Garant\Nemesis\nscPageControl.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(Admin)}
 , nsPageSetup in 'w:\garant6x\implementation\Garant\GbaNemesis\View\nsPageSetup.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPageSetup_pstNone_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPageSetup_pstNone_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PageSetupKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PageSetupKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , PrintDialog_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrintDialog_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPrintDialogOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPrintDialogOptions_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPrintDialog_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimPrintDialog_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 , vtRadioButton in 'w:\common\components\gui\Garant\VT\vtRadioButton.pas'
 , vtSpinEdit in 'w:\common\components\gui\Garant\VT\vtSpinEdit.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , SpinEditWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\SpinEditWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , PreviewInterfaces in 'w:\garant6x\implementation\Garant\GbaNemesis\Model\PreviewInterfaces.pas'
 , l3RangeManager in 'w:\common\components\rtl\Garant\L3\l3RangeManager.pas'
 {$If NOT Defined(Admin)}
 , PrintDialog_ut_PrintDialog_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrintDialog_ut_PrintDialog_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PrintDialogKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrintDialogKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , tasSaveLoadRealization in 'w:\garant6x\implementation\Garant\GbaNemesis\View\tasSaveLoadRealization.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , ShellAndMonitoringsMain_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\ShellAndMonitoringsMain_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , moCommonPost in 'w:\garant6x\implementation\Garant\GbaNemesis\View\moCommonPost.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , CommonPost_Module in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\CommonPost_Module.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PostingOrder_FormDefinitions_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PostingOrder_FormDefinitions_Controls.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(NoVCL)}
 , FileCtrl {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Vcl\FileCtrl.pas' {$EndIf}
 {$IfEnd} // NOT Defined(NoVCL)
 , nsOpenUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsOpenUtils.pas'
 , MainMenuUnit in 'w:\garant6x\implementation\Garant\GblAdapterLib\MainMenuUnit.pas'
 {$If NOT Defined(Admin)}
 , PostingOrder_Strange_Controls in 'w:\garant6x\implementation\Garant\GbaNemesis\View\PostingOrder_Strange_Controls.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , nsFindSelectDialog in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\nsFindSelectDialog.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PostingsList_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\Forms\PostingsList_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPostingsListOptions_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\Forms\PrimPostingsListOptions_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimPostingsList_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\Forms\PrimPostingsList_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 , vtSaveDialog in 'w:\common\components\gui\Garant\VT\vtSaveDialog.pas'
 {$If NOT Defined(Admin)}
 , PrimPostingsList_MyPostingList_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\Forms\PrimPostingsList_MyPostingList_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PostingsListKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\View\Monitorings\Forms\PostingsListKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(Admin)}
 , PrimMonitoringsMain_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\PrimMonitoringsMain_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , PrimMonitoringsMain_utEmptyMainWindow_UserType in 'w:\garant6x\implementation\Garant\GbaNemesis\PrimMonitoringsMain_utEmptyMainWindow_UserType.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin)}
 , MonitoringsMain_Form in 'w:\garant6x\implementation\Garant\GbaNemesis\MonitoringsMain_Form.pas'
 {$IfEnd} // NOT Defined(Admin)
 {$If NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , MonitoringsMainKeywordsPack in 'w:\garant6x\implementation\Garant\GbaNemesis\MonitoringsMainKeywordsPack.pas'
 {$IfEnd} // NOT Defined(Admin) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(XE)}
 , F1Test in 'w:\garant6x\implementation\Garant\GbaNemesis\F1Test.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , F1Test_Tree_TestUnit in 'w:\garant6x\implementation\Garant\GbaNemesis\F1Test_Tree_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , nsDocumentsList_p in 'w:\garant6x\implementation\Garant\GbaNemesis\nsDocumentsList_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , TestDocListUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\TestDocListUtils.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , MessageOnDesktop in 'w:\garant6x\implementation\Garant\GbaNemesis\MessageOnDesktop.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , TestStringUtils in 'w:\garant6x\implementation\Garant\GbaNemesis\TestStringUtils.pas'
 {$IfEnd} // NOT Defined(XE)
 , Variants
 , tc5OpenAppClasses
 , tc5PublicInfo
 , tc6OpenAppClasses
 , tc6PublicInfo
 {$If NOT Defined(XE)}
 , EverestTest in 'w:\common\components\gui\Garant\Everest\EverestTest.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , EverestTest_Editors_TestUnit in 'w:\common\components\gui\Garant\Everest\EverestTest_Editors_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , nevSelection_p in 'w:\common\components\gui\Garant\Everest\nevSelection_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , afwCaret_p in 'w:\common\components\gui\Garant\Everest\afwCaret_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , evTunedEditor_p in 'w:\common\components\gui\Garant\Everest\evTunedEditor_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , afwCustomCaretType_p in 'w:\common\components\gui\Garant\Everest\afwCustomCaretType_p.pas'
 {$IfEnd} // NOT Defined(XE)
 , tc5OpenApp
 , tc6OpenApp
 {$If NOT Defined(XE)}
 , VTTest in 'w:\common\components\gui\Garant\VT\VTTest.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , VTTest_ComboTree_TestUnit in 'w:\common\components\gui\Garant\VT\VTTest_ComboTree_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , FakeBox_p in 'w:\common\components\gui\Garant\VT\FakeBox_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , SubTree_p in 'w:\common\components\gui\Garant\VT\SubTree_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , VTTest_NewReminders_TestUnit in 'w:\common\components\gui\Garant\VT\VTTest_NewReminders_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , vgRemindersLine_p in 'w:\common\components\gui\Garant\VT\vgRemindersLine_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , vgReminder_p in 'w:\common\components\gui\Garant\VT\vgReminder_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM)}
 , VCMTest in 'w:\common\components\gui\Garant\VCM\VCMTest.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM)}
 , VCMTest_Profilers_TestUnit in 'w:\common\components\gui\Garant\VCM\VCMTest_Profilers_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM)}
 , vcmProfilersCollection_p in 'w:\common\components\gui\Garant\VCM\vcmProfilersCollection_p.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmProfilersCollection in 'w:\common\components\gui\Garant\VCM\implementation\vcmProfilersCollection.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmProfiler in 'w:\common\components\gui\Garant\VCM\implementation\vcmProfiler.pas'
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , VCMTest_ChromeLike_TestUnit in 'w:\common\components\gui\Garant\VCM\VCMTest_ChromeLike_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , vcmBaseMenuForChromeLike_p in 'w:\common\components\gui\Garant\VCM\vcmBaseMenuForChromeLike_p.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , vcmMenuForChromeLikeItemWrap in 'w:\common\components\gui\Garant\VCM\vcmMenuForChromeLikeItemWrap.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , RectWrap in 'w:\common\components\gui\Garant\VCM\RectWrap.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTabSetControl_p in 'w:\common\components\gui\Garant\VCM\ChromeLikeTabSetControl_p.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)}
 , ChromeLikeTab_p in 'w:\common\components\gui\Garant\VCM\ChromeLikeTab_p.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVCM) AND NOT Defined(NoTabs)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , NemesisTest in 'w:\common\components\gui\Garant\Nemesis\NemesisTest.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , NemesisTest_Navigator_TestUnit in 'w:\common\components\gui\Garant\Nemesis\NemesisTest_Navigator_TestUnit.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , nscNavigatorPageControl_p in 'w:\common\components\gui\Garant\Nemesis\nscNavigatorPageControl_p.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , NemesisTest_Tree_TestUnit in 'w:\common\components\gui\Garant\Nemesis\NemesisTest_Tree_TestUnit.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , eeTreeViewExport_p in 'w:\common\components\gui\Garant\Nemesis\eeTreeViewExport_p.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis)}
 , nscTaskPanelInterfaces in 'w:\common\components\gui\Garant\Nemesis\nscTaskPanelInterfaces.pas'
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , NemesisTest_Editor_TestUnit in 'w:\common\components\gui\Garant\Nemesis\NemesisTest_Editor_TestUnit.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If Defined(Nemesis) AND NOT Defined(XE)}
 , nscSimpleEditor_p in 'w:\common\components\gui\Garant\Nemesis\nscSimpleEditor_p.pas'
 {$IfEnd} // Defined(Nemesis) AND NOT Defined(XE)
 {$If NOT Defined(XE)}
 , AFWTest in 'w:\common\components\gui\Garant\AFW\AFWTest.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , AFWTest_VCL_TestUnit in 'w:\common\components\gui\Garant\AFW\AFWTest_VCL_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , MenuItem_p in 'w:\common\components\gui\Garant\AFW\MenuItem_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , Menu_p in 'w:\common\components\gui\Garant\AFW\Menu_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , Control_p in 'w:\common\components\gui\Garant\AFW\Control_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , WinControl_p in 'w:\common\components\gui\Garant\AFW\WinControl_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , AFWTest_Rtl_TestUnit in 'w:\common\components\gui\Garant\AFW\AFWTest_Rtl_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE)}
 , Component_p in 'w:\common\components\gui\Garant\AFW\Component_p.pas'
 {$IfEnd} // NOT Defined(XE)
 {$If NOT Defined(XE) AND NOT Defined(NoVGScene)}
 , VGSceneTest in 'w:\common\components\rtl\external\VGScene\VGSceneTest.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVGScene)
 {$If NOT Defined(XE) AND NOT Defined(NoVGScene)}
 , VGSceneTest_Impl_TestUnit in 'w:\common\components\rtl\external\VGScene\VGSceneTest_Impl_TestUnit.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVGScene)
 {$If NOT Defined(XE) AND NOT Defined(NoVGScene)}
 , vgVisualObject_p in 'w:\common\components\rtl\external\VGScene\vgVisualObject_p.pas'
 {$IfEnd} // NOT Defined(XE) AND NOT Defined(NoVGScene)
 , l3MouseWheelHelper in 'w:\common\components\rtl\Garant\L3\l3MouseWheelHelper.pas'
 , PrimeTestRes in 'w:\garant6x\implementation\Garant\GbaNemesis\PrimeTestRes.pas'
 {$If NOT Defined(NotTunedDUnit) AND NOT Defined(NoScripts)}
 , tfwScriptDebugger in 'w:\common\components\rtl\Garant\DUnitTuning\tfwScriptDebugger.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit) AND NOT Defined(NoScripts)
 {$If NOT Defined(NotTunedDUnit) AND NOT Defined(NoScripts)}
 , vcmInsiderTest in 'w:\common\components\rtl\Garant\DUnitTuning\vcmInsiderTest.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit) AND NOT Defined(NoScripts)
 {$If NOT Defined(NotTunedDUnit)}
 , BaseTest in 'w:\common\components\rtl\Garant\DUnitTuning\BaseTest.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 , TestFrameWork in 'w:\common\components\rtl\external\DUnit\src\TestFrameWork.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ITestWordsPack in 'w:\common\components\rtl\Garant\DUnit_Script_Support\ITestWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , l3CardinalList in 'w:\common\components\rtl\Garant\L3\l3CardinalList.pas'
 {$If NOT Defined(NotTunedDUnit)}
 , KTestRunner in 'w:\common\components\rtl\Garant\DUnitTuning\KTestRunner.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , TestNameList in 'w:\common\components\rtl\Garant\DUnitTuning\TestNameList.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , TestNameString in 'w:\common\components\rtl\Garant\DUnitTuning\TestNameString.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 , TextTestRunner in 'w:\common\components\rtl\external\DUnit\src\TextTestRunner.pas'
 {$If NOT Defined(NotTunedDUnit)}
 , TimeInfoList in 'w:\common\components\rtl\Garant\DUnitTuning\TimeInfoList.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , ExcludedTests in 'w:\common\components\rtl\Garant\DUnitTuning\ExcludedTests.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , ExcludedTestsFolders in 'w:\common\components\rtl\Garant\DUnitTuning\ExcludedTestsFolders.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , TestDocumentList in 'w:\common\components\rtl\Garant\DUnitTuning\TestDocumentList.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 , vtVerInf in 'w:\common\components\rtl\Garant\L3\vtVerInf.pas'
 , l3VersionInfoService in 'w:\common\components\rtl\Garant\L3\l3VersionInfoService.pas'
 , JwaWinBase {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\Win32API\JwaWinBase.pas' {$EndIf}
 , JwaNtStatus {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\Win32API\JwaNtStatus.pas' {$EndIf}
 , JwaWinNT {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\Win32API\JwaWinNT.pas' {$EndIf}
 , JwaWinType {$IfNDef XE4} in 'w:\common\components\rtl\external\JEDI\Win32API\JwaWinType.pas' {$EndIf}
 {$If Defined(MTDORB) AND Defined(NoKPageTool) AND NOT Defined(NotTunedDUnit)}
 , KBridge in 'w:\common\components\rtl\Garant\DUnitTuning\KBridge.pas'
 {$IfEnd} // Defined(MTDORB) AND Defined(NoKPageTool) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , orb_int in 'w:\common\components\rtl\external\MTDOrb\src\orbint\orb_int.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , SecuritySrv_int in 'w:\common\components\rtl\external\MTDOrb\build\SecuritySrv_int.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , CosNaming_int in 'w:\common\components\rtl\external\MTDOrb\src\idl\CosNaming_int.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , Contents_int in 'w:\common\components\rtl\Garant\ServerGate\Contents_int.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , GarORBInitializerImpl in 'w:\common\components\rtl\Garant\GarORB\GarORBInitializerImpl.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , pi in 'w:\common\components\rtl\external\MTDOrb\src\idl\pi.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , pi_int in 'w:\common\components\rtl\external\MTDOrb\src\idl\pi_int.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , orb in 'w:\common\components\rtl\external\MTDOrb\src\orb\orb.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , GarClientSecurity in 'w:\common\components\rtl\Garant\GarORB\GarClientSecurity.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , orbtypes in 'w:\common\components\rtl\external\MTDOrb\src\orb\orbtypes.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , pi_impl in 'w:\common\components\rtl\external\MTDOrb\src\orb\pi_impl.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , CosNaming in 'w:\common\components\rtl\external\MTDOrb\src\idl\CosNaming.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , SecuritySrv in 'w:\common\components\rtl\external\MTDOrb\build\SecuritySrv.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If Defined(MTDORB) AND NOT Defined(NotTunedDUnit)}
 , Contents in 'w:\common\components\rtl\Garant\ServerGate\Contents.pas'
 {$IfEnd} // Defined(MTDORB) AND NOT Defined(NotTunedDUnit)
 {$If NOT Defined(NotTunedDUnit)}
 , tfwKConst in 'w:\common\components\rtl\Garant\DUnitTuning\tfwKConst.pas'
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 , l3EtalonsService in 'w:\common\components\rtl\Garant\L3\l3EtalonsService.pas'
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngine in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptEngine.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwStringStreamFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwStringStreamFactory.pas'
 , tfwFileStreamFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwFileStreamFactory.pas'
 {$If NOT Defined(NoScripts)}
 , kwEmitString in 'w:\common\components\rtl\Garant\ScriptEngine\kwEmitString.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwTryFinally in 'w:\common\components\rtl\Garant\ScriptEngine\kwTryFinally.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDualWord in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDualWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledTryFinally in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledTryFinally.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledTryExcept in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledTryExcept.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEND in 'w:\common\components\rtl\Garant\ScriptEngine\kwEND.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwFINALLY in 'w:\common\components\rtl\Garant\ScriptEngine\kwFINALLY.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMedianBacket in 'w:\common\components\rtl\Garant\ScriptEngine\kwMedianBacket.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwEXCEPT in 'w:\common\components\rtl\Garant\ScriptEngine\kwEXCEPT.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMain in 'w:\common\components\rtl\Garant\ScriptEngine\kwMain.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptEnginePrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptEnginePrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwValueStack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwValueStack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwSourcePointList in 'w:\common\components\rtl\Garant\ScriptEngine\tfwSourcePointList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryStack in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryStack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwParser in 'w:\common\components\rtl\Garant\ScriptEngine\tfwParser.pas'
 , tfwCachedTokens in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCachedTokens.pas'
 , tfwParserProgressService in 'w:\common\components\rtl\Garant\ScriptEngine\tfwParserProgressService.pas'
 {$If NOT Defined(NoScripts)}
 , ItfwParserWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwParserWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ItfwParserExWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwParserExWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seThreadSupport in 'w:\common\components\rtl\Garant\ScriptEngine\seThreadSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ItfwScriptEngineWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ItfwScriptEngineWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwSystemIncluded in 'w:\common\components\rtl\Garant\ScriptEngine\kwSystemIncluded.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwIncludedPrim in 'w:\common\components\rtl\Garant\ScriptEngine\kwIncludedPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledIncluded in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledIncluded.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwCOMStreamFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCOMStreamFactory.pas'
 {$If NOT Defined(NoScripts)}
 , kwCompiledMain in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledMain.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , tfwResourceStreamFactory in 'w:\common\components\rtl\Garant\ScriptEngine\tfwResourceStreamFactory.pas'
 {$If NOT Defined(NoScripts)}
 , tfwCompiledAxiomaticsRes in 'w:\common\components\rtl\Garant\ScriptEngine\tfwCompiledAxiomaticsRes.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwTypesForRegister in 'w:\common\components\rtl\Garant\ScriptEngine\tfwTypesForRegister.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwClassesForRegister in 'w:\common\components\rtl\Garant\ScriptEngine\tfwClassesForRegister.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptsRunningAndDebugging in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptsRunningAndDebugging.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwOutToFileScriptCaller in 'w:\common\components\rtl\Garant\ScriptEngine\tfwOutToFileScriptCaller.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwConsoleScriptCaller in 'w:\common\components\rtl\Garant\ScriptEngine\tfwConsoleScriptCaller.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDefaultScriptCaller in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDefaultScriptCaller.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDebugScriptCaller in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDebugScriptCaller.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDebugService in 'w:\common\components\rtl\Garant\ScriptEngine\tfwDebugService.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 , GUITestRunner in 'w:\common\components\rtl\external\DUnit\src\GUITestRunner.pas'
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwKeyWordsPack in 'w:\common\components\rtl\Garant\DUnit_Script_Support\kwKeyWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , TTreeNodeForTestsWordsPack in 'w:\common\components\rtl\Garant\DUnit_Script_Support\TTreeNodeForTestsWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 , FolderSupport in 'w:\common\components\rtl\external\DUnit\src\FolderSupport.pas'
 , TestForm4Scripts in 'w:\common\components\rtl\Garant\Shared_Delphi_Tests_Common\TestForm4Scripts.pas'
 , toKPrime in 'w:\garant6x\implementation\Garant\GbaNemesis\toKPrime.pas'
 , toKTPrime in 'w:\garant6x\implementation\Garant\GbaNemesis\toKTPrime.pas'
 , l3ComponentInfoHelper in 'w:\common\components\rtl\Garant\L3\l3ComponentInfoHelper.pas'
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngineEX in 'w:\common\components\rtl\Garant\ScriptEngine\tfwScriptEngineEX.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , CodeFlowWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\CodeFlowWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seModalSupport in 'w:\common\components\rtl\Garant\ScriptEngine\seModalSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seModalWorkerList in 'w:\common\components\rtl\Garant\ScriptEngine\seModalWorkerList.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seModalWorkerListPrim in 'w:\common\components\rtl\Garant\ScriptEngine\seModalWorkerListPrim.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , seModalWorker in 'w:\common\components\rtl\Garant\ScriptEngine\seModalWorker.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , CompilationPack in 'w:\common\components\rtl\Garant\ScriptEngine\CompilationPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwFORWARD in 'w:\common\components\rtl\Garant\ScriptEngine\kwFORWARD.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , WordsDefinitionPack in 'w:\common\components\rtl\Garant\ScriptEngine\WordsDefinitionPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwProcedure in 'w:\common\components\rtl\Garant\ScriptEngine\tfwProcedure.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwStandardProcedureCloseBracket in 'w:\common\components\rtl\Garant\ScriptEngine\kwStandardProcedureCloseBracket.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledProcedure in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledProcedure.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwKeyValuesPack in 'w:\common\components\rtl\Garant\ScriptEngine\kwKeyValuesPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwKeyValues in 'w:\common\components\rtl\Garant\ScriptEngine\kwKeyValues.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledProcedureWordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledProcedureWordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledFunction in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledFunction.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledProcedureWithStackChecking in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledProcedureWithStackChecking.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwInlinedWord in 'w:\common\components\rtl\Garant\ScriptEngine\kwInlinedWord.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , IncludesAndUsesPack in 'w:\common\components\rtl\Garant\ScriptEngine\IncludesAndUsesPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwInclude in 'w:\common\components\rtl\Garant\ScriptEngine\kwInclude.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwIncludeLike in 'w:\common\components\rtl\Garant\ScriptEngine\tfwIncludeLike.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwIncluded in 'w:\common\components\rtl\Garant\ScriptEngine\kwIncluded.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwUses in 'w:\common\components\rtl\Garant\ScriptEngine\kwUses.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwUsesLike in 'w:\common\components\rtl\Garant\ScriptEngine\kwUsesLike.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , EtalonsWorkingPack in 'w:\common\components\rtl\Garant\ScriptEngine\EtalonsWorkingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCheckOutputWithInput in 'w:\common\components\rtl\Garant\ScriptEngine\kwCheckOutputWithInput.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCheckEtalon in 'w:\common\components\rtl\Garant\ScriptEngine\kwCheckEtalon.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwTestResolveInputFilePath in 'w:\common\components\rtl\Garant\ScriptEngine\kwTestResolveInputFilePath.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , MouseInputPack in 'w:\common\components\rtl\Garant\ScriptEngine\MouseInputPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseLeftDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseLeftDown.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseUpDownSupport in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseUpDownSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwSendInputSupport in 'w:\common\components\rtl\Garant\ScriptEngine\kwSendInputSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseLeftUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseLeftUp.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseMiddleUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseMiddleUp.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseMiddleDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseMiddleDown.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseRightUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseRightUp.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseRightDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseRightDown.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseSetCursorPosition in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseSetCursorPosition.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseGetCursorIndex in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseGetCursorIndex.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseGetCursorNameByIndex in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseGetCursorNameByIndex.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseGetCursorPosition in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseGetCursorPosition.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseWheelUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseWheelUp.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseWheelSupport in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseWheelSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMouseWheelDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwMouseWheelDown.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , ModalDialogsKeywordsPack in 'w:\common\components\rtl\Garant\ScriptEngine\ModalDialogsKeywordsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWasWait in 'w:\common\components\rtl\Garant\ScriptEngine\kwWasWait.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWaitNo in 'w:\common\components\rtl\Garant\ScriptEngine\kwWaitNo.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWaitOk in 'w:\common\components\rtl\Garant\ScriptEngine\kwWaitOk.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWaitYes in 'w:\common\components\rtl\Garant\ScriptEngine\kwWaitYes.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWaitCancel in 'w:\common\components\rtl\Garant\ScriptEngine\kwWaitCancel.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwWaitChoice in 'w:\common\components\rtl\Garant\ScriptEngine\kwWaitChoice.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , KeyboardInputPack in 'w:\common\components\rtl\Garant\ScriptEngine\KeyboardInputPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwKey in 'w:\common\components\rtl\Garant\ScriptEngine\kwKey.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwHardKey in 'w:\common\components\rtl\Garant\ScriptEngine\kwHardKey.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwKeyDown in 'w:\common\components\rtl\Garant\ScriptEngine\kwKeyDown.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , kwKeyUp in 'w:\common\components\rtl\Garant\ScriptEngine\kwKeyUp.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , CodeBranchingPack in 'w:\common\components\rtl\Garant\ScriptEngine\CodeBranchingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwIfElse in 'w:\common\components\rtl\Garant\ScriptEngine\kwIfElse.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwElse in 'w:\common\components\rtl\Garant\ScriptEngine\kwElse.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCASE in 'w:\common\components\rtl\Garant\ScriptEngine\kwCASE.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledCase in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledCase.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwDEFAULT in 'w:\common\components\rtl\Garant\ScriptEngine\kwDEFAULT.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwRAISE in 'w:\common\components\rtl\Garant\ScriptEngine\kwRAISE.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBracketBegin in 'w:\common\components\rtl\Garant\ScriptEngine\kwBracketBegin.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBracketEnd in 'w:\common\components\rtl\Garant\ScriptEngine\kwBracketEnd.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwTypedBeginLikeCompiledCode in 'w:\common\components\rtl\Garant\ScriptEngine\kwTypedBeginLikeCompiledCode.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwBEGIN in 'w:\common\components\rtl\Garant\ScriptEngine\kwBEGIN.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwRULES in 'w:\common\components\rtl\Garant\ScriptEngine\kwRULES.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledRules in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledRules.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ScriptsCompilingAndProcessingPack in 'w:\common\components\rtl\Garant\ScriptEngine\ScriptsCompilingAndProcessingPack.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwScriptCompileAndProcess in 'w:\common\components\rtl\Garant\ScriptEngine\kwScriptCompileAndProcess.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledScriptCompileAndProcess in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledScriptCompileAndProcess.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwMainCodeController in 'w:\common\components\rtl\Garant\ScriptEngine\kwMainCodeController.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwScriptCompileStringAndProcess in 'w:\common\components\rtl\Garant\ScriptEngine\kwScriptCompileStringAndProcess.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , kwCompiledScriptCompileStringAndProcess in 'w:\common\components\rtl\Garant\ScriptEngine\kwCompiledScriptCompileStringAndProcess.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoWindows)}
 , WinUtilsPack in 'w:\common\components\rtl\Garant\ScriptEngine\WinUtilsPack.pas'
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoWindows)
 , CommCtrl {$IfNDef XE4} in 'w:\common\components\rtl\external\Borland\Delphi\Rtl\Win\CommCtrl.pas' {$EndIf}
 {$If NOT Defined(NoScripts)}
 , F1AutoTestSuite in 'w:\garant6x\implementation\Garant\GbaNemesis\F1AutoTestSuite.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , AutoTestSuiteWithDUnitSupport in 'w:\common\components\rtl\Garant\DUnit_Script_Support\AutoTestSuiteWithDUnitSupport.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , CustomAutoTestsSuite in 'w:\common\components\rtl\Garant\ScriptTestLibrary\CustomAutoTestsSuite.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , F1AutoScripter in 'w:\garant6x\implementation\Garant\GbaNemesis\F1AutoScripter.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , InsiderOwnScripter in 'w:\garant6x\implementation\Garant\GbaNemesis\InsiderOwnScripter.pas'
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , CustomInsiderScripter in 'w:\common\components\rtl\Garant\ScriptTestLibrary\CustomInsiderScripter.pas'
 {$IfEnd} // NOT Defined(NoScripts)
;
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(Monitorings)

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(Monitorings)}
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(Monitorings)
{$R PrimeAppTest.res}

begin
 {$IfDef nsTest}
 g_CVSPath := 'w:\garant6x\implementation\Garant\GbaNemesis';
 {$EndIf nsTest}
 //#UC START# *51237FE1009DCVSPath*
 //#UC END# *51237FE1009DCVSPath*
 TF1AutoTestSuite.Register;
 StdRes.TvcmApplicationRunner.Run(str_MonitoringTitle, 'F1Prime.chm');
end.
