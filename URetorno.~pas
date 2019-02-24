unit URetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Buttons, WinSkinData, ExtCtrls, DB, StdCtrls,
  Grids, DBGrids, JvDBCtrl, ExRxDBGrid, DBClient, gbCobranca, Provider,
  SqlExpr, DBLocal, DBLocalS, Menus, Maskutils;

type
  TfrmRetorno = class(TModeloComum)
    Panel2: TPanel;
    spNovo: TSpeedButton;
    btGravar: TSpeedButton;
    btImprimir: TSpeedButton;
    Label1: TLabel;
    cdsTitulos: TClientDataSet;
    cdsTitulosSelecionado: TBooleanField;
    dsTitulos: TDataSource;
    cdsTitulosOcorrencia: TStringField;
    cdsTitulosData: TDateField;
    cdsTitulosCredito: TDateField;
    cdsTitulosNossoNumero: TStringField;
    cdsTitulosValor: TFloatField;
    cdsTitulosValorBaixa: TFloatField;
    cdsTitulosRegistro: TStringField;
    cdsTitulosNome: TStringField;
    cdsTitulosDataVencimento: TDateField;
    cdsTitulosdesconto: TFloatField;
    btSair: TBitBtn;
    OpenDialog1: TOpenDialog;
    gbCobranca1: TgbCobranca;
    cdsRegistro: TSQLClientDataSet;
    cdsRegistroREGISTRO: TStringField;
    cdsRegistroNOME: TStringField;
    cdsTitulosEncargosPago: TFloatField;
    Bevel1: TBevel;
    Grid1: TExRxDBGrid;
    PopupMarc: TPopupMenu;
    MarcarDesmarcarTodos1: TMenuItem;
    cdsResultado: TClientDataSet;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField3: TDateField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    cdsResultadoStatusResultado: TStringField;
    spGerarPlanilha: TSpeedButton;
    cdsTitulosStatusResultado: TStringField;
    cdsTitulosarquivo: TStringField;
    cdsResultadoArquivo: TStringField;
    cdsRegistroEMP_ID: TIntegerField;
    cdsTitulosemp_id: TIntegerField;
    sdsLocGuiaNaoIdent: TSQLClientDataSet;
    sdsLocGuiaNaoIdentREGISTRO: TStringField;
    sdsLocGuiaNaoIdentNOME: TStringField;
    sdsLocGuiaNaoIdentEMP_ID: TIntegerField;
    cdsTitulosSituacao: TStringField;
    cdsResultadoSituacao: TStringField;
    cdsTituloscpfcnpj: TStringField;
    cdsTitulosseunumero: TStringField;
    cdsRegistroCPFCNPJ: TStringField;
    procedure spNovoClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure RetornoSindical;
    procedure RetornoSindicalNovo;
    procedure RetornoConfederativa;
    procedure MarcarTodos(marc:boolean);
    procedure MarcarDesmarcarTodos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure spGerarPlanilhaClick(Sender: TObject);
    procedure Grid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    Lista: TStringList;
  end;

var
  frmRetorno: TfrmRetorno;
  Marca: Integer;
    tipo:STRING;

implementation

uses UBoletoOpcoes, UDMConexao, UFuncoes, UBoleto, UDmBoleto,
  UQRRetornoResult;

{$R *.dfm}

procedure TfrmRetorno.spNovoClick(Sender: TObject);
begin
  try Application.createform(TfrmBoletoOpcoes,frmBoletoOpcoes);
  frmBoletoOpcoes.panelOpcoes.Visible :=false;
  if frmBoletoOpcoes.showmodal=mrok then
  begin

      If frmBoletoOpcoes.radSind.checked = true then
         tipo := 'S' //Sindical
      else
      If frmBoletoOpcoes.radConf.checked = true then
         tipo := 'C'; //Confederativa
  end
  else
      abort;
  finally
  frmBoletoOpcoes.free;
  end;

  If tipo = 'S' then
     RetornoSindicalNovo
     //RetornoSindical
  else
     RetornoConfederativa;

  cdsResultado.EmptyDataSet;
  if cdsTitulos.RecordCount > 0 then
  begin
     cdsTitulos.First;
     while not cdsTitulos.eof do
     begin
        cdsResultado.Append;
        cdsResultado.Edit;
        cdsResultado.FieldByName('DataVencimento').value := cdsTitulosDataVencimento.value;
        cdsResultado.FieldByName('data').value := cdsTitulosData.value;
        cdsResultado.FieldByName('credito').value := cdsTitulosCredito.value;
        cdsResultado.FieldByName('nossonumero').value := cdsTitulosNossoNumero.value;
        cdsResultado.FieldByName('registro').value := cdsTitulosRegistro.value;
        cdsResultado.FieldByName('nome').value := cdsTitulosNome.value;
        cdsResultado.FieldByName('valor').value := cdsTitulosValor.value;
        cdsResultado.FieldByName('valorbaixa').value := cdsTitulosValorBaixa.value;
        cdsResultado.FieldByName('EncargosPago').value := cdsTitulosEncargosPago.value;
        cdsResultado.FieldByName('desconto').value := cdsTitulosdesconto.value;
        cdsResultado.FieldByName('StatusResultado').value := '';
        cdsResultado.fieldbyname('arquivo').value :=cdstitulosarquivo.value;
        cdsResultado.fieldbyname('situacao').value :=cdsTitulosSituacao.value;
        cdsResultado.Post;

        cdsTitulos.Next;
     end;
     cdsTitulos.First;
  end;


end;



procedure TfrmRetorno.btSairClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmRetorno.RetornoConfederativa;
var
 i,j:integer;
begin
  Lista := TStringList.Create;
  if OpenDialog1.Execute then
  begin
    try
      cdsTitulos.Close;
      //cdsTitulos.CreateDataSet;
      cdsTitulos.Open;
      cdsTitulos.EmptyDataSet;
      cdsTitulos.DisableControls;
      for j := 0 to OpenDialog1.Files.Count - 1 do
      BEGIN
          gbCobranca1.NomeArquivo := OpenDialog1.Files[j];
          if gbCobranca1.LerRetorno then
          begin
            for i := 0 to gbCobranca1.Titulos.Count - 1 do
            begin
              if gbCobranca1.Titulos[i].OcorrenciaOriginal = '06' then
              begin
                cdsTitulos.Append;
                cdsTitulosValor.AsFloat := gbCobranca1.Titulos[i].ValorDocumento;
                IF gbCobranca1.Titulos[i].DataVencimento <> 0 THEN
                    cdsTitulosDataVencimento.AsDateTime := gbCobranca1.Titulos[i].DataVencimento;
                cdsTitulosOcorrencia.AsString := gbCobranca1.Titulos[i].DescricaoOcorrenciaOriginal;
                cdsTitulosData.AsDateTime := gbCobranca1.Titulos[i].DataOcorrencia;
                cdsTitulosCredito.AsDateTime := gbCobranca1.Titulos[i].DataCredito;

                cdsTitulosNossoNumero.AsString := gbCobranca1.Titulos[i].NossoNumero;
                cdsTitulosValor.AsFloat := gbCobranca1.Titulos[i].ValorDocumento;

                cdsTitulosValorBaixa.AsFloat := gbCobranca1.Titulos[i].ValorPago;
                cdsRegistro.Close;
                cdsRegistro.Params.ParamByName('nossonumero').AsString := cdsTitulosNossoNumero.AsString;
                cdsRegistro.Open;
                if cdsRegistro.RecordCount > 0 then
                begin
                  cdsTitulosNome.AsString := cdsRegistro.FieldByNAME('NOME').AsString;
                  cdsTitulosRegistro.AsString := cdsRegistro.FieldByNAME('REGISTRO').AsString;
                  cdsTitulosemp_id.value :=cdsRegistroEMP_ID.value;
                end;
                cdsTitulosDataVencimento.value := gbCobranca1.Titulos[i].DataVencimento;
                cdsTitulosdesconto.value := gbCobranca1.Titulos[i].ValorDesconto;
                cdsTitulosSelecionado.value := true;
                cdsTitulosEncargosPago.value := gbCobranca1.Titulos[i].ValorMoraJuros;
                cdsTitulosarquivo.value := ExtractFileName(gbCobranca1.NomeArquivo);
                cdsTitulosSituacao.Value :='Liquidação de Título';
                cdsTitulos.Post;
              end
              else
              if gbCobranca1.Titulos[i].OcorrenciaOriginal <> '28' then // tarifas
              begin
                cdsTitulos.Append;
                cdsTitulosValor.AsFloat := gbCobranca1.Titulos[i].ValorDocumento;
                IF gbCobranca1.Titulos[i].DataVencimento <> 0 THEN
                    cdsTitulosDataVencimento.AsDateTime := gbCobranca1.Titulos[i].DataVencimento;
                cdsTitulosOcorrencia.AsString := gbCobranca1.Titulos[i].DescricaoOcorrenciaOriginal;
                cdsTitulosData.AsDateTime := gbCobranca1.Titulos[i].DataOcorrencia;
               // cdsTitulosCredito.AsDateTime := gbCobranca1.Titulos[i].DataCredito;
                cdsTitulosCredito.Clear;

                cdsTitulosNossoNumero.AsString := gbCobranca1.Titulos[i].NossoNumero;
                cdsTitulosValor.AsFloat := gbCobranca1.Titulos[i].ValorDocumento;

                cdsTitulosValorBaixa.AsFloat :=0;
                cdsRegistro.Close;
                cdsRegistro.Params.ParamByName('nossonumero').AsString := cdsTitulosNossoNumero.AsString;
                cdsRegistro.Open;
                if cdsRegistro.RecordCount > 0 then
                begin
                  cdsTitulosNome.AsString := cdsRegistro.FieldByNAME('NOME').AsString;
                  cdsTitulosRegistro.AsString := cdsRegistro.FieldByNAME('REGISTRO').AsString;
                  cdsTitulosemp_id.value :=cdsRegistroEMP_ID.value;
                end;
                cdsTitulosDataVencimento.value := gbCobranca1.Titulos[i].DataVencimento;
                cdsTitulosdesconto.value := 0;
                cdsTitulosSelecionado.value := true;
                cdsTitulosEncargosPago.value := 0;
                cdsTitulosarquivo.value := ExtractFileName(gbCobranca1.NomeArquivo);
                if gbCobranca1.Titulos[i].OcorrenciaOriginal = '02' then
                    cdsTitulosSituacao.Value :='Registro de Título'
                else
                if gbCobranca1.Titulos[i].OcorrenciaOriginal = '03' then
                    cdsTitulosSituacao.Value :='Rejeição de Título'
                else
                    cdsTitulosSituacao.Value :='Outras Ocorrências';

                cdsTitulos.Post;
              end

            end;
          end;

      End;

    finally
      cdsTitulos.EnableControls;
    end;
  end;
  Lista.Free;
  if cdsTitulos.RecordCount > 0 then
  begin
    btGravar.Enabled := true;
    btImprimir.Enabled := true;
    spGerarPlanilha.Enabled := true;
    Marca := 1;
  end
  else
  begin
    btGravar.Enabled := false;
    btImprimir.Enabled := false;
    spGerarPlanilha.Enabled := false;
    Marca := 0;
  end;


end;


procedure TfrmRetorno.RetornoSindical;
label volta;
var
   Retorno : TStringList;
   x,y, linha:integer;
   Arquivo, oper:String;
begin
   Retorno := TStringList.Create;
   cdsTitulos.Close;
   //cdsTitulos.CreateDataSet;
   cdsTitulos.Open;
   cdsTitulos.EmptyDataSet;
   cdsTitulos.DisableControls;

   If OpenDialog1.Execute then
   begin
      try
      ExibeAguarde('Lendo Arquivos. Aguarde... ');
      for x := 0 to OpenDialog1.Files.Count - 1 do
      begin
         linha := 0;
         Arquivo := OpenDialog1.Files[x];
         Retorno.LoadFromFile(Arquivo);

         if Retorno.Count < 3 then
         begin
           Aviso('O arquivo "' + arquivo+'" não contém pagamentos registrados. ');
           Exit;
         end;

         if length(Retorno[linha]) <> 240 then
         begin
           Erro('O arquivo "' + arquivo+'" não é um arquivo Layout CNAB240.');
           Abort;
         end;

         //Verifica se é layout CNAB240
         if Copy(Retorno.Strings[linha],143,1) <> '2' then
            Erro('O arquivo ' + Arquivo+' não é um arquivo de retorno de cobrança com layout CNAB240');

         linha := linha + 1;

         volta:
         //Verifica se é um lote de retorno de cobrança
         if Copy(Retorno.Strings[linha],9,3) <> 'T01' then
         begin
             if linha = 1 then
             begin
                 linha :=2;

                 goto volta;
             end;
            Raise Exception.Create('Este não é um lote de retorno de cobrança');
         end;

         linha := linha + 1;

         while (LINHA < Retorno.Count - 2) do
         begin
            //Registro detalhe com tipo de segmento = T
            if Copy(Retorno.Strings[LINHA],14,1) = 'T' then
            begin
               oper:= Copy(Retorno.Strings[LINHA],38,1);

               If (oper = 'D') then
               begin
                 cdsTitulos.Append;
                 cdsTitulos.Edit;

                 If Copy(Retorno.Strings[Linha],74,8) <> '00000000' then
                    cdsTitulosDataVencimento.value := strtodate(Copy(Retorno.Strings[Linha],74,2)+'/'+Copy(Retorno.Strings[Linha],76,2)+'/'+Copy(Retorno.Strings[Linha],78,4));

                 cdsTitulosNossoNumero.value := Copy(Retorno.Strings[Linha],137,12);

                 cdsTitulosSelecionado.value := true;
                 cdsTitulosValor.Value := StrToFloat(Copy(Retorno.Strings[Linha],82,15))/100;
                 cdsTitulosarquivo.value := ExtractFileName(Arquivo);

                 cdsRegistro.Close;
                 cdsRegistro.Params.ParamByName('nossonumero').AsString := cdsTitulosNossoNumero.AsString;
                 cdsRegistro.Open;
                 if (cdsRegistro.RecordCount > 0) and (cdsRegistroNOME.value <>'') then
                 begin
                    cdsTitulosNome.AsString := cdsRegistro.FieldByNAME('NOME').AsString;
                    cdsTitulosRegistro.AsString := cdsRegistro.FieldByNAME('REGISTRO').AsString;
                    cdsTitulosemp_id.value :=cdsRegistroemp_id.value;
                 end
                 else
                 begin
                     sdsLocGuiaNaoIdent.Close;
                     sdsLocGuiaNaoIdent.params.ParamByName('valor').value :=  cdsTitulosValor.Value;
                     sdsLocGuiaNaoIdent.params.ParamByName('guia').value :=cdsTitulosNossoNumero.value +'%';
                     sdsLocGuiaNaoIdent.open;

                     if sdsLocGuiaNaoIdent.RecordCount > 0 then
                     begin
                          cdsTitulosNome.AsString := sdsLocGuiaNaoIdent.FieldByNAME('NOME').AsString;
                          cdsTitulosRegistro.AsString := sdsLocGuiaNaoIdent.FieldByNAME('REGISTRO').AsString;
                          cdsTitulosemp_id.value :=sdsLocGuiaNaoIdent.FieldByNAME('emp_id').value;
                     end;
                 end;

                // OcorrenciaOriginal := Copy(Retorno.Strings[NumeroRegistro],16,2);

               end;
            end

            ELSE

            //Registro detalhe com tipo de segmento = U
            if (Copy(Retorno.Strings[linha],14,1) = 'U') {and (oper = 'D') }  then
            begin

                 If Copy(Retorno.Strings[Linha],146,8) <> '00000000' then
                 cdsTitulosCredito.Value := strtodate(Copy(Retorno.Strings[Linha],146,2)+'/'+Copy(Retorno.Strings[Linha],148,2)+'/'+Copy(Retorno.Strings[Linha],150,4));

                 If Copy(Retorno.Strings[Linha],138,8) <> '00000000' then
                    cdsTitulosData.value := strtodate(Copy(Retorno.Strings[Linha],138,2)+'/'+Copy(Retorno.Strings[Linha],140,2)+'/'+Copy(Retorno.Strings[Linha],142,4));

                 cdsTitulosdesconto.Value :=0;
                 cdsTitulosEncargosPago.value := StrToFloat(Copy(Retorno.Strings[Linha],18,15))/100;
                 cdsTitulosValorBaixa.value := StrToFloat(Copy(Retorno.Strings[Linha],78,15))/100;

                 cdsTitulos.Post;

            end;

            linha := linha + 1;
        end;

      end;
      EscondeAguarde;
      Except
         EscondeAguarde;
         Erro('Erro lendo um ou mais arquivos. ');
      End;

   end;
   cdsTitulos.EnableControls;


  Lista.Free;
  if cdsTitulos.RecordCount > 0 then
  begin
    btGravar.Enabled := true;
    btImprimir.Enabled := true;
    spGerarPlanilha.Enabled := true;
    Marca := 1;
  end
  else
  begin
    btGravar.Enabled := false;
    btImprimir.Enabled := false;
    spGerarPlanilha.Enabled := false;
    Marca := 0;
  end;


end;

procedure TfrmRetorno.MarcarTodos(marc: boolean);
begin
   cdsTitulos.DisableControls;
   cdsTitulos.First;
   while not cdsTitulos.eof do
   begin
       cdsTitulos.Edit;
       If cdsTitulosSelecionado.value = marc then
         cdsTitulosSelecionado.value := not marc;
       cdsTitulosSelecionado.value := marc;
       cdsTitulos.post;
       cdsTitulos.next;
   end;
   cdsTitulos.First;
   cdsTitulos.EnableControls;
end;

procedure TfrmRetorno.MarcarDesmarcarTodos1Click(Sender: TObject);
begin
  inherited;
  MarcarTodos(Marca = 0);
  If Marca = 0 then
     Marca := 1
     else
     Marca := 0;

end;

procedure TfrmRetorno.FormShow(Sender: TObject);
begin
  inherited;
  Marca := 0;
  cdsResultado.CreateDataSet;
  cdsTitulos.CreateDataSet;
end;

procedure TfrmRetorno.btGravarClick(Sender: TObject);
begin
  inherited;
  cdsResultado.Open;
  cdsResultado.EmptyDataSet;
  If cdsTitulos.Active= true then
  begin
      if cdsTitulos.RecordCount > 0 then
      begin
         cdsTitulos.First;
         while not cdsTitulos.eof do
         begin
            Dmboleto.sdsBoletoPagar.close;
            Dmboleto.sdsBoletoPagar.ParamByName('NOSSONUMERO').value := cdsTitulosNossoNumero.value;
            Dmboleto.sdsBoletoPagar.ParamByName('DATAPAGO').value := cdsTitulosData.value;
            Dmboleto.sdsBoletoPagar.ParamByName('DATACREDITO').value := cdsTitulosCredito.value;
            Dmboleto.sdsBoletoPagar.ParamByName('VALORBAIXA').value := cdsTitulosValorBaixa.value;
            Dmboleto.sdsBoletoPagar.ParamByName('VALORDESC').value := cdsTitulosdesconto.value;
            Dmboleto.sdsBoletoPagar.ParamByName('ENCARGOS').value := cdsTitulosEncargosPago.value;
            Dmboleto.sdsBoletoPagar.ParamByName('FORMAPAGTO').value := 'Baixa - Retorno';
            Dmboleto.sdsBoletoPagar.ParamByName('ARQUIVO').value :=  cdsTitulosarquivo.value;
            Dmboleto.sdsBoletoPagar.Open;

            cdsResultado.Append;
            cdsResultado.Edit;
            cdsResultado.FieldByName('DataVencimento').value := cdsTitulosDataVencimento.value;
            cdsResultado.FieldByName('data').value := cdsTitulosData.value;
            cdsResultado.FieldByName('credito').value := cdsTitulosCredito.value;
            cdsResultado.FieldByName('nossonumero').value := cdsTitulosNossoNumero.value;
            cdsResultado.FieldByName('registro').value := cdsTitulosRegistro.value;
            cdsResultado.FieldByName('nome').value := cdsTitulosNome.value;
            cdsResultado.FieldByName('valor').value := cdsTitulosValor.value;
            cdsResultado.FieldByName('valorbaixa').value := cdsTitulosValorBaixa.value;
            cdsResultado.FieldByName('EncargosPago').value := cdsTitulosEncargosPago.value;
            cdsResultado.FieldByName('desconto').value := cdsTitulosdesconto.value;
            cdsResultado.FieldByName('arquivo').value := cdsTitulosarquivo.value;
            cdsResultado.FieldByName('situacao').value := cdsTitulosSituacao.value;
            cdsResultado.FieldByName('StatusResultado').value := DmBoleto.sdsBoletoPagarMSG_RETORNO.value;
            cdsResultado.Post;

            cdsTitulos.edit;
            cdsTitulos.FieldByName('StatusResultado').value := DmBoleto.sdsBoletoPagarMSG_RETORNO.value;
            if cdsTitulos.FieldByName('StatusResultado').value='' then
            begin
                  cdsTitulos.FieldByName('StatusResultado').value := cdsTitulos.FieldByName('situacao').value;
                  cdsResultado.FieldByName('StatusResultado').value := cdsTitulos.FieldByName('situacao').value;
            end;
            cdsTitulos.post;
            cdsTitulos.Next;
         end;
         cdsTitulos.First;
         btImprimir.Click;
      end;

  end;
end;

procedure TfrmRetorno.btImprimirClick(Sender: TObject);
begin
  inherited;
  If cdsResultado.Active=true then
    If cdsResultado.RecordCount > 0 then
    begin
        Try Application.Createform(TQRRetornoResult,QRRetornoResult);


        cdsTitulos.first;
       // while cdsTitulosNome.value='' do
        //    cdsTitulos.next;
        if cdsTitulosemp_id.value = 1 then
           QRRetornoResult.LabEmpresa.caption:= QRRetornoResult.LabEmpresa.caption +' - MUNICÍPIO'
        ELSE
        if cdsTitulosemp_id.value = 2 then
           QRRetornoResult.LabEmpresa.caption:= QRRetornoResult.LabEmpresa.caption +' - ESTADO';

       QRRetornoResult.labtitulo.caption := 'Data: ' + datetostr(DataAtual);   
        if tipo='S' then
           QRRetornoResult.labtitulo.caption := QRRetornoResult.labtitulo.caption + ' (Sindical)'
        else
        if tipo='C' then
           QRRetornoResult.labtitulo.caption := QRRetornoResult.labtitulo.caption + ' (Confederativa)';

        QRRetornoResult.Preview;
        finally
        QRRetornoResult.free;
        end;
    end;
end;

procedure TfrmRetorno.spGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
  If dsTitulos.dataset.Active=true then
     if dsTitulos.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsTitulos.dataset), Grid1);

end;

procedure TfrmRetorno.Grid1TitleClick(Column: TColumn);
begin
  inherited;
    cdsTitulos.IndexFieldNames :=  Column.FieldName;
    cdsResultado.IndexFieldNames :=  Column.FieldName;
end;

procedure TfrmRetorno.RetornoSindicalNovo;
label volta;
var
   Retorno : TStringList;
   x,y, linha:integer;
   Arquivo, oper:String;
begin
   Retorno := TStringList.Create;
   cdsTitulos.Close;
   //cdsTitulos.CreateDataSet;
   cdsTitulos.Open;
   cdsTitulos.EmptyDataSet;
   cdsTitulos.DisableControls;

   If OpenDialog1.Execute then
   begin
      try
      ExibeAguarde('Lendo Arquivos. Aguarde... ');
      for x := 0 to OpenDialog1.Files.Count - 1 do
      begin
         linha := 0;
         Arquivo := OpenDialog1.Files[x];
         Retorno.LoadFromFile(Arquivo);

         if Retorno.Count < 3 then
         begin
           Aviso('O arquivo "' + arquivo+'" não contém pagamentos registrados. ');
           Exit;
         end;

         if length(Retorno[linha]) <> 240 then
         begin
           Erro('O arquivo "' + arquivo+'" não é um arquivo Layout CNAB240.');
           Abort;
         end;


         linha := linha + 1;

         volta:
         //Verifica se é um lote de retorno de cobrança
        { if Copy(Retorno.Strings[linha],9,3) <> 'T01' then
         begin
             if linha = 1 then
             begin
                 linha :=2;

                 goto volta;
             end;
            Raise Exception.Create('Este não é um lote de retorno de cobrança');
         end;
          }
         linha := linha + 1;

         while (LINHA < Retorno.Count - 2) do
         begin
            //Registro detalhe com tipo de segmento = T
            if Copy(Retorno.Strings[LINHA],14,1) = 'T' then
            begin

                 cdsTitulos.Append;
                 cdsTitulos.Edit;

                 If Copy(Retorno.Strings[Linha],75,8) <> '00000000' then
                    cdsTitulosDataVencimento.value := strtodate(Copy(Retorno.Strings[Linha],75,2)+'/'+Copy(Retorno.Strings[Linha],77,2)+'/'+Copy(Retorno.Strings[Linha],79,4));

                // cdsTitulosNossoNumero.value := Copy(Retorno.Strings[Linha],41,17);
                 cdsTitulosNossoNumero.value :='14'+ Copy(Retorno.Strings[Linha],107,15);
                 if Copy(Retorno.Strings[Linha],134,1) = '1' then
                     //cdsTituloscpfcnpj.value := Copy(Retorno.Strings[Linha],137,3)+'.'+Copy(Retorno.Strings[Linha],140,3)+'.'+ Copy(Retorno.Strings[Linha],143,3)+'-'+;
                     cdsTituloscpfcnpj.value := FormatMaskText('000\.000\.000\-00;0;', Copy(Retorno.Strings[Linha],139,11))

                 else
                     cdsTituloscpfcnpj.value := FormatMaskText('00\.000\.000\/0000\-00;0;', Copy(Retorno.Strings[Linha],136,14));

                 cdsTitulosSelecionado.value := true;
                 cdsTitulosValor.Value := StrToFloat(Copy(Retorno.Strings[Linha],83,15))/100;
                 cdsTitulosarquivo.value := ExtractFileName(Arquivo);

                 cdsRegistro.Close;
                 cdsRegistro.Params.ParamByName('nossonumero').AsString := cdsTitulosNossoNumero.AsString;
                 cdsRegistro.Open;
                 if (cdsRegistro.RecordCount > 0) and (cdsRegistroNOME.value <>'') then
                 begin
                    cdsTitulosNome.AsString := cdsRegistro.FieldByNAME('NOME').AsString;
                    cdsTitulosRegistro.AsString := cdsRegistro.FieldByNAME('REGISTRO').AsString;
                    cdsTitulosemp_id.value :=cdsRegistroemp_id.value;
                    cdsTituloscpfcnpj.value := MaskCPFCGC( cdsRegistro.FieldByNAME('CPFCNPJ').AsString); 
                 end
                 else
                 begin
                     cdsTitulosNome.AsString := Copy(Retorno.Strings[Linha],150,40);

                     sdsLocGuiaNaoIdent.Close;
                     sdsLocGuiaNaoIdent.params.ParamByName('valor').value :=  cdsTitulosValor.Value;
                     sdsLocGuiaNaoIdent.params.ParamByName('guia').value :=cdsTitulosNossoNumero.value +'%';
                     sdsLocGuiaNaoIdent.open;

                     if sdsLocGuiaNaoIdent.RecordCount > 0 then
                     begin
                          cdsTitulosNome.AsString := sdsLocGuiaNaoIdent.FieldByNAME('NOME').AsString;
                          cdsTitulosRegistro.AsString := sdsLocGuiaNaoIdent.FieldByNAME('REGISTRO').AsString;
                          cdsTitulosemp_id.value :=sdsLocGuiaNaoIdent.FieldByNAME('emp_id').value;
                     end;
                 end;

            end

            ELSE

            //Registro detalhe com tipo de segmento = U
            if (Copy(Retorno.Strings[linha],14,1) = 'U') then
            begin
                oper:= Copy(Retorno.Strings[LINHA],86,1);

                if (oper = 'D') then
                begin

                   If Copy(Retorno.Strings[Linha],155,8) <> '00000000' then
                   cdsTitulosCredito.Value := strtodate(Copy(Retorno.Strings[Linha],155,2)+'/'+Copy(Retorno.Strings[Linha],157,2)+'/'+Copy(Retorno.Strings[Linha],159,4));

                   If Copy(Retorno.Strings[Linha],147,8) <> '00000000' then
                      cdsTitulosData.value := strtodate(Copy(Retorno.Strings[Linha],147,2)+'/'+Copy(Retorno.Strings[Linha],149,2)+'/'+Copy(Retorno.Strings[Linha],151,4));

                   cdsTitulosdesconto.Value :=0;
                   cdsTitulosEncargosPago.value := StrToFloat(Copy(Retorno.Strings[Linha],117,15))/100;
                   cdsTitulosValorBaixa.value := StrToFloat(Copy(Retorno.Strings[Linha],87,15))/100;

                   cdsTitulosseunumero.Value :=Copy(Retorno.Strings[Linha],176,12);

                   if cdsTitulosRegistro.value='' then
                   begin
                       cdsRegistro.Close;
                       cdsRegistro.Params.ParamByName('nossonumero').AsString := cdsTitulosseunumero.AsString;
                       cdsRegistro.Open;
                       if (cdsRegistro.RecordCount > 0) and (cdsRegistroNOME.value <>'') then
                       begin
                          cdsTitulosNossoNumero.AsString := cdsTitulosseunumero.AsString;
                          cdsTitulosNome.AsString := cdsRegistro.FieldByNAME('NOME').AsString;
                          cdsTitulosRegistro.AsString := cdsRegistro.FieldByNAME('REGISTRO').AsString;
                          cdsTitulosemp_id.value :=cdsRegistroemp_id.value;
                       end;
                   end;

                   cdsTitulos.Post;
                end
                else
                   cdsTitulos.Cancel;

            end;

            linha := linha + 1;
        end;

      end;
      EscondeAguarde;
      Except
         EscondeAguarde;
        // Erro('Erro lendo um ou mais arquivos. ');
      End;

   end;
   cdsTitulos.EnableControls;


  Lista.Free;
  if cdsTitulos.RecordCount > 0 then
  begin
    btGravar.Enabled := true;
    btImprimir.Enabled := true;
    spGerarPlanilha.Enabled := true;
    Marca := 1;
  end
  else
  begin
    btGravar.Enabled := false;
    btImprimir.Enabled := false;
    spGerarPlanilha.Enabled := false;
    Marca := 0;
  end;


end;

end.

