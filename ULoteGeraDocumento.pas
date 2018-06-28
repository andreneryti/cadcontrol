unit ULoteGeraDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Buttons, WinSkinData;

type
  TfrmLoteGeraDocumento = class(TModeloComum)
    Panel2: TPanel;
    Bevel1: TBevel;
    radNot1: TRadioButton;
    radEtiq: TRadioButton;
    Label1: TLabel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    rbMascaraAr: TRadioButton;
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoteGeraDocumento: TfrmLoteGeraDocumento;

implementation

{$R *.dfm}

procedure TfrmLoteGeraDocumento.BitBtn6Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
