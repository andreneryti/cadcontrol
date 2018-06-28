unit UIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Grids, DBGrids, WinSkinData, ExtCtrls, StdCtrls,
  Buttons;

type
  TfrmIndices = class(TModeloComum)
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
  frmIndices: TfrmIndices;

implementation

uses UDMGeral, UFuncoes, SqlExpr, UDMConexao, UIndiceNovo;

{$R *.dfm}

procedure TfrmIndices.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmIndices.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmIndices.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If DMGeral.dsIndice.dataset.RecordCount > 0 then
  begin
     If Confirma ('Deseja excluir o índice selecionado? ') then
     begin
         Dmgeral.PROC_INDICE_DEL.close;
         Dmgeral.PROC_INDICE_DEL.ParamByName('indice_id').value := dmgeral.cdsIndiceINDICE_ID.value;
         Dmgeral.PROC_INDICE_DEL.ExecProc;
         DMGeral.cdsIndice.Refresh;
     end;
  end;
end;

procedure TfrmIndices.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Try Application.createform(TFrmIndiceNovo,FrmIndiceNovo);
  if FrmIndiceNovo.showmodal = mrok then
  begin
     TRY
      DMGeral.PROC_INDICE_I.Close;
      DMGeral.PROC_INDICE_I.ParamByName('VALOR').Value := FrmIndiceNovo.edIndice.text;
      DMGeral.PROC_INDICE_I.ParamByName('DT_VIGENCIA').Value :=strtodate(FrmIndiceNovo.editDtVigencia.text);
      DMGeral.PROC_INDICE_I.ExecProc;
      EXCEPT
      eRRO('Erro incluindo o índice. ');
      end;
  end;
  Dmgeral.cdsIndice.Refresh;
  finally
  FrmIndiceNovo.free;
  end;

end;

end.
