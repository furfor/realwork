//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("elpackB3.res");
USEPACKAGE("vclx35.bpi");
USEPACKAGE("VCL35.bpi");
USEFORMNS("Source\frmHdrStp.pas", TfrmHeaderSetup, frmHeaderSetup);
USEUNIT("Source\ElACtrls.pas");
USEUNIT("Source\ElAppBar.pas");
USEUNIT("Source\ElArray.pas");
USEUNIT("Source\ElBaseComp.pas");
USEUNIT("Source\ElBiProgr.pas");
USEUNIT("Source\ElBtnCtl.pas");
USEUNIT("Source\ElBtnEdit.pas");
USEUNIT("Source\ElCalendar.pas");
USEFORMNS("Source\ElCalc.pas", Elcalc, ElCalculatorForm);
USEUNIT("Source\ElCalculatorEdit.pas");
USEUNIT("Source\ElCalendDlg.pas");
USEUNIT("Source\ElClrCmb.pas");
USEUNIT("Source\ElCaption.pas");
USEUNIT("Source\ElCBFmts.pas");
USEUNIT("Source\ElCheckCtl.pas");
USEUNIT("Source\ElClock.pas");
USEUNIT("Source\ElContBase.pas");
USEUNIT("Source\ElCRC32.pas");
USEFORMNS("Source\ElDailyTip.pas", Eldailytip, ElDailyTipForm);
USEUNIT("Source\ElDragDrop.pas");
USEUNIT("Source\ElExtBkgnd.pas");
USEUNIT("Source\ElFlatCtl.pas");
USEUNIT("Source\ElFrmPers.pas");
USEUNIT("Source\ElGauge.pas");
USEUNIT("Source\ElGraphs.pas");
USEUNIT("Source\ElHashList.pas");
USEUNIT("Source\ElHeader.pas");
USEUNIT("Source\ElHint.pas");
USEUNIT("Source\ElHintWnd.pas");
USEUNIT("Source\ElHook.pas");
USEUNIT("Source\ElHstgrm.pas");
USEUNIT("Source\ElImgLst.pas");
USEUNIT("Source\ElIni.pas");
USEUNIT("Source\ElInputDlg.pas");
USEUNIT("Source\ElList.pas");
USEUNIT("Source\ElMD5.pas");
USEUNIT("Source\ElMemoCombo.pas");
USEUNIT("Source\ElMRU.pas");
USEUNIT("Source\ElMTree.pas");
USEUNIT("Source\ElObjList.pas");
USEUNIT("Source\ElOneInst.pas");
USEUNIT("Source\ElOpts.pas");
USEUNIT("Source\ElPanel.pas");
USEUNIT("Source\ElPopBtn.pas");
USEUNIT("Source\ElPowerMan.pas");
USEUNIT("Source\ElPropTools.pas");
USEUNIT("Source\ElQueue.pas");
USEUNIT("Source\ElRegUtils.pas");
USEUNIT("Source\ElScrollBar.pas");
USEUNIT("Source\ElSideBar.pas");
USEUNIT("Source\ElSndMap.pas");
USEUNIT("Source\ElSpin.pas");
USEUNIT("Source\ElSplit.pas");
USEUNIT("Source\ElStack.pas");
USEUNIT("Source\ElStatBar.pas");
USEUNIT("Source\ElStrArray.pas");
USEUNIT("Source\ElStrToken.pas");
USEUNIT("Source\ElStrUtils.pas");
USEUNIT("Source\ElTimers.pas");
USEUNIT("Source\ElToolBar.pas");
USEUNIT("Source\ElTools.pas");
USEUNIT("Source\ElTopmost.pas");
USEUNIT("Source\ElTray.pas");
USEUNIT("Source\ElTree.pas");
USEUNIT("Source\ElTreeCombo.pas");
USEUNIT("Source\ElURLLabel.pas");
USEUNIT("Source\ElVCLUtils.pas");
USEUNIT("Source\ElImgFrm.pas");
USEUNIT("Source\ElLabel.pas");
USEUNIT("Source\ElCombos.pas");
USEUNIT("Source\ElCLabel.pas");
USEUNIT("Source\ElCGControl.pas");
USEUNIT("Source\ElPgCtl.pas");
USEUNIT("Source\ElShutdownWatcher.pas");
USEUNIT("Source\ElIPEdit.pas");
USEUNIT("Source\ElHTMLView.pas");
USEUNIT("Source\HTMLLbx.pas");
USEUNIT("Source\ElHTMLHint.pas");
USEFORMNS("Source\ElTrayInfo.pas", Eltrayinfo, TrayInfoForm);
USEUNIT("Source\HTMLRender.pas");
USEUNIT("Source\ElSpinBtn.pas");
USEUNIT("Source\ElCalendarDefs.pas");
USEUNIT("Source\ElCurrEdit.pas");
USEUNIT("Source\ElDTPick.pas");
USEUNIT("Source\ElStrPool.pas");
USEUNIT("Source\ElHTMLLbl.pas");
USEUNIT("Source\ElGroupBox.pas");
USEUNIT("Source\ElFileUtils.pas");
USEUNIT("Source\ElClipMon.pas");
USEUNIT("Source\ElFolderDlg.pas");
USEUNIT("Source\ElScrollBox.pas");
USEUNIT("Source\ElListBox.pas");
USEUNIT("Source\ElMenus.pas");
USEUNIT("Source\ElColor.pas");
USEUNIT("Source\ElExpBar.pas");

USEUNIT("Source\ElHandPt.pas"); 
USEUNIT("Source\ElTreeGrids.pas"); 
USEUNIT("Source\ElMaskEdit.pas"); 
USEUNIT("Source\ElVerInfo.pas"); 
USEUNIT("Source\ElCheckItemGrp.pas"); 
USEUNIT("Source\ElAdvPanel.pas"); 
USEUNIT("Source\ElHTMLPanel.pas"); 
USEUNIT("Source\ElTreeBtnEdit.pas"); 
USEUNIT("Source\ElShellUtils.pas"); 
// USEUNIT("Source\ElUnicodeStrings.pas"); 
USEUNIT("Source\ElDriveCombo.pas"); 
USEUNIT("Source\ElFontCombo.pas"); 
USEUNIT("Source\ElTrackBar.pas"); 
USEUNIT("Source\ElImgCombo.pas"); 
USEUNIT("Source\ElTreeTreeComboEdit.pas"); 
USEUNIT("Source\ElTreeSpinEdit.pas"); 
USEUNIT("Source\ElTreeMemoEdit.pas"); 
USEUNIT("Source\ElTreeMaskEdit.pas"); 
USEUNIT("Source\ElTreeDTPickEdit.pas"); 
USEUNIT("Source\ElTreeCurrEdit.pas"); 
USEUNIT("Source\ElTreeComboBox.pas"); 
USEUNIT("Source\ElTreeCheckBoxEdit.pas"); 
USEUNIT("Source\ElTreeAdvEdit.pas"); 
USEUNIT("Source\ElTreeStdEditors.pas"); 
USEUNIT("Source\ElTreeModalEdit.pas"); 
USEUNIT("Source\ElNameEdits.pas"); 
USEUNIT("Source\ElTmSchema.pas");
USEUNIT("Source\ElUxTheme.pas");
USEUNIT("Source\ElXpThemedControl.pas");
USEUNIT("Source\frmTbrStp.pas");
USEUNIT("Source\ElMouseHint.pas");
USEUNIT("Source\ElEdits.pas");
USEUNIT("Source\ElHotKey.pas");

USEUNIT("Source\ElAppBarForm.pas");
USEUNIT("Source\ElGlyphs.pas");
USEUNIT("Source\ElStyleMan.pas");
USEUNIT("Source\ElSysHotKey.pas");
USEUNIT("Source\ElThemesMain.pas");
USEUNIT("Source\ElThemes.pas");
USEUNIT("Source\ElThemesWindowsXP.pas");
USEUNIT("Source\ElProcessUtils.pas");
USEUNIT("Source\ElThemeSysColorHook.pas");
USEUNIT("Source\ElThemesWindowsXPTrackBar.pas");
USEUNIT("Source\ElThemesWindowsXPTreeView.pas");
USEUNIT("Source\ElThemesWindowsXPToolbar.pas");
USEUNIT("Source\ElThemesWindowsXPTab.pas");
USEUNIT("Source\ElThemesWindowsXPStatus.pas");
USEUNIT("Source\ElThemesWindowsXPSpin.pas");
USEUNIT("Source\ElThemesWindowsXPScrollBar.pas");
USEUNIT("Source\ElThemesWindowsXPProgress.pas");
USEUNIT("Source\ElThemesWindowsXPListView.pas");
USEUNIT("Source\ElThemesWindowsXPExplorerBar.pas");
USEUNIT("Source\ElThemesWindowsXPHeader.pas");
USEUNIT("Source\ElThemesWindowsXPEdit.pas");
USEUNIT("Source\ElThemesWindowsXPComboBox.pas");
USEUNIT("Source\ElThemesWindowsXPButton.pas");
USEUNIT("Source\ElThemesGraphics.pas");
USEUNIT("Source\ElThemesWindowsXPUtils.pas");
USEUNIT("Source\ElThemesWindowsXPTypes.pas");
USEUNIT("Source\ElThemesWindowsXPConsts.pas");
USEUNIT("Source\ElThemesWindowsXPWindow.pas");
USEUNIT("Source\ElThemesGeneral.pas");
USEUNIT("Source\ElTreeColorCombo.pas");
USEUNIT("Source\ElInprocHookAPI.pas");
USEUNIT("Source\ElInputProcessor.pas");
USEUNIT("Source\ElSBCtrl.pas");
USEUNIT("Source\ElSBHook.pas");

USEFORMNS("Source\ElPromptDlg.pas", ElPromptDlg, ElPromptForm);
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
    return 1;
}
//---------------------------------------------------------------------------

