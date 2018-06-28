unit UfrmTermoImprimirOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmTermoImprimirOpcoes = class(TModeloComum)
    bvl1: TBevel;
    rbTermo: TRadioButton;
    rbConfissao: TRadioButton;
    btnBtnOK: TBitBtn;
    btn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTermoImprimirOpcoes: TfrmTermoImprimirOpcoes;

implementation

{$R *.dfm}

end.
