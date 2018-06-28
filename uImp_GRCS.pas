unit uImp_GRCS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TImp_GRCS = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    qrlMensa: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape75: TQRShape;
    qrlValor1: TQRLabel;
    qrlMulta1: TQRLabel;
    qrlCorrecao1: TQRLabel;
    qrlAbatimento2: TQRLabel;
    qrlDesconto2: TQRLabel;
    qrlMulta2: TQRLabel;
    qrlCorrecao2: TQRLabel;
    qrlTotal2: TQRLabel;
    qrlExercicio1: TQRLabel;
    qrlVencimento1: TQRLabel;
    qrlVencimento3: TQRLabel;
    qrmMensagem: TQRRichText;
    qrlEmpresa1: TQRLabel;
    qrlEndereco1: TQRLabel;
    qrlBairro1: TQRLabel;
    qrlCEP1: TQRLabel;
    qrlMunicipio1: TQRLabel;
    qrlNumero1: TQRLabel;
    qrlComplemento1: TQRLabel;
    qrlUF1: TQRLabel;
    qrlLocal: TQRLabel;
    qrlCedente: TQRLabel;
    qrlDt_Documento: TQRLabel;
    qrlNum_Documento: TQRLabel;
    qrlContrtibuinte3: TQRLabel;
    qrlSicas1: TQRLabel;
    qrlCap_Social1: TQRLabel;
    QRImage7: TQRImage;
    QRImage3: TQRImage;
    QRLabel3: TQRLabel;
    qrlCNPJ: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
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
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape28: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape29: TQRShape;
    QRLabel29: TQRLabel;
    QRShape30: TQRShape;
    QRLabel30: TQRLabel;
    QRShape37: TQRShape;
    QRLabel31: TQRLabel;
    QRShape38: TQRShape;
    QRLabel33: TQRLabel;
    QRShape23: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    qrlTotal1: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    qrlRep_Numerica1: TQRLabel;
    QRShape98: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel54: TQRLabel;
    qrlRep_Numerica2: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    qrlSicas3: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel190: TQRLabel;
    qrlDt_Precessamento: TQRLabel;
    QRLabel191: TQRLabel;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    qrlValor2: TQRLabel;
    QRLabel192: TQRLabel;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    qrlUsoBanco: TQRLabel;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRShape188: TQRShape;
    QRLabel196: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    QRShape193: TQRShape;
    QRLabel56: TQRLabel;
    QRShape194: TQRShape;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    qrlAbatimento1: TQRLabel;
    qrlDesconto1: TQRLabel;
    qrlExecicio2: TQRLabel;
    imgCodigoBarras: TQRImage;
    qrlSacado1: TQRLabel;
    qrlContrtibuinte1: TQRLabel;
    qrlEnd_Sacado1: TQRLabel;
    qrlNum_Sacado1: TQRLabel;
    qrlComp_Sacado1: TQRLabel;
    qrlCEP_Sacado1: TQRLabel;
    qrlMuni_Sacado1: TQRLabel;
    qrlBairro_Sacado1: TQRLabel;
    qrlUF_Sacado1: TQRLabel;
    qrlCNAE1: TQRLabel;
    qrlVencimento2: TQRLabel;
    qrlTotal3: TQRLabel;
    qrlContrtibuinte2: TQRLabel;
    qrlSicas2: TQRLabel;
    qrmSacado: TQRMemo;
    QRLabel34: TQRLabel;
    Via1: TQRImage;
    Via2: TQRImage;
    qrlCap_Social2: TQRLabel;
    qrmMensagemContrib1: TQRRichText;
    QRLabel42: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    procedure qrlDesconto1Print(sender: TObject; var Value: String);
    procedure qrlValor1Print(sender: TObject; var Value: String);
    procedure qrlAbatimento1Print(sender: TObject; var Value: String);
    procedure qrlMulta1Print(sender: TObject; var Value: String);
    procedure qrlCorrecao1Print(sender: TObject; var Value: String);
    procedure qrlTotal1Print(sender: TObject; var Value: String);
    procedure qrlValor2Print(sender: TObject; var Value: String);
    procedure qrlAbatimento2Print(sender: TObject; var Value: String);
    procedure qrlDesconto2Print(sender: TObject; var Value: String);
    procedure qrlMulta2Print(sender: TObject; var Value: String);
    procedure qrlCorrecao2Print(sender: TObject; var Value: String);
    procedure qrlTotal2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  Imp_GRCS: TImp_GRCS;

implementation

{$R *.DFM}

procedure TImp_GRCS.qrlDesconto1Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlValor1Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlAbatimento1Print(sender: TObject;
  var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlMulta1Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlCorrecao1Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlTotal1Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlValor2Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlAbatimento2Print(sender: TObject;
  var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlDesconto2Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlMulta2Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlCorrecao2Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

procedure TImp_GRCS.qrlTotal2Print(sender: TObject; var Value: String);
begin
   If Value = '0,00' Then Value := '';
end;

end.
