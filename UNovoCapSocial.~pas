unit UNovoCapSocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls;

type
  TfrmNovoCapSocial = class(TModeloInserir)
    Label1: TLabel;
    edDtCadastro: TDBEdit;
    Label2: TLabel;
    edDtCapSocial: TDBEdit;
    Label3: TLabel;
    edValor: TDBEdit;
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoCapSocial: TfrmNovoCapSocial;

implementation

uses UDMAssociado, UFuncoes;

{$R *.dfm}

procedure TfrmNovoCapSocial.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsCapSocialDT_CADASTRO.Value = 0 then
  begin
      Aviso('Data de cadastro não pode ser vazia. ');
      edDtCadastro.setfocus;
      Abort;
  end;
  If DMAssociado.cdsCapSocialDT_CAPSOCIAL.Value = 0 then
  begin
      Aviso('Data do Cap.Social não pode ser vazia. ');
      edDtCapSocial.setfocus;
      Abort;
  end;
  If DMAssociado.cdsCapSocialVALOR.asfloat = 0 then
  begin
      Aviso('Valor não pode ser nulo. ');
      edValor.setfocus;
      Abort;
  end;
end;

end.
