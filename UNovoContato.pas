unit UNovoContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfrmNovoContato = class(TModeloInserir)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    editDescricao: TDBEdit;
    cbTipo: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBMemo;
    sdsTp_Status: TSQLDataSet;
    dspTp_Status: TDataSetProvider;
    cdsTp_Status: TClientDataSet;
    cdsTp_StatusTP_STATUS_ID: TIntegerField;
    cdsTp_StatusTP_STATUS_DESCR: TStringField;
    dsTp_Status: TDataSource;
    sdsTp_Contato: TSQLDataSet;
    dspTp_Contato: TDataSetProvider;
    cdsTp_Contato: TClientDataSet;
    dsTp_Contato: TDataSource;
    cdsTp_ContatoTP_CONTATO: TIntegerField;
    cdsTp_ContatoTP_CONTATO_DESC: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure cbTipoCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoContato: TfrmNovoContato;

implementation

uses UDMAssociado, UFuncoes;

{$R *.dfm}

procedure TfrmNovoContato.FormShow(Sender: TObject);
begin
  inherited;
  cdsTp_Contato.Open;
  cdsTp_Status.Open;
end;

procedure TfrmNovoContato.btGravarClick(Sender: TObject);
begin
  inherited;
  if DMAssociado.cdsContatoTP_CONTATO.value = 0 then
  begin
     Aviso('Campo "Tipo de Contato" não pode ser vazio. ' );
     cbTipo.setfocus;
     ModalResult := mrnone;
  end
  else
  if DMAssociado.cdsContatoCONTATO_DESCR.value = ''then
  begin
     Aviso('Campo "Descrição" não pode ser vazio. ' );
     editDescricao.SetFocus;
     ModalResult := mrnone;
  end;

end;

procedure TfrmNovoContato.cbTipoCloseUp(Sender: TObject);
begin
  inherited;
  if ( cdsTp_ContatoTP_CONTATO.value in [2]) then
     DMAssociado.cdsContatoCONTATO_DESCR.EditMask := '(99)#9999-9999'
  else

  if ( cdsTp_ContatoTP_CONTATO.value in [1,4,6]) and ((editDescricao.text='') or (DMAssociado.cdsContatoCONTATO_DESCR.EditMask ='(99)9999-9999')) then
     DMAssociado.cdsContatoCONTATO_DESCR.EditMask := '(99)9999-9999'
  else
     DMAssociado.cdsContatoCONTATO_DESCR.EditMask :='';

end;

end.
