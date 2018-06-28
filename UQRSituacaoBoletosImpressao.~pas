unit UQRSituacaoBoletosImpressao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQRSituacaoBoletosImpressao = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel17: TQRLabel;
    labtotal: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QRSituacaoBoletosImpressao: TQRSituacaoBoletosImpressao;

implementation

uses UBoletoRecibo, UDmBoleto, UFuncoes;

{$R *.DFM}

procedure TQRSituacaoBoletosImpressao.QRLabel1Print(sender: TObject;
  var Value: String);
begin
   VALUE := Application.Title+ ' ' + versaoexe;
end;

end.
