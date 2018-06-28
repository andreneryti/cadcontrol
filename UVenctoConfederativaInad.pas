unit UVenctoConfederativaInad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TFrmVenctoConfederativaInad = class(TForm)
    Panel1: TPanel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    edDataVenc: TMaskEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVenctoConfederativaInad: TFrmVenctoConfederativaInad;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TFrmVenctoConfederativaInad.FormShow(Sender: TObject);
begin
   edDataVenc.Text := datetostr(IncDay(DataAtual,15));
end;

procedure TFrmVenctoConfederativaInad.BtnOKClick(Sender: TObject);
begin
   try
      Strtodate(edDataVenc.Text);
   Except
      Aviso('Data inválida. ');
      edDataVenc.setfocus;
      ModalResult := mrnone;
   end;
end;

end.
