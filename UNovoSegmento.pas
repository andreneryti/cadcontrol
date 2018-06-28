unit UNovoSegmento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  FMTBcd, DB, DBClient, Provider, SqlExpr, DBCtrls;

type
  TfrmNovoSegmento = class(TModeloInserir)
    Label1: TLabel;
    cbSegmento: TDBLookupComboBox;
    sdsSegmento: TSQLDataSet;
    dspSegmento: TDataSetProvider;
    cdsSegmento: TClientDataSet;
    dsSegmento: TDataSource;
    cdsSegmentoSEGMENTO_ID: TIntegerField;
    cdsSegmentoDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoSegmento: TfrmNovoSegmento;

implementation

uses UDMAssociado, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmNovoSegmento.FormShow(Sender: TObject);
begin
  inherited;
  cdsSegmento.Open;
end;

procedure TfrmNovoSegmento.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsAssocSegsSEGMENTO_ID.value = 0 then
  begin
      Aviso('Segmento não pode ser vazio. ');
      cbSegmento.Setfocus;
      Modalresult :=  mrnone;
  end;
end;

end.
