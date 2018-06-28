unit URelatSimplesNacional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Mask, JvToolEdit, JvLookup, ComCtrls,
  Buttons, ExtCtrls, ActnList, Grids, DBGrids, DB, WinSkinData, dbClient;

type
  TfrmRelatSimplesNacional = class(TModeloComum)
    Label3: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    dsListagem: TDataSource;
    gridListagem: TDBGrid;
    ActionList1: TActionList;
    acGerarPlanilha: TAction;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    spGerarPlanilha: TSpeedButton;
    btLocalizar: TBitBtn;
    eddataini: TDateTimePicker;
    eddatafim: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure gridListagemTitleClick(Column: TColumn);
    procedure gridListagemDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure gridListagemDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatSimplesNacional: TfrmRelatSimplesNacional;

implementation

uses UFuncoes, UDMAssociado, UDMConexao, UNovoAssoc;

{$R *.dfm}

procedure TfrmRelatSimplesNacional.FormShow(Sender: TObject);
begin
  inherited;
  dsListagem.DataSet.close;
  eddataini.date :=  strtodate('01/' + inttostr(ExtractMonth(DataAtual)) + '/' + inttostr(Extractyear(DataAtual)));
  eddatafim.date := DataAtual;
//  EditAno.text := inttostr(Extractyear(DataAtual));
end;

procedure TfrmRelatSimplesNacional.gridListagemTitleClick(Column: TColumn);
begin
  inherited;
    TClientDataset(dsListagem.dataset).IndexFieldNames := Column.FieldName;
    TClientDataset(dsListagem.dataset).First;

end;

procedure TfrmRelatSimplesNacional.gridListagemDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
    if Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmRelatSimplesNacional.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatSimplesNacional.btLocalizarClick(Sender: TObject);
var
   i:integer;
begin
   TClientDataset(dsListagem.dataset).close;
   labtotal.caption:='0';
   Application.ProcessMessages;

   ExibeAguarde('Gerando Listagem ...');

   dsListagem.dataset.Close;

   for i := 0 to TClientDataset(dsListagem.dataset).Params.Count -1 do
       TClientDataset(dsListagem.dataset).Params[i].clear;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATA1').value :=eddataini.date;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATA2').value :=eddatafim.date;

   TClientDataset(dsListagem.dataset).Open;

   TClientDataset(dsListagem.dataset).IndexFieldNames :=  'datapedido';

   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);

   EscondeAguarde;
end;

procedure TfrmRelatSimplesNacional.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsListagem.dataset), gridListagem);

end;

procedure TfrmRelatSimplesNacional.gridListagemDblClick(Sender: TObject);
begin
  inherited;
    try Application.CreateForm(TfrmNovoAssoc, frmNovoAssoc);
        frmNovoAssoc.RefreshAll(dsListagem.DataSet.FieldByName('ass_id').value);
        frmNovoAssoc.Caption := 'Dados de ' + dsListagem.DataSet.FieldByName('nome').value;
        frmNovoAssoc.showmodal;
    finally
        frmNovoAssoc.free;
    end;
end;

end.
