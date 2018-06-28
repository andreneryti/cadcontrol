unit UParcelamentoMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, Provider, SqlExpr,
  StdCtrls, Buttons, DB, DBLocal, DBLocalS, Grids, DBGrids, DBClient;

type
  TfrmParcelamentoMalaDireta = class(TModeloComum)
    comboMala: TComboBox;
    cbEnviarMalaAnexarArq: TCheckBox;
    cdsArquivosAnexo: TClientDataSet;
    cdsArquivosAnexonomearquivo: TStringField;
    dsArquivos: TDataSource;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    spArqAdd: TSpeedButton;
    spArqExcluir: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    sdsMalas: TSQLClientDataSet;
    sdsMalasMALA_ID: TIntegerField;
    sdsMalasNOMEIDENTIFICACAO: TStringField;
    Bevel1: TBevel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    chkNotifExtraJud: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cbEnviarMalaAnexarArqClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spArqAddClick(Sender: TObject);
    procedure spArqExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelamentoMalaDireta: TfrmParcelamentoMalaDireta;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmParcelamentoMalaDireta.FormShow(Sender: TObject);
begin
  inherited;
  sdsMalas.open;
  sdsMalas.first;
  while not sdsMalas.eof do
  begin
     comboMala.Items.add(sdsMalasNOMEIDENTIFICACAO.value);
     sdsMalas.next;
  end;

end;

procedure TfrmParcelamentoMalaDireta.cbEnviarMalaAnexarArqClick(
  Sender: TObject);
begin
  inherited;
  spArqAdd.Enabled := cbEnviarMalaAnexarArq.Checked =  true;
  spArqExcluir.Enabled :=cbEnviarMalaAnexarArq.Checked =  true;
end;

procedure TfrmParcelamentoMalaDireta.BtnOKClick(Sender: TObject);
begin
  inherited;
  If comboMala.ItemIndex = -1 then
  begin
    Aviso('Selecione a Mala Direta destino. ');
    ModalResult := mrNone;
    comboMala.Setfocus;
    abort;
  end;

  sdsMalas.Locate('NOMEIDENTIFICACAO', comboMala.Text,[]);

  if (cbEnviarMalaAnexarArq.checked = true) and (cdsArquivosAnexo.RecordCount = 0) then
  begin
    Aviso('Defina um ou mais arquivos a serem anexados à Mala direta. ');
    ModalResult := mrNone;
    abort;
  end;


end;

procedure TfrmParcelamentoMalaDireta.FormCreate(Sender: TObject);
begin
  inherited;
   cdsArquivosAnexo.CreateDataSet;
end;

procedure TfrmParcelamentoMalaDireta.spArqAddClick(Sender: TObject);
begin
  inherited;

   cdsArquivosAnexo.Append;
   cdsArquivosAnexo.Edit;
   If OpenDialog1.execute then
   begin
      cdsArquivosAnexonomearquivo.value := OpenDialog1.FileName;
      cdsArquivosAnexo.post;
   end;
     cdsArquivosAnexo.cancel;


end;

procedure TfrmParcelamentoMalaDireta.spArqExcluirClick(Sender: TObject);
begin
  inherited;
  If cdsArquivosAnexo.RecordCount > 0 then
      If Confirma('Deseja excluir o arquivo selecionado? ') then
      begin
          cdsArquivosAnexo.Edit;
          cdsArquivosAnexo.Delete;
      end;

end;

end.
