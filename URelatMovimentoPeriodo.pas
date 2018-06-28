unit URelatMovimentoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, Buttons, ComCtrls,
  ToolWin, Grids, DBGrids, StdCtrls , DBCLIENT, comObj, DB;

type
  TfrmRelatMovimentoPeriodo = class(TModeloComum)
    Panel2: TPanel;
    Label4: TLabel;
    Label15: TLabel;
    btLocalizar: TBitBtn;
    cbfiltro: TComboBox;
    DBGrid1: TDBGrid;
    edDataIni: TDateTimePicker;
    edDataFim: TDateTimePicker;
    Label1: TLabel;
    btSair: TBitBtn;
    spImprimir: TBitBtn;
    spGerarPlanilha: TBitBtn;
    Bevel1: TBevel;
    cbLocal: TComboBox;
    Label2: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure spGerarPlanilhaClick(Sender: TObject);
    procedure spImprimirClick(Sender: TObject);
    procedure GeraPlanilhalOC(Query: tClientDataset; grid:TDbGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatMovimentoPeriodo: TfrmRelatMovimentoPeriodo;

implementation

uses UDMConexao, UDmFinancas, UFuncoes, URelatRecibimentos;

{$R *.dfm}

procedure TfrmRelatMovimentoPeriodo.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatMovimentoPeriodo.FormShow(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Dataatual;
  edDataFim.Date := Dataatual;
end;

procedure TfrmRelatMovimentoPeriodo.btLocalizarClick(Sender: TObject);
begin
  inherited;
  DmFinancas.cdsMovPeriodo.close;
  DmFinancas.cdsMovPeriodo.Params.ParamByName('DATAINI').value :=  edDataIni.date;
  DmFinancas.cdsMovPeriodo.Params.ParamByName('DATAFIM').value := edDataFim.date;
  DmFinancas.cdsMovPeriodo.Params.ParamByName('CANCELADO').value := cbfiltro.ItemIndex;
  DmFinancas.cdsMovPeriodo.Params.ParamByName('LOCALIDADE').value := cbLocal.ItemIndex;
  DmFinancas.cdsMovPeriodo.open;
end;

procedure TfrmRelatMovimentoPeriodo.DBGrid1DrawColumnCell(Sender: TObject;
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

  If Tdbgrid(sender).DataSource.dataset.fieldbyname('situacao').value = 'Cancelado' then
  begin
      Tdbgrid(Sender).Canvas.Font.Color := clred;
      Tdbgrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;   
  if gdselected in State then
  begin
    Tdbgrid(sender).Canvas.Brush.Color := clNavy;
    Tdbgrid(sender).Canvas.Font.Color := clwhite;
    Tdbgrid(sender).Canvas.FillRect(Rect);
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TfrmRelatMovimentoPeriodo.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  DmFinancas.cdsMovPeriodo.IndexFieldNames :=  Column.FieldName;
end;

procedure TfrmRelatMovimentoPeriodo.spGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
  If DmFinancas.cdsMovPeriodo.Active=true then
     if DmFinancas.cdsMovPeriodo.RecordCount > 0 then
        GeraPlanilhalOC(DmFinancas.cdsMovPeriodo, DBGrid1);
end;

procedure TfrmRelatMovimentoPeriodo.spImprimirClick(Sender: TObject);
var total:real;
begin
  inherited;
  If Dmfinancas.cdsMovPeriodo.Active = true then
     if Dmfinancas.cdsMovPeriodo.RecordCount > 0 then
     begin
         Try application.createform(tfrmRelatRecibimentos,frmRelatRecibimentos);


         frmRelatRecibimentos.LABTITULO.caption :=    stringreplace(frmRelatRecibimentos.LABTITULO.caption,'<<LOCALIDADE>>',  stringreplace(UpperCase(cblocal.Text), 'í','Í', [rfReplaceall]), [rfReplaceall]);
         If edDataIni.date = edDataFim.date then
            frmRelatRecibimentos.labperiodo.caption := frmRelatRecibimentos.labperiodo.caption + ' DATA: ' + datetostr(edDataIni.date)
         else
            frmRelatRecibimentos.labperiodo.caption := frmRelatRecibimentos.labperiodo.caption + ' DATA: ' + datetostr(edDataIni.date) + ' a '+ datetostr(edDataFim.date);

         total:=0;

         Dmfinancas.cdsMovPeriodo.first;
         while not Dmfinancas.cdsMovPeriodo.eof do
         begin
             If  trim(Dmfinancas.cdsMovPeriodoSITUACAO.value) = 'Ativo' then
                total := total + Dmfinancas.cdsMovPeriodoVALOR_RECEBIMENTO.asfloat;
             Dmfinancas.cdsMovPeriodo.next;
         end;

        frmRelatRecibimentos.labtotal.caption := 'Total:  R$ ' + formatfloat(',0.00', total);


         frmRelatRecibimentos.preview;
         finally
         frmRelatRecibimentos.free;
         end;

     end;
end;

procedure TfrmRelatMovimentoPeriodo.GeraPlanilhalOC(Query: tClientDataset;
  grid: TDbGrid);
var
  Excel: Variant;
  Linha, i: Integer;
begin
  if not Query.IsEmpty then
  begin
    try
        ExibeAguarde('Gerando Planilha, Aguarde...');
        Query.DisableControls;
        Query.First;

        Excel := CreateOleObject('Excel.Application');

        Excel.Workbooks.Add();

        linha := 1;
        for i:= 0 to 4 do
        begin
          if (grid.Columns[i].Visible = true)  then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := grid.Columns[i].Title.Caption;
        end;
        linha := linha +1;

        while not Query.Eof do
        begin
           for i:= 0 to 4 do
           begin
                  if (grid.Columns[i].Visible = true) then
                  begin
                        If grid.DataSource.DataSet.Fieldbyname(grid.Columns[i].fieldname) is tfmtbcdfield then
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat  := 'R$ #.##0,00_);(R$ #.##0,00)';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=grid.Columns.Items[i].Field.asfloat//formatfloat(',0.00',dbgrid.Columns.Items[i-1].Field.Value)
                        end
                        else
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat :=  '@';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=  grid.Columns.Items[i].Field.AsString;
                        end;
                  end;
           end;
           Linha := Linha + 1;
           Query.Next;
        end;
        Query.first;

        Query.EnableControls;
        EscondeAguarde;
        Aviso('Planilha gerada com sucesso. ');
        Excel.Visible := True;
        excel.columns.AutoFit;
     except
       excel.Free;
     end;
  end;

end;

end.
