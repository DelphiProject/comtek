object DBConnectForm: TDBConnectForm
  Left = 445
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1041#1044
  ClientHeight = 239
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    253
    239)
  PixelsPerInch = 96
  TextHeight = 13
  object DBNameLabeledEdit: TLabeledEdit
    Left = 8
    Top = 48
    Width = 235
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1041#1044
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object LoginLabeledEdit: TLabeledEdit
    Left = 8
    Top = 88
    Width = 235
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' Oracle Database'
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 124
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object PasswordLabeledEdit: TLabeledEdit
    Left = 8
    Top = 128
    Width = 235
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' Oracle Database'
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 132
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object PortLabeledEdit: TLabeledEdit
    Left = 10
    Top = 168
    Width = 235
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1088#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' Oracle Database'
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1088#1090
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object ClientLibraryLabeledEdit: TLabeledEdit
    Left = 10
    Top = 210
    Width = 235
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 234
    EditLabel.Height = 13
    EditLabel.Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1089#1082#1086#1081' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1080
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 253
    Height = 29
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    TabOrder = 5
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      Caption = 'ToolButton1'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Width = 3
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = False
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 34
      Top = 0
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      Caption = 'ToolButton3'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
    object ToolButton6: TToolButton
      Left = 65
      Top = 0
      Width = 3
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 68
      Top = 0
      Hint = #1055#1077#1088#1077#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
      Caption = 'ToolButton5'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton5Click
    end
    object ToolButton4: TToolButton
      Left = 99
      Top = 0
      Width = 3
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
end
