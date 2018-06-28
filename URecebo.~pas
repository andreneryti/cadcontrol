unit URecebo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TQrRecibo = class(TQuickRep)
    DetailBand1: TQRBand;
    labrecibo: TQRLabel;
    LabEndereco1: TQRLabel;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    qrlTotal1: TQRLabel;
    labpagto: TQRLabel;
    qrData: TQRLabel;
    QRShape17: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape16: TQRShape;
    QRShape5: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    qrlEmpresa: TQRLabel;
    labitens: TQRMemo;
    qrmCedente1: TQRMemo;
    QRShape20: TQRShape;
    QRShape25: TQRShape;
    QRLabel2: TQRLabel;
    labEndereco2: TQRLabel;
    labEndereco4: TQRLabel;
    labEndereco3: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage2: TQRImage;
    qrValorPago: TQRLabel;
    QRLabel13: TQRLabel;
    qrData2: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrmCedente2: TQRMemo;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape18: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    labitens2: TQRMemo;
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure qrValorPagoPrint(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure qrlEmpresaPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  QrRecibo: TQrRecibo;

implementation

uses UFuncoes, UDMConexao;

{$R *.DFM}

procedure TQrRecibo.QRLabel16Print(sender: TObject; var Value: String);
begin
 value := qrlEmpresa.caption;
end;

procedure TQrRecibo.QRLabel9Print(sender: TObject; var Value: String);
begin
   value := LabEndereco1.caption;
end;

procedure TQrRecibo.QRLabel18Print(sender: TObject; var Value: String);
begin
   value := LabEndereco2.caption;
end;

procedure TQrRecibo.QRLabel20Print(sender: TObject; var Value: String);
begin
   value := LabEndereco3.caption;
end;

procedure TQrRecibo.QRLabel19Print(sender: TObject; var Value: String);
begin
   value := LabEndereco4.caption;
end;

procedure TQrRecibo.QRLabel5Print(sender: TObject; var Value: String);
begin
   value := labrecibo.caption;
end;

procedure TQrRecibo.qrValorPagoPrint(sender: TObject; var Value: String);
begin
  value := qrlTotal1.caption;
end;

procedure TQrRecibo.QRLabel13Print(sender: TObject; var Value: String);
begin
  value := labpagto.caption;
end;

procedure TQrRecibo.qrlEmpresaPrint(sender: TObject; var Value: String);
begin
{   if pos('Estado', qrlEmpresa.Caption) > 0 then
   begin
      FreeAndNil(QRImage1);
      FreeAndNil(QRImage2);
   end;}
end;

end.
