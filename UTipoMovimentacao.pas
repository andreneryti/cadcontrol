unit UTipoMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids;

type
  TfrmTipoMovimentacao = class(TModeloComum)
    Panel2: TPanel;
    spNovo: TSpeedButton;
    spEditar: TSpeedButton;
    spExcluir: TSpeedButton;
    DBGrid1: TDBGrid;
    btSair: TBitBtn;
    procedure spNovoClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoMovimentacao: TfrmTipoMovimentacao;

implementation

uses UDMGeral, UTipoMovimentoNovo, UFuncoes;

{$R *.dfm}

procedure TfrmTipoMovimentacao.spNovoClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmTipoMovimentoNovo,frmTipoMovimentoNovo);
  if frmTipoMovimentoNovo.showmodal = mrok then
  begin
      DMGeral.PROC_TPMOVIMENTO_UI.close;
      DMGeral.PROC_TPMOVIMENTO_UI.ParamByName('TP_MOV_ID').value :=0;
      DMGeral.PROC_TPMOVIMENTO_UI.ParamByName('TP_MOV_DESCRICAO').value :=frmTipoMovimentoNovo.editDescricao.text;
      DMGeral.PROC_TPMOVIMENTO_UI.ExecProc;
      DMGeral.dsTipoMovimento.Dataset.refresh;
  end;
  finally
  frmTipoMovimentoNovo.free;
  end;

end;

procedure TfrmTipoMovimentacao.spEditarClick(Sender: TObject);
begin
  inherited;
  If dmgeral.cdsTipoMovimento.RecordCount >0 then
  begin
      Try Application.CreateForm(TfrmTipoMovimentoNovo,frmTipoMovimentoNovo);
      frmTipoMovimentoNovo.Caption := '::: Edição de Tipo de Movimento :::';
      frmTipoMovimentoNovo.editDescricao.Text:= DmGeral.cdsTipoMovimentoTP_MOV_DESCRICAO.value;
      if frmTipoMovimentoNovo.showmodal = mrok then
      begin
          DMGeral.PROC_TPMOVIMENTO_UI.close;
          DMGeral.PROC_TPMOVIMENTO_UI.ParamByName('TP_MOV_ID').value :=DmGeral.cdsTipoMovimentoTP_MOV_ID.value;
          DMGeral.PROC_TPMOVIMENTO_UI.ParamByName('TP_MOV_DESCRICAO').value :=frmTipoMovimentoNovo.editDescricao.text;
          DMGeral.PROC_TPMOVIMENTO_UI.ExecProc;
          DMGeral.dsTipoMovimento.Dataset.refresh;
      end;
      finally
      frmTipoMovimentoNovo.free;
      end;
   end;
end;

procedure TfrmTipoMovimentacao.spExcluirClick(Sender: TObject);
begin
  inherited;
  If dmgeral.cdsTipoMovimento.RecordCount >0 then
  begin
     If Confirma('Deseja excluir o Tipo de Movimento selecionado?') then
     begin
        try
          DmGeral.PROC_TPMOVIMENTO_DEL.close;
          DmGeral.PROC_TPMOVIMENTO_DEL.ParamByName('TP_MOV_ID').value := Dmgeral.cdsTipoMovimentoTP_MOV_ID.value;
          DmGeral.PROC_TPMOVIMENTO_DEL.ExecProc;
          Dmgeral.cdsTipoMovimento.Refresh;
        except
            Aviso('Não foi possivel excluir este Tipo de Movimento pois existe'+#13+'um ou mais associados relacionados. ');
        end;
     end;
  end;
end;

procedure TfrmTipoMovimentacao.FormShow(Sender: TObject);
begin
  inherited;
  Dmgeral.cdsTipoMovimento.Open;
end;

procedure TfrmTipoMovimentacao.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
