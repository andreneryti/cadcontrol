unit UGerarPrevisao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Mask, WinSkinData, Buttons;

type
  TfrmGerarPrevisao = class(TModeloComum)
    radGerar: TRadioButton;
    radRegerar: TRadioButton;
    cbOpcao: TComboBox;
    edano: TMaskEdit;
    Label1: TLabel;
    labGerar: TLabel;
    Bevel2: TBevel;
    labregerar: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    cbTipo: TComboBox;
    procedure radGerarClick(Sender: TObject);
    procedure radRegerarClick(Sender: TObject);
    procedure cbOpcaoSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarPrevisao: TfrmGerarPrevisao;

implementation

{$R *.dfm}

procedure TfrmGerarPrevisao.radGerarClick(Sender: TObject);
begin
  inherited;
  labGerar.Visible := true;
  labregerar.Visible := false;
  cbOpcao.Top:=77;
  edano.Top:=77;
end;

procedure TfrmGerarPrevisao.radRegerarClick(Sender: TObject);
begin
  inherited;
  labGerar.Visible := false;
  labregerar.Visible := true;
  cbOpcao.Top:=101;
  edano.Top:=101;
end;

procedure TfrmGerarPrevisao.cbOpcaoSelect(Sender: TObject);
begin
  inherited;
  If cbOpcao.ItemIndex = 1 then
  begin
     edano.Clear;
     edano.Visible := true;
     edano.setfocus;
  end
  else
    edano.Visible := false;
end;

end.
