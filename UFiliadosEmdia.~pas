unit UFiliadosEmdia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, DB, Grids, DBGrids, Buttons, ToolWin, ComCtrls,
  JvToolEdit, JvLookup, StdCtrls, Mask, ExtCtrls, ActnList, WinSkinData,
  FMTBcd, Provider, SqlExpr, DBClient, DBLocal, DBLocalS, comObj;

type
  TfrmFiliadosEmdia = class(TModeloComum)
    ActionList1: TActionList;
    acGerarBoletoGuia: TAction;
    acEtiqueta: TAction;
    acGerarPlanilha: TAction;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    btLocalizar: TBitBtn;
    cbTipoContrib: TComboBox;
    edAnoInicio: TMaskEdit;
    ToolBar1: TToolBar;
    spImprimirEtiq: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    gridCobranca: TDBGrid;
    dsAssocEmdia: TDataSource;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    cbaberto: TComboBox;
    cdsTp_Pessoa: TClientDataSet;
    cdsTp_PessoaTP_ASSOC_ID: TIntegerField;
    cdsTp_PessoaTP_ASSOC_DESC: TStringField;
    sdsTp_Pessoa: TSQLDataSet;
    dspTp_Pessoa: TDataSetProvider;
    dsTp_Pessoa: TDataSource;
    Label8: TLabel;
    Label7: TLabel;
    labtotal: TLabel;
    cdsFiliados: TClientDataSet;
    cdsFiliadosASS_ID: TIntegerField;
    cdsFiliadosREGISTRO: TStringField;
    cdsFiliadosNOME: TStringField;
    cdsFiliadosREGIAO: TStringField;
    cdsFiliadosCPFCNPJ: TStringField;
    cdsFiliadosEND_ID: TIntegerField;
    cdsFiliadosEND_LOGRADOURO: TStringField;
    cdsFiliadosEND_NUMERO: TStringField;
    cdsFiliadosEND_COMPLEMENTO: TStringField;
    cdsFiliadosEND_BAIRRO: TStringField;
    cdsFiliadosEND_CEP: TStringField;
    cdsFiliadosSTATUSCORRESP: TStringField;
    cdsFiliadosCIDADE_NOME: TStringField;
    cdsFiliadosESTADO_NOME: TStringField;
    cdsFiliadosTP_ENDER_DESCR: TStringField;
    cdsFiliadosENDER_COMPLETO: TStringField;
    dsFiliados: TDataSource;
    cbFechado: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cbParcel: TComboBox;
    sdsFiliadosEmdia: TSQLClientDataSet;
    sdsFiliadosEmdiaREGISTRO: TStringField;
    sdsFiliadosEmdiaNOME: TStringField;
    sdsFiliadosEmdiaCPFCNPJ: TStringField;
    sdsFiliadosEmdiaLOGRADOURO: TStringField;
    sdsFiliadosEmdiaNUMERO: TStringField;
    sdsFiliadosEmdiaCOMPLEMENTO: TStringField;
    sdsFiliadosEmdiaBAIRRO: TStringField;
    sdsFiliadosEmdiaCEP: TStringField;
    sdsFiliadosEmdiaSTATUSCORRESP: TStringField;
    sdsFiliadosEmdiaCIDADE_NOME: TStringField;
    sdsFiliadosEmdiaESTADO_NOME: TStringField;
    sdsFiliadosEmdiaTP_ENDER_DESCR: TStringField;
    sdsFiliadosEmdiaASS_ID: TIntegerField;
    sdsFiliadosEmdiaTELS: TStringField;
    sdsFiliadosEmdiaEMAIL: TStringField;
    sdsFiliadosEmdiaTIPOPESSOADESC: TStringField;
    edTpPessoa: TComboBox;
    cbLocalidade: TComboBox;
    procedure btLocalizarClick(Sender: TObject);
    procedure Etiquetas_Envelopes(Query:TClientDataset);
    procedure FormShow(Sender: TObject);
    procedure gridCobrancaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure acEtiquetaExecute(Sender: TObject);
    procedure GeraPlanilha(Query: tClientDataset; grid:TDbGrid);
    procedure BitBtn1Click(Sender: TObject);
    procedure acGerarPlanilhaExecute(Sender: TObject);
    procedure gridCobrancaTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiliadosEmdia: TfrmFiliadosEmdia;

implementation

uses UDmFinancas, UDMAssociado, UFuncoes, UDMConexao, UOpcoes_Etiq_Envelop,
  UEtiquetas, UEnvelopeTipo;

{$R *.dfm}

procedure TfrmFiliadosEmdia.btLocalizarClick(Sender: TObject);
var i, continua, filtro1, filtro2, cont:integer;
begin
  inherited;
   try
     strtoint(edAnoInicio.Text);
   except
     erro('Digite o ano corretamente. ');
     exit;
   end;


   ExibeAguarde('Localizando registros. Por favor aguarde...');

   try
   sdsFiliadosEmdia.Close;

   for i := 0 to 7 do
       sdsFiliadosEmdia.Params[i].clear;


   sdsFiliadosEmdia.Params.ParamByName('EMP_ID').value :=cbLocalidade.ItemIndex+1;

   sdsFiliadosEmdia.Params.ParamByName('CONTRIB_ID').value := cbTipoContrib.ItemIndex+1;
   sdsFiliadosEmdia.Params.ParamByName('TIPOPESSOA').value := edTpPessoa.ItemIndex+1;
   sdsFiliadosEmdia.Params.ParamByName('EMDIACOM').value :=strtoint(edAnoInicio.text);
   sdsFiliadosEmdia.Params.ParamByName('ANTERIOR').value :=cbaberto.ItemIndex;
   sdsFiliadosEmdia.Params.ParamByName('POSTERIOR').value := cbFechado.ItemIndex;
   if cbParcel.ItemIndex = 0 then
      sdsFiliadosEmdia.Params.ParamByName('COMPARC').value :=-1
   else
      sdsFiliadosEmdia.Params.ParamByName('COMPARC').value :=1;

   sdsFiliadosEmdia.Params.ParamByName('PARCABERTOFECHADO').value := cbParcel.ItemIndex;


   sdsFiliadosEmdia.Open;

   except
     Erro ('Erro ao localizar registros. ');
     EscondeAguarde;
     exit;
   end;


   EscondeAguarde;
   labtotal.Caption:= inttostr(sdsFiliadosEmdia.recordcount);


end;

procedure TfrmFiliadosEmdia.Etiquetas_Envelopes(Query: TClientDataset);
begin
     Try application.createform(TFrmOpcoes_Etiq_Env,FrmOpcoes_Etiq_Env);
     if FrmOpcoes_Etiq_Env.showmodal = mrok then
     begin
       If FrmOpcoes_Etiq_Env.radEtiqueta.Checked = true then
       begin
           try  application.createform(TfrmEtiqueta,frmEtiqueta);
           frmEtiqueta.Dados.Open;
           Query.DisableControls;
           Query.first;
           while not Query.eof do
           begin
                If (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                begin
                    frmEtiqueta.Dados.Append;
                    frmEtiqueta.Dados.Edit;
                    IF Query.fieldbyname('registro').value <> NULL  THEN
                       frmEtiqueta.DadosREGISTRO.value := StringReplace (Query.fieldbyname('registro').Value,'/','', [rfReplaceAll]);
                    IF Query.fieldbyname('BAIRRO').value <> NULL  THEN
                       frmEtiqueta.Dadosbairro.value := Query.fieldbyname('BAIRRO').value;
                    IF Query.fieldbyname('COMPLEMENTO').value <> NULL  THEN
                       frmEtiqueta.Dadoscomplemento.value := Query.fieldbyname('COMPLEMENTO').value;

                    if length(Query.fieldbyname('CEP').value)=8 then
                       frmEtiqueta.Dadoscep.value := copy(Query.fieldbyname('CEP').value,1,2)+'.'+copy(Query.fieldbyname('CEP').value,3,3)+ '-'+copy(Query.fieldbyname('CEP').value,6,3)
                    else
                    begin
                       IF Query.fieldbyname('CEP').value <> NULL  THEN
                          frmEtiqueta.Dadoscep.value := Query.fieldbyname('CEP').value;
                    end;
                    IF Query.fieldbyname('CIDADE_NOME').value <> NULL THEN
                       frmEtiqueta.Dadoscidade.value := Query.fieldbyname('CIDADE_NOME').value;
                    IF Query.fieldbyname('LOGRADOURO').value <> NULL  THEN
                        frmEtiqueta.Dadosendereco.value := Query.fieldbyname('LOGRADOURO').value;

                    IF Query.fieldbyname('NUMERO').value <> NULL  THEN
                        frmEtiqueta.Dadosendereco.value := frmEtiqueta.Dadosendereco.value + ', ' + Query.fieldbyname('NUMERO').value;

                    IF Query.fieldbyname('ESTADO_NOME').value <> NULL THEN
                        frmEtiqueta.Dadosestado.value := Query.fieldbyname('ESTADO_NOME').value;
                    IF Query.fieldbyname('nome').value <> NULL THEN
                        frmEtiqueta.Dadosnome.value := Query.fieldbyname('nome').value;
                    frmEtiqueta.Dados.post;
                End;
              Query.Next;
           end;
           Query.first;
           Query.EnableControls;
           frmEtiqueta.ShowModal;
           finally
           frmEtiqueta.free;
           end;
       end
       else
       If FrmOpcoes_Etiq_Env.radEnvelope.Checked = true then
       begin
             try Application.createform(TfrmEnvelopeTipo,frmEnvelopeTipo);
             If frmEnvelopeTipo.showmodal = mrok then
             begin
                 FrmOpcoes_Etiq_Env.Dados.Open;
                 Query.DisableControls;
                 Query.first;
                 while not Query.eof do
                 begin
                   If (Query.FieldByName('STATUSCORRESP').value <> 'Corresp. Devolvida') and (Query.FieldByName('STATUSCORRESP').value <> 'Sem Endereço Cadastrado') then
                   begin
                        FrmOpcoes_Etiq_Env.Dados.Append;
                        FrmOpcoes_Etiq_Env.Dados.Edit;
                        if Query.fieldbyname('REGISTRO').value <>'/' then
                           FrmOpcoes_Etiq_Env.DadosREGISTRO.value := StringReplace (Query.fieldbyname('registro').Value,'/','', [rfReplaceAll]);
                        FrmOpcoes_Etiq_Env.Dadosbairro.value := Query.fieldbyname('BAIRRO').value;
                        if length(Query.fieldbyname('CEP').value)=8 then
                           FrmOpcoes_Etiq_Env.Dadoscep.value := copy(Query.fieldbyname('CEP').value,1,2)+'.'+copy(Query.fieldbyname('CEP').value,3,3)+ '-'+copy(Query.fieldbyname('CEP').value,6,3)
                        else
                           FrmOpcoes_Etiq_Env.Dadoscep.value := Query.fieldbyname('CEP').value;

                        FrmOpcoes_Etiq_Env.Dadoscidade.value := Query.fieldbyname('CIDADE_NOME').value;
                        FrmOpcoes_Etiq_Env.Dadoscomplemento.value := Query.fieldbyname('COMPLEMENTO').value;
                        FrmOpcoes_Etiq_Env.Dadosendereco.value := Query.fieldbyname('logradouro').value;
                        IF Query.fieldbyname('NUMERO').value <> NULL  THEN
                           FrmOpcoes_Etiq_Env.Dadosendereco.value := FrmOpcoes_Etiq_Env.Dadosendereco.value +', '+Query.fieldbyname('NUMERO').value;

                        FrmOpcoes_Etiq_Env.Dadosestado.value := Query.fieldbyname('ESTADO_NOME').value;
                        FrmOpcoes_Etiq_Env.Dadosnome.value := Query.fieldbyname('NOME').value;
                        FrmOpcoes_Etiq_Env.Dados.post;
                   End;
                   Query.Next;
                 end;
                 Query.first;
                 Query.EnableControls;

                 If frmEnvelopeTipo.radMedio.checked =  true then
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(1) //Medio
                 else
                 If frmEnvelopeTipo.radOficio.checked =  true then
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(2) //Oficio
                 else
                    FrmOpcoes_Etiq_Env.Imprime_Envelopes(3); //A4
             end;
             Finally
              frmEnvelopeTipo.free;
             end;
       end;
     end;
     finally
     FrmOpcoes_Etiq_Env.free;
     end;


end;

procedure TfrmFiliadosEmdia.FormShow(Sender: TObject);
begin
  inherited;
  DMAssociado.dsEmp_Regiao.dataset.close;
  DMAssociado.dsEmp_Regiao.dataset.open;
  cdsTp_Pessoa.open;
  DMAssociado.dsEmp_Regiao.dataset.first;
  //cbLocalidade.Text:=DMAssociado.dsEmp_Regiao.dataset.fieldbyname('Regiao').value;
  edAnoInicio.text := inttostr( ExtractYear(DataAtual));
//  edAnoFim.text := inttostr( ExtractYear(DataAtual));
  dsAssocEmdia.DataSet.close;
  cdsFiliados.Createdataset;
  cbParcel.ItemIndex :=0;

end;

procedure TfrmFiliadosEmdia.gridCobrancaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
  begin
    Tdbgrid(sender).Canvas.Brush.color := clwindow;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    Tdbgrid(sender).Canvas.Brush.Color := $00FFCECE;
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if gdselected in State then
  begin
    Tdbgrid(sender).Canvas.Brush.Color := clNavy;
    Tdbgrid(sender).Canvas.Font.Color := clwhite;
    Tdbgrid(sender).Canvas.FillRect(Rect);
    Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmFiliadosEmdia.acEtiquetaExecute(Sender: TObject);
begin
  inherited;
  If dsFiliados.dataset.Active=true then
     if dsFiliados.DataSet.RecordCount > 0 then
        Etiquetas_Envelopes(TClientDataset(dsFiliados.dataset));

end;

procedure TfrmFiliadosEmdia.GeraPlanilha(Query: tClientDataset;
  grid: TDbGrid);
var
  Excel: Variant;
  Linha, i: Integer;
begin
  if not Query.IsEmpty then
  begin
    try
        ExibeAguarde('Gerando Planilha, Aguarde...');
        Query.DisableControls;
        Query.First;

        Excel := CreateOleObject('Excel.Application');

        Excel.Workbooks.Add();

        linha := 1;
        for i:= 0 to Grid.Columns.Count - 1do
        begin
          if (grid.Columns[i].Visible = true)  then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := grid.Columns[i].Title.Caption;
        end;

        linha := linha +1;

        while not Query.Eof do
        begin
           for i:= 0 to Grid.Columns.Count-1 do
           begin
                  if (grid.Columns[i].Visible = true) then
                  begin
                        If grid.DataSource.DataSet.Fieldbyname(grid.Columns[i].fieldname) is tfmtbcdfield then
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat  := 'R$ #.##0,00_);(R$ #.##0,00)';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=grid.Columns.Items[i].Field.asfloat//formatfloat(',0.00',dbgrid.Columns.Items[i-1].Field.Value)
                        end
                        else
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1].numberformat :=  '@';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] :=  grid.Columns.Items[i].Field.AsString;
                        end;
                  end;
           end;
           Linha := Linha + 1;
           Query.Next;
        end;
        Query.first;

        Query.EnableControls;
        EscondeAguarde;
        Aviso('Planilha gerada com sucesso. ');
        Excel.Visible := True;
        excel.columns.AutoFit;
     except
       excel.Free;
     end;
  end;

end;

procedure TfrmFiliadosEmdia.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmFiliadosEmdia.acGerarPlanilhaExecute(Sender: TObject);
begin
  inherited;
   If dsFiliados.dataset.Active=true then
     if dsFiliados.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsFiliados.dataset), gridCobranca);
end;

procedure TfrmFiliadosEmdia.gridCobrancaTitleClick(Column: TColumn);
begin
  inherited;
  sdsFiliadosEmdia.IndexFieldNames :=  Column.FieldName;
end;

end.
