object DMMalaDireta: TDMMalaDireta
  OldCreateOrder = False
  Left = 412
  Top = 250
  Height = 380
  Width = 529
  object PROC_MALADIRETA_UI: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftFixedChar
        Name = 'OPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MALA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ASSUNTO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'TEXTOEMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEXTOMALADIRETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEIDENTIFICACAO'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MALADIRETA_UI'
    Left = 64
    Top = 96
  end
  object sdsMalas: TSQLClientDataSet
    CommandText = 
      'select mala_id, datacriacao, usuario, assunto, textoemail, texto' +
      'maladireta, prioridade, status, nomeuser, statusnome, nomeidenti' +
      'ficacao, totalemails, aenviar, enviados, erro_enviar'#13#10'        fr' +
      'om proc_maladireta_loc'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 104
    Top = 256
    object sdsMalasMALA_ID: TIntegerField
      FieldName = 'MALA_ID'
    end
    object sdsMalasDATACRIACAO: TDateField
      FieldName = 'DATACRIACAO'
    end
    object sdsMalasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object sdsMalasASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 50
    end
    object sdsMalasTEXTOEMAIL: TBlobField
      FieldName = 'TEXTOEMAIL'
      Size = 1
    end
    object sdsMalasTEXTOMALADIRETA: TStringField
      FieldName = 'TEXTOMALADIRETA'
      Size = 200
    end
    object sdsMalasPRIORIDADE: TIntegerField
      FieldName = 'PRIORIDADE'
    end
    object sdsMalasSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object sdsMalasNOMEUSER: TStringField
      FieldName = 'NOMEUSER'
      Size = 30
    end
    object sdsMalasSTATUSNOME: TStringField
      FieldName = 'STATUSNOME'
      Size = 30
    end
    object sdsMalasNOMEIDENTIFICACAO: TStringField
      FieldName = 'NOMEIDENTIFICACAO'
      Size = 30
    end
    object sdsMalasTOTALEMAILS: TIntegerField
      FieldName = 'TOTALEMAILS'
    end
    object sdsMalasAENVIAR: TIntegerField
      FieldName = 'AENVIAR'
    end
    object sdsMalasENVIADOS: TIntegerField
      FieldName = 'ENVIADOS'
    end
    object sdsMalasERRO_ENVIAR: TIntegerField
      FieldName = 'ERRO_ENVIAR'
    end
  end
  object PROC_MALADIRETA_PRIORIDADE: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'MALA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRIORIDADEATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRIORIDADENOVA'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MALADIRETA_PRIORIDADE'
    Left = 192
    Top = 160
  end
  object PROC_MALADIRETA_D: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'MALA_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MALADIRETA_D'
    Left = 360
    Top = 184
  end
  object PROC_MALADIRETA_ORGANPRIOR: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <>
    StoredProcName = 'PROC_MALADIRETA_ORGANPRIOR'
    Left = 248
    Top = 256
  end
  object PROC_MALADIRETAITEM_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'MALAITEM_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MALADIRETA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SELECIONADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ASS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_PESSOA'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MALADIRETAITEM_I'
    Left = 392
    Top = 264
  end
  object PROC_MALADIRETAITEM_ANEXO_I: TSQLStoredProc
    SQLConnection = DMConexao.SQLConexao
    Params = <
      item
        DataType = ftInteger
        Name = 'ANEXO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMINHOANEXO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MALADIRETAITENS_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'PROC_MALADIRETAITEM_ANEXO_I'
    Left = 456
    Top = 128
  end
  object sdsMalaItemID: TSQLClientDataSet
    CommandText = 
      '       select cast(gen_id(GEN_MALADIRETAITENS_ID,1) as integer) ' +
      'iditem from rdb$database'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DMConexao.SQLConexao
    Left = 280
    Top = 112
    object sdsMalaItemIDIDITEM: TIntegerField
      FieldName = 'IDITEM'
      Required = True
    end
  end
end
