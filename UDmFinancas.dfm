object DmFinancas: TDmFinancas
  OldCreateOrder = False
  Left = 627
  Top = 252
  Height = 724
  Width = 1024
  object sdsDebitosAnuidades: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from proc_debitos(:ass_id, :tipo, :dataatual)'#13#10'order by venc' +
      'imento, ano'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 32
    Top = 10
  end
  object dspDebitosAnuidades: TDataSetProvider
    DataSet = sdsDebitosAnuidades
    Constraints = True
    Left = 42
    Top = 30
  end
  object cdsDebitosAnuidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspDebitosAnuidades'
    Left = 56
    Top = 50
    object cdsDebitosAnuidadesANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsDebitosAnuidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsDebitosAnuidadesANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsDebitosAnuidadesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsDebitosAnuidadesVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsDebitosAnuidadesTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object cdsDebitosAnuidadesPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsDebitosAnuidadesNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsDebitosAnuidadesTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsDebitosAnuidadesMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsDebitosAnuidadesJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsDebitosAnuidadesCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsDebitosAnuidadesTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsDebitosAnuidades: TDataSource
    DataSet = cdsDebitosAnuidades
    Left = 72
    Top = 66
  end
  object sdsDebitosParcelamento: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from proc_debitos(:ass_id, :tipo, :dataatual)'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 48
    Top = 130
  end
  object dspDebitosParcelamento: TDataSetProvider
    DataSet = sdsDebitosParcelamento
    Constraints = True
    Left = 58
    Top = 150
  end
  object cdsDebitosParcelamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspDebitosParcelamento'
    Left = 72
    Top = 170
    object IntegerField1: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object IntegerField2: TIntegerField
      FieldName = 'ANO'
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object DateField1: TDateField
      FieldName = 'VENCIMENTO'
    end
    object StringField2: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object IntegerField3: TIntegerField
      FieldName = 'PARC_ID'
    end
    object IntegerField4: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object IntegerField5: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsDebitosParcelamento: TDataSource
    Left = 88
    Top = 186
  end
  object PROC_GERA_ANUIDADE: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOCONTRIB'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_GERA_ANUIDADE'
    Left = 208
    Top = 16
  end
  object PROC_ANUIDADE_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_CONTRIB'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ANUIDADE_DEL'
    Left = 208
    Top = 72
  end
  object sdsGerarBoletos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from proc_debitos(:ass_id, :tipo, :dataatual)'#13#10'where tipocon' +
      'trib = :tipocontrib'#13#10'order by vencimento'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    Left = 56
    Top = 250
    object sdsGerarBoletosANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object sdsGerarBoletosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object sdsGerarBoletosANO: TIntegerField
      FieldName = 'ANO'
    end
    object sdsGerarBoletosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object sdsGerarBoletosVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sdsGerarBoletosTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object sdsGerarBoletosPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object sdsGerarBoletosNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object sdsGerarBoletosTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object sdsGerarBoletosMULTA: TFMTBCDField
      FieldName = 'MULTA'
      Precision = 15
      Size = 2
    end
    object sdsGerarBoletosJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Precision = 15
      Size = 2
    end
    object sdsGerarBoletosCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      Precision = 15
      Size = 2
    end
    object sdsGerarBoletosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
  end
  object dspGerarBoletos: TDataSetProvider
    DataSet = sdsGerarBoletos
    Constraints = True
    Left = 66
    Top = 270
  end
  object cdsGerarBoletos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    ProviderName = 'dspGerarBoletos'
    Left = 80
    Top = 290
    object IntegerField6: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object IntegerField7: TIntegerField
      FieldName = 'ANO'
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object DateField2: TDateField
      FieldName = 'VENCIMENTO'
    end
    object StringField4: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object IntegerField8: TIntegerField
      FieldName = 'PARC_ID'
    end
    object IntegerField9: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object IntegerField10: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField9: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField10: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsGerarBoletos: TDataSource
    DataSet = cdsGerarBoletos
    Left = 96
    Top = 306
  end
  object sdsExtrato: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from proc_debitos(:ass_id, :tipo, :dataatual)'#13#10'where tipocon' +
      'trib = :tipocontrib and ano between :anoini and :anofim'#13#10'order b' +
      'y ano'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end>
    Left = 32
    Top = 370
  end
  object dspExtrato: TDataSetProvider
    DataSet = sdsExtrato
    Constraints = True
    Left = 42
    Top = 390
  end
  object cdsExtrato: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end>
    ProviderName = 'dspExtrato'
    Left = 56
    Top = 410
    object cdsExtratoANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsExtratoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsExtratoANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsExtratoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsExtratoTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object cdsExtratoPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsExtratoNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsExtratoTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsExtratoMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsExtrato: TDataSource
    DataSet = cdsExtrato
    Left = 72
    Top = 426
  end
  object sdsTotalExtrato: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select tipocontrib, sum(total) total'#13#10'from proc_debitos(:ass_id,' +
      ' :tipo, :dataatual)'#13#10'where tipocontrib = :tipocontrib and ano be' +
      'tween :anoini and :anofim'#13#10'group by tipocontrib'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end>
    Left = 40
    Top = 474
    object sdsTotalExtratoTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object sdsTotalExtratoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
  end
  object sdsPrescricao: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from proc_debitos(:ass_id, :tipo, :dataatual)'#13#10'where ano <:a' +
      'no   and vencimento is not null'#13#10'order by vencimento'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end>
    Left = 136
    Top = 370
  end
  object dspPrescricao: TDataSetProvider
    DataSet = sdsPrescricao
    Constraints = True
    Left = 146
    Top = 390
  end
  object cdsPrescricao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end>
    ProviderName = 'dspPrescricao'
    Left = 160
    Top = 410
    object cdsPrescricaoANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsPrescricaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsPrescricaoANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsPrescricaoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsPrescricaoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsPrescricaoTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object cdsPrescricaoPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsPrescricaoNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsPrescricaoTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsPrescricaoMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsPrescricaoJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsPrescricaoCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsPrescricaoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
  end
  object dsPrescricao: TDataSource
    DataSet = cdsPrescricao
    Left = 176
    Top = 426
  end
  object PROC_PRESCRICAO: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ANUID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'SITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_PRESCRICAO'
    Left = 152
    Top = 480
  end
  object sdsPagtos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select distinct bol_id, conta_id, dt_criacao, dt_vencimento, tp_' +
      'status_id, valor_total, nossonumero, dt_recebimento, dt_credito,' +
      ' dt_baixa, valor_recebimento, multa_paga, correcao_paga, juros_p' +
      'ago, desconto_pagto, encargos_pago, tp_status_descricao, tp_cont' +
      'rib_descricao, forma_pagto, situacao, tipoboleto'#13#10'from proc_pagt' +
      'os(:ass_id)'#13#10'order by dt_recebimento desc, dt_vencimento'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 224
    Top = 368
  end
  object dspPagtos: TDataSetProvider
    DataSet = sdsPagtos
    Constraints = True
    Left = 240
    Top = 392
  end
  object cdsPagtos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspPagtos'
    AfterScroll = cdsPagtosAfterScroll
    Left = 256
    Top = 416
    object cdsPagtosBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object cdsPagtosCONTA_ID: TIntegerField
      FieldName = 'CONTA_ID'
    end
    object cdsPagtosDT_CRIACAO: TDateField
      FieldName = 'DT_CRIACAO'
    end
    object cdsPagtosDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsPagtosTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
    end
    object cdsPagtosVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPagtosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsPagtosDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
    end
    object cdsPagtosDT_CREDITO: TDateField
      FieldName = 'DT_CREDITO'
    end
    object cdsPagtosDT_BAIXA: TDateField
      FieldName = 'DT_BAIXA'
    end
    object cdsPagtosVALOR_RECEBIMENTO: TFMTBCDField
      FieldName = 'VALOR_RECEBIMENTO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPagtosMULTA_PAGA: TFMTBCDField
      FieldName = 'MULTA_PAGA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPagtosCORRECAO_PAGA: TFMTBCDField
      FieldName = 'CORRECAO_PAGA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPagtosJUROS_PAGO: TFMTBCDField
      FieldName = 'JUROS_PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPagtosDESCONTO_PAGTO: TFMTBCDField
      FieldName = 'DESCONTO_PAGTO'
      Precision = 15
      Size = 2
    end
    object cdsPagtosTP_STATUS_DESCRICAO: TStringField
      FieldName = 'TP_STATUS_DESCRICAO'
    end
    object cdsPagtosTP_CONTRIB_DESCRICAO: TStringField
      FieldName = 'TP_CONTRIB_DESCRICAO'
      Size = 40
    end
    object cdsPagtosFORMA_PAGTO: TStringField
      FieldName = 'FORMA_PAGTO'
      Size = 30
    end
    object cdsPagtosENCARGOS_PAGO: TFMTBCDField
      FieldName = 'ENCARGOS_PAGO'
      Precision = 15
      Size = 2
    end
    object cdsPagtosSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object cdsPagtosTIPOBOLETO: TIntegerField
      FieldName = 'TIPOBOLETO'
    end
  end
  object dsPagtos: TDataSource
    DataSet = cdsPagtos
    Left = 272
    Top = 440
  end
  object sdsContribsParcelamento: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' parc_id, num_parcela, tpcontrib_id, multa, juros, correcao, tot' +
      'al'#13#10'from PROC_ANUIDS_NAOPARCELS(:ass_id, :tipo, :dataatual)'#13#10'whe' +
      're tipocontrib = :tipocontrib'#13#10'order by vencimento'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    Left = 400
    Top = 42
    object IntegerField11: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object IntegerField12: TIntegerField
      FieldName = 'ANO'
    end
    object FMTBCDField11: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object DateField3: TDateField
      FieldName = 'VENCIMENTO'
    end
    object StringField6: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object IntegerField13: TIntegerField
      FieldName = 'PARC_ID'
    end
    object IntegerField14: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object IntegerField15: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object FMTBCDField12: TFMTBCDField
      FieldName = 'MULTA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField13: TFMTBCDField
      FieldName = 'JUROS'
      Precision = 15
      Size = 2
    end
    object FMTBCDField14: TFMTBCDField
      FieldName = 'CORRECAO'
      Precision = 15
      Size = 2
    end
    object FMTBCDField15: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
  end
  object dspContribsParcelamento: TDataSetProvider
    DataSet = sdsContribsParcelamento
    Constraints = True
    Left = 410
    Top = 62
  end
  object cdsContribsParcelamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipocontrib'
        ParamType = ptInput
      end>
    ProviderName = 'dspContribsParcelamento'
    Left = 424
    Top = 82
    object cdsContribsParcelamentoANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsContribsParcelamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsContribsParcelamentoANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsContribsParcelamentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsContribsParcelamentoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsContribsParcelamentoTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object cdsContribsParcelamentoPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsContribsParcelamentoNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsContribsParcelamentoTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsContribsParcelamentoMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsContribsParcelamentoJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsContribsParcelamentoCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsContribsParcelamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsContribsParcelamento: TDataSource
    DataSet = cdsContribsParcelamento
    Left = 440
    Top = 98
  end
  object PROC_PARCELAMENTOI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'PARCEL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO_PARC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PARCEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PARC'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PRIM_PARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_STATUS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORIGEMRECUP'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_PARCELAMENTOI'
    Left = 864
    Top = 32
  end
  object PROC_PARCELANUIDADES_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'PARCEL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANUID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_ANUID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'MULTA_ANUID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'JUROS_ANUID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'CORRECAO_ANUID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMPARC'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_PARCELANUIDADES_I'
    Left = 896
    Top = 56
  end
  object PROC_PARCELPARCELAS_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'PARC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_PARC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARCEL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PAR_DESCRICAO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_PARCELPARCELAS_I'
    Left = 912
    Top = 80
  end
  object sdsParcelamento: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select distinct  p.parcel_id, p.descricao_parc, p.dt_parcel, p.n' +
      'um_parc, p.valor_total, p.dt_prim_parcela, p.tp_status_id, tp.tp' +
      '_status_descr'#13#10'from parcelamento p'#13#10'inner join  parcel_anuidades' +
      ' pa on pa.parcel_id = p.parcel_id'#13#10'inner join anuidade a on a.an' +
      'uid_id = pa.anuid_id'#13#10'inner join tp_status tp on tp.tp_status_id' +
      ' = p.tp_status_id'#13#10'where a.ass_id = :ass_id'#13#10'order by 1 desc'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 528
    Top = 32
  end
  object dspParcelamento: TDataSetProvider
    DataSet = sdsParcelamento
    Constraints = True
    Left = 544
    Top = 56
  end
  object cdsParcelamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspParcelamento'
    AfterScroll = cdsParcelamentoAfterScroll
    Left = 560
    Top = 80
    object cdsParcelamentoPARCEL_ID: TIntegerField
      FieldName = 'PARCEL_ID'
      Required = True
    end
    object cdsParcelamentoDESCRICAO_PARC: TStringField
      FieldName = 'DESCRICAO_PARC'
      Size = 100
    end
    object cdsParcelamentoDT_PARCEL: TDateField
      FieldName = 'DT_PARCEL'
    end
    object cdsParcelamentoNUM_PARC: TIntegerField
      FieldName = 'NUM_PARC'
    end
    object cdsParcelamentoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelamentoDT_PRIM_PARCELA: TDateField
      FieldName = 'DT_PRIM_PARCELA'
    end
    object cdsParcelamentoTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsParcelamentoTP_STATUS_DESCR: TStringField
      FieldName = 'TP_STATUS_DESCR'
    end
  end
  object dsParcelamento: TDataSource
    DataSet = cdsParcelamento
    Left = 576
    Top = 104
  end
  object sdsParcelasParcel: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select parc_id, par_descricao, num_parcela, dt_vencimento, valor' +
      '_parc, dt_recebimento, nossonumero, valor_pago, parcel_id'#13#10'  fro' +
      'm proc_parcelas_parcel(:p_id)'
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    Left = 632
    Top = 32
  end
  object dspParcelasParc: TDataSetProvider
    DataSet = sdsParcelasParcel
    Constraints = True
    Left = 648
    Top = 56
  end
  object cdsParcelasParc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspParcelasParc'
    Left = 664
    Top = 80
    object cdsParcelasParcPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
      Required = True
    end
    object cdsParcelasParcNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsParcelasParcDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsParcelasParcVALOR_PARC: TFMTBCDField
      FieldName = 'VALOR_PARC'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelasParcDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
    end
    object cdsParcelasParcNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsParcelasParcPAR_DESCRICAO: TStringField
      FieldName = 'PAR_DESCRICAO'
      Size = 10
    end
    object cdsParcelasParcVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelasParcPARCEL_ID: TIntegerField
      FieldName = 'PARCEL_ID'
    end
  end
  object dsParcelasParc: TDataSource
    DataSet = cdsParcelasParc
    Left = 680
    Top = 104
  end
  object sdsParcelAnuidades: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select a.anuid_id, a.ass_id, a.tp_contrib_id, a.descricao, a.ano' +
      ', pa.valor_anuid, a.vencimento, a.situacao, pa.multa_anuid, pa.j' +
      'uros_anuid, pa.correcao_anuid, pa.valor_anuid + pa.multa_anuid +' +
      'pa.juros_anuid+ pa.correcao_anuid total, t.tp_contrib_descricao'#13 +
      #10'from anuidade a'#13#10'inner join parcel_anuidades pa on pa.anuid_id ' +
      '= a.anuid_id'#13#10'inner join tp_contribuicao t on t.tp_contrib_id = ' +
      'a.tp_contrib_id'#13#10'where pa.parcel_id = :parcel_id'#13#10'order by a.ano'
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end>
    Left = 736
    Top = 32
  end
  object dspParcelAnuidades: TDataSetProvider
    DataSet = sdsParcelAnuidades
    Constraints = True
    Left = 752
    Top = 56
  end
  object cdsParcelAnuidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsPParcelAnuidades'
    Left = 768
    Top = 80
    object cdsParcelAnuidadesANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
      Required = True
    end
    object cdsParcelAnuidadesASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsParcelAnuidadesTP_CONTRIB_ID: TIntegerField
      FieldName = 'TP_CONTRIB_ID'
      Required = True
    end
    object cdsParcelAnuidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsParcelAnuidadesANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsParcelAnuidadesVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsParcelAnuidadesSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object cdsParcelAnuidadesVALOR_ANUID: TFMTBCDField
      FieldName = 'VALOR_ANUID'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelAnuidadesMULTA_ANUID: TFMTBCDField
      FieldName = 'MULTA_ANUID'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelAnuidadesJUROS_ANUID: TFMTBCDField
      FieldName = 'JUROS_ANUID'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelAnuidadesCORRECAO_ANUID: TFMTBCDField
      FieldName = 'CORRECAO_ANUID'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelAnuidadesTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsParcelAnuidadesTP_CONTRIB_DESCRICAO: TStringField
      FieldName = 'TP_CONTRIB_DESCRICAO'
    end
  end
  object dsParcelAnuidades: TDataSource
    DataSet = cdsParcelAnuidades
    Left = 784
    Top = 104
  end
  object sdsPROC_PARCELAMENTO_DEL: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select excluido'#13#10'from proc_parcelamento_del(:parcel_id)'
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end>
    Left = 576
    Top = 168
  end
  object dspPROC_PARCELAMENTO_DEL: TDataSetProvider
    DataSet = sdsPROC_PARCELAMENTO_DEL
    Constraints = True
    Left = 592
    Top = 184
  end
  object cdsPROC_PARCELAMENTO_DEL: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspPROC_PARCELAMENTO_DEL'
    Left = 608
    Top = 200
    object cdsPROC_PARCELAMENTO_DELEXCLUIDO: TIntegerField
      FieldName = 'EXCLUIDO'
    end
  end
  object sdsPROC_PARCELAMENTO_AT: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select aviso'#13#10'  from proc_parcelamento_at(:parcel_id, :operacao,' +
      ':force)'
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'operacao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'force'
        ParamType = ptInput
      end>
    Left = 784
    Top = 168
  end
  object dspPROC_PARCELAMENTO_AT: TDataSetProvider
    DataSet = sdsPROC_PARCELAMENTO_AT
    Constraints = True
    Left = 800
    Top = 184
  end
  object cdsPROC_PARCELAMENTO_AT: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'parcel_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'operacao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'force'
        ParamType = ptInput
      end>
    ProviderName = 'dspPROC_PARCELAMENTO_AT'
    Left = 816
    Top = 200
    object cdsPROC_PARCELAMENTO_ATAVISO: TIntegerField
      FieldName = 'AVISO'
    end
  end
  object PROC_MANUT_PAGTO: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'HOJE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
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
        DataType = ftDate
        Name = 'DT_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_PAGO'
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
        DataType = ftInteger
        Name = 'PARC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MANUT_PAGTO'
    Left = 824
    Top = 280
  end
  object sdsEncargos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select multa, juros, correcao'#13#10' from proc_encargos(:valor, :venc' +
      'imento, :dataatual, 2)'
    Params = <
      item
        DataType = ftFloat
        Name = 'valor'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'vencimento'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 608
    Top = 280
  end
  object dspEncargos: TDataSetProvider
    DataSet = sdsEncargos
    Constraints = True
    Left = 624
    Top = 304
  end
  object cdsEncargos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'valor'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'vencimento'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspEncargos'
    Left = 640
    Top = 320
    object cdsEncargosMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object cdsEncargosJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object cdsEncargosCORRECAO: TFloatField
      FieldName = 'CORRECAO'
    end
  end
  object sds_Cobranca: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select ass_id, registro, nome, emp_id, regiao, cpfcnpj, anuid_id' +
      ', descricao, ano, valor, vencimento, tipocontrib, parc_id, num_p' +
      'arcela, tpcontrib_id, multa, juros, correcao, total, end_id, end' +
      '_logradouro, end_numero, end_complemento, end_bairro, end_cep, c' +
      'idade_id, tp_ender_id, end_corresp, end_corresp_dev, statuscorre' +
      'sp, cidade_nome, estado_nome, tp_ender_descr, ender_completo, tp' +
      '_assoc_id, strsql'#13#10'     from proc_cobranca2(:tipocontribpar, :an' +
      'opar, :emdiaate, :datatual, :emp_id_par, :regpar, :emdiacom, :ti' +
      'poassoc, :abertoatras, :regparfinal)'
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anopar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiaate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiacom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'abertoatras'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparfinal'
        ParamType = ptInput
      end>
    Left = 432
    Top = 536
  end
  object dspCobranca: TDataSetProvider
    DataSet = sds_Cobranca
    Constraints = True
    Left = 464
    Top = 568
  end
  object cdsCobranca: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anopar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiaate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiacom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'abertoatras'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparfinal'
        ParamType = ptInput
      end>
    ProviderName = 'dspCobranca'
    Left = 480
    Top = 592
    object cdsCobrancaASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsCobrancaREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsCobrancaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsCobrancaEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsCobrancaREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsCobrancaCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsCobrancaANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsCobrancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsCobrancaANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsCobrancaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsCobrancaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsCobrancaTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
    end
    object cdsCobrancaPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsCobrancaNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsCobrancaTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsCobrancaMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsCobrancaJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsCobrancaCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsCobrancaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsCobrancaEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsCobrancaEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsCobrancaEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsCobrancaEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsCobrancaEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsCobrancaEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsCobrancaCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsCobrancaTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsCobrancaEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsCobrancaEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsCobrancaSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsCobrancaCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsCobrancaESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsCobrancaTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsCobrancaENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsCobrancaTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
  end
  object sdsInadimp: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select i.ass_id, i.registro, i.nome, i.emp_id, i.regiao, i.cpfcn' +
      'pj, i.anuid_id, i.descricao, i.ano, i.valor, i.vencimento, i.tip' +
      'ocontrib, i.parc_id, i.num_parcela, i.tpcontrib_id, i.multa, i.j' +
      'uros, i.correcao, i.total, i.end_id, i.end_logradouro, i.end_num' +
      'ero, i.end_complemento, i.end_bairro, i.end_cep, i.cidade_id, i.' +
      'tp_ender_id, i.end_corresp, i.end_corresp_dev, i.statuscorresp, ' +
      'i.cidade_nome, i.estado_nome, i.tp_ender_descr, i.ender_completo' +
      ', i.tp_assoc_id'#13#10'   from proc_inadimplencia(:tipocontribpar, :an' +
      'oinicio, :anofim, :datatual, :emp_id_par, :regpar) i'
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinicio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end>
    Left = 520
    Top = 416
  end
  object dspInadip: TDataSetProvider
    DataSet = sdsInadimp
    Constraints = True
    Left = 544
    Top = 432
  end
  object cdsInadip: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinicio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end>
    ProviderName = 'dspInadip'
    Left = 568
    Top = 456
    object cdsInadipASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsInadipREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsInadipNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsInadipEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsInadipREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsInadipCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsInadipANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsInadipDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsInadipANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsInadipVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsInadipVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsInadipTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
    end
    object cdsInadipPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsInadipNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsInadipTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsInadipMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsInadipJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsInadipCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsInadipTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsInadipEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsInadipEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsInadipEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsInadipEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsInadipEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsInadipEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsInadipCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsInadipTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsInadipEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsInadipEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsInadipSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsInadipCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsInadipESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsInadipTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsInadipENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsInadipTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
  end
  object dsPagtosItens: TDataSource
    DataSet = cdspagtosItens
    Left = 368
    Top = 440
  end
  object cdspagtosItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'bol_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspPagtosItens'
    Left = 352
    Top = 416
    object cdspagtosItensBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object cdspagtosItensITEM_BOL_ID: TIntegerField
      FieldName = 'ITEM_BOL_ID'
      Required = True
    end
    object cdspagtosItensPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdspagtosItensANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdspagtosItensDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 100
    end
    object cdspagtosItensVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdspagtosItensVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdspagtosItensVALOR_JUROS: TFMTBCDField
      FieldName = 'VALOR_JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdspagtosItensVALOR_CORRECAO: TFMTBCDField
      FieldName = 'VALOR_CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdspagtosItensTOTALITEM: TFMTBCDField
      FieldName = 'TOTALITEM'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dspPagtosItens: TDataSetProvider
    DataSet = sdsPagtosItens
    Constraints = True
    Left = 336
    Top = 392
  end
  object sdsPagtosItens: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select  i.bol_id, i.item_bol_id, i.parc_id, i.anuid_id, i.descri' +
      'cao_item, i.valor_item, i.valor_multa, i.valor_juros, i.valor_co' +
      'rrecao, i.valor_item + i.valor_multa + i.valor_juros + i.valor_c' +
      'orrecao as totalitem'#13#10'    from boleto_itens i where i.bol_id = :' +
      'bol_id'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'bol_id'
        ParamType = ptInput
      end>
    Left = 320
    Top = 368
  end
  object sdsExtratoGeral: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, ano, valor, vencimento, tipocontrib,' +
      ' valortotal, juros, multa, correcao, situacao'#13#10'from proc_extrato' +
      '_geral(:ass_id, :hoje, :anoini, :anofim, :tp_contrib_id)'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'hoje'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_contrib_id'
        ParamType = ptInput
      end>
    Left = 200
    Top = 250
  end
  object dspExtratogeral: TDataSetProvider
    DataSet = sdsExtratoGeral
    Constraints = True
    Left = 210
    Top = 270
  end
  object cdsExtratogeral: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'hoje'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_contrib_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspExtratogeral'
    Left = 224
    Top = 290
    object cdsExtratogeralANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsExtratogeralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsExtratogeralANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsExtratogeralVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsExtratogeralVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsExtratogeralTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
    end
    object cdsExtratogeralVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsExtratogeralJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsExtratogeralMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsExtratogeralCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 6
    end
    object cdsExtratogeralSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
  end
  object dsExtratoGeral: TDataSource
    DataSet = cdsExtratogeral
    Left = 240
    Top = 306
  end
  object sdsRelatParcels: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select *  from proc_relat_parcelamentos(:filtro, :tipo,:MAXMESES' +
      ',:ULTPAGTO,:reg,:data1, :data2, :emreccredito, :datavenc1,:datav' +
      'enc2)'
    Params = <
      item
        DataType = ftInteger
        Name = 'filtro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MAXMESES'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ULTPAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'reg'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emreccredito'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc2'
        ParamType = ptInput
      end>
    Left = 616
    Top = 408
  end
  object dspRelatParcels: TDataSetProvider
    DataSet = sdsRelatParcels
    Constraints = True
    Left = 632
    Top = 432
  end
  object cdsRelatParcels: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'filtro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MAXMESES'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ULTPAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'reg'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emreccredito'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc2'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatParcels'
    Left = 656
    Top = 456
    object cdsRelatParcelsASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsRelatParcelsREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsRelatParcelsNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsRelatParcelsREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsRelatParcelsCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsRelatParcelsTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
    end
    object cdsRelatParcelsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsRelatParcelsDT_PARC: TDateField
      FieldName = 'DT_PARC'
    end
    object cdsRelatParcelsNUMPARC: TIntegerField
      FieldName = 'NUMPARC'
    end
    object cdsRelatParcelsEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsRelatParcelsEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsRelatParcelsEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsRelatParcelsEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsRelatParcelsEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsRelatParcelsEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsRelatParcelsCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsRelatParcelsTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsRelatParcelsEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsRelatParcelsEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsRelatParcelsSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsRelatParcelsCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsRelatParcelsESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsRelatParcelsTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsRelatParcelsENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsRelatParcelsPARCEL_ID: TIntegerField
      FieldName = 'PARCEL_ID'
    end
    object cdsRelatParcelsTELS: TStringField
      FieldName = 'TELS'
      Size = 200
    end
    object cdsRelatParcelsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 400
    end
    object cdsRelatParcelsRECCREDITO: TStringField
      FieldName = 'RECCREDITO'
      Size = 3
    end
    object cdsRelatParcelsPARCELSATRASO: TIntegerField
      FieldName = 'PARCELSATRASO'
    end
    object cdsRelatParcelsVALORTOTALATRASO: TFMTBCDField
      FieldName = 'VALORTOTALATRASO'
      Precision = 18
      Size = 2
    end
    object cdsRelatParcelsVENCPRIMPARCEL: TDateField
      FieldName = 'VENCPRIMPARCEL'
    end
  end
  object sdsQtdeParcelAtivos: TSQLClientDataSet
    CommandText = 
      'select count(distinct  p.parcel_id) qtde'#13#10'from parcelamento p'#13#10'i' +
      'nner join  parcel_anuidades pa on pa.parcel_id = p.parcel_id'#13#10'in' +
      'ner join anuidade a on a.anuid_id = pa.anuid_id'#13#10'where a.ass_id ' +
      '= :ass_id and p.tp_status_id  <> 2'#13#10'and 0<( select count(*) from' +
      ' parcelas pa  where pa.parcel_id = p.parcel_id'#13#10'and not exists (' +
      'select first 1 1 from boleto_itens bi inner join boleto b on b.b' +
      'ol_id = bi.bol_id'#13#10'where b.tp_status_id<>2 and  bi.parc_id = pa.' +
      'parc_id and b.dt_recebimento is not null ) )'
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
    Left = 936
    Top = 216
    object sdsQtdeParcelAtivosQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
  end
  object sdsEmdia: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select ass_id, registro, nome, emp_id, regiao, cpfcnpj, end_id, ' +
      'end_logradouro, end_numero, end_complemento, end_bairro, end_cep' +
      ', cidade_id, tp_ender_id, end_corresp, end_corresp_dev, statusco' +
      'rresp, cidade_nome, estado_nome, tp_ender_descr, ender_completo,' +
      ' tp_assoc_id'#13#10'         from proc_relat_assoc_emdia(:emp_id_par, ' +
      ':tipoassoc)'
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end>
    Left = 728
    Top = 416
  end
  object dspEmdia: TDataSetProvider
    DataSet = sdsEmdia
    Constraints = True
    Left = 744
    Top = 440
  end
  object cdsEmdia: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end>
    ProviderName = 'dspEmdia'
    Left = 760
    Top = 464
    object cdsEmdiaASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsEmdiaREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsEmdiaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsEmdiaEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsEmdiaREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsEmdiaCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsEmdiaEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsEmdiaEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsEmdiaEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsEmdiaEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsEmdiaEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsEmdiaEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsEmdiaCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsEmdiaTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsEmdiaEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsEmdiaEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsEmdiaSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsEmdiaCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsEmdiaESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsEmdiaTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsEmdiaENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsEmdiaTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
  end
  object sdsProcDebitos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select first 1 1 resultado'#13#10'from proc_debitos(:ass_id, :tipo, :d' +
      'ataatual)'#13#10'where TPCONTRIB_ID = :tipocontrib and ( (ano between ' +
      ':ano1 and :ano2 ) or  ano is null)'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano2'
        ParamType = ptInput
      end>
    Left = 512
    Top = 314
  end
  object dspProcDebitos: TDataSetProvider
    DataSet = sdsProcDebitos
    Constraints = True
    Left = 522
    Top = 334
  end
  object cdsProcDebitos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano2'
        ParamType = ptInput
      end>
    ProviderName = 'dspProcDebitos'
    Left = 536
    Top = 354
    object cdsProcDebitosRESULTADO: TIntegerField
      FieldName = 'RESULTADO'
      Required = True
    end
  end
  object sdsVerParcelamento: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select first 1 1 resultado from parcelamento p'#13#10'inner join parce' +
      'l_anuidades pa on p.parcel_id = pa.parcel_id'#13#10'inner join anuidad' +
      'e a on a.anuid_id = pa.anuid_id'#13#10'where p.tp_status_id = 1 and p.' +
      'valor_total <>0 and a.tp_contrib_id = :tp_contrib_id'#13#10'and a.ass_' +
      'id = :ass_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'tp_contrib_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 296
    Top = 528
  end
  object dspVerParcelamento: TDataSetProvider
    DataSet = sdsVerParcelamento
    Constraints = True
    Left = 320
    Top = 544
  end
  object cdsVerParcelamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tp_contrib_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspVerParcelamento'
    Left = 360
    Top = 568
    object cdsVerParcelamentoRESULTADO: TIntegerField
      FieldName = 'RESULTADO'
      Required = True
    end
  end
  object PROC_GERA_FINANCAS_ASSOC: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_GERA_FINANCAS_ASSOC'
    Left = 904
    Top = 376
  end
  object PROC_PARCELA_ALTERDADOS: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ANUID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_PARCELA_ALTERDADOS'
    Left = 912
    Top = 512
  end
  object SQLDataSet1: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select p.ass_id, p.registro, p.nome, p.emp_id, p.regiao, p.cpfcn' +
      'pj, p.anuid_id, p.descricao, p.ano, p.valor, p.vencimento, p.tip' +
      'ocontrib, p.parc_id, p.num_parcela, p.tpcontrib_id, p.multa, p.j' +
      'uros, p.correcao, p.total, p.end_id, p.end_logradouro, p.end_num' +
      'ero, p.end_complemento, p.end_bairro, p.end_cep, p.cidade_id, p.' +
      'tp_ender_id, p.end_corresp, p.end_corresp_dev, p.statuscorresp, ' +
      'p.cidade_nome, p.estado_nome, p.tp_ender_descr, p.ender_completo' +
      ', p.tp_assoc_id'#13#10'    from proc_cobranca(:tipocontribpar, :anopar' +
      ', :emdiaate, :datatual, :emp_id_par, :regpar, :emdiacom, :TIPOAS' +
      'SOC) p'
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anopar'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'emdiaate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiacom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOASSOC'
        ParamType = ptInput
      end>
    Left = 624
    Top = 568
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Constraints = True
    Left = 640
    Top = 592
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anopar'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'emdiaate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emdiacom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOASSOC'
        ParamType = ptInput
      end>
    ProviderName = 'dspCobranca'
    Left = 656
    Top = 616
    object IntegerField16: TIntegerField
      FieldName = 'ASS_ID'
    end
    object StringField7: TStringField
      FieldName = 'REGISTRO'
    end
    object StringField8: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object IntegerField17: TIntegerField
      FieldName = 'EMP_ID'
    end
    object StringField9: TStringField
      FieldName = 'REGIAO'
    end
    object StringField10: TStringField
      FieldName = 'CPFCNPJ'
    end
    object IntegerField18: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object StringField11: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object IntegerField19: TIntegerField
      FieldName = 'ANO'
    end
    object FMTBCDField16: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object DateField4: TDateField
      FieldName = 'VENCIMENTO'
    end
    object StringField12: TStringField
      FieldName = 'TIPOCONTRIB'
    end
    object IntegerField20: TIntegerField
      FieldName = 'PARC_ID'
    end
    object IntegerField21: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object IntegerField22: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object FMTBCDField17: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField18: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField19: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField20: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object IntegerField23: TIntegerField
      FieldName = 'END_ID'
    end
    object StringField13: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object StringField14: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object StringField15: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object StringField16: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object StringField17: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object IntegerField24: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object IntegerField25: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object SmallintField1: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object SmallintField2: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object StringField18: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object StringField19: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object StringField20: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object StringField21: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object StringField22: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object IntegerField26: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
  end
  object sdsRelatInadimplencia: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select ass_id, registro, nome, emp_id, regiao, cpfcnpj, tipocont' +
      'rib, tpcontrib_id, end_id, end_logradouro, end_numero, end_compl' +
      'emento, end_bairro, end_cep, cidade_id, tp_ender_id, end_corresp' +
      ', end_corresp_dev, statuscorresp, cidade_nome, estado_nome, tp_e' +
      'nder_descr, ender_completo, tp_assoc_id, anopago, tipopessoadesc' +
      'r, TELS, email, sexo'#13#10'         from proc_relat_inadimplencia(:ti' +
      'pocontribpar, :anoinadini , :anoinadfim, :emp_id_par, :regparini' +
      ', :regparfim, :anterior_aberto, :tipopessoa)'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinadini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinadfim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparfim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anterior_aberto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipopessoa'
        ParamType = ptInput
      end>
    Left = 512
    Top = 496
  end
  object dsRelatInadimplencia: TDataSetProvider
    DataSet = sdsRelatInadimplencia
    Constraints = True
    Left = 536
    Top = 512
  end
  object cdsRelatInadimplente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinadini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anoinadfim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'regparfim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anterior_aberto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipopessoa'
        ParamType = ptInput
      end>
    ProviderName = 'dsRelatInadimplencia'
    Left = 560
    Top = 536
    object cdsRelatInadimplenteASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsRelatInadimplenteREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsRelatInadimplenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsRelatInadimplenteEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsRelatInadimplenteREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsRelatInadimplenteCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsRelatInadimplenteTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
    end
    object cdsRelatInadimplenteTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsRelatInadimplenteEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsRelatInadimplenteEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsRelatInadimplenteEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsRelatInadimplenteEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsRelatInadimplenteEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsRelatInadimplenteEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsRelatInadimplenteCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsRelatInadimplenteTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsRelatInadimplenteEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsRelatInadimplenteEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsRelatInadimplenteSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsRelatInadimplenteCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsRelatInadimplenteESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsRelatInadimplenteTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsRelatInadimplenteENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsRelatInadimplenteTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
    object cdsRelatInadimplenteANOPAGO: TIntegerField
      FieldName = 'ANOPAGO'
    end
    object cdsRelatInadimplenteTIPOPESSOADESCR: TStringField
      FieldName = 'TIPOPESSOADESCR'
    end
    object cdsRelatInadimplenteTELS: TStringField
      FieldName = 'TELS'
      Size = 200
    end
    object cdsRelatInadimplenteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsRelatInadimplenteSEXO: TStringField
      FieldName = 'SEXO'
    end
  end
  object PROC_ACERTAIBLGERAL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ACERTAIBLGERAL'
    Left = 856
    Top = 648
  end
  object sdsContribsRecibo: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, descricao, descricao || '#39' - '#39' || tipocontrib de' +
      'scrtipo, ano, valor, vencimento, tipocontrib, parc_id, num_parce' +
      'la, tpcontrib_id, multa, juros, correcao, total'#13#10'from proc_debit' +
      'os(:ass_id, :tipo, :dataatual)'#13#10'order by vencimento'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 40
    Top = 552
  end
  object dspContribsRecibo: TDataSetProvider
    DataSet = sdsContribsRecibo
    Constraints = True
    Left = 58
    Top = 574
  end
  object cdsContribsRecibo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspContribsRecibo'
    Left = 72
    Top = 594
    object cdsContribsReciboANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsContribsReciboDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsContribsReciboDESCRTIPO: TStringField
      FieldName = 'DESCRTIPO'
      Size = 133
    end
    object cdsContribsReciboANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsContribsReciboVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 6
    end
    object cdsContribsReciboVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsContribsReciboTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 30
    end
    object cdsContribsReciboPARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object cdsContribsReciboNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsContribsReciboTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
    end
    object cdsContribsReciboMULTA: TFMTBCDField
      FieldName = 'MULTA'
      Precision = 15
      Size = 6
    end
    object cdsContribsReciboJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Precision = 15
      Size = 6
    end
    object cdsContribsReciboCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      Precision = 15
      Size = 6
    end
    object cdsContribsReciboTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 6
    end
  end
  object dsContribsRecibo: TDataSource
    DataSet = cdsContribsRecibo
    Left = 88
    Top = 610
  end
  object PROC_BOLETO_PAGAR_MANUAL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BOL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_BAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'MULTA_PAGA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'CORRECAO_PAGA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'JUROS_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'DESCONTO_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FORMA_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'ENCARGOS_PAGO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_BOLETO_PAGAR_MANUAL'
    Left = 1072
    Top = 584
  end
  object sdsMovPeriodo: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select nome, registro, cpfcnpj, regiao, dt_vencimento, situacao,' +
      ' valor_total, nossonumero, dt_recebimento, valor_recebimento, fo' +
      'rma_pagto, itens'#13#10'    from proc_recibo_mov(:dataini, :datafim, :' +
      'cancelado, :LOCALIDADE)'
    Params = <
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cancelado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOCALIDADE'
        ParamType = ptInput
      end>
    Left = 168
    Top = 576
  end
  object dspMovPeriodo: TDataSetProvider
    DataSet = sdsMovPeriodo
    Constraints = True
    Left = 186
    Top = 598
  end
  object cdsMovPeriodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cancelado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOCALIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspMovPeriodo'
    Left = 200
    Top = 618
    object cdsMovPeriodoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsMovPeriodoREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object cdsMovPeriodoCPFCNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ'
    end
    object cdsMovPeriodoREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
    end
    object cdsMovPeriodoDT_VENCIMENTO: TDateField
      DisplayLabel = 'Data Vencto.'
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsMovPeriodoSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o Recibo'
      FieldName = 'SITUACAO'
    end
    object cdsMovPeriodoVALOR_TOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsMovPeriodoNOSSONUMERO: TStringField
      DisplayLabel = 'N'#186'Recibo'
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsMovPeriodoDT_RECEBIMENTO: TDateField
      DisplayLabel = 'Data Recebimento'
      FieldName = 'DT_RECEBIMENTO'
    end
    object cdsMovPeriodoVALOR_RECEBIMENTO: TFMTBCDField
      DisplayLabel = 'Valor Recebimento'
      FieldName = 'VALOR_RECEBIMENTO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsMovPeriodoFORMA_PAGTO: TStringField
      DisplayLabel = 'Forma Pagto.'
      FieldName = 'FORMA_PAGTO'
      Size = 30
    end
    object cdsMovPeriodoITENS: TStringField
      DisplayLabel = #205'tens do Recibo'
      FieldName = 'ITENS'
      Size = 750
    end
  end
  object dsMovPeriodo: TDataSource
    DataSet = cdsMovPeriodo
    Left = 216
    Top = 634
  end
  object sdsRelatParcelsNovo: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select *  from proc_relat_parcelamentos_novo(:filtro, :tipo,:MAX' +
      'MESES,:ULTPAGTO,:reg,:data1, :data2, :emreccredito, :dataevenc1,' +
      ':dataevenc2)'
    Params = <
      item
        DataType = ftInteger
        Name = 'filtro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MAXMESES'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ULTPAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'reg'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emreccredito'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datavenc2'
        ParamType = ptInput
      end>
    Left = 672
    Top = 392
  end
end
