unit URelatMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Mask, JvToolEdit, JvLookup, ComCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, DB, ActnList, WinSkinData, dbClient;

type
  TfrmRelatMovimento = class(TModeloComum)
    ActionList1: TActionList;
    acGerarPlanilha: TAction;
    dsListagem: TDataSource;
    gridListagem: TDBGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    spGerarPlanilha: TSpeedButton;
    btLocalizar: TBitBtn;
    eddataini: TDateTimePicker;
    eddatafim: TDateTimePicker;
    Label3: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    cbResultado: TComboBox;
    lkpMOv: TJvLookupEdit;
    gridmes: TDBGrid;
    dslistaMes: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure gridListagemDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridListagemTitleClick(Column: TColumn);
    procedure gridmesTitleClick(Column: TColumn);
    procedure gridmesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btLocalizarClick(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbResultadoSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatMovimento: TfrmRelatMovimento;

implementation

uses UDMAssociado, UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmRelatMovimento.FormShow(Sender: TObject);
begin
  inherited;
  DMAssociado.dsMovs.dataset.close;
  DMAssociado.dsMovs.dataset.open;
  DMAssociado.dsMovs.dataset.first;
  lkpMOv.Text:=DMAssociado.dsMovs.dataset.fieldbyname('TP_MOV_DESCRICAO').value;
  dsListagem.DataSet.close;
  eddataini.date :=  strtodate('01/' + inttostr(ExtractMonth(DataAtual)) + '/' + inttostr(Extractyear(DataAtual)));
  eddatafim.date := DataAtual;

end;

procedure TfrmRelatMovimento.gridListagemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmRelatMovimento.gridListagemTitleClick(Column: TColumn);
begin
  inherited;
    TClientDataset(dsListagem.dataset).IndexFieldNames := Column.FieldName;
    TClientDataset(dsListagem.dataset).First;
end;

procedure TfrmRelatMovimento.gridmesTitleClick(Column: TColumn);
begin
  inherited;
   TClientDataset(dslistaMes.dataset).IndexFieldNames := Column.FieldName;
    TClientDataset(dslistaMes.dataset).First;
end;

procedure TfrmRelatMovimento.gridmesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmRelatMovimento.btLocalizarClick(Sender: TObject);
  var
   i, tot:integer;
begin

     If not (DMAssociado.dsMovs.DataSet.locate('TP_MOV_DESCRICAO',lkpMOv.text, [] )) then
     begin
       erro('Selecione o tipo de movimento corretamente. ');
       exit;
     end;

     labtotal.caption:='0';
     Application.ProcessMessages;


     if cbResultado.ItemIndex = 0 then
     begin
        TClientDataset(dsListagem.dataset).close;

        ExibeAguarde('Gerando Listagem ...');

        dsListagem.dataset.Close;

        for i := 0 to TClientDataset(dsListagem.dataset).Params.Count -1 do
                TClientDataset(dsListagem.dataset).Params[i].clear;

        TClientDataset(dsListagem.dataset).Params.ParamByName('DATA1').value :=eddataini.date;

        TClientDataset(dsListagem.dataset).Params.ParamByName('DATA2').value :=eddatafim.date;

        TClientDataset(dsListagem.dataset).Params.ParamByName('TPMOV').value :=DMAssociado.dsMovs.dataset.fieldbyname('TP_MOV_ID').value;

        TClientDataset(dsListagem.dataset).Open;

        labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).recordcount);

        gridListagem.Visible:=true;
        gridmes.Visible:=false;

     end
     else
     if cbResultado.ItemIndex = 1 then
     begin
        TClientDataset(dslistaMes.dataset).close;

        ExibeAguarde('Gerando Relação...');

        dslistaMes.dataset.Close;

        for i := 0 to TClientDataset(dslistaMes.dataset).Params.Count -1 do
                TClientDataset(dslistaMes.dataset).Params[i].clear;

        TClientDataset(dslistaMes.dataset).Params.ParamByName('DATA1').value :=eddataini.date;

        TClientDataset(dslistaMes.dataset).Params.ParamByName('DATA2').value :=eddatafim.date;

        TClientDataset(dslistaMes.dataset).Params.ParamByName('TPMOV').value :=DMAssociado.dsMovs.dataset.fieldbyname('TP_MOV_ID').value;

        TClientDataset(dslistaMes.dataset).Open;

        tot :=0;
        dslistaMes.dataset.first;
        while not dslistaMes.dataset.Eof do
        begin
            tot := tot + dslistaMes.dataset.fieldbyname('qtde').value;
            dslistaMes.dataset.next
        end;
        labtotal.Caption:= inttostr(tot);

        gridListagem.Visible:=false;
        gridmes.Visible:=true;

     end;

   EscondeAguarde;

end;

procedure TfrmRelatMovimento.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  if cbResultado.ItemIndex = 0 then
  begin
    If dsListagem.dataset.Active=true then
       if dsListagem.DataSet.RecordCount > 0 then
          GeraPlanilha(TClientDataset(dsListagem.dataset), gridListagem);
  end
  else
  if cbResultado.ItemIndex = 0 then
  begin
    If dslistaMes.dataset.Active=true then
       if dslistaMes.DataSet.RecordCount > 0 then
          GeraPlanilha(TClientDataset(dslistaMes.dataset), gridmes);
  end;
end;

procedure TfrmRelatMovimento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatMovimento.cbResultadoSelect(Sender: TObject);
begin
  inherited;
  dsListagem.dataset.close;
  dslistaMes.dataset.close;
  labtotal.caption:='0';
  if cbResultado.ItemIndex = 0 then
  begin
        gridListagem.Visible:=true;
        gridmes.Visible:=false;
  end
  else
  begin
        gridListagem.Visible:=false;
        gridmes.Visible:=true;
  end

end;

end.
