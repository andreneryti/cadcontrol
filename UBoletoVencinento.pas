unit UBoletoVencinento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Mask, Buttons, WinSkinData;

type
  TfrmBoletoVencinento = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    radDataVenc: TRadioButton;
    radDataContrib: TRadioButton;
    edDataVenc: TMaskEdit;
    Bevel1: TBevel;
    procedure radDataVencClick(Sender: TObject);
    procedure radDataContribClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoletoVencinento: TfrmBoletoVencinento;

implementation

{$R *.dfm}

procedure TfrmBoletoVencinento.radDataVencClick(Sender: TObject);
begin
  inherited;
  edDataVenc.Enabled:=true;
  edDataVenc.SetFocus;
end;

procedure TfrmBoletoVencinento.radDataContribClick(Sender: TObject);
begin
  inherited;
  edDataVenc.Clear;
  edDataVenc.Enabled:=false;
end;

end.
