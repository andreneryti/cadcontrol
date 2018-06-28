unit UNovoAssocSindic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Mask, FMTBcd, DB, DBClient, Provider, SqlExpr, JvDateUtil;

type
  TfrmNovoAssocSindic = class(TModeloInserir)
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBMemo;
    SpeedButton1: TSpeedButton;
    comboSindic: TDBLookupComboBox;
    sdsSindicato: TSQLDataSet;
    dspSindicato: TDataSetProvider;
    cdsSindicato: TClientDataSet;
    dsSindicato: TDataSource;
    cdsSindicatoSINDIC_ID: TIntegerField;
    cdsSindicatoSINDIC_NOME: TStringField;
    Label1: TLabel;
    Editano: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoAssocSindic: TfrmNovoAssocSindic;

implementation

uses UDMAssociado, USindicatoAdd, UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmNovoAssocSindic.FormShow(Sender: TObject);
begin
  inherited;
  cdsSindicato.Open;
  Editano.Text := inttostr( ExtractYear(DataAtual));
end;

procedure TfrmNovoAssocSindic.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try Application.CreateForm(TfrmSindicatoAdd,frmSindicatoAdd);
  frmSindicatoAdd.ShowModal;
  cdsSindicato.Close;
  cdsSindicato.Open;
  finally
  frmSindicatoAdd.free;
  end;
end;

procedure TfrmNovoAssocSindic.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsAssocSindicSINDIC_ID.value = 0 then
  begin
     Aviso('Sindicato não pode ser vazio. ');
     comboSindic.setfocus;
     modalresult := mrnone;
 end;

 Try
    Strtoint(Editano.text);

 except
     Aviso('Ano inválido. ');
     Editano.setfocus;
     modalresult := mrnone;
 end;
end;

end.
