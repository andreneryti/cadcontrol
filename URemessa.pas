unit URemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons, DB,
  DBClient, Grids, DBGrids, JvDBCtrl, ExRxDBGrid, Mask, ComCtrls, Provider,
  SqlExpr, DBLocal, DBLocalS, DBCtrls, Menus;

type
  TfrmRemessa = class(TModeloComum)
    cdsTitulos: TClientDataSet;
    cdsTitulosSelecionado: TBooleanField;
    dsTitulos: TDataSource;
    Bevel1: TBevel;
    btSair: TBitBtn;
    PageControl1: TPageControl;
    tsNova: TTabSheet;
    Bevel2: TBevel;
    Label5: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbSind: TComboBox;
    cbContrib: TComboBox;
    edData1: TMaskEdit;
    edData2: TMaskEdit;
    Bevel4: TBevel;
    btLocalizar: TBitBtn;
    Label2: TLabel;
    labtotal: TLabel;
    btGerarRemessa: TBitBtn;
    sdsBoletosARegistrar: TSQLClientDataSet;
    sdsBoletosARegistrarASS_ID: TIntegerField;
    sdsBoletosARegistrarREGISTRO: TStringField;
    sdsBoletosARegistrarNOME: TStringField;
    sdsBoletosARegistrarBOL_ID: TIntegerField;
    sdsBoletosARegistrarNOSSONUMERO: TStringField;
    sdsBoletosARegistrarDT_VENCIMENTO: TDateField;
    sdsBoletosARegistrarCONTA_ID: TIntegerField;
    cdsTitulosass_id: TIntegerField;
    cdsTitulosregistro: TStringField;
    cdsTitulosnome: TStringField;
    cdsTitulosbol_id: TIntegerField;
    cdsTitulosnossonumero: TStringField;
    cdsTitulosdt_vencimento: TDateField;
    cdsTitulosconta_id: TIntegerField;
    cdsTitulosvalor_total: TFloatField;
    sdsBoletosARegistrarVALOR_TOTAL: TFMTBCDField;
    sdsBoletosARegistrarCPFCNPJ: TStringField;
    sdsBoletosARegistrarDESCRITEM: TStringField;
    cdsTituloscpfcnpj: TStringField;
    cdsTitulosDESCRITEM: TStringField;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    PopupMenu1: TPopupMenu;
    MarcarDesmarcarTodos1: TMenuItem;
    sd: TSaveDialog;
    sdsBoletosARegistrarTP_ASSOC_ID: TIntegerField;
    sdsBoletosARegistrarDT_CRIACAO: TDateField;
    cdsTitulostp_assoc_id: TIntegerField;
    cdsTitulosdt_criacao: TDateField;
    sdsConta: TSQLClientDataSet;
    sdsContaCNPJ: TStringField;
    sdsContaENDER_LOGRADOURO: TStringField;
    sdsContaENDER_NUMERO: TStringField;
    sdsContaENDER_COMPLEMENTO: TStringField;
    sdsContaENDER_BAIRRO: TStringField;
    sdsContaCIDADE_ID: TIntegerField;
    sdsContaCIDADE_NOME: TStringField;
    sdsContaESTADO_SIGLA: TStringField;
    sdsContaENDER_CEP: TStringField;
    sdsContaBAN_CODIGO: TStringField;
    sdsContaBAN_DIGITO: TStringField;
    sdsContaCONTA_ID: TIntegerField;
    sdsContaCT_AGENCIA: TStringField;
    sdsContaCT_AGENCIA_DV: TStringField;
    sdsContaCT_CONTA: TStringField;
    sdsContaCT_CONTA_DV: TStringField;
    sdsContaCT_NOMECLIENTE: TStringField;
    sdsContaCT_CODCEDENTE: TStringField;
    sdsContaCT_CODCEDENTE_DV: TStringField;
    sdsContaCT_NUMCONVENIO: TStringField;
    sdsContaBANCO_ID: TIntegerField;
    sdsContaEMP_ID: TIntegerField;
    sdsContaNOMECEDENTEABREV: TStringField;
    procedure btSairClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MarcarDesmarcarTodos1Click(Sender: TObject);
    procedure cbSindSelect(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure btGerarRemessaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRemessa: TfrmRemessa;

  const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);

implementation

uses UDMConexao, UDmBoleto, UFuncoes, gbCobranca, uGuias;

{$R *.dfm}

procedure TfrmRemessa.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRemessa.btLocalizarClick(Sender: TObject);
var
   i:Integer;
begin
  inherited;
  if cdsTitulos.Active = true then
     if cdsTitulos.RecordCount >0 then
          cdsTitulos.EmptyDataSet;
  btGerarRemessa.Enabled :=False;
  try
      strtodate(edData1.Text)
  except
      Erro('Data inicial inv�lida. ');
      edData1.SetFocus;
      Exit;
  end;

  try
      strtodate(edData2.Text)
  except
      Erro('Data final inv�lida. ');
      edData2.SetFocus;
      Exit;
  end;

  sdsBoletosARegistrar.Close;
  sdsBoletosARegistrar.Params.ParamByName('data1').Value := StrToDate(edData1.Text);
  sdsBoletosARegistrar.Params.ParamByName('data2').Value := StrToDate(edData2.Text);
  sdsBoletosARegistrar.Params.ParamByName('conta_id').Value := DMboleto.RetornaConta(cbSind.Text[1],cbContrib.text[1]);
  sdsBoletosARegistrar.Open;
  labtotal.caption:= IntToStr(sdsBoletosARegistrar.recordcount);
  if sdsBoletosARegistrar.RecordCount >0 then
  begin
     btGerarRemessa.Enabled := True;
     cdsTitulos.Open;
     sdsBoletosARegistrar.First;
     while not sdsBoletosARegistrar.Eof do
     begin
          cdsTitulos.Append;
          cdsTitulos.Edit;
          for i:= 0 to sdsBoletosARegistrar.FieldCount - 1 do
             cdsTitulos.fieldbyname(sdsBoletosARegistrar.fields[i].FieldName).value := sdsBoletosARegistrar.fieldbyname(sdsBoletosARegistrar.fields[i].FieldName).value;
          cdsTitulosSelecionado.value := True;
          cdsTitulos.Post;
          sdsBoletosARegistrar.Next;
     end;
  end;
  sdsBoletosARegistrar.Close;

end;

procedure TfrmRemessa.FormCreate(Sender: TObject);
begin
  inherited;
  edData1.Text := DateToStr(DataAtual-10);
  edData2.Text := DateToStr(DataAtual);
  cdsTitulos.CreateDataSet;
end;

procedure TfrmRemessa.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'Selecionado' then
  begin
    if not ( Column.Field.DataSet.State in [dsInsert, dsEdit] ) then
        Column.Field.DataSet.Edit;

    if Column.Field.Value = True then
        Column.Field.Value := False
    else
        Column.Field.Value := True;

    Column.Field.DataSet.post;

end;
end;
procedure TfrmRemessa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var DrawState: Integer; DrawRect: TRect;
begin
  inherited;
        GridListrado(tdbgrid(Sender), Rect, DataCol, Column, State);

        if (gdFocused in State) then
        begin
          if (Column.Field.FieldName = DBCheckBox1.DataField) then
          begin
            DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
            DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
            DBCheckBox1.Width := Rect.Right - Rect.Left;
            DBCheckBox1.Height := Rect.Bottom - Rect.Top;
            DBCheckBox1.Visible := True;
          end
        end
        else
        begin
          if (Column.Field.FieldName = DBCheckBox1.DataField) then
          begin
            DrawRect:=Rect;
            InflateRect(DrawRect,-1,-1);
            DrawState := ISChecked[Column.Field.AsBoolean];
            DBGrid1.Canvas.FillRect(Rect);
            DrawFrameControl(DBGrid1.Canvas.Handle,DrawRect, DFC_BUTTON, DrawState);
          end;
        end;




end;

procedure TfrmRemessa.MarcarDesmarcarTodos1Click(Sender: TObject);
var
    marcar:Boolean;
begin
  inherited;
  if cdsTitulos.Active = True then
    if cdsTitulos.RecordCount >0 then
    begin
         cdstitulos.First;
         marcar:= not cdsTitulosSelecionado.Value;
         cdstitulos.DisableControls;
         while not cdsTitulos.Eof do
         begin
                cdsTitulos.Edit;
                cdsTitulosSelecionado.Value := marcar;
                cdsTitulos.post;
                cdsTitulos.Next;
         end;
         cdstitulos.first;
         cdstitulos.EnableControls;

    end;

end;

procedure TfrmRemessa.cbSindSelect(Sender: TObject);
begin
  inherited;
  if cdsTitulos.active = true then
  begin
    cdsTitulos.EmptyDataSet;
    Application.ProcessMessages;
  end;
  cdsTitulos.Close;
  btGerarRemessa.Enabled :=false;
  labtotal.caption:='0';
end;

procedure TfrmRemessa.edData1Change(Sender: TObject);
begin
  inherited;
  if cdsTitulos.active = true then
  begin
    cdsTitulos.EmptyDataSet;
    Application.ProcessMessages;
  end;
  cdsTitulos.Close;
  btGerarRemessa.Enabled :=false;
  labtotal.caption:='0';
end;

procedure TfrmRemessa.btGerarRemessaClick(Sender: TObject);
var
    conta_id, tot:Integer;
    filename, comando, nomearq, dia:string;
begin
    inherited;

    DBCheckBox1.Visible := false;
    cdsTitulos.First;

    DMConexao.sdsConfig.close;
    DMConexao.sdsConfig.open;
    DMConexao.sdsConfig.first;
    if cbSind.Text[1]='E' then
       DMConexao.sdsConfig.next;

    Numremessa := Dmconexao.GeraAutoNumber('GEN_REMESSA_NUM');
    dia := IntToStr(ExtractDay(DataAtual));
    If Length(dia)=1 then
      dia := '0'+dia;
    nomearq := 'E'+ dia +'_' +uppercase(copy(cbContrib.Text,1,3))+'_'+ uppercase(copy(cbSind.Text,1,3))+'_'+ Char_Left(inttostr(Numremessa),8,'0')+'.rem';
    if DMConexao.sdsConfigCAMINHOREMESSA.Value <>'' then
    begin
      sd.InitialDir := DMConexao.sdsConfigCAMINHOREMESSA.Value;
      sd.FileName :=nomearq;
      nomearquivoremessa := DMConexao.sdsConfigCAMINHOREMESSA.Value+sd.filename;
    end
    else
    begin
       sd.FileName :=nomearq;
       if not sd.Execute then
          Exit;
       nomearquivoremessa := sd.filename;
    end;

    filename := ExtractFileName(nomearquivoremessa);


    planilha := 0;
    if Confirma('No final, desejas gerar uma planilha contendo os boletos inclu�dos na Remessa? ') then
        planilha := 1;

    if not Assigned(DmBoleto.gbCobranca1) then
       DmBoleto.gbCobranca1 := TgbCobranca.create(Self);

    conta_id := cdsTitulosconta_id.value;

    //Localizando os dados da Conta
    sdsConta.close;
    sdsconta.Params.ParamByName('conta_id').Value := conta_id;
    sdsconta.Open;

 {   if cbContrib.Text[1]='C' then
    begin
  }         DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  SdsContaBAN_CODIGO.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := SdsContaBAN_DIGITO.AsString;
           DmBoleto.gbTitulo1.SeuNumero := '';
           DmBoleto.gbTitulo1.DataDocumento := Dataatual;
           DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

           DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
           DmBoleto.gbTitulo1.Cedente.NumeroCPFCGC := sdsContaCNPJ.Value;
           DmBoleto.gbTitulo1.Cedente.CodigoCedente := SdsContaCT_CODCEDENTE.AsString;
             
           DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := SdsContaCT_CODCEDENTE_DV.AsString;

           DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
           DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOT�RICAS AT� O VALOR LIMITE';

           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := SdsContaCT_NOMECLIENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := SdsContaCT_AGENCIA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := SdsContaCT_AGENCIA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := SdsContaCT_CONTA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := SdsContaCT_CONTA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.Nome := sdsContaNOMECEDENTEABREV.AsString + ' - CNPJ: '+ MaskCPFCGC(SdsContaCNPJ.value);
           DmBoleto.gbTitulo1.Cedente.Endereco.Rua := SdsContaENDER_LOGRADOURO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Numero := SdsContaENDER_NUMERO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := SdsContaENDER_COMPLEMENTO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.CEP := SdsContaENDER_CEP.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := SdsContaENDER_BAIRRO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := SdsContaCIDADE_NOME.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Estado := SdsContaESTADO_SIGLA.AsString;
           //Fim dados do Cedente

 {   end
    else
    if cbContrib.Text[1]='S' then
    begin
           DmBoleto.Guias1.Cedente.Nome := SdsContaCT_NOMECLIENTE.value;
           DmBoleto.Guias1.Cedente.SICAS_Completo := SdsContaCT_CODCEDENTE.value+SdsContaCT_CODCEDENTE_DV.value;
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
           begin
              DmBoleto.Guias1.Cedente.SICAS_Simples := '00111';
              DmBoleto.Guias1.Tipo_Entidade := teFederacao;
           end
           else
           begin
              DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
              DmBoleto.Guias1.Tipo_Entidade := teSindicato;
           end;
           DmBoleto.Guias1.Cedente.Agencia := SdsContaCT_AGENCIA.Value;
           DmBoleto.Guias1.Cedente.CNPJ := SdsContaCNPJ.Value;
           DmBoleto.Guias1.Cedente.Endereco.Rua := SdsContaENDER_LOGRADOURO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Bairro := SdsContaENDER_BAIRRO.Value;
           DmBoleto.Guias1.Cedente.Endereco.CEP := SdsContaENDER_CEP.Value;
           DmBoleto.Guias1.Cedente.Endereco.Cidade := SdsContaCIDADE_NOME.Value;
           DmBoleto.Guias1.Cedente.Endereco.Numero := SdsContaENDER_NUMERO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Complemento := SdsContaENDER_COMPLEMENTO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Estado := SdsContaESTADO_SIGLA.Value;
           DmBoleto.Guias1.Cedente.CNAE := '461';


           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  SdsContaBAN_CODIGO.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := SdsContaBAN_DIGITO.AsString;
           DmBoleto.gbTitulo1.SeuNumero := '';
           DmBoleto.gbTitulo1.DataDocumento := Dataatual;
           DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

           DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
           DmBoleto.gbTitulo1.Cedente.CodigoCedente := SdsContaCT_CODCEDENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := SdsContaCT_CODCEDENTE_DV.AsString;

           DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
           DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOT�RICAS AT� O VALOR LIMITE';

           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := SdsContaCT_NOMECLIENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := SdsContaCT_AGENCIA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := SdsContaCT_AGENCIA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := SdsContaCT_CONTA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := SdsContaCT_CONTA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.Nome := SdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(SdsContaCNPJ.value);
           DmBoleto.gbTitulo1.Cedente.Endereco.Rua := SdsContaENDER_LOGRADOURO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Numero := SdsContaENDER_NUMERO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := SdsContaENDER_COMPLEMENTO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.CEP := SdsContaENDER_CEP.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := SdsContaENDER_BAIRRO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := SdsContaCIDADE_NOME.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Estado := SdsContaESTADO_SIGLA.AsString;
           //Fim dados do Cedente


    end;
         }
    tot := 0;

    ExibeAguarde('Gerando arquivo de remessa. Aguarde...');

    cdsTitulos.DisableControls;
    cdsTitulos.Filtered:=false;
    cdsTitulos.Filter := 'selecionado=true';
    cdsTitulos.Filtered:=True;
    cdsTitulos.first;

    tipocobr := cbContrib.Text[1];

    tot := Dmboleto.GeraRemessa(dsTitulos);

    cdsTitulos.first;
    cdsTitulos.EmptyDataSet;
    cdsTitulos.EnableControls;
    cdsTitulos.Filtered:=false;
    cdsTitulos.Filter := '';
    cdsTitulos.Close;
    Application.ProcessMessages;

    EscondeAguarde;

    If tot = 0 then
       Aviso('Nenhum boleto foi gerado para o arquivo de remessa')
    else
       Aviso('Arquivo de remessa gerado com ' + INTTOSTR(tot) + ' boleto(s).');

    if planilha = 1 then
        Exportar_para_CSV(DMboleto.dsGuiasGeradas);

    if DmBoleto.cdsGuiasNaoGeradasRemessa.RecordCount > 0 then
    begin
        if confirma('Alguns boletos da lista n�o foram inclu�dos na Remessa por seu Cadastro se encontrar sem um endere�o v�lido cadastrado. ' + #13 + 'Deseja visualiz�-los em uma planilha? ') then
            Exportar_para_CSV(DMboleto.dsGuiasNaoGeradasRemessa);
    end;

    try
        comando := 'xcopy "' + pchar(nomearquivoremessa) + '" "' + Dmconexao.sdsConfigARQSREMESSA.value + '" /y/c/r/a';
        WinExec(PChar(comando), SW_hide);
    except
        Aviso('Erro ao copiar arquivo de remessa. ');
    end;

    btLocalizar.Click;

end;

procedure TfrmRemessa.FormShow(Sender: TObject);
begin
  inherited;
   If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
   begin
      cbSind.clear;
      cbSind.Items.Add('Federa��o');
      cbSind.ItemIndex:=0;
   end;

end;

end.
