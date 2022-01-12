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
unit dgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  gs6_shel, gs6_date,
  Math,
  DateUtils;

type
  Tfnupdate = procedure(msg: string);

type
  TdbGen = class
  private
    { Private declarations }
    FIsAverageRate: boolean;
    FIsDecimalQty: boolean;
    FPairVchDaysbetween: integer;
  protected
    nid: integer;
    perday, preferday: integer;
    rentries: integer;
    rHigh, rLow, rgap: integer;
    avgRate: integer;
    rrate: integer;
{    rHighQty, rGapQty: Integer;}
    iQty: Currency;
    rfrmdt, rtodt: longint;
    NarrationCtr: integer;
    regen: boolean;
    ActualEntries: integer;
    LastdayEntries: integer;
    LastDate: string;
    FixedDate: integer;
    ActualDate: integer;
    divide_1, divide_2: boolean;
    Amount_1, Amount_2, Amount_3, Amount_4: Currency;
    rpdgap: double;
    hdllist: TgsDBFTable;
    hTalywmst: TgsDBFTable;
    hETemp: TgsDBFTable;
    hEVCfg: TgsDBFTable;
    function GetrHigh: integer;
    function GetrEntries: integer;
    function GetPartyAmt: Currency;
    function GetrQty(const aAmt: integer): Currency;
    function GetAvgRate: Integer;
    function GetrRate: Integer;
    procedure DivideAmt(const aAmt: Currency);
    function GetRndAmt(const aAmt: integer; const how: integer): integer;
    procedure GenerateOne;
    procedure WriteXml;
    procedure WriteLineOne;
    procedure WriteLineTwo;
    procedure WriteLineThree;
    procedure WriteLineFour;
    procedure WritePairVchLineOne;
    procedure WritePairVchLineTwo;
    procedure WriteStatus;
  public
    { Public declarations }
    IsAverage: boolean;
    IsInventory: boolean;
    IspairVch: boolean;
    IsThirdLine: boolean;
    IsFourthLine: boolean;
    TallyVersion: string;
    FUpdate: TfnUpdate;
    GenRec: integer;
    InvRnd: integer;
    constructor Create;
    destructor Destroy; override;
    procedure Execute;
  published
    property IsAverageRate: boolean read FIsAverageRate write FIsAverageRate;
    property IsDecimalQty: boolean read FIsDecimalQty write FIsDecimalQty;
    property PairVchDaysbetween: integer read FPairVchDaysbetween write FPairVchDaysbetween;
  end;

  TlGen = class
  private
    { Private declarations }
  protected
    hdllist: TgsDBFTable;
    hTalywmst: TgsDBFTable;
    hEVCfg: TgsDBFTable;
  public
    { Public declarations }
    TallyVersion: string;
    FUpdate: TfnUpdate;
    constructor Create;
    destructor Destroy; override;
    procedure Execute;
  published
  end;

implementation

uses
  Datamodule;

Constructor Tlgen.Create;
begin
  inherited;
  hTalywmst := TgsDBFTable.Create('.\Data\TALYWMST.DBF','', False, False);

  if not DeleteFile('.\Data\LLIST.DBF') then
  begin
    hdLList := TgsDBFTable.Create('.\Data\LLIST.DBF','',  True, False);
    while not hdLlist.EOF do
    begin
      hdLlist.Delete;
      hdLlist.Next;
    end;
    hdLList.Free;
  end
  else
  begin
    DM.CreateTables;
  end;

  hdLList := TgsDBFTable.Create('.\Data\LLIST.DBF','',  True, True);
  hEVCfg := TgsDBFTable.Create('.\Data\EVCFG.DBF','',  True, True);
end;

destructor Tlgen.Destroy;
begin
  hTalywmst.Free;
  hdllist.Free;
  hEVCfg.Free;
  inherited;
end;

procedure Tlgen.Execute;
begin
  hTalywMst.First;
  while not hTalywmst.EOF do
  begin
    hdLlist.Append;
    hdLlist.StringPut('NAME', HtALYWmST.StringGet('NAME'));
    hdLlist.StringPut('PARENT', HtALYWmST.StringGet('PARENT'));
    if Length(hEVCfg.StringGet('FRMDT')) > 0 then
    begin
      hdLlist.StringPut('FRMDT', hEVCFG.StringGet('FRMDT'));
      hdLlist.StringPut('TODT', hEVCFG.StringGet('TODT'));
    end
    else
    begin
      if Monthof(Now) < 4 then
      begin
        hdLlist.StringPut('FRMDT', InttoStr(Yearof(Now)-1)+'0401');
        hdLlist.StringPut('TODT', InttoStr(Yearof(Now))+'0331');
      end
      else
      begin
        hdLlist.StringPut('FRMDT', InttoStr(Yearof(Now))+'0401');
        hdLlist.StringPut('TODT', InttoStr(Yearof(Now)+1)+'0331');
      end;
    end;
    hdLlist.StringPut('CONTRA', 'Cash');
    hdLlist.StringPut('DRCR', 'D');
    hdLlist.StringPut('DRCR2', 'C');

    if Length(hEVCfg.StringGet('INCLUDE')) > 0 then
      hdLlist.StringPut('INCLUDE', hEVCFG.StringGet('INCLUDE'))
    else
      hdLlist.StringPut('INCLUDE', '7');
    if Length(hEVCfg.StringGet('EXCLUDE')) > 0 then
      hdLlist.StringPut('EXCLUDE', hEVCFG.StringGet('EXCLUDE'))
    else
      hdLlist.StringPut('EXCLUDE', '1');
    hdLlist.StringPut('VOU_TYPE', 'Pymt');
    if Length(hEVCfg.StringGet('GENTYPE')) > 0 then
      hdLlist.StringPut('GENTYPE', hEVCFG.StringGet('GENTYPE'))
    else
      hdLlist.StringPut('GENTYPE', 'R');
    if Length(hEVCfg.StringGet('PERDAY')) > 0 then
      hdLlist.StringPut('PERDAY', hEVCFG.StringGet('PERDAY'))
    else
      hdLlist.StringPut('PERDAY', '1');
    if Length(hEVCfg.StringGet('MDAYS')) > 0 then
      hdLlist.StringPut('MDAYS', hEVCFG.StringGet('MDAYS'))
    else
      hdLlist.StringPut('MDAYS', '1');
    if Length(hEVCfg.StringGet('ROUNDTO')) > 0 then
      hdLlist.IntegerPut('ROUNDTO', hEVCFG.IntegerGet('ROUNDTO'))
    else
      hdLlist.StringPut('ROUNDTO', '0');
    hdLlist.IntegerPut('MDAYS', 1);
    hdLlist.StringPut('COUNTER', '1');
    hdLlist.LogicPut('FIXEDRATE', hEVCFG.LogicGet('FIXEDRATE'));
    if Length(hEVCfg.StringGet('ITEM')) > 0 then
      hdLlist.StringPut('ITEM', hEVCFG.StringGet('ITEM'));
    if Length(hEVCfg.StringGet('UNIT')) > 0 then
      hdLlist.StringPut('UNIT', hEVCFG.StringGet('UNIT'));
    hdLlist.Post;
    FUpdate(HtALYWmST.StringGet('NAME'));
    Application.ProcessMessages;
    hTalywMst.Next;
  end;
end;

{ Generator }

Constructor Tdbgen.Create;
begin
  inherited;
{ Refererence Point days gap  rpdgap := 0;}
  hdLlist := TgsDBFTable.Create('.\Data\LLIST.DBF','', tRUe, True);
  hEVCfg := TgsDBFTable.Create('.\Data\EVCFG.DBF','', True, True);
  PairVchDaysbetween := 1;
  Randomize;
end;

destructor Tdbgen.Destroy;
begin
  hdllist.Free;
  hEVCfg.Free;
  hETemp.Free;
  inherited;
end;

function Tdbgen.GetPartyAmt;
var
  rrandamt: integer;
begin
  Amount_1 := 0;
  Amount_2 := 0;
  Amount_3 := 0;
  Amount_4:= 0;
  rrandamt := rHigh - Random(rgap);
  Result := GetRndAmt(rrandamt, hdLlist.IntegerGet('ROUNDTO'));
  if IsInventory then
  begin
//    FIsAverageRate := hEVcfg.LogicGet('FIXEDRATE');
//    FIsAverageRate := hdLlist.LogicGet('FIXEDRATE');
    rRate := GetrRate;
    if rRandAmt > rRate then
    begin
      iQty := GetrQty(rrandAmt);
      Result := RoundTo((iQty * rRate), -2);
    end
    else
      iQty := 0;
  end;
  Amount_1 := Result;
  Amount_2 := Result;
  DivideAmt(Result);
end;

function Tdbgen.GetrQty(const aAmt: integer): Currency;
begin
  Result := aAmt / rRate;
  if not IsDecimalQty then
    Result := Round(Result)
  else
    Result := RoundTo(Result, -3);
end;

function Tdbgen.GetAvgRate: Integer;
begin
  Result := Trunc(hdLlist.FloatGet('AMOUNT') / hdLlist.FloatGet('QTY'));
end;

function Tdbgen.GetrRate: Integer;
begin
//  Result := hdLlist.IntegerGet('RATE');
  if  FIsAverageRate then
  begin
//    hdLlist.IntegerPut('RATE', Avgrate);
    Result := avgRate;
    Exit;
  end;

  Result := Round(avgRate * 96/100) + Random(Round(avgRate * 8 /100));
  Result := GetRndAmt(Result, hdLlist.IntegerGet('ROUNDTO'));
end;

procedure Tdbgen.DivideAmt(const aAmt: Currency);
begin
  if hdLlist.FloatGet('PERCENTAGE') > 0 then
  begin
    if Length(hdLlist.StringGet('CONTRA2')) > 0 then
    begin
      IsThirdLine := True;
      if Length(hdLlist.StringGet('CONTRA3')) > 0 then
        IsFourthLine := True;
    end;
  end;
  if Length(hdLlist.StringGet('VCHTYPE2')) > 0 then
  begin
      IsPairVch := True;
      if hdLlist.IntegerGet('MDAYS') > 0 then
        PairVchDaysbetween := hdLlist.IntegerGet('MDAYS');
      IsThirdLine := False;
  end;
  if not IsThirdLine then
    Exit;
  if IsFourthLine then
  begin
    Amount_3 := Round(Amount_1 * hdLlist.FloatGet('PERCENTAGE')/100/2);
    Amount_4 := Amount_3;
    if (hdLlist.StringGet('DRCR')) <> (hdLlist.StringGet('DRCR2'))then
       Amount_2 := Amount_1 - Amount_3 - Amount_4;
    if (hdLlist.StringGet('DRCR')) = (hdLlist.StringGet('DRCR2'))then
     Amount_1 := Amount_2 - Amount_3 - Amount_4;
    Exit;
  end;
  if (hdLlist.StringGet('DRCR')) <> (hdLlist.StringGet('DRCR2'))then
  begin
   Amount_1 := aAmt;
   Amount_3 := Round(Amount_1 * hdLlist.FloatGet('PERCENTAGE')/100);
   Amount_2 := Amount_1 - Amount_3;
  end;
  if (hdLlist.StringGet('DRCR')) = (hdLlist.StringGet('DRCR2'))then
  begin
   Amount_2 := aAmt;
   Amount_3 := Round(Amount_2 * hdLlist.FloatGet('PERCENTAGE')/100);
   Amount_1 := Amount_2 - Amount_3;
  end;
end;

{ Handles Where no Minimum is given}
function Tdbgen.GetrEntries: integer;
var
  rEntry: integer;
begin
  rEntry := 0;
  if hdLLIST.StringGet('GENTYPE') = 'R' then
    rentry := hdLlist.IntegerGet('ENTRIES');
  if hdLlist.StringGet('GENTYPE') = 'W' then
  begin
    rentry := Length(hdLlist.StringGet('INCLUDE')) *
      (rtodt - rfrmdt) * perday;
    rentry := rentry div 7;
  end;
  Result := rEntry;
  if rEntry = 0 then
  begin
     MessageDlg('Unknown No of Entries', mtError, [mbOK], 0);
//    Exit;
  end;
end;

{ Handles Where no Entries is given}
function Tdbgen.GetrHigh: integer;
var
  TmphIGH, TmpAvg: integer;
begin
  TmpHIgh  := hdLlist.IntegerGet('HIGH');
  TmpAvg := hdLlist.InTegerGet('AMOUNT') div rentries;
  if TmphIGH = 0 then
    TmphIGH :=  Round(TmpAvg * 5/4);
  Result := TmpHigh;
  if (TmpHigh < TmpAvg) then
  begin
    if MessageDlg('Maximum '+ FormatFloat('0', TmpHigh)+
    ' is less than Average; Use Average Amount ?',
      mtConfirmation, [mbOK, mbCancel],0) = mrCancel then
    begin
      Result := 0;
      Exit;
    end;
    IsAverage := True;
    IsInventory := False;
    Result := TmpAvg;
    hdLlist.RLock;
    hdLlist.Edit;
    hdLlist.IntegerPut('HIGH', TmpAvg);
    hdLlist.LogicPut('INVVCH', False);
    hdLlist.Post;
    hdLlist.Unlock;
  end;
   FIsAverageRate := hdLlist.LogicGet('FIXEDRATE');
  if IsInventory then
  begin
    avgRate:=  GetAvgRate;
    if (AvgRate > TmpHigh) or
    (hdLlist.IntegerGet('RATE') > TmpHigh ) or
    (hdLlist.IntegerGet('RATE') > AvgRate) then
    begin
      if MessageDlg('Item Rate is greateer Average Amount; Use Variable Rate ?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
      begin
        Result := 0;
        Exit;
      end;
      hdLlist.RLock;
      hdLlist.Edit;
      hdLlist.IntegerPut('RATE', 0);
      hdLlist.LogicPut('FIXEDRATE', False);
      hdLlist.Post;
      hdLlist.Unlock;
//      Result := TmpHigh;
    end;
//    FIsAverageRate := hEVcfg.LogicGet('FIXEDRATE');
//    FIsAverageRate := hdLlist.LogicGet('FIXEDRATE');
    if not FIsAverageRate then
    begin
      if hdLlist.IntegerGet('RATE') > 0 then
      if MessageDlg('Use Average Rate ?', mtconfirmation, [mbYes, mbNO], 0) = mrYes then
        FIsAverageRate := True
      else
      begin
        MessageDlg('Variable Rate is set', mtInformation, [mbOK], 0);
        hdLlist.RLock;
        hdLlist.Edit;
        hdLlist.IntegerPut('RATE', 0);
        hdLlist.LogicPut('FIXEDRATE', False);
        hdLlist.Post;
        hdLlist.Unlock;
        FIsAverageRate := False
      end;
    end;
    if hEVCfg.LogicGet('DECIMLQTY') then
    begin
      IsAverageRate := False;
      IsDecimalQty := True;
    end;
    IF IsAverageRate then
    begin
      hdLlist.RLock;
      hdLlist.Edit;
      hdLlist.IntegerPut('RATE', Avgrate);
      hdLlist.LogicPut('FIXEDRATE', True);
      hdLlist.Post;
      hdLlist.Unlock;
    end;
  end;
end;

function Tdbgen.GetRndAmt(const aAmt: integer; const how: integer): integer;
var
  rndFactor: Integer;
begin
  rndFactor := 1;
  Result := aAmt;
  if  how = 3 then
    rndFactor :=  5;
  if  how = 4 then
    rndFactor :=  10;
  if  how = 5 then
    rndFactor :=  50;
  if  how = 6 then
    rndFactor :=  100;
  if  how = 7 then
    rndFactor :=  200;
  Result := (Result div rndFactor) * rndFactor;
  if Result < rlow then
    Result := Result + rndFactor;
  if Result > rhigh then
    Result := Result - rndFactor;
end;

procedure Tdbgen.Execute;
var
  orec: integer;
  refreshed: boolean;
begin
//  hEVcfg.Refresh;
  GenRec := 0;
  refreshed := False;
  if FileExists('.\Data\EXPBOOK.DBF') then
    DeleteFile('.\Data\EXPBOOK.DBF');
  DM.CreateTables;
  hETemp := TgsDBFTable.Create('.\Data\EXPBOOK.DBF','', True, True);
  if not refreshed then
  begin
    hETemp.First;
    while not hETemp.EOF do
    begin
      hETemp.Delete;
      hETemp.Next;
    end;
  end;
  orec := hdLlist.RecNo;
  hdLlist.First;
  while not hdLlist.EOF do
  begin
    if hdLlist.LogiCGet('GENERATED') then
    begin
      hdLlist.Next;
      Continue;
    end;
    GenerateOne;
    hdLlist.Next;
  end;
  hdLlist.Go(orec);
//  if Assigned(FUpdate) then
//    Fupdate('Generated for ' + InttoStr(GenRec));
end;

procedure Tdbgen.GenerateOne;
begin
  ActualEntries  := 0;
  LastdayEntries := 0;
  LastDate := '';
  IsThirdLine := False;
  IsInventory := False;
  IsPairVch := False;
  IsAverage := False;

  if (hdLlist.FloatGet('AMOUNT') = 0) then
    exit;
  Fupdate('Processing Ledger ' + hdLlist.StringGet('NAME'));
  Application.ProcessMessages;

  perday := hdLlist.IntegerGet('PERDAY');
  if perday = 0 then
    perday := 1;
  rfrmdt := hdLlist.DateGet('FRMDT');
  rtodt := hdLlist.DateGet('TODT');
  if rfrmdt > rtodt then
    rfrmdt := rtodt;
  if hEVCfg.StringGet('PRENEXT') = 'P' then
    preferday := -1;
  if hEVCfg.StringGet('PRENEXT') = 'N' then
    preferday := 1;

  rEntries := GetrEntries;
  if rEntries = 0 then
    Exit;

  if hdLlist.LogicGet('INVVCH') then
    if (hdLlist.StringGet('VOU_TYPE') ='Purc') or (hdLlist.StringGet('VOU_TYPE') = 'Sale') then
      if (Length(hdllist.StringGet('ITEM')) > 0) and
            (hdllist.IntegerGet('Qty') > 0) then
        IsInventory := True;
  rHigh  := GetrHigh;
  if rHigh = 0 then
    Exit;
  hdLlist.Edit;
  if (hdLlist.StringGet('VOU_TYPE') ='Purc') or (hdLlist.StringGet('VOU_TYPE') = 'Rcpt') then
    hdLlist.StringPut('DRCR', 'C');
  if (hdLlist.StringGet('VOU_TYPE') ='Sale') or (hdLlist.StringGet('VOU_TYPE') = 'Pymt')
    or (hdLlist.StringGet('VOU_TYPE') = 'Jrnl') then
    hdLlist.StringPut('DRCR', 'D');
  hdLlist.Post;
  hdLlist.Edit;
  if (hdLlist.StringGet('VCHTYPE2') ='Purc') or (hdLlist.StringGet('VCHTYPE2') = 'Rcpt') then
    hdLlist.StringPut('DRCR2', 'C');
  if (hdLlist.StringGet('VCHTYPE2') ='Sale') or (hdLlist.StringGet('VCHTYPE2') = 'Pymt')
    or (hdLlist.StringGet('VCHTYPE2') = 'Jrnl') then
    hdLlist.StringPut('DRCR2', 'D');
  hdLlist.Post;

  NarrationCtr := hdLlist.IntegerGet('COUNTER');
  regen := True;
    WriteXml;
  hdLlist.Edit;
  hdLlist.logicPut('GENERATED', True);
  hdLlist.Post;

  hEVCfg.Edit;
  hEVCfg.Post;
  GenRec := Genrec + 1;
  Application.ProcessMessages;
end;


procedure Tdbgen.WriteXml;
var
  PartyAmt, BalAmt: Currency;
  BalQty: Currency;
  ElapsedDays: double;
  eachday: integer;
begin
  nid := random(10000000000);
  BalAmt := hdLlist.IntegerGet('AMOUNT');
  BalQty := hdLlist.IntegerGet('QTY');

  rLow := Round(2 * BalAmt / rentries - rHigh);
  hdllist.RLock;
  hdllist.Edit;
  hdllist.IntegerPut('LOW', rLow);
  if hdllist.IntegerGet('HIGH') = 0 then
    hdllist.IntegerPut('HIGH', rHigh);
  hdllist.Post;
  hdllist.Unlock;
  rgap := rhigh - rlow;
  ElapsedDays := 0;
{ Add Last day }
{ Bug Integer division is corrected }
  rpdgap := (rtodt - rfrmdt + 1) / rentries;
  if hdLLIST.StringGet('GENTYPE') = 'R' then
    rpdgap := rpdgap * perday;
  FixedDate := rfrmdt;
  eachday := perday;
  while BalAmt > 0 do
  begin
    PartyAmt := GetPartyAmt;
    if (PartyAmt > BalAmt) or (iQty > BalQty) then
    begin
      PartyAmt := BalAmt;
      Amount_1 := BalAmt;
      Amount_2 := BalAmt;
      if BalQty > 0  THEN
        iQty := BalQty
      else
        iQty := 0;
      DivideAmt(BalAmt);
    end;
    if hdLlist.StringGet('GENTYPE') = 'R' then
    begin
        ActualDate := FixedDate;
        if InttoStr(((FixedDate+1) mod 7)+1) = hdLlist.StringGet('EXCLUDE') then
        begin
            if IncDay(Fixeddate, preferday) <= rtodt then
                ActualDate := FixedDate + preferday
            else
                ActualDate := FixedDate -1;
        end;
    end;
    if hdLlist.StringGet('GENTYPE') = 'W' then
    begin
      while FixedDate < rtodt do
      begin
        if Pos(IntToStr(((FixedDate+1) mod 7)+1), hdLlist.StringGet('INCLUDE')) > 0 then
                break;
            FixedDate := FixedDate + 1;
      end;
      ActualDate  := FixedDate;
    end;

    WriteLineOne;
    WriteLineTwo;
    if IsThirdLine then
      WriteLineThree;
    if IsPairVch then
    begin
      WritePairVchLineOne;
      WritePairVchLineTwo;
    end;

    NarrationCtr := NarrationCtr + 1;
    ActualEntries := ActualEntries + 1;
    if ActualDate = rtodt then
      LastdayEntries := LastdayEntries + 1;
    lastDate := DtoC(ActualDate);

    nid := random(10000000000);
    if eachday = 1 then
    begin
      if hdLlist.StringGet('GENTYPE') = 'R' then
      begin
        ElapsedDays := ElapsedDays + rpdgap;
{ dgap is a fraction }
        FixedDate := rfrmdt + Trunc(ElapsedDays);
      end;
      if hdLlist.StringGet('GENTYPE') = 'W' then
        FixedDate := FixedDate + 1;
    end;
    eachday := eachday -1;
    if FixedDate > rtodt then
      FixedDate := rtodt;
    BalAmt := BalAmt - PartyAmt;
    BalQty := BalQty - iQty;
    if eachday  = 0 then
      eachday := perday;
  end;
  regen := False;
  WriteStatus;
end;

procedure Tdbgen.WriteLineOne;
var
  pnan: string;
begin
    hETemp.Append;
    hETemp.IntegerPut('ID', nid);
    hETemp.StringPut('LED_NAME', hdLlist.StringGet('NAME'));

    if hdLlist.StringGet('DRCR') = 'D' then
        hETemp.FloatPut('LED_AMT', -Amount_1);
    if hdLlist.StringGet('DRCR') = 'C' then
        hETemp.FloatPut('LED_AMT', Amount_1);
    hETemp.DatePut('DATE', ActualDate);
    pnan := StringReplace(hdLlist.StringGet('NARRATION'), '###', inttoStr(NarrationCtr), []);
    hETemp.StringPut('VOU_TYPE', hdLlist.StringGet('VOU_TYPE'));
    hETemp.StringPut('NARRATION', pnan);
    hETemp.Post;
end;

procedure Tdbgen.WriteLineTwo;
begin
    NarrationCtr := NarrationCtr + 1;
    hETemp.Append;
    hETemp.IntegerPut('ID', nid);
    hETemp.StringPut('LED_NAME', hdLlist.StringGet('CONTRA'));
    if hdLList.StringGet('DRCR') = 'D'  then
        hETemp.FloatPut('LED_AMT', Amount_2);
    if hdLList.StringGet('DRCR') = 'C'  then
        hETemp.FloatPut('LED_AMT', -Amount_2);
    hETemp.STringPut('ITEM', hdLList.StringGet('ITEM'));
    hETemp.STringPut('UNIT', hdLList.StringGet('UNIT'));
    hETemp.FieldPut('RATE', hdLList.FieldGet('RATE'));
  if IsInventory then
    if (not IsPairVch ) or (hdLList.IntegerGet('INVLED') = 1) then
    begin
        hETemp.FloatPut('QTY', iqty);
    end;
  hETemp.Post;
end;

procedure Tdbgen.WriteLineThree;
begin
    hETemp.Append;
    hETemp.IntegerPut('ID', nid);
    hETemp.StringPut('LED_NAME', hdLlist.StringGet('CONTRA2'));
    if hdLList.StringGet('DRCR2') = 'D'  then
        hETemp.FloatPut('LED_AMT', -Amount_3);
    if hdLList.StringGet('DRCR2') = 'C'  then
        hETemp.FloatPut('LED_AMT', Amount_3);
    hETemp.Post;
  if IsFourthLine then
    WriteLineFour;
end;

procedure Tdbgen.WriteLineFour;
begin
    hETemp.Append;
    hETemp.IntegerPut('ID', nid);
    hETemp.StringPut('LED_NAME', hdLlist.StringGet('CONTRA3'));
    if hdLList.StringGet('DRCR2') = 'D'  then
        hETemp.FloatPut('LED_AMT', -Amount_4);
    if hdLList.StringGet('DRCR2') = 'C'  then
        hETemp.FloatPut('LED_AMT', Amount_4);
    hETemp.Post;
end;

procedure Tdbgen.WritePairVchLineOne;
var
  pnan: string;
begin
  nid := nid + 1;
  hETemp.Append;
  hETemp.IntegerPut('ID', nid);
  hETemp.StringPut('LED_NAME', hdLlist.StringGet('NAME'));

  if hdLlist.StringGet('DRCR') = 'D' then
      hETemp.FloatPut('LED_AMT', Amount_1);
  if hdLlist.StringGet('DRCR') = 'C' then
    hETemp.FloatPut('LED_AMT', -Amount_1);
  if ActualDate + 1 < rToDt then
    ActualDate := ActualDate + PairVchDaysbetween;
  hETemp.DatePut('DATE', ActualDate);
  pnan := StringReplace(hdLlist.StringGet('NARRATION'), '###', inttoStr(NarrationCtr), []);
  hETemp.StringPut('VOU_TYPE', hdLlist.StringGet('VCHTYPE2'));
  hETemp.StringPut('NARRATION', pnan);
  hETemp.Post;
end;

procedure Tdbgen.WritePairVchLineTwo;
begin
  hETemp.Append;
  hETemp.IntegerPut('ID', nid);
  hETemp.StringPut('LED_NAME', hdLlist.StringGet('CONTRA2'));
  if hdLList.StringGet('DRCR') = 'D'  then
    hETemp.FloatPut('LED_AMT', -Amount_2);
  if hdLList.StringGet('DRCR') = 'C'  then
    hETemp.FloatPut('LED_AMT', Amount_2);
  hETemp.STringPut('ITEM', hdLlist.StringGet('ITEM'));
  hETemp.FieldPut('UNIT', hdLlist.FieldGet('UNIT'));
  hETemp.FieldPut('RATE', hdLlist.FieldGet('RATE'));
  if IsInventory then
    if hdLList.IntegerGet('INVLED') = 2 then
    begin
        hETemp.FloatPut('QTY', iqty);
    end;
  hETemp.Post;
end;

procedure Tdbgen.WriteStatus;
var
  StatusMsg: string;
  ToRegenerate: boolean;
begin
  ToRegenerate := False;
  if LastdayEntries = 0 then
    StatusMsg := 'Entry Last Date: '+ LastDate
  else
    StatusMsg := ' To Date Enties: ' + InttoStr(LastdayEntries);
  if (rtodt - ActualDate) > rpdgap then
  begin
    StatusMsg := StatusMsg + ' Regeneration recommedd';
    ToRegenerate := True;
  end;
  if LastDayEntries / perday > 1 then
  begin
    ToRegenerate := True;
    StatusMsg := StatusMsg + ' Regeneration recommedd';
  end;
//  if ToRegenerate and IsInventory then
//  MessageDlg('Regeneration recommended', mtInformation, [mbOK], 0);
  if Assigned(FUpdate) then
    FUpdate(StatusMsg);
end;

end.

