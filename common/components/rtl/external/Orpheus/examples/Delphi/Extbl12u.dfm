�
 TFORM1 0>  TPF0TForm1Form1LeftFTop� Width)Height#CaptionForm1
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`PositionpoScreenCenterOnCreate
FormCreate
TextHeight 	TOvcTable	OvcTable1LeftTopWidth� Height� RowLimit
Colors.ActiveFocusedclHighlightColors.ActiveFocusedTextclHighlightTextColors.ActiveUnfocusedclHighlightColors.ActiveUnfocusedTextclHighlightTextColors.Locked	clBtnFaceColors.LockedTextclWindowTextColors.Editing	clBtnFaceColors.EditingTextclWindowTextColors.SelectedclHighlightColors.SelectedTextclHighlightText
ControllerOvcController1!GridPenSet.NormalGrid.NormalColorclBtnShadow!GridPenSet.NormalGrid.SecondColorclBtnHighlightGridPenSet.NormalGrid.StylepsDotGridPenSet.NormalGrid.EffectgeBoth!GridPenSet.LockedGrid.NormalColorclBtnShadow!GridPenSet.LockedGrid.SecondColorclBtnHighlightGridPenSet.LockedGrid.StylepsSolidGridPenSet.LockedGrid.Effectge3D&GridPenSet.CellWhenFocused.NormalColorclBlack&GridPenSet.CellWhenFocused.SecondColorclBtnHighlight GridPenSet.CellWhenFocused.StylepsSolid!GridPenSet.CellWhenFocused.EffectgeBoth(GridPenSet.CellWhenUnfocused.NormalColorclBlack(GridPenSet.CellWhenUnfocused.SecondColorclBtnHighlight"GridPenSet.CellWhenUnfocused.StylepsDash#GridPenSet.CellWhenUnfocused.EffectgeBothOptionsotoNoRowResizingotoNoColResizingotoNoSelectionotoAllowColMoves TabOrder OnColumnsChangedOvcTable1ColumnsChangedOnExitOvcTable1ExitOnGetCellDataOvcTable1GetCellDataCellDataPF1CB1SF1 RowData ColData& 	CB1S	SF12	PF1   TButtonButton1Left@Top� WidthYHeight!Caption&SaveTabOrderOnClickButton1Click  TMemoMemo1Left� TopWidthHeight� TabStopLines.Strings5The primary purpose of this example is to show how to9store column settings, i.e., the default cell, width, and;original design position, in an INI file so that the values5can be read back at startup and the table restored tothe same settings. 4This is a *very basic* example in that it depends on3a fixed number of columns, does not store the data,5nor allow for values to be missing from the INI file,6i.e., the default cell is not assigned in these cases.+These and other details are left up to you. ReadOnly	
ScrollBars
ssVerticalTabOrderWordWrap  TOvcControllerOvcController1EntryCommands.TableListDefault	 WordStar Grid  Left� Top
  TOvcTCCheckBoxCB1AcceptActivationClick	AllowGrayedCellGlyphs.IsDefault	CellGlyphs.GlyphCountCellGlyphs.ActiveGlyphCountShowHintTable	OvcTable1OnClickCB1ClickLeft;Top
  TOvcTCStringSF1AutoAdvanceCharAutoAdvanceLeftRight	MaxLength
ShowHintTable	OvcTable1	TextStyletsFlatUseWordWrapUseASCIIZStringsLeftjTop
  TOvcTCPictureFieldPF1DataTypepftTimePictureMaskhh:mm	MaxLengthAutoAdvanceCharAutoAdvanceLeftRight
AutoSelect	BeepOnError	CaretOvr.ShapecsBlock
CaretToEnd	ControlCharColorclRedDecimalPlaces Epoch ForceInsertForceOvertypeHighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightTextInsertPushes	PadChar PasswordChar*PasswordMode
RightAlignRightJustifyShowHintStripLiteralsTable	OvcTable1
TextMargin	TextStyletsFlat
TrimBlanksLeft� Top
	RangeHigh

   Q       RangeLow

                