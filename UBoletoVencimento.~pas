unit UBoletoVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TfrmBoletoVencimento = class(TModeloComum)
    Label1: TLabel;
    edDataVencto: TMaskEdit;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    labTipo: TLabel;
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoletoVencimento: TfrmBoletoVencimento;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmBoletoVencimento.BtnOKClick(Sender: TObject);
begin
  inherited;
  try
  Strtodate(edDataVencto.Text);
  except
  erro('Digite uma data válida.  ');
  ModalResult := mrnone;
  edDataVencto.setfocus;
  end;
end;

end.
