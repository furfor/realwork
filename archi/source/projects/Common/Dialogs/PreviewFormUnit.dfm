object PreviewForm: TPreviewForm
  Left = 269
  Top = 114
  Width = 870
  Height = 640
  Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088':'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object vtPreviewPanel1: TvtPreviewPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Cursor = 1
    Align = alClient
    Caption = 'vtPreviewPanel1'
    Constraints.MinHeight = 41
    Constraints.MinWidth = 100
    UseDockManager = False
    TabOrder = 0
  end
end
