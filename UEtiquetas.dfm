object frmEtiqueta: TfrmEtiqueta
  Left = 310
  Top = 283
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Etiquetas'
  ClientHeight = 152
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 111
    Height = 13
    Caption = 'Modelo de Etiqueta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 289
    Height = 71
  end
  object comboModelo: TComboBox
    Left = 24
    Top = 46
    Width = 257
    Height = 21
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Pimaco - A4 354'
      'Pimaco - A4 362'
      'Pimaco - A4 363'
      'Pimaco - Carta 0082'
      'Pimaco - Carta 6081'
      'Pimaco - Carta 6082'
      'Pimaco - Carta 6180'
      'Pimaco - Carta 6181'
      'Pimaco - Carta 6182'
      'Pimaco - Carta 6281'
      'Pimaco - Carta 6282')
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 309
    Height = 47
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      309
      47)
    object BitBtn3: TBitBtn
      Left = 139
      Top = 7
      Width = 79
      Height = 35
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 223
      Top = 7
      Width = 79
      Height = 35
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancela'
      TabOrder = 1
      OnClick = BitBtn4Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Dados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 8
    object DadosREGISTRO: TStringField
      FieldName = 'REGISTRO'
      EditMask = '9999999/9999'
    end
    object Dadosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object Dadosendereco: TStringField
      FieldName = 'endereco'
      Size = 100
    end
    object Dadoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object Dadosbairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object Dadoscep: TStringField
      FieldName = 'cep'
    end
    object Dadoscidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object Dadosestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
  end
  object DadosFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 72
    object DadosFiscalCNPJ: TStringField
      Alignment = taCenter
      FieldName = 'CNPJ'
    end
    object DadosFiscalNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 100
    end
    object DadosFiscalNIRC_EMP: TStringField
      Alignment = taCenter
      FieldName = 'NIRC_EMP'
      Size = 14
    end
    object DadosFiscalCIDADE_EMP: TStringField
      FieldName = 'CIDADE_EMP'
      Size = 40
    end
    object DadosFiscalDATA_CONTROLE: TDateField
      Alignment = taCenter
      FieldName = 'DATA_CONTROLE'
    end
    object DadosFiscalDT_REGISTRO: TDateField
      FieldName = 'DT_REGISTRO'
    end
    object DadosFiscalVALOR_REG: TFloatField
      FieldName = 'VALOR_REG'
      DisplayFormat = ',0.00'
    end
    object DadosFiscalendereco: TStringField
      FieldName = 'endereco'
      Visible = False
      Size = 100
    end
    object DadosFiscalbairro: TStringField
      FieldName = 'bairro'
      Visible = False
      Size = 410
    end
    object DadosFiscalcep: TStringField
      FieldName = 'cep'
      Visible = False
      Size = 10
    end
    object DadosFiscalestado: TStringField
      FieldName = 'estado'
      Visible = False
      Size = 2
    end
    object DadosFiscalcartorio: TStringField
      FieldName = 'cartorio'
      Size = 14
    end
    object DadosFiscalatividade: TStringField
      FieldName = 'atividade'
      Size = 105
    end
    object DadosFiscalemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object DadosFiscalDATA_REG_SOCIAL: TDateField
      FieldName = 'DATA_REG_SOCIAL'
    end
    object DadosFiscalcapital: TFloatField
      FieldName = 'capital'
    end
    object DadosFiscaldt_ult_alter: TDateField
      FieldName = 'dt_ult_alter'
    end
    object DadosFiscaldt_homologacao: TDateField
      FieldName = 'dt_homologacao'
    end
  end
end
