unit UDocumentoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, DBCtrls, StdCtrls,
  Buttons, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
  TfrmDocumentoAdd = class(TModeloComum)
    Label1: TLabel;
    Label2: TLabel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    btArquivo: TBitBtn;
    ediLocal: TEdit;
    OpenDialog1: TOpenDialog;
    sdsTpNotif: TSQLClientDataSet;
    Bevel1: TBevel;
    sdsTpNotifTP_NOTIF_ID: TIntegerField;
    sdsTpNotifDESCRICAO: TStringField;
    dsTpNotif: TDataSource;
    cdsAux: TClientDataSet;
    cdsAuxtpnotif_id: TIntegerField;
    dsAux: TDataSource;
    procedure btArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDocumentoAdd: TfrmDocumentoAdd;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmDocumentoAdd.btArquivoClick(Sender: TObject);
begin
  inherited;
If OpenDialog1.execute then
      ediLocal.Text := OpenDialog1.FileName;
end;

procedure TfrmDocumentoAdd.FormCreate(Sender: TObject);
begin
  inherited;
   cdsAux.CreateDataSet;
end;

procedure TfrmDocumentoAdd.BtnOKClick(Sender: TObject);
begin
  inherited;

  If cdsAuxtpnotif_id.Value = 0  then
  begin
      Aviso('Tipo de Documento não pode ser vazio. ');
      ModalResult := mrNone;
      Exit;
  end;

  If ediLocal.Text ='' then
  begin
      Aviso('Documento não pode ser vazio. ');
      ModalResult := mrNone;
      Exit;
  end;

  if not (FileExists(ediLocal.Text)) then
  begin
      Aviso('Documento não encontrado. ');
      ModalResult := mrNone;
      Exit;
  end;



end;

procedure TfrmDocumentoAdd.FormShow(Sender: TObject);
begin
  inherited;
  sdsTpNotif.Close;
  sdsTpNotif.Open;
end;

end.
