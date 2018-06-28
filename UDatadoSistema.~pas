unit UDatadoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, StdCtrls, Mask, WinSkinData, Buttons,
  ExtCtrls;

type
  TfrmDatadoSistema = class(TModeloInserir)
    Label1: TLabel;
    ediDataSistema: TMaskEdit;
    Label2: TLabel;
    labDataHoje: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatadoSistema: TfrmDatadoSistema;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TfrmDatadoSistema.FormShow(Sender: TObject);
begin
  inherited;
   labDataHoje.caption:= datetostr(now);
   ediDataSistema.Text := datetostr( DataAtual);
   ediDataSistema.Setfocus;

end;

procedure TfrmDatadoSistema.btGravarClick(Sender: TObject);
begin
  inherited;
  DataAtual := strtodate(ediDataSistema.text);
  Close;
end;

end.
