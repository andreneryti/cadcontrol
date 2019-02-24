unit ULerPreCritica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, Provider, SqlExpr,
  Menus, DBLocal, DBLocalS, DB, DBClient, Buttons, Grids, DBGrids,
  JvDBCtrl, ExRxDBGrid, StdCtrls;

type
  TfrmLerPreCritica = class(TModeloComum)
    Panel2: TPanel;
    Panel3: TPanel;
    btSair: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Grid1: TExRxDBGrid;
    Panel4: TPanel;
    spNovo: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    cdsTitulos: TClientDataSet;
    cdsTitulosnome: TStringField;
    cdsTituloscfpcnpj: TStringField;
    cdsTituloscompetencia: TStringField;
    cdsTitulosnossonumerolocal: TStringField;
    cdsTitulossituacao: TStringField;
    cdsTitulosValor: TFloatField;
    cdsTitulosDatavencto: TDateField;
    dsTitulos: TDataSource;
    OpenDialog1: TOpenDialog;
    cdsRegistro: TSQLClientDataSet;
    cdsRegistroNOSSONUMERO: TStringField;
    cdsRegistroNOME: TStringField;
    PopupMarc: TPopupMenu;
    MarcarDesmarcarTodos1: TMenuItem;
    cdsTitulosNossonumeroCaixa: TStringField;
    cdsTitulosmotivo: TStringField;
    btGravar: TSpeedButton;
    cdsTitulosBOL_ID: TIntegerField;
    cdsRegistroBOL_ID: TIntegerField;
    procedure spGerarPlanilhaClick(Sender: TObject);
    procedure spNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure Grid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLerPreCritica: TfrmLerPreCritica;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmLerPreCritica.spGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
 If dsTitulos.dataset.Active=true then
     if dsTitulos.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsTitulos.dataset), Grid1);

end;

procedure TfrmLerPreCritica.spNovoClick(Sender: TObject);
var
   Retorno : TStringList;
   x,y, linha:integer;
   Arquivo, oper:String;
   competencia, cpfcnpj, nome, nossonumero, nossonumeroCAIXA:string;
   valor:Real;
   vencimento:TDateTime;
begin
   Retorno := TStringList.Create;
   cdsTitulos.Close;
   //cdsTitulos.CreateDataSet;
   cdsTitulos.Open;
   cdsTitulos.EmptyDataSet;
   cdsTitulos.DisableControls;

   If OpenDialog1.Execute then
   begin

      ExibeAguarde('Lendo Arquivos. Aguarde... ');
      for x := 0 to OpenDialog1.Files.Count - 1 do
      begin
         linha := 0;
         Arquivo := OpenDialog1.Files[x];
         Retorno.LoadFromFile(Arquivo);

         if Retorno.Count < 3 then
         begin
           EscondeAguarde;
           Aviso('O arquivo "' + arquivo+'" não contém registros válidos. ');
           Exit;
         end;

         if length(Retorno[linha]) <> 240 then
         begin
           EscondeAguarde;
           Erro('O arquivo "' + arquivo+'" não é um arquivo Layout CNAB240.');
           Abort;
         end;


         //Verifica se é log
         if (Copy(Retorno.Strings[linha],186,3) = 'LOG') or (Copy(Retorno.Strings[linha],173,7) = 'RETORNO') then
         begin
             EscondeAguarde;
             Erro('O arquivo "' + arquivo+'" não é um arquivo de PRÉ-CRÍTICA.');
             Abort;
         end;

         linha := linha + 2;

         while (LINHA < Retorno.Count - 2) do
         begin
            //Registro detalhe com tipo de segmento = T
            if Copy(Retorno.Strings[LINHA],14,1) = 'T' then
            begin

                competencia := Copy(Retorno.Strings[LINHA],61,10);
                cpfcnpj := Copy(Retorno.Strings[LINHA],136,14);
                vencimento := strtodate(Copy(Retorno.Strings[Linha],75,2)+'/'+Copy(Retorno.Strings[Linha],77,2)+'/'+Copy(Retorno.Strings[Linha],79,4));
                valor := StrToFloat(Copy(Retorno.Strings[Linha],83,15))/100;
                nome :=  Copy(Retorno.Strings[LINHA],150,40);
                nossonumeroCAIXA := Copy(Retorno.Strings[LINHA],41,17);

                cdsRegistro.close;
                cdsRegistro.Params.ParamByName('cpfcpnj').value :=  cpfcnpj;
                cdsRegistro.Params.ParamByName('valor').value :=  valor;
                cdsRegistro.Params.ParamByName('date').value := vencimento;
                cdsRegistro.Params.ParamByName('competencia').value := competencia;
                cdsRegistro.open;


                cdsTitulos.Append;
                cdsTitulos.Edit;

                if cdsRegistro.RecordCount = 1 then
                begin
                   nome := cdsRegistroNOME.Value;
                   nossonumero := cdsRegistroNOSSONUMERO.Value;
                end
                else
                   nossonumero := 'NÃO IDENFITICADO';


                cdsTitulosBOL_ID.VALUE := cdsRegistroBOL_ID.value;
                cdsTitulosnome.VALUE := nome;
                cdsTituloscfpcnpj.Value := cpfcnpj;
                cdsTituloscompetencia.value := competencia;
                cdsTitulosnossonumerolocal.Value :=nossonumero;
                cdsTitulosNossonumeroCaixa.Value :=nossonumeroCAIXA;
                cdsTitulossituacao.Value :=   Copy(Retorno.Strings[LINHA],232,09);
                if Copy(Retorno.Strings[LINHA],216,4) <>'0000' then
                   cdsTitulosmotivo.Value := Copy(Retorno.Strings[LINHA],216,4)
                else
                   cdsTitulosmotivo.Value :='';
                cdsTitulosValor.value := valor;
                cdsTitulosDatavencto.value := vencimento;
                cdsTitulos.post;
             end;

         linha := linha + 1;
        end;
      end;

      EscondeAguarde;
   end;
   cdsTitulos.EnableControls;

   Retorno.Free;

  if cdsTitulos.RecordCount > 0 then
  begin
    btGravar.Enabled := true;
    spGerarPlanilha.Enabled := true;
  end
  else
  begin
    spGerarPlanilha.Enabled := false;
    btGravar.Enabled := false;
  end;


end;

procedure TfrmLerPreCritica.FormCreate(Sender: TObject);
begin
  inherited;
  cdsTitulos.CreateDataSet;
end;

procedure TfrmLerPreCritica.btGravarClick(Sender: TObject);
begin
  inherited;
  IF cdsTitulos.Active = true then
     if cdsTitulos.RecordCount > 0 then
     begin
         ExibeAguarde('Aplicando o nossonúmero de cada guia. Por favor, aguarde...');
        cdsTitulos.First;
        while not cdsTitulos.Eof do
        begin
           if(cdsTitulosnossonumerolocal.value <> 'NÃO IDENTIFICADO') AND (cdsTitulosnossonumerolocal.value <> cdsTitulosNossonumeroCaixa.value ) then
           begin
                Dmconexao.ExecSQL('update boleto set nossonumero='+ QuotedStr(cdsTitulosNossonumeroCaixa.value) + ' where bol_id = ' + IntToStr(cdsTitulosBOL_ID.value ));
                cdsTitulos.edit;
                cdsTitulossituacao.Value :='Nosso número aplicado.';
                cdsTitulos.post;
           end;


           cdsTitulos.Next;
        end;
        cdsTitulos.first;
        EscondeAguarde;



     end;
end;

procedure TfrmLerPreCritica.Grid1TitleClick(Column: TColumn);
begin
  inherited;
    cdsTitulos.IndexFieldNames :=  Column.FieldName;
end;

end.
