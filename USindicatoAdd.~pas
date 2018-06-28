unit USindicatoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, StdCtrls, Grids, DBGrids, WinSkinData,
  Buttons, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient;

type
  TfrmSindicatoAdd = class(TModeloInserir)
    DBGrid1: TDBGrid;
    editSindicato: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    dsSindicato: TDataSource;
    cdsSindicato: TClientDataSet;
    cdsSindicatoSINDIC_ID: TIntegerField;
    cdsSindicatoSINDIC_NOME: TStringField;
    dspSindicato: TDataSetProvider;
    sdsSindicato: TSQLDataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSindicatoAdd: TfrmSindicatoAdd;

implementation

uses UFuncoes, UDMAssociado;

{$R *.dfm}

procedure TfrmSindicatoAdd.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if editSindicato.text<>'' then
  begin
    if Confirma('Confirma inclusão deste sindicato? ') then
    begin
        DMAssociado.PROC_SINDICATO_I.close;
        DMAssociado.PROC_SINDICATO_I.ParamByName('SINDIC_NOME').value :=editSindicato.Text;
        DMAssociado.PROC_SINDICATO_I.ExecProc;
        cdsSindicato.close;
        cdsSindicato.Open;
        editSindicato.Clear;
    end;
  end;
end;

procedure TfrmSindicatoAdd.FormShow(Sender: TObject);
begin
  inherited;
  cdsSindicato.Open;
end;

end.
