�
 TFORM1 07  TPF0TForm1Form1Left� TophWidth HeightwCaptionDream DB Controls Demo
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ScaledOnCreate
FormCreatePixelsPerInch`
TextHeight TPageControlPageControl1Left Top WidthHeight\
ActivePage	TabSheet1AlignalClientTabOrder  	TTabSheet	TabSheet1CaptionDCDBEdit && DCDBLookup TLabelLabel13LeftTopQWidth,HeightCaptionCustNo  TLabelLabel14Left� TopQWidth:HeightCaptionCompany  TMemoDataAwareMemoLeft Top WidthHeightIAlignalTop
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Lines.StringsQTDCDbEdit and  TDCDbLookup - dream data-aware controls, which work like standard XDelphi controls, but they have all properties and functionality of TDCEdit - that means Wthey can be flat, change number and glyphs of buttons, handle additional events and so on. 
ParentFontReadOnly	TabOrder   	TDCDBEdit	DCDBEdit1Left9TopNWidth8HeightButton1.Width Button1.Cursor	crDefaultButton1.Kind
bkDropDownButton1.NumGlyphsButton1.ParentShowHint	Button1.ShowHintButton1.VisibleButton2.Width Button2.Cursor	crDefaultButton2.KindbkDotsButton2.NumGlyphsButton2.ParentShowHint	Button2.ShowHintButton2.VisibleCaption	DCDBEdit1	DataFieldCustNo
DataSourcedsordersFlat	
NumButtons ParentColorPopupWindowClassTPopupListBoxReadOnlyTabOrderTabStop	 TPopupListBox Left Top WidthyHeightBTabStop
ItemHeight  TFieldDataSource 	DataFieldCustNo
DataSourcedsorders   TDCPropCheckBoxDCPropCheckBox7LeftToplWidthaHeight	Component	DCDBEdit1PropNameButton1.VisibleCaptionFirst ButtonCheckedCuteInvertReadOnlyScaledTabOrderTabStop	TextFalse  TDCPropCheckBoxDCPropCheckBox8LeftTop� WidthqHeight	Component	DCDBEdit1PropNameButton2.VisibleCaptionSecond ButtonCheckedCuteInvertReadOnlyScaledTabOrderTabStop	TextFalse  TButtonButton8Left� TopkWidthKHeightCaption
Edit GlyphTabOrderOnClickButton8Click  TButtonButton9Left� Top� WidthKHeightCaption
Edit GlyphTabOrderOnClickButton9Click  TDCDBLookupDCDBLookup1Left� TopNWidth� HeightKeyFieldCustNoLookupFieldCompanyLookupSourcedscustDropOnClick	Button1.Width Button1.Cursor	crDefaultButton1.Kind
bkDropDownButton1.NumGlyphsButton1.ParentShowHint	Button1.ShowHintButton1.Visible	Button2.Width Button2.Cursor	crDefaultButton2.KindbkDotsButton2.NumGlyphsButton2.ParentShowHint	Button2.ShowHintButton2.VisibleCaptionDCDBLookup1	DataFieldCustNo
DataSourcedsordersFlat	ParentColorReadOnlyTabOrderTabStop	 TPopupDBGrid Left Top Width@HeightxTabStopFieldSourcedscustDisplayFieldCompanyColumns	FieldNameCompany    TLookupFieldDataSource 	DataFieldCustNo
DataSourcedsordersKeyFieldCustNoLookupFieldCompanyLookupSourcedscust   TDCPropCheckBoxDCPropCheckBox5Left� ToplWidthsHeight	ComponentDCDBLookup1PropNameButton2.VisibleCaptionSecond ButtonCheckedCuteInvertReadOnlyScaledTabOrderTabStop	TextFalse  TDCPropCheckBoxDCPropCheckBox4Left� Top� WidthAHeight	ComponentDCDBLookup1PropNameFlatCaptionFlatChecked	CuteInvertReadOnlyScaledTabOrderTabStop	TextTrue  TButtonButton7Left[TopmWidthNHeightCaption
Edit GlyphTabOrder	OnClickButton7Click  TDCPropCheckBoxDCPropCheckBox6LeftHTop� WidthzHeight	ComponentDCDBLookup1PropNameDropOnClickCaptionDrop On ClickChecked	CuteInvertReadOnlyScaledTabOrder
TabStop	TextTrue  TDBGridDBGrid1Left Top� WidthHeight� AlignalBottom
DataSourcedsordersTabOrderTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style     TTabletacustActive	DatabaseNameDBDEMOS	TableNamecustomer.dbLeft�Toph TFloatFieldtacustCustNo	FieldNameCustNo  TStringFieldtacustCompany	FieldNameCompanySize  TStringFieldtacustAddr1	FieldNameAddr1Size  TStringFieldtacustAddr2	FieldNameAddr2Size  TStringField
tacustCity	FieldNameCitySize  TStringFieldtacustState	FieldNameState  TStringField	tacustZip	FieldNameZipSize
  TStringFieldtacustCountry	FieldNameCountry  TStringFieldtacustPhone	FieldNamePhoneSize  TStringField	tacustFAX	FieldNameFAXSize  TFloatFieldtacustTaxRate	FieldNameTaxRate  TStringFieldtacustContact	FieldNameContact  TDateTimeFieldtacustLastInvoiceDate	FieldNameLastInvoiceDate   TTabletaordersActive	DatabaseNameDBDEMOS	TableName	orders.dbLeftGTop�  TFloatFieldtaordersOrderNo	FieldNameOrderNo  TFloatFieldtaordersCustNo	FieldNameCustNoRequired	  TDateTimeFieldtaordersSaleDate	FieldNameSaleDate  TDateTimeFieldtaordersShipDate	FieldNameShipDate  TIntegerFieldtaordersEmpNo	FieldNameEmpNoRequired	  TStringFieldtaordersShipVIA	FieldNameShipVIASize  TStringFieldtaordersTerms	FieldNameTermsSize  TStringFieldtaordersPaymentMethod	FieldNamePaymentMethodSize  TCurrencyFieldtaordersItemsTotal	FieldName
ItemsTotal  TFloatFieldtaordersTaxRate	FieldNameTaxRate  TCurrencyFieldtaordersAmountPaid	FieldName
AmountPaid   TDataSourcedsordersDataSettaordersLeft� Top�   TDataSourcedscustDataSettacustLeft�Top�    