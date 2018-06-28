unit U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls;

type
  TfrmSimulacaoGuia = class(TModeloComum)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimulacaoGuia: TfrmSimulacaoGuia;

implementation

{$R *.dfm}

procedure TfrmSimulacaoGuia.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
