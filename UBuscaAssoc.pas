unit UBuscaAssoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloLoc, Mask, StdCtrls, UCDefine, WinSkinData, Grids,
  DBGrids, Buttons, ExtCtrls;

type
  TfrmBuscaAssoc = class(TModeloLocalizar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edcpfcnpj: TEdit;
    edNome: TEdit;
    edRegistro: TMaskEdit;
    BtOk: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaAssoc: TfrmBuscaAssoc;

implementation

uses UDMAssociado;

{$R *.dfm}

procedure TfrmBuscaAssoc.BtOkClick(Sender: TObject);
begin
//  inherited;
  If DMAssociado.dsLocAssoc.dataset.RecordCount =0 then
    Modalresult:= mrnone;

end;

procedure TfrmBuscaAssoc.btLocalizarClick(Sender: TObject);
var
  i: integer;
begin
   gridLocalizar.DataSource.DataSet.close;
   for i := 0 to 2 do
      Dmassociado.cdsLocAssoc.params[i].clear;

   if edRegistro.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('registro').value:= edRegistro.Text;

   if edNome.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('nome').value:= edNome.Text;

   if edcpfcnpj.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('CPFCNPJ').value:= edcpfcnpj.Text;

   Dmassociado.cdsLocAssoc.open;
end;
end.
