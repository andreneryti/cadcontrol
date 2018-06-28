unit UDMConexao;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, forms, ActnList, UCDefine,
  DBXUserControl, ImgList, Controls, FMTBcd, midaslib;

type
  TDMConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
    SQLConexaoImg: TSQLConnection;
    UserSettings: TUCSettings;
    UserControl: TDBXUserControl;
    AppMessages: TUCAppMessage;
    UserActions: TActionList;
    acCadUsu: TAction;
    acPerfilUsu: TAction;
    acLogSis: TAction;
    acTrocaSenha: TAction;
    acLogOff: TAction;
    acUserMessages: TAction;
    Imagens: TImageList;
    sdsConfig: TSQLDataSet;
    sdsConfigEMP_ID: TIntegerField;
    sdsConfigNOMEEMP: TStringField;
    sdsConfigCNPJ: TStringField;
    sdsConfigDOC_TIPOINSCRICAO: TStringField;
    sdsConfigDOC_NUMINSCRICAO: TStringField;
    sdsConfigENDER_LOGRADOURO: TStringField;
    sdsConfigENDER_NUMERO: TStringField;
    sdsConfigENDER_COMPLEMENTO: TStringField;
    sdsConfigENDER_BAIRRO: TStringField;
    sdsConfigCIDADE_ID: TIntegerField;
    sdsConfigENDER_CEP: TStringField;
    sdsConfigTEL1: TStringField;
    sdsConfigTEL2: TStringField;
    sdsConfigCEL: TStringField;
    sdsConfigFAX: TStringField;
    sdsConfigSITE: TStringField;
    sdsConfigEMAIL: TStringField;
    sdsConfigREGIAO: TStringField;
    sdsConfigMULTA_PERC: TFMTBCDField;
    sdsConfigJUROS_PERC: TFMTBCDField;
    SdsGeraGen: TSQLQuery;
    SQLQuery1: TSQLQuery;
    sdsConfigCAMINHOPDFSEMAIL: TStringField;
    sdsConfigNOMEINICIALARQPDF: TStringField;
    SdsExecSql: TSQLDataSet;
    sdsConfigLIMITEEMAILHORA: TIntegerField;
    sdsConfigNOTIF_TEXTO1: TMemoField;
    sdsConfigNOTIF_TEXTO2: TMemoField;
    sdsConfigPERCENTREPASSE: TFMTBCDField;
    sdsConfigTEXTO1_CONFISSAO_PJ: TMemoField;
    sdsConfigTEXTO1_CONFISSAO_PF: TMemoField;
    sdsConfigTEXTO2_CONFISSAO_PF: TMemoField;
    sdsConfigTEXTO2_CONFISSAO_PJ: TMemoField;
    sdsConfigNOTIF_TEXTO_PF_1: TMemoField;
    sdsConfigNOTIF_TEXTO_PF_2: TMemoField;
    sdsConfigCAMINHONOTIFIC: TStringField;
    sdsConfigCOBRREGISTRADA: TIntegerField;
    sdsConfigCAMINHOREMESSA: TStringField;
    sdsConfigARQSREMESSA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConexaoBeforeConnect(Sender: TObject);
    procedure SQLConexaoImgBeforeConnect(Sender: TObject);
    procedure acUserMessagesExecute(Sender: TObject);
    procedure acLogOffExecute(Sender: TObject);
    Procedure ExecSQL (SQLText : STring; SQLParams : TParams = Nil);
    function ExecuteProc(Name: string; parametros: string): integer;

  private
    { Private declarations }
    NumTransaction: Integer;
  public
      procedure StartTransaction; overload;
    procedure StartTransaction(conexao: TSQLConnection); overload;

  Function GeraAutoNumber (Name :String; Incremento:Integer=1) : Longint;
  procedure Log(MSG: String; operacao: char; ass_id: integer);
        procedure Commit; overload;
        procedure Commit(conexao: TSQLConnection); overload;

        procedure RollBack; overload;
        procedure RollBack(conexao: TSQLConnection); overload;



    { Public declarations }
  end;

var
  DMConexao: TDMConexao;
  DataAtual:Tdatetime;
  UserId:Integer;
  UserName:String;
  TD: TTransactionDesc;

implementation

uses UFuncoes, UPrincipal;

{$R *.dfm}

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  try
  SQLConexao.Connected := True;
  SQLConexaoImg.Connected := True;
  sdsConfig.Open;
  Except
  Erro('Erro ao conectar o Banco de Dados. ');
  end;
  DataAtual := Now;
  shortdateformat:='dd/mm/yyyy';
  NumTransaction:=0;
end;

procedure TDMConexao.SQLConexaoBeforeConnect(Sender: TObject);
begin
  SQLConexao.Params.LoadFromFile(ExtractFilePath(Application.ExeName) + 'CadControl.ini');
{  SQLConexao.Params.Values['Password']  := 'masterkey';
  SQLConexao.Params.Values['User_Name'] := 'sysdba';
  }
end;

procedure TDMConexao.SQLConexaoImgBeforeConnect(Sender: TObject);
begin
  SQLConexaoImg.Params.LoadFromFile(ExtractFilePath(Application.ExeName) + 'CadControlImg.ini');
{  SQLConexaoImg.Params.Values['Password']  := 'masterkey';
  SQLConexaoImg.Params.Values['User_Name'] := 'sysdba';
  }
end;

procedure TDMConexao.acUserMessagesExecute(Sender: TObject);
begin
AppMessages.ShowMessages;
end;

procedure TDMConexao.acLogOffExecute(Sender: TObject);
begin
   UserControl.Logoff;
   UserId := DMConexao.UserControl.CurrentUser.UserID;
   UserName := DMConexao.UserControl.CurrentUser.UserName;
   frmPrincipal.LABUSER.caption:= 'Usuário: '+UserName;
end;



function TDMConexao.GeraAutoNumber(Name: String;
  Incremento: Integer): Longint;
begin
  SdsGeraGen.Close;
  SdsGeraGen.SQL.Text := 'SELECT CAST(GEN_ID(' + Name + ', ' + IntToStr(Incremento) + ') AS INTEGER) As NUMERO from RDB$DATABASE';
  SdsGeraGen.Active := True;
  result := SdsGeraGen.Fields[0].AsInteger;
end;


procedure TDMConexao.Log(MSG: String; operacao: char; ass_id: integer);
begin
  if not usercontrol.LogControl.Active then Exit;
  msg := StringReplace(msg,'"','', [rfreplaceall]);
  msg := StringReplace(msg,'`','', [rfreplaceall]);
  try
  ExecSQL('Insert into ' + usercontrol.LogControl.TableLog + '( IdUser, MSG, Data, OPERACAO, DATA_OPERACAO,HORA_OPERACAO,ASS_ID) Values ( '+
            IntToStr(usercontrol.CurrentUser.UserID)+', '+
            QuotedStr(Copy(MSG,1,250))+', '+
            QuotedStr(FormatDateTime('YYYYMMDDhhmmss',now))+', '+
            QuotedStr(operacao) +', '+
            QuotedStr(FormatDateTime('MM/DD/YYYY',now))+', '+
            QuotedStr(FormatDateTime('hh:mm:ss',now))+', '+
            inttostr(ass_id)+')');
  except
  Erro('Erro ao registrar o Log do Sistema: '+#13+ msg);
  end;
end;

procedure TDMConexao.ExecSQL(SQLText: STring; SQLParams: TParams);
begin
  SQLQuery1.SQL.Text := SQLText;
  if Assigned (SQLParams) then
    SQLQuery1.Params.Assign(SQLParams);
  SQLQuery1.ExecSQL(True);

end;

procedure TDMConexao.StartTransaction;
begin
  if not SQLConexao.InTransaction then
  begin
    TD.TransactionID := 100;
    SQLConexao.StartTransaction(TD);
  end;
  NumTransaction := NumTransaction + 1;

end;

procedure TDMConexao.Commit;
begin
  NumTransaction := NumTransaction - 1;
  if NumTransaction = 0 then
    if SQLConexao.InTransaction then
      SQLConexao.Commit(TD);
  if not SQLConexao.InTransaction then
    NumTransaction := 0

end;

procedure TDMConexao.RollBack;
begin
  if SQLConexao.InTransaction then
    SQLConexao.Rollback(TD);
  NumTransaction := 0;

end;

function TDMConexao.ExecuteProc(Name, parametros: string): integer;
var
    RETORNO: Integer;
    con: TSQLConnection;
begin
    try
        con := TSQLConnection.Create(nil);
        con.LoginPrompt := false;
        con.DriverName := SQLConexao.DriverName;
        Con.KeepConnection := False;
        Con.GetDriverFunc := SQLConexao.GetDriverFunc;
        Con.VendorLib := SQLConexao.VendorLib;
        Con.LibraryName := SQLConexao.LibraryName;
        con.Params := SQLConexao.params;
        con.Open;

        StartTransaction(con);
        SdsExecSql.SQLConnection := con;
        SdsExecSql.CommandText := ' execute procedure ' + name + ' (' + parametros + ')';
        SdsExecSql.ExecSQL();
        Commit(con);
        retorno := 1;
    except
        RollBack(con);
        con.Close;
        retorno := 0;
    end;
    con.Close;
    result := retorno;
end;

procedure TDMConexao.StartTransaction(conexao: TSQLConnection);
begin
    if not conexao.InTransaction then
    begin
        TD.TransactionID := 100;
        conexao.StartTransaction(TD);
    end;
    NumTransaction := NumTransaction + 1;

end;

procedure TDMConexao.Commit(conexao: TSQLConnection);
begin
    NumTransaction := NumTransaction - 1;
    if NumTransaction = 0 then
        if conexao.InTransaction then
            conexao.Commit(TD);
    if not conexao.InTransaction then
        NumTransaction := 0

end;

procedure TDMConexao.RollBack(conexao: TSQLConnection);
begin
    if conexao.InTransaction then
        conexao.Rollback(TD);
    NumTransaction := 0;

end;

end.
