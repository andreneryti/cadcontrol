unit UDadosGuiaComplementar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, JvEdit,
  JvTypedEdit, Buttons, Mask;

type
  TfrmDadosGuiaComplementar = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    edValorAntigo: TJvCurrencyEdit;
    Label3: TLabel;
    edValorContrib: TJvCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    edValoraPagar: TJvCurrencyEdit;
    Label7: TLabel;
    edDtVencimento: TMaskEdit;
    Bevel1: TBevel;
    procedure edValorPagoChange(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edValorAntigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edValorAntigoExit(Sender: TObject);
    procedure edValorAntigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosGuiaComplementar: TfrmDadosGuiaComplementar;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmDadosGuiaComplementar.edValorPagoChange(Sender: TObject);
begin
  inherited;
//  edValorPagar.value := edvalor.value - edValorPago.value;
end;

procedure TfrmDadosGuiaComplementar.BtnOKClick(Sender: TObject);
begin
  inherited;
//  edValorPagar.value := edvalor.value - edValorPago.value;
  If edValoraPagar.value <=0 then
  begin
     Aviso('Campo "Valor a pagar" não pode ser menor ou igual a zero.');
     ModalResult := mrnone;
  end

end;

procedure TfrmDadosGuiaComplementar.FormShow(Sender: TObject);
begin
  inherited;
  edValorAntigo.setfocus;
end;

procedure TfrmDadosGuiaComplementar.edValorAntigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If key = 13 then
      edValoraPagar.Value := edValorContrib.value - edValorAntigo.value;
end;

procedure TfrmDadosGuiaComplementar.edValorAntigoExit(Sender: TObject);
begin
  inherited;
      edValoraPagar.Value := edValorContrib.value - edValorAntigo.value;
end;

procedure TfrmDadosGuiaComplementar.edValorAntigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
If key = #13 then
      edValoraPagar.Value := edValorContrib.value - edValorAntigo.value;
end;

end.
