unit UQrNotificacaoExtraJud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls, DB, DBClient,
  jpeg;

type
  TQrNotificacaoExtraJud = class(TModeloRelatorio)
    ChildBand1: TQRChildBand;
    ricTexto2: TQRRichText;
    SummaryBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRShape17: TQRShape;
    QRExpr2: TQRExpr;
    DetailBand1: TQRBand;
    QRShape8: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    TitleBand1: TQRBand;
    ricTexto1: TQRRichText;
    cdsRelTermo: TClientDataSet;
    DsRelTermo: TDataSource;
    cdsRelTermoano: TIntegerField;
    cdsRelTermovalor: TFloatField;
    labrodape1: TQRLabel;
    labrodape2: TQRLabel;
    labNotif: TQRLabel;
    labempresa: TQRLabel;
    labSubtitulo: TQRLabel;
    QRShape1: TQRShape;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    procedure QRLabel7Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrNotificacaoExtraJud: TQrNotificacaoExtraJud;


implementation

uses UDMConexao;

{$R *.dfm}

procedure TQrNotificacaoExtraJud.QRLabel7Print(sender: TObject;
  var Value: String);
begin
  inherited;
value := 'Rio de janeiro, ' + FormatDatetime('dd "de" mmmm "de" yyyy "."',Dataatual);  
end;

end.
