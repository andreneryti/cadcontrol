unit UNovoEnder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, FMTBcd;

type
  TfrmNovoEnder = class(TModeloInserir)
    Label3: TLabel;
    editEndereco: TDBEdit;
    Label4: TLabel;
    edNumero: TDBEdit;
    Label5: TLabel;
    editComplemento: TDBEdit;
    Label6: TLabel;
    editBairro: TDBEdit;
    Label8: TLabel;
    editCep: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    cbCidade: TDBLookupComboBox;
    cbTpEnder: TDBLookupComboBox;
    cbCorresp: TDBLookupComboBox;
    cbDev: TDBLookupComboBox;
    cbEstado: TComboBox;
    sdsCorresp: TSQLClientDataSet;
    dspCorresp: TDataSetProvider;
    cdsCorresp: TClientDataSet;
    dsCorresp: TDataSource;
    sdsCorrespDev: TSQLClientDataSet;
    dspCorrespDev: TDataSetProvider;
    cdsCorrespDev: TClientDataSet;
    dsCorrespDev: TDataSource;
    cdsCorrespCOD: TIntegerField;
    cdsCorrespDESCR: TStringField;
    sdsEstado: TSQLDataSet;
    dspEstado: TDataSetProvider;
    cdsEstado: TClientDataSet;
    cdsEstadoESTADO_ID: TIntegerField;
    cdsEstadoESTADO_SIGLA: TStringField;
    sdsCidades: TSQLDataSet;
    dspCidades: TDataSetProvider;
    cdsCidades: TClientDataSet;
    dsCidades: TDataSource;
    sdsTipoEnder: TSQLClientDataSet;
    dspTipoEnder: TDataSetProvider;
    cdsTipoEnder: TClientDataSet;
    dsTipoEnder: TDataSource;
    cdsTipoEnderTP_ENDER_ID: TIntegerField;
    cdsTipoEnderTP_ENDER_DESCR: TStringField;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure cbEstadoSelect(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoEnder: TfrmNovoEnder;

implementation

uses UDMAssociado, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmNovoEnder.FormShow(Sender: TObject);
begin
  inherited;
  cdsCorresp.Open;
  cdsCorrespDev.Open;
  cdsTipoEnder.Open;
  if DMAssociado.dsEnder.DataSet.fieldbyname('END_LOGRADOURO').value=null then
  begin
     DMAssociado.dsEnder.DataSet.fieldbyname('end_corresp').value:=1;
     cdsCorresp.Locate('descr', 'Sim',[]);
  end;
  editEndereco.SetFocus;
end;

procedure TfrmNovoEnder.cbEstadoSelect(Sender: TObject);
begin
  inherited;
  cdsCidades.close;
  cdsCidades.Params.ParamByName('sigla').value := cbEstado.Text;
  cdsCidades.open;

end;

procedure TfrmNovoEnder.btGravarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.dsEnder.DataSet.FieldByName('END_LOGRADOURO').value = null then
  begin
      Aviso('Campo "Endere�o" � obrigat�rio. ');
      editEndereco.setfocus;
      ModalResult := mrNone;
  end
  else
  If DMAssociado.dsEnder.DataSet.FieldByName('END_BAIRRO').value = null then
  begin
      Aviso('Campo "Bairro" � obrigat�rio. ');
      editBairro.setfocus;
      ModalResult := mrNone;
  end
  else
  If DMAssociado.dsEnder.DataSet.FieldByName('CIDADE_ID').value = null then
  begin
      Aviso('Campo "Cidade" � obrigat�rio. ');
      cbCidade.setfocus;
      ModalResult := mrNone;
  end
  else
  If DMAssociado.dsEnder.DataSet.FieldByName('END_CEP').value = null then
  begin
      Aviso('Campo "Cep" � obrigat�rio. ');
      editcep.setfocus;
      ModalResult := mrNone;
  end
  else
  If DMAssociado.dsEnder.DataSet.FieldByName('TP_ENDER_ID').value = null then
  begin
      Aviso('Campo "Tipo de Endere�o" � obrigat�rio. ');
      cbTpEnder.Setfocus;
      ModalResult := mrNone;
  end
  else
  If DMAssociado.dsEnder.DataSet.FieldByName('END_CORRESP').value = null then
  begin
      Aviso('Defina se � endere�o de correspond�ncia ou n�o. ');
      cbCorresp.SetFocus;
      ModalResult := mrNone;
  end;
end;

procedure TfrmNovoEnder.SpeedButton1Click(Sender: TObject);
var
  cep : TStringList;
begin
  inherited;
 { Try

   cep := buscaCEP(EDITCEP.Text);
   if cep = nil then
       aviso('CEP n�o localizado ou n�o h� conex�o com a Internet.  ')
   else
   if cEP.Values['RESULTADO'] <> '1' then
       Aviso('CEP n�o localizado! ')
   else
   begin
     editEndereco.text :=  CEP.Values['TIPO_LOGRADOURO'] + ' ' + CEP.Values['LOGRADOURO'];
     editBairro.text :=  CEP.Values['BAIRRO'];
     dsCidades.DataSet.Locate( UPPERCASE(REMOVEACENTO(dsCidades.DataSet.FIELDBYNAME('CIDADE_NOME').VALUE),CEP.Values['CIDADE'],[locaseinsensitive]);
     cbEstado.ItemIndex := cbEstado.Items.IndexOf(cEP.Values['UF']);
     CBCIDADE.
   end;
 except
   Aviso('N�o � poss�vel conex�o com a Internet.');
 end;
  }
end;

end.
