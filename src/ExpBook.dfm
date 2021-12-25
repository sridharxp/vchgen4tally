object frmExpbook: TfrmExpbook
  Left = 7
  Top = 0
  Width = 1131
  Height = 600
  Caption = 'Generate and Export'
  Color = clBtnFace
  Constraints.MaxHeight = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object DBView: TPageControl
    Left = 0
    Top = 0
    Width = 1100
    Height = 500
    ActivePage = TabSheet2
    Align = alCustom
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Grid View'
      object Panel1: TPanel
        Left = 32
        Top = 57
        Width = 1100
        Height = 416
        TabOrder = 0
        object wwDBGrid1: TwwDBGrid
          Left = 1
          Top = 1
          Width = 1200
          Height = 500
          ControlType.Strings = (
            'GENTYPE;CustomEdit;cmbGenType;F'
            'VOU_TYPE;CustomEdit;cmbVchType;F'
            'DRCR;CustomEdit;cmbDrCr;F'
            'EXCLUDE;CustomEdit;cmbWeekDays;F'
            'CONTRA;CustomEdit;cmbTalywMst;F'
            'ROUNDTO;CustomEdit;cmbRound;F'
            'GENERATED;CustomEdit;cmbGENERATED;F'
            'INVLED;CustomEdit;cmbInvLed;F'
            'VCHTYPE2;CustomEdit;cmbVchType;F')
          PictureMasks.Strings = (
            'NAME'#9'{R,W}'#9'T'#9'T'
            'AMOUNT'#9'#[#][#][#][#][#][#][#]'#9'T'#9'T'
            'ENTRIES'#9'#[#][#][#]'#9'T'#9'T'
            'HIGH'#9'#[#][#][#][#]'#9'T'#9'T'
            'PERDAY'#9'#'#9'T'#9'T'
            'ROUNDTO'#9'#'#9'T'#9'T'
            'EXCLUDE'#9'#'#9'T'#9'T'
            'INCLUDE'#9'#[#][#][#][#][#]'#9'T'#9'T'
            'COUNTER'#9'#[#][#]'#9'T'#9'T')
          Selected.Strings = (
            'NAME'#9'30'#9'NAME'#9#9
            'PARENT'#9'20'#9'PARENT'#9#9
            'AMOUNT'#9'10'#9'AMOUNT'#9#9
            'HIGH'#9'10'#9'HIGH'#9#9
            'LOW'#9'10'#9'LOW'#9'T'
            'ENTRIES'#9'10'#9'ENTRIES'#9#9
            'ROUNDTO'#9'10'#9'ROUNDTO'#9#9
            'INCLUDE'#9'6'#9'INCLUDE'#9#9
            'EXCLUDE'#9'1'#9'EXCLUDE'#9#9
            'FRMDT'#9'10'#9'FRMDT'#9#9
            'TODT'#9'10'#9'TODT'#9#9
            'CONTRA'#9'20'#9'CONTRA'#9#9
            'NARRATION'#9'20'#9'NARRATION'#9#9
            'DRCR'#9'1'#9'DRCR'#9#9
            'VOU_TYPE'#9'4'#9'VOU_TYPE'#9#9
            'GENTYPE'#9'1'#9'GENTYPE'#9#9
            'PERDAY'#9'10'#9'PERDAY'#9#9
            'CONTRA2'#9'20'#9'CONTRA2'#9#9
            'CONTRA3'#9'20'#9'CONTRA3'#9#9
            'PERCENTAGE'#9'10'#9'PERCENTAGE'#9#9
            'DRCR2'#9'1'#9'DRCR2'#9#9
            'VCHTYPE2'#9'4'#9'VCHTYPE2'#9#9
            'ITEM'#9'15'#9'ITEM'#9#9
            'QTY'#9'10'#9'QTY'#9#9
            'UNIT'#9'10'#9'UNIT'#9#9
            'RATE'#9'10'#9'RATE'#9'F'
            'INVVCH'#9'5'#9'INVVCH'#9#9
            'INVLED'#9'10'#9'INVLED'#9#9
            'GENERATED'#9'5'#9'GENERATED'#9#9
            'COUNTER'#9'10'#9'COUNTER'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
        end
        object cmbGenType: TwwDBComboBox
          Left = 247
          Top = 137
          Width = 98
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Random'#9'R'
            'Weekly'#9'W')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object cmbVchType: TwwDBComboBox
          Left = 358
          Top = 137
          Width = 98
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Payment'#9'Pymt'
            'Receipt'#9'Rcpt'
            'Journal'#9'Jrnl'
            'Sales'#9'Sale'
            'Purchase'#9'Purc')
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object cmbDrCr: TwwDBComboBox
          Left = 468
          Top = 113
          Width = 98
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Dr'#9'D'
            'Cr'#9'C')
          Sorted = False
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object cmbWeekDays: TwwDBComboBox
          Left = 39
          Top = 124
          Width = 98
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            '1 Sunday'#9'1'
            '2 Monday'#9'2'
            '3 Tuesday'#9'3'
            '4 Wednesday'#9'4'
            '5 Thursday'#9'5'
            '6 Friday'#9'6'
            '7 Saturday'#9'7')
          Sorted = False
          TabOrder = 4
          UnboundDataType = wwDefault
        end
        object cmbTalywMst: TwwDBLookupCombo
          Left = 91
          Top = 169
          Width = 98
          Height = 28
          DropDownAlignment = taRightJustify
          LookupTable = hTalywMst
          LookupField = 'NAME'
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object cmbRound: TwwDBComboBox
          Left = 143
          Top = 130
          Width = 60
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Nearest Rupee'#9'0'
            'Nearest 5 Rupees'#9'3'
            'Nearest 10 Rupees'#9'4'
            'Nearest 50 Rupees'#9'5'
            'Nearest 100 Rupees'#9'6')
          Sorted = False
          TabOrder = 6
          UnboundDataType = wwDefault
        end
        object cmbGENERATED: TwwDBComboBox
          Left = 624
          Top = 189
          Width = 60
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENERATED'
          DataSource = dsLList
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          Sorted = False
          TabOrder = 7
          UnboundDataType = wwDefault
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Simple Voucher'
      ImageIndex = 1
      DesignSize = (
        1092
        465)
      object Panel3: TPanel
        Left = 0
        Top = 41
        Width = 1089
        Height = 416
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 3
          Width = 50
          Height = 20
          Caption = 'Ledger'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 292
          Top = 3
          Width = 48
          Height = 20
          Caption = 'Contra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 24
          Top = 80
          Width = 56
          Height = 20
          Caption = 'Amount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 546
          Top = 80
          Width = 67
          Height = 20
          Caption = 'Maximum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 290
          Top = 80
          Width = 50
          Height = 20
          Caption = 'Entries'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 820
          Top = 80
          Width = 69
          Height = 20
          Caption = 'Gen Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 564
          Top = 3
          Width = 49
          Height = 20
          Caption = 'V Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 24
          Top = 240
          Width = 35
          Height = 20
          Caption = 'Rate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 812
          Top = 320
          Width = 77
          Height = 20
          Caption = 'Generated'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 24
          Top = 160
          Width = 65
          Height = 20
          Caption = 'Inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 308
          Top = 160
          Width = 32
          Height = 20
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 585
          Top = 160
          Width = 28
          Height = 20
          Caption = 'Qt y'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 860
          Top = 159
          Width = 29
          Height = 20
          Caption = 'Unit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 548
          Top = 240
          Width = 65
          Height = 20
          Caption = 'Narration'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 246
          Top = 240
          Width = 98
          Height = 20
          Caption = 'Average Rate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 24
          Top = 320
          Width = 37
          Height = 20
          Caption = 'From'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 326
          Top = 320
          Width = 18
          Height = 20
          Caption = 'To'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl12: TLabel
          Left = 822
          Top = 240
          Width = 59
          Height = 20
          Caption = 'Start No'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl10: TLabel
          Left = 797
          Top = 3
          Width = 92
          Height = 20
          Caption = 'Include Days'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl11: TLabel
          Left = 539
          Top = 320
          Width = 74
          Height = 20
          Caption = 'Round  To'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edtNAME: TwwDBEdit
          Left = 104
          Top = 3
          Width = 170
          Height = 32
          DataField = 'NAME'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBComboBox2: TwwDBComboBox
          Left = 640
          Top = 3
          Width = 98
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'VOU_TYPE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Payment'#9'Pymt'
            'Receipt'#9'Rcpt'
            'Journal'#9'Jrnl'
            'Sales'#9'Sale'
            'Purchase'#9'Purc')
          ParentFont = False
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object edtAMOUNT: TwwDBEdit
          Left = 104
          Top = 80
          Width = 99
          Height = 32
          DataField = 'AMOUNT'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '#[#][#][#][#][#][#][#]'
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object cmbGENTYPE1: TwwDBComboBox
          Left = 913
          Top = 80
          Width = 99
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENTYPE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Random'#9'R'
            'Weekly'#9'W')
          ParentFont = False
          Sorted = False
          TabOrder = 7
          UnboundDataType = wwDefault
          OnChange = cmbGENTYPE1Change
        end
        object edtENTRIES1: TwwDBEdit
          Left = 373
          Top = 80
          Width = 61
          Height = 32
          DataField = 'ENTRIES'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit5: TwwDBEdit
          Left = 640
          Top = 80
          Width = 61
          Height = 32
          DataField = 'HIGH'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edtRATE: TwwDBEdit
          Left = 104
          Top = 240
          Width = 99
          Height = 32
          DataField = 'RATE'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 373
          Top = 3
          Width = 170
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object wwDBComboBox15: TwwDBComboBox
          Left = 104
          Top = 160
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'INVVCH'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 8
          UnboundDataType = wwDefault
        end
        object wwDBLookupCombo6: TwwDBLookupCombo
          Left = 913
          Top = 160
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'UNIT'
          DataSource = dsLList
          LookupTable = hTalywMst
          ParentFont = False
          TabOrder = 11
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object edtHIGH1: TwwDBEdit
          Left = 640
          Top = 160
          Width = 61
          Height = 32
          DataField = 'QTY'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object cmbITEM: TwwDBLookupCombo
          Left = 373
          Top = 160
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'ITEM'
          DataSource = dsLList
          LookupTable = hTalywMst
          ParentFont = False
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object cmbGENERATED1: TwwDBComboBox
          Left = 913
          Top = 320
          Width = 60
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENERATED'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 19
          UnboundDataType = wwDefault
        end
        object edtNARRATION: TwwDBEdit
          Left = 640
          Top = 240
          Width = 142
          Height = 32
          DataField = 'NARRATION'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object cmbEXPDEPMST: TwwDBComboBox
          Left = 373
          Top = 241
          Width = 94
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DataField = 'FIXEDRATE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'True'
            'False')
          ItemIndex = 0
          ParentFont = False
          Sorted = False
          TabOrder = 13
          UnboundDataType = wwDefault
        end
        object cnbDATE: TwwDBDateTimePicker
          Left = 104
          Top = 320
          Width = 120
          Height = 28
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'FRMDT'
          DataSource = dsLList
          Date = 44287.000000000000000000
          Epoch = 1950
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 16
        end
        object cnbDATE1: TwwDBDateTimePicker
          Left = 373
          Top = 320
          Width = 120
          Height = 28
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'TODT'
          DataSource = dsLList
          Date = 44651.000000000000000000
          Epoch = 1950
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 17
        end
        object edtCounter: TwwDBEdit
          Left = 913
          Top = 240
          Width = 61
          Height = 32
          DataField = 'COUNTER'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edtInclude: TwwDBEdit
          Left = 913
          Top = 3
          Width = 60
          Height = 32
          DataField = 'INCLUDE'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnChange = edtIncludeChange
        end
        object cmbROUNDTO: TwwDBComboBox
          Left = 640
          Top = 320
          Width = 142
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'ROUNDTO'
          DataSource = dsLList
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Nearest Rupee'#9'0'
            'Nearest 5 Rupees'#9'3'
            'Nearest 10 Rupees'#9'4'
            'Nearest 50 Rupees'#9'5'
            'Nearest 100 Rupees'#9'6')
          Sorted = False
          TabOrder = 18
          UnboundDataType = wwDefault
        end
        object ckbMon: TwwCheckBox
          Left = 113
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Monday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          ReadOnly = True
        end
        object ckbTue: TwwCheckBox
          Left = 273
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Tuesday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          ReadOnly = True
        end
        object ckbWed: TwwCheckBox
          Left = 433
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Wednesday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          ReadOnly = True
        end
        object ckbThu: TwwCheckBox
          Left = 593
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Thursday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          ReadOnly = True
        end
        object ckbFri: TwwCheckBox
          Left = 753
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Friday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          ReadOnly = True
        end
        object ckbSat: TwwCheckBox
          Left = 913
          Top = 389
          Width = 80
          Height = 17
          DisableThemes = False
          AlwaysTransparent = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          DisplayValueChecked = 'True'
          DisplayValueUnchecked = 'False'
          NullAndBlankState = cbUnchecked
          Caption = 'Saturday'
          DataField = 'POSTTYPE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
          ReadOnly = True
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Compond Voucher'
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 49
        Width = 1097
        Height = 416
        TabOrder = 0
        object Label13: TLabel
          Left = 545
          Top = 80
          Width = 67
          Height = 20
          Caption = 'Maximum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 309
          Top = 80
          Width = 50
          Height = 20
          Caption = 'Entries'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 24
          Top = 80
          Width = 56
          Height = 20
          Caption = 'Amount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 567
          Top = 3
          Width = 45
          Height = 20
          Caption = 'v Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 31
          Top = 240
          Width = 65
          Height = 20
          Caption = 'Inventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 535
          Top = 240
          Width = 77
          Height = 20
          Caption = 'Generated'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 277
          Top = 160
          Width = 82
          Height = 20
          Caption = 'Percentage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 579
          Top = 160
          Width = 33
          Height = 20
          Caption = 'DrCr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 296
          Top = 0
          Width = 63
          Height = 20
          Caption = 'Ledger 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 24
          Top = 3
          Width = 50
          Height = 20
          Caption = 'Ledger'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 24
          Top = 160
          Width = 63
          Height = 20
          Caption = 'Ledger 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 772
          Top = 80
          Width = 69
          Height = 20
          Caption = 'Gen Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 778
          Top = 160
          Width = 63
          Height = 20
          Caption = 'Ledger 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object wwDBEdit11: TwwDBEdit
          Left = 664
          Top = 80
          Width = 61
          Height = 32
          DataField = 'HIGH'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit10: TwwDBEdit
          Left = 397
          Top = 80
          Width = 61
          Height = 32
          DataField = 'ENTRIES'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit9: TwwDBEdit
          Left = 113
          Top = 80
          Width = 99
          Height = 32
          DataField = 'AMOUNT'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '#[#][#][#][#][#][#][#]'
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBComboBox8: TwwDBComboBox
          Left = 664
          Top = 3
          Width = 98
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'VOU_TYPE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Payment'#9'Pymt'
            'Receipt'#9'Rcpt'
            'Journal'#9'Jrnl'
            'Sales'#9'Sale'
            'Purchase'#9'Purc')
          ParentFont = False
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object wwDBComboBox7: TwwDBComboBox
          Left = 113
          Top = 240
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'INVVCH'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 11
          UnboundDataType = wwDefault
        end
        object wwDBComboBox6: TwwDBComboBox
          Left = 664
          Top = 240
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENERATED'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 12
          UnboundDataType = wwDefault
        end
        object wwDBEdit7: TwwDBEdit
          Left = 397
          Top = 160
          Width = 61
          Height = 32
          DataField = 'PERCENTAGE'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '#[#][.[#][#]]'
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBComboBox5: TwwDBComboBox
          Left = 664
          Top = 160
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'DRCR2'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Debit'#9'D'
            'Credit'#9'C')
          ParentFont = False
          Sorted = False
          TabOrder = 9
          UnboundDataType = wwDefault
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 113
          Top = 160
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA2'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          ParentFont = False
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 397
          Top = 3
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object wwDBEdit2: TwwDBEdit
          Left = 113
          Top = 3
          Width = 142
          Height = 32
          DataField = 'NAME'
          DataSource = dsLList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBComboBox11: TwwDBComboBox
          Left = 865
          Top = 80
          Width = 99
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENTYPE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Random'#9'R'
            'Weekly'#9'W')
          ParentFont = False
          Sorted = False
          TabOrder = 6
          UnboundDataType = wwDefault
        end
        object cmbCONTRA: TwwDBLookupCombo
          Left = 865
          Top = 160
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA3'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          ParentFont = False
          TabOrder = 10
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'PairVoucher'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 48
        Width = 1097
        Height = 425
        TabOrder = 0
        object Label22: TLabel
          Left = 31
          Top = 160
          Width = 63
          Height = 20
          Caption = 'Ledger 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 483
          Top = 240
          Width = 77
          Height = 20
          Caption = 'Generated'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 20
          Top = 240
          Width = 70
          Height = 20
          Caption = 'IInventory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 489
          Top = 160
          Width = 71
          Height = 20
          Caption = 'InvLedger'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 31
          Top = 3
          Width = 50
          Height = 20
          Caption = 'Ledger'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 511
          Top = 3
          Width = 49
          Height = 20
          Caption = 'V Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 31
          Top = 80
          Width = 56
          Height = 20
          Caption = 'Amount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 285
          Top = 80
          Width = 50
          Height = 20
          Caption = 'Entries'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 493
          Top = 80
          Width = 67
          Height = 20
          Caption = 'Maximum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 272
          Top = 0
          Width = 63
          Height = 20
          Caption = 'Ledger 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 286
          Top = 160
          Width = 49
          Height = 20
          Caption = 'V Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 743
          Top = 80
          Width = 69
          Height = 20
          Caption = 'Gen Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 709
          Top = 160
          Width = 103
          Height = 20
          Caption = 'Daus between'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cmbVCHTYPE2: TwwDBComboBox
          Left = 355
          Top = 160
          Width = 99
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'VCHTYPE2'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Payment'#9'Pymt'
            'Receipt'#9'Rcpt'
            'Journal'#9'Jrnl'
            'Sales'#9'Sale'
            'Purchase'#9'Purc')
          ParentFont = False
          Sorted = False
          TabOrder = 8
          UnboundDataType = wwDefault
        end
        object wwDBLookupCombo5: TwwDBLookupCombo
          Left = 112
          Top = 160
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA2'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          Options = [loSearchOnBackspace]
          ParentFont = False
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object wwDBComboBox12: TwwDBComboBox
          Left = 615
          Top = 240
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENERATED'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 12
          UnboundDataType = wwDefault
        end
        object wwDBComboBox1: TwwDBComboBox
          Left = 112
          Top = 240
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'INVVCH'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Yes'#9'True'
            'No'#9'False')
          ParentFont = False
          Sorted = False
          TabOrder = 11
          UnboundDataType = wwDefault
        end
        object wwDBEdit8: TwwDBEdit
          Left = 112
          Top = 3
          Width = 142
          Height = 32
          DataField = 'NAME'
          DataSource = dsLList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBLookupCombo4: TwwDBLookupCombo
          Left = 355
          Top = 3
          Width = 142
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          DataField = 'CONTRA'
          DataSource = dsLList
          LookupTable = hTalywMst
          LookupField = 'Name'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object wwDBComboBox9: TwwDBComboBox
          Left = 615
          Top = 3
          Width = 98
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'VOU_TYPE'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Payment'#9'Pymt'
            'Receipt'#9'Rcpt'
            'Journal'#9'Jrnl'
            'Sales'#9'Sale'
            'Purchase'#9'Purc')
          ParentFont = False
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object wwDBEdit12: TwwDBEdit
          Left = 112
          Top = 80
          Width = 98
          Height = 32
          DataField = 'AMOUNT'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '#[#][#][#][#][#][#][#]'
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit13: TwwDBEdit
          Left = 355
          Top = 80
          Width = 61
          Height = 32
          DataField = 'ENTRIES'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBComboBox13: TwwDBComboBox
          Left = 840
          Top = 80
          Width = 98
          Height = 28
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'GENTYPE'
          DataSource = dsLList
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Random'#9'R'
            'Weekly'#9'W')
          Sorted = False
          TabOrder = 6
          UnboundDataType = wwDefault
        end
        object edtHIGH: TwwDBEdit
          Left = 615
          Top = 80
          Width = 61
          Height = 32
          DataField = 'HIGH'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object cmbINVLED1: TwwDBComboBox
          Left = 615
          Top = 160
          Width = 61
          Height = 32
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'INVLED'
          DataSource = dsLList
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Contra 1'#9'1'
            'Contra 2'#9'2')
          ParentFont = False
          Sorted = False
          TabOrder = 9
          UnboundDataType = wwDefault
        end
        object edtENTRIES: TwwDBEdit
          Left = 840
          Top = 160
          Width = 61
          Height = 32
          DataField = 'MDAYS'
          DataSource = dsLList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 512
    Width = 1115
    Height = 50
    Align = alBottom
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Info: TLabel
      Left = 56
      Top = 18
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object btnDownload: TButton
      Left = 374
      Top = 14
      Width = 142
      Height = 21
      Caption = 'Download Ledger List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnDownloadClick
    end
    object btnGenerate: TButton
      Left = 600
      Top = 14
      Width = 142
      Height = 21
      Caption = 'Generate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnGenerateClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 24
    Width = 1100
    Height = 41
    TabOrder = 2
    object wwIncrementalSearch1: TwwIncrementalSearch
      Left = 33
      Top = 11
      Width = 98
      Height = 24
      DataSource = dsLList
      SearchField = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 450
      Top = 13
      Width = 200
      Height = 20
      DataSource = dsLList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object dsLList: TDataSource
    DataSet = hLlist
    Left = 120
    Top = 376
  end
  object hLlist: THalcyonDataSet
    About = 'Halcyon Version 6.98 (15 September 2009)'
    AutoFlush = True
    DatabaseName = '\TL\EV\Data'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'LLIST.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 16
    Top = 48
    object strngfldLlistINCLUDE: TStringField
      FieldName = 'INCLUDE'
      Size = 6
    end
    object strngfldLlistNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object strngfldLlistPARENT: TStringField
      FieldName = 'PARENT'
      Size = 30
    end
    object intgrfldLlistAMOUNT: TIntegerField
      FieldName = 'AMOUNT'
    end
    object intgrfldLlistLOW: TIntegerField
      FieldName = 'LOW'
    end
    object intgrfldLlistHIGH: TIntegerField
      FieldName = 'HIGH'
    end
    object EdtLlistENTRIES: TSmallintField
      FieldName = 'ENTRIES'
    end
    object EdtLlistROUNDTO: TSmallintField
      FieldName = 'ROUNDTO'
    end
    object strngfldLlistEXCLUDE: TStringField
      FieldName = 'EXCLUDE'
      Size = 1
    end
    object dtfldLlistFRMDT: TDateField
      FieldName = 'FRMDT'
    end
    object dtfldLlistTODT: TDateField
      FieldName = 'TODT'
    end
    object strngfldLlistCONTRA: TStringField
      FieldName = 'CONTRA'
      Size = 50
    end
    object strngfldLlistNARRATION: TStringField
      FieldName = 'NARRATION'
      Size = 60
    end
    object strngfldLlistDRCR: TStringField
      FieldName = 'DRCR'
      Size = 1
    end
    object strngfldLlistVOU_TYPE: TStringField
      FieldName = 'VOU_TYPE'
      Size = 4
    end
    object strngfldLlistGENTYPE: TStringField
      FieldName = 'GENTYPE'
      Size = 1
    end
    object EdtLlistPERDAY: TSmallintField
      FieldName = 'PERDAY'
    end
    object strngfldLlistCONTRA2: TStringField
      FieldName = 'CONTRA2'
      Size = 50
    end
    object strngfldLlistCONTRA3: TStringField
      FieldName = 'CONTRA3'
      Size = 50
    end
    object EdtLlistPERCENTAGE: TFloatField
      FieldName = 'PERCENTAGE'
    end
    object strngfldLlistDRCR2: TStringField
      FieldName = 'DRCR2'
      Size = 1
    end
    object strngfldLlistVCHTYPE2: TStringField
      FieldName = 'VCHTYPE2'
      Size = 4
    end
    object strngfldLlistITEM: TStringField
      FieldName = 'ITEM'
      Size = 30
    end
    object EdtLlistQTY: TFloatField
      FieldName = 'QTY'
    end
    object strngfldLlistUNIT: TStringField
      FieldName = 'UNIT'
      Size = 30
    end
    object EdtLlistINVVCH: TBooleanField
      FieldName = 'INVVCH'
    end
    object EdtLlistINVLED: TSmallintField
      FieldName = 'INVLED'
    end
    object EdtLlistGENERATED: TBooleanField
      FieldName = 'GENERATED'
    end
    object EdtLlistCOUNTER: TSmallintField
      FieldName = 'COUNTER'
    end
    object EdtLlistRATE: TFloatField
      FieldName = 'RATE'
    end
    object EdtLlistMDAYS: TSmallintField
      FieldName = 'MDAYS'
    end
    object EdtLlistFIXEDRATE: TBooleanField
      FieldName = 'FIXEDRATE'
    end
  end
  object hTalywMst: THalcyonDataSet
    About = 'Halcyon Version 6.98 (15 September 2009)'
    AutoFlush = False
    DatabaseName = '.\Data'
    Exclusive = False
    IndexName = 'Name'
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'TALYWMST.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 16
    Top = 184
  end
  object hExpBook: THalcyonDataSet
    About = 'Halcyon Version 6.98 (15 September 2009)'
    AutoFlush = False
    DatabaseName = '.\Data'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'EXPBOOK.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 8
    Top = 128
  end
end
