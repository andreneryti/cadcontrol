unit UQR_Envelope_MG_TipoOficio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQR_Envelope_MG_TipoOficio = class(TQuickRep)
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
  QR_Envelope_MG_TipoOficio: TQR_Envelope_MG_TipoOficio;

implementation

{$R *.DFM}

end.
