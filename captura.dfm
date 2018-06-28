object frmCaptura: TfrmCaptura
  Left = 383
  Top = 296
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Capturar Foto'
  ClientHeight = 210
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 168
    Top = 8
    Width = 150
    Height = 190
    AutoSize = True
    Center = True
  end
  object Camera1: TCamera
    Left = 8
    Top = 8
    Width = 155
    Height = 191
    FichierVideo = 'Video.avi'
    FichierImage = 'Imagen.bmp'
    StrechView = False
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 46
    Width = 80
    Height = 37
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 83
    Width = 80
    Height = 37
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object Button2: TBitBtn
    Left = 328
    Top = 10
    Width = 80
    Height = 37
    Caption = 'Capturar Foto'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 328
    Top = 157
    Width = 80
    Height = 37
    Caption = 'Ligar Camera'
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object BitBtn3: TBitBtn
    Left = 328
    Top = 120
    Width = 80
    Height = 37
    Caption = 'Arquivo'
    TabOrder = 5
    OnClick = BitBtn3Click
    Glyph.Data = {
      06020000424D0602000000000000760000002800000028000000140000000100
      0400000000009001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      333FFFFFFFFFFFFFF3333370000000000000333333777777777777773F333300
      8B8B8B8B8B8B033333773F33333333337F33330F08B8B8B8B8B80333337F7F33
      3333333373F3330B0B8B8B8B8B8B8033337F73F33333333337F3330FB0B8B8B8
      B8B8B033337F37F333333333373F330BF08B8B8B8B8B8B03337F373FFFFF3333
      337F330FBF000008B8B8B803337F33777773FFFFFF73330BFBFBFBF000000033
      337F3333333777777733330FBFBFBFBFBFB03333337F333333333337F333330B
      FBFBFBFBFBF03333337F33333FFFFFF73333330FBFBF0000000333333378FFFF
      7777777333333330000033333333333333377777333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333333333333333333}
    NumGlyphs = 2
  end
  object op: TOpenDialog
    Filter = 'Arquivos de imagem |*.jpg;*.bmp|Todos os arquivos|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 320
    Top = 152
  end
end
