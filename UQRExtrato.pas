unit UQRExtrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQRExtrato = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    labEmpresa: TQRLabel;
    labtitulo: TQRLabel;
    QRLabel3: TQRLabel;
    labNome: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    labValorTitulo: TQRLabel;
    labMultaTitulo: TQRLabel;
    labJurosTitulo: TQRLabel;
    labCorrecaoTitulo: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    labsituacao: TQRDBText;
    labjuros: TQRDBText;
    labMulta: TQRDBText;
    labcorrecao: TQRDBText;
    labvalor: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    labValidade: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    labRegistro: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    labtotal: TQRLabel;
    labtotalsind: TQRLabel;
    labtotalconf: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    labtotalDevidoParcel: TQRLabel;
    QRLabel24: TQRLabel;
    labtotalTotal: TQRLabel;
    labtotalValor: TQRLabel;
    labTotalJuros: TQRLabel;
    labTotalMulta: TQRLabel;
    labTotalCorrecao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRExtrato: TQRExtrato;

implementation

uses UDmFinancas, UNovoAssoc;

{$R *.dfm}

end.
