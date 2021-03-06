object DMLotes: TDMLotes
  OldCreateOrder = False
  Left = 384
  Top = 150
  Height = 419
  Width = 980
  object sdsLocLotes: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select idlote, nomelote, datacriacao, iduser, nomelote ||'#39' ('#39'|| ' +
      'datacriacao ||'#39') - '#39'  || descricao  nomedata, descricao'#13#10'    fro' +
      'm lote l order by  l.idlote desc'
    Params = <>
    Left = 40
    Top = 88
  end
  object dspLocLotes: TDataSetProvider
    DataSet = sdsLocLotes
    Constraints = True
    Left = 56
    Top = 104
  end
  object cdsLocLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocLotes'
    Left = 72
    Top = 120
    object cdsLocLotesIDLOTE: TIntegerField
      FieldName = 'IDLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLocLotesNOMELOTE: TStringField
      FieldName = 'NOMELOTE'
      Size = 30
    end
    object cdsLocLotesDATACRIACAO: TDateField
      FieldName = 'DATACRIACAO'
    end
    object cdsLocLotesIDUSER: TIntegerField
      FieldName = 'IDUSER'
    end
    object cdsLocLotesNOMEDATA: TStringField
      FieldName = 'NOMEDATA'
      ReadOnly = True
      Size = 43
    end
    object cdsLocLotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 60
    end
  end
  object sdsContribs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select anuid_id, ano, case when TPCONTRIB_ID=1 then valor else 0' +
      ' end valor, vencimento, case when TPCONTRIB_ID=1 then multa else' +
      ' 0 end multa, case when TPCONTRIB_ID=1 then juros else 0 end jur' +
      'os, case when TPCONTRIB_ID=1 then correcao else 0 end correcao, ' +
      'case when TPCONTRIB_ID=1 then total else 0 end total, TPCONTRIB_' +
      'ID'#13#10'from proc_debitos(:ass_id, '#39'A'#39', :dataatual)'#13#10'where ano betwe' +
      'en :ano1 and :ano2'#13#10'order by vencimento, ano'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
        Value = '20/05/2016'
      end
      item
        DataType = ftInteger
        Name = 'ano1'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'ano2'
        ParamType = ptInput
        Value = '0'
      end>
    Left = 48
    Top = 232
  end
  object dspContribs: TDataSetProvider
    DataSet = sdsContribs
    Constraints = True
    Left = 64
    Top = 248
  end
  object cdsContribs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
        Value = '20/05/2016'
      end
      item
        DataType = ftInteger
        Name = 'ano1'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'ano2'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspContribs'
    Left = 80
    Top = 272
    object cdsContribsANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object cdsContribsANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsContribsVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsContribsVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      ReadOnly = True
    end
    object cdsContribsMULTA: TFMTBCDField
      FieldName = 'MULTA'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsContribsJUROS: TFMTBCDField
      FieldName = 'JUROS'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsContribsCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsContribsTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsContribsTPCONTRIB_ID: TIntegerField
      FieldName = 'TPCONTRIB_ID'
      ReadOnly = True
    end
  end
  object sdsItensLote: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select i.idloteitem, substring(a.registro from 1 for 7)||'#39'/'#39'|| s' +
      'ubstring(a.registro from 8 for 4) registro, a.nome, case when a.' +
      'tp_assoc_id = 1 then '#39'Jur'#237'dica'#39' when a.tp_assoc_id = 2 then '#39'F'#237's' +
      'ica'#39' end Tp_pessoa,'#13#10' (select first 1 t.desctpstatusitem from lo' +
      'teitemstatus s inner join loteitemtpstatus t on t.idtpstatusitem' +
      ' = s.idtpstatusitem'#13#10' where s.idloteitem = i.idloteitem order by' +
      ' s.idloteitemstatus desc) Ult_Status'#13#10' from associado a'#13#10' inner ' +
      'join loteitens i on i.ass_id = a.ass_id'#13#10' where i.idlote = :idlo' +
      'te'#13#10' order by 2'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'idlote'
        ParamType = ptInput
      end>
    Left = 176
    Top = 248
  end
  object dspItensLote: TDataSetProvider
    DataSet = sdsItensLote
    Constraints = True
    Left = 192
    Top = 272
  end
  object cdsItensLote: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idlote'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensLote'
    Left = 216
    Top = 296
    object cdsItensLoteREGISTRO: TStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      ReadOnly = True
      Size = 41
    end
    object cdsItensLoteNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object cdsItensLoteTP_PESSOA: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TP_PESSOA'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object cdsItensLoteULT_STATUS: TStringField
      DisplayLabel = #218'ltimo Status'
      FieldName = 'ULT_STATUS'
      ReadOnly = True
      Size = 40
    end
    object cdsItensLoteIDLOTEITEM: TIntegerField
      FieldName = 'IDLOTEITEM'
      Required = True
    end
  end
  object sdsItensContribs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.ano,'#13#10'        c.vencimento,'#13#10'        (select first 1 t.' +
      'desccontribtpstatus from lotecontribstatus s inner join lotecont' +
      'ribtpstatus t on t.idlotecontribtpstatus = s.idlotecontribtpstat' +
      'us'#13#10'        where s.idloteitemcontrib = c.idloteitemcontrib orde' +
      'r by c.datainclusao desc, c.idloteitemcontrib ) Ult_Status,'#13#10'   ' +
      '     c.datarepasse,ur.login user_repasse, c.iduserdatarepasse,'#13#10 +
      '        c.total,c.valor, c.multa, c.juros, c.correcao,'#13#10'        ' +
      'c.datainclusao, ui.login user_inclusao, c.iduserinclusao,'#13#10'     ' +
      '   c.dataatualizacao,ua.login user_alteracao, c.iduseratualizaca' +
      'o,'#13#10'        c.idloteitemcontrib, c.anuid_id, c.idloteitem'#13#10' from' +
      ' loteitenscontribs c'#13#10' inner join ucusuario ui on ui.iduser = c.' +
      'iduserinclusao'#13#10' inner join ucusuario ua on ua.iduser = c.iduser' +
      'atualizacao'#13#10' left join ucusuario ur on ur.iduser = c.iduserdata' +
      'repasse'#13#10' where c.idloteitem = :IDLOTEITEM'#13#10' order by c.ano, c.v' +
      'encimento'
    Params = <
      item
        DataType = ftInteger
        Name = 'IDLOTEITEM'
        ParamType = ptInput
      end>
    Left = 296
    Top = 264
  end
  object dspItensContribs: TDataSetProvider
    DataSet = sdsItensContribs
    Constraints = True
    Left = 312
    Top = 280
  end
  object cdsItensContribs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDLOTEITEM'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensContribs'
    Left = 320
    Top = 296
    object cdsItensContribsANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
    end
    object cdsItensContribsVENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
    end
    object cdsItensContribsULT_STATUS: TStringField
      DisplayLabel = #218'ltimo Status'
      FieldName = 'ULT_STATUS'
      ReadOnly = True
      Size = 40
    end
    object cdsItensContribsDATAREPASSE: TDateField
      DisplayLabel = 'Data Repasse'
      FieldName = 'DATAREPASSE'
      ReadOnly = True
    end
    object cdsItensContribsUSER_REPASSE: TStringField
      DisplayLabel = 'Usu'#225'rio Repasse'
      FieldName = 'USER_REPASSE'
      ReadOnly = True
      Size = 15
    end
    object cdsItensContribsIDUSERDATAREPASSE: TIntegerField
      FieldName = 'IDUSERDATAREPASSE'
      ReadOnly = True
      Visible = False
    end
    object cdsItensContribsTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensContribsVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensContribsMULTA: TFMTBCDField
      DisplayLabel = 'Multa'
      FieldName = 'MULTA'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensContribsJUROS: TFMTBCDField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensContribsCORRECAO: TFMTBCDField
      DisplayLabel = 'Corre'#231#227'o'
      FieldName = 'CORRECAO'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensContribsDATAINCLUSAO: TDateField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      ReadOnly = True
    end
    object cdsItensContribsUSER_INCLUSAO: TStringField
      DisplayLabel = 'Usu'#225'rio Inclus'#227'o'
      FieldName = 'USER_INCLUSAO'
      ReadOnly = True
      Size = 15
    end
    object cdsItensContribsIDUSERINCLUSAO: TIntegerField
      FieldName = 'IDUSERINCLUSAO'
      ReadOnly = True
      Visible = False
    end
    object cdsItensContribsDATAATUALIZACAO: TDateField
      DisplayLabel = 'Data '#218'ltima Atualiza'#231#227'o'
      FieldName = 'DATAATUALIZACAO'
      ReadOnly = True
    end
    object cdsItensContribsUSER_ALTERACAO: TStringField
      DisplayLabel = 'Usu'#225'rio Atualiza'#231#227'o'
      FieldName = 'USER_ALTERACAO'
      ReadOnly = True
      Size = 15
    end
    object cdsItensContribsIDUSERATUALIZACAO: TIntegerField
      FieldName = 'IDUSERATUALIZACAO'
      ReadOnly = True
      Visible = False
    end
    object cdsItensContribsIDLOTEITEMCONTRIB: TIntegerField
      FieldName = 'IDLOTEITEMCONTRIB'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsItensContribsANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
      ReadOnly = True
      Visible = False
    end
    object cdsItensContribsIDLOTEITEM: TIntegerField
      FieldName = 'IDLOTEITEM'
      ReadOnly = True
    end
  end
  object sqlContribs: TSQLClientDataSet
    CommandText = 
      ' '#13#10' select c.ano,'#13#10'        c.vencimento,'#13#10'        (select first ' +
      '1 t.desccontribtpstatus from lotecontribstatus s inner join lote' +
      'contribtpstatus t on t.idlotecontribtpstatus = s.idlotecontribtp' +
      'status'#13#10'        where s.idloteitemcontrib = c.idloteitemcontrib ' +
      'order by c.datainclusao desc, c.idloteitemcontrib ) Ult_Status,'#13 +
      #10'        c.datarepasse,ur.login user_repasse, c.iduserdatarepass' +
      'e,'#13#10'        c.total,c.valor, c.multa, c.juros, c.correcao,'#13#10'    ' +
      '    c.datainclusao, ui.login user_inclusao, c.iduserinclusao,'#13#10' ' +
      '       c.dataatualizacao,ua.login user_alteracao, c.iduseratuali' +
      'zacao,'#13#10'        c.idloteitemcontrib, c.anuid_id, case when(selec' +
      't an.tp_contrib_id from anuidade an where an.anuid_id = c.anuid_' +
      'id )=1 then '#39'Sind.'#39' else '#39'Conf'#39' end Tpcontrib'#13#10' from loteitensco' +
      'ntribs c'#13#10' inner join ucusuario ui on ui.iduser = c.iduserinclus' +
      'ao'#13#10' inner join ucusuario ua on ua.iduser = c.iduseratualizacao'#13 +
      #10' left join ucusuario ur on ur.iduser = c.iduserdatarepasse'#13#10' wh' +
      'ere c.idloteitem = :IDLOTEITEM'#13#10' order by c.ano, c.vencimento'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'IDLOTEITEM'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 432
    Top = 304
    object sqlContribsANO: TIntegerField
      FieldName = 'ANO'
    end
    object sqlContribsVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqlContribsULT_STATUS: TStringField
      FieldName = 'ULT_STATUS'
      ReadOnly = True
      Size = 40
    end
    object sqlContribsDATAREPASSE: TDateField
      FieldName = 'DATAREPASSE'
      ReadOnly = True
    end
    object sqlContribsUSER_REPASSE: TStringField
      FieldName = 'USER_REPASSE'
      ReadOnly = True
      Size = 15
    end
    object sqlContribsIDUSERDATAREPASSE: TIntegerField
      FieldName = 'IDUSERDATAREPASSE'
      ReadOnly = True
    end
    object sqlContribsTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sqlContribsVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sqlContribsMULTA: TFMTBCDField
      FieldName = 'MULTA'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sqlContribsJUROS: TFMTBCDField
      FieldName = 'JUROS'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sqlContribsCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sqlContribsDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
      ReadOnly = True
    end
    object sqlContribsUSER_INCLUSAO: TStringField
      FieldName = 'USER_INCLUSAO'
      ReadOnly = True
      Size = 15
    end
    object sqlContribsIDUSERINCLUSAO: TIntegerField
      FieldName = 'IDUSERINCLUSAO'
      ReadOnly = True
    end
    object sqlContribsDATAATUALIZACAO: TDateField
      FieldName = 'DATAATUALIZACAO'
      ReadOnly = True
    end
    object sqlContribsUSER_ALTERACAO: TStringField
      FieldName = 'USER_ALTERACAO'
      ReadOnly = True
      Size = 15
    end
    object sqlContribsIDUSERATUALIZACAO: TIntegerField
      FieldName = 'IDUSERATUALIZACAO'
      ReadOnly = True
    end
    object sqlContribsIDLOTEITEMCONTRIB: TIntegerField
      FieldName = 'IDLOTEITEMCONTRIB'
      ReadOnly = True
      Required = True
    end
    object sqlContribsANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
      ReadOnly = True
    end
    object sqlContribsTPCONTRIB: TStringField
      FieldName = 'TPCONTRIB'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
  end
  object sdsItens: TSQLClientDataSet
    CommandText = 
      'select ass_id, idloteitem, registro, nome, tp_pessoa, ult_status' +
      ', cpfcnpj, totalvalor, anos, emp_id, sindicato, email, notificac' +
      'ao'#13#10'    from proc_lote_itens(:idlote)'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'idlote'
        ParamType = ptInput
      end>
    AfterScroll = sdsItensAfterScroll
    DBConnection = DMConexao.SQLConexao
    Left = 400
    Top = 216
    object sdsItensIDLOTEITEM: TIntegerField
      FieldName = 'IDLOTEITEM'
      Required = True
    end
    object sdsItensREGISTRO: TStringField
      FieldName = 'REGISTRO'
      ReadOnly = True
      Size = 41
    end
    object sdsItensNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object sdsItensTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object sdsItensULT_STATUS: TStringField
      FieldName = 'ULT_STATUS'
      ReadOnly = True
      Size = 40
    end
    object sdsItensASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object sdsItensCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      ReadOnly = True
    end
    object sdsItensTOTALVALOR: TFMTBCDField
      FieldName = 'TOTALVALOR'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsItensANOS: TStringField
      FieldName = 'ANOS'
      ReadOnly = True
      Size = 50
    end
    object sdsItensEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      ReadOnly = True
    end
    object sdsItensSINDICATO: TStringField
      FieldName = 'SINDICATO'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object sdsItensEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object sdsItensNOTIFICACAO: TStringField
      FieldName = 'NOTIFICACAO'
      Size = 100
    end
  end
  object SDSNUMLOTE: TSQLClientDataSet
    CommandText = 
      'SELECT cast(udf_padl(GEN_ID(GEN_NUMLOTE,0)+1,'#39'0'#39',4) as varchar(4' +
      ')) NUMLOTE FROM RDB$DATABASE'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 472
    Top = 312
    object SDSNUMLOTENUMLOTE: TStringField
      FieldName = 'NUMLOTE'
      ReadOnly = True
      FixedChar = True
      Size = 254
    end
  end
  object sdsLotesRepasse: TSQLClientDataSet
    CommandText = 
      'select bol_id, ass_id, nossonumero, dt_recebimento, dt_credito, ' +
      'valor_recebimento, desconto_pagto, tp_contrib_descricao, forma_p' +
      'agto, encargos_pago, anuid_id, ano, valorarepassar, datarepasse,' +
      ' valorrepassado, vencimento, dt_baixa, parc_id, idlote, registro' +
      ', nome, sindicato, totvalor'#13#10'     from proc_pagtos_lotes(:datain' +
      'i, :datafim, :tipo)'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
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
        Name = 'tipo'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 680
    Top = 312
    object sdsLotesRepasseBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object sdsLotesRepasseASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object sdsLotesRepasseNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object sdsLotesRepasseDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
    end
    object sdsLotesRepasseDT_CREDITO: TDateField
      FieldName = 'DT_CREDITO'
    end
    object sdsLotesRepasseVALOR_RECEBIMENTO: TFMTBCDField
      FieldName = 'VALOR_RECEBIMENTO'
      Precision = 18
      Size = 2
    end
    object sdsLotesRepasseDESCONTO_PAGTO: TFMTBCDField
      FieldName = 'DESCONTO_PAGTO'
      Precision = 18
      Size = 2
    end
    object sdsLotesRepasseTP_CONTRIB_DESCRICAO: TStringField
      FieldName = 'TP_CONTRIB_DESCRICAO'
      Size = 50
    end
    object sdsLotesRepasseFORMA_PAGTO: TStringField
      FieldName = 'FORMA_PAGTO'
      Size = 50
    end
    object sdsLotesRepasseENCARGOS_PAGO: TFMTBCDField
      FieldName = 'ENCARGOS_PAGO'
      Precision = 18
      Size = 2
    end
    object sdsLotesRepasseANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
    end
    object sdsLotesRepasseANO: TIntegerField
      FieldName = 'ANO'
    end
    object sdsLotesRepasseVALORAREPASSAR: TFMTBCDField
      FieldName = 'VALORAREPASSAR'
      Precision = 18
      Size = 2
    end
    object sdsLotesRepasseDATAREPASSE: TDateField
      FieldName = 'DATAREPASSE'
    end
    object sdsLotesRepasseVALORREPASSADO: TFMTBCDField
      FieldName = 'VALORREPASSADO'
      Precision = 18
      Size = 2
    end
    object sdsLotesRepasseVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sdsLotesRepasseDT_BAIXA: TDateField
      FieldName = 'DT_BAIXA'
    end
    object sdsLotesRepassePARC_ID: TIntegerField
      FieldName = 'PARC_ID'
    end
    object sdsLotesRepasseIDLOTE: TIntegerField
      FieldName = 'IDLOTE'
    end
    object sdsLotesRepasseREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sdsLotesRepasseNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsLotesRepasseSINDICATO: TStringField
      FieldName = 'SINDICATO'
      Size = 30
    end
    object sdsLotesRepasseTOTVALOR: TFMTBCDField
      FieldName = 'TOTVALOR'
      Precision = 18
      Size = 2
    end
  end
end
