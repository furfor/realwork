�
 TAEFORM 0s  TPF0TAEFormAEFormLeft� ToppWidthHeightActiveControlAE1CaptionArray Editor Example
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`PositionpoScreenCenterOnCreate
FormCreate
TextHeight TLabelLabel1LeftTopWidth� Height1AutoSizeCaption^The number of elements is essentially unlimited since you determine where the data comes from.WordWrap	  TLabelLabel2LeftTopHWidth� Height1AutoSizeCaption>Double-Click the active date cell to invoke the calendar form.WordWrap	  TLabelLabel3LeftTop� Width� Height1AutoSizeCaptionAThese Array Editors are linked together using the OnSelect event.WordWrap	  TOvcSimpleArrayEditorAE1LeftTop
Width{Height� HighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextHighlightColors.UseDefault	RowHeightNumItems2UseScrollBar	OnGetItem
AE1GetItemOnGetItemColorAE1GetItemColorOnSelect	AE1Select
ControllerOvcController1ParentColor
ParentFont	TabOrder TabStop	
OnDblClickAE1DblClickDataType
sftLongIntPictureMaski	RangeHigh

   ���      RangeLow

      �        TOvcPictureArrayEditorAE2Left� Top
Width� Height� HighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextHighlightColors.UseDefault	RowHeightNumItems2	OnGetItem
AE2GetItemOnSelect	AE2Select
ControllerOvcController1ParentColor
ParentFont	TabOrderTabStop	
OnDblClickAE2DblClickDataTypepftDatePictureMask
MM/DD/yyyy	RangeHigh

   %`       RangeLow

               TBitBtnBitBtn1Left�Top� WidthYHeight!TabOrderKindbkClose  TBitBtnbtnColorLeftTop� WidthYHeight!Caption
Cell ColorTabOrderOnClickbtnColorClick  TOvcControllerOvcController1EntryCommands.TableListDefault	  Left�Top�   TColorDialogdlgColorCtl3D	LeftTop�    