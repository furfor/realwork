�
 TFORM1 0�  TPF0TForm1Form1Left� Top� WidthrHeightXActiveControlOvcSimpleField2CaptionNotebook ExampleColorclTeal
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1Left�TopWidthMHeightCaptionActive tab Index  TLabelLabel2Left	Top3Width� Height6AutoSizeCaption94-Way Spin control. Press to change tab height and width.WordWrap	  TLabelLabel4Left
TopzWidth� Height7AutoSizeCaption1In design mode, you can click a tab to select it.WordWrap	  TOvcFourWaySpinnerOvcFourWaySpinner1Left5Top	Width'Height'DeltaOnClickOvcFourWaySpinner1Click  TButton	btnTabPosLeft�Top� Width� HeightCaptionSwitch Tab PositionTabOrderOnClickbtnTabPosClick  TButtonbtnShadowTextLeft�Top� Width� HeightCaptionShadow Text ToggleTabOrderOnClickbtnShadowTextClick  TButtonbtnChangeTabLeft�Top6Width� HeightCaptionChange Active TabTabOrderOnClickbtnChangeTabClick  TButtonbtnFontColorLeft�Top]Width� HeightCaption
Font ColorTabOrderOnClickbtnFontColorClick  TButton
btnFontSelLeft�Top{Width� HeightCaptionFont SelectionTabOrderOnClickbtnFontSelClick  TOvcNotebookNB1LeftTopWidth� Height� HintEntry field pageActiveTabFont.ColorclWindowTextActiveTabFont.Height�ActiveTabFont.NameCourier NewActiveTabFont.StylefsBold ConserveResourcesEchoPageHint	PageHelpContext PageHintEntry field pageTabAutoHeight	TabHeight	TabIndentTabWidthkOnPageChangedNB1PageChanged
ControllerOvcController1
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style 
ParentFontParentShowHintShowHintTabOrder  TOvcNotebookPage HintEntry field pageCaption&Entry TLabelLabel6Left?TopkWidth[HeightCaptionNumeric Field  TOvcSimpleFieldOvcSimpleField2LeftTop Width� HeightCursorcrIBeamHintSimple entry fieldCaretOvr.ShapecsBlock
ControllerOvcController1Ctl3D	ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLengthParentCtl3DTabOrder   TOvcPictureFieldOvcPictureField2LeftTopLWidth� HeightCursorcrIBeamHintPicture entry fieldCaretOvr.ShapecsBlock
ControllerOvcController1Ctl3D	Epoch ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLengthParentCtl3DPictureMaskXXXXXXXXXXXXXXXXXXXXXXXXXTabOrder  TOvcNumericFieldOvcNumericField1LeftTop|Width� HeightCursorcrIBeamHintNumeric entry fieldDataType	nftDoubleCaretOvr.ShapecsBlock
ControllerOvcController1Ctl3D	ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextParentCtl3DPictureMask$###,###,###.##TabOrder	RangeHigh

   t�۹����CRangeLow

   t�۹�����   TOvcNotebookPage HintCalendar pageCaption	Ca&lendar TOvcCalendarOvcCalendar1Left Top Width� Height� Colors.ActiveColor.BackColorclHighlightColors.ActiveColor.TextColorclHighlightTextColors.InactiveColor.BackColorclWindowColors.InactiveColor.TextColor
clGrayTextColors.LabelColor.BackColorclWindowColors.LabelColor.TextColorclWindowTextColors.TextColor.BackColorclWindowColors.TextColor.TextColorclWindowTextDayMonth
ShortNames	Year�OnChangeOvcCalendar1ChangeAlignalClient
ControllerOvcController1Ctl3D	ParentCtl3DTabOrder    TOvcNotebookPage HintTabbed notebook pageCaption&Tabs TLabelLabel3LeftTopWidthHeight)AutoSizeCaptionNotebook within a notebookWordWrap	  TOvcNotebookOvcNotebook2LeftTopOWidth� Height]ActiveTabFont.ColorclWindowTextActiveTabFont.Height�ActiveTabFont.NameCourier NewActiveTabFont.Style ConserveResourcesPageHelpContext TabAutoHeight	TabHeight
ControllerOvcController1TabOrder  TOvcNotebookPage Caption&1 	TCheckBox	CheckBox1LeftTopWidth]HeightCaption	CheckBox1Ctl3D	ParentCtl3DTabOrder    TOvcNotebookPage Caption&2  TOvcNotebookPage Caption3 TEditEdit1LeftTopWidthIHeightCtl3D	ParentCtl3DTabOrder TextEdit1   TOvcNotebookPage Caption4 TEditEdit2LeftTopWidthTHeightCtl3D	ParentCtl3DTabOrder TextEdit2     TOvcNotebookPage HintDisabled pagePageEnabledCaption	&Disabled TLabelLabel5LeftTopWidth� HeightOAutoSizeCaptionDComponents on this page are not accessable until the tab is enabled.WordWrap	  TOvcSimpleFieldOvcSimpleField3LeftToprWidth� HeightCursorcrIBeamCaretOvr.ShapecsBlock
ControllerOvcController1Ctl3D	ErrorColors.BackColorclRedErrorColors.TextColorclBlack
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style HighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLengthParentCtl3D
ParentFontTabOrder     TOvcSimpleFieldOvcSimpleField1Left�TopWidth>HeightCursorcrIBeamDataType
sftIntegerCaretOvr.ShapecsBlock
ControllerOvcController1ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLengthPictureMaskiTabOrder
TrimBlanks	RangeHigh

   �        RangeLow

    ���        TOvcPictureFieldOvcPictureField1LeftTop� WidthbHeightCursorcrIBeamDataTypepftDateCaretOvr.ShapecsBlock
ControllerOvcController1Epoch ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLength
PictureMask
MM/DD/yyyyTabOrder
TrimBlanks	RangeHigh

   %`       RangeLow

               TButton
btnCalDateLeftTopWidth� HeightCaptionSet Calendar DateTabOrder	OnClickbtnCalDateClick  TButtonbtnTabDisableLeft�Top� Width� HeightCaptionToggle disabled tabTabOrderOnClickbtnTabDisableClick  TOvcFourWaySpinnerOvcFourWaySpinner2Left�Top� WidthHeightDeltaFocusedControlOvcPictureField1  TPanelPanel1LeftTop� Width� HeightCaptionCalendar DateTabOrder  TBitBtnbtnCloseLeft�TopWidthYHeight!TabOrderKindbkClose  TBitBtnbtnAutoLeft5TopWidth� HeightCaptionStart Auto DemoTabOrderOnClickbtnAutoClick  TOvcSpinnerOvcSpinner1LeftTopWidthHeightFocusedControlOvcSimpleField1  TOvcControllerOvcController1	BtnCancelbtnCloseEntryCommands.TableListDefault	  LeftHTop�   TColorDialogColorDialog1Ctl3D	Left'Top�   TFontDialogFontDialog1
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style MinFontSize MaxFontSize OptionsfdTrueTypeOnly	fdEffects LeftTop�   TOvcTimerPoolTPOnAllTriggersTPAllTriggersLeftTop   