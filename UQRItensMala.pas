unit UQRItensMala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQRItensMala = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    labSubtitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData4: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRItensMala: TQRItensMala;

implementation

uses UMalaDiretaVisualizar;

{$R *.dfm}

end.
