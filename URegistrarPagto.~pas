unit URegistrarPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, JvEdit, JvTypedEdit, Mask,
  ExtCtrls, WinSkinData;

type
  TfrmRegistrarPagto = class(TModeloComum)
    Label2: TLabel;
    labguia: TLabel;
    labVencimento: TLabel;
    Label1: TLabel;
    labTotal: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    edDtreceb: TMaskEdit;
    Label7: TLabel;
    edValorPago: TJvCurrencyEdit;
    Label8: TLabel;
    edDtCredito: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edValorEncargos: TJvCurrencyEdit;
    edValorMultapaga: TJvCurrencyEdit;
    edValorJurosPago: TJvCurrencyEdit;
    edValorCorrecaoPaga: TJvCurrencyEdit;
    edValorDescPago: TJvCurrencyEdit;
    cbFormapagto: TComboBox;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistrarPagto: TfrmRegistrarPagto;
  valorprinc:real;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmRegistrarPagto.BtnOKClick(Sender: TObject);
begin
  inherited;
  try
    strtodate(edDtreceb.Text);
  except
    Aviso('Data de Recebimento inválida. ');
    modalresult := mrnone;
    abort;
  end;

  try
    strtodate(edDtCredito.Text);
  except
    Aviso('Data de Crédito inválida. ');
    modalresult := mrnone;
    abort;
  end;

  if edDtreceb.Text ='  /  /    ' then
  begin
      Aviso('Data de Recebimento não pode ser vazia. ');
      modalresult := mrnone;
  end
  else
  if edDtCredito.Text ='  /  /    ' then
  begin
      Aviso('Data do crédito não pode ser vazia. ');
      modalresult := mrnone;
  end
  else
  if edValorPago.Value = 0 then
  begin
      Aviso('Valor pago não pode ser nulo. ');
      modalresult := mrnone;
  end
  else
  if cbFormapagto.Text='' then
  begin
      Aviso('Forma de Pagamento não pode ser vazia. ');
      modalresult := mrnone;
  end
  else
  if strtofloat(floattostr(edValorPago.Value)) < strtofloat(labTotal.caption)then
  begin
      if not confirma ('Valor pago é menor que o valor que deveria ser pago. '+#13+'Confirma a baixa do pagamento?') then
         modalresult := mrnone;
  end
  else
  begin
     If not confirma('Confirma dados de pagamento? ') then
       modalresult := mrnone;
  end;

end;

procedure TfrmRegistrarPagto.FormShow(Sender: TObject);
begin
  inherited;
  edDtreceb.setfocus;
end;

end.
