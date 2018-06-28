unit UnitRelatParcelamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, ActnList, DB, WinSkinData, ExtCtrls, DBClient, Mask, JvToolEdit,
  JvLookup, Provider, SqlExpr, DBLocal, DBLocalS, comObj,ULoteAdicionarRegs,
  UCDefine;

type
  TfrmRelatParcelamentos = class(TModeloComum)
    dsParcels: TDataSource;
    gridParcels: TDBGrid;
    ToolBar1: TToolBar;
    spImprimirEtiq: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    Panel2: TPanel;
    Label6: TLabel;
    btLocalizar: TBitBtn;
    Label4: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    cbFiltro: TComboBox;
    Label1: TLabel;
    comboTipo: TComboBox;
    edMaxAtraso: TEdit;
    UpDown1: TUpDown;
    cbMaxMeses: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    cbUltPagto: TCheckBox;
    edDtUltPag: TMaskEdit;
    Label5: TLabel;
    comboLocalidade: TComboBox;
    Label7: TLabel;
    cbTipoParc1: TComboBox;
    ActionList1: TActionList;
    acEtiqueta: TAction;
    acGerarPlanilha: TAction;
    sdsValorDevido: TSQLClientDataSet;
    spEnviarMala: TSpeedButton;
    acMala: TAction;
    spRecuperacaoCredito: TSpeedButton;
    acLoteadd: TAction;
    cdsResultado: TClientDataSet;
    cdsResultadosituacao: TIntegerField;
    cdsResultadoregistro: TStringField;
    cdsResultadonome: TStringField;
    cdsResultadomotivo: TStringField;
    SaveDialog1: TSaveDialog;
    labconta: TLabel;
    labcontalabel: TLabel;
    sdsVerExisteEmLote: TSQLClientDataSet;
    sdsVerExisteEmLoteQTDE: TIntegerField;
    sdsNumNotificacao: TSQLClientDataSet;
    sdsNumNotificacaoNUMNOTIF: TStringField;
    UCControls1: TUCControls;
    Label8: TLabel;
    Label9: TLabel;
    edData1: TMaskEdit;
    edData2: TMaskEdit;
    cbRecup: TComboBox;
    Label10: TLabel;
    eddatavenc1: TMaskEdit;
    Label11: TLabel;
    eddatavenc2: TMaskEdit;
    Label12: TLabel;
    procedure btLocalizarClick(Sender: TObject);
    procedure gridParcelsTitleClick(Column: TColumn);
    procedure acEtiquetaExecute(Sender: TObject);
    procedure Etiquetas_Envelopes(Query:TClientDataset);
    procedure acGerarPlanilhaExecute(Sender: TObject);
   procedure GeraPlanilhaLoc(Query: tClientDataset; grid:TDbGrid);
    procedure gridParcelsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbFiltroSelect(Sender: TObject);
    procedure cbMaxMesesClick(Sender: TObject);
    procedure cbUltPagtoClick(Sender: TObject);
    procedure gridParcelsDblClick(Sender: TObject);
    procedure acMalaExecute(Sender: TObject);
    procedure Calctotal;
    procedure AnexarArquivosAmala;
    procedure acLoteaddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddnoLote(idLote, ass_id, ano1, ano2: integer; conf: boolean);
    procedure AddResultado(sit: integer; motivo: string);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatParcelamentos: TfrmRelatParcelamentos;
  IdMala, item_id:integer;
  GeraNOtif: integer;
  nomearquivo: string;
  resp: boolean;

implementation

uses UFuncoes, UDmFinancas, UOpcoes_Etiq_Envelop, UEtiquetas, UEnvelopeTipo,
  UNovoAssoc, UDMConexao, UParcelamentoMalaDireta, UDMMalaDireta,
  UqrRelatAddLote, UDmlotes;

{$R *.dfm}

procedure TfrmRelatParcelamentos.btLocalizarClick(Sender: TObject);
begin
  inherited;
   ExibeAguarde('Localizando Dados de Parcelamento...');
   dsParcels.dataset.Close;

   DmFinancas.sdsRelatParcels.close;
   if cbTipoParc1.ItemIndex = 0 then
   begin
     DmFinancas.dspRelatParcels.DataSet := DmFinancas.sdsRelatParcels;
      //DmFinancas.sdsRelatParcels.CommandText:='select *  from proc_relat_parcelamentos(:filtro, :tipo,:MAXMESES,:ULTPAGTO,:reg,:data1, :data2, :emreccredito)';
   end
   else
   begin
      DmFinancas.dspRelatParcels.DataSet := DmFinancas.sdsRelatParcelsNovo;
      //DmFinancas.sdsRelatParcels.CommandText:='select * from proc_relat_parcelamentos_novo(:filtro, :tipo, :maxmeses, :ultpagto, :reg, :data1, :data2, :emreccredito)';
   end;

   DmFinancas.cdsRelatParcels.FetchParams;
   TClientDataset(dsParcels.dataset).Params.ParamByName('filtro').value := cbFiltro.itemindex;
   TClientDataset(dsParcels.dataset).Params.ParamByName('tipo').value := comboTipo.itemindex+1;
   TClientDataset(dsParcels.dataset).Params.ParamByName('reg').value := comboLocalidade.ItemIndex;
   if cbMaxMeses.Checked = true then
      TClientDataset(dsParcels.dataset).Params.ParamByName('maxmeses').value := UpDown1.Position
   else
      TClientDataset(dsParcels.dataset).Params.ParamByName('maxmeses').value := 0;

   if cbUltPagto.Checked = true then
      TClientDataset(dsParcels.dataset).Params.ParamByName('ULTPAGTO').value := strtodate(edDtUltPag.Text)
   else
      TClientDataset(dsParcels.dataset).Params.ParamByName('ULTPAGTO').value := '01/01/1899';

   TClientDataset(dsParcels.dataset).Params.ParamByName('data1').value := strtodate(edData1.Text);
   TClientDataset(dsParcels.dataset).Params.ParamByName('data2').value := strtodate(edData2.Text);

   TClientDataset(dsParcels.dataset).Params.ParamByName('emreccredito').value := cbRecup.ItemIndex;

   if eddatavenc1.Text<>'  /  /    ' then
       TClientDataset(dsParcels.dataset).Params.ParamByName('DATAVENC1').value := StrTodate(eddatavenc1.Text);

   if eddatavenc2.Text<>'  /  /    ' then
       TClientDataset(dsParcels.dataset).Params.ParamByName('DATAVENC2').value := StrTodate(eddatavenc2.Text);

   TClientDataset(dsParcels.dataset).Open;
   Calctotal;
   EscondeAguarde;

end;

procedure TfrmRelatParcelamentos.gridParcelsTitleClick(Column: TColumn);
begin
  inherited;
  TClientDataset(dsParcels.dataset).IndexFieldNames :=  Column.FieldName;
end;

procedure TfrmRelatParcelamentos.acEtiquetaExecute(Sender: TObject);
begin
  inherited;
  If dsParcels.dataset.Active=true then
     if dsParcels.DataSet.RecordCount > 0 then
        Etiquetas_Envelopes(TClientDataset(dsParcels.dataset));
end;

procedure TfrmRelatParcelamentos.Etiquetas_Envelopes(
  Query: TClientDataset);
begin
     Try application.createform(TFrmOpcoes_Etiq_Env,FrmOpcoes_Etiq_Env);
     if FrmOpcoes_Etiq_Env.showmodal = mrok then
     begin
       If FrmOpcoes_Etiq_Env.radEtiqueta.Checked = true then
       begin
           try  application.createform(TfrmEtiqueta,frmEtiqueta);
           frmEtiqueta.Dados.Open;
           Query.DisableControls;
           Query.first;
           while not Query.eof do
           begin
                If (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                begin
                    frmEtiqueta.Dados.Append;
                    frmEtiqueta.Dados.Edit;
                    IF Query.fieldbyname('registro').value <> NULL  THEN
                       frmEtiqueta.DadosREGISTRO.value := StringReplace (Query.fieldbyname('registro').Value,'/','', [rfReplaceAll]);
                    IF Query.fieldbyname('end_bairro').value <> NULL  THEN
                       frmEtiqueta.Dadosbairro.value := Query.fieldbyname('end_bairro').value;
                    IF Query.fieldbyname('end_Complemento').value <> NULL  THEN
                       frmEtiqueta.Dadoscomplemento.value := Query.fieldbyname('end_complemento').value;

                    if length(Query.fieldbyname('end_CEP').value)=8 then
                       frmEtiqueta.Dadoscep.value := copy(Query.fieldbyname('end_CEP').value,1,2)+'.'+copy(Query.fieldbyname('end_CEP').value,3,3)+ '-'+copy(Query.fieldbyname('end_CEP').value,6,3)
                    else
                    begin
                       IF Query.fieldbyname('end_cep').value <> NULL  THEN
                          frmEtiqueta.Dadoscep.value := Query.fieldbyname('end_cep').value;
                    end;

                    IF Query.fieldbyname('cidade_nome').value <> NULL THEN
                       frmEtiqueta.Dadoscidade.value := Query.fieldbyname('cidade_nome').value;

                    IF Query.fieldbyname('end_logradouro').value <> NULL  THEN
                        frmEtiqueta.Dadosendereco.value := Query.fieldbyname('end_logradouro').value;

                    IF Query.fieldbyname('end_numero').value <> NULL  THEN
                        frmEtiqueta.Dadosendereco.value := frmEtiqueta.Dadosendereco.value +', ' + Query.fieldbyname('end_numero').value;

                    IF Query.fieldbyname('estado_nome').value <> NULL THEN
                        frmEtiqueta.Dadosestado.value := Query.fieldbyname('estado_nome').value;
                    IF Query.fieldbyname('nome').value <> NULL THEN
                        frmEtiqueta.Dadosnome.value := Query.fieldbyname('nome').value;
                    frmEtiqueta.Dados.post;
                End;
              Query.Next;
           end;
           Query.first;
           Query.EnableControls;
           frmEtiqueta.ShowModal;
           finally
           frmEtiqueta.free;
           end;
           Aviso('Etiquetas geradas com sucesso. ');
       end
       else
       If FrmOpcoes_Etiq_Env.radEnvelope.Checked = true then
       begin
             try Application.createform(TfrmEnvelopeTipo,frmEnvelopeTipo);
             If frmEnvelopeTipo.showmodal = mrok then
             begin
                 FrmOpcoes_Etiq_Env.Dados.Open;
                 Query.DisableControls;
                 Query.first;
                 while not Query.eof do
                 begin
                   If (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                   begin
                        FrmOpcoes_Etiq_Env.Dados.Append;
                        FrmOpcoes_Etiq_Env.Dados.Edit;
                        if Query.fieldbyname('REGISTRO').value <>'/' then
                           FrmOpcoes_Etiq_Env.DadosREGISTRO.value := StringReplace (Query.fieldbyname('registro').Value,'/','', [rfReplaceAll]);
                        FrmOpcoes_Etiq_Env.Dadosbairro.value := Query.fieldbyname('end_BAIRRO').value;
                        if length(Query.fieldbyname('end_CEP').value)=8 then
                           FrmOpcoes_Etiq_Env.Dadoscep.value := copy(Query.fieldbyname('end_CEP').value,1,2)+'.'+copy(Query.fieldbyname('end_CEP').value,3,3)+ '-'+copy(Query.fieldbyname('end_CEP').value,6,3)
                        else
                           FrmOpcoes_Etiq_Env.Dadoscep.value := Query.fieldbyname('end_CEP').value;

                        FrmOpcoes_Etiq_Env.Dadoscidade.value := Query.fieldbyname('CIDADE_nome').value;
                        FrmOpcoes_Etiq_Env.Dadoscomplemento.value := Query.fieldbyname('end_COMPLEMENTO').value;
                        FrmOpcoes_Etiq_Env.Dadosendereco.value := Query.fieldbyname('end_logradouro').value;
                        IF Query.fieldbyname('end_numero').value <> NULL  THEN
                        FrmOpcoes_Etiq_Env.Dadosendereco.value := FrmOpcoes_Etiq_Env.Dadosendereco.value +', ' + Query.fieldbyname('end_numero').value;

                        FrmOpcoes_Etiq_Env.Dadosestado.value := Query.fieldbyname('ESTADO_nome').value;
                        FrmOpcoes_Etiq_Env.Dadosnome.value := Query.fieldbyname('NOME').value;
                        FrmOpcoes_Etiq_Env.Dados.post;
                   End;
                   Query.Next;
                 end;
                 Query.first;
                 Query.EnableControls;

                 If frmEnvelopeTipo.radMedio.checked =  true then
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(1) //Medio
                 else
                 If frmEnvelopeTipo.radOficio.checked =  true then
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(2) //Oficio
                 else
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(3); //A4
             end;
             Finally
              frmEnvelopeTipo.free;
             end;
             Aviso('Envelopes gerados com sucesso. ');
       end;
     end;
     finally
     FrmOpcoes_Etiq_Env.free;
     end;

end;

procedure TfrmRelatParcelamentos.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsParcels.dataset.Active=true then
     if dsParcels.DataSet.RecordCount > 0 then
        GeraPlanilhaLoc(TClientDataset(dsParcels.dataset), gridParcels);

end;

procedure TfrmRelatParcelamentos.gridParcelsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
  begin
    Tdbgrid(sender).Canvas.Brush.color := clwindow;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    Tdbgrid(sender).Canvas.Brush.Color := $00FFCECE;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if gdselected in State then
  begin
    Tdbgrid(sender).Canvas.Brush.Color := clNavy;
    Tdbgrid(sender).Canvas.Font.Color := clwhite;
    Tdbgrid(sender).Canvas.FillRect(Rect);
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TfrmRelatParcelamentos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatParcelamentos.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  If cbFiltro.ItemIndex = 6 then
  begin
      cbMaxMeses.Enabled := true;
      cbUltPagto.Enabled := true;
      eddatavenc1.Enabled:=True;
      eddatavenc2.Enabled:=True;
      gridParcels.Columns[5].Visible:=True;
  end
  else
  If cbFiltro.ItemIndex in [4,5] then
  begin
      cbMaxMeses.Enabled := true;
      cbUltPagto.Enabled := true;
      eddatavenc1.Enabled:=True;
      eddatavenc2.Enabled:=True;
      gridParcels.Columns[5].Visible:=True;
  end
  else
  begin
      cbMaxMeses.Checked := false;
      cbMaxMeses.Enabled := false;
      cbUltPagto.Checked := false;
      cbUltPagto.Enabled := false;
      UpDown1.Position :=1;
      edMaxAtraso.text:='1';
      edMaxAtraso.Enabled := false;
      UpDown1.Enabled := false;
      edDtUltPag.Clear;
      edDtUltPag.Enabled := false;
      eddatavenc1.Enabled:=false;
      eddatavenc2.Enabled:=false;
      gridParcels.Columns[5].Visible:=false;


  end;
end;

procedure TfrmRelatParcelamentos.cbMaxMesesClick(Sender: TObject);
begin
  inherited;
   If cbMaxMeses.Checked = true then
   begin
      edMaxAtraso.Enabled := true;
      UpDown1.Enabled := true;
      edMaxAtraso.SetFocus;
   end
   else
   begin
      edMaxAtraso.Enabled := false;
      UpDown1.Enabled := false;
      UpDown1.Position:=1;
   end;

end;

procedure TfrmRelatParcelamentos.cbUltPagtoClick(Sender: TObject);
begin
  inherited;
   If cbUltPagto.Checked = true then
   begin
      edDtUltPag.Enabled:=true;
      edDtUltPag.setfocus;
   end
   else
   begin
      edDtUltPag.clear;
      edDtUltPag.Enabled:=false;
   end;
end;

procedure TfrmRelatParcelamentos.gridParcelsDblClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovoAssoc,frmNovoAssoc);
  frmNovoAssoc.RefreshAll(DmFinancas.cdsRelatParcelsass_id.value);
  frmNovoAssoc.Caption:='Dados de ' +DmFinancas.cdsRelatParcelsNOME.value;
  frmNovoAssoc.showmodal;
  finally
  frmNovoAssoc.free;
  end;

end;

procedure TfrmRelatParcelamentos.GeraPlanilhaLoc(Query: tClientDataset;
  grid: TDbGrid);
var
  Excel: Variant;
  Linha, i: Integer;
begin
  if not Query.IsEmpty then
  begin
    try
        ExibeAguarde('Gerando Planilha, Aguarde...');
        Query.DisableControls;
        Query.First;

        Excel := CreateOleObject('Excel.Application');

        Excel.Workbooks.Add();

        linha := 1;
        for i:= 0 to Grid.Columns.Count - 1do
        begin
          if (grid.Columns[i].Visible = true)  then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := grid.Columns[i].Title.Caption;
        end;

        If cbfiltro.ItemIndex in [4,6] then
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := 'Total Devido (C/Encargos)';

        linha := linha +1;

        while not Query.Eof do
        begin
           for i:= 0 to Grid.Columns.Count-1 do
           begin
                  if (grid.Columns[i].Visible = true) then
                  begin
                        If grid.DataSource.DataSet.Fieldbyname(grid.Columns[i].fieldname) is tfmtbcdfield then
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat  := 'R$ #.##0,00_);(R$ #.##0,00)';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=grid.Columns.Items[i].Field.asfloat//formatfloat(',0.00',dbgrid.Columns.Items[i-1].Field.Value)
                        end
                        else
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat :=  '@';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=  grid.Columns.Items[i].Field.AsString;
                        end;
                  end;
           end;
           If cbfiltro.ItemIndex in [4,6] then
           begin

                sdsValorDevido.close;
                sdsValorDevido.commandtext :=' select  sum(p.total) total from   proc_debitos('+ inttostr(DmFinancas.cdsRelatParcels.fieldbyname('ass_id').value)+',';
                if cbTipoParc1.ItemIndex= 0 then //Antigo
                   sdsValorDevido.commandtext := sdsValorDevido.commandtext + QuotedStr('P') + ','+ quotedStr(FormatDateTime('yyyy.mm.dd',(Dataatual))) +') p  where exists ( select 1 from parcelas pa where pa.parc_id = p.parc_id and pa.parcel_id=' + inttostr(DmFinancas.cdsRelatParcels.fieldbyname('parcel_id').value)+')'
                else
                   sdsValorDevido.commandtext := sdsValorDevido.commandtext + QuotedStr('A') + ','+ quotedStr(FormatDateTime('yyyy.mm.dd',(Dataatual))) +') p  where exists ( select 1 from parcel_anuidades pa where pa.anuid_id = p.anuid_id and pa.parcel_id=' + inttostr(DmFinancas.cdsRelatParcels.fieldbyname('parcel_id').value)+')';

                sdsValorDevido.Open;

                Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat  := 'R$ #.##0,00_);(R$ #.##0,00)';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=sdsvalordevido.fieldbyname('total').asfloat;

           end;
           Linha := Linha + 1;
           Query.Next;
        end;
        Query.first;

        Query.EnableControls;
        EscondeAguarde;
        Aviso('Planilha gerada com sucesso. ');
        Excel.Visible := True;
        excel.columns.AutoFit;
     except
       excel.Free;
     end;
  end;

end;

procedure TfrmRelatParcelamentos.acMalaExecute(Sender: TObject);
begin
  inherited;
  If dsParcels.DataSet.RecordCount > 0 then
  begin
      try application.createform(TfrmParcelamentoMalaDireta,frmParcelamentoMalaDireta);
      If frmParcelamentoMalaDireta.showmodal = mrok then
      begin
         IdMala := frmParcelamentoMalaDireta.sdsMalasMALA_ID.value;

          dsParcels.DataSet.Filtered:=false;
          dsParcels.DataSet.filter :='email<>''''';
          dsParcels.DataSet.filtered :=true;
          Calctotal;
          dsParcels.DataSet.first;
          while not dsParcels.DataSet.eof do
          begin
              AnexarArquivosAmala;

              dsParcels.DataSet.next;
          end;
      end
      else
        abort;

      Aviso('Foram encaminhados para Mala Direta ' + labtotal.caption + ' filiado(s). ');
      dsParcels.DataSet.Filtered:=false;
      dsParcels.DataSet.filter :='';
      dsParcels.DataSet.filtered :=true;
      finally
      frmParcelamentoMalaDireta.free;
      end;

  end;
end;

procedure TfrmRelatParcelamentos.Calctotal;
begin
    labtotal.Caption:= inttostr(TClientDataset(dsParcels.dataset).recordcount);
end;

procedure TfrmRelatParcelamentos.AnexarArquivosAmala;
var
  tipopessoa:integer;
begin
      DMMalaDireta.sdsMalaItemID.close;
      DMMalaDireta.sdsMalaItemID.open;
      item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;

      DMMalaDireta.PROC_MALADIRETAITEM_I.close;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsParcels.DataSet.fieldbyname('email').value;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value :=0;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value :=  dsParcels.DataSet.fieldbyname('ass_id').value;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value :=  dsParcels.DataSet.fieldbyname('nome').value;
      If dsParcels.DataSet.fieldbyname('tp_pessoa').value = 'Pessoa Física' then
         tipopessoa := 2
      else
      If dsParcels.DataSet.fieldbyname('tp_pessoa').value = 'Pessoa Jurídica' then
         tipopessoa := 1;

      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := tipopessoa;
      DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

      frmParcelamentoMalaDireta.cdsArquivosAnexo.first;
      while not frmParcelamentoMalaDireta.cdsArquivosAnexo.eof do
      begin
          If not FileExists(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value)) then
              CopyFile(PChar(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value), PChar(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value)), false);

         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value :=  dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value);
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value :=  item_id;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

         DMConexao.Log('Enviado para Mala Direta: ' + inttostr(idmala)+ ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value), 'O', dsParcels.DataSet.FieldByName('ass_id').value);

         frmParcelamentoMalaDireta.cdsArquivosAnexo.next;
      end;
      frmParcelamentoMalaDireta.cdsArquivosAnexo.first;

end;

procedure TfrmRelatParcelamentos.acLoteaddExecute(Sender: TObject);
var
    idLote, ano1, ano2, cont: integer;
    nomeLote: string;
    totSim, Totnao: integer;

begin
    inherited;

    if comboTipo.ItemIndex > 0 then
    begin
        Aviso('Relatório com filtro de Confederativa não pode ser adicionado a um Lote. ');
        Exit;
    end;
    
    cdsResultado.EmptyDataSet;

    if dsParcels.dataset.Active = false then
        Exit;

    if dsParcels.DataSet.RecordCount = 0 then
        Exit;

    try application.createform(TfrmLoteAdicionarRegs, frmLoteAdicionarRegs);
        tplote:='P';
        frmLoteAdicionarRegs.editLote.text := Dmlotes.NovoNumLote(tplote);
        if frmLoteAdicionarRegs.showmodal = mrok then
        begin
            idLote := frmLoteAdicionarRegs.cdsAuxidlote.value;
            nomeLote := frmLoteAdicionarRegs.cdsAuxnomelote.value;
            ano1 := strtoint(frmLoteAdicionarRegs.editAno1.text);
            ano2 := strtoint(frmLoteAdicionarRegs.editAno2.text);

            GeraNOtif := 0;
         {   if frmLoteAdicionarRegs.cbGeraNotificacoes.checked = true then
                GeraNOtif := 1;

            if GeraNOtif = 1 then
            begin
                SaveDialog1.FileName := 'Notitif';
                if SaveDialog1.Execute then
                    nomearquivo := SaveDialog1.FileName
                else
                    exit;

                resp := Confirma('Deseja imprimir as notificações agora?');
            end;

          }
            ExibeAguarde('Adicionando Cadastros no Lote "' + DMLotes.cdsLocLotesNOMELOTE.value + '". Por favor, aguarde...');
            cont :=0;
            dsParcels.DataSet.DisableControls;
            dsParcels.DataSet.First;
            while not dsParcels.DataSet.eof do
            begin
                cont := cont + 1;
                labcontalabel.Visible:=true;
                labconta.Visible:=true;
                labconta.Caption :=inttostr(cont)+ ' de ' + labtotal.caption;
                Application.ProcessMessages;

                sdsVerExisteEmLote.close;
                sdsVerExisteEmLote.Params.ParamByName('ass_id').value := dsParcels.DataSet.FieldByName('ass_id').value;
                sdsVerExisteEmLote.open;
                if sdsVerExisteEmLoteQTDE.value > 0 then
                    AddResultado(0, 'Cadastro já existente em outro Lote não finalizado. ')
                else
                begin
                    AddnoLote(idlote, dsParcels.DataSet.FieldByName('ass_id').value, ano1, ano2, frmLoteAdicionarRegs.cbConfeds.Checked);

                end;
                dsParcels.DataSet.next;
            end;
            EscondeAguarde;
            dsParcels.DataSet.EnableControls;
            dsParcels.DataSet.First;
            labcontalabel.Visible:= false;
            labconta.Visible:= false;

            cdsResultado.Filtered := false;
            cdsResultado.Filter := 'situacao=1';
            cdsResultado.Filtered := true;
            totSim := cdsResultado.recordcount;
            cdsResultado.Filtered := false;
            cdsResultado.Filter := 'situacao=0';
            cdsResultado.Filtered := true;
            totnao := cdsResultado.recordcount;
            cdsResultado.Filtered := false;
            cdsResultado.Filter := '';

            Aviso('Operação Finalizada' + #13 + 'Total de Incluídos: ' + inttostr(totSim) + #13 + 'Total de Não Incluídos: ' + inttostr(Totnao));

            if frmLoteAdicionarRegs.cbIncluidos.checked = true then
            begin
                try Application.createform(TqrRelatAddLote, qrRelatAddLote);
                    qrRelatAddLote.DataSet := cdsResultado;
                    qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                    qrRelatAddLote.txtnome.DataSet := cdsResultado;
                    qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                    qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Incluídos no Lote "' + nomeLote + '"';
                    cdsResultado.Filtered := false;
                    cdsResultado.Filter := 'situacao=1';
                    cdsResultado.Filtered := true;
                    if cdsResultado.RecordCount = 0 then
                        Aviso('Não há cadastros na listagem de incluídos no Lote. ')
                    else

                        qrRelatAddLote.preview;
                finally
                    qrRelatAddLote.free;
                end;
            end;

            if frmLoteAdicionarRegs.cbNaoIncluidos.checked = true then
            begin
                try Application.createform(TqrRelatAddLote, qrRelatAddLote);
                    qrRelatAddLote.DataSet := cdsResultado;
                    qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                    qrRelatAddLote.txtnome.DataSet := cdsResultado;
                    qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                    qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Não incluídos no Lote "' + nomeLote + '"';
                    cdsResultado.Filtered := false;
                    cdsResultado.Filter := 'situacao=0';
                    cdsResultado.Filtered := true;
                    if cdsResultado.RecordCount = 0 then
                        Aviso('Não há cadastros na listagem de não incluídos no Lote. ')
                    else
                        qrRelatAddLote.preview;
                finally
                    qrRelatAddLote.free;
                end;
            end;
            cdsResultado.Filtered := false;
            cdsResultado.Filter := '';
        end;
    finally
        frmLoteAdicionarRegs.free;
    end;
end;

procedure TfrmRelatParcelamentos.FormCreate(Sender: TObject);
begin
  inherited;
  cdsResultado.CreateDataSet;
end;

procedure TfrmRelatParcelamentos.AddnoLote(idLote, ass_id, ano1,
  ano2: integer; conf: boolean);
var
    iditem: integer;
    situacao: string;
    arquivo, pastadestino: string;
    winword, docs, doc: Variant;

begin
    Dmlotes.cdsContribs.close;
    Dmlotes.cdsContribs.Params.ParamByName('ass_id').value := ass_id;
    Dmlotes.cdsContribs.Params.ParamByName('dataatual').value := DataAtual;
    Dmlotes.cdsContribs.Params.ParamByName('ano1').value := ano1;
    Dmlotes.cdsContribs.Params.ParamByName('ano2').value := ano2;
    Dmlotes.cdsContribs.open;

    Dmlotes.cdsContribs.Filtered := false;
    Dmlotes.cdsContribs.Filter := 'tpcontrib_id=1'; //limitando o teste somente se tiver sindical
    Dmlotes.cdsContribs.Filtered := true;

    if Dmlotes.cdsContribs.RecordCount = 0 then
    begin
        AddResultado(0, 'Não tem contribuição sindical em aberto no período especificado. ');
        exit;
    end;

    Dmlotes.cdsContribs.Filtered := false;
    Dmlotes.cdsContribs.Filter := '';

    iditem := DMConexao.GeraAutoNumber('GEN_LOTEITENS_ID', 1);
    if (DMConexao.ExecuteProc('PROC_LOTEITENS_I',
        inttostr(iditem) + ',' +
        inttostr(idLote) + ',' +
        inttostr(ass_id) + ',' +
        quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
        inttostr(UserId))) = 0 then
    begin
        AddResultado(0, 'Erro de integridade, ao adicionar o Cadastro no Lote. ');
        exit;
    end
    else
    begin
        Dmlotes.cdsContribs.first;
        while not Dmlotes.cdsContribs.eof do
        begin

            if (conf = true) or (dmlotes.cdsContribsTPCONTRIB_ID.Value = 1) then
            begin
                if (DMConexao.ExecuteProc('PROC_LOTEITENSCONTRIBS_I',
                    inttostr(0) + ',' +
                    inttostr(iditem) + ',' +
                    inttostr(Dmlotes.cdsContribsANUID_ID.value) + ',' +
                    quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                    inttostr(UserId) + ',' +
                    stringreplace(floattostr(Dmlotes.cdsContribsVALOR.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                    stringreplace(floattostr(Dmlotes.cdsContribsMULTA.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                    stringreplace(floattostr(Dmlotes.cdsContribsJUROS.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                    stringreplace(floattostr(Dmlotes.cdsContribsCORRECAO.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                    stringreplace(floattostr(Dmlotes.cdsContribsTOTAL.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                    quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                    inttostr(UserId) + ',' +
                    inttostr(Dmlotes.cdsContribsANO.value) + ',' +
                    quotedstr(inttostr(ExtractYear(Dmlotes.cdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractMonth(Dmlotes.cdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractDay(Dmlotes.cdsContribsVENCIMENTO.value)))
                    )) = 0 then
                begin

                    try
                        DMConexao.ExecSQL('delete from lotecontribstatus s where s.idlotecontribstatus in (select s.idlotecontribstatus from lotecontribstatus s inner join loteitenscontribs c on c.idloteitemcontrib = s.idloteitemcontrib  where c.idloteitem = ' + inttostr(iditem) + ')');
                        DMConexao.ExecSQL('delete from loteitenscontribs where idloteitem = ' + inttostr(iditem));
                        DMConexao.ExecSQL('delete from LOTEITEMSTATUS where idloteitem = ' + inttostr(iditem));
                        DMConexao.ExecSQL('delete from loteitens where idloteitem = ' + inttostr(iditem));
                        AddResultado(0, 'Erro na inclusão da contribuição de ' + inttostr(Dmlotes.cdsContribsANO.value) + '. ');
                    except
                        AddResultado(0, 'Erro ao estornar o Cadastro do Lote. Erro na inclusão da contribuição de ' + inttostr(Dmlotes.cdsContribsANO.value) + #13 + 'Contate o administrador. ');
                    end;
                    exit;
                end;
            end;
            Dmlotes.cdsContribs.next;
        end;
        AddResultado(1, 'Adicionado ao Lote com sucesso. ');

        //Gerando Notificacao
        if GeraNOtif = 1 then
        begin

            arquivo := ExtractFilePath(Application.ExeName) + 'docs\notificacao.doc';

            //   pastadestino := ExtractFilePath(nomearquivo);


            try

                WinWord := CreateOleObject('Word.Application');

                Docs := WinWord.Documents;
                Doc := Docs.Open(arquivo);

                sdsNumNotificacao.open;
                Doc.Content.Find.Execute(FindText := '<#numnotificaco#>', replacewith := sdsNumNotificacaoNUMNOTIF.value);
                sdsNumNotificacao.close;
                Doc.Content.Find.Execute(FindText := '<#nome#>', replacewith := dsParcels.DataSet.fieldbyname('nome').value);
                Doc.Content.Find.Execute(FindText := '<#dataextenso#>', replacewith := FormatDateTime('"' + 'Rio de Janeiro' + ', "dd "de" mmmm "de" yyyy', DataAtual) + '.');

                Doc.saveas(nomearquivo + '_' + inttostr(dsParcels.DataSet.fieldbyname('ass_id').value) + '_' + stringreplace(dsParcels.DataSet.fieldbyname('registro').value, '/', '', [rfreplaceall]) + '_' + Stringreplace(Stringreplace(datetostr(dataatual), '/', '', [rfreplaceall]), '.', '', [rfreplaceall]) + '.doc');

                if resp = true then
                    Doc.Printout;
                Winword.ActiveDocument.Close(0);

                //Timer1.Enabled := true;

                if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I',
                    inttostr(0) + ',' +
                    inttostr(iditem) + ',' +
                    inttostr(6) + ',' +
                    quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                    inttostr(UserId))) = 0 then
                begin
                    Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + dsparcels.DataSet.fieldbyname('registro').value);
                end;

            except
                WinWord.quit;
                Aviso('Erro ao gerar a Notificação para o Cadastro nº ' + dsparcels.DataSet.fieldbyname('registro').value);
            end;
        end;
    end;

end;

procedure TfrmRelatParcelamentos.AddResultado(sit: integer;
  motivo: string);
begin
    cdsResultado.Append;
    cdsResultado.Edit;
    cdsResultadosituacao.value := sit;
    cdsResultadoregistro.value := dsParcels.DataSet.fieldbyname('registro').value;
    cdsResultadonome.value := dsParcels.DataSet.fieldbyname('nome').value;
    cdsResultadomotivo.value := motivo;
    cdsResultado.Post;

end;

procedure TfrmRelatParcelamentos.FormShow(Sender: TObject);
begin
  inherited;
  edData1.Text := '01/01/2000';
  edData2.Text := DateToStr(DataAtual);
end;

end.
