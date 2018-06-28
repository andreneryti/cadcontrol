unit UExtratoOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, ExtCtrls, WinSkinData, Buttons, Mask;

type
  TfrmExtratoOpcoes = class(TModeloComum)
    SkinData2: TSkinData;
    Bevel1: TBevel;
    cbtipo: TComboBox;
    edAnoIni: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edAnoFim: TMaskEdit;
    Label3: TLabel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    cbTotais: TCheckBox;
    panelOpcoes: TPanel;
    cbVisualizar: TCheckBox;
    cbImprimir: TCheckBox;
    cbEmail: TCheckBox;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExtratoOpcoes: TfrmExtratoOpcoes;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmExtratoOpcoes.BtnOKClick(Sender: TObject);
begin
  inherited;
  If (edAnoIni.text='') or (edAnoFim.text='') then
  begin
      Aviso('Preencha o período corretamente. ');
      ModalResult := mrnone;
  end;

  if (cbVisualizar.checked = false) and (cbImprimir.checked = false) and (cbEmail.checked = false) then
  begin
      Aviso('Marque pelo menos uma das opções "Visualizar/Imprimir/E-mail". ');
      ModalResult := mrnone;
  end;
end;

procedure TfrmExtratoOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
    If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
     cbEmail.Enabled :=false;

end;

end.
