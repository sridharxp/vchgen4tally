object frmPViewBook: TfrmPViewBook
  Left = 152
  Top = 25
  Width = 1017
  Height = 456
  Caption = 'Preview Generated'
  Color = clBtnFace
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
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 1001
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Info: TLabel
      Left = 56
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Status'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 391
    Top = 8
    Width = 220
    Height = 35
    DataSource = dsExpBook
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 37
    Width = 1001
    Height = 292
    Caption = 'Panel1'
    TabOrder = 2
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 8
      Width = 999
      Height = 283
      ControlType.Strings = (
        'GENTYPE;CustomEdit;cmbGenType;F'
        'VOU_TYPE;CustomEdit;cmbVchType;F'
        'DRCR;CustomEdit;cmbDrCr;F'
        'EXCLUDE;CustomEdit;cmbWeekDays;F'
        'CONTRA;CustomEdit;cmbTalywMst;F'
        'ROUNDTO;CustomEdit;cmbRound;F')
      PictureMasks.Strings = (
        'NAME'#9'{R,W}'#9'T'#9'T')
      Selected.Strings = (
        'ID'#9'10'#9'ID'#9#9
        'DATE'#9'10'#9'DATE'#9#9
        'VOU_TYPE'#9'4'#9'VOU_TYPE'#9#9
        'LED_NAME'#9'50'#9'LED_NAME'#9#9
        'LED_AMT'#9'10'#9'LED_AMT'#9#9
        'NARRATION'#9'150'#9'NARRATION'#9#9
        'ITEM'#9'30'#9'ITEM'#9#9
        'QTY'#9'10'#9'QTY'#9#9
        'UNIT'#9'30'#9'UNIT'#9#9
        'RATE'#9'10'#9'RATE'#9'F'#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsExpBook
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object btnUpload: TButton
    Left = 288
    Top = 389
    Width = 120
    Height = 20
    Caption = 'Post List'
    TabOrder = 3
    OnClick = btnUploadClick
  end
  object btnUnLoad: TButton
    Left = 592
    Top = 389
    Width = 120
    Height = 20
    Caption = 'Cancel Post'
    TabOrder = 4
    OnClick = btnUnLoadClick
  end
  object hExpBook: THalcyonDataSet
    About = 'Halcyon Version 6.98 (15 September 2009)'
    AutoFlush = False
    DatabaseName = '\TL\EV\DATA'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'EXPBOOK.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 8
    Top = 280
    object hExpBookID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object hExpBookDATE: TDateField
      DisplayWidth = 10
      FieldName = 'DATE'
    end
    object hExpBookVOU_TYPE: TStringField
      DisplayWidth = 4
      FieldName = 'VOU_TYPE'
      Size = 4
    end
    object hExpBookLED_NAME: TStringField
      DisplayWidth = 50
      FieldName = 'LED_NAME'
      Size = 50
    end
    object hExpBookLED_AMT: TFloatField
      DisplayWidth = 10
      FieldName = 'LED_AMT'
    end
    object hExpBookNARRATION: TStringField
      DisplayWidth = 150
      FieldName = 'NARRATION'
      Size = 150
    end
    object hExpBookITEM: TStringField
      DisplayWidth = 30
      FieldName = 'ITEM'
      Size = 30
    end
    object hExpBookQTY: TFloatField
      DisplayWidth = 10
      FieldName = 'QTY'
    end
    object hExpBookRATE: TFloatField
      DisplayWidth = 10
      FieldName = 'RATE'
    end
    object strngfldExpBookUNIT: TStringField
      DisplayWidth = 30
      FieldName = 'UNIT'
      Size = 30
    end
  end
  object dsExpBook: TDataSource
    DataSet = hExpBook
    Left = 8
    Top = 120
  end
end
