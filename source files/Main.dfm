object MainForm: TMainForm
  Left = 194
  Top = 111
  Caption = 'Comtek'
  ClientHeight = 365
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowMenu = Windows
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 346
    Width = 718
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object MainMenu: TMainMenu
    Left = 72
    Top = 32
    object Windows: TMenuItem
      Caption = #1040#1056#1052
      Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1040#1056#1052
      ImageIndex = 0
      object ChildOperator: TMenuItem
      end
      object ChildStatist: TMenuItem
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object AlignmentWindows: TMenuItem
        Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077' '#1086#1082#1086#1085' '#1040#1056#1052
        Hint = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077' '#1086#1082#1086#1085' '#1040#1056#1052
        object WindowCascadeItem: TMenuItem
        end
        object WindowTileItem: TMenuItem
        end
        object WindowTileItem2: TMenuItem
        end
        object WindowMinimizeItem: TMenuItem
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Exit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        OnClick = ExitClick
      end
    end
    object Service: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      ImageIndex = 6
      object DBConnectionProperties: TMenuItem
      end
    end
  end
end
