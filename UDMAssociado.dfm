object DMAssociado: TDMAssociado
  OldCreateOrder = False
  Left = 605
  Top = 231
  Height = 728
  Width = 998
  object sdsAssoc: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select *'#13#10' from associado a'#13#10' where a.ass_id = :ass_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 40
    Top = 34
  end
  object dspAssoc: TDataSetProvider
    DataSet = sdsAssoc
    Constraints = True
    Left = 64
    Top = 53
  end
  object cdsAssoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspAssoc'
    AfterOpen = cdsAssocAfterOpen
    Left = 80
    Top = 72
    object cdsAssocASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsAssocTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsAssocTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
      Required = True
    end
    object cdsAssocESTCIVIL_ID: TIntegerField
      FieldName = 'ESTCIVIL_ID'
    end
    object cdsAssocREGISTRO: TStringField
      FieldName = 'REGISTRO'
      EditMask = '9999999/9999;0;_'
    end
    object cdsAssocDT_REGISTRO: TDateField
      FieldName = 'DT_REGISTRO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsAssocREPRESENTACAO: TStringField
      FieldName = 'REPRESENTACAO'
      FixedChar = True
      Size = 1
    end
    object cdsAssocCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsAssocIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsAssocIDENT_DTEMISSAO: TDateField
      FieldName = 'IDENT_DTEMISSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsAssocIDENT_OE: TStringField
      FieldName = 'IDENT_OE'
      Size = 30
    end
    object cdsAssocNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsAssocDATANASC: TDateField
      FieldName = 'DATANASC'
      EditMask = '99/99/9999;1;_'
    end
    object cdsAssocNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 40
    end
    object cdsAssocNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 40
    end
    object cdsAssocNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 100
    end
    object cdsAssocNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 100
    end
    object cdsAssocDT_REGSOCIAL: TDateField
      FieldName = 'DT_REGSOCIAL'
      EditMask = '99/99/9999;1;_'
    end
    object cdsAssocPGTO_OUTSIND: TStringField
      FieldName = 'PGTO_OUTSIND'
      FixedChar = True
      Size = 1
    end
    object cdsAssocEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsAssocTITULOELEITOR: TStringField
      FieldName = 'TITULOELEITOR'
      Size = 30
    end
    object cdsAssocTITULOZONA: TStringField
      FieldName = 'TITULOZONA'
    end
    object cdsAssocTITULOSECAO: TStringField
      FieldName = 'TITULOSECAO'
    end
    object cdsAssocCARTMOTORISTA: TStringField
      FieldName = 'CARTMOTORISTA'
      Size = 30
    end
    object cdsAssocSEXO: TStringField
      FieldName = 'SEXO'
    end
  end
  object dsAssoc: TDataSource
    DataSet = cdsAssoc
    Left = 96
    Top = 96
  end
  object sdsTp_Pessoa: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select tp.tp_assoc_id, tp.tp_assoc_desc'#13#10'from tp_assoc tp'
    Params = <>
    Left = 112
    Top = 34
  end
  object dspTp_Pessoa: TDataSetProvider
    DataSet = sdsTp_Pessoa
    Constraints = True
    Left = 136
    Top = 53
  end
  object cdsTp_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTp_Pessoa'
    Left = 152
    Top = 72
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
    Left = 168
    Top = 96
  end
  object sdsEmp_Regiao: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select c.emp_id,  c.regiao'#13#10'from config c'
    Params = <>
    Left = 192
    Top = 34
  end
  object dspEmp_Regiao: TDataSetProvider
    DataSet = sdsEmp_Regiao
    Constraints = True
    Left = 216
    Top = 53
  end
  object cdsEmp_regiao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmp_Regiao'
    Left = 232
    Top = 72
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
    Left = 248
    Top = 96
  end
  object sdsNovoRegistro: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select udf_padl(cast((gen_id(GEN_REGISTRO,0)+1) as varchar(7)),'#39 +
      '0'#39',7) novoregistro from rdb$database'
    Params = <>
    Left = 584
    Top = 42
    object sdsNovoRegistroNOVOREGISTRO: TStringField
      FieldName = 'NOVOREGISTRO'
      FixedChar = True
      Size = 254
    end
  end
  object PROC_ASSOC_IU: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_STATUS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_ASSOC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTCIVIL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'REPRESENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPFCNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IDENT_DTEMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDENT_OE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATANASC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NACIONALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEMAE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_REGSOCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PGTO_OUTSIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TITULOELEITOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TITULOZONA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TITULOSECAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CARTMOTORISTA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'OPER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOC_IU'
    Left = 712
    Top = 42
  end
  object sdsEst_Civil: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select e.estcivil_id, e.estcivil_desc'#13#10'from estadocivil e'#13#10'order' +
      ' by 1'
    Params = <>
    Left = 264
    Top = 34
  end
  object dspEst_Civil: TDataSetProvider
    DataSet = sdsEst_Civil
    Constraints = True
    Left = 288
    Top = 61
  end
  object cdsEst_Civil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEst_Civil'
    Left = 304
    Top = 72
    object cdsEst_CivilESTCIVIL_ID: TIntegerField
      FieldName = 'ESTCIVIL_ID'
      Required = True
    end
    object cdsEst_CivilESTCIVIL_DESC: TStringField
      FieldName = 'ESTCIVIL_DESC'
      Size = 40
    end
  end
  object dsEst_Civil: TDataSource
    DataSet = cdsEst_Civil
    Left = 320
    Top = 96
  end
  object sdsTp_Status: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select s.tp_status_id, s.tp_status_descr'#13#10'from tp_status s'
    Params = <>
    Left = 336
    Top = 34
  end
  object dspTp_Status: TDataSetProvider
    DataSet = sdsTp_Status
    Constraints = True
    Left = 360
    Top = 53
  end
  object cdsTp_Status: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTp_Status'
    Left = 376
    Top = 72
    object cdsTp_StatusTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsTp_StatusTP_STATUS_DESCR: TStringField
      FieldName = 'TP_STATUS_DESCR'
    end
  end
  object dsTp_Status: TDataSource
    DataSet = cdsTp_Status
    Left = 392
    Top = 96
  end
  object sdsRepresentacao: TSQLClientDataSet
    CommandText = 
      'select '#39'S'#39' cod,'#39'Sim'#39' descr from rdb$database'#13#10'union'#13#10'select '#39'N'#39' ' +
      'cod,'#39'N'#227'o'#39' descr from rdb$database'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 424
    Top = 34
  end
  object dspRepresentacao: TDataSetProvider
    DataSet = sdsRepresentacao
    Constraints = True
    Left = 448
    Top = 61
  end
  object cdsRepresentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRepresentacao'
    Left = 464
    Top = 72
    object cdsRepresentacaoCOD: TStringField
      FieldName = 'COD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsRepresentacaoDESCR: TStringField
      FieldName = 'DESCR'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dsRepresentacao: TDataSource
    DataSet = cdsRepresentacao
    Left = 480
    Top = 96
  end
  object sdsLocAssoc: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select * '#13#10'from PROC_ASSOC_LOC_ATUAL(:registro, :nome, :cpfcnpj,' +
      ' :guia, :email) a'
    Params = <
      item
        DataType = ftString
        Name = 'registro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cpfcnpj'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'guia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end>
    Left = 44
    Top = 154
  end
  object dspLocAssoc: TDataSetProvider
    DataSet = sdsLocAssoc
    Constraints = True
    Left = 60
    Top = 177
  end
  object cdsLocAssoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'registro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cpfcnpj'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'guia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocAssoc'
    Left = 76
    Top = 191
    object cdsLocAssocREGASSOC: TStringField
      FieldName = 'REGASSOC'
    end
    object cdsLocAssocNOMEASSOC: TStringField
      FieldName = 'NOMEASSOC'
      Size = 100
    end
    object cdsLocAssocCPFCNPJASSOC: TStringField
      FieldName = 'CPFCNPJASSOC'
    end
    object cdsLocAssocTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
      Size = 30
    end
    object cdsLocAssocSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object cdsLocAssocASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsLocAssocREGIAO: TStringField
      FieldName = 'REGIAO'
      Size = 50
    end
  end
  object dsLocAssoc: TDataSource
    DataSet = cdsLocAssoc
    Left = 92
    Top = 216
  end
  object sdsFoto: TSQLDataSet
    SQLConnection = DMConexao.SQLConexaoImg
    CommandText = 
      'select i.ass_id, i.tp_doc, i.imagem, i.descricao, i.img_id, i.da' +
      'ta_inclusao'#13#10'from img i'#13#10'where i.ass_id = :ass_id and i.tp_doc=1'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 104
    Top = 154
  end
  object dspFoto: TDataSetProvider
    DataSet = sdsFoto
    Constraints = True
    Left = 120
    Top = 177
  end
  object cdsFoto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspFoto'
    Left = 136
    Top = 191
    object cdsFotoASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsFotoTP_DOC: TIntegerField
      FieldName = 'TP_DOC'
    end
    object cdsFotoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 1
    end
    object cdsFotoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsFotoIMG_ID: TIntegerField
      FieldName = 'IMG_ID'
      Required = True
    end
    object cdsFotoDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
    end
  end
  object dsFoto: TDataSource
    DataSet = cdsFoto
    Left = 152
    Top = 216
  end
  object PROC_FOTO_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexaoImg
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'IMAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_INCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IMG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEARQUIVO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_FOTO_UI'
    Left = 712
    Top = 111
  end
  object PROC_OBS_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'OBS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS_DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_OBS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USER_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_OBS_UI'
    Left = 712
    Top = 173
  end
  object sdsObs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select o.obs_id, o.obs_descricao, o.ass_id, o.dt_obs, o.user_id,' +
      ' o.hora, u.login'#13#10'from observacao o'#13#10'inner join ucusuario u on u' +
      '.iduser = o.user_id'#13#10'where o.ass_id = :ass_id'#13#10'order by o.dt_obs' +
      ' desc,  o.hora desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 152
    Top = 154
  end
  object dsObs: TDataSource
    DataSet = cdsObs
    Left = 200
    Top = 216
  end
  object dspObs: TDataSetProvider
    DataSet = sdsObs
    Constraints = True
    Left = 168
    Top = 169
  end
  object cdsObs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspObs'
    Left = 184
    Top = 191
    object cdsObsOBS_ID: TIntegerField
      FieldName = 'OBS_ID'
      Required = True
    end
    object cdsObsOBS_DESCRICAO: TStringField
      FieldName = 'OBS_DESCRICAO'
      Size = 600
    end
    object cdsObsASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsObsDT_OBS: TDateField
      FieldName = 'DT_OBS'
    end
    object cdsObsUSER_ID: TIntegerField
      FieldName = 'USER_ID'
    end
    object cdsObsHORA: TStringField
      FieldName = 'HORA'
      Size = 5
    end
    object cdsObsLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
  end
  object PROC_OBS_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'OBS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_OBS_DEL'
    Left = 728
    Top = 187
  end
  object PROC_ENDER_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'END_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'END_LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'END_NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'END_COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'END_BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'END_CEP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIDADE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_ENDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'END_CORRESP'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'END_CORRESP_DEV'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ENDER_UI'
    Left = 712
    Top = 240
  end
  object PROC_ENDER_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'END_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ENDER_DEL'
    Left = 728
    Top = 254
  end
  object sdsEnder: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select *'#13#10'from endereco e'#13#10'where e.end_id = :end_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'end_id'
        ParamType = ptInput
      end>
    Left = 205
    Top = 154
  end
  object dspEnder: TDataSetProvider
    DataSet = sdsEnder
    Constraints = True
    Left = 221
    Top = 177
  end
  object cdsEnder: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'end_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspEnder'
    Left = 237
    Top = 191
    object cdsEnderEND_ID: TIntegerField
      FieldName = 'END_ID'
      Required = True
    end
    object cdsEnderASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsEnderEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsEnderEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsEnderEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsEnderEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsEnderEND_CEP: TStringField
      FieldName = 'END_CEP'
      EditMask = '99.999-999;0;_'
      Size = 8
    end
    object cdsEnderCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object cdsEnderTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
      Required = True
    end
    object cdsEnderEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsEnderEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
  end
  object dsEnder: TDataSource
    DataSet = cdsEnder
    Left = 253
    Top = 216
  end
  object sdsLocEnder: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select e.end_id, e.ass_id, e.end_logradouro, e.end_numero, e.end' +
      '_complemento, e.end_bairro, e.end_cep, e.cidade_id, e.tp_ender_i' +
      'd, case when e.end_corresp=1 then '#39'Sim'#39' else '#39'N'#227'o'#39' end end_corre' +
      'sp , case when e.end_corresp_dev=1 then '#39'Sim'#39' else '#39'N'#227'o'#39' end end' +
      '_corresp_dev , c.cidade_nome, es.estado_sigla, t.tp_ender_descr'#13 +
      #10'from endereco e'#13#10'left join cidade c on c.cidade_id = e.cidade_i' +
      'd'#13#10'left join estado es on es.estado_id = c.estado_id'#13#10'inner join' +
      ' tp_endereco t on t.tp_ender_id = e.tp_ender_id'#13#10'where e.ass_id ' +
      '= :ass_id'#13#10'order by e.end_corresp desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 261
    Top = 154
  end
  object dspLocEnder: TDataSetProvider
    DataSet = sdsLocEnder
    Constraints = True
    Left = 277
    Top = 177
  end
  object cdsLocEnder: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocEnder'
    Left = 293
    Top = 191
    object cdsLocEnderEND_ID: TIntegerField
      FieldName = 'END_ID'
      Required = True
    end
    object cdsLocEnderASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsLocEnderEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsLocEnderEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsLocEnderEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsLocEnderEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsLocEnderEND_CEP: TStringField
      FieldName = 'END_CEP'
      EditMask = '99.999-999;0;_'
      Size = 8
    end
    object cdsLocEnderCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object cdsLocEnderTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
      Required = True
    end
    object cdsLocEnderEND_CORRESP: TStringField
      FieldName = 'END_CORRESP'
      FixedChar = True
      Size = 3
    end
    object cdsLocEnderEND_CORRESP_DEV: TStringField
      FieldName = 'END_CORRESP_DEV'
      FixedChar = True
      Size = 3
    end
    object cdsLocEnderCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsLocEnderESTADO_SIGLA: TStringField
      FieldName = 'ESTADO_SIGLA'
      Size = 2
    end
    object cdsLocEnderTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
  end
  object dsLocEnder: TDataSource
    DataSet = cdsLocEnder
    Left = 309
    Top = 216
  end
  object sdsContato: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.contato, c.ass_id, c.tp_contato, c.tp_status_id, c.cont' +
      'ato_obs, c.contato_descr'#13#10'from contato c'#13#10'where c.contato = :con' +
      'tato_id'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'contato_id'
        ParamType = ptInput
      end>
    Left = 325
    Top = 154
  end
  object dspContato: TDataSetProvider
    DataSet = sdsContato
    Constraints = True
    Left = 341
    Top = 177
  end
  object dsContato: TDataSource
    DataSet = cdsContato
    Left = 373
    Top = 216
  end
  object cdsContato: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'contato_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspContato'
    Left = 357
    Top = 191
    object cdsContatoCONTATO: TIntegerField
      FieldName = 'CONTATO'
      Required = True
    end
    object cdsContatoASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsContatoTP_CONTATO: TIntegerField
      FieldName = 'TP_CONTATO'
    end
    object cdsContatoTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsContatoCONTATO_OBS: TStringField
      FieldName = 'CONTATO_OBS'
      Size = 100
    end
    object cdsContatoCONTATO_DESCR: TStringField
      FieldName = 'CONTATO_DESCR'
      Size = 80
    end
  end
  object sdsLocContato: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.contato,c.contato_descr, c.ass_id, c.tp_contato, c.tp_s' +
      'tatus_id , t.tp_contato_desc,c.contato_obs, s.tp_status_descr'#13#10'f' +
      'rom contato c'#13#10'inner join tp_contato t on t.tp_contato = c.tp_co' +
      'ntato'#13#10'inner join tp_status s on s.tp_status_id = c.tp_status_id' +
      #13#10'where c.ass_id = :ass_id'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 394
    Top = 154
  end
  object dspLocContato: TDataSetProvider
    DataSet = sdsLocContato
    Constraints = True
    Left = 410
    Top = 177
  end
  object dsLocContato: TDataSource
    DataSet = cdsLocContato
    Left = 442
    Top = 216
  end
  object cdsLocContato: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocContato'
    Left = 426
    Top = 191
    object cdsLocContatoCONTATO: TIntegerField
      FieldName = 'CONTATO'
      Required = True
    end
    object cdsLocContatoASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsLocContatoTP_CONTATO: TIntegerField
      FieldName = 'TP_CONTATO'
    end
    object cdsLocContatoTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsLocContatoTP_CONTATO_DESC: TStringField
      FieldName = 'TP_CONTATO_DESC'
      Size = 40
    end
    object cdsLocContatoCONTATO_OBS: TStringField
      FieldName = 'CONTATO_OBS'
      Size = 100
    end
    object cdsLocContatoTP_STATUS_DESCR: TStringField
      FieldName = 'TP_STATUS_DESCR'
    end
    object cdsLocContatoCONTATO_DESCR: TStringField
      FieldName = 'CONTATO_DESCR'
      Size = 80
    end
  end
  object PROC_CONTATO_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_STATUS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO_OBS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO_DESCR'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CONTATO_UI'
    Left = 816
    Top = 204
  end
  object PROC_CONTATO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTATO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CONTATO_DEL'
    Left = 832
    Top = 218
  end
  object sdsLocCorresp: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.corresp_id, c.ass_id, c.tp_corresp_id, t.tp_corresp_des' +
      'cr, c.dt_criacao, c.dt_envio, c.sit_corresp_id,s.sit_corresp_des' +
      'c, c.dt_sit_corresp'#13#10'from correspondencia c'#13#10'inner join tp_corre' +
      'spondencia t on t.tp_corresp_id = c.tp_corresp_id'#13#10'inner join si' +
      'tuacao_corresp s on s.sit_corresp_id = c.sit_corresp_id'#13#10'where c' +
      '.ass_id = :ass_id'#13#10'order by c.dt_envio desc'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 546
    Top = 154
  end
  object dspLocCorresp: TDataSetProvider
    DataSet = sdsLocCorresp
    Constraints = True
    Left = 562
    Top = 177
  end
  object dsLocCorresp: TDataSource
    DataSet = cdsLocCorresp
    Left = 594
    Top = 216
  end
  object cdsLocCorresp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocCorresp'
    Left = 578
    Top = 191
    object cdsLocCorrespCORRESP_ID: TIntegerField
      FieldName = 'CORRESP_ID'
      Required = True
    end
    object cdsLocCorrespASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsLocCorrespTP_CORRESP_ID: TIntegerField
      FieldName = 'TP_CORRESP_ID'
      Required = True
    end
    object cdsLocCorrespTP_CORRESP_DESCR: TStringField
      FieldName = 'TP_CORRESP_DESCR'
      Size = 50
    end
    object cdsLocCorrespDT_CRIACAO: TDateField
      FieldName = 'DT_CRIACAO'
    end
    object cdsLocCorrespDT_ENVIO: TDateField
      FieldName = 'DT_ENVIO'
    end
    object cdsLocCorrespSIT_CORRESP_ID: TIntegerField
      FieldName = 'SIT_CORRESP_ID'
      Required = True
    end
    object cdsLocCorrespSIT_CORRESP_DESC: TStringField
      FieldName = 'SIT_CORRESP_DESC'
      Size = 30
    end
    object cdsLocCorrespDT_SIT_CORRESP: TDateField
      FieldName = 'DT_SIT_CORRESP'
    end
  end
  object sdsCorresp: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.corresp_id, c.ass_id, c.tp_corresp_id, c.dt_criacao, c.' +
      'dt_envio, c.sit_corresp_id, c.dt_sit_corresp'#13#10'from correspondenc' +
      'ia c'#13#10'where c.corresp_id = :corresp_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'corresp_id'
        ParamType = ptInput
      end>
    Left = 474
    Top = 154
  end
  object dspCorresp: TDataSetProvider
    DataSet = sdsCorresp
    Constraints = True
    Left = 490
    Top = 177
  end
  object dsCorresp: TDataSource
    DataSet = cdsCorresp
    Left = 522
    Top = 216
  end
  object cdsCorresp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'corresp_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspCorresp'
    Left = 506
    Top = 191
    object cdsCorrespCORRESP_ID: TIntegerField
      FieldName = 'CORRESP_ID'
      Required = True
    end
    object cdsCorrespASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsCorrespTP_CORRESP_ID: TIntegerField
      FieldName = 'TP_CORRESP_ID'
      Required = True
    end
    object cdsCorrespDT_CRIACAO: TDateField
      FieldName = 'DT_CRIACAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCorrespDT_ENVIO: TDateField
      FieldName = 'DT_ENVIO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCorrespSIT_CORRESP_ID: TIntegerField
      FieldName = 'SIT_CORRESP_ID'
      Required = True
    end
    object cdsCorrespDT_SIT_CORRESP: TDateField
      FieldName = 'DT_SIT_CORRESP'
      EditMask = '99/99/9999;1;_'
    end
  end
  object PROC_CORRESP_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CORRESP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_CORRESP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SIT_CORRESP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_SIT_CORRESP'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CORRESP_UI'
    Left = 728
    Top = 402
  end
  object PROC_CORRESP_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CORRESP_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CORRESP_DEL'
    Left = 744
    Top = 418
  end
  object sdsLocRelacion: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select r.rel_id, r.tp_rel_id, r.tp_rel_descricao, r.tp_status_id' +
      ', r.dt_inclusao, r.dt_cancelado, r.ass_idpai, r.ass_idfilho, r.r' +
      'egistro, r.nome, r.nomesocio, r.cpfsocio, r.descstatus, r.canc'#13#10 +
      'from proc_relac(:ass_id) r'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 52
    Top = 274
  end
  object dspLocRelacion: TDataSetProvider
    DataSet = sdsLocRelacion
    Constraints = True
    Left = 60
    Top = 297
  end
  object dsLocRelacion: TDataSource
    DataSet = cdsLocRelacion
    Left = 84
    Top = 336
  end
  object cdsLocRelacion: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocRelacion'
    Left = 76
    Top = 319
    object cdsLocRelacionREL_ID: TIntegerField
      FieldName = 'REL_ID'
    end
    object cdsLocRelacionTP_REL_ID: TIntegerField
      FieldName = 'TP_REL_ID'
    end
    object cdsLocRelacionTP_REL_DESCRICAO: TStringField
      FieldName = 'TP_REL_DESCRICAO'
      Size = 30
    end
    object cdsLocRelacionTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
    end
    object cdsLocRelacionDT_INCLUSAO: TDateField
      FieldName = 'DT_INCLUSAO'
    end
    object cdsLocRelacionDT_CANCELADO: TDateField
      FieldName = 'DT_CANCELADO'
    end
    object cdsLocRelacionASS_IDPAI: TIntegerField
      FieldName = 'ASS_IDPAI'
    end
    object cdsLocRelacionASS_IDFILHO: TIntegerField
      FieldName = 'ASS_IDFILHO'
    end
    object cdsLocRelacionREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsLocRelacionNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocRelacionNOMESOCIO: TStringField
      FieldName = 'NOMESOCIO'
      Size = 100
    end
    object cdsLocRelacionCPFSOCIO: TStringField
      FieldName = 'CPFSOCIO'
    end
    object cdsLocRelacionDESCSTATUS: TStringField
      FieldName = 'DESCSTATUS'
    end
    object cdsLocRelacionCANC: TIntegerField
      FieldName = 'CANC'
    end
  end
  object sdsRelac: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select r.rel_id, r.tp_rel_id, r.tp_status_id, r.dt_inclusao, r.d' +
      't_cancelado, r.ass_idpai, r.ass_idfilho, r.nomesocio, r.cpfsocio' +
      #13#10' from relacionamento r'#13#10' where r.rel_id = :rel_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'rel_id'
        ParamType = ptInput
      end>
    Left = 136
    Top = 274
  end
  object dspRelac: TDataSetProvider
    DataSet = sdsRelac
    Constraints = True
    Left = 144
    Top = 298
  end
  object cdsRelac: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'rel_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelac'
    Left = 160
    Top = 322
    object cdsRelacREL_ID: TIntegerField
      FieldName = 'REL_ID'
      Required = True
    end
    object cdsRelacTP_REL_ID: TIntegerField
      FieldName = 'TP_REL_ID'
      Required = True
    end
    object cdsRelacTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsRelacDT_INCLUSAO: TDateField
      FieldName = 'DT_INCLUSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsRelacDT_CANCELADO: TDateField
      FieldName = 'DT_CANCELADO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsRelacASS_IDPAI: TIntegerField
      FieldName = 'ASS_IDPAI'
      Required = True
    end
    object cdsRelacASS_IDFILHO: TIntegerField
      FieldName = 'ASS_IDFILHO'
    end
    object cdsRelacNOMESOCIO: TStringField
      FieldName = 'NOMESOCIO'
      Size = 100
    end
    object cdsRelacCPFSOCIO: TStringField
      FieldName = 'CPFSOCIO'
    end
  end
  object dsRelac: TDataSource
    DataSet = cdsRelac
    Left = 176
    Top = 338
  end
  object PROC_RELACION_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'REL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_REL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_STATUS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_IDPAI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_IDFILHO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMESOCIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPFSOCIO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_RELACION_UI'
    Left = 816
    Top = 42
  end
  object PROC_RELACION_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'REL_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_RELACION_DEL'
    Left = 832
    Top = 58
  end
  object PROC_CAPSOCIAL_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CAPSOCIAL_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CAPSOCIAL_DEL'
    Left = 816
    Top = 114
  end
  object PROC_CAPSOCIAL_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'CAPSOCIAL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CADASTRO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CAPSOCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CAPSOCIAL_UI'
    Left = 832
    Top = 130
  end
  object sdsLocCapSocial: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.capsocial_id, c.ass_id, c.dt_cadastro, c.dt_capsocial, ' +
      'c.valor'#13#10'from capsocial c'#13#10'where c.ass_id = :ass_id'#13#10'order by c.' +
      'dt_capsocial desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 204
    Top = 274
  end
  object dspLocCapSocial: TDataSetProvider
    DataSet = sdsLocCapSocial
    Constraints = True
    Left = 212
    Top = 297
  end
  object dsLocCapSocial: TDataSource
    DataSet = cdsLocCapSocial
    Left = 236
    Top = 336
  end
  object cdsLocCapSocial: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocCapSocial'
    Left = 228
    Top = 319
    object cdsLocCapSocialCAPSOCIAL_ID: TIntegerField
      FieldName = 'CAPSOCIAL_ID'
      Required = True
    end
    object cdsLocCapSocialASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsLocCapSocialDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocCapSocialDT_CAPSOCIAL: TDateField
      FieldName = 'DT_CAPSOCIAL'
    end
    object cdsLocCapSocialVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
  end
  object sdsCapSocial: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select c.capsocial_id, c.ass_id, c.dt_cadastro, c.dt_capsocial, ' +
      'c.valor'#13#10'from capsocial c'#13#10'where c.capsocial_id = :Cap_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'Cap_id'
        ParamType = ptInput
      end>
    Left = 296
    Top = 274
  end
  object dspCapSocial: TDataSetProvider
    DataSet = sdsCapSocial
    Constraints = True
    Left = 304
    Top = 298
  end
  object cdsCapSocial: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'Cap_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspCapSocial'
    Left = 320
    Top = 322
    object cdsCapSocialCAPSOCIAL_ID: TIntegerField
      FieldName = 'CAPSOCIAL_ID'
      Required = True
    end
    object cdsCapSocialASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsCapSocialDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      EditMask = '99/99/9999'
    end
    object cdsCapSocialDT_CAPSOCIAL: TDateField
      FieldName = 'DT_CAPSOCIAL'
      EditMask = '99/99/9999'
    end
    object cdsCapSocialVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '.00'
      Precision = 15
      Size = 2
    end
  end
  object dsCapSocial: TDataSource
    DataSet = cdsCapSocial
    Left = 336
    Top = 338
  end
  object PROC_ASSOCSEGMENTO_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'SEGMENTO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOCSEGMENTO_I'
    Left = 712
    Top = 314
  end
  object PROC_ASSOCSEGMENTO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'SEGMENTO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOCSEGMENTO_DEL'
    Left = 728
    Top = 338
  end
  object sdsLocAssocSegs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select ase.segmento_id, s.descricao'#13#10'from assoc_segs ase'#13#10'inner ' +
      'join segmento s on s.segmento_id = ase.segmento_id'#13#10'where ase.as' +
      's_id = :ass_id'#13#10'order by 2'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 380
    Top = 274
  end
  object dspLocAssocSegs: TDataSetProvider
    DataSet = sdsLocAssocSegs
    Constraints = True
    Left = 388
    Top = 297
  end
  object dsLocAssocSegs: TDataSource
    DataSet = cdsLocAssocSegs
    Left = 412
    Top = 336
  end
  object cdsLocAssocSegs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocAssocSegs'
    Left = 404
    Top = 319
    object cdsLocAssocSegsSEGMENTO_ID: TIntegerField
      FieldName = 'SEGMENTO_ID'
      Required = True
    end
    object cdsLocAssocSegsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object sdsAssocSegs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select segmento_id, ass_id'#13#10'from assoc_segs'#13#10'where segmento_id =' +
      ' :segmento_id and ass_id = :ass_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'segmento_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 472
    Top = 274
  end
  object dspAssocSegs: TDataSetProvider
    DataSet = sdsAssocSegs
    Constraints = True
    Left = 480
    Top = 298
  end
  object cdsAssocSegs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'segmento_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspAssocSegs'
    Left = 496
    Top = 322
    object cdsAssocSegsSEGMENTO_ID: TIntegerField
      FieldName = 'SEGMENTO_ID'
      Required = True
    end
    object cdsAssocSegsASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
  end
  object dsAssocSegs: TDataSource
    DataSet = cdsAssocSegs
    Left = 512
    Top = 338
  end
  object sdsLocAssocSindic: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select o.ass_id, o.sindic_id,s.sindic_nome,o.observacao, o.ano'#13#10 +
      'from outros_sindicatos o'#13#10'inner join sindicatos s on s.sindic_id' +
      ' = o.sindic_id'#13#10'where o.ass_id=:ass_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 52
    Top = 402
  end
  object dspLocAssocSindic: TDataSetProvider
    DataSet = sdsLocAssocSindic
    Constraints = True
    Left = 60
    Top = 425
  end
  object cdsLocAssocSindic: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocAssocSindic'
    Left = 76
    Top = 447
    object cdsLocAssocSindicASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsLocAssocSindicSINDIC_ID: TIntegerField
      FieldName = 'SINDIC_ID'
      Required = True
    end
    object cdsLocAssocSindicSINDIC_NOME: TStringField
      FieldName = 'SINDIC_NOME'
    end
    object cdsLocAssocSindicOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsLocAssocSindicANO: TIntegerField
      FieldName = 'ANO'
    end
  end
  object sdsAssocSindic: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select o.ass_id, o.sindic_id, o.observacao, o.ano'#13#10'from outros_s' +
      'indicatos o where o.ass_id = :ass_id and o.sindic_id = :sindic_i' +
      'd'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sindic_id'
        ParamType = ptInput
      end>
    Left = 136
    Top = 402
  end
  object dspAssocSindic: TDataSetProvider
    DataSet = sdsAssocSindic
    Constraints = True
    Left = 144
    Top = 426
  end
  object cdsAssocSindic: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sindic_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspAssocSindic'
    Left = 160
    Top = 450
    object cdsAssocSindicASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Required = True
    end
    object cdsAssocSindicSINDIC_ID: TIntegerField
      FieldName = 'SINDIC_ID'
      Required = True
    end
    object cdsAssocSindicOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsAssocSindicANO: TIntegerField
      FieldName = 'ANO'
    end
  end
  object dsAssocSindic: TDataSource
    DataSet = cdsAssocSindic
    Left = 176
    Top = 466
  end
  object dsLocAssocSindic: TDataSource
    DataSet = cdsLocAssocSindic
    Left = 88
    Top = 466
  end
  object PROC_ASSOCSINDICATO_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SINDIC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOCSINDICATO_I'
    Left = 952
    Top = 288
  end
  object PROC_ASSOCSINDICATO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SINDIC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOCSINDICATO_DEL'
    Left = 968
    Top = 304
  end
  object PROC_SINDICATO_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftString
        Name = 'SINDIC_NOME'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_SINDICATO_I'
    Left = 952
    Top = 376
  end
  object sdsLocDocsEntreg: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select de.doc_id, de.tp_assoc_id, d.doc_descricao,'#13#10'case'#13#10'when (' +
      'select count(*) from docs_entregue den where den.ass_id = :ass_i' +
      'd and den.doc_id = de.doc_id)=1 then'#13#10#39'Sim'#39' else '#39'N'#227'o'#39' end Situa' +
      'cao'#13#10'from docs_a_entregar de'#13#10'inner join documentos d on d.doc_i' +
      'd = de.doc_id'#13#10'where de.tp_assoc_id=:tp_assoc'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_assoc'
        ParamType = ptInput
      end>
    Left = 224
    Top = 400
  end
  object dspLocDocsEntreg: TDataSetProvider
    DataSet = sdsLocDocsEntreg
    Constraints = True
    Left = 240
    Top = 424
  end
  object cdsLocDocsEntreg: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_assoc'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocDocsEntreg'
    Left = 256
    Top = 448
    object cdsLocDocsEntregDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
      Required = True
    end
    object cdsLocDocsEntregTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
      Required = True
    end
    object cdsLocDocsEntregDOC_DESCRICAO: TStringField
      FieldName = 'DOC_DESCRICAO'
      Size = 50
    end
    object cdsLocDocsEntregSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 3
    end
  end
  object dsLocDocsEntreg: TDataSource
    DataSet = cdsLocDocsEntreg
    Left = 272
    Top = 472
  end
  object PROC_DOCENTREGUE: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'DOC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'OPER'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_DOCENTREGUE'
    Left = 952
    Top = 48
  end
  object sdsLocAnexos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexaoImg
    CommandText = 
      'select i.ass_id, i.tp_doc, i.imagem, i.descricao, i.img_id, i.da' +
      'ta_inclusao, i.nomearquivo'#13#10'   from img i where i.ass_id = :ass_' +
      'id and i.tp_doc=2'#13#10'   order by i.img_id desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 320
    Top = 400
  end
  object dspLocAnexos: TDataSetProvider
    DataSet = sdsLocAnexos
    Constraints = True
    Left = 336
    Top = 424
  end
  object cdsLocAnexos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocAnexos'
    Left = 352
    Top = 448
    object cdsLocAnexosASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsLocAnexosTP_DOC: TIntegerField
      FieldName = 'TP_DOC'
    end
    object cdsLocAnexosIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 1
    end
    object cdsLocAnexosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsLocAnexosIMG_ID: TIntegerField
      FieldName = 'IMG_ID'
      Required = True
    end
    object cdsLocAnexosDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
    end
    object cdsLocAnexosNOMEARQUIVO: TStringField
      FieldName = 'NOMEARQUIVO'
      Size = 50
    end
  end
  object dsLocAnexos: TDataSource
    DataSet = cdsLocAnexos
    Left = 368
    Top = 472
  end
  object sdsAnexo: TSQLDataSet
    SQLConnection = DMConexao.SQLConexaoImg
    CommandText = 
      'select i.ass_id, i.tp_doc, i.imagem, i.descricao, i.img_id, i.da' +
      'ta_inclusao, i.nomearquivo'#13#10'  from img i where i.img_id = :img_i' +
      'd'
    Params = <
      item
        DataType = ftInteger
        Name = 'img_id'
        ParamType = ptInput
      end>
    Left = 408
    Top = 402
  end
  object dspAnexo: TDataSetProvider
    DataSet = sdsAnexo
    Constraints = True
    Left = 416
    Top = 426
  end
  object cdsAnexo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'img_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspAnexo'
    Left = 432
    Top = 450
    object cdsAnexoASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsAnexoTP_DOC: TIntegerField
      FieldName = 'TP_DOC'
    end
    object cdsAnexoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 1
    end
    object cdsAnexoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsAnexoIMG_ID: TIntegerField
      FieldName = 'IMG_ID'
      Required = True
    end
    object cdsAnexoDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsAnexoNOMEARQUIVO: TStringField
      FieldName = 'NOMEARQUIVO'
      Size = 50
    end
  end
  object dsAnexo: TDataSource
    DataSet = cdsAnexo
    Left = 448
    Top = 466
  end
  object PROC_IMG_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexaoImg
    Params = <
      item
        DataType = ftInteger
        Name = 'IMG_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_IMG_DEL'
    Left = 960
    Top = 104
  end
  object PROC_MOVIMENTO_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'MOV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_MOV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_MOV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS_MOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MOVIMENTO_UI'
    Left = 944
    Top = 184
  end
  object PROC_MOVIMENTO_DEL: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'MOV_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MOVIMENTO_DEL'
    Left = 960
    Top = 200
  end
  object sdsLocMoviment: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'SELECT m.mov_id, m.tp_mov_id,t.tp_mov_descricao,  m.ass_id, m.dt' +
      '_mov, m.obs_mov, m.userid,u.login, m.hora, m.datapedido'#13#10'FROM mo' +
      'vimentacao m INNER JOIN tp_movimento t ON t.tp_mov_id = m.tp_mov' +
      '_id'#13#10'inner join ucusuario u on u.iduser = m.userid'#13#10'WHERE m.ass_' +
      'id = :ass_id'#13#10'ORDER BY m.mov_id DESC'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 496
    Top = 400
  end
  object dspLocMoviment: TDataSetProvider
    DataSet = sdsLocMoviment
    Constraints = True
    Left = 512
    Top = 424
  end
  object cdsLocMoviment: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocMoviment'
    Left = 528
    Top = 448
    object cdsLocMovimentMOV_ID: TIntegerField
      FieldName = 'MOV_ID'
      Required = True
    end
    object cdsLocMovimentTP_MOV_ID: TIntegerField
      FieldName = 'TP_MOV_ID'
    end
    object cdsLocMovimentTP_MOV_DESCRICAO: TStringField
      FieldName = 'TP_MOV_DESCRICAO'
      Size = 40
    end
    object cdsLocMovimentASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsLocMovimentDT_MOV: TDateField
      FieldName = 'DT_MOV'
    end
    object cdsLocMovimentOBS_MOV: TStringField
      FieldName = 'OBS_MOV'
      Size = 400
    end
    object cdsLocMovimentUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsLocMovimentHORA: TStringField
      FieldName = 'HORA'
      Size = 5
    end
    object cdsLocMovimentLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object cdsLocMovimentDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
  end
  object dsLocMoviment: TDataSource
    DataSet = cdsLocMoviment
    Left = 544
    Top = 472
  end
  object sdsMoviment: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select m.mov_id, m.tp_mov_id, m.ass_id, m.dt_mov, m.obs_mov, m.u' +
      'serid, m.hora, M.DATAPEDIDO'#13#10'from movimentacao m where m.mov_id ' +
      '= :mov_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'mov_id'
        ParamType = ptInput
      end>
    Left = 48
    Top = 530
  end
  object dspMoviment: TDataSetProvider
    DataSet = sdsMoviment
    Constraints = True
    Left = 56
    Top = 546
  end
  object cdsMoviment: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'mov_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspMoviment'
    Left = 72
    Top = 570
    object cdsMovimentMOV_ID: TIntegerField
      FieldName = 'MOV_ID'
      Required = True
    end
    object cdsMovimentTP_MOV_ID: TIntegerField
      FieldName = 'TP_MOV_ID'
    end
    object cdsMovimentASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsMovimentDT_MOV: TDateField
      FieldName = 'DT_MOV'
      EditMask = '99/99/9999;1;_'
    end
    object cdsMovimentOBS_MOV: TStringField
      FieldName = 'OBS_MOV'
      Size = 400
    end
    object cdsMovimentUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsMovimentHORA: TStringField
      FieldName = 'HORA'
      EditMask = '99:99;1;_'
      Size = 5
    end
    object cdsMovimentDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
      EditMask = '99/99/9999;1;_'
    end
  end
  object dsMoviment: TDataSource
    DataSet = cdsMoviment
    Left = 88
    Top = 586
  end
  object SdsPegaCapSocial: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select FIRST 1 c.valor'#13#10'from capsocial c'#13#10'WHERE C.ass_id = :ASS_' +
      'ID'#13#10'AND c.dt_capsocial <= :VENCIMENTO'#13#10'AND c.dt_capsocial <= :da' +
      'taatual'#13#10'ORDER BY C.dt_capsocial DESC'
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 168
    Top = 536
  end
  object dspPegaCapSocial: TDataSetProvider
    DataSet = SdsPegaCapSocial
    Constraints = True
    Left = 184
    Top = 560
  end
  object cdsPegaCapSocial: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspPegaCapSocial'
    Left = 208
    Top = 584
    object cdsPegaCapSocialVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
  end
  object sdsEmpresa: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select * from config'#13#10'where emp_id=:emp_id'
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    Left = 592
    Top = 96
    object sdsEmpresaEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      Required = True
    end
    object sdsEmpresaNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 120
    end
    object sdsEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sdsEmpresaDOC_TIPOINSCRICAO: TStringField
      FieldName = 'DOC_TIPOINSCRICAO'
      Size = 40
    end
    object sdsEmpresaDOC_NUMINSCRICAO: TStringField
      FieldName = 'DOC_NUMINSCRICAO'
      Size = 30
    end
    object sdsEmpresaENDER_LOGRADOURO: TStringField
      FieldName = 'ENDER_LOGRADOURO'
      Size = 60
    end
    object sdsEmpresaENDER_NUMERO: TStringField
      FieldName = 'ENDER_NUMERO'
      Size = 10
    end
    object sdsEmpresaENDER_COMPLEMENTO: TStringField
      FieldName = 'ENDER_COMPLEMENTO'
      Size = 40
    end
    object sdsEmpresaENDER_BAIRRO: TStringField
      FieldName = 'ENDER_BAIRRO'
      Size = 40
    end
    object sdsEmpresaCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object sdsEmpresaENDER_CEP: TStringField
      FieldName = 'ENDER_CEP'
      Size = 8
    end
    object sdsEmpresaTEL1: TStringField
      FieldName = 'TEL1'
    end
    object sdsEmpresaTEL2: TStringField
      FieldName = 'TEL2'
    end
    object sdsEmpresaCEL: TStringField
      FieldName = 'CEL'
    end
    object sdsEmpresaFAX: TStringField
      FieldName = 'FAX'
    end
    object sdsEmpresaSITE: TStringField
      FieldName = 'SITE'
      Size = 100
    end
    object sdsEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object sdsEmpresaREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object sdsEmpresaMULTA_PERC: TFMTBCDField
      FieldName = 'MULTA_PERC'
      Precision = 15
      Size = 2
    end
    object sdsEmpresaJUROS_PERC: TFMTBCDField
      FieldName = 'JUROS_PERC'
      Precision = 15
      Size = 2
    end
  end
  object sdsExtratoNovo: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select valorcontrib, descricao, total, multa, juros, correcao, v' +
      'encimento, TOTALGERAL'#13#10'from proc_extratonovo(:tppessoa, :capsoci' +
      'al, :regsocial, :represent, :outsindic, :tipocontrib, :dataatual' +
      ', :emp_id)'#13#10'order by vencimento'
    Params = <
      item
        DataType = ftInteger
        Name = 'tppessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'capsocial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'regsocial'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'represent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'outsindic'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    Left = 296
    Top = 536
  end
  object dspExtratoNovo: TDataSetProvider
    DataSet = sdsExtratoNovo
    Constraints = True
    Left = 312
    Top = 560
  end
  object cdsExtratoNovo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tppessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'capsocial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'regsocial'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'represent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'outsindic'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontrib'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspExtratoNovo'
    Left = 328
    Top = 584
    object cdsExtratoNovoVALORCONTRIB: TFMTBCDField
      FieldName = 'VALORCONTRIB'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 8
    end
    object cdsExtratoNovoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsExtratoNovoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoNovoMULTA: TFMTBCDField
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoNovoJUROS: TFMTBCDField
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoNovoCORRECAO: TFMTBCDField
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsExtratoNovoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsExtratoNovoTOTALGERAL: TFMTBCDField
      FieldName = 'TOTALGERAL'
      Precision = 15
      Size = 2
    end
  end
  object dsExtratoNovo: TDataSource
    DataSet = cdsExtratoNovo
    Left = 344
    Top = 608
  end
  object PROC_ASSOC_DADOSBASICOS_UPD: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPFCNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_ASSOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_ASSOC_DADOSBASICOS_UPD'
    Left = 744
    Top = 496
  end
  object sdsTestaRegistro: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select count(*) qtde'#13#10'  from associado a'#13#10'  where a.registro = :' +
      'registro'
    Params = <
      item
        DataType = ftString
        Name = 'registro'
        ParamType = ptInput
      end>
    Left = 704
    Top = 568
    object sdsTestaRegistroQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
  end
  object sdsRelatFialiados: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select r.ass_id, r.registro, r.nome, r.emp_id, r.regiao, r.cpfcn' +
      'pj, r.end_id, r.end_logradouro, r.end_numero, r.end_complemento,' +
      ' r.end_bairro, r.end_cep, r.cidade_id, r.tp_ender_id, r.end_corr' +
      'esp, r.end_corresp_dev, r.statuscorresp, r.cidade_nome, r.estado' +
      '_nome, r.tp_ender_descr, r.ender_completo, r.tp_assoc_id, r.tp_s' +
      'tatus, r.tp_assoc_desc, r.tels, r.email, r.DT_REGISTRO'#13#10'from pro' +
      'c_relat_filiados(:emp_id_par, :tipocontribpar, :tp_status_id_par' +
      ', :filtro, :anofiltro, :datatual, :DATACADINI, :DATACADFIM) r '
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_status_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'filtro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofiltro'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATACADINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATACADFIM'
        ParamType = ptInput
      end>
    Left = 448
    Top = 560
  end
  object dspRelatFiliados: TDataSetProvider
    DataSet = sdsRelatFialiados
    Constraints = True
    Left = 456
    Top = 576
  end
  object cdsRelatFiliados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipocontribpar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tp_status_id_par'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'filtro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anofiltro'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datatual'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATACADINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATACADFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatFiliados'
    Left = 472
    Top = 592
    object cdsRelatFiliadosASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsRelatFiliadosREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object cdsRelatFiliadosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsRelatFiliadosEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
    end
    object cdsRelatFiliadosREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object cdsRelatFiliadosCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object cdsRelatFiliadosEND_ID: TIntegerField
      FieldName = 'END_ID'
    end
    object cdsRelatFiliadosEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsRelatFiliadosEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsRelatFiliadosEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsRelatFiliadosEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsRelatFiliadosEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsRelatFiliadosCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
    end
    object cdsRelatFiliadosTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
    end
    object cdsRelatFiliadosEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsRelatFiliadosEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsRelatFiliadosSTATUSCORRESP: TStringField
      FieldName = 'STATUSCORRESP'
      Size = 40
    end
    object cdsRelatFiliadosCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsRelatFiliadosESTADO_NOME: TStringField
      FieldName = 'ESTADO_NOME'
      Size = 60
    end
    object cdsRelatFiliadosTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsRelatFiliadosENDER_COMPLETO: TStringField
      FieldName = 'ENDER_COMPLETO'
      Size = 300
    end
    object cdsRelatFiliadosTP_ASSOC_ID: TIntegerField
      FieldName = 'TP_ASSOC_ID'
    end
    object cdsRelatFiliadosTP_STATUS: TStringField
      FieldName = 'TP_STATUS'
      Size = 40
    end
    object cdsRelatFiliadosTP_ASSOC_DESC: TStringField
      FieldName = 'TP_ASSOC_DESC'
      Size = 40
    end
    object cdsRelatFiliadosTELS: TStringField
      FieldName = 'TELS'
      Size = 200
    end
    object cdsRelatFiliadosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsRelatFiliadosDT_REGISTRO: TDateField
      FieldName = 'DT_REGISTRO'
    end
  end
  object sdsEnderCorresp: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select first 1 e.end_id, e.ass_id, e.end_logradouro, e.end_numer' +
      'o, e.end_complemento, e.end_bairro, e.end_cep, e.cidade_id, e.tp' +
      '_ender_id, e.end_corresp, e.end_corresp_dev, c.cidade_nome, es.e' +
      'stado_sigla, te.tp_ender_descr'#13#10' from endereco e inner join cida' +
      'de c on c.cidade_id =e.cidade_id inner join  estado es on es.est' +
      'ado_id = c.estado_id'#13#10' inner join tp_endereco te on te.tp_ender_' +
      'id = e.tp_ender_id'#13#10' where e.ass_id = :ass_id and e.end_corresp ' +
      '= :corresp and e.end_corresp_dev = 0'#13#10' order by e.tp_ender_id'#13#10
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
    Left = 816
    Top = 576
  end
  object dspEnderCorresp: TDataSetProvider
    DataSet = sdsEnderCorresp
    Constraints = True
    Left = 832
    Top = 592
  end
  object cdsEnderCorresp: TClientDataSet
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
    ProviderName = 'dspEnderCorresp'
    Left = 856
    Top = 616
    object cdsEnderCorrespEND_ID: TIntegerField
      FieldName = 'END_ID'
      Required = True
    end
    object cdsEnderCorrespASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsEnderCorrespEND_LOGRADOURO: TStringField
      FieldName = 'END_LOGRADOURO'
      Size = 60
    end
    object cdsEnderCorrespEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object cdsEnderCorrespEND_COMPLEMENTO: TStringField
      FieldName = 'END_COMPLEMENTO'
      Size = 40
    end
    object cdsEnderCorrespEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 40
    end
    object cdsEnderCorrespEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object cdsEnderCorrespCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object cdsEnderCorrespTP_ENDER_ID: TIntegerField
      FieldName = 'TP_ENDER_ID'
      Required = True
    end
    object cdsEnderCorrespEND_CORRESP: TSmallintField
      FieldName = 'END_CORRESP'
    end
    object cdsEnderCorrespEND_CORRESP_DEV: TSmallintField
      FieldName = 'END_CORRESP_DEV'
    end
    object cdsEnderCorrespCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Size = 60
    end
    object cdsEnderCorrespTP_ENDER_DESCR: TStringField
      FieldName = 'TP_ENDER_DESCR'
      Size = 40
    end
    object cdsEnderCorrespESTADO_SIGLA: TStringField
      FieldName = 'ESTADO_SIGLA'
      Size = 2
    end
  end
  object sdsPegaContatos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select first 1 c.contato, c.ass_id, c.tp_contato, c.tp_status_id' +
      ', c.contato_obs, c.contato_descr'#13#10'from contato c where c.ass_id ' +
      '= :ass_id and c.tp_contato = :tipo    and c.tp_status_id=1'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    Left = 936
    Top = 568
  end
  object dspPegaContatos: TDataSetProvider
    DataSet = sdsPegaContatos
    Constraints = True
    Left = 944
    Top = 584
  end
  object cdsPegaContatos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    ProviderName = 'dspPegaContatos'
    Left = 960
    Top = 600
    object cdsPegaContatosCONTATO: TIntegerField
      FieldName = 'CONTATO'
      Required = True
    end
    object cdsPegaContatosASS_ID: TIntegerField
      FieldName = 'ASS_ID'
    end
    object cdsPegaContatosTP_CONTATO: TIntegerField
      FieldName = 'TP_CONTATO'
    end
    object cdsPegaContatosTP_STATUS_ID: TIntegerField
      FieldName = 'TP_STATUS_ID'
      Required = True
    end
    object cdsPegaContatosCONTATO_OBS: TStringField
      FieldName = 'CONTATO_OBS'
      Size = 100
    end
    object cdsPegaContatosCONTATO_DESCR: TStringField
      FieldName = 'CONTATO_DESCR'
      Size = 80
    end
  end
  object sdsAssocDel: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 'select qtdepags'#13#10' from proc_assoc_del(:ass_id)'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 1000
    Top = 536
  end
  object dspAssocDel: TDataSetProvider
    DataSet = sdsAssocDel
    Constraints = True
    Left = 1016
    Top = 552
  end
  object cdsAssocDel: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspAssocDel'
    Left = 1032
    Top = 568
    object cdsAssocDelQTDEPAGS: TIntegerField
      FieldName = 'QTDEPAGS'
    end
  end
  object sdsPrescIsencao: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select a.anuid_id, t.tp_contrib_descricao, a.descricao,  a.valor' +
      ', case when a.situacao ='#39'P'#39' then '#39'Prescri'#231#227'o'#39' when a.situacao ='#39 +
      'I'#39' then '#39'Isen'#231#227'o'#39' when a.situacao ='#39'S'#39' then '#39'Simples Nacional'#39' e' +
      'nd situacao, a.datasituacao, a.obs_situacao  from anuidade a'#13#10'in' +
      'ner join tp_contribuicao t on t.tp_contrib_id = a.tp_contrib_id'#13 +
      #10'where a.situacao in ('#39'P'#39','#39'I'#39','#39'S'#39')  and a.ass_id = :ass_id'#13#10'orde' +
      'r by a.datasituacao desc, a.ano desc, a.vencimento'#13#10#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 896
    Top = 416
  end
  object dspPrescIsencao: TDataSetProvider
    DataSet = sdsPrescIsencao
    Constraints = True
    Left = 912
    Top = 440
  end
  object cdsPrescIsencao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspPrescIsencao'
    Left = 928
    Top = 464
    object cdsPrescIsencaoANUID_ID: TIntegerField
      FieldName = 'ANUID_ID'
      Required = True
    end
    object cdsPrescIsencaoTP_CONTRIB_DESCRICAO: TStringField
      FieldName = 'TP_CONTRIB_DESCRICAO'
    end
    object cdsPrescIsencaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsPrescIsencaoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object cdsPrescIsencaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 10
    end
    object cdsPrescIsencaoDATASITUACAO: TDateField
      FieldName = 'DATASITUACAO'
    end
    object cdsPrescIsencaoOBS_SITUACAO: TStringField
      FieldName = 'OBS_SITUACAO'
      Size = 40
    end
  end
  object dsPrescIsencao: TDataSource
    DataSet = cdsPrescIsencao
    Left = 944
    Top = 488
  end
  object sdsPegaEmp: TSQLClientDataSet
    CommandText = 'select nomeemp from config'#13#10'where emp_id = :emp_id'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 728
    Top = 632
    object sdsPegaEmpNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 120
    end
  end
  object sdsProc_ResumoCad: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select acumulado, inscricoes, cancelamentos, mes, ano, mesextens' +
      'o'#13#10'     from proc_resumocad(:dataatual)'
    Params = <
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    Left = 528
    Top = 552
  end
  object dspProc_ResumoCad: TDataSetProvider
    DataSet = sdsProc_ResumoCad
    Constraints = True
    Left = 536
    Top = 568
  end
  object cdsProc_ResumoCad: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dataatual'
        ParamType = ptInput
      end>
    ProviderName = 'dspProc_ResumoCad'
    Left = 552
    Top = 584
    object cdsProc_ResumoCadACUMULADO: TIntegerField
      FieldName = 'ACUMULADO'
    end
    object cdsProc_ResumoCadINSCRICOES: TIntegerField
      FieldName = 'INSCRICOES'
    end
    object cdsProc_ResumoCadCANCELAMENTOS: TIntegerField
      FieldName = 'CANCELAMENTOS'
    end
    object cdsProc_ResumoCadMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsProc_ResumoCadANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsProc_ResumoCadMESEXTENSO: TStringField
      FieldName = 'MESEXTENSO'
      Size = 50
    end
  end
  object sdsNovoGenEmail: TSQLClientDataSet
    CommandText = 
      ' select cast(GEN_ID(GEN_NOVOEMAIL,1) as varchar(20))novo from rd' +
      'b$database'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 1000
    Top = 720
    object sdsNovoGenEmailNOVO: TStringField
      FieldName = 'NOVO'
      Required = True
    end
  end
  object sdsNovoGenArquivo: TSQLClientDataSet
    CommandText = 
      ' select cast(GEN_ID(GEN_NOVOARQUIVO,1) as varchar(20))novo from ' +
      'rdb$database'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 1064
    Top = 704
    object sdsNovoGenArquivoNOVO: TStringField
      FieldName = 'NOVO'
      Required = True
    end
  end
  object sdsReciboPrint: TSQLClientDataSet
    CommandText = 'select recibo'#13#10'       from proc_gerarecibo(:emp_id, :num)'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'num'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 656
    Top = 648
    object sdsReciboPrintRECIBO: TStringField
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 254
    end
  end
  object sdsRelatRecebidos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select CPFCNPJ, registro, nome, nossonumero, dt_recebimento, dt_' +
      'credito, dt_baixa, valor_total, valor_recebimento, forma_pagto, ' +
      'sindicato'#13#10'  from procguiasrecebidas(:data1, :data2, :tipodata, ' +
      ':emp_id, :tpcontrib)'
    Params = <
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
        DataType = ftString
        Name = 'tipodata'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tpcontrib'
        ParamType = ptInput
      end>
    Left = 1136
    Top = 48
  end
  object dspRelatRecebidos: TDataSetProvider
    DataSet = sdsRelatRecebidos
    Constraints = True
    Left = 1144
    Top = 64
  end
  object cdsRelatRecebidos: TClientDataSet
    Aggregates = <>
    Params = <
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
        DataType = ftString
        Name = 'tipodata'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tpcontrib'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatRecebidos'
    Left = 1168
    Top = 88
    object cdsRelatRecebidosNOSSONUMERO: TStringField
      DisplayLabel = 'N'#186'Guia'
      FieldName = 'NOSSONUMERO'
      Size = 40
    end
    object cdsRelatRecebidosDT_RECEBIMENTO: TDateField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'DT_RECEBIMENTO'
    end
    object cdsRelatRecebidosDT_CREDITO: TDateField
      DisplayLabel = 'Data Cr'#233'dito'
      FieldName = 'DT_CREDITO'
    end
    object cdsRelatRecebidosREGISTRO: TStringField
      DisplayLabel = 'N'#186'Cadastro'
      FieldName = 'REGISTRO'
    end
    object cdsRelatRecebidosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 150
    end
    object cdsRelatRecebidosDT_BAIXA: TDateField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DT_BAIXA'
    end
    object cdsRelatRecebidosVALOR_TOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsRelatRecebidosVALOR_RECEBIMENTO: TFMTBCDField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALOR_RECEBIMENTO'
      Precision = 18
      Size = 2
    end
    object cdsRelatRecebidosSINDICATO: TStringField
      DisplayLabel = 'Sindicato'
      FieldName = 'SINDICATO'
    end
    object cdsRelatRecebidosFORMA_PAGTO: TStringField
      DisplayLabel = 'Forma de Pagto.'
      FieldName = 'FORMA_PAGTO'
      Size = 50
    end
    object cdsRelatRecebidosCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
  end
  object sdsRelatGuiasNaoIdent: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select guia_id, nossonumero, valorpago, datapago, datacredito, d' +
      'atagravacao, arquivo, emp_id, sindicato'#13#10'  from procguiasnaoiden' +
      'tif(:data1, :data2, :tipodata, :emp_idpar)'
    Params = <
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
        DataType = ftString
        Name = 'tipodata'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_idpar'
        ParamType = ptInput
      end>
    Left = 1256
    Top = 56
  end
  object dspRelatGuiasNaoIdent: TDataSetProvider
    DataSet = sdsRelatGuiasNaoIdent
    Constraints = True
    Left = 1264
    Top = 72
  end
  object cdsRelatGuiasNaoIdent: TClientDataSet
    Aggregates = <>
    Params = <
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
        DataType = ftString
        Name = 'tipodata'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'emp_idpar'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatGuiasNaoIdent'
    Left = 1288
    Top = 96
    object cdsRelatGuiasNaoIdentNOSSONUMERO: TStringField
      DisplayLabel = 'N'#186'Guia'
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsRelatGuiasNaoIdentSINDICATO: TStringField
      DisplayLabel = 'Sindicato'
      FieldName = 'SINDICATO'
      Size = 40
    end
    object cdsRelatGuiasNaoIdentVALORPAGO: TFMTBCDField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
    object cdsRelatGuiasNaoIdentDATAPAGO: TDateField
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DATAPAGO'
    end
    object cdsRelatGuiasNaoIdentDATACREDITO: TDateField
      DisplayLabel = 'Data Cr'#233'dito'
      FieldName = 'DATACREDITO'
    end
    object cdsRelatGuiasNaoIdentARQUIVO: TStringField
      DisplayLabel = 'Nome do Arquivo'
      FieldName = 'ARQUIVO'
      Size = 80
    end
    object cdsRelatGuiasNaoIdentDATAGRAVACAO: TDateField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATAGRAVACAO'
    end
    object cdsRelatGuiasNaoIdentEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      Visible = False
    end
    object cdsRelatGuiasNaoIdentGUIA_ID: TIntegerField
      FieldName = 'GUIA_ID'
      Visible = False
    end
  end
  object sdsTpMovs: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select tp_mov_id, tp_mov_descricao'#13#10'     from tp_movimento'#13#10'    ' +
      ' order by 2'
    Params = <>
    Left = 1128
    Top = 160
  end
  object dspMovs: TDataSetProvider
    DataSet = sdsTpMovs
    Constraints = True
    Left = 1136
    Top = 176
  end
  object cdsTpMovs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovs'
    Left = 1152
    Top = 184
    object cdsTpMovsTP_MOV_ID: TIntegerField
      FieldName = 'TP_MOV_ID'
      Required = True
    end
    object cdsTpMovsTP_MOV_DESCRICAO: TStringField
      FieldName = 'TP_MOV_DESCRICAO'
      Size = 40
    end
  end
  object dsMovs: TDataSource
    DataSet = cdsTpMovs
    Left = 1176
    Top = 192
  end
  object dspRelatMovsLista: TDataSetProvider
    DataSet = sdsRelatMovsLista
    Constraints = True
    Left = 1256
    Top = 184
  end
  object dspRelatMovsMes: TDataSetProvider
    DataSet = sdsRelatMovsMes
    Constraints = True
    Left = 1136
    Top = 264
  end
  object cdsRelatMovsLista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tpmov'
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
      end>
    ProviderName = 'dspRelatMovsLista'
    Left = 1280
    Top = 200
    object cdsRelatMovsListaREGISTRO: TStringField
      DisplayLabel = 'N'#186'Cadastro'
      FieldName = 'REGISTRO'
    end
    object cdsRelatMovsListaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 150
    end
    object cdsRelatMovsListaSINDICATO: TStringField
      DisplayLabel = 'Sindicato'
      FieldName = 'SINDICATO'
      Size = 30
    end
    object cdsRelatMovsListaDATAMOV: TDateField
      DisplayLabel = 'Data Movim.'
      FieldName = 'DATAMOV'
    end
  end
  object cdsRelatMovsMes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'tpmov'
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
      end>
    ProviderName = 'dspRelatMovsMes'
    Left = 1160
    Top = 280
    object cdsRelatMovsMesSINDICATO: TStringField
      DisplayLabel = 'Sindicato'
      FieldName = 'SINDICATO'
      Size = 30
    end
    object cdsRelatMovsMesMESNUM: TIntegerField
      FieldName = 'MESNUM'
      Visible = False
    end
    object cdsRelatMovsMesMES: TStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'MES'
      Size = 30
    end
    object cdsRelatMovsMesANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
    end
    object cdsRelatMovsMesQTDE: TIntegerField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTDE'
    end
  end
  object sdsRelatMovsLista: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select registro, nome, sindicato, datamov'#13#10'      from proc_relat' +
      'movimento(:tpmov, :data1, :data2)'#13#10
    Params = <
      item
        DataType = ftInteger
        Name = 'tpmov'
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
      end>
    Left = 1232
    Top = 160
  end
  object sdsRelatMovsMes: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select sindicato, mesnum, mes, ano, qtde'#13#10'      from proc_relatm' +
      'ovimento_mes(:tpmov, :data1, :data2)'
    Params = <
      item
        DataType = ftInteger
        Name = 'tpmov'
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
      end>
    Left = 1120
    Top = 248
  end
  object sdsSimplesNacional: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select registro, nome, sindicato, valor, datapedido, ass_id, ano' +
      'ssind, valorsind, valorconf, anosconf'#13#10'       from proc_relat_si' +
      'mplesnac2(:data1, :data2)'
    Params = <
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptInput
      end>
    Left = 1234
    Top = 272
  end
  object dspSimplesNacional: TDataSetProvider
    DataSet = sdsSimplesNacional
    Constraints = True
    Left = 1266
    Top = 280
  end
  object cdsSimplesNacional: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptInput
      end>
    ProviderName = 'dspSimplesNacional'
    Left = 1290
    Top = 296
    object cdsSimplesNacionalREGISTRO: TStringField
      DisplayLabel = 'N'#186' Cadastro'
      FieldName = 'REGISTRO'
    end
    object cdsSimplesNacionalNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 200
    end
    object cdsSimplesNacionalSINDICATO: TStringField
      DisplayLabel = 'Sindicato'
      FieldName = 'SINDICATO'
      Size = 30
    end
    object cdsSimplesNacionalVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsSimplesNacionalDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
    end
    object cdsSimplesNacionalASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      Visible = False
    end
    object cdsSimplesNacionalANOSSIND: TStringField
      FieldName = 'ANOSSIND'
      Size = 10
    end
    object cdsSimplesNacionalVALORSIND: TFMTBCDField
      FieldName = 'VALORSIND'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsSimplesNacionalVALORCONF: TFMTBCDField
      FieldName = 'VALORCONF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsSimplesNacionalANOSCONF: TStringField
      FieldName = 'ANOSCONF'
      Size = 10
    end
  end
  object sdsRelatAtendimentos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select jan, fev, mar, abr, mai, jun, jul, ago, sep, out, nov, de' +
      'z, totaluser, totalgeral, nome, iduser'#13#10'      from proc_relat_at' +
      'endimentos(:ano)'
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end>
    Left = 1200
    Top = 424
  end
  object dspRelatAtendimentos: TDataSetProvider
    DataSet = sdsRelatAtendimentos
    Constraints = True
    Left = 1208
    Top = 440
  end
  object cdsRelatAtendimentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatAtendimentos'
    Left = 1216
    Top = 464
    object cdsRelatAtendimentosJAN: TIntegerField
      FieldName = 'JAN'
    end
    object cdsRelatAtendimentosFEV: TIntegerField
      FieldName = 'FEV'
    end
    object cdsRelatAtendimentosMAR: TIntegerField
      FieldName = 'MAR'
    end
    object cdsRelatAtendimentosABR: TIntegerField
      FieldName = 'ABR'
    end
    object cdsRelatAtendimentosMAI: TIntegerField
      FieldName = 'MAI'
    end
    object cdsRelatAtendimentosJUN: TIntegerField
      FieldName = 'JUN'
    end
    object cdsRelatAtendimentosJUL: TIntegerField
      FieldName = 'JUL'
    end
    object cdsRelatAtendimentosAGO: TIntegerField
      FieldName = 'AGO'
    end
    object cdsRelatAtendimentosSEP: TIntegerField
      DisplayLabel = 'SET'
      FieldName = 'SEP'
    end
    object cdsRelatAtendimentosOUT: TIntegerField
      FieldName = 'OUT'
    end
    object cdsRelatAtendimentosNOV: TIntegerField
      FieldName = 'NOV'
    end
    object cdsRelatAtendimentosDEZ: TIntegerField
      FieldName = 'DEZ'
    end
    object cdsRelatAtendimentosTOTALUSER: TIntegerField
      DisplayLabel = 'Total Usu'#225'rio'
      FieldName = 'TOTALUSER'
    end
    object cdsRelatAtendimentosTOTALGERAL: TIntegerField
      DisplayLabel = 'Acumulado'
      FieldName = 'TOTALGERAL'
    end
    object cdsRelatAtendimentosNOME: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME'
      Size = 150
    end
    object cdsRelatAtendimentosIDUSER: TIntegerField
      FieldName = 'IDUSER'
    end
  end
  object sdsVerExisteLoteitem: TSQLClientDataSet
    CommandText = 'select count(*)qtde from loteitens i'#13#10'where i.ass_id = :ass_id'
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
    Left = 1296
    Top = 432
    object sdsVerExisteLoteitemQTDE: TIntegerField
      FieldName = 'QTDE'
      ReadOnly = True
      Required = True
    end
  end
  object sdsVerExisteAnuid: TSQLClientDataSet
    CommandText = 
      'select c.idloteitem from loteitenscontribs c'#13#10'where c.anuid_id =' +
      ' :anuid_id'#13#10'order by C.idloteitemcontrib desc'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'anuid_id'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 1312
    Top = 488
    object sdsVerExisteAnuidIDLOTEITEM: TIntegerField
      FieldName = 'IDLOTEITEM'
    end
  end
  object sdsVerExisteStatus: TSQLClientDataSet
    CommandText = 
      'select count(*) qtde'#13#10'from loteitemstatus lo'#13#10'where lo.idtpstatu' +
      'sitem = :tipo and lo.datastatus = :data'#13#10'and lo.idloteitem =:ite' +
      'm'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'item'
        ParamType = ptInput
      end>
    DBConnection = DMConexao.SQLConexao
    Left = 1320
    Top = 544
    object sdsVerExisteStatusQTDE: TIntegerField
      FieldName = 'QTDE'
      ReadOnly = True
      Required = True
    end
  end
  object PROC_NOTIFIC_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'TPNOTIF_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAEMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMINHO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_NOTIFIC_I'
    Left = 1192
    Top = 576
  end
  object sdsDocsAnexos: TSQLDataSet
    SQLConnection = DMConexao.SQLConexao
    CommandText = 
      'select n.notif_id, n.tpnotif_id, n.dataemissao, n.caminho, n.idu' +
      'ser, n.datainclusao, upper(u.login) usuario, n.ass_id, tp.descri' +
      'cao'#13#10'   from  notificacoes n'#13#10'   inner join tpnotificacao tp on ' +
      'tp.tp_notif_id = n.tpnotif_id'#13#10'    inner join ucusuario u on u.i' +
      'duser = n.iduser'#13#10'   where n.ass_id = :ass_id'#13#10'   order by n.dat' +
      'aemissao desc, n.notif_id desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    Left = 1408
    Top = 488
  end
  object dspDocsAnexos: TDataSetProvider
    DataSet = sdsDocsAnexos
    Constraints = True
    Left = 1424
    Top = 512
  end
  object cdsDocsAnexos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ass_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocsAnexos'
    Left = 1440
    Top = 520
    object cdsDocsAnexosNOTIF_ID: TIntegerField
      FieldName = 'NOTIF_ID'
      Required = True
    end
    object cdsDocsAnexosTPNOTIF_ID: TIntegerField
      FieldName = 'TPNOTIF_ID'
    end
    object cdsDocsAnexosDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object cdsDocsAnexosCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Size = 200
    end
    object cdsDocsAnexosIDUSER: TIntegerField
      FieldName = 'IDUSER'
    end
    object cdsDocsAnexosDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object cdsDocsAnexosUSUARIO: TStringField
      FieldName = 'USUARIO'
      ReadOnly = True
      Size = 15
    end
    object cdsDocsAnexosASS_ID: TIntegerField
      FieldName = 'ASS_ID'
      ReadOnly = True
    end
    object cdsDocsAnexosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 80
    end
  end
  object dsDocsAnexos: TDataSource
    DataSet = cdsDocsAnexos
    Left = 1464
    Top = 536
  end
  object Proc_Cancel_Anuid: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_CANCEL_ANUID'
    Left = 688
    Top = 312
  end
  object sdsGuiasEmitidas: TSQLClientDataSet
    CommandText = 
      'select bol_id, idassoc, registro, nome, tipopessoa, nossonumero,' +
      ' tipocontrib, status_id, status, dataemissao, datavencimento, va' +
      'lor, datapagamento, valorreceb, multa_paga, correcao_paga, juros' +
      '_pago, desconto_pago, formapagto, conta_id, localidade, itens'#13#10' ' +
      '  from proc_locboletos_assoc(:ass_id)'
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
    Left = 560
    Top = 688
    object sdsGuiasEmitidasBOL_ID: TIntegerField
      FieldName = 'BOL_ID'
    end
    object sdsGuiasEmitidasIDASSOC: TIntegerField
      FieldName = 'IDASSOC'
    end
    object sdsGuiasEmitidasREGISTRO: TStringField
      FieldName = 'REGISTRO'
    end
    object sdsGuiasEmitidasNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsGuiasEmitidasTIPOPESSOA: TStringField
      FieldName = 'TIPOPESSOA'
      Size = 30
    end
    object sdsGuiasEmitidasNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object sdsGuiasEmitidasTIPOCONTRIB: TStringField
      FieldName = 'TIPOCONTRIB'
      Size = 40
    end
    object sdsGuiasEmitidasSTATUS_ID: TIntegerField
      FieldName = 'STATUS_ID'
    end
    object sdsGuiasEmitidasSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object sdsGuiasEmitidasDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object sdsGuiasEmitidasDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
    end
    object sdsGuiasEmitidasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
    end
    object sdsGuiasEmitidasVALORRECEB: TFMTBCDField
      FieldName = 'VALORRECEB'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasMULTA_PAGA: TFMTBCDField
      FieldName = 'MULTA_PAGA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasCORRECAO_PAGA: TFMTBCDField
      FieldName = 'CORRECAO_PAGA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasJUROS_PAGO: TFMTBCDField
      FieldName = 'JUROS_PAGO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasDESCONTO_PAGO: TFMTBCDField
      FieldName = 'DESCONTO_PAGO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object sdsGuiasEmitidasFORMAPAGTO: TStringField
      FieldName = 'FORMAPAGTO'
      Size = 30
    end
    object sdsGuiasEmitidasCONTA_ID: TIntegerField
      FieldName = 'CONTA_ID'
    end
    object sdsGuiasEmitidasLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
    end
    object sdsGuiasEmitidasITENS: TStringField
      FieldName = 'ITENS'
      Size = 500
    end
  end
end
