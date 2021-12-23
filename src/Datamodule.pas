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
unit Datamodule;

interface

uses
  SysUtils, Classes, Halcn6db, DB,
  Dialogs, DateUtils,
  MsgQue3;

type
  TDM = class(TDataModule)
    hCreateTable: TCreateHalcyonDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure CreateTables;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
//   hTemp: TgsDBFTable;
  public
    { Public declarations }
    USBList: TStringList;
    LicList: TStringList;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin

  ShortDateFormat := 'DD-MM-YYYY';
  DateSeparator := '-';

if not DirectoryExists('Data') then
  if not CreateDir('Data') then
    raise Exception.Create('Cannot create folder Data');
  CreateTables;
  USBList := TStringlist.Create;
  LicList := TStringlist.Create;
end;

procedure TDM.CreateTables;
var
Scratch:THalcyonDataSet;
begin

Scratch := THalcyonDataset.Create(self);

{ LLIST.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
//  CreateFields.Add('ID;C;1;0');
  CreateFields.Add('NAME;C;50;0');
  CreateFields.Add('PARENT;C;30;0');
  CreateFields.Add('AMOUNT;N;8;0');
  CreateFields.Add('LOW;N;6;0');
  CreateFields.Add('HIGH;N;6;0');
  CreateFields.Add('ENTRIES;N;4;0');
  CreateFields.Add('ROUNDTO;N;1;0');
  CreateFields.Add('INCLUDE;C;6;0');
  CreateFields.Add('EXCLUDE;C;1;0');
  CreateFields.Add('FRMDT;D;8;0');
  CreateFields.Add('TODT;D;8;0');
  CreateFields.Add('MDAYS;N;2;0');
  CreateFields.Add('CONTRA;C;50;0');
  CreateFields.Add('NARRATION;C;60;0');
  CreateFields.Add('COUNTER;N;4;0');
  CreateFields.Add('DRCR;C;1;0');
  CreateFields.Add('VOU_TYPE;C;4;0');
  CreateFields.Add('GENERATED;L;1;0');
  CreateFields.Add('GENTYPE;C;1;0');
  CreateFields.Add('PERDAY;N;2;0');
  CreateFields.Add('CONTRA2;C;50;0');
  CreateFields.Add('ITEM;C;30;0');
  CreateFields.Add('QTY;N;9;3');
  CreateFields.Add('UNIT;C;30;0');
  CreateFields.Add('RATE;N;8;2');
  CreateFields.Add('FIXEDRATE;L;1;0');
  CreateFields.Add('CONTRA3;C;50;0');
  CreateFields.Add('VCHTYPE2;C;4;0');
  CreateFields.Add('DRCR2;C;1;0');
  CreateFields.Add('PERCENTAGE;N;5;2');
  CreateFields.Add('INVVCH;L;1;0');
  CreateFields.Add('INVLED;N;1;0');
  DBFType := Clipper;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'LLIST.DBF';
end;
if not FileExists('Data\LLIST.DBF') then
  hCreateTable.execute;
{ Size 574}
(*
//hLLIST.Open;
Scratch.Open;
if not FileExists('Data\LLIST.CDX') then
Begin
  { Primary Key }
//  hLLIST.IndexOn('LLIST.CDX','ID','Name','',Duplicates,Ascending);
  Scratch.IndexOn('LLIST.CDX','ID','Name','',Duplicates,Ascending);
end;
//hLLIST.Close;
*)

Scratch.Close;
{ EXPBOOK.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
  CreateFields.Add('ID;N;10;0');
  CreateFields.Add('DATE;D;8;0');
  CreateFields.Add('VOU_TYPE;C;4;0');
  CreateFields.Add('VOU_NO;C;20;0');
  CreateFields.Add('VOU_REF;C;20;0');
  CreateFields.Add('LED_NAME;C;50;0');
  CreateFields.Add('LED_AMT;N;15;2');
  CreateFields.Add('BILL_ADJ;C;10;0');
  CreateFields.Add('BILL_NAME;C;20;0');
  CreateFields.Add('BILL_AMT;N;15;2');
  CreateFields.Add('ITEM;C;30;0');
  CreateFields.Add('UNIT;C;30;0');
  CreateFields.Add('QTY;N;9;3');
  CreateFields.Add('RATE;N;8;2');
  CreateFields.Add('REMOTEID;C;8;0');
  CreateFields.Add('NARRATION;C;150;0');
  CreateFields.Add('STATUS;C;1;0');
  DBFType := Clipper;
// DBFTable := hEXPBOOK;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'EXPBOOK.DBF';
end;
if not FileExists('Data\EXPBOOK.DBF') then
  hCreateTable.execute;
{ Size 371}
(*
//hEXPBOOK.Open;
Scratch.Open;
if not FileExists('Data\EXPBOOK.CDX') then
Begin
//  hEXPBOOK.IndexOn('EXPBOOK.CDX','ID','ID','',Duplicates,Ascending);
  Scratch.IndexOn('EXPBOOK.CDX','ID','ID','',Duplicates,Ascending);
end;
//hEXPBOOK.Close;
*)
Scratch.Close;

{ ETEMP.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
  CreateFields.Add('ID;N;8;0');
  CreateFields.Add('DATE;D;8;0');
  CreateFields.Add('VOU_TYPE;C;4;0');
  CreateFields.Add('VOU_NO;C;20;0');
  CreateFields.Add('VOU_REF;C;20;0');
  CreateFields.Add('LED_NAME;C;50;0');
  CreateFields.Add('LED_AMT;N;15;2');
  CreateFields.Add('COST_CEN;C;30;0');
  CreateFields.Add('COST_AMT;N;15;2');
  CreateFields.Add('BILL_ADJ;C;10;0');
  CreateFields.Add('BILL_NAME;C;20;0');
  CreateFields.Add('CR_PERIOD;N;4;0');
  CreateFields.Add('BILL_AMT;N;15;2');
  CreateFields.Add('NARRATION;C;150;0');
  CreateFields.Add('STATUS;C;1;0');
  DBFType := Clipper;
// DBFTable := hETEMP;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'ETEMP.DBF';
end;
if not FileExists('Data\ETEMP.DBF') then
  hCreateTable.execute;
{ Size 405}

Scratch.Close;

{ EVCFG.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
  CreateFields.Add('DATADIR;C;45;0');
  CreateFields.Add('PRENEXT;C;1;0');
  CreateFields.Add('TLVERSION;C;10;0');
  CreateFields.Add('FIRM;C;50;0');
  CreateFields.Add('FRMDT;D;8;0');
  CreateFields.Add('TODT;D;8;0');
  CreateFields.Add('STARTNO;C;8;0');
  CreateFields.Add('GUID;C;36;0');
  CreateFields.Add('EXPDEPMST;L;1;0');
  CreateFields.Add('INCLUDE;C;6;0');
  CreateFields.Add('EXCLUDE;C;1;0');
  CreateFields.Add('GENTYPE;C;1;0');
  CreateFields.Add('PERDAY;C;1;0');
  CreateFields.Add('ROUNDTO;N;1;0');
  CreateFields.Add('ITEM;C;30;0');
  CreateFields.Add('UNIT;C;30;0');
  CreateFields.Add('RATE;N;8;2');
  CreateFields.Add('HOSTIP;C;20;0');
  CreateFields.Add('PORT;C;5;0');
  CreateFields.Add('POSTTYPE;L;1;0');
  CreateFields.Add('FIXEDRATE;L;1;0');
  CreateFields.Add('DECIMLQTY;L;1;0');
//  CreateFields.Add('RATERANGE;N;2;0');
  CreateFields.Add('MDAYS;N;2;0');
  DBFType := Clipper;
// DBFTable := hEVCFG;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'EVCFG.DBF';
end;
if not FileExists('.\Data\EVCFG.DBF') then
begin
  hCreateTable.execute;
end;

Scratch.Open;
if Scratch.Eof and Scratch.Bof then
begin
  Scratch.Append;
    if Monthof(Now) < 4 then
    begin
      Scratch.StringPut('FRMDT', InttoStr(Yearof(Now)-1)+'0401');
      Scratch.StringPut('TODT', InttoStr(Yearof(Now))+'0331');
    end
    else
    begin
      Scratch.StringPut('FRMDT', InttoStr(Yearof(Now))+'0401');
      Scratch.StringPut('TODT', InttoStr(Yearof(Now)+1)+'0331');
    end;

    Scratch.StringPut('INCLUDE', '7');
    Scratch.StringPut('EXCLUDE', '1');
    Scratch.StringPut('GENTYPE', 'R');
    Scratch.StringPut('PERDAY', '1');
    Scratch.StringPut('MDAYS', '1');
//    Scratch.StringPut('RATERANGE', '8');
    Scratch.IntegerPut('ROUNDTO', 0);
    Scratch.StringPut('EXPDEPMST', 'T');
    Scratch.StringPut('PRENEXT', 'N');
    Scratch.StringPut('STARTNO', '10000');
    Scratch.StringPut('HOSTIP', '127.0.0.1');
    Scratch.StringPut('PORT', '9000');
    Scratch.LogicPut('FIXEDRATE', True);

    Scratch.Post;
end;
{ Size 165}

Scratch.Close;

{ TALYWMST.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
  CreateFields.Add('ID;C;1;0');
  CreateFields.Add('NAME;C;50;0');
  CreateFields.Add('PARENT;C;50;0');
  DBFType := Clipper;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'TALYWMST.DBF';
end;
if not FileExists('Data\TALYWMST.DBF') then
  hCreateTable.execute;
Scratch.Close;

{ TALYWCMP.DBF }
with hCreateTable do
begin
  CreateFields.Clear;
  CreateFields.Add('CMPNAME;C;40;0');
  CreateFields.Add('GUID;C;36;0');
  DBFType := Clipper;
  DBFTable := Scratch;
  DBFTable.DatabaseName := 'DATA';
  DBFTable.TableName := 'TALYWCMP.DBF';
end;
if not FileExists('Data\TALYWCMP.DBF') then
  hCreateTable.execute;
{ Size 77}

Scratch.Close;

Scratch.Free;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  USBList.Clear;
  LicList.Clear;
  USBList.Free;
  LicList.Free;
end;

end.
