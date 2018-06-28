object DMGeral: TDMGeral
  OldCreateOrder = False
  Left = 374
  Top = 181
  Height = 456
  Width = 800
  object sdsIndice: TSQLDataSet
    NoMetadata = True
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select i.indice_id, i.tp_indice_id, i.valor2, i.mes, i.ano, i.dt' +
      '_lancamento, i.dt_vigencia,'#13#10'case'#13#10'when udf_weekday(i.dt_vigenci' +
      'a) = 0 then '#39'Domingo'#39#13#10'when udf_weekday(i.dt_vigencia) = 1 then ' +
      #39'Segunda-feira'#39#13#10'when udf_weekday(i.dt_vigencia) =2 then '#39'Ter'#231'a-' +
      'feira'#39#13#10'when udf_weekday(i.dt_vigencia) = 3 then '#39'Quarta-feira'#39#13 +
      #10'when udf_weekday(i.dt_vigencia) = 4 then '#39'Quinta-feira'#39#13#10'when u' +
      'df_weekday(i.dt_vigencia) = 5 then '#39'Sexta-feira'#39#13#10'when udf_weekd' +
      'ay(i.dt_vigencia) = 6 then '#39'S'#225'bado'#39#13#10'end dia_semana'#13#10'from indice' +
      ' i'#13#10'where i.tp_indice_id=2'#13#10'order by i.dt_vigencia desc'
    Params = <>
    Left = 48
    Top = 48
    object sdsIndiceINDICE_ID: TIntegerField
      FieldName = 'INDICE_ID'
      Required = True
    end
    object sdsIndiceTP_INDICE_ID: TIntegerField
      FieldName = 'TP_INDICE_ID'
    end
    object sdsIndiceVALOR2: TFMTBCDField
      FieldName = 'VALOR2'
      Precision = 15
      Size = 8
    end
    object sdsIndiceMES: TIntegerField
      FieldName = 'MES'
    end
    object sdsIndiceANO: TIntegerField
      FieldName = 'ANO'
    end
    object sdsIndiceDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object sdsIndiceDT_VIGENCIA: TDateField
      FieldName = 'DT_VIGENCIA'
    end
    object sdsIndiceDIA_SEMANA: TStringField
      FieldName = 'DIA_SEMANA'
      FixedChar = True
      Size = 13
    end
  end
  object dspIndice: TDataSetProvider
    DataSet = sdsIndice
    Constraints = True
    Left = 64
    Top = 64
  end
  object cdsIndice: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndice'
    Left = 80
    Top = 80
    object cdsIndiceINDICE_ID: TIntegerField
      FieldName = 'INDICE_ID'
      Required = True
    end
    object cdsIndiceTP_INDICE_ID: TIntegerField
      FieldName = 'TP_INDICE_ID'
    end
    object cdsIndiceVALOR2: TFMTBCDField
      FieldName = 'VALOR2'
      DisplayFormat = ',0.00000000'
      Precision = 15
      Size = 8
    end
    object cdsIndiceMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsIndiceANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsIndiceDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object cdsIndiceDT_VIGENCIA: TDateField
      FieldName = 'DT_VIGENCIA'
    end
    object cdsIndiceDIA_SEMANA: TStringField
      FieldName = 'DIA_SEMANA'
      FixedChar = True
      Size = 13
    end
  end
  object dsIndice: TDataSource
    DataSet = cdsIndice
    Left = 104
    Top = 96
  end
  object PROC_INDICE_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftString
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VIGENCIA'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_INDICE_I'
    Left = 56
    Top = 152
  end
  object PROC_INDICE_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'INDICE_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_INDICE_DEL'
    Left = 56
    Top = 208
  end
  object sdsTipoContato: TSQLDataSet
    NoMetadata = True
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select t.tp_contato, t.tp_contato_desc'#13#10'from tp_contato t'#13#10'order' +
      ' by 2'
    Params = <>
    Left = 168
    Top = 48
  end
  object dspTipoContato: TDataSetProvider
    DataSet = sdsTipoContato
    Constraints = True
    Left = 184
    Top = 64
  end
  object cdsTipoContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoContato'
    Left = 200
    Top = 80
    object cdsTipoContatoTP_CONTATO: TIntegerField
      FieldName = 'TP_CONTATO'
      Required = True
    end
    object cdsTipoContatoTP_CONTATO_DESC: TStringField
      FieldName = 'TP_CONTATO_DESC'
      Size = 40
    end
  end
  object dsTpoContato: TDataSource
    DataSet = cdsTipoContato
    Left = 224
    Top = 96
  end
  object PROC_TIPO_CONTATO_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_CONTATO_DESC'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_TIPO_CONTATO_UI'
    Left = 240
    Top = 184
  end
  object PROC_TIPO_CONTATO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_CONTATO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_TIPO_CONTATO_DEL'
    Left = 240
    Top = 232
  end
  object sdsValorContrib: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select v.valor_contrib_id, v.tp_assoc_id, v.emp_id, v.tp_contrib' +
      '_id, v.valor, v.ano, v.vencimento, v.faixa_capital, v.valor_aliq' +
      'uota'#13#10'    from valor_contrib v'#13#10'    where v.tp_assoc_id = :tipoa' +
      'ssoc'#13#10'    and v.tp_contrib_id =:tipocontrib'#13#10'    and v.emp_id = ' +
      ':emp_id'#13#10'    order by v.ano desc , v.faixa_capital'
    Params = <
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    Left = 312
    Top = 48
  end
  object dspValorContrib: TDataSetProvider
    DataSet = sdsValorContrib
    Constraints = True
    Left = 328
    Top = 64
  end
  object cdsValorContrib: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tipoassoc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspValorContrib'
    Left = 344
    Top = 80
    object cdsValorContribVALOR_CONTRIB_ID: TIntegerField
      FieldName = 'VALOR_CONTRIB_ID'
      Required = True
    end
    object cdsValorContribTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
    object cdsValorContribEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsValorContribTP_CONTRIB_ID: TIntegerField
      FieldName = 'TP_CONTRIB_ID'
    end
    object cdsValorContribVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsValorContribANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsValorContribVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsValorContribFAIXA_CAPITAL: TFMTBCDField
      FieldName = 'FAIXA_CAPITAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsValorContribVALOR_ALIQUOTA: TFMTBCDField
      FieldName = 'VALOR_ALIQUOTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object dsValorContrib: TDataSource
    DataSet = cdsValorContrib
    Left = 368
    Top = 96
  end
  object sdsEmp_Regiao: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select c.emp_id,  c.regiao'#13#10'from config c'
    Params = <>
    Left = 568
    Top = 42
  end
  object dspEmp_Regiao: TDataSetProvider
    DataSet = sdsEmp_Regiao
    Constraints = True
    Left = 592
    Top = 61
  end
  object cdsEmp_regiao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmp_Regiao'
    Left = 608
    Top = 80
    object cdsEmp_regiaoEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      Required = True
    end
    object cdsEmp_regiaoREGIAO: TStringField
      FieldName = 'REGIAO'
    end
  end
  object dsEmp_Regiao: TDataSource
    DataSet = cdsEmp_regiao
    Left = 624
    Top = 104
  end
  object sdsTp_Pessoa: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select tp.tp_assoc_id, tp.tp_assoc_desc'#13#10'from tp_assoc tp'
    Params = <>
    Left = 456
    Top = 42
  end
  object dspTp_Pessoa: TDataSetProvider
    DataSet = sdsTp_Pessoa
    Constraints = True
    Left = 480
    Top = 61
  end
  object cdsTp_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTp_Pessoa'
    Left = 496
    Top = 80
    object cdsTp_PessoaTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
      Required = True
    end
    object cdsTp_PessoaTP_ASSOC_DESC: TStringField
      FieldName = 'TP_ASSOC_DESC'
      Size = 30
    end
  end
  object dsTp_Pessoa: TDataSource
    DataSet = cdsTp_Pessoa
    Left = 512
    Top = 104
  end
  object sdsTpContrib: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select tp_contrib_id, tp_contrib_descricao'#13#10' from tp_contribuica' +
      'o'
    Params = <>
    Left = 464
    Top = 162
  end
  object dspTpContrib: TDataSetProvider
    DataSet = sdsTpContrib
    Constraints = True
    Left = 488
    Top = 181
  end
  object cdsTpContrib: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTpContrib'
    Left = 504
    Top = 200
    object cdsTpContribTP_CONTRIB_ID: TIntegerField
      FieldName = 'TP_CONTRIB_ID'
      Required = True
    end
    object cdsTpContribTP_CONTRIB_DESCRICAO: TStringField
      FieldName = 'TP_CONTRIB_DESCRICAO'
    end
  end
  object dsTpContrib: TDataSource
    DataSet = cdsTpContrib
    Left = 520
    Top = 224
  end
  object PROC_VALORCONTRIB_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'VALOR_CONTRIB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_ASSOC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_CONTRIB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'FAIXA_CAPITAL'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_ALIQUOTA'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_VALORCONTRIB_UI'
    Left = 376
    Top = 192
  end
  object PROC_VALORES_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'VALOR_CONTRIB_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_VALORES_DEL'
    Left = 376
    Top = 240
  end
  object PROC_TPMOVIMENTO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_MOV_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_TPMOVIMENTO_DEL'
    Left = 640
    Top = 328
  end
  object PROC_TPMOVIMENTO_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_MOV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_MOV_DESCRICAO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_TPMOVIMENTO_UI'
    Left = 616
    Top = 304
  end
  object sdsTipoMovimento: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select tp_mov_id, tp_mov_descricao'#13#10'from tp_movimento'#13#10'order by ' +
      '2'
    Params = <>
    Left = 592
    Top = 178
  end
  object dspTipoMovimento: TDataSetProvider
    DataSet = sdsTipoMovimento
    Constraints = True
    Left = 616
    Top = 197
  end
  object cdsTipoMovimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoMovimento'
    Left = 632
    Top = 216
    object cdsTipoMovimentoTP_MOV_ID: TIntegerField
      FieldName = 'TP_MOV_ID'
      Required = True
    end
    object cdsTipoMovimentoTP_MOV_DESCRICAO: TStringField
      FieldName = 'TP_MOV_DESCRICAO'
      Size = 40
    end
  end
  object dsTipoMovimento: TDataSource
    DataSet = cdsTipoMovimento
    Left = 648
    Top = 240
  end
  object sdsIndiceigpm: TSQLDataSet
    NoMetadata = True
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select i.indice_id, i.tp_indice_id, i.valor, i.mes, i.ano, i.dt_' +
      'lancamento, i.dt_vigencia,'#13#10'case'#13#10'when mes = 1 then '#39'Janeiro'#39#13#10'w' +
      'hen mes = 2 then '#39'Fevereiro'#39#13#10'when mes = 3 then '#39'Mar'#231'o'#39#13#10'when me' +
      's = 4 then '#39'Abril'#39#13#10'when mes = 5 then '#39'Maio'#39#13#10'when mes = 6 then ' +
      #39'Junho'#39#13#10'when mes = 7 then '#39'Julho'#39#13#10'when mes = 8 then '#39'Agosto'#39#13#10 +
      'when mes = 9 then '#39'Setembro'#39#13#10'when mes = 10 then '#39'Outubro'#39#13#10'when' +
      ' mes = 11 then '#39'Novembro'#39#13#10'when mes = 12 then '#39'Dezembro'#39'  end me' +
      's_extenso'#13#10'from indice i where i.tp_indice_id = 1 '#13#10'order by i.a' +
      'no desc, i.mes desc'
    Params = <>
    Left = 24
    Top = 304
  end
  object dspIndiceIpgm: TDataSetProvider
    DataSet = sdsIndiceigpm
    Constraints = True
    Left = 40
    Top = 320
  end
  object cdsIndiceigpm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndiceIpgm'
    Left = 56
    Top = 336
    object cdsIndiceigpmINDICE_ID: TIntegerField
      FieldName = 'INDICE_ID'
      Required = True
    end
    object cdsIndiceigpmTP_INDICE_ID: TIntegerField
      FieldName = 'TP_INDICE_ID'
    end
    object cdsIndiceigpmVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsIndiceigpmMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsIndiceigpmANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsIndiceigpmDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object cdsIndiceigpmDT_VIGENCIA: TDateField
      FieldName = 'DT_VIGENCIA'
    end
    object cdsIndiceigpmMES_EXTENSO: TStringField
      FieldName = 'MES_EXTENSO'
      FixedChar = True
      Size = 9
    end
  end
  object dsIndiceigpm: TDataSource
    DataSet = cdsIndiceigpm
    Left = 80
    Top = 352
  end
  object PROC_INDICE_IGPM_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_INDICE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VIGENCIA'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_INDICE_IGPM_I'
    Left = 144
    Top = 152
  end
end
