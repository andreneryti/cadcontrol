unit UValorContribNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls, Mask,
  JvToolEdit, JvLookup, JvEdit, JvTypedEdit, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TfrmValorContribNovo = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    cbTipoPessoa: TJvLookupEdit;
    cbTipoContrib: TJvLookupEdit;
    Label2: TLabel;
    cbTipoEmpresa: TJvLookupEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    editano: TMaskEdit;
    editVencimento: TMaskEdit;
    editValor: TJvCurrencyEdit;
    editFaixa: TJvCurrencyEdit;
    Image1: TImage;
    editAliquota: TMaskEdit;
    Bevel1: TBevel;
    sdsEmp_Regiao: TSQLDataSet;
    dspEmp_Regiao: TDataSetProvider;
    cdsEmp_regiao: TClientDataSet;
    cdsEmp_regiaoEMP_ID: TIntegerField;
    cdsEmp_regiaoREGIAO: TStringField;
    dsEmp_Regiao: TDataSource;
    sdsTp_Pessoa: TSQLDataSet;
    dspTp_Pessoa: TDataSetProvider;
    cdsTp_Pessoa: TClientDataSet;
    cdsTp_PessoaTP_ASSOC_ID: TIntegerField;
    cdsTp_PessoaTP_ASSOC_DESC: TStringField;
    dsTp_Pessoa: TDataSource;
    sdsTpContrib: TSQLDataSet;
    dspTpContrib: TDataSetProvider;
    cdsTpContrib: TClientDataSet;
    cdsTpContribTP_CONTRIB_ID: TIntegerField;
    cdsTpContribTP_CONTRIB_DESCRICAO: TStringField;
    dsTpContrib: TDataSource;
    sdsQtdeCad: TSQLDataSet;
    dspQtdeCad: TDataSetProvider;
    cdsQtdeCad: TClientDataSet;
    cdsQtdeCadQTDE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure cbTipoEmpresaExit(Sender: TObject);
    procedure cbTipoContribExit(Sender: TObject);
    procedure cbTipoPessoaExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorContribNovo: TfrmValorContribNovo;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmValorContribNovo.FormShow(Sender: TObject);
begin
  inherited;
  cdsEmp_regiao.open;
  cdsTpContrib.open;
  cdsTp_Pessoa.open;

  cdsTp_Pessoa.First;
  cdsTpContrib.First;
  cdsEmp_regiao.First;

  cbTipoContrib.text := cdsTpContribTP_CONTRIB_DESCRICAO.value;
  cbTipoPessoa.text := cdsTp_PessoaTP_ASSOC_DESC.value;
  cbTipoEmpresa.text := cdsEmp_regiaoREGIAO.value;

  cbTipoEmpresa.Setfocus;

end;

procedure TfrmValorContribNovo.cbTipoEmpresaExit(Sender: TObject);
begin
  inherited;
  If not cdsEmp_regiao.Locate('REGIAO', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := cdsEmp_regiaoREGIAO.value;

end;

procedure TfrmValorContribNovo.cbTipoContribExit(Sender: TObject);
begin
  inherited;
  If not cdsTpContrib.Locate('TP_CONTRIB_DESCRICAO', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := cdsTpContribTP_CONTRIB_DESCRICAO.value;

end;

procedure TfrmValorContribNovo.cbTipoPessoaExit(Sender: TObject);
begin
  inherited;
  If not cdsTp_Pessoa.Locate('TP_ASSOC_DESC', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := cdsTp_PessoaTP_ASSOC_DESC.value;
end;

procedure TfrmValorContribNovo.BtnOKClick(Sender: TObject);
begin
  inherited;
  if cbTipoEmpresa.text='' then
  begin
     Aviso('Campo Empresa não pode ser vazio.');
     ModalResult := mrnone;
     cbTipoEmpresa.Setfocus;
     abort;
  end;

  if cbTipoContrib.text='' then
  begin
     Aviso('Campo Tipo de Contribuição não pode ser vazio.');
     ModalResult := mrnone;
     cbTipoContrib.Setfocus;
     abort;
  end;

  if cbTipoPessoa.text='' then
  begin
     Aviso('Campo Tipo de Pessoa não pode ser vazio.');
     ModalResult := mrnone;
     cbTipoPessoa.Setfocus;
     abort;
  end;

  if editano.text='' then
  begin
     Aviso('Campo Ano não pode ser vazio.');
     ModalResult := mrnone;
     Editano.Setfocus;
     abort;
  end;

  Try
     Strtodate(editVencimento.Text);
  except
     Aviso('Campo Vencimento inválido.');
     ModalResult := mrnone;
     editVencimento.Setfocus;
     abort;
  end;


  cdsQtdeCad.close;
  cdsQtdeCad.Params.ParamByName('tipoassoc').value := cdsTp_PessoaTP_ASSOC_ID.value;
  cdsQtdeCad.Params.ParamByName('tipocontrib').value := cdsTpContribTP_CONTRIB_ID.value;
  cdsQtdeCad.Params.ParamByName('emp_id').value := cdsEmp_regiaoEMP_ID.value;
  cdsQtdeCad.Params.ParamByName('ano').value := strtoint(editano.text);
  cdsQtdeCad.Params.ParamByName('faixa').value := editFaixa.Value;
  cdsQtdeCad.open;

  If cdsQtdeCadQTDE.value > 0 then
  begin
     Aviso('Já existe um valor cadasatrado com esta faixa de capital '+#13+'para esta Empresa/Contribuição/Tipo de Pessoa. ');
     ModalResult := mrnone;
     abort;
  end;
end;

end.
