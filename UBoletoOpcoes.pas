unit UBoletoOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, WinSkinData, Buttons;

type
  TfrmBoletoOpcoes = class(TModeloComum)
    radSind: TRadioButton;
    radConf: TRadioButton;
    Bevel1: TBevel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    panelOpcoes: TPanel;
    cbVisualizar: TCheckBox;
    cbImprimir: TCheckBox;
    cbEmail: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoletoOpcoes: TfrmBoletoOpcoes;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TfrmBoletoOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
  If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
     cbEmail.Enabled :=false;

 // If (copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S') {and (UserId <>13)} then
   //  cbVisualizar.Enabled :=false;

end;

end.
