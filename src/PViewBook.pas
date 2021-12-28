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
unit PViewBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls,  gs6_shel,
  vgen3, xmldb2id,
  DB, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, Halcn6db, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, DBCtrls, wwdblook, ComCtrls,
  Client,
  PClientFns;

type
  TfrmPViewBook = class(TForm)
    hExpBook: THalcyonDataSet;
//    dsExpBook: TDataSource;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Info: TLabel;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    hExpBookID: TIntegerField;
    hExpBookDATE: TDateField;
    hExpBookVOU_TYPE: TStringField;
    hExpBookLED_NAME: TStringField;
    hExpBookLED_AMT: TFloatField;
    hExpBookNARRATION: TStringField;
    hExpBookITEM: TStringField;
    hExpBookQTY: TFloatField;
    hExpBookRATE: TFloatField;
    btnUpload: TButton;
    dsExpBook: TDataSource;
    strngfldExpBookUNIT: TStringField;
    btnUnLoad: TButton;
    procedure btnUploadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnUnLoadClick(Sender: TObject);
  private
    { Private declarations }
    FHost: string;
  protected
//    procedure upload;
  public
    { Public declarations }
  property Host: string read FHost write FHost;
  end;

procedure upload(const aHost: string; const aAction: string);

var
  frmPViewBook: TfrmPViewBook;

implementation

{$R *.dfm}

uses
  Datamodule;

procedure TfrmPViewBook.btnUploadClick(Sender: TObject);
var
  hEVcfg: TgsDBFTable;
//  Host: string;
  aName: string;
begin
  hevcfg := TgsDBFTable.Create('Data\EVcfg.dbf','', True, False);
  btnUpLoad.Enabled := False;
  try
  Host := 'http://' + hEvcfg.StringGet('HOSTIP') + ':' + hEvcfg.StringGet('PORT');
  finally
    hevcfg.Free;
  end;
  if not Assigned(ClientFns) then
     ClientFns := TbjGSTClientFns.Create;
  ClientFns.Host := Host;
  if not TestConnection(Host, 'Tally', 'Error connecting to Tally') then
  begin
    btnUpLoad.Enabled := True;
    Exit;
  end;
//  if not Assigned(ClientFns) then
//    ClientFns := TbjGSTClientFns.Create;
//{$IFDEF ERP}
  if TestConnection(Host, 'Tally.ERP', 'Error connecting to Tally') then
  begin
  aName := CurrentCompany;
  if Length(aName) = 0 then
//    lActive.Caption := 'Company: ' + aName
//  else
  begin
    MessageDlg('No Tally company is Open', mtError, [mbOK], 0);
    btnUpLoad.Enabled := True;
    Exit;
  end;
  if MessageDlg('Post to '+ aName+'?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    btnUpLoad.Enabled := True;
    Exit;
  end;
//{$ENDIF}
  end;
  upload(Host, 'Create');

  btnUpLoad.Enabled := True;
end;

procedure upload(const aHost: string; const aAction: string);
var
  vgen: Tbjvgen;
  hEVcfg: TgsDBFTable;
begin
  vgen := Tbjvgen.Create;
//  vgen.FUpdate := updateMsg;;
  hevcfg := TgsDBFTable.Create('Data\EVcfg.dbf','', True, True);
  Try
  if not Length(hevcfg.StringGet('FIRM')) = 0 then
    vgen.Firm := hevcfg.StringGet('FIRM');
  if not Length(hevcfg.StringGet('FrmDt')) = 0 then
    vgen.FrmDt := hevcfg.StringGet('FrmDt');
  if not Length(hevcfg.StringGet('ToDt')) = 0 then
    vgen.ToDt := hevcfg.StringGet('FToDt');
  if length(hEvcfg.StringGet('GUID')) > 0 then
    vgen.GUID := hEvcfg.StringGet('GUID');
  if hEvcfg.LogicGet('ExpDepMst')= True  then
    vgen.ExportDependentMasters := True
  else
    vgen.ExportDependentMasters := False;

  if length(hEvcfg.StringGet('HOSTIP')) > 0 then
    vgen.domain := hEvcfg.StringGet('HOSTIP');
  if length(hEvcfg.StringGet('PORT')) > 0 then
    vgen.Port := hEvcfg.StringGet('PORT');
    vGen.Host := aHost;
  VGen.Action := aAction;
  vgen.Export;
  finally
    hevcfg.Free;
    vgen.Free;
  end;
end;

procedure TfrmPViewBook.FormShow(Sender: TObject);
begin
  hExpBook.Open;
end;

procedure TfrmPViewBook.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    hExpbook.Close;
end;

procedure TfrmPViewBook.FormCreate(Sender: TObject);
begin
  hExpBook.DatabaseName := '.\Data\';
end;

procedure TfrmPViewBook.btnUnLoadClick(Sender: TObject);
var
  hEVcfg: TgsDBFTable;
  aName: string;
begin
  hevcfg := TgsDBFTable.Create('Data\EVcfg.dbf','', True, False);
  btnUnLoad.Enabled := False;
  try
  Host := 'http://' + hEvcfg.StringGet('HOSTIP') + ':' + hEvcfg.StringGet('PORT');
  finally
    hevcfg.Free;
  end;
  if not Assigned(ClientFns) then
     ClientFns := TbjGSTClientFns.Create;
  ClientFns.Host := Host;
  if not TestConnection(Host, 'Tally', 'Error connecting to Tally') then
  begin
    btnUnLoad.Enabled := True;
    Exit;
  end;
  if TestConnection(Host, 'Tally.ERP', 'Error connecting to Tally') then
  begin
  aName := CurrentCompany;
  if Length(aName) = 0 then
  begin
    MessageDlg('No Tally company is Open', mtError, [mbOK], 0);
    btnUpLoad.Enabled := True;
    Exit;
  end;
  if MessageDlg('Post to '+ aName+'?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    btnUpLoad.Enabled := True;
    Exit;
  end;
  end;
  upload(Host, 'Delete');

  btnUnLoad.Enabled := True;
end;

end.

