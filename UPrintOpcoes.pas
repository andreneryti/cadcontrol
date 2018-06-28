unit UPrintOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, ExtCtrls, Buttons, WinSkinData;

type
  TfrmPrintOpcoes = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    radView: TRadioButton;
    radPrint: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintOpcoes: TfrmPrintOpcoes;

implementation

{$R *.dfm}

end.
