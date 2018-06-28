unit URelatRecebimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ActnList, DB, Grids, DBGrids, Buttons, ToolWin,
  ComCtrls, StdCtrls, Mask, JvToolEdit, JvLookup, ExtCtrls, WinSkinData, dbClient;

type
  TfrmRelatRecebimentos = class(TModeloComum)
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btLocalizar: TBitBtn;
    cbTipoContrib: TComboBox;
    lkpLocalidade: TJvLookupEdit;
    cbTipoData: TComboBox;
    eddataini: TDateTimePicker;
    eddatafim: TDateTimePicker;
    gridCobranca: TDBGrid;
    dsListagem: TDataSource;
    ActionList1: TActionList;
    acGerarPlanilha: TAction;
    spGerarPlanilha: TSpeedButton;
    Label3: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    procedure btLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure gridCobrancaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridCobrancaTitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatRecebimentos: TfrmRelatRecebimentos;

implementation

uses UDMAssociado, UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmRelatRecebimentos.btLocalizarClick(Sender: TObject);
var
   i:integer;
begin
   DMAssociado.cdsRelatRecebidos.close;
   labtotal.caption:='0';
   Application.ProcessMessages;

   If not (DMAssociado.dsEmp_Regiao.DataSet.locate('regiao',lkpLocalidade.text, [] )) then
   begin
     erro('Digite a localidade corretamente. ');
     abort;
   end;

   ExibeAguarde('Gerando Relação de Guias...');

   dsListagem.dataset.Close;

   for i := 0 to TClientDataset(dsListagem.dataset).Params.Count -1 do
       TClientDataset(dsListagem.dataset).Params[i].clear;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATA1').value :=eddataini.date;

   TClientDataset(dsListagem.dataset).Params.ParamByName('DATA2').value :=eddatafim.date;

   if cbTipoData.ItemIndex = 0 then
      TClientDataset(dsListagem.dataset).Params.ParamByName('TIPODATA').value := 'C'
   else
   if cbTipoData.ItemIndex = 1 then
      TClientDataset(dsListagem.dataset).Params.ParamByName('TIPODATA').value := 'P';

   //Localidade
   TClientDataset(dsListagem.dataset).Params.ParamByName('EMP_ID').value :=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;

   // Tipo de Cobranca
   TClientDataset(dsListagem.dataset).Params.ParamByName('TPCONTRIB').value := cbTipoContrib.ItemIndex;

   TClientDataset(dsListagem.dataset).Open;

   TClientDataset(dsListagem.dataset).IndexFieldNames :=  'registro';

   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);

   EscondeAguarde;
end;

procedure TfrmRelatRecebimentos.FormShow(Sender: TObject);
begin
  inherited;
  DMAssociado.dsEmp_Regiao.dataset.close;
  DMAssociado.dsEmp_Regiao.dataset.open;
  DMAssociado.dsEmp_Regiao.dataset.first;
  lkpLocalidade.Text:=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('Regiao').value;
  dsListagem.DataSet.close;
  eddataini.date :=  strtodate('01/' + inttostr(ExtractMonth(DataAtual)) + '/' + inttostr(Extractyear(DataAtual)));
  eddatafim.date := DataAtual;

end;

procedure TfrmRelatRecebimentos.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsListagem.dataset), gridCobranca);

end;

procedure TfrmRelatRecebimentos.gridCobrancaDrawColumnCell(Sender: TObject;
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

procedure TfrmRelatRecebimentos.gridCobrancaTitleClick(Column: TColumn);
begin
  inherited;
   TClientDataset(dsListagem.dataset).IndexFieldNames :=  Column.FieldName;
   TClientDataset(dsListagem.dataset).First;

end;

procedure TfrmRelatRecebimentos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
