unit UMalaDiretaVisualizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
  TfrmMalaDiretaVisualizar = class(TModeloComum)
    Label1: TLabel;
    labIdent: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    cbSituacao: TComboBox;
    BitBtn1: TBitBtn;
    spGerarPlanilha: TBitBtn;
    Bevel1: TBevel;
    sdsItens: TSQLClientDataSet;
    sdsItensSTATUSDESCRICAO: TStringField;
    sdsItensUSER_ADICIONOU: TStringField;
    sdsItensMALAITEM_ID: TIntegerField;
    sdsItensMALADIRETA_ID: TIntegerField;
    sdsItensDATAINCLUSAO: TDateField;
    sdsItensEMAIL: TStringField;
    sdsItensDATAENVIO: TDateField;
    sdsItensSTATUS: TIntegerField;
    sdsItensSELECIONADO: TIntegerField;
    sdsItensUSUARIO: TIntegerField;
    sdsItensASS_ID: TIntegerField;
    sdsItensNOME: TStringField;
    sdsItensTP_PESSOA: TIntegerField;
    sdsItensHORAENVIO: TStringField;
    dsItens: TDataSource;
    sdsItensREGISTRO: TStringField;
    Label2: TLabel;
    labTotal: TLabel;
    procedure cbSituacaoSelect(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure CalcTotal;
    procedure BitBtn1Click(Sender: TObject);
    procedure spGerarPlanilhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMalaDiretaVisualizar: TfrmMalaDiretaVisualizar;

implementation

uses UDMConexao, UQRItensMala;

{$R *.dfm}

procedure TfrmMalaDiretaVisualizar.CalcTotal;
begin
   Labtotal.caption := inttostr(sdsitens.RecordCount);
end;

procedure TfrmMalaDiretaVisualizar.cbSituacaoSelect(Sender: TObject);
begin
  inherited;
  dsItens.DataSet.Filtered:=false;
  If cbSituacao.ItemIndex = 0 then
     dsItens.DataSet.filter :=''
  else
     dsItens.DataSet.filter :='STATUSDESCRICAO=' + quotedstr(cbSituacao.Text);
  dsItens.DataSet.filtered :=true;
  CalcTotal;
end;

procedure TfrmMalaDiretaVisualizar.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmMalaDiretaVisualizar.FormShow(Sender: TObject);
begin
  inherited;
  CalcTotal;
  cbSituacao.ItemIndex:=0;
end;

procedure TfrmMalaDiretaVisualizar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmMalaDiretaVisualizar.spGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
  If sdsItens.RecordCount > 0 then
  begin
      try application.CreateForm(TQRItensMala,QRItensMala);
      QRItensMala.labSubtitulo.caption:= 'Mala Direta: ' + labIdent.caption + ' (Situação: ' + cbSituacao.Text+')';
      QRItensMala.preview;
      DMConexao.Log('Impressão/Visualização da Mala Direta Id=' + inttostr(dsitens.DataSet.fieldbyname('maladireta_id').value), 'O', 0);
      finally
      QRItensMala.free;
      end;
  end;
end;

end.
