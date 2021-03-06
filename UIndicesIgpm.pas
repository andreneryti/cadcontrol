unit UIndicesIgpm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Grids, DBGrids, WinSkinData, ExtCtrls, StdCtrls,
  Buttons;

type
  TfrmIndiceIgpm = class(TModeloComum)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btSair: TBitBtn;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndiceIgpm: TfrmIndiceIgpm;

implementation

uses UDMGeral, UFuncoes, SqlExpr, UDMConexao, UIndiceNovo, UIndiceIgpmNovo;

{$R *.dfm}

procedure TfrmIndiceIgpm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmIndiceIgpm.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmIndiceIgpm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If DMGeral.dsIndiceigpm.dataset.RecordCount > 0 then
  begin
     If Confirma ('Deseja excluir o �ndice selecionado? ') then
     begin
         Dmgeral.PROC_INDICE_DEL.close;
         Dmgeral.PROC_INDICE_DEL.ParamByName('indice_id').value := DMGeral.cdsIndiceigpmINDICE_ID.value;
         Dmgeral.PROC_INDICE_DEL.ExecProc;
         DMGeral.cdsIndiceigpm.Refresh;
     end;
  end;
end;

procedure TfrmIndiceIgpm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Try Application.createform(TfrmIndiceIgpmNovo,frmIndiceIgpmNovo);
  if frmIndiceIgpmNovo.showmodal = mrok then
  begin
     TRY
      DMGeral.PROC_INDICE_IGPM_I.Close;
      DMGeral.PROC_INDICE_IGPM_I.ParamByName('TP_INDICE_ID').Value :=1;
      DMGeral.PROC_INDICE_IGPM_I.ParamByName('VALOR').Value := STRTOFLOAT(frmIndiceIgpmNovo.editvalor.text);
      DMGeral.PROC_INDICE_IGPM_I.ParamByName('MES').Value := frmIndiceIgpmNovo.cbmes.ItemIndex+1;
      DMGeral.PROC_INDICE_IGPM_I.ParamByName('ANO').Value := strtoint(frmIndiceIgpmNovo.editAno.Text);
      DMGeral.PROC_INDICE_IGPM_I.ParamByName('DT_LANCAMENTO').Value := DataAtual;
      if frmIndiceIgpmNovo.cbmes.ItemIndex+2 = 13 then
         DMGeral.PROC_INDICE_IGPM_I.ParamByName('DT_VIGENCIA').Value :='01/01/' +  inttostr(DMGeral.PROC_INDICE_IGPM_I.ParamByName('ANO').Value+1)
      else
         DMGeral.PROC_INDICE_IGPM_I.ParamByName('DT_VIGENCIA').Value :='01/'+ inttostr(frmIndiceIgpmNovo.cbmes.ItemIndex+2)+'/' +  inttostr(DMGeral.PROC_INDICE_IGPM_I.ParamByName('ANO').Value);
      DMGeral.PROC_INDICE_IGPM_I.ExecProc;
      EXCEPT
      eRRO('Erro incluindo o �ndice. ');
      end;
  end;
  Dmgeral.cdsIndiceigpm.Refresh;
  finally
  frmIndiceIgpmNovo.free;
  end;

end;

end.
