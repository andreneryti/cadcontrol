object DmBoleto: TDmBoleto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 390
  Top = 201
  Height = 520
  Width = 1121
  object PrintDialog: TPrintDialog
    Left = 72
    Top = 48
  end
  object sdsConta: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select f.cnpj, f.ender_logradouro, f.ender_numero, f.ender_compl' +
      'emento, f.ender_bairro, f.cidade_id,ci.cidade_nome,e.estado_sigl' +
      'a, f.ender_cep, b.ban_codigo, b.ban_digito, c.conta_id, c.ct_age' +
      'ncia, c.ct_agencia_dv, c.ct_conta, c.ct_conta_dv, c.ct_nomeclien' +
      'te, c.ct_codcedente, c.ct_codcedente_dv, c.ct_numconvenio, c.ban' +
      'co_id, c.emp_id, c.codsindical, c.SICASCOMPLETO'#13#10'from conta c IN' +
      'NER join banco b on b.banco_id = c.banco_id'#13#10'inner join config  ' +
      'f on f.emp_id = c.emp_id'#13#10'inner join cidade ci on ci.cidade_id =' +
      ' f.cidade_id'#13#10'inner join estado e on e.estado_id = ci.estado_id'#13 +
      #10'where f.emp_id = :emp_id and c.tp_contribuicao =:tipocontrib'#13#10'a' +
      'nd ct_codcedente is not null'#13#10#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    Left = 472
    Top = 24
  end
  object gbTitulo1: TgbTitulo
    TipoOcorrencia = toRemessaRegistrar
    LocalPagamento = 'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'
    Cedente.TipoInscricao = tiPessoaFisica
    Sacado.TipoInscricao = tiPessoaFisica
    AceiteDocumento = adNao
    EspecieDocumento = edRecibo
    EmissaoBoleto = ebBancoEmite
    Left = 170
    Top = 112
  end
  object gbCobranca1: TgbCobranca
    NomeArquivo = 'C:\REMESSA.TXT'
    NumeroArquivo = 0
    LayoutArquivo = laCNAB400
    TipoMovimento = tmRemessa
    Left = 240
    Top = 112
  end
  object PROC_BOLETO_STATUS: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ANUID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARC_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_BOLETO_STATUS'
    Left = 72
    Top = 192
  end
  object sdsNossoNumero: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'SELECT  udf_padl(GEN_ID(GEN_NOSSONUMERO, 1),'#39'0'#39',14)  As nossonum' +
      'ero from RDB$DATABASE'
    Params = <>
    Left = 72
    Top = 256
    object sdsNossoNumeroNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      FixedChar = True
      Size = 254
    end
  end
  object SdsDadosAssoc: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'Select first 1 a.nome,a.registro, a.cpfcnpj, A.tp_assoc_id, e.en' +
      'd_bairro, e.end_cep, c.cidade_nome,en.estado_sigla, e.end_comple' +
      'mento,e.end_numero, e.end_logradouro'#13#10'From associado a'#13#10'inner jo' +
      'in endereco e on e.ass_id = a.ass_id'#13#10'LEFT join cidade c on c.ci' +
      'dade_id = e.cidade_id'#13#10'LEFT join estado en on en.estado_id = c.e' +
      'stado_id'#13#10'where a.ass_id = :ass_id'#13#10'and e.end_corresp=:corresp a' +
      'nd (e.end_corresp_dev = 0 or e.end_corresp_dev is null)'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'corresp'
        ParamType = ptInput
      end>
    Left = 344
    Top = 24
  end
  object PROC_BOLETO_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'BOL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_STATUS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOSSONUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TPBOLETO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COMREGISTRO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_BOLETO_I'
    Left = 64
    Top = 400
  end
  object PROC_BOLETO_ITENS_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'BOL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_BOL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANUID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_ITEM'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftBCD
        Name = 'VALOR_MULTA'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftBCD
        Name = 'VALOR_JUROS'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftBCD
        Name = 'VALOR_CORRECAO'
        ParamType = ptInput
        Size = 8
      end>
    StoredProcName = 'PROC_BOLETO_ITENS_I'
    Left = 200
    Top = 400
  end
  object dspDadosAssoc: TDataSetProvider
    DataSet = SdsDadosAssoc
    Constraints = True
    Left = 360
    Top = 48
  end
  object cdsDadosAssoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'corresp'
        ParamType = ptInput
      end>
    ProviderName = 'dspDadosAssoc'
    Left = 384
    Top = 72
    object cdsDadosAssocNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsDadosAssocREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsDadosAssocCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsDadosAssocTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
      Required = True
    end
    object cdsDadosAssocEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsDadosAssocEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsDadosAssocCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsDadosAssocESTADO_SIGLA: TStringField
      FieldName = 'ESTADO_SIGLA'
      Size = 2
    end
    object cdsDadosAssocEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsDadosAssocEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsDadosAssocEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
  end
  object dspConta: TDataSetProvider
    DataSet = sdsConta
    Constraints = True
    Left = 488
    Top = 48
  end
  object cdsConta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    ProviderName = 'dspConta'
    Left = 496
    Top = 72
    object cdsContaCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsContaENDER_LOGRADOURO: TStringField
      FieldName = 'ENDER_LOGRADOURO'
      Size = 60
    end
    object cdsContaENDER_NUMERO: TStringField
      FieldName = 'ENDER_NUMERO'
      Size = 10
    end
    object cdsContaENDER_COMPLEMENTO: TStringField
      FieldName = 'ENDER_COMPLEMENTO'
      Size = 40
    end
    object cdsContaENDER_BAIRRO: TStringField
      FieldName = 'ENDER_BAIRRO'
      Size = 40
    end
    object cdsContaCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object cdsContaCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsContaESTADO_SIGLA: TStringField
      FieldName = 'ESTADO_SIGLA'
      Size = 2
    end
    object cdsContaENDER_CEP: TStringField
      FieldName = 'ENDER_CEP'
      Size = 8
    end
    object cdsContaBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
    end
    object cdsContaBAN_DIGITO: TStringField
      FieldName = 'BAN_DIGITO'
      FixedChar = True
      Size = 1
    end
    object cdsContaCONTA_ID: TIntegerField
      FieldName = 'CONTA_ID'
      Required = True
    end
    object cdsContaCT_AGENCIA: TStringField
      FieldName = 'CT_AGENCIA'
      Size = 10
    end
    object cdsContaCT_AGENCIA_DV: TStringField
      FieldName = 'CT_AGENCIA_DV'
      Size = 2
    end
    object cdsContaCT_CONTA: TStringField
      FieldName = 'CT_CONTA'
      Size = 15
    end
    object cdsContaCT_CONTA_DV: TStringField
      FieldName = 'CT_CONTA_DV'
      Size = 2
    end
    object cdsContaCT_NOMECLIENTE: TStringField
      FieldName = 'CT_NOMECLIENTE'
      Size = 80
    end
    object cdsContaCT_CODCEDENTE: TStringField
      FieldName = 'CT_CODCEDENTE'
    end
    object cdsContaCT_CODCEDENTE_DV: TStringField
      FieldName = 'CT_CODCEDENTE_DV'
      Size = 2
    end
    object cdsContaCT_NUMCONVENIO: TStringField
      FieldName = 'CT_NUMCONVENIO'
    end
    object cdsContaBANCO_ID: TIntegerField
      FieldName = 'BANCO_ID'
      Required = True
    end
    object cdsContaEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      Required = True
    end
    object cdsContaCODSINDICAL: TStringField
      FieldName = 'CODSINDICAL'
      Size = 10
    end
    object cdsContaSICASCOMPLETO: TStringField
      FieldName = 'SICASCOMPLETO'
      Size = 15
    end
  end
  object Guias1: TGuias
    Vencimento = 40744
    Especie = 'R$'
    Numero_Documento = 0
    Tipo_Entidade = teSindicato
    Left = 384
    Top = 152
  end
  object sdsOutrosSind: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select count(*) qtde from outros_sindicatos o'#13#10'   where o.ass_id' +
      ' = :ass_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 408
    Top = 248
  end
  object dspOutrosSind: TDataSetProvider
    DataSet = sdsOutrosSind
    Constraints = True
    Left = 424
    Top = 264
  end
  object cdsOutrosSind: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspOutrosSind'
    Left = 440
    Top = 280
    object cdsOutrosSindQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
  end
  object PROC_MANUT_BOLETO_UPD: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftString
        Name = 'NOSSONUMERO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MANUT_BOLETO_UPD'
    Left = 400
    Top = 400
  end
  object sdsLocBoletos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select bol_id, b.idassoc, b.registro, b.nome, b.tipopessoa, b.no' +
      'ssonumero, b.tipocontrib, b.status_id, b.status, b.dataemissao, ' +
      'b.datavencimento, b.valor, b.datapagamento, b.valorreceb, b.mult' +
      'a_paga, b.correcao_paga, b.juros_pago, b.desconto_pago, b.formap' +
      'agto, b.conta_id, b.localidade'#13#10'from proc_locboletos(:ass_id, :c' +
      'ontrib_id, :boleto_ini, :boleto_fim, :dt_emissao_ini, :dt_emissa' +
      'o_fim, :dt_vencimento_ini, :dt_vencimento_fim, :dt_pagamento_ini' +
      ', :dt_pagamento_fim, :statusbol, :FILTROTIPO) b'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrib_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'boleto_ini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'boleto_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_emissao_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_emissao_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_vencimento_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_vencimento_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_pagamento_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_pagamento_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'statusbol'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILTROTIPO'
        ParamType = ptInput
      end>
    Left = 520
    Top = 240
  end
  object dspLocBoletos: TDataSetProvider
    DataSet = sdsLocBoletos
    Constraints = True
    Left = 536
    Top = 256
  end
  object cdsLocBoletos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrib_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'boleto_ini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'boleto_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_emissao_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_emissao_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_vencimento_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_vencimento_fim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_pagamento_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_pagamento_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'statusbol'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILTROTIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocBoletos'
    AfterScroll = cdsLocBoletosAfterScroll
    Left = 552
    Top = 272
    object cdsLocBoletosBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object cdsLocBoletosIDASSOC: TIntegerField
      FieldName = 'IDASSOC'
    end
    object cdsLocBoletosREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsLocBoletosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocBoletosTIPOPESSOA: TStringField
      FieldName = 'TIPOPESSOA'
      Size = 30
    end
    object cdsLocBoletosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsLocBoletosTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 40
    end
    object cdsLocBoletosSTATUS_ID: TIntegerField
      FieldName = 'STATUS_ID'
    end
    object cdsLocBoletosSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object cdsLocBoletosDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object cdsLocBoletosDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
    end
    object cdsLocBoletosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
    end
    object cdsLocBoletosVALORRECEB: TFMTBCDField
      FieldName = 'VALORRECEB'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosMULTA_PAGA: TFMTBCDField
      FieldName = 'MULTA_PAGA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosCORRECAO_PAGA: TFMTBCDField
      FieldName = 'CORRECAO_PAGA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosJUROS_PAGO: TFMTBCDField
      FieldName = 'JUROS_PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosDESCONTO_PAGO: TFMTBCDField
      FieldName = 'DESCONTO_PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletosFORMAPAGTO: TStringField
      FieldName = 'FORMAPAGTO'
      Size = 30
    end
    object cdsLocBoletosCONTA_ID: TIntegerField
      FieldName = 'CONTA_ID'
    end
    object cdsLocBoletosLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
    end
  end
  object sdsLocBoletoItens: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select bi.bol_id, bi.item_bol_id, bi.parc_id, bi.anuid_id, bi.de' +
      'scricao_item , bi.valor_item, bi.valor_multa, bi.valor_juros, bi' +
      '.valor_correcao ,  bi.valor_item + bi.valor_multa + bi.valor_jur' +
      'os + bi.valor_correcao Total'#13#10'from boleto_itens bi'#13#10'where bi.bol' +
      '_id = :bol_id'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'BOL_ID'
        ParamType = ptInput
        Value = 84744
      end>
    Left = 624
    Top = 240
  end
  object dspLocBoletoItens: TDataSetProvider
    DataSet = sdsLocBoletoItens
    Constraints = True
    Left = 640
    Top = 256
  end
  object cdsLocBoletoItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'BOL_ID'
        ParamType = ptInput
        Value = 84744
      end>
    ProviderName = 'dspLocBoletoItens'
    Left = 656
    Top = 272
    object cdsLocBoletoItensBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object cdsLocBoletoItensITEM_BOL_ID: TIntegerField
      FieldName = 'ITEM_BOL_ID'
      Required = True
    end
    object cdsLocBoletoItensPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsLocBoletoItensANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsLocBoletoItensDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 100
    end
    object cdsLocBoletoItensVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletoItensVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletoItensVALOR_JUROS: TFMTBCDField
      FieldName = 'VALOR_JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletoItensVALOR_CORRECAO: TFMTBCDField
      FieldName = 'VALOR_CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsLocBoletoItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object sdsBoletoStatus: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select resp'#13#10' from proc_boleto_status_2(:bol_id, :status)'
    Params = <
      item
        DataType = ftInteger
        Name = 'bol_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'status'
        ParamType = ptInput
      end>
    Left = 616
    Top = 328
  end
  object dspBoletoStatus: TDataSetProvider
    DataSet = sdsBoletoStatus
    Constraints = True
    Left = 632
    Top = 344
  end
  object cdsBoletoStatus: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'bol_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'status'
        ParamType = ptInput
      end>
    ProviderName = 'dspBoletoStatus'
    Left = 648
    Top = 360
    object cdsBoletoStatusRESP: TIntegerField
      FieldName = 'RESP'
    end
  end
  object sdsBoletoPagar: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select b.msg_retorno'#13#10'from proc_boleto_pagar(:nossonumero, :data' +
      'pago, :datacredito, :valorbaixa, :valordesc, :encargos, :formapa' +
      'gto, :ARQUIVO) b'
    Params = <
      item
        DataType = ftString
        Name = 'nossonumero'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datapago'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datacredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valorbaixa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valordesc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'encargos'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'formapagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ARQUIVO'
        ParamType = ptInput
      end>
    Left = 528
    Top = 408
    object sdsBoletoPagarMSG_RETORNO: TStringField
      FieldName = 'MSG_RETORNO'
      Size = 50
    end
  end
  object sdsNossoNumeroCR: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'SELECT  udf_padl(GEN_ID(GEN_NOSSONUMERO, 1),'#39'0'#39',13)  As nossonum' +
      'ero from RDB$DATABASE'
    Params = <>
    Left = 72
    Top = 320
    object sdsNossoNumeroCRNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      ReadOnly = True
      FixedChar = True
      Size = 254
    end
  end
  object cdsGuiasNaoGeradasRemessa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 240
    object cdsGuiasNaoGeradasRemessaregistro: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'registro'
    end
    object cdsGuiasNaoGeradasRemessanome: TStringField
      FieldName = 'nome'
      Size = 120
    end
    object cdsGuiasNaoGeradasRemessaboleto: TStringField
      DisplayLabel = 'N'#186' Boleto'
      FieldName = 'boleto'
      Size = 30
    end
    object cdsGuiasNaoGeradasRemessadatavencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
    end
    object cdsGuiasNaoGeradasRemessavalor: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor'
    end
  end
  object cdsGuiasGeradas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 160
    object cdsGuiasGeradasregistro: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'registro'
    end
    object cdsGuiasGeradasnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 100
    end
    object cdsGuiasGeradasboleto: TStringField
      DisplayLabel = 'N'#186'Boleto'
      FieldName = 'boleto'
      Size = 30
    end
    object cdsGuiasGeradasvencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'vencimento'
    end
    object cdsGuiasGeradasvalor: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor'
    end
  end
  object sdsEndereco: TSQLClientDataSet
    CommandText = 
      '        select end_id, end_logradouro, end_numero, end_complemen' +
      'to, end_bairro, end_cep, cidade_id, tp_ender_id, end_corresp, en' +
      'd_corresp_dev, statuscorresp, cidade_nome, estado_nome, tp_ender' +
      '_descr'#13#10'        from proc_loc_enderecovalido(:ass_id)'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 632
    Top = 136
    object sdsEnderecoEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object sdsEnderecoEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object sdsEnderecoEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object sdsEnderecoEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object sdsEnderecoEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object sdsEnderecoEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object sdsEnderecoCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object sdsEnderecoTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object sdsEnderecoEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object sdsEnderecoEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object sdsEnderecoSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object sdsEnderecoCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object sdsEnderecoESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object sdsEnderecoTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
  end
  object sdsLocInstrucoesBoleto: TSQLClientDataSet
    CommandText = 
      ' select bol_id, mensagem, ordem, bol_inst_id'#13#10' from boletoinstru' +
      'coes where bol_id = :bol_id'#13#10' order by ordem'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'bol_id'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 624
    Top = 56
    object sdsLocInstrucoesBoletoBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
      Required = True
    end
    object sdsLocInstrucoesBoletoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 200
    end
    object sdsLocInstrucoesBoletoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object sdsLocInstrucoesBoletoBOL_INST_ID: TIntegerField
      FieldName = 'BOL_INST_ID'
      Required = True
    end
  end
  object dsGuiasGeradas: TDataSource
    DataSet = cdsGuiasGeradas
    Left = 656
    Top = 176
  end
  object dsGuiasNaoGeradasRemessa: TDataSource
    DataSet = cdsGuiasNaoGeradasRemessa
    Left = 656
    Top = 280
  end
end
