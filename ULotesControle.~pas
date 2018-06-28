unit ULotesControle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Grids, DBGrids, StdCtrls, DB, DBClient, WinSkinData,
  ExtCtrls, DBCtrls, Buttons, ComCtrls, JvDBCtrl, ExRxDBGrid, Provider, SqlExpr,
  DBLocal, DBLocalS, JvSelectDirectory, Menus, UCDefine, ShellAPI;

type
  TfrmLotesControle = class(TModeloComum)
    cbMarc: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    dsLocLotes: TDataSource;
    Panel2: TPanel;
    Bevel1: TBevel;
    txtDescricao: TDBText;
    radNovo: TRadioButton;
    radexiste: TRadioButton;
    DBLookupComboBox1: TDBLookupComboBox;
    btnok: TBitBtn;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    cdsAuxidlote: TIntegerField;
    cdsItens: TClientDataSet;
    cdsItensREGISTRO: TStringField;
    cdsItensNOME: TStringField;
    cdsItensULT_STATUS: TStringField;
    cdsItensTP_PESSOA: TStringField;
    cdsItensass_id: TIntegerField;
    cdsItensselecionado: TBooleanField;
    cdsItensIDLOTEITEM: TIntegerField;
    cdsItenscpfcnpj: TStringField;
    dsItens: TDataSource;
    cdsItensanos: TStringField;
    cdsItenstotalvalor: TFloatField;
    cdsResultado: TClientDataSet;
    cdsResultadosituacao: TIntegerField;
    cdsResultadoregistro: TStringField;
    cdsResultadonome: TStringField;
    cdsResultadomotivo: TStringField;
    RichEdit2: TRichEdit;
    RichEdit1: TRichEdit;
    grid1: TExRxDBGrid;
    Label1: TLabel;
    labtotal: TLabel;
    btnDocumentos: TBitBtn;
    btnGerarPlanilha: TBitBtn;
    btnManutRepasse: TBitBtn;
    btn5: TBitBtn;
    btnAtualizarValores: TBitBtn;
    sdsContribs: TSQLClientDataSet;
    sdsContribsANO: TIntegerField;
    sdsContribsTOTAL: TFMTBCDField;
    sdsNumNotificacao: TSQLClientDataSet;
    sdsNumNotificacaoNUMNOTIF: TStringField;
    sdsEndereco: TSQLClientDataSet;
    sdsEnderecoEND_ID: TIntegerField;
    sdsEnderecoEND_LOGRADOURO: TStringField;
    sdsEnderecoEND_NUMERO: TStringField;
    sdsEnderecoEND_COMPLEMENTO: TStringField;
    sdsEnderecoEND_BAIRRO: TStringField;
    sdsEnderecoEND_CEP: TStringField;
    sdsEnderecoCIDADE_ID: TIntegerField;
    sdsEnderecoTP_ENDER_ID: TIntegerField;
    sdsEnderecoEND_CORRESP: TSmallintField;
    sdsEnderecoEND_CORRESP_DEV: TSmallintField;
    sdsEnderecoSTATUSCORRESP: TStringField;
    sdsEnderecoCIDADE_NOME: TStringField;
    sdsEnderecoESTADO_NOME: TStringField;
    sdsEnderecoTP_ENDER_DESCR: TStringField;
    btnAdicionarRegistro: TBitBtn;
    cdsItensemp_id: TIntegerField;
    cdsItenssindicato: TStringField;
    pmOperacoes: TPopupMenu;
    ExcluirCadastrodoLote1: TMenuItem;
    cdsMascaraAra: TClientDataSet;
    cdsMascaraAranome: TStringField;
    cdsMascaraAraendereco: TStringField;
    cdsMascaraAranumero: TStringField;
    cdsMascaraAracomplemento: TStringField;
    cdsMascaraArabairro: TStringField;
    cdsMascaraAracidade: TStringField;
    cdsMascaraArauf: TStringField;
    cdsMascaraAracep: TStringField;
    N1: TMenuItem;
    IncluiroutrasContribuies1: TMenuItem;
    btnEnviarMala: TBitBtn;
    cdsItensemail: TStringField;
    UCControls1: TUCControls;
    cdsItensnotificacao: TStringField;
    N2: TMenuItem;
    ExibirNotificaoExtrajudicial1: TMenuItem;
    Label2: TLabel;
    editloc: TEdit;
    btLocalizar: TSpeedButton;
    Bevel2: TBevel;
    VisualizarContribuies1: TMenuItem;
    procedure btnokClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LocLotes;
    procedure AtualizaItens;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnDocumentosClick(Sender: TObject);
    procedure AtualizaContribs;
    procedure GeraEtiquetas;
    procedure GeraNotificaoExtraJudicial;
    procedure GeraMascaraAR;
    function TestaEndereco(ass_id: integer): integer;
    function RetonaAnuidades: string;
    procedure cbMarcClick(Sender: TObject);
    procedure MarcarTodos(marc: boolean);
    procedure btnAtualizarValoresClick(Sender: TObject);
    procedure btnGerarPlanilhaClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnManutRepasseClick(Sender: TObject);
    procedure btnAdicionarRegistroClick(Sender: TObject);
    procedure ExcluirCadastrodoLote1Click(Sender: TObject);
    procedure IncluiroutrasContribuies1Click(Sender: TObject);
    procedure btnEnviarMalaClick(Sender: TObject);
    function AnexarArquivosAmala:integer;
    function AnexarNotificacaoExtraJud:integer;
    procedure ExibirNotificaoExtrajudicial1Click(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure VisualizarContribuies1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);

var
  frmLotesControle: TfrmLotesControle;
  Endereco: string;
  IdMala, item_id:integer;

implementation

uses
  UDmlotes, ULoteNovo, UDMConexao, UFuncoes, ULoteGeraDocumento,
  UqrRelatAddLote, UEtiquetas, UnLoteLocRegistro,
  ULotesRelatRepasse, ULoteControleAddContrib, UParcelamentoMalaDireta,
  UDMMalaDireta, UQrNotExtrajudicial, ULoteItemVerContribs;

{$R *.dfm}

procedure TfrmLotesControle.AtualizaItens;
var
  i: integer;
begin
  DMLotes.sdsItens.close;
  DMLotes.sdsItens.Params.ParamByName('idlote').value := cdsAuxidlote.value;
  DMLotes.sdsItens.open;

  cdsItens.open;
  cdsItens.EmptyDataSet;
  dmlotes.sdsItens.First;
  while not dmlotes.sdsItens.eof do
  begin
    cdsitens.Append;
    cdsitens.Edit;
    for i := 0 to dmlotes.sdsItens.fields.count - 1 do
    begin
      cdsItens.FieldByName(dmlotes.sdsItens.fields[i].FieldName).value := dmlotes.sdsItens.fieldbyname(dmlotes.sdsItens.fields[i].FieldName).value;
    end;
    cdsItenscpfcnpj.value := MaskCPFCGC(cdsItenscpfcnpj.value);
    cdsItensselecionado.Value := true;
    cdsitens.Post;
    dmlotes.sdsItens.next;
  end;
  cdsitens.first;
  labtotal.caption := inttostr(dsitens.dataset.RecordCount);

  if dsitens.dataset.RecordCount > 0 then
  begin
    cbMarc.Visible := true;
    grid1.Columns[0].Visible := true;
  end
  else
  begin
    cbMarc.Visible := false;
    grid1.Columns[0].Visible := false;
  end;


end;

procedure TfrmLotesControle.btnokClick(Sender: TObject);
begin
  if radNovo.Checked = true then
  begin
    try
      application.createform(TfrmLoteNovo, frmLoteNovo);
      if frmLoteNovo.showmodal = mrok then
      begin

        if (DMConexao.ExecuteProc('PROC_LOTE_I', quotedstr(frmLoteNovo.editNomeLote.text) + ',' + quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' + inttostr(UserId) + ',' + quotedstr(frmLoteNovo.editDescr.text))) = 0 then
        begin
          Aviso('Erro ao tentar criar o novo lote. ');
          exit;
        end;
        Dmconexao.GeraAutoNumber('GEN_NUMLOTE', 1);
        LocLotes;
        radexiste.Checked := true;
        DMLotes.cdsLocLotes.Locate('NOMELOTE', frmLoteNovo.editNomeLote.text, []);
        cdsAux.edit;
        cdsAuxidlote.value := DMLotes.cdsLocLotesIDLOTE.value;
      end;
    finally
      frmLoteNovo.free;
    end;
  end;

  AtualizaItens;
  
end;

procedure TfrmLotesControle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMLotes.cdsLocLotes.close;
end;

procedure TfrmLotesControle.LocLotes;
begin
  dmlotes.cdsLocLotes.close;
  dmlotes.cdsLocLotes.open;
  dmlotes.cdsLocLotes.first;
  cdsAuxidlote.value := dmlotes.cdsLocLotesIDLOTE.value

end;

procedure TfrmLotesControle.FormCreate(Sender: TObject);
begin
  inherited;
  cdsAux.CreateDataSet;
  cdsItens.CreateDataSet;
  cdsResultado.CreateDataSet;
  grid1.Columns[0].Visible := false;
  cdsMascaraAra.CreateDataSet;
end;

procedure TfrmLotesControle.FormShow(Sender: TObject);
begin
  inherited;
  cdsAux.Open;
  cdsaux.append;
  cdsAux.Edit;
  LocLotes;
  cdsItens.open;
  SetRichEditAdvOption(TRichEdit(RichEdit1));
  SetRichEditAdvOption(TRichEdit(RichEdit2));

end;

procedure TfrmLotesControle.btn5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLotesControle.btnDocumentosClick(Sender: TObject);
begin
  inherited;
  if dsItens.DataSet.active = true then
    if dsitens.DataSet.RecordCount > 0 then
    try
      application.createform(TfrmLoteGeraDocumento, frmLoteGeraDocumento);
      if frmLoteGeraDocumento.showmodal = mrok then
      begin
        cdsitens.filtered := false;
        cdsitens.filter := 'selecionado=true';
        cdsitens.filtered := true;
        cdsitens.first;

        if frmLoteGeraDocumento.radNot1.Checked = true then
        begin
          GeraNotificaoExtraJudicial;

        end
        else if frmLoteGeraDocumento.radEtiq.Checked = true then
        begin
          GeraEtiquetas;

        end
        else if frmLoteGeraDocumento.rbMascaraAr.Checked = true then
        begin
          GeraMascaraAR;

        end;

        cdsitens.filtered := false;
        cdsitens.filter := '';
        cdsitens.first;
        AtualizaContribs;
      end;
    finally
      frmLoteGeraDocumento.free;
    end;
end;

procedure TfrmLotesControle.GeraNotificaoExtraJudicial;
var
  qtd: integer;
  sdDirectory: TJvSelectDirectory;
  local: string;
  arq:string;
begin
  sdDirectory := TJvSelectDirectory.create(nil);
  if sdDirectory.Execute then
    local := sdDirectory.Directory
  else
    exit;

  ExibeAguarde('Gerando notificações. Por favor aguarde...');
  while not cdsitens.Eof do
  begin
    AtualizaContribs;
    if sdsContribs.RecordCount = 0 then
    begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Sem Contribuição Sindical relacionada. ';
      cdsResultado.post;
      cdsitens.Next;
      Continue;
    end;

    if TestaEndereco(cdsItensass_id.value) = 0 then
    begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
      cdsResultado.post;
      cdsitens.Next;
      Continue;
    end;

   { if cdsItensTP_PESSOA.Value = 'Física' then
    begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Modelo de pessoa física não definido. ';
      cdsResultado.post;
      cdsitens.Next;
      Continue;
    end;   }

    try
      application.createform(TQrNotExtrajudicial, QrNotExtrajudicial);
      QrNotExtrajudicial.cdsRelTermo.createdataset;
      //sdsNumNotificacao.open;
      //QrNotExtrajudicial.labNotif.caption := QrNotExtrajudicial.labNotif.caption + sdsNumNotificacaoNUMNOTIF.value;
      QrNotExtrajudicial.labNotif.caption := QrNotExtrajudicial.labNotif.caption + cdsItensREGISTRO.value;
     // sdsNumNotificacao.close;

     { if not DMConexao.sdsConfig.Locate('emp_id',cdsItensemp_id.value,[]) then
         Exit;
         }

      DMConexao.sdsConfig.close;
      DMConexao.sdsConfig.open;
      if cdsItensemp_id.value = 1 then
      begin
        QrNotExtrajudicial.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO MUNICÍPIO DO RIO DE JANEIRO';
      end
      else
      begin
        DMConexao.sdsConfig.next;
        QrNotExtrajudicial.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO ESTADO DO RIO DE JANEIRO';
        //FreeAndNil(QrNotExtrajudicial.imglogo);
      end;

      RichEdit1.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO1);
      SubstituirTexto(RichEdit1, '<#nome#>', cdsItensNOME.value);
      SubstituirTexto(RichEdit1, ' <#endereco#>', ' ' + endereco);
      SubstituirTexto(RichEdit1, '<#cpfcnpj#>', cdsItenscpfcnpj.value);
      SubstituirTexto(RichEdit1, '<#anuidades#>', RetonaAnuidades);
      SetRichEditAdvOption(TRichEdit(RichEdit1));
      QrNotExtrajudicial.ricTexto1.ParentRichEdit := TRichEdit(RichEdit1);

      RichEdit2.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO2);
      SetRichEditAdvOption(TRichEdit(RichEdit2));
      QrNotExtrajudicial.ricTexto2.ParentRichEdit := TRichEdit(RichEdit2);

      sdsContribs.first;
      while not sdsContribs.eof do
      begin
        QrNotExtrajudicial.cdsRelTermo.Append;
        QrNotExtrajudicial.cdsRelTermo.Edit;
        QrNotExtrajudicial.cdsRelTermoano.Value := sdsContribs.fieldbyname('ano').value;
        QrNotExtrajudicial.cdsRelTermovalor.Value := sdsContribs.fieldbyname('total').value;
        QrNotExtrajudicial.cdsRelTermo.post;
        sdsContribs.Next;
      end;

      QrNotExtrajudicial.ReportTitle := 'Notif_' + StringReplace(cdsItensREGISTRO.value, '/', '', [rfreplaceAll]);

      arq := GeraPDF2(QrNotExtrajudicial, local,0);

      if arq = '' then
      begin
        Aviso('Erro ao gerar PDF de Notificação para: ' + cdsItensREGISTRO.value + ' - ' + cdsItensNOME.value + '.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
      end
      else
      begin

        arq := dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arq);
        if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I', inttostr(0) + ',' + inttostr(cdsItensIDLOTEITEM.value) + ',' + inttostr(1) + ',' + quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' + inttostr(UserId))) = 0 then
        begin
          Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + cdsItensREGISTRO.value);
        end;
      end;


     { if GeraPDF(QrNotExtrajudicial, local) = 0 then
      begin
        Aviso('Erro ao gerar PDF de Notificação para: ' + cdsItensREGISTRO.value + ' - ' + cdsItensNOME.value + '.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
      end
      else
      begin
        if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I', inttostr(0) + ',' + inttostr(cdsItensIDLOTEITEM.value) + ',' + inttostr(1) + ',' + quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' + inttostr(UserId))) = 0 then
        begin
          Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + cdsItensREGISTRO.value);
        end;
      end;
      }
       if (DMConexao.ExecuteProc('MALADIRETAITENS_NOTIFICACAO_I',
                        inttostr(0) + ','+
                        inttostr(cdsItensIDLOTEITEM.value) + ',' +
                        quotedstr(arq)    )) = 0 then
          begin
              Erro('Erro ao anexar a Nnotificação extrajudicial. Cadastro Nº ' + cdsItensREGISTRO.value);
              exit;
          end;

    finally
      QrNotExtrajudicial.free;
    end;

    qtd := qtd + 1;
    cdsitens.Next;
  end;
  EscondeAguarde;

  iF qtd =  0 then
     Aviso('Nenhuma notificação gerada. ' + #13 + 'Total: ' + inttostr(qtd) + '. ')
  else
      Aviso('Notificações geradas com sucesso. ' + #13 + 'Total: ' + inttostr(qtd) + '. ');

  if cdsResultado.RecordCount > 0 then
  begin
    if Confirma('Algumas notificações não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
    begin
      try
        application.Createform(TQrRelatAddLote, QrRelatAddLote);
        qrRelatAddLote.DataSet := cdsResultado;
        qrRelatAddLote.txtregistro.DataSet := cdsResultado;
        qrRelatAddLote.txtnome.DataSet := cdsResultado;
        qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
        qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Notificações não geradas';
        qrRelatAddLote.labtitulo.Caption := 'Relatório de Notificações';
        qrRelatAddLote.Preview;
      finally
        QrRelatAddLote.free;
      end;

    end;

  end;
  AtualizaItens;

end;

procedure TfrmLotesControle.GeraEtiquetas;
begin
  try
    application.createform(TfrmEtiqueta, frmEtiqueta);
    frmEtiqueta.Dados.Open;
    frmEtiqueta.Dados.EmptyDataSet;

    cdsResultado.Open;
    cdsResultado.EmptyDataSet;

    while not cdsitens.Eof do
    begin

      if TestaEndereco(cdsItensass_id.value) = 0 then
      begin
        cdsResultado.append;
        cdsResultado.edit;
        cdsResultadoregistro.value := cdsItensREGISTRO.value;
        cdsResultadonome.value := cdsItensNOME.value;
        cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
        cdsResultado.post;
        cdsitens.next;
        Continue;
      end;

      frmEtiqueta.Dados.Append;
      frmEtiqueta.Dados.Edit;
      frmEtiqueta.DadosREGISTRO.value := StringReplace(cdsItens.fieldbyname('registro').Value, '/', '', [rfreplaceall]);

      if sdsEnderecoEND_BAIRRO.value <> NULL then
        frmEtiqueta.Dadosbairro.value := sdsEnderecoEND_BAIRRO.value;

      if sdsEnderecoEND_COMPLEMENTO.value <> NULL then
        frmEtiqueta.Dadoscomplemento.value := sdsEnderecoEND_COMPLEMENTO.value;

      if sdsEnderecoEND_CEP.value <> NULL then
      begin
        if length(sdsEnderecoEND_CEP.value) = 8 then
          frmEtiqueta.Dadoscep.value := copy(sdsEnderecoEND_CEP.value, 1, 2) + '.' + copy(sdsEnderecoEND_CEP.value, 3, 3) + '-' + copy(sdsEnderecoEND_CEP.value, 6, 3)
        else
          frmEtiqueta.Dadoscep.value := sdsEnderecoEND_CEP.value;
      end;

      if sdsEnderecoCIDADE_NOME.value <> NULL then
        frmEtiqueta.Dadoscidade.value := sdsEnderecoCIDADE_NOME.value;

      if sdsEnderecoEND_LOGRADOURO.value <> NULL then
        frmEtiqueta.Dadosendereco.value := sdsEnderecoEND_LOGRADOURO.value;

      if sdsEnderecoEND_NUMERO.value <> NULL then
        frmEtiqueta.Dadosendereco.value := frmEtiqueta.Dadosendereco.value+', '+sdsEnderecoEND_NUMERO.value;


      if sdsEnderecoESTADO_NOME.value <> NULL then
        frmEtiqueta.Dadosestado.value := sdsEnderecoESTADO_NOME.value;

      if cdsItensNOME.value <> NULL then
        frmEtiqueta.Dadosnome.value := cdsItensNOME.value;

      frmEtiqueta.Dados.post;

      cdsitens.next;
    end;

    if frmEtiqueta.Dados.recordcount > 0 then
    begin

      frmEtiqueta.showmodal;
      if (gerouetiqueta = 1) and (cdsResultado.RecordCount > 0) then
      begin
        if Confirma('Algumas etiquetas não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
        begin
          try
            application.Createform(TQrRelatAddLote, QrRelatAddLote);
            qrRelatAddLote.DataSet := cdsResultado;
            qrRelatAddLote.txtregistro.DataSet := cdsResultado;
            qrRelatAddLote.txtnome.DataSet := cdsResultado;
            qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
            qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Etiquetas não geradas';
            qrRelatAddLote.labtitulo.Caption := 'Relatório de Geração de Etiquetas';
            qrRelatAddLote.Preview;
          finally
            QrRelatAddLote.free;
          end;

        end;

      end;
    end;
  finally
    frmEtiqueta.free;
  end;

end;

function TfrmLotesControle.TestaEndereco(ass_id: integer): integer;
begin
  sdsEndereco.close;
  sdsEndereco.Params.ParamByName('ass_id').value := ass_id;
  sdsEndereco.open;

  if sdsEnderecoEND_ID.value > 0 then
  begin
    endereco := sdsEnderecoEND_LOGRADOURO.value;
    if sdsEnderecoEND_NUMERO.value <> '' then
      Endereco := Endereco + ', ' + sdsEnderecoEND_NUMERO.value;
    if sdsEnderecoEND_COMPLEMENTO.value <> '' then
      Endereco := Endereco + ', ' + sdsEnderecoEND_COMPLEMENTO.value;
    if sdsEnderecoEND_BAIRRO.value <> '' then
      Endereco := Endereco + ', ' + sdsEnderecoEND_BAIRRO.value;
    if sdsEnderecoCIDADE_NOME.value <> '' then
      Endereco := Endereco + ' - ' + sdsEnderecoCIDADE_NOME.value;
    if sdsEnderecoESTADO_NOME.value <> '' then
      Endereco := Endereco + ' - ' + sdsEnderecoESTADO_NOME.value;
    if sdsEnderecoEND_CEP.value <> '' then
    begin
      if Length(sdsEnderecoEND_CEP.value) = 8 then
        Endereco := Endereco + ' - CEP ' + MaskCEP(sdsEnderecoEND_CEP.value)
      else
        Endereco := Endereco + ' - CEP ' + sdsEnderecoEND_CEP.value;
    end;
  end;

  result := sdsEnderecoEND_ID.value;

end;

procedure TfrmLotesControle.AtualizaContribs;
begin
  sdsContribs.close;
  sdsContribs.Params.ParamByName('IDLOTEITEM').Value := cdsItensIDLOTEITEM.Value;
  sdsContribs.Open;
end;

function TfrmLotesControle.RetonaAnuidades: string;
var
  ano1, ano2: integer;
begin
  sdsContribs.first;
  ano1 := sdsContribsANO.Value;
  sdsContribs.Last;
  ano2 := sdsContribsANO.Value;

  if ano1 = ano2 then
    result := inttostr(ano1)
  else
    result := inttostr(ano1) + ' a ' + inttostr(ano2);

end;

procedure TfrmLotesControle.cbMarcClick(Sender: TObject);
begin
  inherited;
  if cdsitens.Active = true then
    if cdsitens.RecordCount > 0 then
      MarcarTodos(cbMarc.Checked);

end;

procedure TfrmLotesControle.MarcarTodos(marc: boolean);
var
  bm: TBookmark;
begin
  bm := cdsitens.GetBookmark;
  cdsitens.DisableControls;
  cdsitens.First;
  while not cdsitens.eof do
  begin
    cdsitens.Edit;
    if cdsitensSelecionado.value = marc then
      cdsitensSelecionado.value := not marc;
    cdsitensSelecionado.value := marc;
    cdsitens.post;
    cdsitens.next;
  end;
  cdsitens.GotoBookmark(bm);
  cdsitens.EnableControls;

end;

procedure TfrmLotesControle.btnAtualizarValoresClick(Sender: TObject);
begin
  inherited;
  {
    if dsItens.DataSet.Active = true then
        if dsItens.DataSet.RecordCount > 0 then
        try application.createform(tfrmLotesAtualizarValores, frmLotesAtualizarValores);
            if frmLotesAtualizarValores.showmodal = mrok then
            begin


            end;
        finally
            frmLotesAtualizarValores.free;
        end;
        }

end;

procedure TfrmLotesControle.btnGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
  if cdsitens.Active = true then
  begin
    cdsitens.DisableControls;
    cdsitens.filtered := false;
    cdsitens.filter := 'selecionado=true';
    cdsitens.filtered := true;
    cdsitens.first;
    if cdsitens.RecordCount > 0 then
      GeraPlanilha(cdsitens, grid1);
    cdsitens.filtered := false;
    cdsitens.filter := '';
    cdsitens.first;
    cdsitens.EnableControls;
  end;

end;

procedure TfrmLotesControle.btn2Click(Sender: TObject);
begin
  inherited;
  {  if dsItens.DataSet.active = true then
        if dsitens.DataSet.RecordCount > 0 then
        try application.createform(tfrmLotesRelatStatus, frmLotesRelatStatus);
            frmLotesRelatStatus.showmodal;
        finally
            frmLotesRelatStatus.free;
        end;
          }
end;

procedure TfrmLotesControle.btnManutRepasseClick(Sender: TObject);
begin
  inherited;
        try application.createform(tfrmLotesRelatRepasse, frmLotesRelatRepasse);
{        frmLotesRelatRepasse.sdsLotes.Open;
        if not frmLotesRelatRepasse.sdsLotes.Locate('IDLOTE', cdsAuxidlote.value,[]) then
           frmLotesRelatRepasse.sdsLotes.close
        else
           frmLotesRelatRepasse.btLocalizar.Click;}

        frmLotesRelatRepasse.showmodal;
        finally
            frmLotesRelatRepasse.free;
        end;

end;

procedure TfrmLotesControle.btnAdicionarRegistroClick(Sender: TObject);
begin
  inherited;
  btnok.click;
  if cdsAuxidlote.Value > 0 then
  begin
      try Application.CreateForm(tfrmLoteLocRegistro,frmLoteLocRegistro);
      idlote := cdsAuxidlote.Value;
      frmLoteLocRegistro.showmodal;
      finally
      frmLoteLocRegistro.free;
      end;
 end;
end;

procedure TfrmLotesControle.ExcluirCadastrodoLote1Click(Sender: TObject);
begin
  inherited;
   If cdsItens.Active = True then
      If cdsitens.RecordCount > 0 then
      begin
         If Confirma('Confirma exclusão do Cadastro selecionado deste lote? ') then
         begin
              try

                  Dmconexao.StartTransaction;
                  DMConexao.ExecSQL('delete from MALADIRETAITENS_NOTIFICACAO D WHERE D.loteitemid =  ' + inttostr(cdsItensIDLOTEITEM.value) );
                  DMConexao.ExecSQL('delete from lotecontribstatus s where s.idlotecontribstatus in (select s.idlotecontribstatus from lotecontribstatus s inner join loteitenscontribs c on c.idloteitemcontrib = s.idloteitemcontrib  where c.idloteitem = ' + inttostr(cdsItensIDLOTEITEM.value) + ')');
                  DMConexao.ExecSQL('delete from loteitenscontribs where idloteitem = ' + inttostr(cdsItensIDLOTEITEM.value));
                  DMConexao.ExecSQL('delete from LOTEITEMSTATUS where idloteitem = ' + inttostr(cdsItensIDLOTEITEM.value));
                  DMConexao.ExecSQL('delete from loteitens where idloteitem = ' + inttostr(cdsItensIDLOTEITEM.value));

                  DMConexao.Log('Exclusão Lote ' + inttostr(cdsAuxidlote.Value)+' - Item: (' + inttostr(cdsItensass_id.value)+' - ' + cdsItensREGISTRO.Value , 'E', cdsItensass_id.value);

                  AtualizaItens;
                  Aviso('Cadastro excluído com sucesso. ');
                  DMConexao.Commit;
              except
                  DMConexao.RollBack;
                  Erro('Erro ao excluir o Cadastro selecionado. '+ #13 + 'Contate o administrador. ');
              end;
         end;

      end;
end;
procedure TfrmLotesControle.GeraMascaraAR;
var
   gd: TDBGrid;
   ds: TDataSource;
begin
   cdsMascaraAra.Open;
   cdsMascaraAra.EmptyDataSet;
   cdsitens.First;
   while not cdsItens.Eof do
   begin
       if TestaEndereco(cdsItensass_id.value) > 0 then
       begin
          cdsMascaraAra.Append;
          cdsMascaraAra.Edit;
          cdsMascaraAranome.Value := cdsItensNOME.Value;
          cdsMascaraAraendereco.value :=  sdsEnderecoEND_LOGRADOURO.Value;
          cdsMascaraAranumero.value :=  sdsEnderecoEND_NUMERO.Value;
          cdsMascaraAracomplemento.value :=  sdsEnderecoEND_COMPLEMENTO.Value;
          cdsMascaraArabairro.value :=  sdsEnderecoEND_BAIRRO.Value;
          cdsMascaraAracidade.value :=  sdsEnderecoCIDADE_NOME.Value;
          cdsMascaraArauf.value :=  sdsEnderecoESTADO_NOME.Value;
          cdsMascaraAracep.value :=  sdsEnderecoEND_CEP.Value;
          cdsMascaraAra.post;
       end;
       cdsitens.next;
   end;

   If cdsMascaraAra.RecordCount > 0 then
   begin
       gd := TDBGrid.Create(self);
       ds := TDataSource.Create(Self);
       ds.DataSet := cdsMascaraAra;
       gd.DataSource := ds;
       GeraPlanilha(cdsMascaraAra, gd);
       ds.Free;
       gd.Free;
   end;

end;

procedure TfrmLotesControle.IncluiroutrasContribuies1Click(
  Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmLoteControleAddContrib,frmLoteControleAddContrib);
  frmLoteControleAddContrib.labRegistroNome.Caption := cdsItensREGISTRO.Value + ' - '  + cdsItensNOME.Value;
  ass_id := cdsItensass_id.Value;
  idloteitem := cdsItensIDLOTEITEM.Value;
  frmLoteControleAddContrib.editAno1.Text := IntToStr(ExtractYear(DataAtual) - 5);
  frmLoteControleAddContrib.editAno2.Text := IntToStr(ExtractYear(DataAtual));
  frmLoteControleAddContrib.btnLocalizar.Click;
  frmLoteControleAddContrib.showmodal;
  btnok.Click;
  finally
    frmLoteControleAddContrib.free;
  end;
end;

procedure TfrmLotesControle.btnEnviarMalaClick(Sender: TObject);
var
    Notif, Anexos:Integer;
    TotEmail:Integer;
    tipopessoa:integer;
begin
  inherited;
  If dsItens.DataSet.RecordCount > 0 then
  begin
     cdsitens.filtered := false;
     cdsitens.filter := '(selecionado=true)';
     cdsitens.filtered := true;
     if cdsItens.RecordCount = 0 then
     begin
         Aviso('Não há cadastros selecionados. ');
         Exit;
     end;

     Notif :=0;
     Anexos :=0;
     try
        application.createform(TfrmParcelamentoMalaDireta,frmParcelamentoMalaDireta);
        frmParcelamentoMalaDireta.chkNotifExtraJud.Checked :=true;
        frmParcelamentoMalaDireta.chkNotifExtraJud.Visible :=true;

        If frmParcelamentoMalaDireta.showmodal = mrok then
        begin
             if frmParcelamentoMalaDireta.chkNotifExtraJud.Checked = True then
                Notif :=1;
             if frmParcelamentoMalaDireta.cbEnviarMalaAnexarArq.Checked = True then
                Anexos :=1;

             IdMala := frmParcelamentoMalaDireta.sdsMalasMALA_ID.value;
             ExibeAguarde('Enviando cadastros para mala direta. Por favor, aguarde... ');
             totemail :=0;
             cdsResultado.EmptyDataSet;
             cdsitens.first;
             while not cdsitens.eof do
             begin
                      DMMalaDireta.sdsMalaItemID.close;
                      DMMalaDireta.sdsMalaItemID.open;

                      item_id := DMMalaDireta.sdsMalaItemIDIDITEM.value;

                      DMMalaDireta.PROC_MALADIRETAITEM_I.close;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALAITEM_ID').value := item_id;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('MALADIRETA_ID').value := IdMala;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAINCLUSAO').value := DataAtual;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('EMAIL').value := dsItens.DataSet.fieldbyname('email').value;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('DATAENVIO').clear;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('STATUS').value := 0;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('SELECIONADO').value :=0;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('USUARIO').value := UserId;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('ASS_ID').value :=  dsItens.DataSet.fieldbyname('ass_id').value;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('NOME').value :=  dsItens.DataSet.fieldbyname('nome').value;
                      If dsItens.DataSet.fieldbyname('tp_pessoa').value = 'Física' then
                         tipopessoa := 2
                      else
                      If dsItens.DataSet.fieldbyname('tp_pessoa').value = 'Jurídica' then
                         tipopessoa := 1;

                      DMMalaDireta.PROC_MALADIRETAITEM_I.ParamByName('TP_PESSOA').value := tipopessoa;
                      DMMalaDireta.PROC_MALADIRETAITEM_I.Execproc;

                      If Anexos = 1 then
                      begin
                         if AnexarArquivosAmala = 0 then
                         begin
                               DMConexao.ExecSQL('delete from MALADIRETAITENSANEXOS where maladiretaitens_id = ' + inttostr(item_id));
                               DMConexao.ExecSQL('delete from maladiretaitens where malaitem_id = ' + inttostr(item_id));
                               cdsitens.Next;
                               Continue;
                         end;
                      end;

                      If Notif =1 then
                      begin
                            if AnexarNotificacaoExtraJud = 0 then
                            begin
                               DMConexao.ExecSQL('delete from MALADIRETAITENSANEXOS where maladiretaitens_id = ' + inttostr(item_id));
                               DMConexao.ExecSQL('delete from maladiretaitens where malaitem_id = ' + inttostr(item_id));
                               cdsitens.Next;
                               Continue;
                            end;
                      end;

                      totemail := totemail + 1;
                      cdsitens.next;
             end;
      end
      else
        abort;

      EscondeAguarde;

      Aviso('Foram encaminhados para Mala Direta ' + inttostr(totemail) + ' filiado(s). ');

      cdsitens.filtered := false;
      cdsitens.filter := '';
      cdsitens.first;

      if cdsResultado.RecordCount > 0 then
      begin
        if Confirma('Algumas notificações não foram geradas. ' + #13 + 'Deseja visualizar a listagem? ') then
        begin
          try
            application.Createform(TQrRelatAddLote, QrRelatAddLote);
            qrRelatAddLote.DataSet := cdsResultado;
            qrRelatAddLote.txtregistro.DataSet := cdsResultado;
            qrRelatAddLote.txtnome.DataSet := cdsResultado;
            qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
            qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Notificações não geradas';
            qrRelatAddLote.labtitulo.Caption := 'Relatório de Notificações';
            qrRelatAddLote.Preview;
          finally
            QrRelatAddLote.free;
          end;

        end;

      end;
      AtualizaItens;

      finally
      frmParcelamentoMalaDireta.free;
      end;

  end;
end;

function TfrmLotesControle.AnexarArquivosAmala:integer;
begin
   try
      frmParcelamentoMalaDireta.cdsArquivosAnexo.first;
      while not frmParcelamentoMalaDireta.cdsArquivosAnexo.eof do
      begin
          If not FileExists(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value)) then
              CopyFile(PChar(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value), PChar(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value)), false);

         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value :=  dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value);
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value :=  item_id;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

         DMConexao.Log('Enviado para Mala Direta: ' + inttostr(idmala)+ ' com anexo: ' + dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(frmParcelamentoMalaDireta.cdsArquivosAnexonomearquivo.Value), 'O', dsItens.DataSet.FieldByName('ass_id').value);

         frmParcelamentoMalaDireta.cdsArquivosAnexo.next;
      end;
      frmParcelamentoMalaDireta.cdsArquivosAnexo.first;
      Result := 1;
   except
     Result := 0;
   end;

end;
function TfrmLotesControle.AnexarNotificacaoExtraJud:integer;
var
  qtd: integer;
  sdDirectory: TJvSelectDirectory;
  local, arquivo: string;
begin
  local := ExtractFilePath(Application.ExeName) + 'anexos';

  AtualizaContribs;
  if sdsContribs.RecordCount = 0 then
  begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Sem Contribuição Sindical relacionada. ';
      cdsResultado.post;
      result :=0;
      exit;
  end;

  if TestaEndereco(cdsItensass_id.value) = 0 then
  begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
      cdsResultado.post;
      result :=0;
      exit;
  end;

 { if cdsItensTP_PESSOA.Value = 'Física' then
  begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Modelo de pessoa física não definido. ';
      cdsResultado.post;
      result :=0;
      exit;
   end;    }

  if cdsItensemail.Value = '' then
  begin
      cdsResultado.append;
      cdsResultado.edit;
      cdsResultadoregistro.value := cdsItensREGISTRO.value;
      cdsResultadonome.value := cdsItensNOME.value;
      cdsResultadomotivo.value := 'Sem e-mail cadastrado. ';
      cdsResultado.post;
      result :=0;
      exit;
   end;

   try
      application.createform(TQrNotExtrajudicial, QrNotExtrajudicial);
      QrNotExtrajudicial.cdsRelTermo.createdataset;

      QrNotExtrajudicial.labNotif.caption := QrNotExtrajudicial.labNotif.caption + cdsItensREGISTRO.value;

      DMConexao.sdsConfig.close;
      DMConexao.sdsConfig.open;
      if cdsItensemp_id.value = 1 then
      begin
        QrNotExtrajudicial.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO MUNICÍPIO DO RIO DE JANEIRO';
      end
      else
      begin
        DMConexao.sdsConfig.next;
        QrNotExtrajudicial.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO ESTADO DO RIO DE JANEIRO';
      end;

      if cdsItensTP_PESSOA.Value ='Jurídica' then
         RichEdit1.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO1)
      else
      if cdsItensTP_PESSOA.Value ='Física' then
         RichEdit1.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO_PF_1);

      SubstituirTexto(RichEdit1, '<#nome#>', cdsItensNOME.value);
      SubstituirTexto(RichEdit1, ' <#endereco#>', ' ' + endereco);
      SubstituirTexto(RichEdit1, '<#cpfcnpj#>', cdsItenscpfcnpj.value);
      SubstituirTexto(RichEdit1, '<#anuidades#>', RetonaAnuidades);
      SetRichEditAdvOption(TRichEdit(RichEdit1));
      QrNotExtrajudicial.ricTexto1.ParentRichEdit := TRichEdit(RichEdit1);

      if cdsItensTP_PESSOA.Value ='Jurídica' then
         RichEdit2.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO2)
      else
      if cdsItensTP_PESSOA.Value ='Física' then
         RichEdit2.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO_PF_2);

      SetRichEditAdvOption(TRichEdit(RichEdit2));
      QrNotExtrajudicial.ricTexto2.ParentRichEdit := TRichEdit(RichEdit2);

      sdsContribs.first;
      while not sdsContribs.eof do
      begin
        QrNotExtrajudicial.cdsRelTermo.Append;
        QrNotExtrajudicial.cdsRelTermo.Edit;
        QrNotExtrajudicial.cdsRelTermoano.Value := sdsContribs.fieldbyname('ano').value;
        QrNotExtrajudicial.cdsRelTermovalor.Value := sdsContribs.fieldbyname('total').value;
        QrNotExtrajudicial.cdsRelTermo.post;
        sdsContribs.Next;
      end;

      QrNotExtrajudicial.ReportTitle := 'Notif_' + StringReplace(cdsItensREGISTRO.value, '/', '', [rfreplaceAll]);

      arquivo := GeraPDF2(QrNotExtrajudicial, local,0);
      if arquivo = '' then
      begin
          cdsResultado.append;
          cdsResultado.edit;
          cdsResultadoregistro.value := cdsItensREGISTRO.value;
          cdsResultadonome.value := cdsItensNOME.value;
          cdsResultadomotivo.value := 'Erro gerando o PDF da notificação. ';
          cdsResultado.post;
          cdsitens.Next;
          QrNotExtrajudicial.Free;
          result :=0;
          exit;
      end
      else
      begin

        if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I', inttostr(0) + ',' + inttostr(cdsItensIDLOTEITEM.value) + ',' + inttostr(1) + ',' + quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' + inttostr(UserId))) = 0 then
        begin
          cdsResultado.append;
          cdsResultado.edit;
          cdsResultadoregistro.value := cdsItensREGISTRO.value;
          cdsResultadonome.value := cdsItensNOME.value;
          cdsResultadomotivo.value := 'Erro gerando o registro da notificação. ';
          cdsResultado.post;
          cdsitens.Next;
          QrNotExtrajudicial.Free;
          result :=0;
          exit;
        end;

         try
         CopyFile(PChar(arquivo), PChar(dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(arquivo)), false);
         CopyFile(PChar(arquivo), PChar(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo)), false);

         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.close;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('ANEXO_ID').clear;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('CAMINHOANEXO').value :=  dmconexao.sdsConfigCAMINHOPDFSEMAIL.value+'\'+ExtractFileName(arquivo);
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ParamByName('MALADIRETAITENS_ID').value :=  item_id;
         DMMalaDireta.PROC_MALADIRETAITEM_ANEXO_I.ExecProc;

         if (DMConexao.ExecuteProc('MALADIRETAITENS_NOTIFICACAO_I',
                        inttostr(0) + ','+
                        inttostr(cdsItensIDLOTEITEM.value) + ',' +
                        quotedstr(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo))    )) = 0 then
          begin
              result :=0;
              exit;
          end;

         Result :=1;
         except
            cdsResultado.append;
            cdsResultado.edit;
            cdsResultadoregistro.value := cdsItensREGISTRO.value;
            cdsResultadonome.value := cdsItensNOME.value;
            cdsResultadomotivo.value := 'Erro armazenando a notificação. ';
            cdsResultado.post;
            cdsitens.Next;
            QrNotExtrajudicial.Free;
            result :=0;
            exit;
         end;

      end;


    finally
      QrNotExtrajudicial.free;
    end;

end;

procedure TfrmLotesControle.ExibirNotificaoExtrajudicial1Click(
  Sender: TObject);
begin
  inherited;
   If cdsItensnotificacao.Value <>'' then
   begin
       try
         //  WinExec(PChar(quotedstr(cdsItensnotificacao.Value)), SW_NORMAL);
         ShellExecute(handle,'open',PChar(cdsItensnotificacao.Value), '','',SW_SHOWNORMAL);
       except
           Aviso('Erro ao tentar abrir a notificação. ')
       end;

   end;

end;

procedure TfrmLotesControle.btLocalizarClick(Sender: TObject);
begin
  inherited;
  if cdsItens.Active = True then
     if cdsitens.RecordCount > 0 then
     begin
     cdsItens.IndexFieldNames:='nome';
        if not cdsItens.Locate('registro',editloc.Text,[lopartialkey, locaseinsensitive]) then
            cdsItens.Locate('nome',editloc.Text,[lopartialkey, locaseinsensitive]);

     end
end;

procedure TfrmLotesControle.VisualizarContribuies1Click(Sender: TObject);
begin
  inherited;
    if cdsItens.Active = True then
     if cdsitens.RecordCount > 0 then
     begin
         try Application.CreateForm(TfrmLoteItemVerContribs,frmLoteItemVerContribs);

         frmLoteItemVerContribs.labLote.Caption := DMLotes.cdsLocLotesNOMEDATA.Value;
         frmLoteItemVerContribs.labCadastro.caption:= cdsItensREGISTRO.Value + ' - ' + cdsItensNOME.Value;
         frmLoteItemVerContribs.labtotal.Caption := FormatFloat(',0.00', cdsItenstotalvalor.AsFloat);
         frmLoteItemVerContribs.sdsContribs.close;
         frmLoteItemVerContribs.sdsContribs.Params.ParamByName('idloteitem').Value := cdsItensIDLOTEITEM.Value;
         frmLoteItemVerContribs.sdsContribs.open;
         frmLoteItemVerContribs.ShowModal;
         finally
           frmLoteItemVerContribs.free;
         end;


        end;
end;

end.



