object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 132
  Height = 174
  Width = 340
  object hCreateTable: TCreateHalcyonDataSet
    AutoOverwrite = False
    DBFType = Clipper
    Left = 88
    Top = 40
  end
end
