unit UCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, ActnList, Buttons,
  ToolWin, ComCtrls, StdCtrls, Mask, Grids, DBGrids, DBCtrls, JvToolEdit,
  JvLookup, DB, dbClient, FMTBcd, Provider, SqlExpr, DBLocal, DBLocalS;

type
  TfrmCobranca = class(TModeloComum)
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btLocalizar: TBitBtn;
    gridCobranca: TDBGrid;
    Label1: TLabel;
    cbTipoContrib: TComboBox;
    Label2: TLabel;
    edAno: TMaskEdit;
    ToolBar1: TToolBar;
    spGerarBoleto: TSpeedButton;
    spImprimirEtiq: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    ActionList1: TActionList;
    acGerarBoletoGuia: TAction;
    acEtiqueta: TAction;
    acGerarPlanilha: TAction;
    Label4: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    edRegistroIni: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    lkpLocalidade: TJvLookupEdit;
    dsCobranca: TDataSource;
    edAnoEmdia: TMaskEdit;
    Label7: TLabel;
    cdsTp_Pessoa: TClientDataSet;
    cdsTp_PessoaTP_ASSOC_ID: TIntegerField;
    cdsTp_PessoaTP_ASSOC_DESC: TStringField;
    sdsTp_Pessoa: TSQLDataSet;
    dspTp_Pessoa: TDataSetProvider;
    dsTp_Pessoa: TDataSource;
    edTpPessoa: TJvLookupEdit;
    Label8: TLabel;
    sdsDadosConf: TSQLClientDataSet;
    sdsDadosConfDESCRICAO: TStringField;
    sdsDadosConfANUID_ID: TIntegerField;
    sdsDadosConfVALOR: TFMTBCDField;
    sdsDadosConfVENCIMENTO: TDateField;
    Panel3: TPanel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    JvLookupEdit1: TJvLookupEdit;
    MaskEdit4: TMaskEdit;
    JvLookupEdit2: TJvLookupEdit;
    cbaberto: TComboBox;
    Label16: TLabel;
    edRegistroFinal: TMaskEdit;
    Label3: TLabel;
    spPdfBoleto: TSpeedButton;
    acGeraPdf: TAction;
    SaveDialog1: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure gridCobrancaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Boletos_Confederativa(pdf:integer=0);
    procedure Boletos_Confederativa_de_Sindical(pdf:integer=0);
    procedure Boletos_Sindical(pdf:integer=0);
    procedure acGerarBoletoGuiaExecute(Sender: TObject);
    procedure acGerarBoletoGuiaUpdate(Sender: TObject);
    procedure Etiquetas_Envelopes(Query:TClientDataset);
    procedure acEtiquetaExecute(Sender: TObject);
    procedure acEtiquetaUpdate(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure acGerarPlanilhaUpdate(Sender: TObject);
    procedure gridCobrancaTitleClick(Column: TColumn);
    procedure edRegistroIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRegistroFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acGeraPdfExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCobranca: TfrmCobranca;
  caminhopdf,arquivopdf,registropdf:string;


implementation

uses UDMAssociado, UDmFinancas, UFuncoes, UBoletoVencinento,
   UDmBoleto, UDMConexao, uGuias, gbCobranca, UOpcoes_Etiq_Envelop,
  UEtiquetas, UEnvelopeTipo;

{$R *.dfm}

procedure TfrmCobranca.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
begin
  inherited;
  cdsTp_Pessoa.Open;
  DMAssociado.dsEmp_Regiao.dataset.close;
  DMAssociado.dsEmp_Regiao.dataset.open;
  DMAssociado.dsEmp_Regiao.dataset.first;
  lkpLocalidade.Text:=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('Regiao').value;
  If ExtractMonth(DataAtual) <= 6 then
     edano.text := inttostr( ExtractYear(DataAtual))
  else
    edano.text := inttostr( ExtractYear(DataAtual)+1);

  dsCobranca.DataSet.close;

end;

procedure TfrmCobranca.btLocalizarClick(Sender: TObject);
var
   i:integer;
begin
   try
     strtoint(edano.Text);
   except
     erro('Digite o ano corretamente. ');
     abort;
   end;

   If not (DMAssociado.dsEmp_Regiao.DataSet.locate('regiao',lkpLocalidade.text, [] )) then
   begin
     erro('Digite a localidade corretamente. ');
     abort;
   end;

   ExibeAguarde('Localizando Dados de Cobrança...');
   dsCobranca.dataset.Close;

   for i := 0 to 9 do
      DmFinancas.cdscobranca.Params[i].clear;

   // Tipo de Cobranca
   TClientDataset(dsCobranca.dataset).Params.ParamByName('TIPOCONTRIBPAR').value := cbTipoContrib.ItemIndex + 1;

   // Ano
   TClientDataset(dsCobranca.dataset).Params.ParamByName('ANOPAR').value :=strtoint(edano.Text);

   // Em dia até
 //  If (edEmdiaAte.text<>'  /  /    ' ) then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('EMDIAATE').clear;

   // Em dia Com
   If (edAnoEmdia.text<>'' ) then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('emdiacom').value :=strtoint(edAnoEmdia.Text);


   If cbaberto.text ='' then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('ABERTOATRAS').value :=-1
   else
   If cbaberto.text ='Não' then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('ABERTOATRAS').value :=0
   else
   If cbaberto.text ='Sim' then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('ABERTOATRAS').value :=1;

   // Tipo de Pessoa
   If (edTpPessoa.text<>'' ) then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('TIPOASSOC').value :=cdsTp_PessoaTP_ASSOC_ID.value;

   // registro
   If (edRegistroini.text<>'' ) then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('REGPAR').value :=edRegistroIni.Text;
   If (edRegistrofinal.text<>'' ) then
      TClientDataset(dsCobranca.dataset).Params.ParamByName('REGPARFinal').value :=edRegistroFinal.Text;


   //Localidade
   TClientDataset(dsCobranca.dataset).Params.ParamByName('EMP_ID_PAR').value :=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;


   TClientDataset(dsCobranca.dataset).Params.ParamByName('datatual').value :=DataAtual;

   TClientDataset(dsCobranca.dataset).Open;

   labtotal.Caption:= inttostr(TClientDataset(dsCobranca.dataset).recordcount);

   EscondeAguarde;

end;

procedure TfrmCobranca.gridCobrancaDrawColumnCell(Sender: TObject;
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

procedure TfrmCobranca.Boletos_Confederativa(pdf:integer=0);
var
  DataVenc:TDatetime;
  bol_id, Cont:integer;
  NossoNumero:string;
begin
    Try application.createform(TfrmBoletoVencinento,frmBoletoVencinento);
    if frmBoletoVencinento.showmodal= mrok then
    begin
        If frmBoletoVencinento.radDataVenc.Checked  = true then
           DataVenc := strtodate(frmBoletoVencinento.eddatavenc.Text)
        else
           DataVenc := DataNula;
    end
    else
      abort;
    finally
    frmBoletoVencinento.free;
    end;

    dsCobranca.DataSet.First;
    dsCobranca.DataSet.DisableControls;
    While not dsCobranca.DataSet.eof do
    begin
       If (dsCobranca.DataSet.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (dsCobranca.DataSet.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
       begin
           //Dados da Conta e Cedente
           DmBoleto.DadosContaCedente(dsCobranca.dataset.fieldbyname('EMP_ID').value, 2);
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  DmBoleto.cdsContaBAN_CODIGO.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
           DmBoleto.gbTitulo1.SeuNumero := '';
           DmBoleto.gbTitulo1.DataDocumento := Dataatual;
           DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

           DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
           DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

           DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
           DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
           DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
           //Fim dados do Cedente

           Dmboleto.gbTitulo1.Instrucoes.Clear;
           Dmboleto.gbTitulo1.Instrucoes.Add(dsCobranca.DataSet.FieldByName('descricao').value +'('+dsCobranca.DataSet.FieldByName('tipocontrib').value+'): ' + formatfloat(',0.00 ', dsCobranca.DataSet.FieldByName('total').value));

           //Cancelando boleto ou tirando o vinculo com Boleto_itens
           DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= dsCobranca.DataSet.FieldByName('anuid_id').value;
           DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value:=  dsCobranca.DataSet.FieldByName('parc_id').value;
           DmBoleto.PROC_BOLETO_STATUS.ExecProc;

           If DataVenc = DataNula then
               Dmboleto.gbTitulo1.DataVencimento := dsCobranca.DataSet.FieldByName('vencimento').value
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
           DmBoleto.DadosSacado(dsCobranca.DataSet.FieldByName('ass_id').value);
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
              DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value :=dsCobranca.DataSet.FieldByName('ass_id').value;
              DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
              DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
              DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.gbTitulo1.DataVencimento;
              DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
              DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := dsCobranca.DataSet.FieldByName('total').asfloat;
              DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := NossoNumero;
              DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
              DmBoleto.PROC_BOLETO_I.ExecProc;

              //Gerando Item do Boleto
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := dsCobranca.DataSet.FieldByName('Anuid_Id').value;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := dsCobranca.DataSet.FieldByName('descricao').value;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := dsCobranca.DataSet.FieldByName('total').asfloat;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

           except
              Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
           end;

           DmBoleto.gbTitulo1.ValorDocumento := dsCobranca.DataSet.FieldByName('total').asfloat;


           if pdf=0 then
              Dmboleto.gbTitulo1.Imprimir_SIGCB
           else
           if pdf=1 then
           begin
              try
              if  Dmboleto.gbTitulo1.GerarPDF_SIGCB(caminhopdf+'/', arquivopdf+'_'+copy(dsCobranca.DataSet.FieldByName('registro').value,1,7)+'_Conf2014.pdf') = 0 then
              DMConexao.Log('Erro ao gerar Cobrança 2014 Conf', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              except
                DMConexao.Log('Erro ao gerar Cobrança 2014 Conf', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              end;
           end ;

           Cont := cont+1
       end;

       dsCobranca.DataSet.next;

    end;
    dsCobranca.DataSet.First;
    dsCobranca.DataSet.EnableControls;
    Aviso('Foram gerados/impressos '+ inttostr(cont) +' Boletos/Guias. ' );
end;

procedure TfrmCobranca.Boletos_Sindical(pdf:integer=0);
var
  DataVenc:TDatetime;
  bol_id,cont:integer;
  ConfPrint:integer;
begin
    cont:=0;
  {  Try application.createform(TfrmBoletoVencinento,frmBoletoVencinento);
    if frmBoletoVencinento.showmodal= mrok then
    begin
        If frmBoletoVencinento.radDataVenc.Checked  = true then
           DataVenc := strtodate(frmBoletoVencinento.eddatavenc.Text)
        else
        }
           DataVenc := DataNula;
{    end
    else
      abort;
    finally
    frmBoletoVencinento.free;
    end;
 }
    dsCobranca.DataSet.First;
    dsCobranca.DataSet.DisableControls;

    ConfPrint :=0;

    if pdf=0 then
    begin
        If Confirma('Deseja imprimir também a Confederativa? ') then
           ConfPrint :=1;
    end
    else
    If Confirma('Deseja gerar pdf também da Confederativa? ') then
           ConfPrint :=2;


    While not dsCobranca.DataSet.eof do
    begin
       If (dsCobranca.DataSet.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (dsCobranca.DataSet.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
       begin
           //Dados da Conta e Cedente
           DmBoleto.DadosContaCedente(dsCobranca.DataSet.FieldByName('emp_id').value, 1);
           DmBoleto.Guias1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.value;
           DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaCT_CODCEDENTE.value+Dmboleto.cdsContaCT_CODCEDENTE_DV.value;
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
           begin
              DmBoleto.Guias1.Cedente.SICAS_Simples := '00111';
              DmBoleto.Guias1.Tipo_Entidade := teFederacao;
           end
           else
           begin
              DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
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
           DmBoleto.DadosSacado(dsCobranca.DataSet.FieldByName('ass_id').value);

           DmBoleto.Guias1.Sacado.Nome :=  dsCobranca.DataSet.FieldByName('nome').value;
           DmBoleto.Guias1.Sacado.Endereco.Rua := dsCobranca.DataSet.FieldByName('END_LOGRADOURO').value;
           DmBoleto.Guias1.Sacado.Endereco.Numero := dsCobranca.DataSet.FieldByName('END_NUMERO').value;
           DmBoleto.Guias1.Sacado.Endereco.Complemento := dsCobranca.DataSet.FieldByName('END_COMPLEMENTO').value;
           DmBoleto.Guias1.Sacado.Endereco.Bairro := dsCobranca.DataSet.FieldByName('END_bairro').value;
           DmBoleto.Guias1.Sacado.Endereco.Cidade := dsCobranca.DataSet.FieldByName('CIDADE_NOME').value;
           DmBoleto.Guias1.Sacado.Endereco.CEP := dsCobranca.DataSet.FieldByName('END_CEP').value;
           DmBoleto.Guias1.Sacado.Endereco.Estado := dsCobranca.DataSet.FieldByName('ESTADO_NOME').value;

           DmBoleto.cdsOutrosSind.close;
           DmBoleto.cdsOutrosSind.Params.ParamByName('ass_id').value := dsCobranca.DataSet.FieldByName('ass_id').value;
           DmBoleto.cdsOutrosSind.Open;


           If DataVenc = DataNula then
              Dmboleto.Guias1.Vencimento := dsCobranca.DataSet.FieldByName('vencimento').value
           else
               Dmboleto.Guias1.Vencimento := DataVenc;

           Dmboleto.Guias1.Exercicio := inttostr(dsCobranca.DataSet.FieldByName('ano').value);


           Dmboleto.Guias1.Numero_Documento := strtoint(copy(dsCobranca.DataSet.FieldByName('registro').value,1,7));

           DmBoleto.Guias1.Sacado.Contribuinte_Mask := '999999/9999-99;0; ';
           DmBoleto.Guias1.Sacado.Contribuinte := Copy(stringreplace(dsCobranca.DataSet.FieldByName('registro').value,'/','',[rfreplaceall]),2, 20) + Copy(DmBoleto.Guias1.Exercicio , 3,2);

           //Instruções
           DmBoleto.Guias1.Mensagem.Clear;
           DmBoleto.Guias1.MensagemContrib1.Clear;

           DmBoleto.Guias1.Mensagem.Add('BLOQUETO DE CONTRIBUIÇÃO SINDICAL URBANA');
           DmBoleto.Guias1.Mensagem.Add('');
           DmBoleto.Guias1.Mensagem.Add('Até o vencimento, pagável nas Lotéricas, Correspondentes Caixa Aqui, Agências da CAIXA e Rede Bancária.');
           DmBoleto.Guias1.Mensagem.Add('Documento vencido pagável somente nas Agências da CAIXA.');
           DmBoleto.Guias1.Mensagem.Add('Guia vencida -  cobrar multa de 10% nos trinta primeiros dias, com adicional ');
           DmBoleto.Guias1.Mensagem.Add('de 2% por mês subseqüente de atraso e juros de mora de 1% ao mês e correção monetária (Selic).');
         //  DmBoleto.Guias1.MensagemContrib1.Add('');
           DmBoleto.Guias1.MensagemContrib1.Add('Esta guia não quita débitos anteriores.');

           if DmBoleto.cdsOutrosSindQTDE.value = 1 then
              DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicato.')
           else
           if DmBoleto.cdsOutrosSind.RecordCount > 1 then
              DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicatos.');

           DmBoleto.Guias1.Sacado.Capital_Social := 0;

           If dsCobranca.DataSet.FieldByName('TP_ASSOC_ID').value = 1 then
           begin
              DmBoleto.Guias1.Tipo_pessoa:='J';
              DMAssociado.cdsPegaCapSocial.close;
              DMAssociado.cdsPegaCapSocial.params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
              DMAssociado.cdsPegaCapSocial.params.ParamByName('data').value := strtodate('31/01/' + DmBoleto.Guias1.Exercicio );
              DMAssociado.cdsPegaCapSocial.Open;
              If DMAssociado.cdsPegaCapSocial.RecordCount > 0 then
                     DmBoleto.Guias1.Sacado.Capital_Social := DMAssociado.cdsPegaCapSocialVALOR.AsFloat;
           end
           else
              DmBoleto.Guias1.Tipo_pessoa:='F';

           try
              //Gerando Boleto
              bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
              DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
              DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value :=dsCobranca.DataSet.FieldByName('ass_id').value;
              DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
              DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
              DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.Guias1.Vencimento;
              DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
              DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := dsCobranca.DataSet.FieldByName('valor').asfloat;
              DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.Guias1.Sacado.Contribuinte;
              DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
              DmBoleto.PROC_BOLETO_I.ExecProc;

              //Gerando Item do Boleto
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := dsCobranca.DataSet.FieldByName('Anuid_Id').value;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := dsCobranca.DataSet.FieldByName('descricao').value;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := dsCobranca.DataSet.FieldByName('valor').asfloat;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
              DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

           except
              Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
           end;

           DmBoleto.Guias1.Valores.Contribuicao:= dsCobranca.DataSet.FieldByName('valor').asfloat;
           DmBoleto.Guias1.Valores.Abatimento:= 0;
           DmBoleto.Guias1.Valores.Deducao:= 0;
           DmBoleto.Guias1.Valores.Acrescimo := 0;
           DmBoleto.Guias1.Valores.Multa := 0;

           //DmBoleto.Guias1.Imprimir;
           if pdf=0 then
              DmBoleto.Guias1.Imprimir
           else
           if pdf=1 then
           begin
              try
              registropdf := copy(dsCobranca.DataSet.FieldByName('registro').value,1,7);
              if  Dmboleto.Guias1.GerarPDF_SIGCB(caminhopdf+'/', arquivopdf+'_'+registropdf+'_Sind2014.pdf') = 0 then
                DMConexao.Log('Erro ao gerar Cobrança 2014 Sind', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              except
                DMConexao.Log('Erro ao gerar Cobrança 2014 Sind', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              end;
           end;

           If ConfPrint = 1 then
              Boletos_Confederativa_de_Sindical
           else
           If ConfPrint = 2 then //apenas pdf
              Boletos_Confederativa_de_Sindical(1);

           //Inserindo Movimento Geração de guias 2014 pelo correio
           DMAssociado.PROC_MOVIMENTO_UI.close;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('mov_id').value :=0 ;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('tp_mov_id').value := 20;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('ASS_ID').value :=dsCobranca.DataSet.FieldByName('ass_id').value ;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DT_MOV').value :=DataAtual;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('OBS_MOV').value := '';
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('USERID').value := UserId;
           DMAssociado.PROC_MOVIMENTO_UI.ParamByName('HORA').value := copy(timetostr(NOW),1,5);
           DMAssociado.PROC_MOVIMENTO_UI.ExecProc;
           cont := cont + 1;

       end;

       dsCobranca.DataSet.next;

    end;
    dsCobranca.DataSet.First;
    dsCobranca.DataSet.EnableControls;
    Aviso('Foram gerados/impressos '+ inttostr(cont) +' Boletos/Guias. ' ); 

end;

procedure TfrmCobranca.acGerarBoletoGuiaExecute(Sender: TObject);
var
  TipoCob :String;
begin
  inherited;
  TipoCob :=  cbTipoContrib.text;
  If TClientDataset(dsCobranca.dataset).Active = true then
    if TClientDataset(dsCobranca.dataset).recordcount > 0 then
    begin
       If Confirma('Confirma geração de boletos/guia ' + TipoCob +' para os filiados listados? ' ) then
       begin
           If TipoCob = 'Sindical' then
              Boletos_Sindical
           else
           If TipoCob = 'Confederativa' then
              Boletos_Confederativa;
       end;
    end;

end;

procedure TfrmCobranca.acGerarBoletoGuiaUpdate(Sender: TObject);
begin
  inherited;
  If dsCobranca.DataSet.Active = true then
     acGerarBoletoGuia.Enabled := dsCobranca.DataSet.RecordCount > 0 ;
end;

procedure TfrmCobranca.Etiquetas_Envelopes(Query: TClientDataset);
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
                        frmEtiqueta.Dadosendereco.value := frmEtiqueta.Dadosendereco.value + ', ' +Query.fieldbyname('end_numero').value;

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
                        IF Query.fieldbyname('end_numero').value <> NULL  THEN
                               FrmOpcoes_Etiq_Env.Dadosendereco.value := FrmOpcoes_Etiq_Env.Dadosendereco.value + ', ' +Query.fieldbyname('end_numero').value;
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

procedure TfrmCobranca.acEtiquetaExecute(Sender: TObject);
begin
  inherited;
  If dsCobranca.dataset.Active=true then
     if dsCobranca.DataSet.RecordCount > 0 then
        Etiquetas_Envelopes(TClientDataset(dsCobranca.dataset));

end;

procedure TfrmCobranca.acEtiquetaUpdate(Sender: TObject);
begin
  inherited;
  If dsCobranca.DataSet.Active = true then
     acEtiqueta.Enabled := dsCobranca.DataSet.RecordCount > 0 ;
end;

procedure TfrmCobranca.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsCobranca.dataset.Active=true then
     if dsCobranca.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsCobranca.dataset), gridCobranca);
end;

procedure TfrmCobranca.acGerarPlanilhaUpdate(Sender: TObject);
begin
  inherited;
  If dsCobranca.DataSet.Active = true then
     acGerarPlanilha.Enabled := dsCobranca.DataSet.RecordCount > 0 ;

end;

procedure TfrmCobranca.gridCobrancaTitleClick(Column: TColumn);
begin
  inherited;
  DmFinancas.cdsCobranca.IndexFieldNames :=  Column.FieldName;
end;

procedure TfrmCobranca.Boletos_Confederativa_de_Sindical(pdf:integer=0);
var
  DataVenc:TDatetime;
  bol_id, Cont:integer;
  NossoNumero:string;
begin

    sdsDadosConf.Close;
    sdsDadosConf.Params.ParamByName('ass_id').value := dsCobranca.dataset.fieldbyname('ASS_ID').value;
    sdsDadosConf.Params.ParamByName('ano').value := edAno.text;
    sdsDadosConf.open;
    If sdsDadosConf.RecordCount =  1 then
    begin

         //Dados da Conta e Cedente
         DmBoleto.DadosContaCedente(dsCobranca.dataset.fieldbyname('EMP_ID').value, 2);
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  DmBoleto.cdsContaBAN_CODIGO.AsString;
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
         DmBoleto.gbTitulo1.SeuNumero := '';
         DmBoleto.gbTitulo1.DataDocumento := Dataatual;
         DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

         DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
         DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
         DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

         DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
         DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

         DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
         DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
         DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
         DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
         DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
         //Fim dados do Cedente

         Dmboleto.gbTitulo1.Instrucoes.Clear;
         Dmboleto.gbTitulo1.Instrucoes.Add( sdsDadosConfDESCRICAO.value +'(Confederativa): ' + formatfloat(',0.00 ', sdsDadosConfVALOR.asfloat));
         //Dmboleto.gbTitulo1.Instrucoes.Add(dsCobranca.DataSet.FieldByName('descricao').value +'('+dsCobranca.DataSet.FieldByName('tipocontrib').value+'): ' + formatfloat(',0.00 ', dsCobranca.DataSet.FieldByName('total').value));

         //Cancelando boleto ou tirando o vinculo com Boleto_itens
         DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= sdsDadosConfANUID_ID.value;
         DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').clear;
         DmBoleto.PROC_BOLETO_STATUS.ExecProc;

         Dmboleto.gbTitulo1.DataVencimento := sdsDadosConfVENCIMENTO.value;

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
         DmBoleto.DadosSacado(dsCobranca.DataSet.FieldByName('ass_id').value);
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

         DmBoleto.gbTitulo1.ValorDocumento := sdsDadosConfVALOR.asfloat;

         try
            //Gerando Boleto
            bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
            DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
            DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value :=dsCobranca.DataSet.FieldByName('ass_id').value;
            DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
            DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
            DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dmboleto.gbTitulo1.DataVencimento;
            DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
            DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := DmBoleto.gbTitulo1.ValorDocumento;
            DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := NossoNumero;
            DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
            DmBoleto.PROC_BOLETO_I.ExecProc;

            //Gerando Item do Boleto
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := sdsDadosConfANUID_ID.value;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := sdsDadosConfDESCRICAO.value;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := DmBoleto.gbTitulo1.ValorDocumento;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
            DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
            DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

         except
            Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
         end;
         //Dmboleto.gbTitulo1.Imprimir_SIGCB;

        if pdf=0 then
              Dmboleto.gbTitulo1.Imprimir_SIGCB
           else
           if pdf=1 then
           begin
              try
              if  Dmboleto.gbTitulo1.GerarPDF_SIGCB(caminhopdf+'/', arquivopdf+'_'+registropdf+'_Conf2014.pdf') = 0 then
              DMConexao.Log('Erro ao gerar Cobrança 2014 Conf', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              except
                DMConexao.Log('Erro ao gerar Cobrança 2014 Conf', 'O', dsCobranca.DataSet.FieldByName('ass_id').value);
              end;
           end

    end;

end;

procedure TfrmCobranca.edRegistroIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i:integer;
begin
  inherited;
  if Key = VK_DIVIDE then
  begin
    edRegistroIni.Text := Char_Left(Trim(Copy(edRegistroIni.Text, 1, 7)), 7, '0') ;
    edRegistroIni.Setfocus;
  end;

end;

procedure TfrmCobranca.edRegistroFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var i:integer;
begin
  inherited;
  if Key = VK_DIVIDE then
  begin
        edRegistroFinal.Text := Char_Left(Trim(Copy(edRegistroFinal.Text, 1, 7)), 7, '0') ;
        edRegistroFinal.setfocus;
  end;

end;

procedure TfrmCobranca.acGeraPdfExecute(Sender: TObject);
var
  TipoCob :String;
begin
  inherited;
  TipoCob :=  cbTipoContrib.text;
  If TClientDataset(dsCobranca.dataset).Active = true then
    if TClientDataset(dsCobranca.dataset).recordcount > 0 then
    begin
       If Confirma('Confirma geração de boletos/guia ' + TipoCob +' em PDF para os filiados listados? ' ) then
       begin
           if SaveDialog1.Execute then
           begin
              caminhopdf := ExtractFileDir(SaveDialog1.FileName);
              arquivopdf := ExtractFileName( SaveDialog1.FileName);
           end
           else
              exit;
           If TipoCob = 'Sindical' then
              Boletos_Sindical(1)
           else
           If TipoCob = 'Confederativa' then
              Boletos_Confederativa(1);
       end;
    end;

end;

end.
