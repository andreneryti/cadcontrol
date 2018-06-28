unit UContribuicaoValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids, Mask, JvToolEdit, JvLookup, UCDefine;

type
  TfrmContribuicaoValores = class(TModeloComum)
    Panel2: TPanel;
    spNovo: TSpeedButton;
    spEditar: TSpeedButton;
    spExcluir: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    btSair: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    cbTipoPessoa: TJvLookupEdit;
    cbTipoContrib: TJvLookupEdit;
    cbTipoEmpresa: TJvLookupEdit;
    UCControls1: TUCControls;
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizaValores;
    procedure cbTipoPessoaButtonClick(Sender: TObject);
    procedure cbTipoPessoaCloseUp(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure cbTipoPessoaExit(Sender: TObject);
    procedure cbTipoContribExit(Sender: TObject);
    procedure cbTipoEmpresaExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spNovoClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContribuicaoValores: TfrmContribuicaoValores;

implementation

uses UDMGeral, UValorContribNovo, UFuncoes, SqlExpr, UDMConexao;

{$R *.dfm}

procedure TfrmContribuicaoValores.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmContribuicaoValores.FormShow(Sender: TObject);
begin
  inherited;
  DMGeral.cdsEmp_regiao.open;
  DMGeral.cdsTpContrib.open;
  DMGeral.cdsTp_Pessoa.open;

  DMGeral.cdsTp_Pessoa.First;
  DMGeral.cdsTpContrib.First;
  DMGeral.cdsEmp_regiao.First;

  cbTipoContrib.text := DMGeral.cdsTpContribTP_CONTRIB_DESCRICAO.value;
  cbTipoPessoa.text := DMGeral.cdsTp_PessoaTP_ASSOC_DESC.value;
  cbTipoEmpresa.text := DMGeral.cdsEmp_regiaoREGIAO.value;

  AtualizaValores;
end;

procedure TfrmContribuicaoValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMGeral.cdsTp_Pessoa.Close;
  DMGeral.cdsTpContrib.Close;
  DMGeral.cdsEmp_regiao.Close;
  DMGeral.cdsValorContrib.Close;
end;

procedure TfrmContribuicaoValores.AtualizaValores;
begin
  DMGeral.cdsValorContrib.close;
  DMGeral.cdsValorContrib.Params.ParamByName('tipoassoc').value := Dmgeral.cdsTp_PessoaTP_ASSOC_ID.value;
  DMGeral.cdsValorContrib.Params.ParamByName('tipocontrib').value := DMGeral.cdsTpContribTP_CONTRIB_ID.value;
  DMGeral.cdsValorContrib.Params.ParamByName('emp_id').value := DMGeral.cdsEmp_regiaoEMP_ID.value;
  DMGeral.cdsValorContrib.open;

  If Dmgeral.cdsTp_PessoaTP_ASSOC_DESC.value = 'Pessoa Física' then
  begin
    DBGrid1.Columns[3].Visible:=false;
    DBGrid1.Columns[4].Visible:=false;
  end
  else
  begin
    DBGrid1.Columns[3].Visible:=true;
    DBGrid1.Columns[4].Visible:=true;
  end

end;

procedure TfrmContribuicaoValores.cbTipoPessoaButtonClick(Sender: TObject);
begin
  inherited;
  AtualizaValores;
end;

procedure TfrmContribuicaoValores.cbTipoPessoaCloseUp(Sender: TObject);
begin
  inherited;
  AtualizaValores
end;

procedure TfrmContribuicaoValores.cbTipoPessoaChange(Sender: TObject);
begin
  inherited;
  AtualizaValores;
end;

procedure TfrmContribuicaoValores.cbTipoPessoaExit(Sender: TObject);
begin
  inherited;
  If not DMGeral.cdsTp_Pessoa.Locate('TP_ASSOC_DESC', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := DMGeral.cdsTp_PessoaTP_ASSOC_DESC.value;


end;

procedure TfrmContribuicaoValores.cbTipoContribExit(Sender: TObject);
begin
  inherited;
  If not DMGeral.cdsTpContrib.Locate('TP_CONTRIB_DESCRICAO', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := DMGeral.cdsTpContribTP_CONTRIB_DESCRICAO.value;
end;

procedure TfrmContribuicaoValores.cbTipoEmpresaExit(Sender: TObject);
begin
  inherited;
  If not DMGeral.cdsEmp_regiao.Locate('REGIAO', TJvLookupEdit(sender).Text,[]) then
      TJvLookupEdit(sender).Text := DMGeral.cdsEmp_regiaoREGIAO.value;
end;

procedure TfrmContribuicaoValores.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
  begin
    Tdbgrid(sender).Canvas.Brush.color := clwindow;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    Tdbgrid(sender).Canvas.Brush.Color := $00FFCECE;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if gdselected in State then
  begin
    Tdbgrid(sender).Canvas.Brush.Color := clNavy;
    Tdbgrid(sender).Canvas.Font.Color := clwhite;
    Tdbgrid(sender).Canvas.FillRect(Rect);
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TfrmContribuicaoValores.spNovoClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmValorContribNovo,frmValorContribNovo);
  if frmValorContribNovo.showmodal = mrok then
  begin
      DMGeral.PROC_VALORCONTRIB_UI.close;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR_CONTRIB_ID').value :=0;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('TP_ASSOC_ID').value :=frmValorContribNovo.cdsTp_PessoaTP_ASSOC_ID.value;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('EMP_ID').value :=frmValorContribNovo.cdsEmp_regiaoEMP_ID.value;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('TP_CONTRIB_ID').value :=frmValorContribNovo.cdsTpContribTP_CONTRIB_ID.value;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR').value :=frmValorContribNovo.editValor.value;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('ANO').value :=strtoint(frmValorContribNovo.editano.Text);
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VENCIMENTO').value :=strtodate(frmValorContribNovo.editVencimento.Text);
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('FAIXA_CAPITAL').value :=frmValorContribNovo.editFaixa.value;
      DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR_ALIQUOTA').value :=strtofloat(frmValorContribNovo.editAliquota.text);
      DMGeral.PROC_VALORCONTRIB_UI.ExecProc;
      DMGeral.dsValorContrib.Dataset.refresh;
  end;
  finally
  frmValorContribNovo.free;
  end;

end;

procedure TfrmContribuicaoValores.spEditarClick(Sender: TObject);
begin
  inherited;
  If  Dmgeral.cdsValorContrib.RecordCount > 0 then
  begin
      Try Application.CreateForm(TfrmValorContribNovo,frmValorContribNovo);
      frmValorContribNovo.cdsEmp_regiao.open;
      frmValorContribNovo.cdsTpContrib.open;
      frmValorContribNovo.cdsTp_Pessoa.open;
      frmValorContribNovo.Caption:='::: Edição de Valor de Contribuição :::';
      frmValorContribNovo.cdsTp_Pessoa.locate('TP_ASSOC_ID',Dmgeral.cdsValorContribTP_ASSOC_ID.value,[]);
      frmValorContribNovo.cbTipoPessoa.text := frmValorContribNovo.cdsTp_PessoaTP_ASSOC_DESC.value;
      frmValorContribNovo.cdsEmp_regiao.locate('emp_id',Dmgeral.cdsValorContribEMP_ID.value,[]);
      frmValorContribNovo.cbTipoEmpresa.text := frmValorContribNovo.cdsEmp_regiaoREGIAO.value;
      frmValorContribNovo.cdsTpContrib.locate('TP_CONTRIB_ID',Dmgeral.cdsValorContribTP_CONTRIB_ID.value,[]);
      frmValorContribNovo.cbTipoContrib.text := frmValorContribNovo.cdsTpContribTP_CONTRIB_DESCRICAO.value;
      frmValorContribNovo.editValor.value := Dmgeral.cdsValorContribVALOR.asfloat;
      frmValorContribNovo.editano.Text := inttostr(Dmgeral.cdsValorContribANO.value);
      frmValorContribNovo.editVencimento.Text := datetostr(Dmgeral.cdsValorContribVENCIMENTO.value);
      frmValorContribNovo.editFaixa.value := Dmgeral.cdsValorContribFAIXA_CAPITAL.asfloat;
      frmValorContribNovo.editAliquota.text := formatfloat(',0.00',Dmgeral.cdsValorContribVALOR_ALIQUOTA.asfloat);

      if frmValorContribNovo.showmodal = mrok then
      begin
          DMGeral.PROC_VALORCONTRIB_UI.close;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR_CONTRIB_ID').value :=Dmgeral.cdsValorContribVALOR_CONTRIB_ID.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('TP_ASSOC_ID').value :=frmValorContribNovo.cdsTp_PessoaTP_ASSOC_ID.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('EMP_ID').value :=frmValorContribNovo.cdsEmp_regiaoEMP_ID.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('TP_CONTRIB_ID').value :=frmValorContribNovo.cdsTpContribTP_CONTRIB_ID.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR').value :=frmValorContribNovo.editValor.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('ANO').value :=strtoint(frmValorContribNovo.editano.Text);
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VENCIMENTO').value :=strtodate(frmValorContribNovo.editVencimento.Text);
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('FAIXA_CAPITAL').value :=frmValorContribNovo.editFaixa.value;
          DMGeral.PROC_VALORCONTRIB_UI.ParamByName('VALOR_ALIQUOTA').value :=strtofloat(frmValorContribNovo.editAliquota.text);
          DMGeral.PROC_VALORCONTRIB_UI.ExecProc;
          DMGeral.dsValorContrib.Dataset.refresh;
      end;
      finally
      frmValorContribNovo.free;
      end;
  end;

end;

procedure TfrmContribuicaoValores.spExcluirClick(Sender: TObject);
begin
  inherited;
  If  Dmgeral.cdsValorContrib.RecordCount > 0 then
  begin
     If confirma('Confirma exclusão do item selecionado? ') then
     begin
        Try
        Dmgeral.PROC_VALORES_DEL.close;
        Dmgeral.PROC_VALORES_DEL.ParamByName('VALOR_CONTRIB_ID').value :=Dmgeral.cdsValorContribVALOR_CONTRIB_ID.value;
        Dmgeral.PROC_VALORES_DEL.ExecProc;
        Dmgeral.cdsValorContrib.refresh;
        except
        Erro('Não foi possível excluir o item selecinado. ');
        end;
     end;
  end;
end;

end.
