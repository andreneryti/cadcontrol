unit UInadimplencia;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, Grids, DBGrids, Buttons, ToolWin, ComCtrls,
    JvToolEdit, JvLookup, StdCtrls, Mask, ExtCtrls, DB, ActnList, WinSkinData, DBcLIENT,
    UCDefine, Provider, SqlExpr, DBLocal, DBLocalS, comObj;

type
    TfrmInadimplencia = class(TModeloComum)
        BitBtn1: TBitBtn;
        ActionList1: TActionList;
        acGerarBoletoGuia: TAction;
        acEtiqueta: TAction;
        acGerarPlanilha: TAction;
        dsInadimplencia: TDataSource;
        ToolBar1: TToolBar;
        spGerarBoleto: TSpeedButton;
        spImprimirEtiq: TSpeedButton;
        spGerarPlanilha: TSpeedButton;
        gridCobranca: TDBGrid;
        Label4: TLabel;
        labtotal: TLabel;
        cdsAgrupa: TClientDataSet;
        cdsAgrupaASS_ID: TIntegerField;
        cdsAgrupaREGISTRO: TStringField;
        cdsAgrupaNOME: TStringField;
        cdsAgrupaEMP_ID: TIntegerField;
        cdsAgrupaREGIAO: TStringField;
        cdsAgrupaCPFCNPJ: TStringField;
        cdsAgrupaANUID_ID: TIntegerField;
        cdsAgrupaDESCRICAO: TStringField;
        cdsAgrupaANO: TIntegerField;
        cdsAgrupaVALOR: TFMTBCDField;
        cdsAgrupaVENCIMENTO: TDateField;
        cdsAgrupaTIPOCONTRIB: TStringField;
        cdsAgrupaPARC_ID: TIntegerField;
        cdsAgrupaNUM_PARCELA: TIntegerField;
        cdsAgrupaTPCONTRIB_ID: TIntegerField;
        cdsAgrupaMULTA: TFMTBCDField;
        cdsAgrupaJUROS: TFMTBCDField;
        cdsAgrupaCORRECAO: TFMTBCDField;
        cdsAgrupaTOTAL: TFMTBCDField;
        cdsAgrupaEND_ID: TIntegerField;
        cdsAgrupaEND_LOGRADOURO: TStringField;
        cdsAgrupaEND_NUMERO: TStringField;
        cdsAgrupaEND_COMPLEMENTO: TStringField;
        cdsAgrupaEND_BAIRRO: TStringField;
        cdsAgrupaEND_CEP: TStringField;
        cdsAgrupaCIDADE_ID: TIntegerField;
        cdsAgrupaTP_ENDER_ID: TIntegerField;
        cdsAgrupaEND_CORRESP: TSmallintField;
        cdsAgrupaEND_CORRESP_DEV: TSmallintField;
        cdsAgrupaSTATUSCORRESP: TStringField;
        cdsAgrupaCIDADE_NOME: TStringField;
        cdsAgrupaESTADO_NOME: TStringField;
        cdsAgrupaTP_ENDER_DESCR: TStringField;
        cdsAgrupaENDER_COMPLETO: TStringField;
        cdsAgrupaTP_ASSOC_ID: TIntegerField;
        cdsAnuidAgrupadas: TClientDataSet;
        cdsAnuidAgrupadasass_id: TIntegerField;
        cdsAnuidAgrupadasanuid_id: TIntegerField;
        cdsAnuidAgrupadasDESCRICAO_ITEM: TStringField;
        cdsAnuidAgrupadasVALOR_ITEM: TFloatField;
        cdsAnuidAgrupadasVALOR_MULTA: TFloatField;
        cdsAnuidAgrupadasVALOR_JUROS: TFloatField;
        cdsAnuidAgrupadasVALOR_CORRECAO: TFloatField;
        UCControls1: TUCControls;
        Panel3: TPanel;
        Bevel3: TBevel;
        Bevel4: TBevel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label10: TLabel;
        BitBtn2: TBitBtn;
        cbTipoContrib: TComboBox;
        edanoInadini: TMaskEdit;
        edRegini: TMaskEdit;
        lkpLocalidade: TJvLookupEdit;
        edTpPessoa: TComboBox;
        Label12: TLabel;
        cbaberto: TComboBox;
        Label13: TLabel;
        edRegFim: TMaskEdit;
        Label14: TLabel;
        sdsDadosContrib: TSQLClientDataSet;
        sdsDadosContribConfed: TSQLClientDataSet;
        sdsCalcTotal: TSQLClientDataSet;
        acGerarPDF: TAction;
        SaveDialog1: TSaveDialog;
        acMalaDireta: TAction;
        sdsVeritem: TSQLClientDataSet;
        sdsVeritemQTDE: TIntegerField;
        edanoInadfim: TMaskEdit;
        Label1: TLabel;
        spRecuperacaoCredito: TSpeedButton;
        acLoteadd: TAction;
        cdsResultado: TClientDataSet;
        cdsResultadosituacao: TIntegerField;
        cdsResultadoregistro: TStringField;
        cdsResultadonome: TStringField;
        cdsResultadomotivo: TStringField;
        sdsVerExisteEmLote: TSQLClientDataSet;
        sdsVerExisteEmLoteQTDE: TIntegerField;
        sdsNumNotificacao: TSQLClientDataSet;
        sdsNumNotificacaoNUMNOTIF: TStringField;
    labcontalabel: TLabel;
    labconta: TLabel;
    sdsDadosContribANUID_ID: TIntegerField;
    sdsDadosContribANO: TIntegerField;
    sdsDadosContribVALOR: TFMTBCDField;
    sdsDadosContribVENCIMENTO: TDateField;
    sdsDadosContribTOTAL: TFMTBCDField;
    sdsDadosContribMULTA: TFMTBCDField;
    sdsDadosContribJUROS: TFMTBCDField;
    sdsDadosContribCORRECAO: TFMTBCDField;
        procedure FormShow(Sender: TObject);
        procedure btLocalizarClick(Sender: TObject);
        procedure acGerarPlanilhaExecute(Sender: TObject);
        procedure GeraPlanilhaLoc(Query: tClientDataset; grid: TDbGrid);
        procedure Etiquetas_Envelopes(Query: TClientDataset);
        procedure gridCobrancaDrawColumnCell(Sender: TObject;
            const Rect: TRect; DataCol: Integer; Column: TColumn;
            State: TGridDrawState);
        procedure acEtiquetaExecute(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure acGerarBoletoGuiaExecute(Sender: TObject);
        procedure Boletos_Sindical(ano: integer);
        procedure Boleto_Conferativa_Individual(ano: integer);
        procedure Boleto_Conferativa_1Boleto(AnoiniConf, anofimConf: integer);
        procedure Gera_Boleto_Confederativa(Query: TClientDataset);
        procedure Agrupar;
        procedure FormCreate(Sender: TObject);
        procedure gridCobrancaTitleClick(Column: TColumn);
        procedure BitBtn2Click(Sender: TObject);
        procedure gridCobrancaDblClick(Sender: TObject);
        procedure acMalaDiretaExecute(Sender: TObject);
        procedure CalcTotal;
        procedure EnviarMalaDireta(caminhocopy, arquivo, tipo: string);
        procedure AnexarArquivosAmala;
        procedure acLoteaddExecute(Sender: TObject);
        procedure AddnoLote(idLote, ass_id, ano1, ano2: integer; conf: boolean);
        procedure AddResultado(sit: integer; motivo: string);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmInadimplencia: TfrmInadimplencia;
    Anoini, Anofim: Integer;
    DataVencCOnf: Tdatetime;
    GerarPDF, maladireta, IdMala, item_id, anoCONF: integer;
    pastadestino, nomeinicialarq: string;
    TesteOK, ass_idold: integer;
    AnexarArquivo, Cobranca, jaanexado: integer;
    GeraNOtif: integer;
    nomearquivo: string;
    resp: boolean;
implementation

uses UDMAssociado, UFuncoes, UDMConexao, UDmFinancas, UOpcoes_Etiq_Envelop,
    UEtiquetas, UEnvelopeTipo, UBoletoVencinento, UDmBoleto, uGuias,
    gbCobranca, UNovoAssoc, UInadimpCobrancaOpcoes, UVenctoConfederativaInad,
    UDMMalaDireta, ULoteAdicionarRegs, UDmlotes, UqrRelatAddLote;

{$R *.dfm}

procedure TfrmInadimplencia.FormShow(Sender: TObject);
begin
    inherited;
    DMAssociado.dsEmp_Regiao.dataset.close;
    DMAssociado.dsEmp_Regiao.dataset.open;
    DMAssociado.dsEmp_Regiao.dataset.first;
    lkpLocalidade.Text := DMAssociado.dsEmp_Regiao.dataset.fieldbyname('Regiao').value;
    edanoInadini.text := inttostr(ExtractYear(DataAtual) - 1);
    edanoInadfim.text := inttostr(ExtractYear(DataAtual));
    dsInadimplencia.DataSet.close;
    AnexarArquivo := 0;
    Cobranca := 0;
    jaanexado := 0;
end;

procedure TfrmInadimplencia.btLocalizarClick(Sender: TObject);
var
    i: integer;
begin
    {   try
         strtoint(edAnoInicio.Text);
         strtoint(edAnoFim.Text);
       except
         erro('Digite o ano inicial e ano final corretamente. ');
         abort;
       end;

       If not (DMAssociado.dsEmp_Regiao.DataSet.locate('regiao',lkpLocalidade.text, [] )) then
       begin
         erro('Digite a localidade corretamente. ');
         abort;
       end;

       ExibeAguarde('Localizando Dados de Inadimplência...');
       dsInadimplencia.dataset.Close;

       for i := 0 to TClientDataset(dsInadimplencia.dataset).Params.Count -1 do
           TClientDataset(dsInadimplencia.dataset).Params[i].clear;

       // Tipo de Cobranca
       TClientDataset(dsInadimplencia.dataset).Params.ParamByName('TIPOCONTRIBPAR').value := cbTipoContrib.ItemIndex+1;

       // Anos
       TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANOINICIO').value :=strtoint(edAnoInicio.Text);
       TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANOFIM').value :=strtoint(edAnoFim.Text);

       // registro
       If (edRegistro.text<>'' ) then
          TClientDataset(dsInadimplencia.dataset).Params.ParamByName('REGPAR').value :=edRegistro.Text;

       //Localidade
       TClientDataset(dsInadimplencia.dataset).Params.ParamByName('EMP_ID_PAR').value :=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;


       TClientDataset(dsInadimplencia.dataset).Params.ParamByName('datatual').value :=DataAtual;

       TClientDataset(dsInadimplencia.dataset).Open;

       labtotal.Caption:= inttostr(TClientDataset(dsInadimplencia.dataset).recordcount);

       EscondeAguarde;
       }

end;

procedure TfrmInadimplencia.acGerarPlanilhaExecute(Sender: TObject);
begin
    inherited;
    if dsInadimplencia.dataset.Active = true then
        if dsInadimplencia.DataSet.RecordCount > 0 then
            GeraPlanilhaLoc(TClientDataset(dsInadimplencia.dataset), gridCobranca);

end;

procedure TfrmInadimplencia.gridCobrancaDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    inherited;
    if Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmInadimplencia.Etiquetas_Envelopes(Query: TClientDataset);
begin
    try application.createform(TFrmOpcoes_Etiq_Env, FrmOpcoes_Etiq_Env);
        if FrmOpcoes_Etiq_Env.showmodal = mrok then
        begin
            if FrmOpcoes_Etiq_Env.radEtiqueta.Checked = true then
            begin
                try application.createform(TfrmEtiqueta, frmEtiqueta);
                    frmEtiqueta.Dados.Open;
                    Query.DisableControls;
                    Query.first;
                    while not Query.eof do
                    begin
                        if (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                        begin
                            frmEtiqueta.Dados.Append;
                            frmEtiqueta.Dados.Edit;
                            if Query.fieldbyname('registro').value <> NULL then
                                frmEtiqueta.DadosREGISTRO.value := StringReplace(Query.fieldbyname('registro').Value, '/', '', [rfReplaceAll]);
                            if Query.fieldbyname('end_bairro').value <> NULL then
                                frmEtiqueta.Dadosbairro.value := Query.fieldbyname('end_bairro').value;
                            if Query.fieldbyname('end_Complemento').value <> NULL then
                                frmEtiqueta.Dadoscomplemento.value := Query.fieldbyname('end_complemento').value;

                            if length(Query.fieldbyname('end_CEP').value) = 8 then
                                frmEtiqueta.Dadoscep.value := copy(Query.fieldbyname('end_CEP').value, 1, 2) + '.' + copy(Query.fieldbyname('end_CEP').value, 3, 3) + '-' + copy(Query.fieldbyname('end_CEP').value, 6, 3)
                            else
                            begin
                                if Query.fieldbyname('end_cep').value <> NULL then
                                    frmEtiqueta.Dadoscep.value := Query.fieldbyname('end_cep').value;
                            end;
                            if Query.fieldbyname('cidade_nome').value <> NULL then
                                frmEtiqueta.Dadoscidade.value := Query.fieldbyname('cidade_nome').value;
                            if Query.fieldbyname('end_logradouro').value <> NULL then
                                frmEtiqueta.Dadosendereco.value := Query.fieldbyname('end_logradouro').value;
                            if Query.fieldbyname('estado_nome').value <> NULL then
                                frmEtiqueta.Dadosestado.value := Query.fieldbyname('estado_nome').value;
                            if Query.fieldbyname('nome').value <> NULL then
                                frmEtiqueta.Dadosnome.value := Query.fieldbyname('nome').value;
                            frmEtiqueta.Dados.post;
                        end;
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
                if FrmOpcoes_Etiq_Env.radEnvelope.Checked = true then
            begin
                try Application.createform(TfrmEnvelopeTipo, frmEnvelopeTipo);
                    if frmEnvelopeTipo.showmodal = mrok then
                    begin
                        FrmOpcoes_Etiq_Env.Dados.Open;
                        Query.DisableControls;
                        Query.first;
                        while not Query.eof do
                        begin
                            if (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                            begin
                                FrmOpcoes_Etiq_Env.Dados.Append;
                                FrmOpcoes_Etiq_Env.Dados.Edit;
                                if Query.fieldbyname('REGISTRO').value <> '/' then
                                    FrmOpcoes_Etiq_Env.DadosREGISTRO.value := StringReplace(Query.fieldbyname('registro').Value, '/', '', [rfReplaceAll]);
                                FrmOpcoes_Etiq_Env.Dadosbairro.value := Query.fieldbyname('end_BAIRRO').value;
                                if length(Query.fieldbyname('end_CEP').value) = 8 then
                                    FrmOpcoes_Etiq_Env.Dadoscep.value := copy(Query.fieldbyname('end_CEP').value, 1, 2) + '.' + copy(Query.fieldbyname('end_CEP').value, 3, 3) + '-' + copy(Query.fieldbyname('end_CEP').value, 6, 3)
                                else
                                    FrmOpcoes_Etiq_Env.Dadoscep.value := Query.fieldbyname('end_CEP').value;

                                FrmOpcoes_Etiq_Env.Dadoscidade.value := Query.fieldbyname('CIDADE_nome').value;
                                FrmOpcoes_Etiq_Env.Dadoscomplemento.value := Query.fieldbyname('end_COMPLEMENTO').value;
                                FrmOpcoes_Etiq_Env.Dadosendereco.value := Query.fieldbyname('end_logradouro').value;
                                FrmOpcoes_Etiq_Env.Dadosestado.value := Query.fieldbyname('ESTADO_nome').value;
                                FrmOpcoes_Etiq_Env.Dadosnome.value := Query.fieldbyname('NOME').value;
                                FrmOpcoes_Etiq_Env.Dados.post;
                            end;
                            Query.Next;
                        end;
                        Query.first;
                        Query.EnableControls;

                        if frmEnvelopeTipo.radMedio.checked = true then
                            FrmOpcoes_Etiq_Env.Imprime_Envelopes(1) //Medio
                        else
                            if frmEnvelopeTipo.radOficio.checked = true then
                            FrmOpcoes_Etiq_Env.Imprime_Envelopes(2) //Oficio
                        else
                            FrmOpcoes_Etiq_Env.Imprime_Envelopes(3); //A4
                    end;
                finally
                    frmEnvelopeTipo.free;
                end;
            end;
        end;
    finally
        FrmOpcoes_Etiq_Env.free;
    end;


end;

procedure TfrmInadimplencia.acEtiquetaExecute(Sender: TObject);
begin
    inherited;
    if dsInadimplencia.dataset.Active = true then
        if dsInadimplencia.DataSet.RecordCount > 0 then
            Etiquetas_Envelopes(TClientDataset(dsInadimplencia.dataset));

end;

procedure TfrmInadimplencia.BitBtn1Click(Sender: TObject);
begin
    inherited;
    close;
end;

procedure TfrmInadimplencia.acGerarBoletoGuiaExecute(Sender: TObject);
var
    TipoCob: string;
    ComConf, UmBoleto, i, IncluirObs, cont: Integer;
    obs: string;

begin
    ass_idold := 0;
    Cobranca :=0;
    AnexarArquivo := 0;
    gerarPDF :=0;

    if TClientDataset(dsInadimplencia.dataset).Active = true then
    begin
        if TClientDataset(dsInadimplencia.dataset).recordcount > 0 then
        begin
            try application.createform(TfrmInadimpCobrancaOpcoes, frmInadimpCobrancaOpcoes);

                if strtoint(edanoInadini.Text) < ExtractYear(DataAtual) then
                begin
                    frmInadimpCobrancaOpcoes.edit1ano.Text := inttostr(strtoint(edanoInadini.Text) + 1);
                    frmInadimpCobrancaOpcoes.editanoini.Text := inttostr(strtoint(edanoInadini.Text) + 1);
                    if strtoint(edanoInadini.Text) + 5 <= ExtractYear(DataAtual) then
                        frmInadimpCobrancaOpcoes.editanofim.Text := inttostr(strtoint(edanoInadini.Text) + 5)
                    else
                        frmInadimpCobrancaOpcoes.editanofim.Text := inttostr(ExtractYear(DataAtual));

                end
                else
                begin
                    frmInadimpCobrancaOpcoes.edit1ano.Text :='2016';
                    frmInadimpCobrancaOpcoes.editanoini.Text :='2016';
                    frmInadimpCobrancaOpcoes.editanofim.Text :='2016';
                end;


                if cbTipoContrib.ItemIndex = 1 then // Confederativa
                begin
                    frmInadimpCobrancaOpcoes.radSind.Enabled := false;
                    frmInadimpCobrancaOpcoes.radSindConf.checked := True;
                    frmInadimpCobrancaOpcoes.radSindConf.caption := 'Confederativa';
                    if frmInadimpCobrancaOpcoes.ShowModal = mrok then
                    begin
                        if DMConexao.sdsConfig.active = false then
                            DMConexao.sdsConfig.active := true;

                        GerarPDF := 0;
                        //pdfcommala :=0;
                        maladireta := 0;
                        if frmInadimpCobrancaOpcoes.rbGerarPdf.checked = true then
                        begin
                            GerarPDF := 1;
                            pastadestino := frmInadimpCobrancaOpcoes.editCaminho.Text;
                            nomeinicialarq := frmInadimpCobrancaOpcoes.editNomeArquivo.Text;

                            if frmInadimpCobrancaOpcoes.cbmala.Checked = true then
                            begin
                                maladireta := 1;
                                IdMala := frmInadimpCobrancaOpcoes.sdsMalasMALA_ID.value;

                                dsInadimplencia.DataSet.Filtered := false;
                                dsInadimplencia.DataSet.filter := 'email<>''''';
                                dsInadimplencia.DataSet.filtered := true;
                                CalcTotal;
                            end;

                            if frmInadimpCobrancaOpcoes.cbGerarPDFAnexarArq.Checked = true then
                                AnexarArquivo := 1;

                        end
                        else
                            if frmInadimpCobrancaOpcoes.rbEnviarMala.checked = true then
                        begin
                            IdMala := frmInadimpCobrancaOpcoes.sdsMalasMALA_ID.value;
                            pastadestino := DMConexao.sdsConfigCAMINHOPDFSEMAIL.value;
                            nomeinicialarq := dmconexao.sdsConfigNOMEINICIALARQPDF.value;
                            maladireta := 1;

                            dsInadimplencia.DataSet.Filtered := false;
                            dsInadimplencia.DataSet.filter := 'email<>''''';
                            dsInadimplencia.DataSet.filtered := true;
                            CalcTotal;

                            if frmInadimpCobrancaOpcoes.cbEnviarMalaAnexarArq.Checked = true then
                                AnexarArquivo := 1;

                            if frmInadimpCobrancaOpcoes.cbCobranca.Checked = true then
                                Cobranca := 1;

                        end;

                        if frmInadimpCobrancaOpcoes.cbObs.checked = true then
                        begin
                            obs := frmInadimpCobrancaOpcoes.memoObs.Lines.Text;
                            IncluirObs := 1;

                        end;


                        UmBoleto := 0;
                        try application.createform(TFrmVenctoConfederativaInad, FrmVenctoConfederativaInad);
                            if FrmVenctoConfederativaInad.showmodal = mrok then
                                DataVencCOnf := strtodate(FrmVenctoConfederativaInad.eddatavenc.Text)
                            else
                                Exit;
                        finally
                            FrmVenctoConfederativaInad.free;
                        end;

                        if frmInadimpCobrancaOpcoes.cb1Boleto.Checked = true then
                            UmBoleto := 1;

                        if frmInadimpCobrancaOpcoes.rad1Ano.Checked = true then
                        begin
                            Anoini := strtoint(frmInadimpCobrancaOpcoes.edit1ano.text);
                            anofim := strtoint(frmInadimpCobrancaOpcoes.edit1ano.text);
                        end
                        else
                        begin
                            anoini := strtoint(frmInadimpCobrancaOpcoes.editanoini.text);
                            anofim := strtoint(frmInadimpCobrancaOpcoes.editanofim.text);
                        end;

                      {  //Aqui
                          cont :=0;
                          dsInadimplencia.DataSet.DisableControls;
                        // -
                        }

                        dsInadimplencia.dataset.first;
                        ExibeAguarde('Gerando Guias/Boletos/Mala Direta. Por favor aguarde...');
                        while not dsInadimplencia.dataset.eof do
                        begin
                            if (dsInadimplencia.DataSet.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (dsInadimplencia.DataSet.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                            begin
                                TesteOK := 1;

                                if UmBoleto = 0 then
                                begin
                                    for anoCONF := anoini to anofim do
                                        Boleto_Conferativa_Individual(anoCONF);
                                end
                                else
                                begin
                                    Boleto_Conferativa_1Boleto(Anoini, anofim);
                                end;

                                if (TesteOK = 1) and (IncluirObs = 1) then
                                begin
                                    DMAssociado.PROC_OBS_UI.close;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value := 0;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value := obs;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.FieldByName('ass_id').value;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value := DataAtual;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value := copy(timetostr(time()), 1, 5);
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value := Userid;
                                    DMAssociado.PROC_OBS_UI.ExecProc;

                                end;

                            end;
                          {
                            //aqui
                                cont := cont + 1;
                                labcontalabel.Visible:=true;
                                labconta.Visible:=true;
                                labconta.Caption :=inttostr(cont)+ ' de ' + labtotal.caption;
                                Application.ProcessMessages;
                            // -
                                }
                            dsInadimplencia.dataset.next;
                        end;
                        EscondeAguarde;

                        dsInadimplencia.DataSet.Filtered := false;
                        dsInadimplencia.DataSet.filter := '';
                        dsInadimplencia.DataSet.filtered := true;

                       { //aqui
                        dsInadimplencia.DataSet.EnableControls;
                        // -}
                        dsInadimplencia.DataSet.First;

                        Aviso('Geração de boletos/guias/mala direta finalizada. ');


                    end;
                end

                else //Sindical

                begin
                    if frmInadimpCobrancaOpcoes.ShowModal = mrok then
                    begin
                        if DMConexao.sdsConfig.active = false then
                            DMConexao.sdsConfig.active := true;

                        GerarPDF := 0;
                        //pdfcommala :=0;
                        maladireta := 0;
                        if frmInadimpCobrancaOpcoes.rbGerarPdf.checked = true then
                        begin
                            GerarPDF := 1;
                            pastadestino := frmInadimpCobrancaOpcoes.editCaminho.Text;
                            nomeinicialarq := frmInadimpCobrancaOpcoes.editNomeArquivo.Text;

                            if frmInadimpCobrancaOpcoes.cbmala.Checked = true then
                            begin
                                maladireta := 1;
                                IdMala := frmInadimpCobrancaOpcoes.sdsMalasMALA_ID.value;

                                {  dsInadimplencia.DataSet.Filtered:=false;
                                  dsInadimplencia.DataSet.filter :='email<>''''';
                                  dsInadimplencia.DataSet.filtered :=true;
                                  }
                                CalcTotal;

                                if frmInadimpCobrancaOpcoes.cbGerarPDFAnexarArq.Checked = true then
                                    AnexarArquivo := 1;
                            end;
                        end
                        else
                            if frmInadimpCobrancaOpcoes.rbEnviarMala.checked = true then
                        begin
                            IdMala := frmInadimpCobrancaOpcoes.sdsMalasMALA_ID.value;
                            pastadestino := DMConexao.sdsConfigCAMINHOPDFSEMAIL.value;
                            nomeinicialarq := dmconexao.sdsConfigNOMEINICIALARQPDF.value;
                            maladireta := 1;

                            dsInadimplencia.DataSet.Filtered := false;
                            dsInadimplencia.DataSet.filter := 'email<>''''';
                            dsInadimplencia.DataSet.filtered := true;
                            CalcTotal;

                            if frmInadimpCobrancaOpcoes.cbEnviarMalaAnexarArq.Checked = true then
                                AnexarArquivo := 1;

                            if frmInadimpCobrancaOpcoes.cbCobranca.Checked = true then
                                Cobranca := 1;

                        end;

                        if frmInadimpCobrancaOpcoes.cbObs.checked = true then
                        begin
                            obs := frmInadimpCobrancaOpcoes.memoObs.Lines.Text;
                            IncluirObs := 1;

                        end;

                        ComConf := 0;
                        UmBoleto := 0;
                        if frmInadimpCobrancaOpcoes.radSindConf.checked = true then
                        begin
                            try application.createform(TFrmVenctoConfederativaInad, FrmVenctoConfederativaInad);
                                if FrmVenctoConfederativaInad.showmodal = mrok then
                                    DataVencCOnf := strtodate(FrmVenctoConfederativaInad.eddatavenc.Text)
                                else
                                    Exit;
                            finally
                                FrmVenctoConfederativaInad.free;
                            end;
                            ComConf := 1;

                            if frmInadimpCobrancaOpcoes.cb1Boleto.Checked = true then
                                UmBoleto := 1;
                        end;

                        if frmInadimpCobrancaOpcoes.rad1Ano.Checked = true then
                        begin
                            Anoini := strtoint(frmInadimpCobrancaOpcoes.edit1ano.text);
                            anofim := strtoint(frmInadimpCobrancaOpcoes.edit1ano.text);
                        end
                        else
                        begin
                            anoini := strtoint(frmInadimpCobrancaOpcoes.editanoini.text);
                            anofim := strtoint(frmInadimpCobrancaOpcoes.editanofim.text);
                        end;

                        cont :=0;
                        dsInadimplencia.dataset.first;
                        dsInadimplencia.dataset.DisableControls;
                        ExibeAguarde('Gerando Guias/Boletos. Por favor aguarde...');
                        while not dsInadimplencia.dataset.eof do
                        begin
                            TesteOK := 1;
                            jaanexado := 0;
                            if (dsInadimplencia.DataSet.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (dsInadimplencia.DataSet.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                            begin

                                if (frmInadimpCobrancaOpcoes.rbEnviarMala.checked = true) and (Cobranca = 0) and (maladireta = 1) {and (AnexarArquivo = 0)} then
                                begin
                                    if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
                                    begin
                                       AnexarArquivosAmala;
                                    end
                                    else
                                    begin
                                       testeok :=0;
                                    end;

                                end
                                else
                                begin

                                      for i := anoini to anofim do
                                          Boletos_Sindical(i);

                                      if ComConf = 1 then
                                      begin
                                          if UmBoleto = 0 then
                                          begin
                                              for anoCONF := anoini to anofim do
                                                  Boleto_Conferativa_Individual(anoCONF);
                                          end
                                          else
                                          begin
                                              Boleto_Conferativa_1Boleto(Anoini, anofim);
                                          end;

                                      end;
                                end;

                                if (TesteOK = 1) and (IncluirObs = 1) then
                                begin
                                    DMAssociado.PROC_OBS_UI.close;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value := 0;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value := obs;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.FieldByName('ass_id').value;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value := DataAtual;
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value := copy(timetostr(time()), 1, 5);
                                    DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value := Userid;
                                    DMAssociado.PROC_OBS_UI.ExecProc;
                                end;
                                //aqui
                                cont := cont + 1;
                                labcontalabel.Visible:=true;
                                labconta.Visible:=true;
                                labconta.Caption :=inttostr(cont)+ ' de ' + labtotal.caption;
                                Application.ProcessMessages;
                            // -

                            end;
                            dsInadimplencia.dataset.next;
                        end;

                        dsInadimplencia.dataset.first;
                        dsInadimplencia.dataset.EnableControls;
                        EscondeAguarde;
                        Aviso('Geração de boletos/guias/mala direta finalizada. ');
                    end;
                end;

            finally
                frmInadimpCobrancaOpcoes.free;
            end;


        end;
    end;
end;

procedure TfrmInadimplencia.Boletos_Sindical(ano: integer);
var
    DataVenc: TDatetime;
    bol_id, cont: integer;
    NossoNumero:string;
begin

    sdsDadosContrib.close;
    sdsDadosContrib.Params.ParamByName('ass_id').value := dsInadimplencia.dataset.fieldbyname('ass_id').value;
    sdsDadosContrib.Params.ParamByName('dataatual').value := DataAtual;
    sdsDadosContrib.Params.ParamByName('tipo').value := 1;
    sdsDadosContrib.Params.ParamByName('ano').value := ano;
    sdsDadosContrib.open;

    if sdsDadosContrib.recordcount > 0 then
    begin
        //Dados da Conta e Cedente
        DmBoleto.DadosContaCedente(dsInadimplencia.DataSet.FieldByName('emp_id').value, 1);
        DmBoleto.Guias1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.value;
        //Alterado COBREG
        //DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaCT_CODCEDENTE.value + Dmboleto.cdsContaCT_CODCEDENTE_DV.value;
        DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaSICASCOMPLETO.value;
        if copy(DMConexao.sdsConfigNOMEEMP.value, 1, 1) = 'F' then
        begin
            DmBoleto.Guias1.Cedente.SICAS_Simples := '00111';
            DmBoleto.Guias1.Tipo_Entidade := teFederacao;
        end
        else
        begin
            //Alterado COBREG
            //DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
            DmBoleto.Guias1.Cedente.SICAS_Simples := Dmboleto.cdsContaCODSINDICAL.value;
            DmBoleto.Guias1.Tipo_Entidade := teSindicato;
        end;

        DmBoleto.Guias1.Cedente.Agencia := Dmboleto.cdsContaCT_AGENCIA.Value;

        DmBoleto.Guias1.Cedente.CNPJ := Dmboleto.cdsContaCNPJ.Value;
        DmBoleto.Guias1.Cedente.Endereco.Rua := Dmboleto.cdsContaENDER_LOGRADOURO.Value;
        DmBoleto.Guias1.Cedente.Endereco.Bairro := Dmboleto.cdsContaENDER_BAIRRO.Value;
        DmBoleto.Guias1.Cedente.Endereco.CEP := Dmboleto.cdsContaENDER_CEP.Value;
        DmBoleto.Guias1.Cedente.Endereco.Cidade := Dmboleto.cdsContaCIDADE_NOME.Value;
        DmBoleto.Guias1.Cedente.Endereco.Numero := Dmboleto.cdsContaENDER_NUMERO.Value;
        DmBoleto.Guias1.Cedente.Endereco.Complemento := Dmboleto.cdsContaENDER_COMPLEMENTO.Value;
        DmBoleto.Guias1.Cedente.Endereco.Estado := Dmboleto.cdsContaESTADO_SIGLA.Value;
        DmBoleto.Guias1.Cedente.CNAE := '461';

        //Dados do Sacado
        DmBoleto.DadosSacado(dsInadimplencia.DataSet.FieldByName('ass_id').value);

        DmBoleto.Guias1.Sacado.Nome := dsInadimplencia.DataSet.FieldByName('nome').value;
        DmBoleto.Guias1.Sacado.Endereco.Rua := dsInadimplencia.DataSet.FieldByName('END_LOGRADOURO').value;
        DmBoleto.Guias1.Sacado.Endereco.Numero := dsInadimplencia.DataSet.FieldByName('END_NUMERO').value;
        DmBoleto.Guias1.Sacado.Endereco.Complemento := dsInadimplencia.DataSet.FieldByName('END_COMPLEMENTO').value;
        DmBoleto.Guias1.Sacado.Endereco.Bairro := dsInadimplencia.DataSet.FieldByName('END_bairro').value;
        DmBoleto.Guias1.Sacado.Endereco.Cidade := dsInadimplencia.DataSet.FieldByName('CIDADE_NOME').value;
        DmBoleto.Guias1.Sacado.Endereco.CEP := dsInadimplencia.DataSet.FieldByName('END_CEP').value;
        DmBoleto.Guias1.Sacado.Endereco.Estado := dsInadimplencia.DataSet.FieldByName('ESTADO_NOME').value;

        DmBoleto.cdsOutrosSind.close;
        DmBoleto.cdsOutrosSind.Params.ParamByName('ass_id').value := dsInadimplencia.DataSet.FieldByName('ass_id').value;
        DmBoleto.cdsOutrosSind.Open;

        if sdsDadosContrib.FieldByName('vencimento').value < DataAtual then
            Dmboleto.Guias1.Vencimento := DataAtual + 10
        else
            Dmboleto.Guias1.Vencimento := sdsDadosContrib.FieldByName('vencimento').value;

        Dmboleto.Guias1.Exercicio := inttostr(ano);

        Dmboleto.Guias1.Numero_Documento := strtoint(copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7));

        DmBoleto.Guias1.Sacado.Contribuinte_Mask := '999999/9999-99;0; ';

        if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
           DmBoleto.Guias1.Sacado.Contribuinte := Copy(stringreplace(dsInadimplencia.DataSet.FieldByName('registro').value, '/', '', [rfreplaceall]), 2, 20) + Copy(DmBoleto.Guias1.Exercicio, 3, 2)
        else
        if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
        begin
             DmBoleto.sdsNossoNumeroCR.close;
             DmBoleto.sdsNossoNumeroCR.Open;

             If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                 NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'1'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
             else
             If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                 NossoNumero := '14' + '31'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

             DmBoleto.Guias1.Sacado.Contribuinte := NossoNumero;
        end;

        DmBoleto.Guias1.Sacado.Contribuintecpfcnpj := dsInadimplencia.DataSet.FieldByName('CPFCNPJ').value;

        //Instruções
        DmBoleto.Guias1.Mensagem.Clear;
        DmBoleto.Guias1.MensagemContrib1.Clear;

        if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
        begin
            DmBoleto.Guias1.Mensagem.Add('BLOQUETO DE CONTRIBUIÇÃO SINDICAL URBANA');
            DmBoleto.Guias1.Mensagem.Add('');
            DmBoleto.Guias1.Mensagem.Add('Até o vencimento, pagável nas Lotéricas, Correspondentes Caixa Aqui, Agências da CAIXA e Rede Bancária.');
            DmBoleto.Guias1.Mensagem.Add('Documento vencido pagável somente nas Agências da CAIXA.');
            DmBoleto.Guias1.Mensagem.Add('Guia vencida -  cobrar multa de 10% nos trinta primeiros dias, com adicional ');
            DmBoleto.Guias1.Mensagem.Add('de 2% por mês subseqüente de atraso e juros de mora de 1% ao mês e correção monetária (Selic).');
            //mBoleto.Guias1.MensagemContrib1.Add('');
        end;
        DmBoleto.Guias1.MensagemContrib1.Add('Esta guia não quita débitos anteriores.');

        if DmBoleto.cdsOutrosSindQTDE.value = 1 then
            DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' + IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) + ' Sindicato.')
        else
            if DmBoleto.cdsOutrosSind.RecordCount > 1 then
            DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' + IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) + ' Sindicatos.');

        DmBoleto.Guias1.Sacado.Capital_Social := 0;

        if dsInadimplencia.DataSet.FieldByName('TP_ASSOC_ID').value = 1 then
        begin
            DmBoleto.Guias1.Tipo_pessoa := 'J';

            DMAssociado.cdsPegaCapSocial.close;
            DMAssociado.cdsPegaCapSocial.params.ParamByName('ass_id').value := dsInadimplencia.DataSet.FieldByName('ass_id').value;
            DMAssociado.cdsPegaCapSocial.params.ParamByName('dataatual').value := DataAtual;
            DMAssociado.cdsPegaCapSocial.params.ParamByName('vencimento').value := strtodate('31/01/' + DmBoleto.Guias1.Exercicio);
            DMAssociado.cdsPegaCapSocial.Open;
            if DMAssociado.cdsPegaCapSocial.RecordCount > 0 then
                DmBoleto.Guias1.Sacado.Capital_Social := DMAssociado.cdsPegaCapSocialVALOR.AsFloat;

        end
        else
            DmBoleto.Guias1.Tipo_pessoa := 'F';

        DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value := sdsDadosContrib.FieldByName('anuid_id').value;
        DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value := 0;
        DmBoleto.PROC_BOLETO_STATUS.ExecProc;

        try

            if not ((maladireta = 1) and (Cobranca = 0) and (GerarPDF = 0)) then
            begin

                //Gerando Boleto
                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := dsInadimplencia.DataSet.FieldByName('ASS_ID').value;
                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.Guias1.Vencimento;
                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := sdsDadosContrib.FieldByName('total').value;
                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.Guias1.Sacado.Contribuinte;
                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                DmBoleto.PROC_BOLETO_I.ExecProc;

                //Gerando Item do Boleto
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := sdsDadosContrib.FieldByName('anuid_id').value;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := 'Contribuição Sindical ' + inttostr(ano);
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := sdsDadosContrib.FieldByName('valor').asfloat;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value :=  sdsDadosContrib.FieldByName('multa').asfloat;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value :=  sdsDadosContrib.FieldByName('juros').asfloat;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value :=  sdsDadosContrib.FieldByName('correcao').asfloat;
                DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
            end;
            DmBoleto.Guias1.Valores.Contribuicao := sdsDadosContrib.FieldByName('valor').asfloat;
            DmBoleto.Guias1.Valores.Abatimento := 0;
            DmBoleto.Guias1.Valores.Deducao := 0;
            DmBoleto.Guias1.Valores.Acrescimo := sdsDadosContrib.FieldByName('correcao').asfloat;
            DmBoleto.Guias1.Valores.Multa := sdsDadosContrib.FieldByName('multa').asfloat + sdsDadosContrib.FieldByName('juros').asfloat;

            if GerarPDF = 1 then
            begin
                try
                    if Dmboleto.Guias1.GerarPDF_SIGCB(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Sind_' + DmBoleto.Guias1.Exercicio + '.pdf') = 1 then
                    begin
                        sleep(2000);
                        DMConexao.Log('Geração de PDF Sindical - Tela de Inadimplencia: ' + nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Sind_' + DmBoleto.Guias1.Exercicio + '.pdf', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
                    end
                    else
                        testeok := 0;

                except
                    //
                end;

                if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
                begin
                    if maladireta = 1 then
                        EnviarMalaDireta(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Sind_' + DmBoleto.Guias1.Exercicio + '.pdf', 'SIND');
                    if (AnexarArquivo = 1) and (jaanexado = 0) then
                    begin
                        AnexarArquivosAmala;
                        jaanexado := 1;
                    end;
                end;

            end
            else
                if maladireta = 1 then
            begin
                if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
                begin

                    if Cobranca = 1 then
                        EnviarMalaDireta('', '', 'SIND');

                    if (AnexarArquivo = 1) and (jaanexado = 0) then
                    begin
                        AnexarArquivosAmala;
                        jaanexado := 1;
                    end;
                end;

            end
            else
            begin
                if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                     DmBoleto.Guias1.Imprimir
                else
                     DmBoleto.Guias1.Imprimir_CR;
                DMConexao.Log('Impressão de Guia - Tela de Inadimplencia', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
            end;


        except
            Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
        end;

    end
    else
       testeok :=0;
end;

procedure TfrmInadimplencia.Gera_Boleto_Confederativa(
    Query: TClientDataset);
var
    DataVenc: TDatetime;
    bol_id, Cont, i: integer;
    NossoNumero: string;
begin
    try application.createform(TfrmBoletoVencinento, frmBoletoVencinento);
        if frmBoletoVencinento.showmodal = mrok then
        begin
            if frmBoletoVencinento.radDataVenc.Checked = true then
                DataVenc := strtodate(frmBoletoVencinento.eddatavenc.Text)
            else
                DataVenc := DataNula;
        end
        else
            abort;
    finally
        frmBoletoVencinento.free;
    end;

    Query.First;
    Query.DisableControls;
    while not Query.eof do
    begin
        if (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
        begin
            //Dados da Conta e Cedente
            DmBoleto.DadosContaCedente(Query.fieldbyname('EMP_ID').value, 2);
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo := DmBoleto.cdsContaBAN_CODIGO.AsString;
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
            DmBoleto.gbTitulo1.SeuNumero := '';
            DmBoleto.gbTitulo1.DataDocumento := Dataatual;
            DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

            DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
            DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
            DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

            DmBoleto.gbTitulo1.EspecieDocumento := edDuplicataMercantil;
            DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

            DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
            DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
            DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: ' + MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
            DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
            DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
            //Fim dados do Cedente

            Dmboleto.gbTitulo1.Instrucoes.Clear;
            Dmboleto.gbTitulo1.Instrucoes.Add('(' + Query.FieldByName('tipocontrib').value + ') ' + Query.FieldByName('descricao').value + ': ' + formatfloat(',0.00 ', Query.FieldByName('total').value));

            //Cancelando boleto ou tirando o vinculo com Boleto_itens
            DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value := Query.FieldByName('anuid_id').value;
            DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value := Query.FieldByName('parc_id').value;
            DmBoleto.PROC_BOLETO_STATUS.ExecProc;

            if DataVenc = DataNula then
                Dmboleto.gbTitulo1.DataVencimento := Query.FieldByName('vencimento').value
            else
                Dmboleto.gbTitulo1.DataVencimento := DataVenc;

            DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

            if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
            begin

               DmBoleto.sdsNossoNumero.close;
               DmBoleto.sdsNossoNumero.Open;

               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                   NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14)
               else
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   NossoNumero := '24' + '8'+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);

               DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
               DmBoleto.gbTitulo1.Carteira := 'SR';
           end
           else
           if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
           begin
               DmBoleto.sdsNossoNumeroCR.close;
               DmBoleto.sdsNossoNumeroCR.Open;

               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                   NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'2'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
               else
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   NossoNumero := '14' + '82'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

               DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
               DmBoleto.gbTitulo1.Carteira := 'RG';
           end;

            //Dados do Sacado
            DmBoleto.DadosSacado(Query.FieldByName('ass_id').value);
            DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
            DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
            DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
            DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

            if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
                DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
            else
                DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;

            try
                //Gerando Boleto
                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := dsInadimplencia.DataSet.FieldByName('ASS_ID').value;
                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.gbTitulo1.DataVencimento;
                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := Query.FieldByName('total').asfloat;
                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := NossoNumero;
                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                DmBoleto.PROC_BOLETO_I.ExecProc;

                cdsAnuidAgrupadas.First;
                while not cdsAnuidAgrupadas.eof do
                begin

                    if cdsAnuidAgrupadasass_id.value = Query.FieldByName('ass_id').value then
                    begin
                        //Gerando Item do Boleto
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := cdsAnuidAgrupadasanuid_id.value;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := cdsAnuidAgrupadasDESCRICAO_ITEM.value;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := cdsAnuidAgrupadasVALOR_ITEM.asfloat;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := cdsAnuidAgrupadasVALOR_MULTA.asfloat;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := cdsAnuidAgrupadasVALOR_JUROS.asfloat;
                        DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := cdsAnuidAgrupadasVALOR_CORRECAO.asfloat;
                        DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                    end;

                    cdsAnuidAgrupadas.Next;

                end;

            except
                Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
            end;

            DmBoleto.gbTitulo1.ValorDocumento := Query.FieldByName('total').asfloat;

            for i := 0 to Dmboleto.gbTitulo1.Instrucoes.Count - 1 do
               DMConexao.ExecSQL( 'insert into boletoinstrucoes (bol_id, mensagem, ordem ) values (' + IntToStr(bol_id)+','+ QuotedStr(Dmboleto.gbTitulo1.Instrucoes[i])+' ,' + IntToStr(i+1)+');');

            Dmboleto.gbTitulo1.Imprimir_SIGCB;
            Cont := cont + 1
        end;

        Query.next;

    end;
    Query.First;
    Query.EnableControls;
    Aviso('Foram gerados/impressos ' + inttostr(cont) + ' Boletos/Guias. ');
end;


procedure TfrmInadimplencia.Agrupar;
begin
    cdsAnuidAgrupadas.Open;
    cdsAnuidAgrupadas.EmptyDataSet;
    dsInadimplencia.DataSet.First;
    while not dsInadimplencia.DataSet.eof do
    begin
        if not cdsAgrupa.locate('ass_id', dsInadimplencia.DataSet.fieldbyname('ass_id').value, []) then
        begin
            cdsAgrupa.append;
            cdsAgrupa.edit;
            cdsAgrupaANO.value := dsInadimplencia.DataSet.fieldbyname('ANO').value;
            cdsAgrupaANUID_ID.value := dsInadimplencia.DataSet.fieldbyname('ANUID_ID').value;
            cdsAgrupaASS_ID.value := dsInadimplencia.DataSet.fieldbyname('ASS_ID').value;
            cdsAgrupaCIDADE_ID.value := dsInadimplencia.DataSet.fieldbyname('CIDADE_ID').value;
            cdsAgrupaCIDADE_NOME.value := dsInadimplencia.DataSet.fieldbyname('CIDADE_NOME').value;
            cdsAgrupaCORRECAO.asfloat := dsInadimplencia.DataSet.fieldbyname('CORRECAO').value;
            cdsAgrupaCPFCNPJ.value := dsInadimplencia.DataSet.fieldbyname('CPFCNPJ').value;
            cdsAgrupaDESCRICAO.value := 'Contribuição:' + inttostr(dsInadimplencia.DataSet.fieldbyname('ano').value);
            cdsAgrupaEMP_ID.value := dsInadimplencia.DataSet.fieldbyname('EMP_ID').value;
            cdsAgrupaENDER_COMPLETO.value := dsInadimplencia.DataSet.fieldbyname('ENDER_COMPLETO').value;
            cdsAgrupaEND_BAIRRO.value := dsInadimplencia.DataSet.fieldbyname('END_BAIRRO').value;
            cdsAgrupaEND_CEP.value := dsInadimplencia.DataSet.fieldbyname('END_CEP').value;
            cdsAgrupaEND_COMPLEMENTO.value := dsInadimplencia.DataSet.fieldbyname('END_COMPLEMENTO').value;
            cdsAgrupaEND_CORRESP.value := dsInadimplencia.DataSet.fieldbyname('END_CORRESP').value;
            cdsAgrupaEND_CORRESP_DEV.value := dsInadimplencia.DataSet.fieldbyname('END_CORRESP_DEV').value;
            cdsAgrupaEND_ID.value := dsInadimplencia.DataSet.fieldbyname('END_ID').value;
            cdsAgrupaEND_LOGRADOURO.value := dsInadimplencia.DataSet.fieldbyname('END_LOGRADOURO').value;
            cdsAgrupaEND_NUMERO.value := dsInadimplencia.DataSet.fieldbyname('END_NUMERO').value;
            cdsAgrupaESTADO_NOME.value := dsInadimplencia.DataSet.fieldbyname('ESTADO_NOME').value;
            cdsAgrupaJUROS.asfloat := dsInadimplencia.DataSet.fieldbyname('JUROS').value;
            cdsAgrupaMULTA.asfloat := dsInadimplencia.DataSet.fieldbyname('MULTA').value;
            cdsAgrupaNOME.value := dsInadimplencia.DataSet.fieldbyname('NOME').value;
            cdsAgrupaNUM_PARCELA.value := dsInadimplencia.DataSet.fieldbyname('NUM_PARCELA').value;
            cdsAgrupaPARC_ID.value := dsInadimplencia.DataSet.fieldbyname('PARC_ID').value;
            cdsAgrupaREGIAO.value := dsInadimplencia.DataSet.fieldbyname('REGIAO').value;
            cdsAgrupaREGISTRO.value := dsInadimplencia.DataSet.fieldbyname('REGISTRO').value;
            cdsAgrupaSTATUSCORRESP.value := dsInadimplencia.DataSet.fieldbyname('STATUSCORRESP').value;
            cdsAgrupaTIPOCONTRIB.value := dsInadimplencia.DataSet.fieldbyname('TIPOCONTRIB').value;
            cdsAgrupaTOTAL.asfloat := dsInadimplencia.DataSet.fieldbyname('TOTAL').value;
            cdsAgrupaTPCONTRIB_ID.value := dsInadimplencia.DataSet.fieldbyname('TPCONTRIB_ID').value;
            cdsAgrupaTP_ASSOC_ID.value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
            cdsAgrupaTP_ENDER_DESCR.value := dsInadimplencia.DataSet.fieldbyname('TP_ENDER_DESCR').value;
            cdsAgrupaTP_ENDER_ID.value := dsInadimplencia.DataSet.fieldbyname('TP_ENDER_ID').value;
            cdsAgrupaVALOR.asfloat := dsInadimplencia.DataSet.fieldbyname('VALOR').value;
            cdsAgrupaVENCIMENTO.value := dsInadimplencia.DataSet.fieldbyname('VENCIMENTO').value;
            cdsAgrupa.Post;
        end
        else
        begin
            cdsAgrupa.edit;
            cdsAgrupaDESCRICAO.VALUE := cdsAgrupaDESCRICAO.VALUE + ', ' + inttostr(dsInadimplencia.DataSet.fieldbyname('ano').value);
            cdsAgrupaVALOR.asfloat := cdsAgrupaVALOR.asfloat + dsInadimplencia.DataSet.fieldbyname('VALOR').asfloat;
            cdsAgrupaMULTA.asfloat := cdsAgrupaMULTA.asfloat + dsInadimplencia.DataSet.fieldbyname('multa').asfloat;
            cdsAgrupaCORRECAO.asfloat := cdsAgrupaMULTA.asfloat + dsInadimplencia.DataSet.fieldbyname('correcao').asfloat;
            cdsAgrupaJUROS.asfloat := cdsAgrupaJUROS.asfloat + dsInadimplencia.DataSet.fieldbyname('juros').asfloat;
            cdsAgrupaTOTAL.asfloat := cdsAgrupaTOTAL.asfloat + dsInadimplencia.DataSet.fieldbyname('total').asfloat;
            cdsAgrupaVENCIMENTO.value := DataAtual;
            cdsAgrupa.post;
        end;

        cdsAnuidAgrupadas.Append;
        cdsAnuidAgrupadas.Edit;
        cdsAnuidAgrupadasanuid_id.value := dsInadimplencia.DataSet.fieldbyname('ANUID_ID').value;
        cdsAnuidAgrupadasass_id.value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
        cdsAnuidAgrupadasDESCRICAO_ITEM.value := dsInadimplencia.DataSet.fieldbyname('descricao').value;
        cdsAnuidAgrupadasVALOR_CORRECAO.value := dsInadimplencia.DataSet.fieldbyname('correcao').value;
        cdsAnuidAgrupadasVALOR_ITEM.value := dsInadimplencia.DataSet.fieldbyname('valor').value;
        cdsAnuidAgrupadasVALOR_JUROS.value := dsInadimplencia.DataSet.fieldbyname('juros').value;
        cdsAnuidAgrupadasVALOR_MULTA.value := dsInadimplencia.DataSet.fieldbyname('multa').value;
        cdsAnuidAgrupadas.post;

        dsInadimplencia.DataSet.next;
    end;

end;

procedure TfrmInadimplencia.FormCreate(Sender: TObject);
begin
    inherited;
    cdsAnuidAgrupadas.CreateDataSet;
    cdsResultado.CreateDataSet;
end;

procedure TfrmInadimplencia.gridCobrancaTitleClick(Column: TColumn);
begin
    inherited;
    tclientdataset(dsInadimplencia.DataSet).IndexFieldNames := Column.FieldName;
end;

procedure TfrmInadimplencia.BitBtn2Click(Sender: TObject);
var
    i: integer;
begin
    try
        strtoint(edanoInadini.Text);
    except
        erro('Digite o ano inicial corretamente. ');
        edanoInadini.setfocus;
        Exit;
    end;

    try
        strtoint(edanoInadfim.Text);
    except
        erro('Digite o ano final corretamente corretamente. ');
        edanoInadfim.setfocus;
        Exit;
    end;


    if not (DMAssociado.dsEmp_Regiao.DataSet.locate('regiao', lkpLocalidade.text, [])) then
    begin
        erro('Digite a localidade corretamente. ');
        exit;
    end;

    ExibeAguarde('Localizando Dados de Inadimplência...');
    dsInadimplencia.dataset.Close;

    for i := 0 to TClientDataset(dsInadimplencia.dataset).Params.Count - 1 do
        TClientDataset(dsInadimplencia.dataset).Params[i].clear;

    //Localidade
    TClientDataset(dsInadimplencia.dataset).Params.ParamByName('EMP_ID_PAR').value := DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;

    // Tipo de Cobranca
    TClientDataset(dsInadimplencia.dataset).Params.ParamByName('TIPOCONTRIBPAR').value := cbTipoContrib.ItemIndex + 1;

    // Ano Inad
    TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANOINADini').value := strtoint(edanoInadini.Text);
    TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANOINADfim').value := strtoint(edanoInadfim.Text);

    // registro ini
    if (trim(edRegini.text) <> '') then
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('REGPARINI').value := edRegini.Text;

    // registro fim
    if (trim(edRegFim.text) <> '') then
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('REGPARFIM').value := edRegFim.Text;

    if cbaberto.ItemIndex = 0 then
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANTERIOR_ABERTO').value := -1
    else
        if cbaberto.ItemIndex = 1 then
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANTERIOR_ABERTO').value := 0
    else
        if cbaberto.ItemIndex = 2 then
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('ANTERIOR_ABERTO').value := 1;

    if edTpPessoa.ItemIndex = 0 then // todos os tipos
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('TIPOPESSOA').value := 0
    else
        if edTpPessoa.ItemIndex = 1 then // Fisica
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('TIPOPESSOA').value := 2
    else
        if edTpPessoa.ItemIndex = 2 then // Juridica
        TClientDataset(dsInadimplencia.dataset).Params.ParamByName('TIPOPESSOA').value := 1;

    TClientDataset(dsInadimplencia.dataset).Open;

    //labtotal.Caption:= inttostr(TClientDataset(dsInadimplencia.dataset).recordcount);
    CalcTotal;

    EscondeAguarde;

    AnexarArquivo := 0;
    Cobranca := 0;
    GerarPDF := 0;
end;

procedure TfrmInadimplencia.gridCobrancaDblClick(Sender: TObject);
begin
    inherited;
    try Application.CreateForm(TfrmNovoAssoc, frmNovoAssoc);
        frmNovoAssoc.RefreshAll(DmFinancas.cdsRelatInadimplenteASS_ID.value);
        frmNovoAssoc.Caption := 'Dados de ' + DmFinancas.cdsRelatInadimplenteNOME.value;
        frmNovoAssoc.showmodal;
    finally
        frmNovoAssoc.free;
    end;
end;

procedure TfrmInadimplencia.Boleto_Conferativa_1Boleto(AnoiniConf,
    anofimConf: integer);
var
    NossoNumero, descricaoconf: string;
    bol_id, i: Integer;
    valorconf: real;
begin
    sdsDadosContribConfed.close;
    sdsDadosContribConfed.Params.ParamByName('ass_id').value := dsInadimplencia.dataset.fieldbyname('ass_id').value;
    sdsDadosContribConfed.Params.ParamByName('dataatual').value := DataAtual;
    sdsDadosContribConfed.Params.ParamByName('tipo').value := 2;
    sdsDadosContribConfed.Params.ParamByName('ano1').value := AnoiniConf;
    sdsDadosContribConfed.Params.ParamByName('ano2').value := anofimConf;
    sdsDadosContribConfed.open;
    descricaoconf := '';
    Valorconf := 0;
    if sdsDadosContribConfed.recordcount > 0 then
    begin

        if sdsDadosContribConfed.recordcount = 1 then
        begin
            descricaoconf := 'Contribuição Confederativa ' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value);
            valorconf := sdsDadosContribConfed.fieldbyname('total').value;
            //Cancelando boleto ou tirando o vinculo com Boleto_itens
            DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value := sdsDadosContribConfed.FieldByName('anuid_id').value;
            DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value := 0;
            DmBoleto.PROC_BOLETO_STATUS.ExecProc;

        end
        else
        begin
            sdsDadosContribConfed.first;
            while not sdsDadosContribConfed.eof do
            begin
                Valorconf := Valorconf + sdsDadosContribConfed.fieldbyname('total').value;
                if descricaoconf = '' then
                    descricaoconf := inttostr(sdsDadosContribConfed.fieldbyname('ano').value)
                else
                    descricaoconf := descricaoconf + '/' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value);

                DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value := sdsDadosContribConfed.FieldByName('anuid_id').value;
                DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value := 0;
                DmBoleto.PROC_BOLETO_STATUS.ExecProc;

                sdsDadosContribConfed.Next;
            end;

            descricaoconf := 'Contribuição Confederativa ' + descricaoconf;
        end;

        //Dados da Conta e Cedente
        DmBoleto.DadosContaCedente(dsInadimplencia.dataset.fieldbyname('EMP_ID').value, 2);
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo := DmBoleto.cdsContaBAN_CODIGO.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
        DmBoleto.gbTitulo1.SeuNumero := '';
        DmBoleto.gbTitulo1.DataDocumento := Dataatual;
        DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

        DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
        DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
        DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

        DmBoleto.gbTitulo1.EspecieDocumento := edDuplicataMercantil;
        DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

        DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
        DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: ' + MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
        DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
        //Fim dados do Cedente

        Dmboleto.gbTitulo1.Instrucoes.Clear;
        Dmboleto.gbTitulo1.Instrucoes.Add(descricaoconf + ': ' + formatfloat(',0.00 ', valorconf));

        Dmboleto.gbTitulo1.DataVencimento := DataVencCOnf;

        DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

        if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
        begin

               DmBoleto.sdsNossoNumero.close;
               DmBoleto.sdsNossoNumero.Open;

               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                   NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14)
               else
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   NossoNumero := '24' + '8'+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);

               DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
               DmBoleto.gbTitulo1.Carteira := 'SR';
        end
        else
       if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
       begin
           DmBoleto.sdsNossoNumeroCR.close;
           DmBoleto.sdsNossoNumeroCR.Open;

           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
               NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'2'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
           else
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
               NossoNumero := '14' + '82'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

           DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
           DmBoleto.gbTitulo1.Carteira := 'RG';
       end;

        //Dados do Sacado
        DmBoleto.DadosSacado(dsInadimplencia.DataSet.FieldByName('ass_id').value);
        DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
        DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
        DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

        if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
            DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
        else
            DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;

        if not ((maladireta = 1) and (Cobranca = 0) and (GerarPDF = 0)) then
        begin
            try
                //Gerando Boleto
                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := dsInadimplencia.DataSet.FieldByName('ASS_ID').value;
                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.gbTitulo1.DataVencimento;
                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := valorconf;
                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := NossoNumero;
                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                DmBoleto.PROC_BOLETO_I.ExecProc;

                //Gerando Item do Boleto
                sdsDadosContribConfed.First;
                while not sdsDadosContribConfed.eof do
                begin
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := sdsDadosContribConfed.fieldbyname('anuid_id').value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := 'Contribuição Confederativa ' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value);
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := sdsDadosContribConfed.fieldbyname('total').value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                    sdsDadosContribConfed.Next;
                end;
            except
                Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
            end;

        end;
        DmBoleto.gbTitulo1.ValorDocumento := valorconf;

       for i := 0 to Dmboleto.gbTitulo1.Instrucoes.Count - 1 do
          DMConexao.ExecSQL( 'insert into boletoinstrucoes (bol_id, mensagem, ordem ) values (' + IntToStr(bol_id)+','+ QuotedStr(Dmboleto.gbTitulo1.Instrucoes[i])+' ,' + IntToStr(i+1)+');');


        if GerarPDF = 1 then
        begin
            try
                if Dmboleto.gbTitulo1.GerarPDF_SIGCB(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value) + '.pdf') = 1 then
                begin
                    sleep(2000);
                    DMConexao.Log('Geração de PDF Sindical - Tela de Inadimplencia: ' + nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value) + '.pdf', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
                end;

            except
                //
            end;

            if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
            begin

                if maladireta = 1 then
                begin
                    EnviarMalaDireta(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + inttostr(sdsDadosContribConfed.fieldbyname('ano').value) + '.pdf', 'CONF');
                end;

                if (AnexarArquivo = 1) and (jaanexado = 0) then
                begin
                    AnexarArquivosAmala;
                    jaanexado := 1;
                end;
            end;
        end
        else
            if maladireta = 1 then
        begin

            if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
            begin

                EnviarMalaDireta('', '', 'CONF');

                if (AnexarArquivo = 1) and (jaanexado = 0) then
                begin
                    AnexarArquivosAmala;
                    jaanexado := 1;
                end;
            end;
        end
        else
        begin
            Dmboleto.gbTitulo1.Imprimir_SIGCB;
            DMConexao.Log('Impressão de Guia Confederativa - Tela de Inadimplencia', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
        end;
    end;
end;

procedure TfrmInadimplencia.Boleto_Conferativa_Individual(ano: integer);
var
    NossoNumero: string;
    bol_id: Integer;
begin
    sdsDadosContrib.close;
    sdsDadosContrib.Params.ParamByName('ass_id').value := dsInadimplencia.dataset.fieldbyname('ass_id').value;
    sdsDadosContrib.Params.ParamByName('dataatual').value := DataAtual;
    sdsDadosContrib.Params.ParamByName('tipo').value := 2;
    sdsDadosContrib.Params.ParamByName('ano').value := ano;
    sdsDadosContrib.open;

    if sdsDadosContrib.recordcount > 0 then
    begin
        //Dados da Conta e Cedente
        DmBoleto.DadosContaCedente(dsInadimplencia.dataset.fieldbyname('EMP_ID').value, 2);
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo := DmBoleto.cdsContaBAN_CODIGO.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
        DmBoleto.gbTitulo1.SeuNumero := '';
        DmBoleto.gbTitulo1.DataDocumento := Dataatual;
        DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

        DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
        DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
        DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

        DmBoleto.gbTitulo1.EspecieDocumento := edDuplicataMercantil;
        DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

        DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
        DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
        DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: ' + MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
        DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
        DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
        //Fim dados do Cedente

        Dmboleto.gbTitulo1.Instrucoes.Clear;
        Dmboleto.gbTitulo1.Instrucoes.Add('Contribuição Confederativa ' + inttostr(ano) + ': ' + formatfloat(',0.00 ', sdsDadosContrib.FieldByName('total').value));

        //Cancelando boleto ou tirando o vinculo com Boleto_itens
        DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value := sdsDadosContrib.FieldByName('anuid_id').value;
        DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value := 0;
        DmBoleto.PROC_BOLETO_STATUS.ExecProc;

        Dmboleto.gbTitulo1.DataVencimento := DataVencCOnf;

        DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

        if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
        begin

           DmBoleto.sdsNossoNumero.close;
           DmBoleto.sdsNossoNumero.Open;

           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
               NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14)
           else
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
               NossoNumero := '24' + '8'+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);

           DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
           DmBoleto.gbTitulo1.Carteira := 'SR';
        end
        else
        if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
        begin
           DmBoleto.sdsNossoNumeroCR.close;
           DmBoleto.sdsNossoNumeroCR.Open;

           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
               NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'2'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
           else
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
               NossoNumero := '14' + '32'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

           DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
           DmBoleto.gbTitulo1.Carteira := 'RG';
        end;

        //Dados do Sacado
        DmBoleto.DadosSacado(dsInadimplencia.DataSet.FieldByName('ass_id').value);
        DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
        DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
        DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
        DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

        if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
            DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
        else
            DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;



        if not ((maladireta = 1) and (Cobranca = 0) and (GerarPDF = 0)) then
        begin
            try
                //Gerando Boleto
                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := dsInadimplencia.DataSet.FieldByName('ASS_ID').value;
                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.gbTitulo1.DataVencimento;
                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := sdsDadosContrib.FieldByName('total').asfloat;
                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := NossoNumero;
                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                DmBoleto.PROC_BOLETO_I.ExecProc;

                //Gerando Item do Boleto
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := sdsDadosContrib.fieldbyname('anuid_id').value;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := 'Contribuição Confederativa ' + inttostr(ano);
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := sdsDadosContrib.fieldbyname('total').value;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
            except
                Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
            end;
        end;
        DmBoleto.gbTitulo1.ValorDocumento := sdsDadosContrib.FieldByName('total').asfloat;

        if GerarPDF = 1 then
        begin
            try
                if Dmboleto.gbTitulo1.GerarPDF_SIGCB(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + inttostr(ano) + '.pdf') = 1 then
                begin
                    sleep(2000);
                    DMConexao.Log('Geração de PDF Sindical - Tela de Inadimplencia: ' + nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + DmBoleto.Guias1.Exercicio + '.pdf', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
                end;

            except
                //
            end;
            if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
            begin
                if maladireta = 1 then
                begin
                    EnviarMalaDireta(pastadestino + '\', nomeinicialarq + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_Conf_' + inttostr(ano) + '.pdf', 'CONF');
                end;

                if (AnexarArquivo = 1) and (jaanexado = 0) then
                begin
                    AnexarArquivosAmala;
                    jaanexado := 1;
                end;
            end;
        end
        else
            if maladireta = 1 then
        begin
            if dsInadimplencia.DataSet.FieldByName('EMAIL').value <> '' then
            begin

                EnviarMalaDireta('', '', 'CONF');

                if (AnexarArquivo = 1) and (jaanexado = 0) then
                begin
                    AnexarArquivosAmala;
                    jaanexado := 1;
                end;
            end;

        end
        else
        begin
            Dmboleto.gbTitulo1.Imprimir_SIGCB;
            DMConexao.Log('Impressão de Guia Confederativa - Tela de Inadimplencia', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
        end;
    end;
end;

procedure TfrmInadimplencia.GeraPlanilhaLoc(Query: tClientDataset;
    grid: TDbGrid);
var
    Excel: Variant;
    Linha, i: Integer;
    total: real;
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
            for i := 0 to Grid.Columns.Count - 1 do
            begin
                if (grid.Columns[i].Visible = true) then
                    Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1] := grid.Columns[i].Title.Caption;
            end;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1] := 'Sindical (Total)';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 2] := 'Confederativa (Total)';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 3] := 'Sindical + Confederativa (Total)';

            linha := linha + 1;

            while not Query.Eof do
            begin
                for i := 0 to Grid.Columns.Count - 1 do
                begin
                    if (grid.Columns[i].Visible = true) then
                    begin
                        if grid.DataSource.DataSet.Fieldbyname(grid.Columns[i].fieldname) is tfmtbcdfield then
                        begin
                            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1].numberformat := 'R$ #.##0,00_);(R$ #.##0,00)';
                            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1] := grid.Columns.Items[i].Field.asfloat //formatfloat(',0.00',dbgrid.Columns.Items[i-1].Field.Value)
                        end
                        else
                        begin
                            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1].numberformat := '@';
                            Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1] := grid.Columns.Items[i].Field.AsString;
                        end;
                    end;
                end;

                total := 0;
                sdsCalcTotal.close;
                sdsCalcTotal.params.ParamByName('ass_id').value := query.fieldbyname('ass_id').value;
                sdsCalcTotal.params.ParamByName('dataatual').value := DataAtual;
                sdsCalcTotal.params.ParamByName('tipo').value := 1;
                sdsCalcTotal.params.ParamByName('ano1').value := ExtractYear(DataAtual) - 5;
                sdsCalcTotal.params.ParamByName('ano2').value := ExtractYear(DataAtual);
                sdsCalcTotal.open;

                total := total + sdsCalcTotal.fieldbyname('total').asfloat;

                //Sindical
                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1].numberformat := 'R$ #.##0,00_);(R$ #.##0,00)';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 1] := total;

                //Confederativa
                sdsCalcTotal.close;
                sdsCalcTotal.params.ParamByName('tipo').value := 2;
                sdsCalcTotal.open;

                total := total + sdsCalcTotal.fieldbyname('total').asfloat;
                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 2].numberformat := 'R$ #.##0,00_);(R$ #.##0,00)';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 2] := sdsCalcTotal.fieldbyname('total').asfloat;

                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 3].numberformat := 'R$ #.##0,00_);(R$ #.##0,00)';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha, i + 3] := total;

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


procedure TfrmInadimplencia.acMalaDiretaExecute(Sender: TObject);
begin
    inherited;
    dsInadimplencia.DataSet.Filtered := false;
    dsInadimplencia.DataSet.filter := 'email<>''''';
    dsInadimplencia.DataSet.filtered := true;
    CalcTotal;



    { dsInadimplencia.DataSet.Filtered:=false;
     dsInadimplencia.DataSet.filter :='';
     dsInadimplencia.DataSet.filtered :=true;
     CalcTotal;
     }

end;

procedure TfrmInadimplencia.CalcTotal;
begin
    labtotal.Caption := inttostr(TClientDataset(dsInadimplencia.dataset).recordcount);
end;

procedure TfrmInadimplencia.EnviarMalaDireta(caminhocopy, arquivo, tipo: string);
var
    ano,comando: string;
    retorno:Integer;
begin
    if tipo = 'SIND' then
    begin
        ano := DmBoleto.Guias1.Exercicio;
    end
    else
        if tipo = 'CONF' then
        ano := inttostr(anoCONF);

    if caminhocopy = '' then
    begin

        if TIPO = 'SIND' then
        begin

            try

                if Dmboleto.Guias1.GerarPDF_SIGCB(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\', Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf') = 1 then
                begin
                    if ass_idold <> dsInadimplencia.DataSet.FieldByName('ass_id').value then
                    begin
                        DMMalaDireta.sdsMalaItemID.close;
                        DMMalaDireta.sdsMalaItemID.open;
                        item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;
                        ass_idold := dsInadimplencia.DataSet.FieldByName('ass_id').value;

                        DMMalaDireta.PROC_MALADIRETAITEM_I.close;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsInadimplencia.DataSet.fieldbyname('email').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value := 0;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value := dsInadimplencia.DataSet.fieldbyname('nome').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

                    end;

                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value := dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf';
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value := item_id;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

                    DMConexao.Log('Enviado para Mala Direta - Tela de Inadimplencia Mala_id= ' + inttostr(idmala) + ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);

                end
                else
                    testeok := 0;
            except
                //
            end;
        end
        else
            if tipo = 'CONF' then
        begin

            try

                if Dmboleto.gbTitulo1.GerarPDF_SIGCB(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\', Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf') = 1 then
                begin
                    if ass_idold <> dsInadimplencia.DataSet.FieldByName('ass_id').value then
                    begin
                        DMMalaDireta.sdsMalaItemID.close;
                        DMMalaDireta.sdsMalaItemID.open;
                        item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;
                        ass_idold := dsInadimplencia.DataSet.FieldByName('ass_id').value;

                        DMMalaDireta.PROC_MALADIRETAITEM_I.close;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsInadimplencia.DataSet.fieldbyname('email').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value := 0;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value := dsInadimplencia.DataSet.fieldbyname('nome').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
                        DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

                    end;

                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value := dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf';
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value := item_id;
                    DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

                    DMConexao.Log('Enviado para Mala Direta - Tela de Inadimplencia Mala_id= ' + inttostr(idmala) + ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + Dmconexao.sdsConfigNOMEINICIALARQPDF.value + '_' + copy(dsInadimplencia.DataSet.FieldByName('registro').value, 1, 7) + '_' + inttostr(dsInadimplencia.DataSet.FieldByName('ass_id').value) + '_' + TIPO + '_' + ano + '.pdf', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);

                end
                else
                    testeok := 0;
            except
                //
            end;
        end;
    end
    else
        if caminhocopy <> '' then
    begin
        try
       // while not fileexists(caminhocopy +  arquivo) do ;

        comando := 'xcopy "' + pchar(caminhocopy +  arquivo) + '" "' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '" /y/c/r/a';
        retorno := WinExec(PChar(comando), SW_HIDE);
        if  retorno > 31    then
           // if CopyFile(PChar(caminhocopy +  arquivo), PChar(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value{ + '\' + arquivo}), true) then
            begin
                if ass_idold <> dsInadimplencia.DataSet.FieldByName('ass_id').value then
                begin

                    DMMalaDireta.sdsMalaItemID.close;
                    DMMalaDireta.sdsMalaItemID.open;
                    item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;
                    ass_idold := dsInadimplencia.DataSet.FieldByName('ass_id').value;

                    DMMalaDireta.PROC_MALADIRETAITEM_I.close;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsInadimplencia.DataSet.fieldbyname('email').value;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value := 0;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value := dsInadimplencia.DataSet.fieldbyname('nome').value;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
                    DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

                end;

                DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
                DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
                DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value := dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + arquivo;
                DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value := item_id;
                DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

                DMConexao.Log('Enviado para Mala Direta: ' + inttostr(idmala) + ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + arquivo, 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
            end
            else
                testeok := 0;

        except
            Erro('Erro ao copiar o arquivo. Arquivo inexistente ou o usuário não tem permissão de acesso à pasta no Servidor. ');
        end;

    end;



end;

procedure TfrmInadimplencia.AnexarArquivosAmala;
begin
    if frmInadimpCobrancaOpcoes.cdsArquivosAnexo.recordcount = 0 then
    begin
          DMMalaDireta.sdsMalaItemID.close;
          DMMalaDireta.sdsMalaItemID.open;
          item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;
          DMMalaDireta.PROC_MALADIRETAITEM_I.close;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsInadimplencia.DataSet.fieldbyname('email').value;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value := 0;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value := dsInadimplencia.DataSet.fieldbyname('nome').value;
          DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
          DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;
          DMConexao.Log('Enviado para Mala Direta: ' + inttostr(idmala) + ' sem anexo.', 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
    end
    else  // tiver anexo(s)
    begin
          frmInadimpCobrancaOpcoes.cdsArquivosAnexo.First;
          while not frmInadimpCobrancaOpcoes.cdsArquivosAnexo.Eof do
          begin
              if not FileExists(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + ExtractFileName(frmInadimpCobrancaOpcoes.cdsArquivosAnexonomearquivo.value)) then
                  CopyFile(PChar(frmInadimpCobrancaOpcoes.cdsArquivosAnexonomearquivo.value), PChar(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + ExtractFileName(frmInadimpCobrancaOpcoes.cdsArquivosAnexonomearquivo.value)), false);

              if ass_idold <> dsInadimplencia.DataSet.FieldByName('ass_id').value then
              begin
                  DMMalaDireta.sdsMalaItemID.close;
                  DMMalaDireta.sdsMalaItemID.open;
                  item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;
                  ass_idold := dsInadimplencia.DataSet.FieldByName('ass_id').value;

                  DMMalaDireta.PROC_MALADIRETAITEM_I.close;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsInadimplencia.DataSet.fieldbyname('email').value;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value := 0;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value := dsInadimplencia.DataSet.fieldbyname('ass_id').value;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value := dsInadimplencia.DataSet.fieldbyname('nome').value;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := dsInadimplencia.DataSet.fieldbyname('TP_ASSOC_ID').value;
                  DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

              end;

              DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
              DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
              DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value := dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + ExtractFileName(frmInadimpCobrancaOpcoes.cdsArquivosAnexonomearquivo.value);
              DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value := item_id;
              DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

              DMConexao.Log('Enviado para Mala Direta: ' + inttostr(idmala) + ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value + '\' + ExtractFileName(frmInadimpCobrancaOpcoes.cdsArquivosAnexonomearquivo.value), 'O', dsInadimplencia.DataSet.FieldByName('ass_id').value);
              {end
              else
                  testeok :=0;
               }
              frmInadimpCobrancaOpcoes.cdsArquivosAnexo.Next;
          end;
    end;
    frmInadimpCobrancaOpcoes.cdsArquivosAnexo.First;




end;

procedure TfrmInadimplencia.acLoteaddExecute(Sender: TObject);
var
    idLote, ano1, ano2, cont: integer;
    nomeLote: string;
    totSim, Totnao: integer;

begin
    inherited;

    if cbTipoContrib.ItemIndex > 0 then
    begin
        Aviso('Relatório com filtro apenas de Confederativa não pode ser adicionado a um Lote. ');
        Exit;
    end;
    cdsResultado.EmptyDataSet;
    if dsInadimplencia.dataset.Active = false then
        Exit;
    if dsInadimplencia.DataSet.RecordCount = 0 then
        Exit;

    try application.createform(TfrmLoteAdicionarRegs, frmLoteAdicionarRegs);
        tplote:='C';
        frmLoteAdicionarRegs.editLote.text := Dmlotes.NovoNumLote(tplote);
        if frmLoteAdicionarRegs.showmodal = mrok then
        begin
            idLote := frmLoteAdicionarRegs.cdsAuxidlote.value;
            nomeLote := frmLoteAdicionarRegs.cdsAuxnomelote.value;
            ano1 := strtoint(frmLoteAdicionarRegs.editAno1.text);
            ano2 := strtoint(frmLoteAdicionarRegs.editAno2.text);

            GeraNOtif := 0;
           // if frmLoteAdicionarRegs.cbGeraNotificacoes.checked = true then
           //     GeraNOtif := 1;

         {   if GeraNOtif = 1 then
            begin
                SaveDialog1.FileName := 'Notif';
                if SaveDialog1.Execute then
                    nomearquivo := SaveDialog1.FileName
                else
                    exit;

                resp := Confirma('Deseja imprimir as notificações agora?');
            end;
                    }

            ExibeAguarde('Adicionando Cadastros no Lote "' + DMLotes.cdsLocLotesNOMELOTE.value + '". Por favor, aguarde...');
            cont :=0;
            dsInadimplencia.DataSet.DisableControls;
            dsInadimplencia.DataSet.First;
            while not dsInadimplencia.DataSet.eof do
            begin
                cont := cont + 1;
                labcontalabel.Visible:=true;
                labconta.Visible:=true;
                labconta.Caption :=inttostr(cont)+ ' de ' + labtotal.caption;
                Application.ProcessMessages;

                sdsVerExisteEmLote.close;
                sdsVerExisteEmLote.Params.ParamByName('ass_id').value := dsInadimplencia.DataSet.FieldByName('ass_id').value;
                sdsVerExisteEmLote.open;
                if sdsVerExisteEmLoteQTDE.value > 0 then
                    AddResultado(0, 'Cadastro já existente em outro Lote não finalizado. ')
                else
                begin
                    AddnoLote(idlote, dsInadimplencia.DataSet.FieldByName('ass_id').value, ano1, ano2, frmLoteAdicionarRegs.cbConfeds.Checked);

                end;
                dsInadimplencia.DataSet.next;
            end;
            EscondeAguarde;
            dsInadimplencia.DataSet.EnableControls;
            dsInadimplencia.DataSet.First;
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

procedure TfrmInadimplencia.AddnoLote(idLote, ass_id, ano1, ano2: integer; conf: boolean);
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

            arquivo := ExtractFilePath(Application.ExeName) + 'docs\notificacao1.doc';

            try

                WinWord := CreateOleObject('Word.Application');

                Docs := WinWord.Documents;
                Doc := Docs.Open(arquivo);

                sdsNumNotificacao.open;
                Doc.Content.Find.Execute(FindText := '<#numnotificaco#>', replacewith := sdsNumNotificacaoNUMNOTIF.value);
                sdsNumNotificacao.close;
                Doc.Content.Find.Execute(FindText := '<#nome#>', replacewith := dsInadimplencia.DataSet.fieldbyname('nome').value);
                Doc.Content.Find.Execute(FindText := '<#dataextenso#>', replacewith := FormatDateTime('"' + 'Rio de Janeiro' + ', "dd "de" mmmm "de" yyyy', DataAtual) + '.');

                Doc.saveas(nomearquivo + '_' + inttostr(dsInadimplencia.DataSet.fieldbyname('ass_id').value) + '_' + stringreplace(dsInadimplencia.DataSet.fieldbyname('registro').value, '/', '', [rfreplaceall]) + '_' + Stringreplace(Stringreplace(datetostr(dataatual), '/', '', [rfreplaceall]), '.', '', [rfreplaceall]) + '.doc');

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
                    Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + dsInadimplencia.DataSet.fieldbyname('registro').value);
                end;

            except
                WinWord.quit;
                Aviso('Erro ao gerar a Notificação para o Cadastro nº ' + dsInadimplencia.DataSet.fieldbyname('registro').value);
            end;
        end;
    end;

end;

procedure TfrmInadimplencia.AddResultado(sit: integer; motivo: string);
begin
    cdsResultado.Append;
    cdsResultado.Edit;
    cdsResultadosituacao.value := sit;
    cdsResultadoregistro.value := dsInadimplencia.DataSet.fieldbyname('registro').value;
    cdsResultadonome.value := dsInadimplencia.DataSet.fieldbyname('nome').value;
    cdsResultadomotivo.value := motivo;
    cdsResultado.Post;
end;

end.

