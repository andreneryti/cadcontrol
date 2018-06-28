unit UQRParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQRParcelamento = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    LABLOCALIDADE: TQRLabel;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    labExercicio: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    labnome: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    labdata: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    labtotal: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel14: TQRLabel;
    labregistro: TQRLabel;
    procedure QRSysData2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRParcelamento: TQRParcelamento;

implementation

uses UDmFinancas;

{$R *.dfm}

procedure TQRParcelamento.QRSysData2Print(sender: TObject;
  var Value: String);
begin
  inherited;
QRSysData2.text:='';
end;

end.
