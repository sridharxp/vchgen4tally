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
unit Exp2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  Client,
  PClientFns,
  gs6_shel,
  ShellApi,
  en;

type
  TfrmExp2 = class(TForm)
    MainMenu1: TMainMenu;
    ExportVoucher1: TMenuItem;
    H1: TMenuItem;
    Contact1: TMenuItem;
    Preview2: TMenuItem;
    Configure2: TMenuItem;
    Generate1: TMenuItem;
    mniCleanup1: TMenuItem;
    procedure Preview1Click(Sender: TObject);
    procedure Contact1Click(Sender: TObject);
    procedure Preview2Click(Sender: TObject);
  procedure Configure2Click(Sender: TObject);
    procedure Generate1Click(Sender: TObject);
    procedure ReportOptions1Click(Sender: TObject);
    procedure mniFindUpdate1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniCleanup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExp2: TfrmExp2;

implementation

{$R *.dfm}

uses
  ExpBook, PViewBook, evCfg, USBPurch, Datamodule, Cfg;

procedure TfrmExp2.Preview1Click(Sender: TObject);
begin
  frmExpbook.Close;
  frmPViewBook.Show;
end;

procedure TfrmExp2.Contact1Click(Sender: TObject);
begin
MessageDlg('Sridharan S' + #10 + '+91 98656 82910' + #10 +'excel2tallyerp@gmail.com',
  mtInformation, [mbOK], 0);
end;

procedure TfrmExp2.Preview2Click(Sender: TObject);
begin
  frmExpbook.Close;
  frmPViewBook.Show;
end;

procedure TfrmExp2.Configure2Click(Sender: TObject);
begin
  frmEvcfg.Show;
end;
procedure TfrmExp2.Generate1Click(Sender: TObject);
begin
  frmExpbook.Show;
end;

procedure TfrmExp2.ReportOptions1Click(Sender: TObject);
begin
  frmCfg.Show;
end;

procedure TfrmExp2.mniFindUpdate1Click(Sender: TObject);
begin
end;

procedure TfrmExp2.FormShow(Sender: TObject);
begin
//  If (not frmRegister.IsUSBID(ValidUSBID)) then
  if frmRegister.IsUSBID(DM.USBList) then
    frmRegister.PgmStatus := True;
  if not frmRegister.pgmstatus then
  begin
    frmRegister.SetKeySerial('2043933A3A8F4EB646704214A7486FCF', 1963483590);
    frmReGister.CalcModifiers;
    frmReGister.UpdateUI;
  end;
end;

procedure TfrmExp2.mniCleanup1Click(Sender: TObject);
begin
  if MessageDlg('Cleanup data files?', mtConfirmation, mbOKCancel, 0) = mrCancel then
    Exit;
  DeleteFile('.\Data\LLIST.DBF');
  DeleteFile('.\Data\EVCFG.DBF');
  DeleteFile('.\Data\ETEMP.DBF');
  DeleteFile('.\Data\EXPBOOK.DBF');
  DeleteFile('.\Data\TALYWMST.DBF');

  MessageDlg('Close', mtInformation, [mbOK], 0);
  Application.Terminate;
end;

end.
