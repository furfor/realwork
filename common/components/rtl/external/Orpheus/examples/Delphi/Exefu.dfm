�
 TFORM1 0=  TPF0TForm1Form1LeftTop� Width>Height+CaptionEntry Field Example
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`PositionpoScreenCenterOnCreate
FormCreate
TextHeight TBevelBevel1LeftTop� Width� Heighti  TLabelLabel1Left� TopWidthIHeightCaptionSimple edit field  TLabelLabel3Left� Top-WidthiHeightCaptionPicture edit field (date)  TLabelLabel4LeftTop� WidthKHeightCaptionField 2 contents  TLabelLabel5Left� TopkWidthQHeightCaptionNumeric edit field  TLabelLabel6LeftTop� WidthKHeightCaptionField 3 contents  TLabelLabel2LeftTop� WidthKHeightCaptionField 1 contents  TLabelLabel8LeftTop� Width� Height  TLabelLabel9LeftTop� WidthKHeightCaptionField 4 contents  TLabelLabel10Left� TopLWidthgHeightCaptionPicture edit field (time)  TOvcFourWaySpinnerOvcFourWaySpinner1Left� Top)WidthHeightDeltaFocusedControlPF1ForceOddSize	ForceSquare	  TOvcNumericFieldNF1LeftTophWidthrHeightCursorcrIBeamDataTypenftRealAutoAdvanceUpDown	CaretOvr.ShapecsBlock
ControllerOvcController1ErrorColors.BackColorclRedErrorColors.TextColorclWhiteHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextPictureMask$###,###.##TabOrderOnChange	NF1ChangeOnExit	NF1Change	RangeHigh

   �g<��    RangeLow

   �g<���      TOvcPictureFieldPF1LeftTop)WidthrHeightCursorcrIBeamDataTypepftDateAutoAdvanceUpDown	CaretOvr.ShapecsBlock
ControllerOvcController1Epoch ErrorColors.BackColorclRedErrorColors.TextColorclWhiteHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLength
PictureMask
MM/DD/yyyyTabOrder
TrimBlanksOnChange	PF1ChangeOnExit	PF1Change	RangeHigh

   %`       RangeLow

               TOvcSpinnerOvcSpinner1Left� TophWidthHeightFocusedControlNF1  TBitBtnBitBtn1Left� Top� WidthYHeight!TabOrderKindbkClose  TOvcSimpleFieldSF1LeftTopWidth� HeightCursorcrIBeamAutoAdvanceUpDown	CaretOvr.ShapecsBlock
ControllerOvcController1ErrorColors.BackColorclRedErrorColors.TextColorclBlackHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLength#PictureMaskxTabOrder OnChange	SF1Change  TOvcPictureFieldPF2LeftTopHWidthrHeightCursorcrIBeamDataTypepftTimeAutoAdvanceUpDown	CaretOvr.ShapecsBlock
ControllerOvcController1Epoch ErrorColors.BackColorclRedErrorColors.TextColorclWhiteHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText	MaxLengthPictureMaskHh:mm ttTabOrder
TrimBlanksOnChange	PF2ChangeOnExit	PF1Change	RangeHigh

   Q       RangeLow

               TOvcFourWaySpinnerOvcFourWaySpinner2Left� TopHWidthHeightDeltaFocusedControlPF2ForceOddSize	ForceSquare	  TOvcControllerOvcController1	BtnCancelBitBtn1EntryCommands.TableListDefault	  OnErrorOvcController1ErrorLeft Top�    