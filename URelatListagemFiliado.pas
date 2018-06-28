unit URelatListagemFiliado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Mask,
  JvToolEdit, JvLookup, Buttons, ToolWin, ComCtrls, Grids, DBGrids,
  ActnList, DB, dbClient;

type
  TfrmRelatListagemFiliado = class(TModeloComum)
    dsListagem: TDataSource;
    ActionList1: TActionList;
    acEtiqueta: TAction;
    acGerarPlanilha: TAction;
    ToolBar1: TToolBar;
    spImprimirEtiq: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label6: TLabel;
    btLocalizar: TBitBtn;
    cbTipoContrib: TComboBox;
    lkpLocalidade: TJvLookupEdit;
    Label4: TLabel;
    cbSituacao: TComboBox;
    Label2: TLabel;
    cbFiltro: TComboBox;
    labDataFiltro: TLabel;
    edAnoFiltro: TMaskEdit;
    gridCobranca: TDBGrid;
    Label3: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eddataini: TDateTimePicker;
    eddatafim: TDateTimePicker;
    cbTel: TCheckBox;
    cbemail: TCheckBox;
    spEnviarMala: TSpeedButton;
    acMalaDireta: TAction;
    procedure btLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridCobrancaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cbFiltroSelect(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure acEtiquetaExecute(Sender: TObject);
    procedure Etiquetas_Envelopes(Query:TClientDataset);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure gridCobrancaDblClick(Sender: TObject);
    procedure gridCobrancaTitleClick(Column: TColumn);
    procedure AplicaFiltros;
    procedure cbTelClick(Sender: TObject);
    procedure cbemailClick(Sender: TObject);
    procedure acMalaDiretaExecute(Sender: TObject);
    procedure AnexarArquivosAmala;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatListagemFiliado: TfrmRelatListagemFiliado;
  IdMala, item_id:integer;

implementation

uses UDMAssociado, UFuncoes, UDMConexao, UOpcoes_Etiq_Envelop, UEtiquetas,
  UEnvelopeTipo, UNovoAssoc, UDmFinancas, UParcelamentoMalaDireta,
  UDMMalaDireta;

{$R *.dfm}

procedure TfrmRelatListagemFiliado.btLocalizarClick(Sender: TObject);
var
   i:integer;
begin
   DmAssociado.cdsRelatFiliados.close;
   labtotal.caption:='0';
   Application.ProcessMessages;
   If cbFiltro.ItemIndex > 0 then
   begin
     try
       strtoint(edAnoFiltro.Text);
     except
       erro('Digite o ano corretamente. ');
       abort;
     end;
   end;

   If not (DMAssociado.dsEmp_Regiao.DataSet.locate('regiao',lkpLocalidade.text, [] )) then
   begin
     erro('Digite a localidade corretamente. ');
     abort;
   end;

   ExibeAguarde('Gerando Relação de Filiados...');

   dsListagem.dataset.Close;

   for i := 0 to TClientDataset(dsListagem.dataset).Params.Count -1 do
       TClientDataset(dsListagem.dataset).Params[i].clear;

   //Localidade
   TClientDataset(dsListagem.dataset).Params.ParamByName('EMP_ID_PAR').value :=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;

   // Tipo de Cobranca
   TClientDataset(dsListagem.dataset).Params.ParamByName('TIPOCONTRIBPAR').value := cbTipoContrib.ItemIndex;

   // Situação de Filiado
   TClientDataset(dsListagem.dataset).Params.ParamByName('TP_STATUS_ID_PAR').value := cbSituacao.ItemIndex;

   // Filtro
   TClientDataset(dsListagem.dataset).Params.ParamByName('FILTRO').value := cbFiltro.ItemIndex;
   if cbFiltro.ItemIndex > 0 then
       TClientDataset(dsListagem.dataset).Params.ParamByName('ANOFILTRO').value := strtoint(edAnoFiltro.text);

   TClientDataset(dsListagem.dataset).Params.ParamByName('datatual').value :=DataAtual;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATACADINI').value :=eddataini.date;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATACADFIM').value :=eddatafim.date;

   TClientDataset(dsListagem.dataset).Open;

   AplicaFiltros;


   DmAssociado.cdsRelatFiliados.IndexFieldNames :=  'registro';

   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);

   EscondeAguarde;
end;

procedure TfrmRelatListagemFiliado.FormShow(Sender: TObject);
begin
  inherited;
  DMAssociado.dsEmp_Regiao.dataset.close;
  DMAssociado.dsEmp_Regiao.dataset.open;
  DMAssociado.dsEmp_Regiao.dataset.first;
  lkpLocalidade.Text:=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('Regiao').value;
  dsListagem.DataSet.close;
  eddataini.date :=  IncDay( DataAtual, -1 * (ExtractDay(DataAtual)-1));
  eddatafim.date := DataAtual;

end;

procedure TfrmRelatListagemFiliado.gridCobrancaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmRelatListagemFiliado.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  If cbFiltro.ItemIndex > 0 then
  begin
     edAnoFiltro.Enabled := true;
     cbTipoContrib.Enabled := true;
  end
  else
  begin
     edAnoFiltro.clear;
     edAnoFiltro.Enabled := false;
     cbTipoContrib.ItemIndex:=0;
     cbTipoContrib.Enabled := false;
  end

end;

procedure TfrmRelatListagemFiliado.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatListagemFiliado.acEtiquetaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        Etiquetas_Envelopes(TClientDataset(dsListagem.dataset));

end;

procedure TfrmRelatListagemFiliado.Etiquetas_Envelopes(
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
       end;
     end;
     finally
     FrmOpcoes_Etiq_Env.free;
     end;


end;

procedure TfrmRelatListagemFiliado.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsListagem.dataset), gridCobranca);

end;

procedure TfrmRelatListagemFiliado.gridCobrancaDblClick(Sender: TObject);
begin
  inherited;
Try Application.CreateForm(TfrmNovoAssoc,frmNovoAssoc);
  frmNovoAssoc.RefreshAll(DmAssociado.cdsRelatFiliadosASS_ID.value);
  frmNovoAssoc.Caption:='Dados de ' +DmFinancas.cdsRelatInadimplenteNOME.value;
  frmNovoAssoc.showmodal;
  finally
  frmNovoAssoc.free;
  end;

end;

procedure TfrmRelatListagemFiliado.gridCobrancaTitleClick(Column: TColumn);
begin
  inherited;
  DmAssociado.cdsRelatFiliados.IndexFieldNames :=  Column.FieldName;
  DmAssociado.cdsRelatFiliados.First;
end;

procedure TfrmRelatListagemFiliado.AplicaFiltros;
begin
   TClientDataset(dsListagem.dataset).filtered := false;
   TClientDataset(dsListagem.dataset).filter:='';
   If cbTel.Checked = true then
   begin
      TClientDataset(dsListagem.dataset).filtered := false;
      TClientDataset(dsListagem.dataset).filter:= '(TELS <>'''')';
   end;
   If cbemail.Checked = true then
   begin
      TClientDataset(dsListagem.dataset).filtered := false;
      If TClientDataset(dsListagem.dataset).filter ='' then
          TClientDataset(dsListagem.dataset).filter:= '(EMAIL <>'''')'
      else
          TClientDataset(dsListagem.dataset).filter:= TClientDataset(dsListagem.dataset).filter + ' and ' + '(EMAIL <>'''')';
   end;
    TClientDataset(dsListagem.dataset).filtered := true;
   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);
end;

procedure TfrmRelatListagemFiliado.cbTelClick(Sender: TObject);
begin
  inherited;
  If TClientDataset(dsListagem.dataset).ACTIVE = TRUE THEN
     AplicaFiltros;
end;

procedure TfrmRelatListagemFiliado.cbemailClick(Sender: TObject);
begin
  inherited;
  If TClientDataset(dsListagem.dataset).ACTIVE = TRUE THEN
     AplicaFiltros;
end;

procedure TfrmRelatListagemFiliado.acMalaDiretaExecute(Sender: TObject);
var
  ativoativo:integer;
begin
  inherited;
  If TClientDataset(dsListagem.dataset).RecordCount > 0 then
  begin
      try application.createform(TfrmParcelamentoMalaDireta,frmParcelamentoMalaDireta);
      If frmParcelamentoMalaDireta.showmodal = mrok then
      begin
         IdMala := frmParcelamentoMalaDireta.sdsMalasMALA_ID.value;

         ativoativo := 0;
         If cbemail.Checked = false then
         begin
            cbemail.Checked := true;
            cbemailClick(sender);
            ativoativo := 1;
         end;

         ExibeAguarde('Enviando para mala direta...');
          TClientDataset(dsListagem.dataset).first;
          while not TClientDataset(dsListagem.dataset).eof do
          begin
              AnexarArquivosAmala;

              TClientDataset(dsListagem.dataset).next;
          end;
          TClientDataset(dsListagem.dataset).First;


         If ativoativo = 1 then
         begin
            cbemail.Checked := false;
            cbemailClick(sender);
         END;
         EscondeAguarde;
      end
      else
        abort;

      Aviso('Forma encaminhados para Mala Direta ' + labtotal.caption + ' filiado(s). ');
      TClientDataset(dsListagem.dataset).Filtered:=false;
      TClientDataset(dsListagem.dataset).filter :='';
      TClientDataset(dsListagem.dataset).filtered :=true;
      finally
      frmParcelamentoMalaDireta.free;
      end;

  end;

end;

procedure TfrmRelatListagemFiliado.AnexarArquivosAmala;
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
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := TClientDataset(dsListagem.dataset).fieldbyname('email').value;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value :=0;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value :=  TClientDataset(dsListagem.dataset).fieldbyname('ass_id').value;
      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value :=  TClientDataset(dsListagem.dataset).fieldbyname('nome').value;
      If TClientDataset(dsListagem.dataset).fieldbyname('TP_ASSOC_DESC').value = 'Pessoa Física' then
         tipopessoa := 2
      else
      If TClientDataset(dsListagem.dataset).fieldbyname('TP_ASSOC_DESC').value = 'Pessoa Jurídica' then
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

         DMConexao.Log('Relat Filiado - Enviado para Mala Direta: ' + inttostr(idmala)+ ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value), 'O', TClientDataset(dsListagem.dataset).FieldByName('ass_id').value);

         frmParcelamentoMalaDireta.cdsArquivosAnexo.next;
      end;
      frmParcelamentoMalaDireta.cdsArquivosAnexo.first;
     labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);
end;


end.
