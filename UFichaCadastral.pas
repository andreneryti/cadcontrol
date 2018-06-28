unit UFichaCadastral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TQRFichaCadastral = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    labEmpresa: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel21: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel37: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel38: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel42: TQRLabel;
    labTppessoa: TQRLabel;
    labSituacao: TQRLabel;
    labEstCivil: TQRLabel;
    labRepres: TQRLabel;
    memoSind: TQRMemo;
    memoRelacs: TQRMemo;
    memoSeg: TQRMemo;
    labEnderTipo: TQRLabel;
    labEnderLogradouro: TQRLabel;
    labEnderNumero: TQRLabel;
    labEnderComplemento: TQRLabel;
    labEnderBairro: TQRLabel;
    labEnderCidade: TQRLabel;
    labEnderEstado: TQRLabel;
    labTel: TQRLabel;
    labCel: TQRLabel;
    labTelEmerg: TQRLabel;
    labfax: TQRLabel;
    labEmail: TQRLabel;
    labSite: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRFichaCadastral: TQRFichaCadastral;

implementation

uses UDMAssociado;

{$R *.dfm}

procedure TQRFichaCadastral.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
    If   Length(DMAssociado.cdsAssocCPFCNPJ.value) > 13 then
       Qrlabel6.caption :='CNPJ'
    else
       Qrlabel6.caption :='CPF';
end;

end.
