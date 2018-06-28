unit UQR_Envelope_A4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQR_Envelope_A4 = class(TQuickRep)
    TitleBand1: TQRBand;
    labregistro: TQRLabel;
    labAssociado: TQRLabel;
    labEndereco: TQRLabel;
    labBairroCidade: TQRLabel;
    labEstadoCep: TQRLabel;
  private

  public

  end;

var
  QR_Envelope_A4: TQR_Envelope_A4;

implementation

{$R *.DFM}

end.
