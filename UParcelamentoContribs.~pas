unit UParcelamentoContribs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls, DB,
  DBClient, Grids, DBGrids, JvDBCtrl, ExRxDBGrid;

type
  TfrmParcelamentoContribs = class(TModeloComum)
    BitBtn3: TBitBtn;
    BtnOK: TBitBtn;
    Label1: TLabel;
    Bevel1: TBevel;
    grid1: TExRxDBGrid;
    dsAnuidades: TDataSource;
    cdsAnuidades: TClientDataSet;
    cdsAnuidadesAnuid_Id: TIntegerField;
    cdsAnuidadesDescricao: TStringField;
    cdsAnuidadesAno: TIntegerField;
    cdsAnuidadesValor: TFMTBCDField;
    cdsAnuidadesVencimento: TDateField;
    cdsAnuidadesTipoContrib: TStringField;
    cdsAnuidadesParc_Id: TIntegerField;
    cdsAnuidadesNum_Parcela: TIntegerField;
    cdsAnuidadesTpContrib_id: TIntegerField;
    cdsAnuidadesMulta: TFMTBCDField;
    cdsAnuidadesJuros: TFMTBCDField;
    cdsAnuidadesCorrecao: TFMTBCDField;
    cdsAnuidadestotal: TFMTBCDField;
    cdsAnuidadesSelecionado: TBooleanField;
    Label2: TLabel;
    labtotal: TLabel;
    cbMarcar: TCheckBox;
    procedure cdsAnuidadesSelecionadoChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure MarcarTodos(marc:boolean);
    procedure cbMarcarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelamentoContribs: TfrmParcelamentoContribs;
  Valortotalparc:real;

implementation

{$R *.dfm}

procedure TfrmParcelamentoContribs.cdsAnuidadesSelecionadoChange(
  Sender: TField);
begin
  inherited;
   if cdsAnuidadesSelecionado.value = true then
       Valortotalparc := Valortotalparc + cdsAnuidadestotal.asfloat
   else
       Valortotalparc := Valortotalparc - cdsAnuidadestotal.asfloat;
   labtotal.caption := FormatFloat(',0.00',Valortotalparc);

end;

procedure TfrmParcelamentoContribs.FormShow(Sender: TObject);
begin
  inherited;
  Valortotalparc:=0;
end;

procedure TfrmParcelamentoContribs.MarcarTodos(marc: boolean);
begin
   cdsAnuidades.DisableControls;
   cdsAnuidades.First;
   while not cdsAnuidades.eof do
   begin
       cdsAnuidades.Edit;
       If cdsAnuidadesSelecionado.value = marc then
         cdsAnuidadesSelecionado.value := not marc;
       cdsAnuidadesSelecionado.value := marc;
       cdsAnuidades.post;
       cdsAnuidades.next;
   end;
   cdsAnuidades.First;
   cdsAnuidades.EnableControls;

end;

procedure TfrmParcelamentoContribs.cbMarcarClick(Sender: TObject);
begin
  inherited;
  MarcarTodos(cbMarcar.Checked);
end;

end.
