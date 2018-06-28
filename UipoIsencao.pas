unit UipoIsencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, WinSkinData, Buttons;

type
  TfrmTipoIsencao = class(TModeloComum)
    cbInsecao: TRadioButton;
    cbSuperSimples: TRadioButton;
    Bevel1: TBevel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoIsencao: TfrmTipoIsencao;

implementation

{$R *.dfm}

end.
