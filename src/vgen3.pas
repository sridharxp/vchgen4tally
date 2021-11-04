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
unit vgen3;

interface

uses SysUtils, Classes,
  Windows, Dialogs,
  Strutils,
  gs6_shel, gs6_date,
  Client,
  bjxml3_1,
  PClientFns;

type
  TbjVGen = class
  private
    { Private declarations }
    Fdomain: String;
    Fport: string;
    FHost: string;
    FFirm: String;
    FFrmDt: string;
    FToDT: string;
    Fguid: string;
    FExportDependentMasters: boolean;
    vid: string;
  protected
    Client: TbjClient;
    xvch: IbjXml;
    xvou: IbjXml;
    hllist: TgsDBFTable;
    hEvcfg: TgsDBFTable;
    hTalywmst: TgsDBFTable;
    hTalywvou: TgsDBFTable;
    procedure SetFilter;
    function ConvertVT(vt: string): string;
    procedure BrowMasters;
    procedure ExpMasters;
    Procedure ExpItem;
    Procedure ExpUnit;
    procedure ErrorCheck;
    procedure XmlHeader;
    procedure XmlFooter;
    procedure FirstRow;
    procedure AnotherRow;
    procedure InvRow;
    procedure post;
    procedure SetHost(const aHost: string);
  public
    { Public declarations }
    vfile: string;
    vchtype: string;
    ToSaveXMLFile: boolean;
    TallyVersion: string;
    Action: string;
    constructor Create;
    destructor Destroy; override;
    procedure Export;
  published
    property Domain: String read Fdomain write Fdomain;
    property Port: String read FPort write FPort;
    property Host: string read FHost write SetHost;
    property Firm: String read FFirm write FFirm;
    property FrmDt: string Read FFrmDt write FFrmDt;
    property ToDt: string Read FToDt write FToDt;
    property GUID: String read FGUID write FGUID;
    property ExportDependentMasters: boolean read FExportDependentMasters
      write FExportDependentMasters;
  end;

implementation

uses
  Datamodule;

Constructor Tbjvgen.Create;
begin

  Client := TbjClient.Create;


  domain := '127.0.0.1';
  port := '9000';
  FHost := 'http://' + domain +':' + port;
//  xVch :=  TbjXml.Create;
  xVch :=  CreatebjXmlDocument;

  vfile := 'EXPBOOK.DBF';
  hllist := TgsDBFTable.Create('Data\LLIST.DBF','', True, True);
  hTalywmst := TgsDBFTable.Create('Data\Talywmst.dbf','', True, True);
  hTalywVou := TgsDBFTable.Create('Data\'+Vfile,'', True, True);
  vid := '99999999';
  ToSaveXMLFile := False;

  hEVCfg := TgsDBFTable.Create('Data\EVCFG.DBF','', False, True);
  Action := 'Create';
end;

destructor Tbjvgen.Destroy;
begin
  Client.Free;
  hTalywmst.Free;
  hTalywvou.Free;
  hllist.Free;
  hEVCfg.Free;
  inherited;
end;

procedure Tbjvgen.SetHost(const aHost: string);
begin
  FHost := aHost;
  Client.Host := aHost;
end;

Procedure Tbjvgen.Errorcheck;
begin
  if Client.Response.Size <> 0 then
    MessageDlg(Client.GetxmlResponseString, mtInformation, [mbOK], 0)
  else
    raise exception.Create('Error Posting to Tally');
end;

function Tbjvgen.ConvertVT(vt: string): string;
begin
  if  vt = 'Rcpt' then
    Result := 'Receipt'
  else if vt = 'Pymt' then
    Result := 'Payment'
  else if vt = 'Sale' then
    Result := 'Sales'
  else if vt = 'Purc' then
    Result := 'Purchase'
  else if vt = 'Jrnl' then
    Result := 'Journal'
  else if vt = 'Ctra' then
    Result := 'Contra'
  else if vt = 'D/N ' then
    Result := 'Debit Note'
  else if vt = 'C/N ' then
    Result := 'Credit Note'
  else if vt = 'Memo' then
    Result := 'Memorandum'
  else if vt = 'RevJ' then
    Result := 'Reversing Journal'
  else if vt = 'Jrnl' then
   Result := 'Stock Journal'
end;

Procedure Tbjvgen.Export;
begin
  xmlHeader;
  if FExportDependentMasters  then
  begin
    hTalywMst.MemoryIndexAdd('Name', 'NAME', '', Duplicates, Ascending);
    BrowMasters;
    htalywvou.First;
    ExpMasters;
  end;

  if Length(FGUID) = 0 then
    FGuID := 'E2FCA3BE-7D64-48AB-B3C7-81A842035235';

  htalywvou.First;
  while not hTalywvou.Eof Do
  begin
    if hTalywvou.StringGet('id') <> Vid then
    begin
      FirstRow;
      vid := hTalywvou.StringGet('id');
    end
    else
        anotherrow;
    hTalywvou.Next;
    if hTalywvou.StringGet('id') <> Vid then
    begin
      xvou := xvou.GetParent;
      xvou := xvou.GetParent;
    end;
  end;
  XMLFooter;
  post;
end;

Procedure Tbjvgen.BrowMasters;
begin
  HtALYWmST.SetTagTo('Name');
  htalywvou.First;
  while not hTalywvou.Eof Do
  begin
    if hTalywmst.Find(hTalywvou.FieldGet('LED_NAME'),True,False) then
    begin
      if hTalywmst.StringGet('STATUS') <> 'P' then
      begin
        ExpUnit;
        ExpItem;
      end;
      hTalywMst.Rlock;
      hTalywmst.Edit;
      hTalywmst.StringPut('Status','P');
      hTalywMst.Post;
      hTalywmst.Unlock;
    end;
    hTalywvou.Next;
  end;
end;


Procedure Tbjvgen.ExpMasters;
begin
  htalywmst.First;
  xvou := xvou.NewChild('TALLYMESSAGE','');
  while not hTalywmst.Eof do
  begin
    if hTalywmst.StringGet('Status') = 'P' then
    begin
      xvou := xvou.NewChild('LEDGER','');
      xvou.AddAttribute('NAME', hTalywmst.StringGet('NAME'));
      xvou.AddAttribute('ACTION','Create');
      xvou := xvou.NewChild('NAME.LIST','');
      xvou.NewChild2('NAME', hTalywmst.StringGet('NAME') );
      xvou.NewChild2('PARENT', hTalywmst.StringGet('PARENT') );
      xvou := xvou.GetParent;
      xvou := xvou.GetParent;
      hTalywMst.Rlock;
      hTalywmst.Edit;
      hTalywmst.StringPut('Status',' ');
      hTalywMst.Post;
      hTalywmst.Unlock;
    end;
    hTalywmst.Next;
  end;
  xvou := xvou.GetParent;
end;

Procedure Tbjvgen.ExpItem;
begin
  if Length(hTalywvou.StringGet('ITEM')) = 0 then
    Exit;
  xvou := xvou.NewChild('TALLYMESSAGE','');

  xvou := xvou.NewChild('STOCKITEM','');
  xvou.AddAttribute('NAME', hTalywvou.StringGet('ITEM'));
  xvou.AddAttribute('ACTION','Create');
  xvou := xvou.NewChild('NAME.LIST','');
  xvou.NewChild2('NAME', hTalywvou.StringGet('ITEM') );
  { NAME.LIST }
  xvou := xvou.GetParent;
  xvou.NewChild2('BASEUNITS', hTalywvou.StringGet('UNIT'));
  { STOCKITEM }
  xvou := xvou.GetParent;

  { TALLYMESSAGE }
  xvou := xvou.GetParent;
end;

Procedure Tbjvgen.ExpUnit;
begin
//  hEVCfg.First;
  if Length(hTalywvou.StringGet('UNIT')) = 0 then
    Exit;
  xvou := xvou.NewChild('TALLYMESSAGE','');

  xvou := xvou.NewChild('UNIT','');
  xvou.AddAttribute('NAME', hTalywvou.StringGet('UNIT'));
  xvou.AddAttribute('RESERVEDNAME','');
  xvou.NewChild2('NAME', hTalywvou.StringGet('UNIT'));
  xvou.NewChild2('ISSIMPLEUNIT', 'Yes' );

  { Unit }
  xvou := xvou.GetParent;

  { TALLYMESSAGE }
  xvou := xvou.GetParent;
end;

Procedure Tbjvgen.XmlHeader;
begin
  xvch.Clear;
  xvou := xVch.NewChild('ENVELOPE','');
  xvou := xvou.NewChild('HEADER','');
  xvou.NewChild2('TALLYREQUEST','Import Data');
{ xvou.GetParent2; }
  xvou := xvou.GetParent;
  xvou := xvou.NewChild('BODY','');
  xvou := xvou.NewChild('IMPORTDATA','');
  xvou := xvou.NewChild('REQUESTDESC','');
  xvou.NewChild2('REPORTNAME', 'All Masters');
  SetFilter;
{ xvou.GetParent2; }
  xvou := xvou.GetParent;
  xvou := xvou.NewChild('REQUESTDATA','');
end;

Procedure Tbjvgen.SetFilter;
begin
  xvou := xvou.NewChild('STATICVARIABLES','');
  xvou.NewChild2('SVEXPORTFORMAT', '$$SysName:XML');
  if length(FFirm) > 0 then
    xvou.NewChild2('SVCURRENTCOMPANY',FFirm);
  if not Length(FFRMDT) = 0 then
    xvou.NewChild2('SVFROMDATE', FFrmdt);
  if not Length(FTODT) = 0 then
    xvou.NewChild2('SVTODATE',FTodt);
      xvou := xvou.GetParent;
end;

Procedure Tbjvgen.XmlFooter;
begin
  xvou := xvou.GetParent;
  xvou := xvou.GetParent;
  xvou := xvou.GetParent;
  xvou := xvou.GetParent;
  xvou := xvou.GetParent;
end;

Procedure Tbjvgen.FirstRow;
begin
  xvou := xvou.NewChild('TALLYMESSAGE','');
  xvou := xvou.NewChild('VOUCHER','');
  xvou.AddAttribute('REMOTEID',GUID+'-'+
    RightStr('00000000' + TrimLeft(InttoHex(hTalywvou.IntegerGet('ID'),8)), 8));
  xvou.AddAttribute('VCHTYPE',convertVT(hTalywvou.StringGet('Vou_Type')));
  vchtype := hTalywvou.StringGet('VOU_TYPE');
  xvou.AddAttribute('ACTION',Action);
  xvou.NewChild2('DATE',hTalywvou.FieldGet('Date'));
  xvou.NewChild2('NARRATION',hTalywvou.StringGet('Narration'));
  xvou.NewChild2('VOUCHERTYPENAME',convertVT(hTalywvou.StringGet('Vou_Type')));
  xvou.NewChild2('EFFECTIVEDATE',hTalywvou.FieldGet('Date'));
  xvou := xvou.NewChild('ALLLEDGERENTRIES.LIST','');
  xvou :=  xvou.NewChild('ISDEEMEDPOSITIVE','');
  if hTalywvou.FloatGet('LED_AMT') < 0 then
    xvou.Content := 'Yes'
  else
    xvou.Content := 'No';
  xvou := xvou.GetParent;
  xvou.NewChild2('LEDGERNAME',hTalywvou.StringGet('Led_Name'));
  xvou.NewChild2('AMOUNT',hTalywvou.StringGet('LED_AMT'));
      xvou := xvou.GetParent;
end;

Procedure Tbjvgen.AnotherRow;
begin
  xvou := xvou.NewChild('ALLLEDGERENTRIES.LIST','');
  xvou :=  xvou.NewChild('ISDEEMEDPOSITIVE','');
  if hTalywvou.FloatGet('LED_AMT') < 0 then
    xvou.Content := 'Yes'
  else
    xvou.Content := 'No';
      xvou := xvou.GetParent;
  xvou.NewChild2('LEDGERNAME',hTalywvou.StringGet('LED_NAME'));
  xvou.NewChild2('AMOUNT',hTalywvou.StringGet('LED_AMT'));
  InvRow;
  xvou := xvou.GetParent;
end;


Procedure Tbjvgen.Invrow;
begin
  if (vchtype <> 'Sale') and (vchtype <> 'Purc') then
    Exit;
  if (Length(hTalywVou.StringGet('ITEM')) = 0) or
    (hTalywVou.IntegerGet('QTY') = 0)  or
      (hTalywVou.FloatGet('QTY') = 0)
      then
    Exit;

  xvou := xvou.NewChild('INVENTORYALLOCATIONS.LIST', '');
  if hTalywVou.FloatGet('LED_AMT') > 0 then
    xvou.NewChild2('ISDEEMEDPOSITIVE', 'No')
  else
    xvou.NewChild2('ISDEEMEDPOSITIVE', 'Yes');

  xvou.NewChild2('STOCKITEMNAME', hTalywVou.StringGet('ITEM'));
  if Length(hTalywVou.StringGet('RATE')) > 0 then
    xvou.NewChild2('RATE', hTalywVou.StringGet('RATE') +
    '/'+ hLlist.StringGet('UNIT'));
    xvou.NewChild2('AMOUNT',  hTalywVou.StringGet('LED_AMT'));
    xvou.NewChild2('ACTUALQTY', hTalywVou.StringGet('QTY') +
    ' '+ hLlist.StringGet('UNIT'));
    xvou.NewChild2('BILLEDQTY', hTalywVou.StringGet('QTY') +
    ' ' + hLlist.StringGet('UNIT'));
    xvou.NewChild2('GODOWNNAME', 'Main Location');
{ INVENTORYALLOCATIONS.LIST }
  xVou := xVou.GetParent;
end;

Procedure Tbjvgen.Post;
begin
  if ToSaveXMLFile then
    xvou.SaveXmlFile('VouReg.xml');
  Client.Host :=  Host;
  Client.xmlRequestString := xvou.GetXml;
  Client.post;

  Errorcheck;
end;

end.
