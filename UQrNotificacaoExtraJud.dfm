inherited QrNotificacaoExtraJud: TQrNotificacaoExtraJud
  Top = -248
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = cdsRelTermo
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100
    2970
    80
    2100
    150
    100
    0)
  ShowProgress = False
  inherited PageHeaderBand1: TQRBand
    Left = 57
    Top = 30
    Width = 700
    Height = 1
    Size.Values = (
      2.64583333333333
      1852.08333333333)
    inherited QRSysData3: TQRSysData
      Left = 825
      Width = 1
      Size.Values = (
        39.6875
        2182.8125
        44.9791666666667
        2.64583333333333)
      Font.Color = clWhite
      Font.Height = -9
      FontSize = 7
    end
    inherited QRLabel1: TQRLabel
      Left = 828
      Width = 1
      Size.Values = (
        39.6875
        2190.75
        5.29166666666667
        2.64583333333333)
      Caption = ''
      Font.Height = -9
      FontSize = 7
    end
    inherited QRSysData1: TQRSysData
      Left = 1141
      Top = 2
      Width = 86
      Size.Values = (
        39.6875
        3018.89583333333
        5.29166666666667
        227.541666666667)
      Data = qrsDateTime
      Font.Color = clWhite
      Font.Height = -9
      FontSize = 7
    end
  end
  inherited PageFooterBand1: TQRBand
    Left = 57
    Top = 359
    Width = 700
    Height = 42
    Frame.DrawTop = False
    Size.Values = (
      111.125
      1852.08333333333)
    inherited QRSysData2: TQRSysData
      Left = 982
      Width = 7
      Size.Values = (
        44.9791666666667
        2598.20833333333
        15.875
        18.5208333333333)
      Font.Color = clWhite
      FontSize = 8
    end
    object labrodape1: TQRLabel
      Left = 9
      Top = 7
      Width = 684
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        23.8125
        18.5208333333333
        1809.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Av.Gra'#231'a Aranha, n'#186' 416 - salas 424/425 e 1108 a 1110 - Telefone' +
        ': (21) 2524-2859 - Rio de Janeiro - Brasil'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object labrodape2: TQRLabel
      Left = 9
      Top = 21
      Width = 684
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        23.8125
        55.5625
        1809.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'E-mail: sindicato@sircomrj.com.br  - Site: www.sircomrj.com.br'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape1: TQRShape
      Left = 5
      Top = 4
      Width = 689
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        13.2291666666667
        10.5833333333333
        1822.97916666667)
      Shape = qrsHorLine
    end
  end
  object ChildBand1: TQRChildBand
    Left = 57
    Top = 223
    Width = 700
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      82.0208333333333
      1852.08333333333)
    ParentBand = SummaryBand1
    object ricTexto2: TQRRichText
      Left = 0
      Top = 4
      Width = 698
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        0
        10.5833333333333
        1846.79166666667)
      Alignment = taLeftJustify
      AutoStretch = True
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        'RichEdit2')
    end
  end
  object SummaryBand1: TQRBand
    Left = 57
    Top = 203
    Width = 700
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.9166666666667
      1852.08333333333)
    BandType = rbSummary
    object QRLabel16: TQRLabel
      Left = 113
      Top = 1
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        298.979166666667
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape17: TQRShape
      Left = 233
      Top = 0
      Width = 9
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        616.479166666667
        0
        23.8125)
      Shape = qrsVertLine
    end
    object QRExpr2: TQRExpr
      Left = 344
      Top = 1
      Width = 156
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        910.166666666667
        2.64583333333333
        412.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'formatnumeric('#39',0.00'#39',SUM(cdsRelTermo.Valor))'
      Mask = ',0.00'
      FontSize = 10
    end
  end
  object DetailBand1: TQRBand
    Left = 57
    Top = 184
    Width = 700
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      50.2708333333333
      1852.08333333333)
    BandType = rbDetail
    object QRShape8: TQRShape
      Left = 233
      Top = 0
      Width = 9
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        616.479166666667
        0
        23.8125)
      Shape = qrsVertLine
    end
    object QRDBText2: TQRDBText
      Left = 360
      Top = 0
      Width = 140
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        952.5
        0
        370.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = cdsRelTermo
      DataField = 'valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 50
      Top = 0
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        132.291666666667
        0
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = cdsRelTermo
      DataField = 'Ano'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand2: TQRChildBand
    Left = 57
    Top = 160
    Width = 700
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.5
      1852.08333333333)
    ParentBand = TitleBand1
    object QRLabel17: TQRLabel
      Left = 59
      Top = 3
      Width = 110
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        156.104166666667
        7.9375
        291.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'EXERC'#205'CIOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 260
      Top = 3
      Width = 421
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        687.916666666667
        7.9375
        1113.89583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VALORES EM REAIS ATUALIZADOS AT'#201' A PRESENTE DATA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape21: TQRShape
      Left = 233
      Top = 1
      Width = 9
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        616.479166666667
        2.64583333333333
        23.8125)
      Shape = qrsVertLine
    end
  end
  object TitleBand1: TQRBand
    Left = 57
    Top = 31
    Width = 700
    Height = 129
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      341.3125
      1852.08333333333)
    BandType = rbTitle
    object ricTexto1: TQRRichText
      Left = 2
      Top = 107
      Width = 695
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        5.29166666666667
        283.104166666667
        1838.85416666667)
      Alignment = taLeftJustify
      AutoStretch = True
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
    end
    object labempresa: TQRLabel
      Left = 125
      Top = 13
      Width = 448
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        330.729166666667
        34.3958333333333
        1185.33333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'SINDICATO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 12
    end
    object labSubtitulo: TQRLabel
      Left = 109
      Top = 35
      Width = 477
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        288.395833333333
        92.6041666666667
        1262.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'DOS REPRESENTANTES COMERCIAIS DO MUNIC'#205'PIO DO RIO DE JANEIRO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
  end
  object labNotif: TQRLabel
    Left = 168
    Top = 94
    Width = 470
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      68.7916666666667
      444.5
      248.708333333333
      1243.54166666667)
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    AutoStretch = True
    Caption = 'Notifica'#231#227'o Extrajudicial n'#186
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    FontSize = 16
  end
  object QRChildBand1: TQRChildBand
    Left = 57
    Top = 254
    Width = 700
    Height = 105
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      277.8125
      1852.08333333333)
    ParentBand = ChildBand1
    object QRLabel2: TQRLabel
      Left = 22
      Top = 3
      Width = 656
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        58.2083333333333
        7.9375
        1735.66666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '01/01/2009'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      OnPrint = QRLabel7Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel3: TQRLabel
      Left = 286
      Top = 63
      Width = 122
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        756.708333333333
        166.6875
        322.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Jo'#227'o Paulo C. Saraiva'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel4: TQRLabel
      Left = 300
      Top = 81
      Width = 95
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        793.75
        214.3125
        251.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'OAB/RJ '#8211' 95.664'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object cdsRelTermo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 416
    object cdsRelTermoano: TIntegerField
      FieldName = 'ano'
    end
    object cdsRelTermovalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = ',0.00'
    end
  end
  object DsRelTermo: TDataSource
    Left = 16
    Top = 376
  end
end
