unit UNovaMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  FMTBcd, DB, DBClient, Provider, SqlExpr, DBCtrls, Mask;

type
  TfrmNovaMovimentacao = class(TModeloInserir)
    Label2: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBMemo;
    cbTipo: TDBLookupComboBox;
    sdsTpMoviment: TSQLDataSet;
    dspTpMovimento: TDataSetProvider;
    cdsTpMovimento: TClientDataSet;
    dsTpMovimento: TDataSource;
    cdsTpMovimentoTP_MOV_ID: TIntegerField;
    cdsTpMovimentoTP_MOV_DESCRICAO: TStringField;
    labPedido: TLabel;
    dbedtDTPedido: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure cbTipoCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovaMovimentacao: TfrmNovaMovimentacao;

implementation

uses UDMAssociado, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmNovaMovimentacao.FormCreate(Sender: TObject);
begin
  inherited;
  cdsTpMovimento.Open;
end;

procedure TfrmNovaMovimentacao.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsMovimentTP_MOV_ID.value = 0 then
  begin
      Aviso('Tipo de Movimentação é um campo obrigatório. ');
      cbTipo.Setfocus;
      modalresult := mrnone;
  end;
end;

procedure TfrmNovaMovimentacao.cbTipoCloseUp(Sender: TObject);
begin
  inherited;
  if cdsTpMovimentoTP_MOV_ID.value = 3 then
  begin
      dbedtDTPedido.Visible :=True;
      labPedido.Visible :=True;
  end
  else
  begin
      dbedtDTPedido.Visible :=false;
      labPedido.Visible :=false;
  end;

end;

end.
