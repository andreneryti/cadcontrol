unit UPrescricao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Grids,
  DBGrids, JvDBCtrl, ExRxDBGrid, DB, DBClient, Buttons;

type
  TfrmPrescricao = class(TModeloComum)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    grid1: TExRxDBGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrescricao: TfrmPrescricao;

implementation

{$R *.dfm}

procedure TfrmPrescricao.FormCreate(Sender: TObject);
begin
  inherited;
  cdsAnuidades.createdataset;
end;

end.
