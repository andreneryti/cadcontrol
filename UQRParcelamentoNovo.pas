unit UQRParcelamentoNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQRParcelamentoNovo = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    LABLOCALIDADE: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel14: TQRLabel;
    labregistro: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    DetailBand1: TQRBand;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape4: TQRShape;
    labnome: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    labdata: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRParcelamentoNovo: TQRParcelamentoNovo;

implementation

uses UNovoAssoc;

{$R *.dfm}

procedure TQRParcelamentoNovo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
   QRSysData2.text:='';
end;

end.
