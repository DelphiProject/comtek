object FrmOperator: TFrmOperator
  Left = 197
  Top = 117
  Caption = #1054#1087#1077#1088#1072#1090#1086#1088
  ClientHeight = 380
  ClientWidth = 706
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 313
    Top = 43
    Height = 337
    ExplicitTop = 60
    ExplicitHeight = 320
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 43
    Width = 313
    Height = 337
    Align = alLeft
    Caption = #1051#1102#1076#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 2
      Top = 16
      Width = 309
      Height = 29
      ButtonHeight = 30
      ButtonWidth = 31
      Caption = 'ToolBar1'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Caption = 'ToolButton1'
        ImageIndex = 15
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object ToolButton4: TToolButton
        Left = 31
        Top = 0
        Width = 3
        Caption = 'ToolButton4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 34
        Top = 0
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Caption = 'ToolButton5'
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton5Click
      end
      object ToolButton6: TToolButton
        Left = 65
        Top = 0
        Width = 3
        Caption = 'ToolButton6'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 68
        Top = 0
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Caption = 'ToolButton7'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton7Click
      end
      object ToolButton10: TToolButton
        Left = 99
        Top = 0
        Width = 3
        Caption = 'ToolButton10'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 102
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Caption = 'ToolButton9'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton9Click
      end
      object ToolButton8: TToolButton
        Left = 133
        Top = 0
        Width = 3
        Caption = 'ToolButton8'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton11: TToolButton
        Left = 136
        Top = 0
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        Caption = 'ToolButton11'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton11Click
      end
      object ToolButton12: TToolButton
        Left = 167
        Top = 0
        Width = 3
        Caption = 'ToolButton12'
        ImageIndex = 9
        Style = tbsSeparator
      end
    end
    object HumansGrid: TDBGrid
      Left = 2
      Top = 45
      Width = 309
      Height = 290
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'HUMANS_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FULLNAME'
          Title.Caption = #1060#1048#1054
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BORN_DATE'
          Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECORDING_DATE'
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 316
    Top = 43
    Width = 390
    Height = 337
    Align = alClient
    Caption = #1057#1087#1088#1072#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 187
      Top = 16
      Height = 319
      ExplicitLeft = 182
      ExplicitTop = 17
      ExplicitHeight = 300
    end
    object Panel1: TPanel
      Left = 2
      Top = 16
      Width = 185
      Height = 319
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object CertificatesGrid: TDBGrid
        Left = 1
        Top = 30
        Width = 183
        Height = 288
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CERTIFICATES_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'HUMANS_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CERTIFICATES_SCAN'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EXPIRATION_DATE'
            Title.Caption = #1044#1072#1090#1072' '#1080#1089#1090#1077#1095#1077#1085#1080#1103' '#1089#1088#1086#1082#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECORDING_DATE'
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
            Visible = True
          end>
      end
      object ToolBar2: TToolBar
        Left = 1
        Top = 1
        Width = 183
        Height = 29
        ButtonHeight = 30
        ButtonWidth = 31
        Caption = 'ToolBar1'
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100
          Caption = 'ToolButton1'
          ImageIndex = 15
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton2Click
        end
        object ToolButton13: TToolButton
          Left = 31
          Top = 0
          Width = 3
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton14: TToolButton
          Left = 34
          Top = 0
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          Caption = 'ToolButton5'
          ImageIndex = 12
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton14Click
        end
        object ToolButton15: TToolButton
          Left = 65
          Top = 0
          Width = 3
          Caption = 'ToolButton6'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton16: TToolButton
          Left = 68
          Top = 0
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Caption = 'ToolButton7'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton16Click
        end
        object ToolButton17: TToolButton
          Left = 99
          Top = 0
          Width = 3
          Caption = 'ToolButton8'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton18: TToolButton
          Left = 102
          Top = 0
          Hint = #1059#1076#1072#1083#1080#1090#1100
          Caption = 'ToolButton9'
          ImageIndex = 9
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton18Click
        end
        object ToolButton19: TToolButton
          Left = 133
          Top = 0
          Width = 3
          Caption = 'ToolButton10'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton20: TToolButton
          Left = 136
          Top = 0
          Hint = #1054#1073#1085#1086#1074#1080#1090#1100
          Caption = 'ToolButton11'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton20Click
        end
        object ToolButton21: TToolButton
          Left = 167
          Top = 0
          Width = 3
          Caption = 'ToolButton12'
          ImageIndex = 9
          Style = tbsSeparator
        end
      end
    end
    object Panel2: TPanel
      Left = 190
      Top = 16
      Width = 198
      Height = 319
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 1
      object PhotoDBImage: TDBImage
        Left = 1
        Top = 30
        Width = 196
        Height = 288
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Proportional = True
        Stretch = True
        TabOrder = 0
      end
      object ToolBar3: TToolBar
        Left = 1
        Top = 1
        Width = 196
        Height = 29
        ButtonHeight = 30
        ButtonWidth = 31
        Caption = 'ToolBar2'
        TabOrder = 1
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1082#1072#1085
          Caption = 'ToolButton2'
          ImageIndex = 13
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton3Click
        end
        object ToolButton22: TToolButton
          Left = 31
          Top = 0
          Width = 3
          Caption = 'ToolButton22'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton23: TToolButton
          Left = 34
          Top = 0
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1082#1072#1085
          Caption = 'ToolButton23'
          ImageIndex = 14
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton23Click
        end
        object ToolButton24: TToolButton
          Left = 65
          Top = 0
          Width = 3
          Caption = 'ToolButton24'
          ImageIndex = 2
          Style = tbsSeparator
        end
      end
    end
  end
  inline FrameFind1: TFrameFind
    Left = 0
    Top = 0
    Width = 706
    Height = 43
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 706
    inherited GroupBox1: TGroupBox
      Width = 706
      ExplicitWidth = 706
      inherited FilterSpeedButton: TSpeedButton
        Top = 16
        OnClick = FrameFind1FilterSpeedButtonClick
        ExplicitTop = 16
      end
      inherited FilterEdit: TEdit
        Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1087#1086#1080#1089#1082#1072
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Jpeg|*.jpg;*.jpeg'
    Left = 32
    Top = 272
  end
end
