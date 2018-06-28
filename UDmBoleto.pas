unit UDmBoleto;

interface

uses
  SysUtils, Classes, Dialogs, FMTBcd, DB, SqlExpr, gbCobranca, DBClient,
  Provider, uGuias, DBLocal, DBLocalS;

type
  TDmBoleto = class(TDataModule)
    PrintDialog: TPrintDialog;
    sdsConta: TSQLDataSet;
    gbTitulo1: TgbTitulo;
    gbCobranca1: TgbCobranca;
    PROC_BOLETO_STATUS: TSQLStoredProc;
    sdsNossoNumero: TSQLDataSet;
    sdsNossoNumeroNOSSONUMERO: TStringField;
    SdsDadosAssoc: TSQLDataSet;
    PROC_BOLETO_I: TSQLStoredProc;
    PROC_BOLETO_ITENS_I: TSQLStoredProc;
    dspDadosAssoc: TDataSetProvider;
    cdsDadosAssoc: TClientDataSet;
    cdsDadosAssocNOME: TStringField;
    cdsDadosAssocREGISTRO: TStringField;
    cdsDadosAssocCPFCNPJ: TStringField;
    cdsDadosAssocTP_ASSOC_ID: TIntegerField;
    cdsDadosAssocEND_BAIRRO: TStringField;
    cdsDadosAssocEND_CEP: TStringField;
    cdsDadosAssocCIDADE_NOME: TStringField;
    cdsDadosAssocESTADO_SIGLA: TStringField;
    cdsDadosAssocEND_COMPLEMENTO: TStringField;
    cdsDadosAssocEND_NUMERO: TStringField;
    cdsDadosAssocEND_LOGRADOURO: TStringField;
    dspConta: TDataSetProvider;
    cdsConta: TClientDataSet;
    cdsContaCNPJ: TStringField;
    cdsContaENDER_LOGRADOURO: TStringField;
    cdsContaENDER_NUMERO: TStringField;
    cdsContaENDER_COMPLEMENTO: TStringField;
    cdsContaENDER_BAIRRO: TStringField;
    cdsContaCIDADE_ID: TIntegerField;
    cdsContaCIDADE_NOME: TStringField;
    cdsContaESTADO_SIGLA: TStringField;
    cdsContaENDER_CEP: TStringField;
    cdsContaBAN_CODIGO: TStringField;
    cdsContaBAN_DIGITO: TStringField;
    cdsContaCONTA_ID: TIntegerField;
    cdsContaCT_AGENCIA: TStringField;
    cdsContaCT_AGENCIA_DV: TStringField;
    cdsContaCT_CONTA: TStringField;
    cdsContaCT_CONTA_DV: TStringField;
    cdsContaCT_NOMECLIENTE: TStringField;
    cdsContaCT_CODCEDENTE: TStringField;
    cdsContaCT_CODCEDENTE_DV: TStringField;
    cdsContaCT_NUMCONVENIO: TStringField;
    cdsContaBANCO_ID: TIntegerField;
    cdsContaEMP_ID: TIntegerField;
    Guias1: TGuias;
    sdsOutrosSind: TSQLDataSet;
    dspOutrosSind: TDataSetProvider;
    cdsOutrosSind: TClientDataSet;
    cdsOutrosSindQTDE: TIntegerField;
    PROC_MANUT_BOLETO_UPD: TSQLStoredProc;
    sdsLocBoletos: TSQLDataSet;
    dspLocBoletos: TDataSetProvider;
    cdsLocBoletos: TClientDataSet;
    sdsLocBoletoItens: TSQLDataSet;
    dspLocBoletoItens: TDataSetProvider;
    cdsLocBoletoItens: TClientDataSet;
    cdsLocBoletoItensBOL_ID: TIntegerField;
    cdsLocBoletoItensITEM_BOL_ID: TIntegerField;
    cdsLocBoletoItensPARC_ID: TIntegerField;
    cdsLocBoletoItensANUID_ID: TIntegerField;
    cdsLocBoletoItensDESCRICAO_ITEM: TStringField;
    cdsLocBoletoItensVALOR_ITEM: TFMTBCDField;
    cdsLocBoletoItensVALOR_MULTA: TFMTBCDField;
    cdsLocBoletoItensVALOR_JUROS: TFMTBCDField;
    cdsLocBoletoItensVALOR_CORRECAO: TFMTBCDField;
    cdsLocBoletoItensTOTAL: TFMTBCDField;
    sdsBoletoStatus: TSQLDataSet;
    dspBoletoStatus: TDataSetProvider;
    cdsBoletoStatus: TClientDataSet;
    cdsBoletoStatusRESP: TIntegerField;
    sdsBoletoPagar: TSQLDataSet;
    sdsBoletoPagarMSG_RETORNO: TStringField;
    cdsLocBoletosBOL_ID: TIntegerField;
    cdsLocBoletosIDASSOC: TIntegerField;
    cdsLocBoletosREGISTRO: TStringField;
    cdsLocBoletosNOME: TStringField;
    cdsLocBoletosTIPOPESSOA: TStringField;
    cdsLocBoletosNOSSONUMERO: TStringField;
    cdsLocBoletosTIPOCONTRIB: TStringField;
    cdsLocBoletosSTATUS_ID: TIntegerField;
    cdsLocBoletosSTATUS: TStringField;
    cdsLocBoletosDATAEMISSAO: TDateField;
    cdsLocBoletosDATAVENCIMENTO: TDateField;
    cdsLocBoletosVALOR: TFMTBCDField;
    cdsLocBoletosDATAPAGAMENTO: TDateField;
    cdsLocBoletosVALORRECEB: TFMTBCDField;
    cdsLocBoletosMULTA_PAGA: TFMTBCDField;
    cdsLocBoletosCORRECAO_PAGA: TFMTBCDField;
    cdsLocBoletosJUROS_PAGO: TFMTBCDField;
    cdsLocBoletosDESCONTO_PAGO: TFMTBCDField;
    cdsLocBoletosFORMAPAGTO: TStringField;
    cdsLocBoletosCONTA_ID: TIntegerField;
    cdsLocBoletosLOCALIDADE: TStringField;
    sdsNossoNumeroCR: TSQLDataSet;
    sdsNossoNumeroCRNOSSONUMERO: TStringField;
    cdsGuiasNaoGeradasRemessa: TClientDataSet;
    cdsGuiasNaoGeradasRemessaregistro: TStringField;
    cdsGuiasNaoGeradasRemessanome: TStringField;
    cdsGuiasNaoGeradasRemessaboleto: TStringField;
    cdsGuiasNaoGeradasRemessadatavencimento: TDateField;
    cdsGuiasNaoGeradasRemessavalor: TFloatField;
    cdsGuiasGeradas: TClientDataSet;
    cdsGuiasGeradasregistro: TStringField;
    cdsGuiasGeradasnome: TStringField;
    cdsGuiasGeradasboleto: TStringField;
    cdsGuiasGeradasvencimento: TDateField;
    cdsGuiasGeradasvalor: TFloatField;
    sdsEndereco: TSQLClientDataSet;
    sdsEnderecoEND_ID: TIntegerField;
    sdsEnderecoEND_LOGRADOURO: TStringField;
    sdsEnderecoEND_NUMERO: TStringField;
    sdsEnderecoEND_COMPLEMENTO: TStringField;
    sdsEnderecoEND_BAIRRO: TStringField;
    sdsEnderecoEND_CEP: TStringField;
    sdsEnderecoCIDADE_ID: TIntegerField;
    sdsEnderecoTP_ENDER_ID: TIntegerField;
    sdsEnderecoEND_CORRESP: TSmallintField;
    sdsEnderecoEND_CORRESP_DEV: TSmallintField;
    sdsEnderecoSTATUSCORRESP: TStringField;
    sdsEnderecoCIDADE_NOME: TStringField;
    sdsEnderecoESTADO_NOME: TStringField;
    sdsEnderecoTP_ENDER_DESCR: TStringField;
    sdsLocInstrucoesBoleto: TSQLClientDataSet;
    sdsLocInstrucoesBoletoBOL_ID: TIntegerField;
    sdsLocInstrucoesBoletoMENSAGEM: TStringField;
    sdsLocInstrucoesBoletoORDEM: TIntegerField;
    sdsLocInstrucoesBoletoBOL_INST_ID: TIntegerField;
    dsGuiasGeradas: TDataSource;
    dsGuiasNaoGeradasRemessa: TDataSource;
    cdsContaCODSINDICAL: TStringField;
    cdsContaSICASCOMPLETO: TStringField;
    procedure DadosContaCedente(Emp_id,TipoContrib:integer);
    procedure DadosSacado(Ass_id:integer);
    procedure cdsLocBoletosAfterScroll(DataSet: TDataSet);
    function RetornaConta(entidade,contrib:string):Integer;
    function GeraRemessa(ds: TDatasource): integer;
    function GeraRemessaSind(ds: TDatasource): integer;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBoleto: TDmBoleto;
  nomearquivoremessa: string;
  planilha: integer;
  Numremessa: integer;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

{ TDmBoleto }

procedure TDmBoleto.DadosContaCedente(Emp_id,TipoContrib:integer);
begin
      cdsConta.close;
      cdsConta.params.ParamByName('emp_id').value := emp_id;
      cdsConta.params.ParamByName('tipocontrib').value :=tipocontrib ;
      cdsConta.Open;
      If cdsConta.RecordCount = 0 then
      begin
          Erro('Filiado sem localidade definida. ');
          abort;
      end;

end;

procedure TDmBoleto.DadosSacado(Ass_id: integer);
begin
   cdsDadosAssoc.close;
   cdsDadosAssoc.params.ParamByName('ass_id').value := ass_id;
   cdsDadosAssoc.params.ParamByName('corresp').value := 1;
   cdsDadosAssoc.Open;

   If cdsDadosAssoc.RecordCount = 0 then
   begin
     cdsDadosAssoc.close;
     cdsDadosAssoc.params.ParamByName('ass_id').value := ass_id;
     cdsDadosAssoc.params.ParamByName('corresp').value := 0;
     cdsDadosAssoc.Open;
{     If cdsDadosAssoc.RecordCount = 0 then
     begin
        Erro('Filiado sem endereço cadastrado. ');
        Abort;
     end;
     }
   end;

end;

procedure TDmBoleto.cdsLocBoletosAfterScroll(DataSet: TDataSet);
begin
   DmBoleto.cdsLocBoletoItens.Close;
   DmBoleto.cdsLocBoletoItens.Params.ParamByName('bol_id').value := DmBoleto.cdsLocBoletosBOL_ID.value;
   DmBoleto.cdsLocBoletoItens.Open;

end;

function TDmBoleto.RetornaConta(entidade, contrib: string): Integer;
var
    conta:Integer;
begin
   if entidade = 'M' then //Municipio
   begin
        if contrib = 'S' then
           conta := 3
        else
        if contrib = 'C' then
           conta :=  1;
   end
   else
   if entidade = 'E' then //Estado
   begin
        if contrib = 'S' then
           conta := 4
        else
        if contrib = 'C' then
           conta :=  2;

   end
   else
   if entidade = 'F' then //Federacao
   begin
        if contrib = 'S' then
           conta := 2
        else
        if contrib = 'C' then
           conta :=  1;

   end ;
   Result := conta;
end;

function TDmBoleto.GeraRemessa(ds: TDatasource): integer;
var
    i, tot, idremessa: integer;
begin

    //Criando a remessa
    idremessa := Dmconexao.GeraAutoNumber('GEN_REMESSA_ID');

    if (Dmconexao.ExecuteProc('PROC_REMESSA_I',
        inttostr(idremessa) + ',' +
        quotedstr(FormatDateTime('YYYY.MM.DD', DataAtual) )+ ',' +
        inttostr(0) + ',' +
        Quotedstr(extractfilename(nomearquivoremessa)) + ',' +
        inttostr(UserId) + ',' +
        quotedstr(timetostr(now)))) = 0 then
    begin
        Aviso('Erro ao tentar criar a remessa. Informe ao administrador do Sistema. ');
        EscondeAguarde;
        exit;
    end;

    cdsGuiasGeradas.EmptyDataSet;
    cdsGuiasNaoGeradasRemessa.EmptyDataSet;

    tot := 0;

//    for i:= 1 to gbCobranca1.Titulos.Count - 1 do
//        gbCobranca1.Titulos.Delete(i);

gbCobranca1.Titulos.Clear;

    while not ds.dataset.eof do
    begin
      try
        gbTitulo1.Instrucoes.Clear;

        sdsEndereco.close;
        sdsEndereco.params.parambyname('ass_id').value :=ds.dataset.fieldbyname('ass_id').value;
        sdsEndereco.open;

        if (sdsEndereco.recordcount = 0) or ((sdsEndereco.recordcount = 1) and (sdsEnderecoEND_LOGRADOURO.value = '')) then
        begin
            cdsGuiasNaoGeradasRemessa.append;
            cdsGuiasNaoGeradasRemessa.edit;
            cdsGuiasNaoGeradasRemessaboleto.value := ds.dataset.fieldbyname('nossonumero').value;
            cdsGuiasNaoGeradasRemessanome.value := ds.dataset.fieldbyname('nome').value;
            cdsGuiasNaoGeradasRemessaregistro.value := ds.dataset.fieldbyname('registro').value;
            cdsGuiasNaoGeradasRemessavalor.value := ds.dataset.fieldbyname('valor_total').value;
            cdsGuiasNaoGeradasRemessadatavencimento.value := ds.dataset.fieldbyname('dt_vencimento').value;
            cdsGuiasNaoGeradasRemessa.post;
            ds.dataset.Next;
            Continue;
        end;

        //informações do SACADO
        gbTitulo1.Sacado.Nome := ds.dataset.fieldbyname('nome').value;
        gbTitulo1.Sacado.NumeroCPFCGC := RetiraSimbolos(ds.dataset.fieldbyname('cpfcnpj').value);
        gbTitulo1.Sacado.Endereco.Bairro := sdsEnderecoEND_BAIRRO.value;
        gbTitulo1.Sacado.Endereco.CEP := sdsEnderecoEND_CEP.value ;
        gbTitulo1.Sacado.Endereco.Cidade := sdsEnderecoCIDADE_NOME.value; ;
        gbTitulo1.Sacado.Endereco.Complemento := sdsEnderecoEND_COMPLEMENTO.value;
        gbTitulo1.Sacado.Endereco.Estado := sdsEnderecoESTADO_NOME.value;
        gbTitulo1.Sacado.Endereco.Rua := sdsEnderecoEND_LOGRADOURO.value;

        gbTitulo1.DataVencimento := ds.dataset.fieldbyname('dt_vencimento').value;
        gbTitulo1.DataDocumento := ds.dataset.fieldbyname('dt_criacao').value;
        gbTitulo1.ValorDocumento := ds.dataset.fieldbyname('valor_total').value;
        gbTitulo1.NumeroDocumento := stringreplace(ds.dataset.fieldbyname('registro').value,'/','',[rfReplaceAll]);
        gbTitulo1.SeuNumero := stringreplace(ds.dataset.fieldbyname('registro').value,'/','',[rfReplaceAll]);

        gbTitulo1.TipoOcorrencia := toRemessaRegistrar;

        if ds.dataset.fieldbyname('tp_assoc_id').value = 2 then
            gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
        else
            gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;

        gbTitulo1.NossoNumero := ds.dataset.fieldbyname('nossonumero').value;

        sdsLocInstrucoesBoleto.close;
        sdsLocInstrucoesBoleto.params.ParamByName('bol_id').value := ds.DataSet.fieldbyname('bol_id').value;
        sdsLocInstrucoesBoleto.open;

       sdsLocInstrucoesBoleto.Filtered:=false;
       sdsLocInstrucoesBoleto.Filter := 'mensagem<>' + QuotedStr('');
       sdsLocInstrucoesBoleto.Filtered:=true;

        sdsLocInstrucoesBoleto.first;
        for i := 1 to sdsLocInstrucoesBoleto.recordcount do
        begin
            gbTitulo1.Instrucoes.add(sdsLocInstrucoesBoletoMENSAGEM.value);
            sdsLocInstrucoesBoleto.next;
        end;

        for i := sdsLocInstrucoesBoleto.recordcount to 8 do
            gbTitulo1.Instrucoes.add('');

        gbTitulo1.EmissaoBoleto := ebClienteEmite;

        gbCobranca1.Titulos.Add(gbTitulo1);


        //Adicionando o item da remessa
        try
            Dmconexao.ExecuteProc('PROC_REMESSA_ITEM_I',
                inttostr(idremessa) + ',' +
                inttostr(ds.DataSet.fieldbyname('bol_id').value) );
        except
            Dmconexao.Log('Erro na inclusao do item na remessa de Id ' + inttostr(idremessa) + ' bol_id = ' + inttostr(ds.DataSet.fieldbyname('bol_id').value), 'I', ds.DataSet.fieldbyname('ass_id').value);
        end;

        tot := tot + 1;

        if planilha = 1 then
        begin
            cdsGuiasGeradas.Append;
            cdsGuiasGeradasregistro.value := ds.DataSet.fieldbyname('registro').AsString;
            cdsGuiasGeradasnome.value := ds.DataSet.fieldbyname('nome').AsString;
            cdsGuiasGeradasboleto.value := gbTitulo1.NossoNumero;
            cdsGuiasGeradasvencimento.value := gbTitulo1.DataVencimento;
            cdsGuiasGeradasvalor.value := gbTitulo1.ValorDocumento;
            cdsGuiasGeradas.post;
        end;

        except
            Aviso('Erro no cadastro ' + ds.DataSet.fieldbyname('registro').AsString + '  - Boleto ' + ds.DataSet.fieldbyname('nossonumero').AsString);
            Dmconexao.ExecSQL('delete from remessa_item where remessa_id = ' + inttostr(idremessa));
            Dmconexao.ExecSQL('delete from remessa where remessa_id = ' + inttostr(idremessa));
            exit;
        end;
        ds.DataSet.Next;
    end;

    ds.dataset.first;

    gbCobranca1.DataArquivo := DataAtual;

    gbCobranca1.NumeroArquivo := Numremessa;

    gbCobranca1.NomeArquivo := nomearquivoremessa;

    gbCobranca1.LayoutArquivo := laCNAB240;
  
    if tot > 0 then
       gbCobranca1.GerarRemessa
    else
       aviso('Os boletos não foram enviados para remessa. ');

    DmConexao.ExecSQL('update remessa set totalitens =' + inttostr(tot) + ' where remessa_id=' + inttostr(idremessa) + ';');

    result := tot;

end;

procedure TDmBoleto.DataModuleCreate(Sender: TObject);
begin
    cdsGuiasGeradas.createdataset;
    cdsGuiasNaoGeradasRemessa.createdataset;

end;

function TDmBoleto.GeraRemessaSind(ds: TDatasource): integer;
var
    i, tot, idremessa: integer;
begin

   { //Criando a remessa
    idremessa := Dmconexao.GeraAutoNumber('GEN_REMESSA_ID');

    if (Dmconexao.ExecuteProc('PROC_REMESSA_I',
        inttostr(idremessa) + ',' +
        quotedstr(FormatDateTime('YYYY.MM.DD', DataAtual) )+ ',' +
        inttostr(0) + ',' +
        Quotedstr(extractfilename(nomearquivoremessa)) + ',' +
        inttostr(UserId) + ',' +
        quotedstr(timetostr(now)))) = 0 then
    begin
        Aviso('Erro ao tentar criar a remessa. Informe ao administrador do Sistema. ');
        EscondeAguarde;
        exit;
    end;

    cdsGuiasGeradas.EmptyDataSet;
    cdsGuiasNaoGeradasRemessa.EmptyDataSet;

    tot := 0;

    while not ds.dataset.eof do
    begin
      try

        sdsEndereco.close;
        sdsEndereco.params.parambyname('ass_id').value :=ds.dataset.fieldbyname('ass_id').value;
        sdsEndereco.open;

        if (sdsEndereco.recordcount = 0) or ((sdsEndereco.recordcount = 1) and (sdsEnderecoEND_LOGRADOURO.value = '')) then
        begin
            cdsGuiasNaoGeradasRemessa.append;
            cdsGuiasNaoGeradasRemessa.edit;
            cdsGuiasNaoGeradasRemessaboleto.value := ds.dataset.fieldbyname('nossonumero').value;
            cdsGuiasNaoGeradasRemessanome.value := ds.dataset.fieldbyname('nome').value;
            cdsGuiasNaoGeradasRemessaregistro.value := ds.dataset.fieldbyname('registro').value;
            cdsGuiasNaoGeradasRemessavalor.value := ds.dataset.fieldbyname('valor_total').value;
            cdsGuiasNaoGeradasRemessadatavencimento.value := ds.dataset.fieldbyname('dt_vencimento').value;
            cdsGuiasNaoGeradasRemessa.post;
            ds.dataset.Next;
            Continue;
        end;

        //informações do SACADO
        Guias1.Sacado.Nome := ds.dataset.fieldbyname('nome').value;
        Guias1.Sacado.Contribuintecpfcnpj := ds.dataset.fieldbyname('cpfcnpj').value;
        Guias1.Sacado.Endereco.Bairro := sdsEnderecoEND_BAIRRO.value;
        Guias1.Sacado.Endereco.CEP := sdsEnderecoEND_CEP.value ;
        Guias1.Sacado.Endereco.Cidade := sdsEnderecoCIDADE_NOME.value; ;
        Guias1.Sacado.Endereco.Complemento := sdsEnderecoEND_COMPLEMENTO.value;
        Guias1.Sacado.Endereco.Estado := sdsEnderecoESTADO_NOME.value;
        Guias1.Sacado.Endereco.Rua := sdsEnderecoEND_LOGRADOURO.value;

        Guias1.Vencimento := ds.dataset.fieldbyname('dt_vencimento').value;
        Guias1.DataDocumento := ds.dataset.fieldbyname('dt_criacao').value;
        Guias1.ValorDocumento := ds.dataset.fieldbyname('valor_total').value;
        Guias1.NumeroDocumento := stringreplace(ds.dataset.fieldbyname('registro').value,'/','',[rfReplaceAll]);
        Guias1.SeuNumero := stringreplace(ds.dataset.fieldbyname('registro').value,'/','',[rfReplaceAll]);

        Guias1.TipoOcorrencia := toRemessaRegistrar;

        if ds.dataset.fieldbyname('tp_assoc_id').value = 2 then
            Guias1.Sacado.TipoInscricao := tiPessoaFisica
        else
            Guias1.Sacado.TipoInscricao := tiPessoaJuridica;

        Guias1.NossoNumero := ds.dataset.fieldbyname('nossonumero').value;

        sdsLocInstrucoesBoleto.close;
        sdsLocInstrucoesBoleto.params.ParamByName('bol_id').value := ds.DataSet.fieldbyname('bol_id').value;
        sdsLocInstrucoesBoleto.open;

       sdsLocInstrucoesBoleto.Filtered:=false;
       sdsLocInstrucoesBoleto.Filter := 'mensagem<>' + QuotedStr('');
       sdsLocInstrucoesBoleto.Filtered:=true;

        sdsLocInstrucoesBoleto.first;
        for i := 1 to sdsLocInstrucoesBoleto.recordcount do
        begin
            Guias1.Instrucoes.add(sdsLocInstrucoesBoletoMENSAGEM.value);
            sdsLocInstrucoesBoleto.next;
        end;

        for i := sdsLocInstrucoesBoleto.recordcount to 8 do
            Guias1.Instrucoes.add('');

        Guias1.EmissaoBoleto := ebClienteEmite;

        gbCobranca1.Titulos.Add(Guias1);


        //Adicionando o item da remessa
        try
            Dmconexao.ExecuteProc('PROC_REMESSA_ITEM_I',
                inttostr(idremessa) + ',' +
                inttostr(ds.DataSet.fieldbyname('bol_id').value) );
        except
            Dmconexao.Log('Erro na inclusao do item na remessa de Id ' + inttostr(idremessa) + ' bol_id = ' + inttostr(ds.DataSet.fieldbyname('bol_id').value), 'I', ds.DataSet.fieldbyname('ass_id').value);
        end;

        tot := tot + 1;

        if planilha = 1 then
        begin
            cdsGuiasGeradas.Append;
            cdsGuiasGeradasregistro.value := ds.DataSet.fieldbyname('registro').AsString;
            cdsGuiasGeradasnome.value := ds.DataSet.fieldbyname('nome').AsString;
            cdsGuiasGeradasboleto.value := Guias1.NossoNumero;
            cdsGuiasGeradasvencimento.value := Guias1.DataVencimento;
            cdsGuiasGeradasvalor.value := Guias1.ValorDocumento;
            cdsGuiasGeradas.post;
        end;

        except
            Aviso('Erro no cadastro ' + ds.DataSet.fieldbyname('registro').AsString + '  - Boleto ' + ds.DataSet.fieldbyname('nossonumero').AsString);
            Dmconexao.ExecSQL('delete from remessa_item where remessa_id = ' + inttostr(idremessa));
            Dmconexao.ExecSQL('delete from remessa where remessa_id = ' + inttostr(idremessa));
            exit;
        end;
        ds.DataSet.Next;
    end;

    ds.dataset.first;

    gbCobranca1.DataArquivo := DataAtual;

    gbCobranca1.NumeroArquivo := Numremessa;

    gbCobranca1.NomeArquivo := nomearquivoremessa;

    gbCobranca1.LayoutArquivo := laCNAB240;
  
    if tot > 0 then
       gbCobranca1.GerarRemessa
    else
       aviso('Os boletos não foram enviados para remessa. ');

    DmConexao.ExecSQL('update remessa set totalitens =' + inttostr(tot) + ' where remessa_id=' + inttostr(idremessa) + ';');

    result := tot;
    }
end;

end.
