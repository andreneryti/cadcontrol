unit UQRConfissaoDividaParcelNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, jpeg, QRCtrls, QuickRpt, DB, DBClient,
  ExtCtrls;

type
  TQRConfissaoDividaParcelNovo = class(TModeloRelatorio)
    cdsRelTermo: TClientDataSet;
    cdsRelTermoperiodo: TStringField;
    cdsRelTermodatapagto: TDateField;
    cdsRelTermorecibo: TStringField;
    cdsRelTermovalorpago: TFloatField;
    TitleBand1: TQRBand;
    ricTexto1: TQRRichText;
    SummaryBand1: TQRBand;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
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
    DetailBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand2: TQRChildBand;
    QRShape8: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand1: TQRChildBand;
    ricTexto2: TQRRichText;
    labrodape1: TQRLabel;
    labrodape2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData7: TQRSysData;
    LabtotPags: TQRLabel;
    labempresa: TQRLabel;
    labSubtitulo: TQRLabel;
    imglogo: TQRImage;
    cdsRelTermodataparapagto: TDateField;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRConfissaoDividaParcelNovo: TQRConfissaoDividaParcelNovo;

implementation

uses UPrincipal, UDMConexao;

{$R *.dfm}

procedure TQRConfissaoDividaParcelNovo.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if value ='0,00' then
     value :='';
end;

procedure TQRConfissaoDividaParcelNovo.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  inherited;
value := 'Rio de janeiro, ' + FormatDatetime('dd "de" mmmm "de" yyyy "."',Dataatual);
end;

end.
