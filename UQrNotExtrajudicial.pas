unit UQrNotExtrajudicial;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, ufuncoes, DB, DBClient, udmConexao ;

type
  TQrNotExtrajudicial = class(TQuickRep)
    DsRelTermo: TDataSource;
    cdsRelTermo: TClientDataSet;
    cdsRelTermoano: TIntegerField;
    cdsRelTermovalor: TFloatField;
    TitleBand1: TQRBand;
    ricTexto1: TQRRichText;
    labempresa: TQRLabel;
    labSubtitulo: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    DetailBand1: TQRBand;
    QRShape8: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRShape17: TQRShape;
    QRExpr2: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    labrodape1: TQRLabel;
    labrodape2: TQRLabel;
    QRShape1: TQRShape;
    ChildBand1: TQRChildBand;
    ricTexto2: TQRRichText;
    labNotif: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QrNotExtrajudicial: TQrNotExtrajudicial;

implementation

{$R *.DFM}

procedure TQrNotExtrajudicial.QRLabel1Print(sender: TObject;
  var Value: String);
begin
   VALUE := Application.Title+ ' ' + versaoexe;
end;

procedure TQrNotExtrajudicial.QRLabel2Print(sender: TObject;
  var Value: String);
begin
   value := 'Rio de janeiro, ' + FormatDatetime('dd "de" mmmm "de" yyyy "."',Dataatual);
end;

end.
