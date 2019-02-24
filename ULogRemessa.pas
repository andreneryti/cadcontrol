unit ULogRemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Provider, SqlExpr, Menus, DBLocal, DBLocalS,
  gbCobranca, DB, DBClient, Buttons, Grids, DBGrids, JvDBCtrl, ExRxDBGrid,
  StdCtrls, ExtCtrls, WinSkinData;

type
  TfrmLogRemessa = class(TModeloComum)
    Panel2: TPanel;
    btSair: TBitBtn;
    SkinData2: TSkinData;
    Bevel1: TBevel;
    Label1: TLabel;
    Grid1: TExRxDBGrid;
    Panel3: TPanel;
    spNovo: TSpeedButton;
    spGerarPlanilha: TSpeedButton;
    cdsTitulos: TClientDataSet;
    dsTitulos: TDataSource;
    OpenDialog1: TOpenDialog;
    cdsRegistro: TSQLClientDataSet;
    PopupMarc: TPopupMenu;
    MarcarDesmarcarTodos1: TMenuItem;
    cdsTitulosnome: TStringField;
    cdsTituloscfpcnpj: TStringField;
    cdsTituloscompetencia: TStringField;
    cdsTitulosnossonumerolocal: TStringField;
    cdsTitulossituacao: TStringField;
    cdsTitulosmotivo: TStringField;
    cdsTitulosValor: TFloatField;
    cdsTitulosDatavencto: TDateField;
    cdsRegistroNOSSONUMERO: TStringField;
    cdsRegistroNOME: TStringField;
    procedure spNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure spGerarPlanilhaClick(Sender: TObject);
    procedure Grid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogRemessa: TfrmLogRemessa;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmLogRemessa.spNovoClick(Sender: TObject);
var
   Retorno : TStringList;
   x,y, linha:integer;
   Arquivo, oper:String;
   competencia, cpfcnpj, nome, nossonumero:string;
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
         if Copy(Retorno.Strings[linha],186,3) <> 'LOG' then
         begin
             EscondeAguarde;
             Erro('O arquivo "' + arquivo+'" não é um arquivo de log de envio de remessa.');
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


                cdsTitulosnome.VALUE := nome;
                cdsTituloscfpcnpj.Value := cpfcnpj;
                cdsTituloscompetencia.value := competencia;
                cdsTitulosnossonumerolocal.Value :=nossonumero;
                cdsTitulossituacao.Value :=   Copy(Retorno.Strings[LINHA],232,09);
                if Copy(Retorno.Strings[LINHA],216,3) <>'000' then
                   cdsTitulosmotivo.Value := Copy(Retorno.Strings[LINHA],216,3)
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
    spGerarPlanilha.Enabled := true
  else
    spGerarPlanilha.Enabled := false;


end;

procedure TfrmLogRemessa.FormCreate(Sender: TObject);
begin
  inherited;
  cdsTitulos.CreateDataSet;
end;

procedure TfrmLogRemessa.btSairClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TfrmLogRemessa.spGerarPlanilhaClick(Sender: TObject);
begin
  inherited;
  If dsTitulos.dataset.Active=true then
     if dsTitulos.DataSet.RecordCount > 0 then
        GeraPlanilha(TClientDataset(dsTitulos.dataset), Grid1);

end;

procedure TfrmLogRemessa.Grid1TitleClick(Column: TColumn);
begin
  inherited;
    cdsTitulos.IndexFieldNames :=  Column.FieldName;
end;

end.
