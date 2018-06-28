unit UnitRelatParcelOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmRelatParcOpcoes = class(TForm)
    Panel1: TPanel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    radTotais: TRadioButton;
    radAtivos: TRadioButton;
    Bevel1: TBevel;
    comboTipo: TComboBox;
    comboFiltro: TComboBox;
    Label1: TLabel;
    cbTipoParc1: TComboBox;
    Label2: TLabel;
    procedure radAtivosClick(Sender: TObject);
    procedure radTotaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatParcOpcoes: TfrmRelatParcOpcoes;

implementation

{$R *.dfm}

procedure TfrmRelatParcOpcoes.radAtivosClick(Sender: TObject);
begin
  comboTipo.Enabled :=false;
  comboFiltro.Enabled :=false;
  cbTipoParc1.Enabled :=false;
end;

procedure TfrmRelatParcOpcoes.radTotaisClick(Sender: TObject);
begin
  comboTipo.Enabled :=true;
  comboFiltro.Enabled :=true;
  cbTipoParc1.Enabled :=true;

end;

end.
