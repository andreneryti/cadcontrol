unit UBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, DB, Grids, DBGrids,
  DBClient, StdCtrls, JvDBCtrl, ExRxDBGrid, Buttons;

type
  TfrmBoleto = class(TModeloComum)
    dsAnuidades: TDataSource;
    grid1: TExRxDBGrid;
    labtexto: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbMarcar: TCheckBox;
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
    Label3: TLabel;
    Labtotalitens: TLabel;
    cbGuiaComplementar: TCheckBox;
    procedure cdsAnuidadesSelecionadoChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MarcarTodos(marc:boolean);
    procedure cbMarcarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoleto: TfrmBoleto;
  Valortotal:real;
  Totalintens:integer;
  tipo: string;
  Limitar : Integer;

implementation

uses UDmFinancas, UFuncoes;

{$R *.dfm}

procedure TfrmBoleto.cdsAnuidadesSelecionadoChange(Sender: TField);
begin
   if cdsAnuidadesSelecionado.value = true then
   begin
       Valortotal := Valortotal + cdsAnuidadestotal.asfloat;
       Totalintens := Totalintens + 1;
   end
   else
   begin
       Valortotal := Valortotal - cdsAnuidadestotal.asfloat;
       Totalintens := Totalintens - 1;
   end;
   Labtotalitens.caption := inttostr(Totalintens);
   labtotal.caption := FormatFloat(',0.00',Valortotal);

end;

procedure TfrmBoleto.FormShow(Sender: TObject);
begin
  inherited;
  Valortotal:=0;
  Totalintens:=0;
end;

procedure TfrmBoleto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if Limitar = 1 then
  begin
      If tipo ='Recibo' then
      begin
         If Totalintens > 10 then
         begin
           Aviso('Limite de 10 ítens por recibo já atingido.');
           Modalresult := mrnone;

         end;
      end
      else
      begin
        If (cdsAnuidadesTipoContrib.value<>'Sindical') and (Totalintens > 5) then
        begin
           Aviso('Limite de 5 ítens por boleto já atingido.');
           Modalresult := mrnone;
        end
        else
        If Totalintens = 0 then
           ModalResult := mrnone;
      end;
  end;
end;

procedure TfrmBoleto.MarcarTodos(marc: boolean);
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

procedure TfrmBoleto.cbMarcarClick(Sender: TObject);
begin
  inherited;
  MarcarTodos(cbMarcar.Checked);
end;

procedure TfrmBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  tipo:='';
  Limitar :=1;
end;

end.
