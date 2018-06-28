unit ULotesAtualizarValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmLotesAtualizarValores = class(TModeloComum)
    RadioButton1: TRadioButton;
    Bevel1: TBevel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn3: TBitBtn;
    BtnOK: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLotesAtualizarValores: TfrmLotesAtualizarValores;

implementation

{$R *.dfm}

end.
