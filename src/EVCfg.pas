(*
Copyright (C) 2011, Sridharan S

This file is part of Voucher Generator for Tally.

Voucher Generator for Tally is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Voucher Generator for Tally is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License version 3
along with Voucher Generator for Tally. If not, see <http://www.gnu.org/licenses/>.
*)
unit EVCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Halcn6db, StdCtrls, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,
  Mask, wwdbedit, ExtCtrls, DBCtrls, wwcheckbox;

type
  TfrmEVCfg = class(TForm)
    HEVCfg: THalcyonDataSet;
    dsEVCfg: TDataSource;
    Panel1: TPanel;
    edtFirm: TwwDBEdit;
    cmbFrmDt: TwwDBDateTimePicker;
    cmbToDt: TwwDBDateTimePicker;
    cmbPriorNext: TwwDBComboBox;
    edtTallyVersion: TwwDBEdit;
    edtPerDay: TwwDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cmbRound: TwwDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtInclude: TwwDBEdit;
    edtExclude: TwwDBEdit;
    cmbDep: TwwDBComboBox;
    DBNavigator1: TDBNavigator;
    cmbGenType: TwwDBComboBox;
    Label16: TLabel;
    edtItem: TwwDBEdit;
    Label17: TLabel;
    edtRate: TwwDBEdit;
    HEVCfgDATADIR: TStringField;
    HEVCfgPRENEXT: TStringField;
    HEVCfgTLVERSION: TStringField;
    HEVCfgFIRM: TStringField;
    HEVCfgFRMDT: TDateField;
    HEVCfgTODT: TDateField;
    HEVCfgSTARTNO: TStringField;
    HEVCfgGUID: TStringField;
    s: TBooleanField;
    HEVCfgINCLUDE: TStringField;
    HEVCfgEXCLUDE: TStringField;
    HEVCfgGENTYPE: TStringField;
    HEVCfgPERDAY: TStringField;
    HEVCfgROUNDTO: TSmallintField;
    HEVCfgITEM: TStringField;
    HEVCfgRATE: TFloatField;
    edtHOSTIP: TwwDBEdit;
    edtPORT: TwwDBEdit;
    cmbPostMethod: TwwCheckBox;
    Label2: TLabel;
    Label11: TLabel;
    HEVCfgHOSTIP: TStringField;
    HEVCfgPORT: TStringField;
    HEVCfgPOSTTYPE: TBooleanField;
    edtUnit: TwwDBEdit;
    Label12: TLabel;
    HEVCfgUNIT: TStringField;
    cmbEXPDEPMST: TwwDBComboBox;
    cmbEXPDEPMST1: TwwDBComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    EdtHEVCfgFIXEDRATE: TBooleanField;
//    EdtHEVCfgRATERANGE: TSmallintField;
    edtPERDAY1: TwwDBEdit;
    lbl4: TLabel;
    EdtHEVCfgMDAYS: TSmallintField;
    EdtHEVCfgDECIMLQTY: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEVCfg: TfrmEVCfg;

implementation

{$R *.dfm}
procedure TfrmEVCfg.FormCreate(Sender: TObject);
begin
  hEVCfg.DatabaseName := '.\Data\';
end;

procedure TfrmEVCfg.FormShow(Sender: TObject);
begin
  hEVCfg.Open;
  hEVCfg.First;
end;

procedure TfrmEVCfg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  hEVCfg.Close;
end;

end.
