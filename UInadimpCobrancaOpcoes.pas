unit UInadimpCobrancaOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Mask, Buttons,
  JvToolEdit, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Grids,
  DBGrids;

type
  TfrmInadimpCobrancaOpcoes = class(TModeloComum)
    GroupBox1: TGroupBox;
    radSind: TRadioButton;
    radSindConf: TRadioButton;
    cb1Boleto: TCheckBox;
    GroupBox2: TGroupBox;
    rad1Ano: TRadioButton;
    rad2anos: TRadioButton;
    edit1ano: TMaskEdit;
    editanoini: TMaskEdit;
    editanofim: TMaskEdit;
    Label1: TLabel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    rbImprimir: TRadioButton;
    rbGerarPdf: TRadioButton;
    cbMala: TCheckBox;
    rbEnviarMala: TRadioButton;
    comboMala: TComboBox;
    editCaminho: TJvDirectoryEdit;
    Label2: TLabel;
    editNomeArquivo: TEdit;
    comboMalaPdf: TComboBox;
    sdsMalas: TSQLClientDataSet;
    sdsMalasMALA_ID: TIntegerField;
    sdsMalasNOMEIDENTIFICACAO: TStringField;
    GroupBox4: TGroupBox;
    cbObs: TCheckBox;
    memoObs: TMemo;
    cbGerarPDFAnexarArq: TCheckBox;
    cbEnviarMalaAnexarArq: TCheckBox;
    cbCobranca: TCheckBox;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    spArqAdd: TSpeedButton;
    spArqExcluir: TSpeedButton;
    cdsArquivosAnexo: TClientDataSet;
    cdsArquivosAnexonomearquivo: TStringField;
    dsArquivos: TDataSource;
    OpenDialog1: TOpenDialog;
    procedure radSindClick(Sender: TObject);
    procedure radSindConfClick(Sender: TObject);
    procedure rbGerarPdfClick(Sender: TObject);
    procedure rbImprimirClick(Sender: TObject);
    procedure rbEnviarMalaClick(Sender: TObject);
    procedure cbMalaClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbObsClick(Sender: TObject);
    procedure spArqAddClick(Sender: TObject);
    procedure spArqExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbGerarPDFAnexarArqClick(Sender: TObject);
    procedure cbEnviarMalaAnexarArqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInadimpCobrancaOpcoes: TfrmInadimpCobrancaOpcoes;
  Ano1, Ano2 :integer;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmInadimpCobrancaOpcoes.radSindClick(Sender: TObject);
begin
  inherited;
  cb1Boleto.Checked :=false;
  cb1Boleto.Enabled :=false;

end;

procedure TfrmInadimpCobrancaOpcoes.radSindConfClick(Sender: TObject);
begin
  inherited;
  cb1Boleto.Enabled :=true;

end;

procedure TfrmInadimpCobrancaOpcoes.rbGerarPdfClick(Sender: TObject);
begin
  inherited;
  cbmala.Enabled:=true;
  editCaminho.Enabled:=true;
  editNomeArquivo.Enabled:=true;
  editCaminho.setfocus;
  cbGerarPDFAnexarArq.Enabled:=true;
  cbCobranca.Enabled:=false;
  cbEnviarMalaAnexarArq.Enabled:=false;
  comboMala.Enabled:=false;
  comboMala.ItemIndex:=-1;
  comboMalaPdf.ItemIndex:=-1;
  cbCobranca.Checked:=false;
  cbEnviarMalaAnexarArq.Checked:=false;

end;

procedure TfrmInadimpCobrancaOpcoes.rbImprimirClick(Sender: TObject);
begin
  inherited;
  cbmala.Checked:=false;
  cbMala.Enabled:=false;
  editCaminho.Enabled:=false;
  editCaminho.Clear;
  comboMala.Enabled:=false;
  comboMala.ItemIndex:=-1;
  comboMalaPdf.Enabled:=false;
  comboMalaPdf.ItemIndex:=-1;
  editNomeArquivo.Enabled:=false;
  editNomeArquivo.clear;
  cbGerarPDFAnexarArq.Enabled:=false;
  cbCobranca.Enabled:=false;
  cbEnviarMalaAnexarArq.Enabled:=false;
  cbGerarPDFAnexarArq.Checked:=false;
  cbCobranca.Checked:=false;
  cbEnviarMalaAnexarArq.Checked:=false;


end;

procedure TfrmInadimpCobrancaOpcoes.rbEnviarMalaClick(Sender: TObject);
begin
  inherited;
  cbmala.enabled:=false;
  cbMala.Checked:=false;
  editCaminho.Clear;
  editCaminho.Enabled:=false;
  editNomeArquivo.Enabled:=false;
  editNomeArquivo.clear;

  comboMala.Enabled:=false;
  comboMala.ItemIndex:=-1;
  comboMalaPdf.Enabled:=false;
  comboMalaPdf.ItemIndex:=-1;
  comboMala.Enabled:=true;
  cbGerarPDFAnexarArq.Enabled:=false;
  cbCobranca.Enabled:=true;
  cbEnviarMalaAnexarArq.Enabled:=true;
  cbGerarPDFAnexarArq.Checked:=false;

end;

procedure TfrmInadimpCobrancaOpcoes.cbMalaClick(Sender: TObject);
begin
  inherited;
  comboMalaPdf.Enabled:=cbMala.Enabled;
  //comboMalaPdf.Setfocus;
end;

procedure TfrmInadimpCobrancaOpcoes.BtnOKClick(Sender: TObject);


begin
  inherited;
  if rbGerarPdf.Checked = true then
  begin
      If editCaminho.text ='' then
      begin
          Aviso('Digite o nome da pasta destino onde serão salvos os PDFs. ');
          ModalResult := mrNone;
          editCaminho.Setfocus;
          abort;
      end
      else
      if not (DirectoryExists(editCaminho.text)) then
      begin
          Aviso('Caminho destino enexistente.');
          editCaminho.clear;
          editCaminho.Setfocus;
          ModalResult := mrNone;
          abort;
      end;

      If editNomeArquivo.text='' then
      begin
        Aviso('Defina o nome inicial dos arquivos pdfs.');
        ModalResult := mrNone;
        editNomeArquivo.Setfocus;
        abort;
      end;

      If cbMala.Checked = true then
      begin
          If comboMalaPdf.ItemIndex = -1 then
          begin
            Aviso('Selecione a Mala Direta destino. ');
            ModalResult := mrNone;
            comboMalaPdf.Setfocus;
            abort;
          end;
          sdsMalas.Locate('NOMEIDENTIFICACAO', comboMalaPdf.Text,[]);
      end;
  end
  else
  If rbEnviarMala.Checked=true then
  begin
      If comboMala.ItemIndex = -1 then
      begin
        Aviso('Selecione a Mala Direta destino. ');
        ModalResult := mrNone;
        comboMala.Setfocus;
        abort;
      end;

    {  If (cbCobranca.Checked = false) and (cbEnviarMalaAnexarArq.Checked = false)  then
      begin
        Aviso('Marque pelo menos uma dentre as opções: "Cobrança" e "Anexar Arquivo(s)". ');
        ModalResult := mrNone;
        abort;
      end;      }
      sdsMalas.Locate('NOMEIDENTIFICACAO', comboMala.Text,[]);
  end
  else
  If cbobs.Checked = true then
  begin
      If memoObs.Lines.Text ='' then
      begin
          Aviso('Defina a mensagem a ser incluída como observação no cadastro.');
          ModalResult := mrNone;
          memoObs.SetFocus;
          abort;
     end;
  end
  else
  if ((cbGerarPDFAnexarArq.Checked = true) or (cbEnviarMalaAnexarArq.checked = true)) and (cdsArquivosAnexo.RecordCount = 0) then
  begin
          Aviso('Defina um ou mais arquivos a serem anexados à Mala direta. ');
          ModalResult := mrNone;
          abort;
  end;




end;

procedure TfrmInadimpCobrancaOpcoes.FormShow(Sender: TObject);
begin
  inherited;
  sdsMalas.open;
  sdsMalas.first;
  while not sdsMalas.eof do
  begin
     comboMala.Items.add(sdsMalasNOMEIDENTIFICACAO.value);
     comboMalaPdf.Items.add(sdsMalasNOMEIDENTIFICACAO.value);
     sdsMalas.next;
  end;
end;

procedure TfrmInadimpCobrancaOpcoes.cbObsClick(Sender: TObject);
begin
  inherited;
  memoobs.Enabled := cbObs.Enabled;

end;

procedure TfrmInadimpCobrancaOpcoes.spArqAddClick(Sender: TObject);
begin
  inherited;

   cdsArquivosAnexo.Append;
   cdsArquivosAnexo.Edit;
   If OpenDialog1.execute then
   begin
      if Length(extractfilename(OpenDialog1.FileName))>44 then
      begin
          cdsArquivosAnexo.cancel;
          Aviso('Nome do arquivo excedeu o limite de 40 caracteres. ');
          Exit;
      end;
      cdsArquivosAnexonomearquivo.value := OpenDialog1.FileName;
      cdsArquivosAnexo.post;
   end;
     cdsArquivosAnexo.cancel;
 

end;

procedure TfrmInadimpCobrancaOpcoes.spArqExcluirClick(Sender: TObject);
begin
  inherited;
  If cdsArquivosAnexo.RecordCount > 0 then
      If Confirma('Deseja excluir o arquivo selecionado? ') then
      begin
          cdsArquivosAnexo.Edit;
          cdsArquivosAnexo.Delete;
      end;
end;

procedure TfrmInadimpCobrancaOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
cdsArquivosAnexo.CreateDataSet;
cdsArquivosAnexo.open;
end;

procedure TfrmInadimpCobrancaOpcoes.cbGerarPDFAnexarArqClick(
  Sender: TObject);
begin
  inherited;
  spArqAdd.Enabled := (cbGerarPDFAnexarArq.Checked =  true) or (cbEnviarMalaAnexarArq.Checked =  true);
  spArqExcluir.Enabled :=(cbGerarPDFAnexarArq.Checked = true) or (cbEnviarMalaAnexarArq.Checked =  true);
end;

procedure TfrmInadimpCobrancaOpcoes.cbEnviarMalaAnexarArqClick(
  Sender: TObject);
begin
  inherited;
  spArqAdd.Enabled := (cbGerarPDFAnexarArq.Checked =  true) or (cbEnviarMalaAnexarArq.Checked =  true);
  spArqExcluir.Enabled :=(cbGerarPDFAnexarArq.Checked = true) or (cbEnviarMalaAnexarArq.Checked =  true);

end;

end.
