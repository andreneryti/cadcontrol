unit URelatAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, DB, ActnList, Grids, DBGrids, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, WinSkinData, dbClient;

type
  TfrmRelatAtendimentos = class(TModeloComum)
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    spGerarPlanilha: TSpeedButton;
    Label1: TLabel;
    btLocalizar: TBitBtn;
    EditAno: TEdit;
    UpDown1: TUpDown;
    gridListagem: TDBGrid;
    ActionList1: TActionList;
    acGerarPlanilha: TAction;
    dsListagem: TDataSource;
    Label3: TLabel;
    labtotal: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure gridListagemDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAtendimentos: TfrmRelatAtendimentos;

implementation

uses UDMAssociado, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmRelatAtendimentos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatAtendimentos.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
  If dsListagem.dataset.Active=true then
     if dsListagem.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsListagem.dataset), gridListagem);


end;

procedure TfrmRelatAtendimentos.gridListagemDrawColumnCell(Sender: TObject;
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

procedure TfrmRelatAtendimentos.FormShow(Sender: TObject);
begin
  inherited;
  dsListagem.DataSet.close;
  EditAno.text := inttostr(Extractyear(DataAtual));

end;

procedure TfrmRelatAtendimentos.btLocalizarClick(Sender: TObject);
begin
  inherited;
begin
   TClientDataset(dsListagem.dataset).close;

   labtotal.caption:='0';
   Application.ProcessMessages;

   ExibeAguarde('Gerando Rela��o de Atendimentos...');

   dsListagem.dataset.Close;

   TClientDataset(dsListagem.dataset).Params.ParamByName('ano').value := strtoint(stringreplace(EditAno.text,'.','',[rfReplaceall]));

   TClientDataset(dsListagem.dataset).Open;

   TClientDataset(dsListagem.dataset).last;

   try
   labtotal.Caption:= inttostr(TClientDataset(dsListagem.dataset).fieldbyname('TOTALGERAL').value);
   except
   labtotal.Caption:='0';
   end;
   TClientDataset(dsListagem.dataset).first;

   EscondeAguarde;
end;

end;

end.
