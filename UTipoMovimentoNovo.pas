unit UTipoMovimentoNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons;

type
  TfrmTipoMovimentoNovo = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    editDescricao: TEdit;
    Bevel1: TBevel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoMovimentoNovo: TfrmTipoMovimentoNovo;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmTipoMovimentoNovo.BtnOKClick(Sender: TObject);
begin
  inherited;
  if editDescricao.text='' then
  begin
     Aviso('Campo Descriçao do Tipo de Movimento não pode ser vazio.');
     ModalResult := mrnone;
     editDescricao.Setfocus;
     abort;
  end;

end;

procedure TfrmTipoMovimentoNovo.FormShow(Sender: TObject);
begin
  inherited;
  editDescricao.SetFocus;
end;

end.
