unit UQrRepasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls, DB, DBClient;

type
  TQrRepasse = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Labtotal: TQRLabel;
    labDataRepasse: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    labPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    cdsRepasse: TClientDataSet;
    cdsRepasseregistro: TStringField;
    cdsRepassenome: TStringField;
    cdsRepassedescricao: TStringField;
    cdsRepasseguia: TStringField;
    cdsRepassedatacredito: TDateField;
    cdsRepassevalorpago: TFloatField;
    cdsRepassevalorrepasse: TFloatField;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRDBText8: TQRDBText;
    cdsRepassesindicato: TStringField;
    labtotalpagto: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    labTotOriginal: TQRLabel;
    QRLabel19: TQRLabel;
    labTotEncargos: TQRLabel;
    cdsRepassevalororiginal: TFloatField;
    cdsRepasseencargos: TFloatField;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure QRLabel21Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrRepasse: TQrRepasse;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TQrRepasse.QRLabel21Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy"."', DataAtual);
end;

end.
