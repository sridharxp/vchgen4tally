object frmExp2: TfrmExp2
  Left = 439
  Top = 125
  Width = 700
  Height = 500
  Caption = 'Voucher Generator v1.92'
  Color = clMenuHighlight
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object MainMenu1: TMainMenu
    Left = 136
    Top = 96
    object ExportVoucher1: TMenuItem
      Caption = 'Vouchers'
      object Generate1: TMenuItem
        Caption = 'Generate'
        OnClick = Generate1Click
      end
      object Preview2: TMenuItem
        Caption = 'Preview'
        OnClick = Preview2Click
      end
      object Configure2: TMenuItem
        Caption = 'Configuration'
        OnClick = Configure2Click
      end
      object mniCleanup1: TMenuItem
        Caption = 'Cleanup'
        OnClick = mniCleanup1Click
      end
    end
    object H1: TMenuItem
      Caption = 'Help'
      object Contact1: TMenuItem
        Caption = 'Developer'
        OnClick = Contact1Click
      end
    end
  end
end
