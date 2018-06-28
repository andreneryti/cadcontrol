unit USimulacaoGuia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls, Mask,
  JvEdit, JvTypedEdit, Grids, DBGrids, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS;

type
  TfrmSimulacaoGuia = class(TModeloComum)
    BitBtn1: TBitBtn;
    cbTipoContrib: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    editValor: TJvCurrencyEdit;
    editVencimento: TMaskEdit;
    edDataBase: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    PROC_SIMULACAOVALOR: TSQLClientDataSet;
    dsSimula: TDataSource;
    PROC_SIMULACAOVALORVALOR: TFMTBCDField;
    PROC_SIMULACAOVALORMULTA: TFMTBCDField;
    PROC_SIMULACAOVALORJUROS: TFMTBCDField;
    PROC_SIMULACAOVALORCORRECAO: TFMTBCDField;
    PROC_SIMULACAOVALORTOTAL: TFMTBCDField;
    PROC_SIMULACAOVALORDESCRICAO: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    Procedure Calcula;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimulacaoGuia: TfrmSimulacaoGuia;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmSimulacaoGuia.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSimulacaoGuia.BitBtn2Click(Sender: TObject);
begin
  inherited;
  PROC_SIMULACAOVALOR.close;
  try
     strtodate(editVencimento.Text);
  except
     Aviso('Data de vencimento inválida. ');
     editVencimento.SetFocus;
     ModalResult := mrnone;
     abort;
  end;

  try
     strtodate(edDataBase.Text);
  except
     Aviso('Data Base inválida. ');
     edDataBase.SetFocus;
     ModalResult := mrnone;
     abort;
  end;

  If editValor.Value = 0 then
  begin
     Aviso('Valor inválido. ');
     editValor.SetFocus;
     ModalResult := mrnone;
     abort;
  end;

  Calcula;

end;

procedure TfrmSimulacaoGuia.BitBtn4Click(Sender: TObject);
begin
  inherited;
   frmSimulacaoGuia.Print;
end;

procedure TfrmSimulacaoGuia.BitBtn3Click(Sender: TObject);
begin
  inherited;
  editVencimento.Clear;
  editValor.value :=0;
  edDataBase.clear;
  cbTipoContrib.ItemIndex :=0;
  PROC_SIMULACAOVALOR.close;
  editVencimento.SetFocus;
end;

procedure TfrmSimulacaoGuia.Calcula;
begin
   PROC_SIMULACAOVALOR.close;
   PROC_SIMULACAOVALOR.Params.ParamByName('datavenc').value :=  strtodate(editVencimento.Text);
   PROC_SIMULACAOVALOR.Params.ParamByName('data_base').value := strtodate(edDataBase.Text);
   PROC_SIMULACAOVALOR.Params.ParamByName('valorguia').value :=editValor.Value;
   PROC_SIMULACAOVALOR.Params.ParamByName('tipocontrib').value :=cbTipoContrib.ItemIndex+1;
   PROC_SIMULACAOVALOR.open;
end;

procedure TfrmSimulacaoGuia.FormCreate(Sender: TObject);
begin
  inherited;
  editValor.value :=0;
end;

end.
