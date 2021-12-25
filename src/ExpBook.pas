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
unit ExpBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls,  gs6_shel, vgen3, xmldb2id, DB, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, Halcn6db, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, DBCtrls, wwdblook, ComCtrls, Wwkeycb, wwdbdatetimepicker,
  Client,
  MstListImp,
  pClientFns, wwcheckbox,
  bjxml3_1;


type
  TfrmExpbook = class(TForm)
    hLlist: THalcyonDataSet;
    hTalywMst: THalcyonDataSet;
    hExpBook: THalcyonDataSet;
    dsLList: TDataSource;
    Panel2: TPanel;
    Info: TLabel;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    cmbGenType: TwwDBComboBox;
    cmbVchType: TwwDBComboBox;
    cmbDrCr: TwwDBComboBox;
    cmbWeekDays: TwwDBComboBox;
    cmbTalywMst: TwwDBLookupCombo;
    cmbRound: TwwDBComboBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBView: TPageControl;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edtNAME: TwwDBEdit;
    wwDBComboBox2: TwwDBComboBox;
    edtAMOUNT: TwwDBEdit;
    cmbGENTYPE1: TwwDBComboBox;
    edtENTRIES1: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    edtRATE: TwwDBEdit;
    Label12: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    TabSheet3: TTabSheet;
    btnDownload: TButton;
    btnGenerate: TButton;
    Panel4: TPanel;
    wwIncrementalSearch1: TwwIncrementalSearch;
    DBNavigator1: TDBNavigator;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label8: TLabel;
    cmbVCHTYPE2: TwwDBComboBox;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBComboBox12: TwwDBComboBox;
    wwDBComboBox1: TwwDBComboBox;
    Label24: TLabel;
    wwDBEdit8: TwwDBEdit;
    wwDBLookupCombo4: TwwDBLookupCombo;
    wwDBComboBox9: TwwDBComboBox;
    Label27: TLabel;
    Label28: TLabel;
    wwDBEdit12: TwwDBEdit;
    Label29: TLabel;
    wwDBEdit13: TwwDBEdit;
    Label30: TLabel;
    Label32: TLabel;
    Label23: TLabel;
    Panel6: TPanel;
    wwDBEdit11: TwwDBEdit;
    Label13: TLabel;
    wwDBEdit10: TwwDBEdit;
    Label11: TLabel;
    wwDBEdit9: TwwDBEdit;
    Label10: TLabel;
    Label20: TLabel;
    wwDBComboBox8: TwwDBComboBox;
    wwDBComboBox7: TwwDBComboBox;
    wwDBComboBox6: TwwDBComboBox;
    wwDBEdit7: TwwDBEdit;
    wwDBComboBox5: TwwDBComboBox;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBEdit2: TwwDBEdit;
    Label21: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    wwDBComboBox11: TwwDBComboBox;
    Label31: TLabel;
    Label33: TLabel;
    wwDBComboBox13: TwwDBComboBox;
    wwDBComboBox15: TwwDBComboBox;
    Label34: TLabel;
    strngfldLlistINCLUDE: TStringField;
    strngfldLlistNAME: TStringField;
    strngfldLlistPARENT: TStringField;
    intgrfldLlistAMOUNT: TIntegerField;
    intgrfldLlistLOW: TIntegerField;
    intgrfldLlistHIGH: TIntegerField;
    EdtLlistENTRIES: TSmallintField;
    EdtLlistROUNDTO: TSmallintField;
    strngfldLlistEXCLUDE: TStringField;
    dtfldLlistFRMDT: TDateField;
    dtfldLlistTODT: TDateField;
    strngfldLlistCONTRA: TStringField;
    strngfldLlistNARRATION: TStringField;
    strngfldLlistDRCR: TStringField;
    strngfldLlistVOU_TYPE: TStringField;
    strngfldLlistGENTYPE: TStringField;
    EdtLlistPERDAY: TSmallintField;
    strngfldLlistCONTRA2: TStringField;
    strngfldLlistCONTRA3: TStringField;
    EdtLlistPERCENTAGE: TFloatField;
    strngfldLlistDRCR2: TStringField;
    strngfldLlistVCHTYPE2: TStringField;
    strngfldLlistITEM: TStringField;
    EdtLlistQTY: TFloatField;
    strngfldLlistUNIT: TStringField;
    EdtLlistINVVCH: TBooleanField;
    EdtLlistINVLED: TSmallintField;
    EdtLlistGENERATED: TBooleanField;
    EdtLlistCOUNTER: TSmallintField;
    edtHIGH: TwwDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    edtHIGH1: TwwDBEdit;
    lbl4: TLabel;
    cmbITEM: TwwDBLookupCombo;
    cmbCONTRA: TwwDBLookupCombo;
    cmbINVLED1: TwwDBComboBox;
    cmbGENERATED1: TwwDBComboBox;
    cmbGENERATED: TwwDBComboBox;
    EdtLlistRATE: TFloatField;
    lbl5: TLabel;
    edtNARRATION: TwwDBEdit;
    EdtLlistMDAYS: TSmallintField;
    lbl7: TLabel;
    edtENTRIES: TwwDBEdit;
    lbl6: TLabel;
    cmbEXPDEPMST: TwwDBComboBox;
    EdtLlistFIXEDRATE: TBooleanField;
    cnbDATE: TwwDBDateTimePicker;
    cnbDATE1: TwwDBDateTimePicker;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl12: TLabel;
    edtCounter: TwwDBEdit;
    lbl10: TLabel;
    edtInclude: TwwDBEdit;
    cmbROUNDTO: TwwDBComboBox;
    lbl11: TLabel;
    ckbMon: TwwCheckBox;
    ckbTue: TwwCheckBox;
    ckbWed: TwwCheckBox;
    ckbThu: TwwCheckBox;
    ckbFri: TwwCheckBox;
    ckbSat: TwwCheckBox;
    procedure btnDownloadClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure DisableBtns;
    procedure EnableBtns;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmbGENTYPE1Change(Sender: TObject);
    procedure edtIncludeChange(Sender: TObject);
  private
    { Private declarations }
    FHost: string;
  protected
    procedure Download;
    procedure LoadList;
    function Generate: integer;
  public
    { Public declarations }
  property Host: string read FHost write FHost;
  end;

procedure updateMsg(msg: string);

var
  frmExpbook: TfrmExpbook;

implementation

{$R *.dfm}
{
Name
Contra
Vou_type
Amount
Low
Enttries
Gentype
FrmDt
ToDt
perday
Roundto
include
exclude
Narration
}
uses
  Datamodule, dGen, PViewBook;


procedure TfrmExpbook.btnDownloadClick(Sender: TObject);
var
  hEVcfg: TgsDBFTable;
  aName: string;
begin
  DisableBtns;
  hevcfg := TgsDBFTable.Create('Data\EVcfg.dbf','', True, False);
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
    EnableBtns;
    Exit;
  end;
//  if not Assigned(ClientFns) then
//    ClientFns := TbjGSTClientFns.Create;
  aName := CurrentCompany;
  if Length(aName) = 0 then
  begin
    MessageDlg('No Tally company is Open', mtError, [mbOK], 0);
    EnableBtns;
    Exit;
  end;

  hLlist.Close;
  hTalywMst.Close;

  Download;

  hTalywMst.Open;
  hTalywMst.MemoryIndexAdd('Name', 'Name','',Duplicates, Ascending);
  hLlist.Open;
  EnableBtns;
  Self.BringToFront;
  MessageDlg('Done', mtInformation, [mbOK], 0);
end;

procedure TfrmExpbook.Download;
var
  lgen: TLGen;
begin
    LoadList;

  lgen := TLGen.Create;
  lgen.FUpdate := updateMsg;;
  try
    lgen.Execute;
  finally
    lgen.Free;
  end;

end;

procedure TfrmExpbook.LoadList;
var
  hList: TgsDBFTable;
  xStr, xMethod: IbjXml;
  strs: string;
  OResult: IbjXml;
  CollName: string;
  parentName: string;
  DNode, RecNode, LedNode, ParentNode: IbjXml;
  LStr: string;
begin
  hList := TgsDBFTable.Create('Data\TALYWMST.dbf','', True, False);
  hList.Zap;

  xStr := CreatebjXmlDocument;
  xMethod := CreatebjXmlDocument;
  strs := strs + '<FETCH>Parent</FETCH>';
  xStr.LoadXml(strs);
  CollName := 'Ledger';
  OResult := CreatebjXmlDocument;
  OResult.LoadXml(ColExEval(CollName, 'Ledger', xStr, xMethod));
  LedNode := OResult.SearchforTag(nil, 'LEDGER');
  while Assigned(LedNode) do
  begin
    lStr := LedNode.GetAttrValue('NAME');
    if Length(lStr) > 0 then
    begin
      ParentNode := OResult.SearchforTag(LedNode, 'PARENT');
      if Assigned(ParentNode) then
      begin
        ParentName := ParentNode.GetContent;
        hList.Append;
        hList.StringPut('NAME', lstr);
        hList.StringPut('PARENT', ParentName);
        hList.Post;
      end;
    end;
    LedNode := OResult.SearchforTag(LedNode, 'LEDGER');
    UpdateMsg(lstr);
    Application.ProcessMessages;
  end;
  hList.Free;
end;

procedure UpdateMsg;
begin
  if length(msg) > 0 then
    frmExpbook.Info.Caption := Msg
  else
    frmExpbook.Info.Caption := 'Done';
end;

procedure TfrmExpbook.btnGenerateClick(Sender: TObject);
var
  GCount: integer;
  IsUploaded: boolean;
  hEVcfg: TgsDBFTable;
  aName: string;
  uploadmsg: string;
begin
  UploadMsg := 'Upload ?';
  DisableBtns;

  IsUploaded := False;
  if (hLlist.State in [dsEdit, dsInsert]) then
    hLlist.Post;

  hevcfg := TgsDBFTable.Create('Data\EVcfg.dbf','', True, False);
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
    EnableBtns;
    Exit;
  end;
//  if not Assigned(ClientFns) then
//    ClientFns := TbjGSTClientFns.Create;
  aName := CurrentCompany;
  if Length(aName) = 0 then
  begin
    MessageDlg('No Tally company is Open', mtError, [mbOK], 0);
    EnableBtns;
    Exit;
  end;
  if Length(aName) > 0 then
  UploadMsg := 'Upload to ' + aName + ' ?';

  GCount := Generate;
  try
  if (GCount > 0) then
  begin
    if MessageDlg(UploadMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      pvIEWbOOK.Upload(Host, 'Create');
      IsUploaded := true;
    end;
    hLlist.Refresh;
  end;
  if not IsUploaded then
  if (GCount > 0) then
    MessageDlg(InttoStr(GCount) + ' Generated', mtInformation, [mbOK], 0)
  else
    MessageDlg('No Settings or all Generated already', mtError, [mbOK], 0)
  finally
  EnableBtns;
  end;
//  hLlist.Refresh;
end;

function TfrmExpbook.Generate: integer;
var
  xdb: Tdbgen;
begin
  xdb := Tdbgen.Create;
  xdb.FUpdate := Updatemsg;

  try
    xdb.Execute;
    Result := xdb.GenRec;
  finally
    xdb.Free;
  end;
end;

procedure TfrmExpbook.DisableBtns;
begin
  btnDownload.Enabled := False;
  btnGenerate.Enabled := False;
end;

procedure TfrmExpbook.EnableBtns;
begin
  btnDownload.Enabled := True;
  btnGenerate.Enabled := True;
  Self.Refresh;
end;

procedure TfrmExpbook.FormCreate(Sender: TObject);
begin
  hLlist.DatabaseName := '.\Data\';
  wwDBGrid1.FixedCols := 1;
end;
procedure TfrmExpbook.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  hLlist.Close;
  hTalywMst.Close;
end;

procedure TfrmExpbook.FormShow(Sender: TObject);
begin
  hLlist.Open;
  hTalywMst.Open;
  hTalywMst.MemoryIndexAdd('Name', 'Name','',Duplicates, Ascending);
//  hllIST.IndexOn('hLList.cdx', 'Name', 'Name', '', Duplicates, Ascending);
  UpdateMsg('Status');
  DBView.ActivePage := TabSheet2;
  wwIncrementalSearch1.Text := '';
end;

procedure TfrmExpbook.cmbGENTYPE1Change(Sender: TObject);
begin
  if cmbGENTYPE1.Text = 'Random' then
  begin
    edtENTRIES1.Enabled := True;
    edtInclude.Enabled := False;
  end;
  if cmbGENTYPE1.Text = 'Weekly' then
  begin
    edtInclude.Enabled := True;
    edtENTRIES1.Enabled := False;
  end;
end;

procedure TfrmExpbook.edtIncludeChange(Sender: TObject);
begin
  ckbMon.Checked := False;
  ckbTue.Checked := False;
  ckbFri.Checked := False;
  ckbWed.Checked := False;
  ckbSat.Checked := False;
  ckbThu.Checked := False;

  if Pos('2', edtInclude.Text) > 0 then
    ckbMon.Checked := True;
  if Pos('3', edtInclude.Text) > 0 then
    ckbTue.Checked := True;
  if Pos('4', edtInclude.Text) > 0 then
    ckbWed.Checked := True;
  if Pos('5', edtInclude.Text) > 0 then
    ckbThu.Checked := True;
  if Pos('6', edtInclude.Text) > 0 then
    ckbFri.Checked := True;
  if Pos('7', edtInclude.Text) > 0 then
    ckbSat.Checked := True;
end;

end.








