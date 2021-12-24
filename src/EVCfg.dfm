object frmEVCfg: TfrmEVCfg
  Left = 192
  Top = 3
  Width = 620
  Height = 669
  ActiveControl = cmbGenType
  Caption = 'Configure Default'
  Color = clBtnFace
  Constraints.MaxHeight = 700
  Constraints.MaxWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object DBNavigator1: TDBNavigator
    Left = 202
    Top = 19
    Width = 200
    Height = 19
    DataSource = dsEVCfg
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 9
    Top = 51
    Width = 584
    Height = 575
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 89
      Width = 26
      Height = 16
      Caption = 'Firm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 270
      Top = 187
      Width = 19
      Height = 19
      Caption = 'To'
    end
    object Label5: TLabel
      Left = 25
      Top = 187
      Width = 30
      Height = 16
      Caption = 'From'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 270
      Top = 231
      Width = 55
      Height = 16
      Caption = 'Round off'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 25
      Top = 362
      Width = 196
      Height = 16
      Caption = 'Generate Dependent Leger Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 25
      Top = 406
      Width = 235
      Height = 16
      Caption = 'Generate Previous / Next day to Excluded'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 133
      Width = 72
      Height = 16
      Caption = 'Tally version'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 25
      Top = 231
      Width = 54
      Height = 16
      Caption = 'Gen Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 25
      Top = 274
      Width = 41
      Height = 16
      Caption = 'Include'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 270
      Top = 274
      Width = 43
      Height = 16
      Caption = 'Exclude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 25
      Top = 318
      Width = 44
      Height = 32
      Caption = 'Per Day'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 25
      Top = 450
      Width = 63
      Height = 16
      Caption = 'Item Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 270
      Top = 450
      Width = 59
      Height = 16
      Caption = 'Unit Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 25
      Top = 16
      Width = 40
      Height = 16
      Caption = 'Host IP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 286
      Top = 12
      Width = 23
      Height = 16
      Caption = 'Port'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 25
      Top = 494
      Width = 30
      Height = 16
      Caption = ' Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 25
      Top = 538
      Width = 91
      Height = 16
      Caption = 'Is Average Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 270
      Top = 538
      Width = 68
      Height = 32
      Caption = 'Decimal Qty'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 270
      Top = 318
      Width = 80
      Height = 16
      Caption = 'Days between'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtFirm: TwwDBEdit
      Left = 132
      Top = 89
      Width = 280
      Height = 31
      DataField = 'FIRM'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cmbFrmDt: TwwDBDateTimePicker
      Left = 132
      Top = 187
      Width = 130
      Height = 27
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -13
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      DataField = 'FRMDT'
      DataSource = dsEVCfg
      Date = 44287.000000000000000000
      Epoch = 1950
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 5
    end
    object cmbToDt: TwwDBDateTimePicker
      Left = 362
      Top = 187
      Width = 130
      Height = 27
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -13
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      DataField = 'TODT'
      DataSource = dsEVCfg
      Date = 44651.000000000000000000
      Epoch = 1950
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 6
    end
    object cmbPriorNext: TwwDBComboBox
      Left = 362
      Top = 406
      Width = 94
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'PRENEXT'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'Prior'#9'P'
        'Next'#9'N')
      ParentFont = False
      Sorted = False
      TabOrder = 14
      UnboundDataType = wwDefault
    end
    object edtTallyVersion: TwwDBEdit
      Left = 132
      Top = 133
      Width = 94
      Height = 31
      DataField = 'TLVERSION'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtPerDay: TwwDBEdit
      Left = 132
      Top = 318
      Width = 94
      Height = 31
      DataField = 'PERDAY'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cmbRound: TwwDBComboBox
      Left = 362
      Top = 231
      Width = 207
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'ROUNDTO'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'Nearest Rupee'#9'0'
        'Nearest 5 Rupees'#9'3'
        'Nearest 10 Rupees'#9'4'
        'Nearest 50 Rupees'#9'5'
        'Nearest 100 Rupees'#9'6')
      ParentFont = False
      Sorted = False
      TabOrder = 8
      UnboundDataType = wwDefault
    end
    object edtInclude: TwwDBEdit
      Left = 132
      Top = 274
      Width = 94
      Height = 31
      DataField = 'INCLUDE'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtExclude: TwwDBEdit
      Left = 362
      Top = 274
      Width = 94
      Height = 27
      DataField = 'EXCLUDE'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cmbDep: TwwDBComboBox
      Left = 362
      Top = 362
      Width = 94
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DataField = 'EXPDEPMST'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'True'
        'False')
      ParentFont = False
      Sorted = False
      TabOrder = 13
      UnboundDataType = wwDefault
    end
    object cmbGenType: TwwDBComboBox
      Left = 132
      Top = 231
      Width = 94
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'GENTYPE'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'Random'#9'R'
        'Weekly'#9'W')
      ParentFont = False
      Sorted = False
      TabOrder = 7
      UnboundDataType = wwDefault
    end
    object edtItem: TwwDBEdit
      Left = 132
      Top = 450
      Width = 120
      Height = 31
      DataField = 'ITEM'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtRate: TwwDBEdit
      Left = 362
      Top = 450
      Width = 110
      Height = 31
      DataField = 'UNIT'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtHOSTIP: TwwDBEdit
      Left = 132
      Top = 12
      Width = 94
      Height = 31
      DataField = 'HOSTIP'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtPORT: TwwDBEdit
      Left = 362
      Top = 12
      Width = 94
      Height = 31
      DataField = 'PORT'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cmbPostMethod: TwwCheckBox
      Left = 25
      Top = 50
      Width = 342
      Height = 14
      DisableThemes = False
      AlwaysTransparent = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      DisplayValueChecked = 'True'
      DisplayValueUnchecked = 'False'
      NullAndBlankState = cbUnchecked
      Caption = 'Post each voucher individually'
      DataField = 'POSTTYPE'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtUnit: TwwDBEdit
      Left = 132
      Top = 494
      Width = 94
      Height = 31
      DataField = 'RATE'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cmbEXPDEPMST: TwwDBComboBox
      Left = 132
      Top = 538
      Width = 94
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DataField = 'FIXEDRATE'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'True'
        'False')
      ItemIndex = 1
      ParentFont = False
      Sorted = False
      TabOrder = 18
      UnboundDataType = wwDefault
    end
    object cmbEXPDEPMST1: TwwDBComboBox
      Left = 362
      Top = 538
      Width = 94
      Height = 31
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DataField = 'DECIMLQTY'
      DataSource = dsEVCfg
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'True'
        'False')
      ItemIndex = 1
      ParentFont = False
      Sorted = False
      TabOrder = 19
      UnboundDataType = wwDefault
    end
    object edtPERDAY1: TwwDBEdit
      Left = 362
      Top = 318
      Width = 94
      Height = 31
      DataField = 'MDAYS'
      DataSource = dsEVCfg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object HEVCfg: THalcyonDataSet
    About = 'Halcyon Version 6.98 (15 September 2009)'
    AutoFlush = False
    DatabaseName = '.\Data'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'EVCFG.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 8
    Top = 296
    object HEVCfgDATADIR: TStringField
      FieldName = 'DATADIR'
      Size = 45
    end
    object HEVCfgPRENEXT: TStringField
      FieldName = 'PRENEXT'
      Size = 1
    end
    object HEVCfgTLVERSION: TStringField
      FieldName = 'TLVERSION'
      Size = 10
    end
    object HEVCfgFIRM: TStringField
      FieldName = 'FIRM'
      Size = 50
    end
    object HEVCfgFRMDT: TDateField
      FieldName = 'FRMDT'
    end
    object HEVCfgTODT: TDateField
      FieldName = 'TODT'
    end
    object HEVCfgSTARTNO: TStringField
      FieldName = 'STARTNO'
      Size = 5
    end
    object HEVCfgGUID: TStringField
      FieldName = 'GUID'
      Size = 36
    end
    object s: TBooleanField
      FieldName = 'EXPDEPMST'
    end
    object HEVCfgINCLUDE: TStringField
      FieldName = 'INCLUDE'
      Size = 6
    end
    object HEVCfgEXCLUDE: TStringField
      FieldName = 'EXCLUDE'
      Size = 1
    end
    object HEVCfgGENTYPE: TStringField
      FieldName = 'GENTYPE'
      Size = 1
    end
    object HEVCfgPERDAY: TStringField
      FieldName = 'PERDAY'
      Size = 1
    end
    object HEVCfgROUNDTO: TSmallintField
      FieldName = 'ROUNDTO'
    end
    object HEVCfgITEM: TStringField
      FieldName = 'ITEM'
      Size = 30
    end
    object HEVCfgRATE: TFloatField
      FieldName = 'RATE'
    end
    object HEVCfgHOSTIP: TStringField
      FieldName = 'HOSTIP'
      Size = 10
    end
    object HEVCfgPORT: TStringField
      FieldName = 'PORT'
      Size = 5
    end
    object HEVCfgPOSTTYPE: TBooleanField
      FieldName = 'POSTTYPE'
    end
    object HEVCfgUNIT: TStringField
      FieldName = 'UNIT'
      Size = 30
    end
    object EdtHEVCfgFIXEDRATE: TBooleanField
      FieldName = 'FIXEDRATE'
    end
    object EdtHEVCfgMDAYS: TSmallintField
      FieldName = 'MDAYS'
    end
    object EdtHEVCfgDECIMLQTY: TBooleanField
      FieldName = 'DECIMLQTY'
    end
  end
  object dsEVCfg: TDataSource
    DataSet = HEVCfg
    Left = 65528
    Top = 200
  end
end
