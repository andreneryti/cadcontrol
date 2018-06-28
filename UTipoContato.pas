unit UTipoContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Buttons, WinSkinData;

type
  TfrmTipoContato = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    editTipoContato: TEdit;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoContato: TfrmTipoContato;

implementation

{$R *.dfm}

procedure TfrmTipoContato.FormShow(Sender: TObject);
begin
  inherited;
  editTipoContato.Setfocus;
end;

end.
