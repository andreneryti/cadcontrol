unit UQRConfissaoDivida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, DB, DBClient, ExtCtrls,
  jpeg;

type
  TQRConfissaoDivida = class(TModeloRelatorio)
    dsDsRelTermo: TDataSource;
    cdsRelTermo: TClientDataSet;
    cdsRelTermovalor: TFloatField;
    TitleBand1: TQRBand;
    ricTexto1: TQRRichText;
    ChildBand2: TQRChildBand;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    ChildBand1: TQRChildBand;
    ricTexto2: TQRRichText;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    labrodape1: TQRLabel;
    labrodape2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    labempresa: TQRLabel;
    labSubtitulo: TQRLabel;
    imglogo: TQRImage;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData4: TQRSysData;
    LabtotPags: TQRLabel;
    SummaryBand1: TQRBand;
    cdsRelTermoparcela: TIntegerField;
    cdsRelTermoperiodo: TStringField;
    cdsRelTermodatavencto: TDateField;
    cdsRelTermodatapagto: TDateField;
    cdsRelTermorecibo: TStringField;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    cdsRelTermovalorpago: TFloatField;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRConfissaoDivida: TQRConfissaoDivida;

implementation

uses Udmconexao, UDMAssociado;

{$R *.dfm}

procedure TQRConfissaoDivida.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  inherited;
value := 'Rio de janeiro, ' + FormatDatetime('dd "de" mmmm "de" yyyy "."',Dataatual);
end;

procedure TQRConfissaoDivida.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if value ='0,00' then
     value :='';
end;

end.
