unit UfrmMalaDiretaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, ActnList, Grids,
  DBGrids, Buttons, ToolWin, ComCtrls, StdCtrls, DBCtrls, Mask, DB;

type
  TfrmMalaDiretaCadastro = class(TModeloComum)
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    spGerarBoleto: TSpeedButton;
    spPdfBoleto: TSpeedButton;
    spImprimirEtiq: TSpeedButton;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    acNovaMala: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acPrint: TAction;
    acVisualizar: TAction;
    SpeedButton1: TSpeedButton;
    dsMalas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    spPrioriAcima: TSpeedButton;
    spPrioriAbaixo: TSpeedButton;
    Bevel1: TBevel;
    spGerarPlanilha: TSpeedButton;
    SpeedButton2: TSpeedButton;
    acAtualizar: TAction;
    procedure acNovaMalaExecute(Sender: TObject);
    procedure acVisualizarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure AtualizaMalas;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spPrioriAcimaClick(Sender: TObject);
    procedure spPrioriAbaixoClick(Sender: TObject);
    procedure OrganizaPrioridades;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMalaDiretaCadastro: TfrmMalaDiretaCadastro;

implementation

uses UDMMalaDireta, SqlExpr, UFuncoes, UDMConexao, UMalaDiretaNova,
  UMalaDiretaVisualizar;

{$R *.dfm}

procedure TfrmMalaDiretaCadastro.acNovaMalaExecute(Sender: TObject);
begin
  inherited;
   Try application.createform(TfrmMalaDiretaNova,frmMalaDiretaNova);
   oldvalue :='';
   If frmMalaDiretaNova.showmodal = mrok then
   begin
      try
      DMMalaDireta.PROC_MALADIRETA_UI.Close;
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('OPER').value := 'i';
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('MALA_ID').clear;
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('USUARIO').value :=   UserId;
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('ASSUNTO').value := frmMalaDiretaNova.editAssunto.Text;
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('TEXTOEMAIL').Assign(frmMalaDiretaNova.memoCorpo.lines);
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('TEXTOMALADIRETA').value := frmMalaDiretaNova.memoDescricao.Lines.Text;
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('STATUS').value := 3; // vazia
      DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('NOMEIDENTIFICACAO').value :=  frmMalaDiretaNova.editIdentificacao.Text;
      DMMalaDireta.PROC_MALADIRETA_UI.ExecProc;
      DMConexao.Log('Nova Mala Direta Ident.='+ frmMalaDiretaNova.editIdentificacao.Text, 'O', 0);
      AtualizaMalas;
      except
        Erro('Erro ao incluir a nova Mala Direta. ');
      End;

   end;
   finally
     frmMalaDiretaNova.free;
   end;
end;

procedure TfrmMalaDiretaCadastro.acVisualizarExecute(Sender: TObject);
begin
  inherited;
  If dsmalas.dataset.recordcount >0 then
  begin
      Try application.createform(TfrmMalaDiretaVisualizar,frmMalaDiretaVisualizar);
      frmMalaDiretaVisualizar.labIdent.caption := dsMalas.DataSet.fieldbyname('nomeidentificacao').value;
      frmMalaDiretaVisualizar.sdsItens.close;
      frmMalaDiretaVisualizar.sdsItens.Params.ParamByName('mala_id').value := dsMalas.DataSet.fieldbyname('mala_id').value;
      frmMalaDiretaVisualizar.sdsItens.open;
      frmMalaDiretaVisualizar.showmodal;
      finally
      frmMalaDiretaVisualizar.free;
      end;
  end;
end;

procedure TfrmMalaDiretaCadastro.acEditarExecute(Sender: TObject);
begin
  inherited;
   if dsMalas.DataSet.RecordCount > 0 then
      If  not (dsMalas.DataSet.FieldByName('prioridade').value= null) then
      begin
         Try application.createform(TfrmMalaDiretaNova,frmMalaDiretaNova);
         frmMalaDiretaNova.caption :='::: Mala Direta - Edição';
         frmMalaDiretaNova.editIdentificacao.text := dsMalas.DataSet.fieldbyname('NOMEIDENTIFICACAO').value;
         frmMalaDiretaNova.editAssunto.Text := dsMalas.DataSet.fieldbyname('assunto').value;
         frmMalaDiretaNova.memoDescricao.lines.Text := dsMalas.DataSet.fieldbyname('TEXTOMALADIRETA').value;
         frmMalaDiretaNova.memoCorpo.lines.assign(dsMalas.DataSet.fieldbyname('TEXTOEMAIL'));
         oldvalue :=dsMalas.DataSet.fieldbyname('NOMEIDENTIFICACAO').value;
         If frmMalaDiretaNova.showmodal = mrok then
         begin
            try
            DMMalaDireta.PROC_MALADIRETA_UI.Close;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('OPER').value := 'u';
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('MALA_ID').value := dsmalas.DataSet.fieldbyname('mala_id').value;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('USUARIO').value :=   UserId;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('ASSUNTO').value := frmMalaDiretaNova.editAssunto.Text;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('TEXTOEMAIL').Assign(frmMalaDiretaNova.memoCorpo.lines);
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('TEXTOMALADIRETA').value := frmMalaDiretaNova.memoDescricao.Lines.Text;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('STATUS').clear;
            DMMalaDireta.PROC_MALADIRETA_UI.ParamByName('NOMEIDENTIFICACAO').value :=  frmMalaDiretaNova.editIdentificacao.Text;
            DMMalaDireta.PROC_MALADIRETA_UI.ExecProc;
            DMConexao.Log('Edição/Visualização de Mala Direta Id=' + inttostr(dsmalas.DataSet.fieldbyname('mala_id').value) + ' Ident.='+ frmMalaDiretaNova.editIdentificacao.Text, 'O', 0);
            AtualizaMalas;
            except
              Erro('Erro ao editar a Mala Direta. ');
            End;

         end;
         finally
           frmMalaDiretaNova.free;
         end;
      end;


end;

procedure TfrmMalaDiretaCadastro.acExcluirExecute(Sender: TObject);
begin
  inherited;
  if  dsMalas.DataSet.RecordCount > 0 then
  begin
      If Confirma('Todos os e-mails associados a esta Mala Direta , enviados ou não enviados, serão excluídos.'+chr(13)+'Confirma a exclusão desta Mala Direta.') then
      begin
        try
          DMMalaDireta.PROC_MALADIRETA_D.close;
          DMMalaDireta.PROC_MALADIRETA_D.ParamByName('mala_id').value := dsMalas.DataSet.fieldbyname('mala_id').value;
          DMMalaDireta.PROC_MALADIRETA_D.ExecProc;
          DMConexao.Log('Exclusão de Mala Direta Id=' + inttostr(dsMalas.DataSet.fieldbyname('mala_id').value), 'O', 0);
          OrganizaPrioridades;
          AtualizaMalas;
        except
          erro('Erro ao excluir a Mala Direta. ');
        end;
      end;
  end;
end;

procedure TfrmMalaDiretaCadastro.acPrintExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmMalaDiretaCadastro.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmMalaDiretaCadastro.AtualizaMalas;
begin
  DMMalaDireta.sdsMalas.close;
  DMMalaDireta.sdsMalas.open;

end;

procedure TfrmMalaDiretaCadastro.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaMalas;
end;

procedure TfrmMalaDiretaCadastro.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmMalaDiretaCadastro.spPrioriAcimaClick(Sender: TObject);
var
  posicao:integer;

begin
  inherited;
   If (dsMalas.DataSet.RecNo <> 1) and not (dsMalas.DataSet.FieldByName('prioridade').value= null) then
   begin
     try
       DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.close;
       DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('MALA_ID').value := dsMalas.DataSet.fieldbyname('mala_id').value;
       DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('PRIORIDADEATUAL').value := dsMalas.DataSet.fieldbyname('prioridade').value;
       DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('PRIORIDADENOVA').value := dsMalas.DataSet.fieldbyname('prioridade').value - 1;
       DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ExecProc;
       DMConexao.Log('Aumento de prioridade daMala Direta Id=' + inttostr(dsMalas.DataSet.fieldbyname('mala_id').value), 'O', 0);
       posicao := dsMalas.DataSet.fieldbyname('mala_id').value;
       AtualizaMalas;
       dsMalas.DataSet.locate('mala_id', posicao,[]);

     Except
       Erro('Erro ao definir prioridade. ');
     end;
   end;
end;

procedure TfrmMalaDiretaCadastro.spPrioriAbaixoClick(Sender: TObject);
var
  posicao:integer;
begin
  inherited;
   if (dsMalas.DataSet.RecNo <> dsMalas.DataSet.recordcount) then
   begin
      dsMalas.dataset.Next;
      If not (dsMalas.DataSet.FieldByName('prioridade').value= null) then
      begin
         try
           dsMalas.dataset.prior;
           DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.close;
           DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('MALA_ID').value := dsMalas.DataSet.fieldbyname('mala_id').value;
           DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('PRIORIDADEATUAL').value := dsMalas.DataSet.fieldbyname('prioridade').value;
           DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ParamByName('PRIORIDADENOVA').value := dsMalas.DataSet.fieldbyname('prioridade').value + 1;
           DMMalaDireta.PROC_MALADIRETA_PRIORIDADE.ExecProc;
           DMConexao.Log('Redução de prioridade daMala Direta Id=' + inttostr(dsMalas.DataSet.fieldbyname('mala_id').value), 'O', 0);
           posicao := dsMalas.DataSet.fieldbyname('mala_id').value;
           AtualizaMalas;
           dsMalas.DataSet.locate('mala_id', posicao,[]);

         Except
           Erro('Erro ao definir prioridade. ');
         end;
      end
      else
         dsMalas.dataset.prior;
    end;
end;

procedure TfrmMalaDiretaCadastro.OrganizaPrioridades;
begin
   DMMalaDireta.PROC_MALADIRETA_ORGANPRIOR.close;
   DMMalaDireta.PROC_MALADIRETA_ORGANPRIOR.ExecProc;
end;

procedure TfrmMalaDiretaCadastro.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  AtualizaMalas;
end;

end.
