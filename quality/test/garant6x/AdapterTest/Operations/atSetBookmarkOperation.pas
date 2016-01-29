unit atSetBookmarkOperation;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "AdapterTest"
// ������: "w:/quality/test/garant6x/AdapterTest/Operations/atSetBookmarkOperation.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> garant6x_test::AdapterTest::Operations::TatSetBookmarkOperation
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

uses
  atOperationBase
  ;

type
 TatSetBookmarkOperation = class(TatOperationBase)
 protected
 // realized methods
   procedure ExecuteSelf; override;
 protected
 // overridden protected methods
   procedure InitParamList; override;
 end;//TatSetBookmarkOperation

implementation

uses
  atLogger,
  DocumentUnit,
  Math,
  BaseTreeSupportUnit,
  SysUtils,
  atDocumentHelper,
  atFoldersHelper,
  BaseTypesUnit,
  atCommon
  ;

// start class TatSetBookmarkOperation

procedure TatSetBookmarkOperation.ExecuteSelf;
//#UC START# *48089F460352_48171DA40077_var*
  const
    FUNCTION_NAME = 'TatSetBookmarkOperation.ExecuteSelf';
  var
    l_Document : IDocument;
    l_IsRandomNode, l_IsRandomName, l_IsSaveToCurrentFolder : boolean;
    l_BookmarksCount, i, l_InsertedCount, l_ParaID : Integer;
    l_BookmarkName, l_Name : String;
    l_ParaIDs : TParaIDArr;
    l_Bookmark : IBookmark;
    l_AddedNode : INode;
    l_DTP : IDocumentTextProvider;
//#UC END# *48089F460352_48171DA40077_var*
begin
//#UC START# *48089F460352_48171DA40077_impl*
  inherited;
  l_Document := ExecutionContext.UserWorkContext.CurrDoc;
  assert(l_Document <> nil, 'l_Document <> nil');
  Logger.Info('��������� �������� � �������� � ������� ' + IntToStr(l_Document.GetInternalId));
  //
  l_IsRandomName := Parameters['random_node'].AsBool;
  l_BookmarksCount := Parameters['count'].AsInt;
  l_BookmarkName := Parameters['bookmark_name'].AsStr;
  l_IsSaveToCurrentFolder := Parameters['is_save_to_current_folder'].AsBool;
  l_ParaID := Parameters['para_id'].AsInt;
  //
  l_InsertedCount := 0;
  l_Document.GetTextProvider(false, l_DTP);
  // �������� ������ ����������
  if (l_ParaID = -1) then
  begin // ����� ��������� ��� �� �����, ������� ��������� ������ �������� ���������� �� ���������
    l_ParaIDs := TatDocumentHelper.GetParaIDArray(l_DTP, l_BookmarksCount, l_IsRandomName);
  end
  else
  begin // ���� ��� ���� ����� ����� ���������, �� ��������� �� ������
    Logger.Info('�������� ����� ������� �� �������� � %d.', [l_ParaID]);
    SetLength(l_ParaIDs, l_BookmarksCount);
    for i := Low(l_ParaIDs) to High(l_ParaIDs) do
      l_ParaIDs[i] := l_ParaID;
  end;

  // ����������� ��������
  l_IsRandomName := (l_BookmarkName = '');
  for i := Low(l_ParaIDs) to High(l_ParaIDs) do
  begin
    // ������� �������� � ���������
    l_Document.CreateBookmark(l_ParaIDs[i], true, l_Bookmark);
    if (l_Bookmark = nil) then
      Raise Exception.Create('�� ���� ������� ��������!');
    // ��������� �� � ��� ���������
    if l_IsRandomName then
      l_Name := GetRandomStr(16)
    else if (i = Low(l_ParaIDs)) then
      l_Name := l_BookmarkName
    else
      l_Name := l_BookmarkName + '_' + IntToStr(i);
    l_Bookmark.SetName( ExecutionContext.GblAdapterWorker.GblAdapterDll.MakeString(PAnsiChar(l_Name)) );
    l_Bookmark.SetComment( ExecutionContext.GblAdapterWorker.GblAdapterDll.MakeString(PAnsiChar( Format('��� ����������� �� �������� %d ��������� %d.', [l_ParaIDs[i], l_Document.GetInternalId]) ) ) );

    try
      if l_IsSaveToCurrentFolder then
        TatFoldersHelper.AddToFolder(ExecutionContext.UserWorkContext.CurrFolder, l_Bookmark, l_AddedNode)
      else
        TatFoldersHelper.AddToMyDocuments(l_Bookmark, l_AddedNode);
      Assert(l_AddedNode <> nil, 'l_AddedNode <> nil');
      Inc(l_InsertedCount);
    except
      on ex : EDuplicateNode do
        Logger.Warning('�������� � ������ "%s" ��� ����������!', [l_Name]);
      on ex : Exception do
      begin
        Logger.Exception(ex, FUNCTION_NAME + ' :');
        Raise;
      end;
      else
        Raise;
    end; // try..except
  end; // for
  Logger.Info('��������� ' + IntToStr(l_InsertedCount) + ' �������� �� ' + IntToStr(l_BookmarksCount) + '.');
//#UC END# *48089F460352_48171DA40077_impl*
end;//TatSetBookmarkOperation.ExecuteSelf

procedure TatSetBookmarkOperation.InitParamList;
//#UC START# *48089F3701B4_48171DA40077_var*
//#UC END# *48089F3701B4_48171DA40077_var*
begin
//#UC START# *48089F3701B4_48171DA40077_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('count', '���������� ��������', '1') );
    Add( ParamType.Create('bookmark_name', '��� ��������', '') );
    Add( ParamType.Create('random_node', '������� �������� �� ��������� ����', 'false') );
    Add( ParamType.Create('para_id', '����� ���������, �� ������� ����� ������� ��������', '-1') );
    Add( ParamType.Create('is_save_to_current_folder', '��������� �������� � ������� �����', 'false') );
  end;
//#UC END# *48089F3701B4_48171DA40077_impl*
end;//TatSetBookmarkOperation.InitParamList

end.