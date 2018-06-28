unit UQR_Movimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQR_Movimentacao = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    labRegistro: TQRLabel;
    labNome: TQRLabel;
    QRLabel5: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QR_Movimentacao: TQR_Movimentacao;

implementation

uses UDMAssociado;

{$R *.dfm}

end.
