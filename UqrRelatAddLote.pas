unit UqrRelatAddLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls, DB, DBClient;

type
  TqrRelatAddLote = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    labtitulo: TQRLabel;
    labsubtitulo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    txtregistro: TQRDBText;
    txtnome: TQRDBText;
    txtmotivo: TQRDBText;
    QRLabel5: TQRLabel;
    QRSysData4: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qrRelatAddLote: TqrRelatAddLote;

implementation

uses UInadimplencia;

{$R *.dfm}

{ TqrRelatAddLote }

end.
