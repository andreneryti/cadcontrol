unit ULotesRelatRepasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids, ToolWin, ComCtrls, ActnList, DB, DBClient, JvDBCtrl,
  ExRxDBGrid, Provider, SqlExpr, DBCtrls, DBLocal, DBLocalS, JvSelectDirectory;

type
  TfrmLotesRelatRepasse = class(TModeloComum)
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    btLocalizar: TBitBtn;
    cbbRepasse: TComboBox;
    edDataIni: TDateTimePicker;
    edDataFim: TDateTimePicker;
    ActionList1: TActionList;
    acEtiqueta: TAction;
    acGerarPlanilha: TAction;
    acMala: TAction;
    acLoteadd: TAction;
    acNovoStatus: TAction;
    acGerarRepasse: TAction;
    rbtodos: TRadioButton;
    rbPeriodo: TRadioButton;
    bvl1: TBevel;
    grid1: TExRxDBGrid;
    chkMarc: TCheckBox;
    cdsItens: TClientDataSet;
    cdsItensselecionado: TBooleanField;
    dsItens: TDataSource;
    btnacGerarRepasse: TBitBtn;
    btnacGerarPlanilha: TSpeedButton;
    Label1: TLabel;
    cdsItensbol_id: TIntegerField;
    cdsItensass_id: TIntegerField;
    cdsItensnossonumero: TStringField;
    cdsItensdt_recebimento: TDateField;
    cdsItensdt_credito: TDateField;
    cdsItensvalor_recebimento: TFloatField;
    cdsItensdesconto_pagto: TFloatField;
    cdsItenstp_contrib_descricao: TStringField;
    cdsItensforma_pagto: TStringField;
    cdsItensencargos_pago: TFloatField;
    cdsItensanuid_id: TIntegerField;
    cdsItensano: TIntegerField;
    cdsItensvalorarepassar: TFloatField;
    cdsItensdatarepasse: TDateField;
    cdsItensvalorrepassado: TFloatField;
    cdsItensvencimento: TDateField;
    cdsItensdt_baixa: TDateField;
    cdsItensparc_id: TIntegerField;
    cdsAux: TClientDataSet;
    cdsAuxidlote: TIntegerField;
    dsAux: TDataSource;
    sdsLotes: TSQLClientDataSet;
    dsLotes: TDataSource;
    dblkcbbLote: TDBLookupComboBox;
    sdsLotesIDLOTE: TIntegerField;
    sdsLotesNOMEDATA: TStringField;
    Label3: TLabel;
    labtotal: TLabel;
    cdsItensnome: TStringField;
    cdsItensregistro: TStringField;
    cdsItenssindicato: TStringField;
    cdsItensidLote: TIntegerField;
    btnacRelatorios: TSpeedButton;
    actRelatoriorepasse: TAction;
    Label4: TLabel;
    cbbSind: TComboBox;
    cdsItensTOTVALOR: TFloatField;
    procedure BitBtn6Click(Sender: TObject);
    procedure acGerarRepasseExecute(Sender: TObject);
    procedure ImprimirRepasse;
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure rbPeriodoClick(Sender: TObject);
    procedure rbtodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkMarcClick(Sender: TObject);
    procedure MarcarTodos(marc: boolean);
    procedure actRelatoriorepasseExecute(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLotesRelatRepasse: TfrmLotesRelatRepasse;
  totvalor, totrepasse:Real;
   totvalororig, totencargos:Real;

implementation

uses UFuncoes, UPrincipal, UDMConexao, UDmlotes, ULoteRepasseDados,
  UQrRepasse, Mask, URelatRepasseRelats;

{$R *.dfm}

procedure TfrmLotesRelatRepasse.BitBtn6Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLotesRelatRepasse.acGerarRepasseExecute(Sender: TObject);
var
    bm:TBookmark;
    repasse_id :Integer;
    data1, data2:TDateTime;
begin
  inherited;
  cdsitens.IndexFieldNames := 'dt_credito';
  bm := cdsitens.GetBookmark;
  cdsItens.DisableControls;
  cdsitens.Filtered:=false;
  cdsitens.Filter := '(datarepasse is null) and (selecionado = true)';
  cdsitens.Filtered:=true;
  Application.ProcessMessages;
  if cdsitens.RecordCount = 0 then
  begin
      Aviso('Não há itens selecionados passíveis para repasse. ');
      cdsitens.Filtered:=false;
      cdsitens.Filter:='';
      cdsitens.IndexFieldNames := 'dt_credito';
      cdsitens.GotoBookmark(bm);
      cdsitens.FreeBookmark(bm);
      cdsItens.EnableControls;
      Exit;
  end;

  try
        application.CreateForm(tfrmLoteRepasseDados,frmLoteRepasseDados);
        frmLoteRepasseDados.labTotItens.caption := inttostr(cdsitens.RecordCount);
        totvalor:= 0;
        totrepasse:= 0;
        totvalororig :=0;
        totencargos :=0;
        cdsitens.first;
        while not cdsItens.eof do
        begin
            totvalor := totvalor + cdsItensvalor_recebimento.Value;
            totvalororig :=  totvalororig + cdsItensTOTVALOR.Value;
            totencargos :=  totencargos + cdsItensencargos_pago.Value;
            totrepasse := totrepasse + cdsItensvalorarepassar.Value;
            cdsitens.Next;
        end;
        cdsitens.first;

        frmLoteRepasseDados.labTotValor.caption := 'R$ ' + formatfloat(',0.00', totvalor);
        frmLoteRepasseDados.labTotRepasse.caption := 'R$ ' + formatfloat(',0.00', totrepasse);
        if frmLoteRepasseDados.showmodal = mrok then
        begin
            if rbtodos.Checked = true then
            begin
                data1 := StrToDate(frmLoteRepasseDados.editDtRepasse.text);
                data2 := StrToDate(frmLoteRepasseDados.editDtRepasse.text);
            end
            else
            begin
                data1 := edDataIni.date;
                data2 := edDataFim.date;
            end;

            repasse_id := DMConexao.GeraAutoNumber('GEN_LOTEREPASSE_ID', 1);
            if (DMConexao.ExecuteProc('LOTEREPASSE_I',
                                        inttostr(repasse_id) + ',' +
                                        quotedstr(inttostr(ExtractYear(StrToDate(frmLoteRepasseDados.editDtRepasse.text))) + '.' + inttostr(ExtractMonth(StrToDate(frmLoteRepasseDados.editDtRepasse.text))) + '.' + inttostr(ExtractDay(StrToDate(frmLoteRepasseDados.editDtRepasse.text)))) + ',' +
                                        stringreplace(floattostr(totrepasse), ',', '.', [rfReplaceAll]) + ', ' +
                                        inttostr(UserId) + ',' +
                                        stringreplace(floattostr(totvalor), ',', '.', [rfReplaceAll]) + ',' +
                                        quotedstr(inttostr(ExtractYear(data1)) + '.' + inttostr(ExtractMonth(data1)) + '.' + inttostr(ExtractDay(data1))) + ',' +
                                        quotedstr(inttostr(ExtractYear(data2)) + '.' + inttostr(ExtractMonth(data2)) + '.' + inttostr(ExtractDay(data2)))  + ', ' +
                                        stringreplace(floattostr(totvalororig), ',', '.', [rfReplaceAll]) + ', ' +
                                        stringreplace(floattostr(totencargos), ',', '.', [rfReplaceAll])
                                         )) = 0 then
            begin
                Aviso('Erro gerando o Repasse. ');
                Exit;
            end
            else
            begin
                  cdsitens.first;
                  while not cdsItens.eof do
                  begin

                      if (DMConexao.ExecuteProc('LOTEREPASSEITENS_I',
                                                  inttostr(0) + ',' +
                                                  inttostr(cdsItensanuid_id.value) + ',' +
                                                  inttostr(cdsItensparc_id.value) + ',' +
                                                  stringreplace(floattostr(cdsItensvalor_recebimento.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                                  stringreplace(floattostr(cdsItensvalorarepassar.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                                  inttostr(repasse_id)  + ', ' +
                                                  Quotedstr(cdsItenstp_contrib_descricao.value)  + ', ' +
                                                  Quotedstr(cdsItensnossonumero.value)  + ', ' +
                                                  quotedstr(inttostr(ExtractYear(cdsItensdt_credito.value)) + '.' + inttostr(ExtractMonth(cdsItensdt_credito.value)) + '.' + inttostr(ExtractDay(cdsItensdt_credito.value))) + ', ' +
                                                  Quotedstr(cdsItensregistro.value)  + ', ' +
                                                  Quotedstr(cdsItensnome.value)+ ', ' +
                                                  Quotedstr(cdsItenssindicato.value) + ', ' +
                                                  stringreplace(floattostr(cdsItensTOTVALOR.asfloat), ',', '.', [rfReplaceAll])+ ', ' +
                                                  stringreplace(floattostr(cdsItensencargos_pago.asfloat), ',', '.', [rfReplaceAll])
                                                  )) = 0 then
                       begin
                           DMConexao.ExecSQL('delete from LOTEREPASSEITENS where REPASSE_ID = ' + inttostr(repasse_id));
                           DMConexao.ExecSQL('delete from LOTEREPASSE where REPASSE_ID = ' + inttostr(repasse_id));
                           Exit;
                       end;

                      cdsitens.Next;
                  end;
                  cdsitens.first;


            end;

            ImprimirRepasse;
            btlocalizar.click;
        end;
  finally
        frmLoteRepasseDados.free;
  end;


  cdsitens.Filtered:=false;
  cdsitens.Filter:='';
  cdsitens.IndexFieldNames := 'dt_credito';
  cdsitens.GotoBookmark(bm);
  cdsitens.FreeBookmark(bm);
  cdsItens.EnableControls;
  btLocalizar.Click;

end;

procedure TfrmLotesRelatRepasse.FormShow(Sender: TObject);
begin
  inherited;
  edDataIni.date := StrToDate('01/'+ inttostr(ExtractMonth(Dataatual))+'/' + inttostr(ExtractYear(Dataatual)));
  edDataFim.date := Dataatual;

  If sdsLotes.Active = false then
  begin
      sdsLotes.Open;
      sdsLotes.first;
  end;

  cdsAux.Close;
  cdsAux.Open;
  cdsAux.EmptyDataSet;
  cdsAux.Append;
  cdsAux.Edit;
  cdsAuxidlote.Value := sdsLotesIDLOTE.value;
  cbbRepasse.ItemIndex := 0;


end;

procedure TfrmLotesRelatRepasse.btLocalizarClick(Sender: TObject);
var
   i:Integer;
begin
  inherited;
  chkMarc.Visible :=false;
  acGerarPlanilha.Enabled:=False;
  acGerarRepasse.Enabled:=False;
  DMLotes.sdsLotesRepasse.close;
  cdsItens.close;
  DMLotes.sdsLotesRepasse.Filter :='';
  if rbtodos.Checked = True then
  begin
     DMLotes.sdsLotesRepasse.Params.ParamByName('tipo').Value := 1;
     DMLotes.sdsLotesRepasse.Params.ParamByName('dataini').clear;
     DMLotes.sdsLotesRepasse.Params.ParamByName('datafim').clear;
  end
  else
  begin
     DMLotes.sdsLotesRepasse.Params.ParamByName('tipo').Value := 0;
     DMLotes.sdsLotesRepasse.Params.ParamByName('dataini').Value := edDataIni.Date;
     DMLotes.sdsLotesRepasse.Params.ParamByName('datafim').Value := edDataFim.Date;
  end;

  DMLotes.sdsLotesRepasse.Open;

  if cdsAuxidlote.value > 0 then
  begin
      DMLotes.sdsLotesRepasse.Filtered := false;
      DMLotes.sdsLotesRepasse.Filter :='(idlote='+ inttostr(cdsAuxidlote.value)+')';
      DMLotes.sdsLotesRepasse.Filtered := true;
  end;

  if cbbRepasse.ItemIndex > 0 then
  begin
       DMLotes.sdsLotesRepasse.Filtered := false;
      if DMLotes.sdsLotesRepasse.Filter <> '' then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + ' and ';

      if cbbRepasse.ItemIndex = 1 then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + '(datarepasse is not null)'
      else
      if cbbRepasse.ItemIndex = 2 then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + '(datarepasse is null)';
      DMLotes.sdsLotesRepasse.Filtered := true;
  end;

  if cbbSind.ItemIndex > 0 then
  begin
       DMLotes.sdsLotesRepasse.Filtered := false;
      if DMLotes.sdsLotesRepasse.Filter <> '' then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + ' and ';

      if cbbSind.ItemIndex = 1 then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + '(sindicato like ' + QuotedStr('Município%')+')'
      else
      if cbbSind.ItemIndex = 2 then
         DMLotes.sdsLotesRepasse.Filter := DMLotes.sdsLotesRepasse.Filter + '(sindicato like ' + QuotedStr('Estado%')+')';
      DMLotes.sdsLotesRepasse.Filtered := true;
  end;

  If DMLotes.sdsLotesRepasse.RecordCount > 0 then
  begin
      cdsitens.Open;
      cdsitens.EmptyDataSet;
      DMLotes.sdsLotesRepasse.First;
      while not DMLotes.sdsLotesRepasse.eof do
      begin
        cdsitens.Append;
        cdsitens.Edit;
        for i := 0 to DMLotes.sdsLotesRepasse.fields.count - 1 do
          cdsItens.FieldByName(DMLotes.sdsLotesRepasse.fields[i].FieldName).value := DMLotes.sdsLotesRepasse.fieldbyname(DMLotes.sdsLotesRepasse.fields[i].FieldName).value;
        cdsItensselecionado.Value := true;
        cdsitens.Post;
        DMLotes.sdsLotesRepasse.next;
      end;
      cdsitens.IndexFieldNames := 'dt_credito';
      cdsitens.first;
      labtotal.caption := inttostr(dsitens.dataset.RecordCount);

      chkMarc.Visible :=True;
      acGerarPlanilha.Enabled:=true;
      acGerarRepasse.Enabled:=true;
  end;

  DMLotes.sdsLotesRepasse.close;



end;

procedure TfrmLotesRelatRepasse.rbPeriodoClick(Sender: TObject);
begin
  inherited;
  edDataIni.Enabled :=True;
  edDataFim.Enabled :=True;
end;

procedure TfrmLotesRelatRepasse.rbtodosClick(Sender: TObject);
begin
  inherited;
  edDataIni.Enabled :=False;
  edDataFim.Enabled :=False;
end;

procedure TfrmLotesRelatRepasse.FormCreate(Sender: TObject);
begin
  inherited;
   cdsAux.CreateDataSet;
   cdsitens.CreateDataSet;
end;

procedure TfrmLotesRelatRepasse.chkMarcClick(Sender: TObject);
begin
  inherited;
  if cdsitens.Active = true then
    if cdsitens.RecordCount > 0 then
      MarcarTodos(chkMarc.Checked);

end;

procedure TfrmLotesRelatRepasse.MarcarTodos(marc: boolean);
var
  bm: TBookmark;
begin
  bm := cdsitens.GetBookmark;
  cdsitens.DisableControls;
  cdsitens.First;
  while not cdsitens.eof do
  begin
    cdsitens.Edit;
    if cdsitensSelecionado.value = marc then
      cdsitensSelecionado.value := not marc;
    cdsitensSelecionado.value := marc;
    cdsitens.post;
    cdsitens.next;
  end;
  cdsitens.GotoBookmark(bm);
  cdsitens.EnableControls;

end;

procedure TfrmLotesRelatRepasse.actRelatoriorepasseExecute(
  Sender: TObject);
begin
  inherited;
  try application.CreateForm(TfrmRelatRepasseRelats,frmRelatRepasseRelats);
     frmRelatRepasseRelats.showmodal;
  finally
    frmRelatRepasseRelats.free;
  end;
end;

procedure TfrmLotesRelatRepasse.ImprimirRepasse;
var
    i:Integer;
    total, totalpgto:real;
    sdDirectory: TJvSelectDirectory;
    local: string;
begin
   sdDirectory := TJvSelectDirectory.create(nil);
   if sdDirectory.Execute then
      local := sdDirectory.Directory
   else
      exit;

   try
       application.CreateForm(TQrRepasse,QrRepasse);
       QrRepasse.cdsRepasse.CreateDataSet;
       QrRepasse.cdsRepasse.Open;
       cdsItens.first;
       total:=0;
       totalpgto :=0;
       totvalororig := 0;
       totencargos := 0;
       while not cdsitens.Eof do
       begin
          QrRepasse.cdsRepasse.Append;
          QrRepasse.cdsRepasse.Edit;
          QrRepasse.cdsRepasseregistro.value := cdsItensregistro.Value;
          QrRepasse.cdsRepassenome.value := cdsItensnome.Value;
          QrRepasse.cdsRepassedescricao.value := cdsItenstp_contrib_descricao.Value;
          QrRepasse.cdsRepasseguia.value := cdsItensnossonumero.Value;
          QrRepasse.cdsRepassedatacredito.value := cdsItensdt_credito.Value;
          QrRepasse.cdsRepassevalorpago.value := cdsItensvalor_recebimento.Value;
          QrRepasse.cdsRepassevalorrepasse.value := cdsItensvalorarepassar.Value;
          QrRepasse.cdsRepassesindicato.value := cdsItenssindicato.Value;
          QrRepasse.cdsRepassevalororiginal.value := cdsItensTOTVALOR.Value;
          QrRepasse.cdsRepasseencargos.value := cdsItensencargos_pago.Value;
          total := total + cdsItensvalorarepassar.Value;
          totalpgto := totalpgto + cdsItensvalor_recebimento.AsFloat;
          totvalororig := totvalororig + cdsItensTOTVALOR.AsFloat;
          totencargos := totencargos + cdsItensencargos_pago.AsFloat;

          QrRepasse.cdsRepasse.Post;
          cdsitens.Next;
       end;

       if rbtodos.Checked = true then
       begin
           QrRepasse.labPeriodo.Caption := '';
           QrRepasse.QRLabel3.caption := '';
       end
       else
       begin
         if edDataIni.Date = edDataFim.Date then
             QrRepasse.labPeriodo.Caption := DateToStr(edDataIni.date)
         else
             QrRepasse.labPeriodo.Caption := DateToStr(edDataIni.date) + ' a ' + DateToStr(edDataFim.date);
       end;
       QrRepasse.Labtotal.Caption := 'R$ ' + FormatFloat(',0.00', total);
       QrRepasse.labtotalpagto.Caption := 'R$ ' + FormatFloat(',0.00', totalpgto);
       QrRepasse.labTotOriginal.Caption := 'R$ ' + FormatFloat(',0.00', totvalororig);
       QrRepasse.labTotEncargos.Caption := 'R$ ' + FormatFloat(',0.00', totencargos);
       QrRepasse.labDataRepasse.Caption := frmLoteRepasseDados.editDtRepasse.Text;

       QrRepasse.ReportTitle :='Repasse';

      if GeraPDF(QrRepasse, local, 1) = 0 then
      begin
        Aviso('Erro ao gerar PDF de Repasse.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
      end



   finally
       QrRepasse.free;
   end;
end;

procedure TfrmLotesRelatRepasse.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  GeraPlanilha(cdsItens,grid1);
end;

end.
