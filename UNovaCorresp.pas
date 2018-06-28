unit UNovaCorresp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Mask, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfrmNovaCorresp = class(TModeloInserir)
    Label3: TLabel;
    Label4: TLabel;
    edDtCriacao: TDBEdit;
    Label5: TLabel;
    edDtEnvio: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    edDtSituacao: TDBEdit;
    cbTipo: TDBLookupComboBox;
    cbSituacao: TDBLookupComboBox;
    sdsSituacao: TSQLDataSet;
    dspSituacao: TDataSetProvider;
    cdsSituacao: TClientDataSet;
    dsSituacao: TDataSource;
    dsTipoCorresp: TDataSource;
    cdsTipoCorresp: TClientDataSet;
    dspTipoCorresp: TDataSetProvider;
    sdsTipoCorresp: TSQLDataSet;
    cdsSituacaoSIT_CORRESP_ID: TIntegerField;
    cdsSituacaoSIT_CORRESP_DESC: TStringField;
    cdsTipoCorrespTP_CORRESP_ID: TIntegerField;
    cdsTipoCorrespTP_CORRESP_DESCR: TStringField;
    cdsTipoCorrespNOME_MODELO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovaCorresp: TfrmNovaCorresp;

implementation

uses UDMAssociado, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmNovaCorresp.FormShow(Sender: TObject);
begin
  inherited;
  cdsSituacao.Open;
  cdsTipoCorresp.Open;
end;

procedure TfrmNovaCorresp.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsCorrespTP_CORRESP_ID.value = 0 then
  begin
    Aviso('Campo "Tipo de Correspondência" não pode ser vazio.');
    cbTipo.setfocus;
    modalresult:=mrnone;
  end
  else
  If DMAssociado.cdsCorrespSIT_CORRESP_ID.value = 0 then
  begin
     Aviso('Campo "Situação de Correspondência" não pode ser vazio.');
     cbSituacao.setfocus;
     modalresult:=mrnone;
  end
  else
  If DMAssociado.cdsCorrespDT_ENVIO.value = DataNula then
  begin
     Aviso('Campo "Data de Envio" não pode ser vazio.');
     edDtEnvio.setfocus;
     modalresult:=mrnone;
  end
  else
  If DMAssociado.cdsCorrespDT_CRIACAO.value = DataNula then
  begin
     Aviso('Campo "Data de Criação da Carta" não pode ser vazio.');
     edDtCriacao.setfocus;
     modalresult:=mrnone;
  end;
end;

end.
