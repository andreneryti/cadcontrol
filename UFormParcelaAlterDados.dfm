object FormParcelaAlterDados: TFormParcelaAlterDados
  Left = 688
  Top = 598
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Altera'#231#227'o de Dados: Contribui'#231#227'o'
  ClientHeight = 203
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 18
    Width = 449
    Height = 113
  end
  object Label1: TLabel
    Left = 24
    Top = 26
    Width = 58
    Height = 13
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 232
    Top = 26
    Width = 72
    Height = 13
    Caption = 'Contribui'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 82
    Width = 67
    Height = 13
    Caption = 'Vencimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 120
    Top = 82
    Width = 30
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 368
    Top = 26
    Width = 23
    Height = 13
    Caption = 'Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 483
    Height = 53
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      483
      53)
    object BtnOK: TBitBtn
      Left = 322
      Top = 8
      Width = 77
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      DragCursor = crHandPoint
      ModalResult = 1
      TabOrder = 0
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
    object BitBtn3: TBitBtn
      Left = 401
      Top = 8
      Width = 77
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      DragCursor = crHandPoint
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object editdescricao: TEdit
    Left = 24
    Top = 40
    Width = 185
    Height = 21
    Color = 15263976
    ReadOnly = True
    TabOrder = 1
  end
  object EditContribuicao: TEdit
    Left = 232
    Top = 40
    Width = 121
    Height = 21
    Color = 15263976
    ReadOnly = True
    TabOrder = 2
  end
  object EditVencimento: TMaskEdit
    Left = 24
    Top = 96
    Width = 78
    Height = 21
    EditMask = '99/99/9999'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object EditAno: TEdit
    Left = 368
    Top = 40
    Width = 86
    Height = 21
    Color = 15263976
    ReadOnly = True
    TabOrder = 5
  end
  object editValor: TJvCurrencyEdit
    Left = 120
    Top = 96
    Width = 93
    Height = 21
    Alignment = taRightJustify
    ReadOnly = False
    TabOrder = 4
    Value = 1
    HasMaxValue = False
    HasMinValue = False
  end
end
