object frmMain: TfrmMain
  Left = 381
  Top = 257
  BorderStyle = bsDialog
  Caption = 'Cut'#39'n'#39'Glue'
  ClientHeight = 366
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 295
    Height = 344
    ActivePage = shBatchCut
    Align = alClient
    TabOrder = 0
    object shGlue: TTabSheet
      Caption = #1057#1082#1083#1077#1081#1082#1072
      object btnUp: TSpeedButton
        Left = 176
        Top = 145
        Width = 23
        Height = 23
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555500000005555555555555555500000005555555555555555500000005555
          54444444555550000000555554CCCCC4555550000000555554CCCCC455555000
          0000555554CCCCC4555550000000555554CCCCC4555550000000555444CCCCC4
          44555000000055554CCCCCCC455550000000555554CCCCC45555500000005555
          554CCC4555555000000055555554C45555555000000055555555455555555000
          0000555555555555555550000000555555555555555550000000555555555555
          555550000000}
        OnClick = btnUpClick
      end
      object btnDown: TSpeedButton
        Left = 176
        Top = 169
        Width = 23
        Height = 23
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555500000005555555555555555500000005555555555555555500000005555
          5555455555555000000055555554C4555555500000005555554CCC4555555000
          0000555554CCCCC455555000000055554CCCCCCC455550000000555444CCCCC4
          445550000000555554CCCCC4555550000000555554CCCCC45555500000005555
          54CCCCC4555550000000555554CCCCC455555000000055555444444455555000
          0000555555555555555550000000555555555555555550000000555555555555
          555550000000}
        OnClick = btnDownClick
      end
      object lbFiles: TListBox
        Left = 8
        Top = 8
        Width = 161
        Height = 297
        Style = lbVirtual
        ItemHeight = 16
        TabOrder = 0
        OnData = lbFilesData
      end
      object btnAdd: TBitBtn
        Left = 176
        Top = 8
        Width = 97
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = btnAddClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000120B0000120B00000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B5619002B5619002B5519002A5519002B55
          19002B561A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B5619004AB32D004CB000004CAD00004CAB
          00002A551900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002A5519004AB34A004AB432004AB220004BB0
          20002B561900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B561A0049B5540049B53F004AB330004AB1
          2F002B561A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B56
          19002A5519002A5519002B5619002A55190048B65A0048B74C0049B6420049B3
          3A002B5619002B561A002B5619002B561A002A551900FF00FF00FF00FF002B56
          1A004EBE76004EBE760049BC6F0046BB690046BB610047B9580048B8500049B6
          430049B33A004BB12F004BAE21004CA800002B561900FF00FF00FF00FF002B55
          190053C37D0053C27B004DC0740048BE6E0046BD680047BC620047B9580048B8
          50004AB642004AB430004BB221004DAE00002B561900FF00FF00FF00FF002B56
          190057C5840059C4810054C27B004DC0740049BE6F0045BD690046BB600047B9
          590049B84F0049B53F004BB430004CB000002A551900FF00FF00FF00FF002B56
          1A005FC38B0062C38A005CC0820055BE7B004FC1770049BF6F0046BD680046BB
          600048B75B0048B4530049B249004AAE2D002B561900FF00FF00FF00FF002B56
          19002B5619002A5519002B5619002B56190055BE7B004EC0740047BE6E0045BB
          68002A5519002B5619002B561A002A5519002B561900FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B5619005CC1830053C27B004DC0740049BC
          70002A551900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B561A0062C38A0059C4820053C27B004FBD
          74002B561900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002A55190062C9900058C6850053C37D0050C1
          78002A551900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF002B5619002B5619002B5619002A5519002B56
          19002B561900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object btnDelete: TBitBtn
        Left = 176
        Top = 40
        Width = 97
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        OnClick = btnDeleteClick
        Glyph.Data = {
          16020000424D160200000000000036000000280000000D0000000C0000000100
          180000000000E0010000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF415DE21B45
          E000FF00FF000BDB4A66E3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          4154E1233FDFFF00FF00FF00FF001DDC0021DC4563E2FF00FFFF00FFFF00FFFF
          00FFFF00FF3A56E12F43E0FF00FFFF00FF00FF00FF8096ED0027E40022DC395D
          E2FF00FFFF00FFFF00FF2E55E12446E0FF00FFFF00FFFF00FF00FF00FFFF00FF
          FF00FF5373E40018DC4F70E67891E8001CDC2C53E1FF00FFFF00FFFF00FFFF00
          FF00FF00FFFF00FFFF00FFFF00FF6F8AE70028E60021E9496CE6FF00FFFF00FF
          FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FF6F8AE70029EA0019EA49
          67F5FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF5273F40018
          EB3E63EAFF00FF3857F5224BF6FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
          5576F80016F6395DF5FF00FFFF00FFFF00FF2E55FB1F43F6FF00FFFF00FFFF00
          FF00FF00FF5974F4000DF84564F9FF00FFFF00FFFF00FFFF00FFFF00FF5272F4
          5574F5FF00FFFF00FF004F6BF5000FF94A67F5FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF000824F84467F5FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
      end
      object btnClear: TBitBtn
        Left = 176
        Top = 72
        Width = 97
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 3
        OnClick = btnClearClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object btnGlueUp: TBitBtn
        Left = 176
        Top = 280
        Width = 97
        Height = 25
        Caption = #1057#1082#1083#1077#1080#1090#1100
        TabOrder = 4
        OnClick = btnGlueUpClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
          5555557777777775F5555559999999505555555777777757FFF5555555555550
          0955555555555FF7775F55555555995501955555555577557F75555555555555
          01995555555555557F5755555555555501905555555555557F57555555555555
          0F905555555555557FF75555555555500005555555555557777555555555550F
          F05555555555557F57F5555555555008F05555555555F775F755555555570000
          05555555555775577555555555700007555555555F755F775555555570000755
          55555555775F77555555555700075555555555F75F7755555555570007555555
          5555577F77555555555500075555555555557777555555555555}
        NumGlyphs = 2
      end
    end
    object shCut: TTabSheet
      Caption = #1056#1077#1079#1082#1072
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 56
        Width = 113
        Height = 13
        Caption = #1060#1072#1081#1083' '#1076#1083#1103' '#1088#1072#1079#1088#1077#1079#1072#1085#1080#1103
      end
      object Label2: TLabel
        Left = 8
        Top = 112
        Width = 95
        Height = 13
        Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1089#1090#1088#1072#1085#1080#1094
      end
      object edFileName: TFilenameEdit
        Left = 8
        Top = 72
        Width = 273
        Height = 21
        OnBeforeDialog = edFileNameBeforeDialog
        OnAfterDialog = edFileNameAfterDialog
        Filter = #1060#1072#1081#1083#1099' TIFF (*.tif)|*.tif'
        NumGlyphs = 1
        TabOrder = 0
      end
      object edRange: TEdit
        Left = 8
        Top = 128
        Width = 273
        Height = 21
        TabOrder = 1
      end
      object btnCutTIFF: TBitBtn
        Left = 88
        Top = 168
        Width = 105
        Height = 25
        Caption = #1056#1072#1079#1088#1077#1079#1072#1090#1100
        TabOrder = 2
        OnClick = btnCutTIFFClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333FF3333333333333003333333333333377F33333333333307
          733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
          000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
          777077777777777777773CCCCC00000000003777777777777777333330030FFF
          FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
          FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
          0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
          0F03333333337FFF7F7333333333000000333333333377777733}
        NumGlyphs = 2
      end
    end
    object shBatchCut: TTabSheet
      Caption = #1055#1072#1082#1077#1090#1085#1072#1103' '#1088#1077#1079#1082#1072
      ImageIndex = 2
      object Label3: TLabel
        Left = 8
        Top = 24
        Width = 168
        Height = 13
        Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1103' ('#1089' TIF-'#1072#1084#1080')'
      end
      object Label4: TLabel
        Left = 8
        Top = 80
        Width = 130
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1076#1083#1103' '#1074#1099#1083#1080#1074#1082#1080
      end
      object edDirFrom: TDirectoryEdit
        Left = 8
        Top = 40
        Width = 273
        Height = 21
        DialogKind = dkWin32
        NumGlyphs = 1
        TabOrder = 0
      end
      object edDirTo: TDirectoryEdit
        Left = 8
        Top = 96
        Width = 273
        Height = 21
        DialogKind = dkWin32
        NumGlyphs = 1
        TabOrder = 1
      end
      object cbGenerateGIF: TCheckBox
        Left = 8
        Top = 160
        Width = 153
        Height = 17
        Caption = #1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' GIF'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = cbGenerateGIFClick
      end
      object btnCutAll: TBitBtn
        Left = 88
        Top = 256
        Width = 105
        Height = 25
        Caption = #1056#1077#1079#1072#1090#1100' '#1074#1089#1077'!'
        TabOrder = 4
        OnClick = btnCutAllClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333FF3333333333333003333333333333377F33333333333307
          733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
          000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
          777077777777777777773CCCCC00000000003777777777777777333330030FFF
          FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
          FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
          0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
          0F03333333337FFF7F7333333333000000333333333377777733}
        NumGlyphs = 2
      end
      object cbGenerateTIFF: TCheckBox
        Left = 8
        Top = 136
        Width = 153
        Height = 17
        Caption = #1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' TIFF'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbGenerateTIFFClick
      end
      object cbAutoNumber: TCheckBox
        Left = 8
        Top = 192
        Width = 249
        Height = 17
        Caption = #1053#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbAutoNumberClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 295
    Height = 22
    Align = alBottom
    TabOrder = 1
    object ProgressBar: TProgressBar
      Left = 5
      Top = 3
      Width = 285
      Height = 16
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object XPManifest1: TXPManifest
    Left = 260
    Top = 336
  end
  object OpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' TIFF|*.tif'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 196
    Top = 336
  end
  object FormStorage1: TFormStorage
    StoredProps.Strings = (
      'OpenDialog.InitialDir'
      'edFileName.FileName'
      'edRange.Text'
      'edDirFrom.Text'
      'edDirTo.Text'
      'cbGenerateGIF.Checked')
    StoredValues = <>
    Left = 228
    Top = 336
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'tif'
    Filter = #1060#1072#1081#1083#1099' TIFF|*.tif'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 165
    Top = 336
  end
end
