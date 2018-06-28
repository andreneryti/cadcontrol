unit UQR_Envelope_MG;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TQR_Envelope_MG = class(TQuickRep)
    TitleBand1: TQRBand;
    labregistro: TQRLabel;
    labAssociado: TQRLabel;
    labEndereco: TQRLabel;
    labBairroCidade: TQRLabel;
    labEstadoCep: TQRLabel;
    qrImgLogo: TQRImage;
    labCore: TQRLabel;
    procedure labregistroPrint(sender: TObject; var Value: String);
    procedure labEstadoCepPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  QR_Envelope_MG: TQR_Envelope_MG;

implementation

{$R *.DFM}

procedure TQR_Envelope_MG.labregistroPrint(sender: TObject;
  var Value: String);
begin
   if value = '/' then
      value := '';
end;

procedure TQR_Envelope_MG.labEstadoCepPrint(sender: TObject;
  var Value: String);
begin
   If value = 'labEstadoCep' then
      value :='';
end;

end.
