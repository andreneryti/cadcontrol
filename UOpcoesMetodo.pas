unit UOpcoesMetodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UCDefine, WinSkinData;

type
  TFormOpcoesMetodo = class(TForm)
    Panel1: TPanel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    radantigo: TRadioButton;
    radNovo: TRadioButton;
    Bevel1: TBevel;
    UCControls1: TUCControls;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpcoesMetodo: TFormOpcoesMetodo;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TFormOpcoesMetodo.FormCreate(Sender: TObject);
begin
  { If (UserId in [13,25]) then
        radantigo.Enabled := true;}
end;

end.
