�
 TFRMORDERS 0�F  TPF0
TfrmOrders	frmOrdersLeft� Top� BorderStylebsDialogCaption%Table <-> Database Demo (Orders form)ClientHeightClientWidth=
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TPanelPanel2Left Top Width=HeightAlignalTopCaptionOrders (Read-Only)
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  	TOvcTabletblOrderLeft TopWidth=Height� RowLimitAlignalTopColors.ActiveFocusedclHighlightColors.ActiveFocusedTextclHighlightTextColors.ActiveUnfocusedclHighlightColors.ActiveUnfocusedTextclHighlightTextColors.Locked	clBtnFaceColors.LockedTextclWindowTextColors.Editing	clBtnFaceColors.EditingTextclWindowTextColors.SelectedclHighlightColors.SelectedTextclHighlightText
ControllerOvcController1
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style !GridPenSet.NormalGrid.NormalColorclBtnShadow!GridPenSet.NormalGrid.SecondColorclBtnHighlightGridPenSet.NormalGrid.StylepsSolidGridPenSet.NormalGrid.Effectge3D!GridPenSet.LockedGrid.NormalColorclBtnShadow!GridPenSet.LockedGrid.SecondColorclBtnHighlightGridPenSet.LockedGrid.StylepsSolidGridPenSet.LockedGrid.Effectge3D&GridPenSet.CellWhenFocused.NormalColorclBlack&GridPenSet.CellWhenFocused.SecondColorclBtnHighlight GridPenSet.CellWhenFocused.StylepsSolid!GridPenSet.CellWhenFocused.EffectgeBoth(GridPenSet.CellWhenUnfocused.NormalColorclBlack(GridPenSet.CellWhenUnfocused.SecondColorclBtnHighlight"GridPenSet.CellWhenUnfocused.StylepsDash#GridPenSet.CellWhenUnfocused.EffectgeBothLockedRowsCelldbOrderHeaderCellOptionsotoNoRowResizingotoNoColResizingotoTabToArrowotoEnterToArrow 
ParentFontTabOrder OnActiveCellChangedtblOrderActiveCellChangedOnBeginEdittblOrderBeginEditOnGetCellDatatblOrderGetCellDataOnLockedCellClicktblOrderLockedCellClickCellDatafrmOrders.dbOrderHeaderCellfrmOrders.RowLablefrmOrders.sfOrderNofrmOrders.pfSaleDatefrmOrders.pfShipDatefrmOrders.sfEmpNofrmOrders.sfShipToContactfrmOrders.sfShipToAddr1frmOrders.sfShipToAddr2frmOrders.sfShipToCityfrmOrders.sfShipToStatefrmOrders.pfShipToZipfrmOrders.sfShipToCountryfrmOrders.pfShipToPhonefrmOrders.sfShipToViafrmOrders.sfPOfrmOrders.sfTermsfrmOrders.sfPaymentMethodfrmOrders.pfItemsTotalfrmOrders.pfTaxRate2frmOrders.pfFreightfrmOrders.pfAmountPaid RowData ColData	frmOrders.RowLable7	frmOrders.sfOrderNoP	frmOrders.pfSaleDateP	frmOrders.pfShipDate7	frmOrders.sfEmpNo}	frmOrders.sfShipToContact� 	frmOrders.sfShipToAddr1� 	frmOrders.sfShipToAddr2}	frmOrders.sfShipToCityP	frmOrders.sfShipToStateP	frmOrders.pfShipToZipd	frmOrders.sfShipToCountry}	frmOrders.pfShipToPhoneK	frmOrders.sfShipToViaP	frmOrders.sfPOK	frmOrders.sfTermsd	frmOrders.sfPaymentMethodU	frmOrders.pfItemsTotalU	frmOrders.pfTaxRate2U	frmOrders.pfFreightU	frmOrders.pfAmountPaid   TBitBtnBitBtn1Left�Top� WidthYHeightTabOrderKindbkClose  TQuerydbOrderQueryDatabaseNameDBDEMOSParams.Data
     Number       �@ SQL.Strings SELECT * FROM "ORDERS.DB" ORDERSWHERE ORDERS.CUSTNO = :Number LeftTop�  TFloatFielddbOrderQueryOrderNo	FieldNameOrderNo  TDateTimeFielddbOrderQuerySaleDate	FieldNameSaleDate  TDateTimeFielddbOrderQueryShipDate	FieldNameShipDate  TIntegerFielddbOrderQueryEmpNo	FieldNameEmpNo  TStringFielddbOrderQueryShipToContact	FieldNameShipToContact  TStringFielddbOrderQueryShipToAddr1	FieldNameShipToAddr1Size  TStringFielddbOrderQueryShipToAddr2	FieldNameShipToAddr2Size  TStringFielddbOrderQueryShipToCity	FieldName
ShipToCitySize  TStringFielddbOrderQueryShipToState	FieldNameShipToState  TStringFielddbOrderQueryShipToZip	FieldName	ShipToZipSize
  TStringFielddbOrderQueryShipToCountry	FieldNameShipToCountry  TStringFielddbOrderQueryShipToPhone	FieldNameShipToPhoneSize  TStringFielddbOrderQueryShipVIA	FieldNameShipVIASize  TStringFielddbOrderQueryPO	FieldNamePOSize  TStringFielddbOrderQueryTerms	FieldNameTermsSize  TStringFielddbOrderQueryPaymentMethod	FieldNamePaymentMethodSize  TCurrencyFielddbOrderQueryItemsTotal	FieldName
ItemsTotal  TFloatFielddbOrderQueryTaxRate	FieldNameTaxRate  TCurrencyFielddbOrderQueryFreight	FieldNameFreight  TCurrencyFielddbOrderQueryAmountPaid	FieldName
AmountPaid   TOvcTCSimpleField	sfOrderNoAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftDoubleDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftTop� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField
pfSaleDateDataTypepftDatePictureMask
mm/dd/yyyy	MaxLength
AutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeft0Top� 	RangeHigh

   %`       RangeLow

               TOvcTCPictureField
pfShipDateDataTypepftDatePictureMask
mm/dd/yyyy	MaxLength
AutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeftPTop� 	RangeHigh

   %`       RangeLow

               TOvcTCSimpleFieldsfEmpNoAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType
sftLongIntDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftpTop� 	RangeHigh

   ���      RangeLow

      �        TOvcTCSimpleFieldsfShipToContactAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToAddr1AutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToAddr2AutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToCityAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToStateAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfShipToZipDataType	pftStringPictureMask
XXXXXXXXXX	MaxLength
AutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left0Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToCountryAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftPTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfShipToPhoneDataType	pftStringPictureMaskXXXXXXXXXXXXXXX	MaxLengthAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftpTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToViaAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfPOAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	Left0Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfTermsAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftPTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfPaymentMethodAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDataType	sftStringDecimalPlaces 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	Margin	MaxLengthPadChar PasswordChar*PasswordModePictureMaskX
RightAlignShowHintTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanks	LeftpTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfItemsTotalDataType	pftDoublePictureMask
$######.##	MaxLength
AdjustotaCenterRightAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField
pfTaxRate2DataType	pftDoublePictureMask
#######.##	MaxLength
AdjustotaCenterRightAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField	pfFreightDataType	pftDoublePictureMask
$######.##	MaxLength
AdjustotaCenterRightAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureFieldpfAmountPaidDataType	pftDoublePictureMask
$######.##	MaxLength
AdjustotaCenterRightAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch 
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	MarginPadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTabletblOrder	TableFont
TextMargin	TextStyletsFlat
TrimBlanksLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcControllerOvcController1EntryCommands.TableListDefault	 WordStar Grid  LeftToph  TOvcTCRowHeadRowLableShowActiveRow	ShowNumbers
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginTabletblOrder	TableFont	TextStyletsFlatLeft0Top�   TOvcTCColHeaddbOrderHeaderCellShowActiveCol	ShowLettersAdjust	otaCenter
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginTabletblOrder	TableFont	TextStyletsFlatUseWordWrapLeftPTop�    