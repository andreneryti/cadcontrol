unit URelatGuiasNaoIdent;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, DB, ActnList, Grids, DBGrids, ComCtrls,
    StdCtrls, Mask, JvToolEdit, JvLookup, Buttons, ExtCtrls, WinSkinData, dbClient;

type
    TfrmRelatGuiasNaoIdent = class(TModeloComum)
        Label3: TLabel;
        labtotal: TLabel;
        BitBtn1: TBitBtn;
        Panel2: TPanel;
        Bevel1: TBevel;
        Bevel2: TBevel;
        Label6: TLabel;
        Label4: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        spGerarPlanilha: TSpeedButton;
        btLocalizar: TBitBtn;
        lkpLocalidade: TJvLookupEdit;
        cbTipoData: TComboBox;
        eddataini: TDateTimePicker;
        eddatafim: TDateTimePicker;
        gridCobranca: TDBGrid;
        ActionList1: TActionList;
        acGerarPlanilha: TAction;
        dsListagem: TDataSource;
        procedure gridCobrancaTitleClick(Column: TColumn);
        procedure gridCobrancaDrawColumnCell(Sender: TObject;
            const Rect: TRect; DataCol: Integer; Column: TColumn;
            State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmRelatGuiasNaoIdent: TfrmRelatGuiasNaoIdent;

implementation

uses UFuncoes, UDMConexao, UDMAssociado;

{$R *.dfm}

procedure TfrmRelatGuiasNaoIdent.gridCobrancaTitleClick(Column: TColumn);
begin
    inherited;
    TClientDataset(dsListagem.dataset).IndexFieldNames := Column.FieldName;
    TClientDataset(dsListagem.dataset).First;

end;

procedure TfrmRelatGuiasNaoIdent.gridCobrancaDrawColumnCell(
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

procedure TfrmRelatGuiasNaoIdent.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatGuiasNaoIdent.btLocalizarClick(Sender: TObject);
var
   i:integer;
begin
   TClientDataset(dsListagem.dataset).close;
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
   TClientDataset(dsListagem.dataset).Params.ParamByName('EMP_IDPAR').value :=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('emp_id').value;

   TClientDataset(dsListagem.dataset).Open;
   
   if cbTipoData.ItemIndex = 0 then
      TClientDataset(dsListagem.dataset).IndexFieldNames :=  'DATAcredito'
   else
   if cbTipoData.ItemIndex = 1 then
      TClientDataset(dsListagem.dataset).IndexFieldNames :=  'DATAPAGO';;

   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);

   EscondeAguarde;

end;

procedure TfrmRelatGuiasNaoIdent.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsListagem.dataset), gridCobranca);

end;

procedure TfrmRelatGuiasNaoIdent.FormShow(Sender: TObject);
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

end.

