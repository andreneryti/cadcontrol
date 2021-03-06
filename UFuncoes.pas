unit UFuncoes;

interface
uses
    Classes, forms, windows,Grids,MaskUtils,SysUtils, stdCtrls,ExtCtrls, Controls,Dialogs, Graphics, comObj, dbClient, Dbgrids, db, comctrls, messages, RichEdit,NMHTTP, NMURL, StrUtils, PDFCreator_TLB,printers,QuickRpt,Variants,Winspool, shellapi;

    Procedure Aviso (Msg : String);
    Procedure Erro (Msg : String);
    Function Confirma (Msg : String) : Boolean;
    Function MaskCPFCGC(NumeroCPFCGC : STring) : String;
    Function ValidaCPFCNPJ(NumeroCPFCGC : STring) : boolean;
    function VDigitoCGC(CGC: string): string;
    {- Retorna os Dois Digitos Verifacadores Do CGC }

    function VDigitoCPF(CPF: string): string;
    {- Retorna os Dois Digitos Verifacadores Do CPF }

    Function UltimoDia (aDate : TDateTime) : TDateTime;
    Function ExtractDay(ADate: TDateTime): Word;
    Function ExtractMonth(ADate: TDateTime): Word;
    Function ExtractYear(ADate: TDateTime): Word;
    function DaysPerMonth(AYear, AMonth: Integer): Integer;
    function IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;
    function IncDay(ADate: TDateTime; Delta: Integer): TDateTime;
    function IncMonth(ADate: TDateTime; Delta: Integer): TDateTime;
    function IncYear(ADate: TDateTime; Delta: Integer): TDateTime;
    function IncTime(ATime: TDateTime; Hours, Minutes, Seconds, MSecs: Integer): TDateTime;
    function IncHour(ATime: TDateTime; Delta: Integer): TDateTime;
    function IncMinute(ATime: TDateTime; Delta: Integer): TDateTime;
    function Char_Left(S: string; Tam: Byte; Ch: Char): string;
    function Char_Right(S: string; Tam: Byte; Ch: Char): string;
    Function VersaoExe: String;
    procedure ExibeAguarde(mensagem:string);
    procedure EscondeAguarde;
    procedure GeraPlanilha(Query: tClientDataset; grid:TDbGrid);
    procedure Exportar_para_CSV(dtS: TDataSource);
    function SetRichEditAdvOption(Editor: TRichEdit): Boolean;
    procedure JustifyRichEdit(RichEdit :TRichEdit; AllText :Boolean);
    function buscaCEP(lcCEP: string): TStringList;
    function RetiraSimbolos(SourceStr: string): string;
    function RemoveAcento(Str: string): string;
    Function gerarPDF(report: TQuickrep; caminho, nomearq:String):integer;
    Function gerarPDFNovo(report: TQuickrep; caminho, nomearq:String):integer;
    Function EnviarEmail(destino,assunto,mensagem, caminhoarqs:string):integer;
    Function EnviarEmailsemAnexo(destino,assunto,mensagem:string):integer;
    function ArquivosDIr(pasta:string; anexar:integer=0; docanexar:integer=0):string;
    function RICH_HTML(RICH: TRichEdit): string;
    function trocaImpressoraPadrao(pNomeNovaImpressora: string):boolean;
    function ExtractName(const Filename: string): string;
    procedure CopyDataSet(Source, Dest: TDataSet; Key: string);
    procedure SubstituirTexto(richedit1:TRichEdit; textovelho, textonovo:string); overload;
    procedure SubstituirTexto(richedit1:TRichEdit; textovelho: string; textonovo:string; negrito :Integer; sublinhado:Integer; italico:Integer); overload;
    function MaskCEP(CEP: string): string;
    function GeraPDF(Qr: TQuickrep; local:String): integer; overload;
    function GeraPDF(Qr: TQuickrep; local:String; nomearquivo:string): integer; overload;
    function GeraPDF(Qr: TQuickrep; local:String; abrir:integer): integer; overload;
    function GeraPDF2(Qr: TQuickrep; local:String; abrir:integer): string;
    function valorPorExtenso(vlr: real): string;
    function Retorna_Anos(ds:TDataSource; campo:string): string;
    procedure Negrito(RichEdit1 : TRichEdit; palavra:string);
    procedure FormataTexto(RichEdit1 : TRichEdit; palavra:string; negrito:Integer;italico:integer; sublinhado:integer);
    procedure GridListrado(grid: TdbGrid;const Rect: TRect; DataCol: Integer; Column: TColumn;    State: TGridDrawState);


const
{$IFDEF WIN32}
  DataNula: TDateTime = {-693594} 0;
  {$ELSE}
  DataNula: TDateTime = null;
  {$ENDIF}

implementation

uses UDMAssociado, UDMConexao;
var
FFixedInfo: PVSFixedFileInfo;
FormAguarde:TForm;
const
  SPC = ' ';


procedure Aviso(Msg: String);
begin
  Application.MessageBox(Pchar(Msg),'Aviso',MB_ICONINFORMATION);
end;

function ExtractName(const Filename: string): string;
var
  aExt: string;
  aPos: Integer;
begin
  aExt := ExtractFileExt(Filename);
  Result := ExtractFileName(Filename);
  if aExt <> '' then
  begin
    aPos := Pos(aExt, Result);
    if aPos > 0 then
    begin
      Delete(Result, aPos, Length(aExt));
    end;
  end;

end;


procedure Erro(Msg: String);
begin
  Application.MessageBox (PChar(Msg), 'Erro', MB_OK + mb_iconerror);
end;

function Confirma(Msg: String): Boolean;
var
  sTitle: string;
  Flags: LongInt;
begin
  sTitle := 'Confirma��o';
  fLAGS := MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO;
  Result := Application.MessageBox(Pchar(Msg), Pchar(sTitle), Flags) = idYes
end;

Function MaskCPFCGC(NumeroCPFCGC : STring) : String;
Begin
  if Length (NumeroCPFCGC) = 14 then
    Result := FormatMaskText('99.999.999/9999-99;0;', NumeroCPFCGC)
  else
  if Length (NumeroCPFCGC) = 11 then
    Result := FormatMaskText('999.999.999-99;0;', NumeroCPFCGC)
  else
    Result := NumeroCPFCGC;
end;

Function ValidaCPFCNPJ(NumeroCPFCGC : STring) : boolean;
Begin
  if Length (NumeroCPFCGC) = 14 then
    Result := VDigitoCGC(NumeroCPFCGC) = Copy(NumeroCPFCGC, Length(NumeroCPFCGC) - 1, 2)
  else
  if Length (NumeroCPFCGC) = 11 then
    Result :=  VDigitoCPF(NumeroCPFCGC) = Copy(NumeroCPFCGC, Length(NumeroCPFCGC) - 1, 2);
end;

Function UltimoDia (aDate : TDateTime) : TDateTime;
Var
  Year, Month, Day : word;
begin
  DecodeDate(aDate, Year, Month, Day);
  Day := DaysPerMonth(Year, Month);
  Result := EncodeDate(Year, Month, Day);
end;
function VDigitoCGC(CGC: String): String;

const
    Fator1: array[1..12] of Byte = (5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
    Fator2: array[1..12] of Byte = (6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3);
var
    D1, D2: LongInt;
    I: Byte;
begin
    if trim(CGC)=NULL then
    begin
        Result := '  ';
        Exit;
    end;

    D1 := 0;
    D2 := 0;
    for i := 1 to 12 do
    begin
        D1 := D1 + ((Byte(CGC[i]) - Byte('0')) * Fator1[i]);
        D2 := D2 + ((Byte(CGC[i]) - Byte('0')) * Fator2[i]);
    end;

    { Primeiro Digito }
    D1 := D1 mod 11;

    if D1 <= 1 then
        D1 := 0
    else
        D1 := 11 - D1;

    { Segundo Digito }
    D2 := D2 + (D1 * 2);
    D2 := D2 mod 11;
    if D2 <= 1 then
        D2 := 0
    else
        D2 := 11 - D2;
    Result := Char(Byte('0') + D1) + Char(Byte('0') + D2);
end;

function VDigitoCPF;
var
    I: Byte;
    D1: LongInt;
    D2: LongInt;
begin
    if trim(CPF)=NULL then
    begin
        VDigitoCPF := '  ';
        Exit;
    end;

    D1 := 0;
    D2 := 0;
    for i := 1 to 9 do
    begin
        D1 := D1 + ((Byte(CPF[i]) - Byte('0')) * (11 - i));
        D2 := D2 + ((Byte(CPF[i]) - Byte('0')) * (12 - i));
    end;

    D1 := D1 mod 11;
    if D1 <= 1 then
        D1 := 0
    else
        D1 := 11 - D1;

    D2 := D2 + (2 * D1);
    D2 := D2 mod 11;
    if D2 <= 1 then
        D2 := 0
    else
        D2 := 11 - D2;
    Result := Char(Byte('0') + D1) + Char(Byte('0') + D2);
end;


function ExtractDay(ADate: TDateTime): Word;
var
  M, Y: Word;
begin
  DecodeDate(ADate, Y, M, Result);
end;

function ExtractMonth(ADate: TDateTime): Word;
var
  D, Y: Word;
begin
  DecodeDate(ADate, Y, Result, D);
end;

function ExtractYear(ADate: TDateTime): Word;
var
  D, M: Word;
begin
  DecodeDate(ADate, Result, M, D);
end;

function DaysPerMonth(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array [1..12] of Integer =
  (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and IsLeapYear(AYear) then
    Inc(Result); { leap-year Feb is special }
end;

function IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;
var
  D, M, Y: Word;
  Day, Month, Year: Longint;
begin
  DecodeDate(ADate, Y, M, D);
  Year := Y;
  Month := M;
  Day := D;
  Inc(Year, Years);
  Inc(Year, Months div 12);
  Inc(Month, Months mod 12);
  if Month < 1 then
  begin
    Inc(Month, 12);
    Dec(Year);
  end
  else
  if Month > 12 then
  begin
    Dec(Month, 12);
    Inc(Year);
  end;
  if Day > DaysPerMonth(Year, Month) then
    Day := DaysPerMonth(Year, Month);
  Result := EncodeDate(Year, Month, Day) + Days + Frac(ADate);
end;

function IncDay(ADate: TDateTime; Delta: Integer): TDateTime;
begin
  Result := ADate + Delta;
end;

function IncMonth(ADate: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncDate(ADate, 0, Delta, 0);
end;

function IncYear(ADate: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncDate(ADate, 0, 0, Delta);
end;        

function IncHour(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, Delta, 0, 0, 0);
end;

function IncMinute(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, 0, Delta, 0, 0);
end;

function IncSecond(ATime: TDateTime; Delta: Integer): TDateTime;
begin
  Result := IncTime(ATime, 0, 0, Delta, 0);
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
  MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then
    Result := Result + 1;
end;


function Char_Left;
var
  S1: string;
  i: Integer;
begin
  S := Trim(S);
  S1 := '';
  for i := 1 to Tam - Length(S) do
    S1 := S1 + Ch;
  S := S1 + S;
  Result := S;
end;

function Char_Right;

var
  S1: string;
  i: Integer;
begin
  S := Trim(S);
  S1 := '';
  for i := 1 to Tam - Length(S) do
    S1 := S1 + Ch;
  S := S + S1;
  Result := S;
end;

function VersaoExe: String;
type
PFFI = ^vs_FixedFileInfo;
var
F : PFFI;
Handle : Dword;
Len : Longint;
Data : Pchar;
Buffer : Pointer;
Tamanho : Dword;
Parquivo: Pchar;
Arquivo : String;
begin
Arquivo := Application.ExeName;
Parquivo := StrAlloc(Length(Arquivo) + 1);
StrPcopy(Parquivo, Arquivo);
Len := GetFileVersionInfoSize(Parquivo, Handle);
Result := '';
if Len > 0 then
begin
Data:=StrAlloc(Len+1);
if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
begin
VerQueryValue(Data, '\',Buffer,Tamanho);
F := PFFI(Buffer);
Result := Format('%d.%d.%d.%d',
[HiWord(F^.dwFileVersionMs),
LoWord(F^.dwFileVersionMs),
HiWord(F^.dwFileVersionLs),
Loword(F^.dwFileVersionLs)]
);
end;
StrDispose(Data);
end;
StrDispose(Parquivo);
end;

procedure ExibeAguarde(mensagem: string);
var
  MSG: Tlabel;
  Borda: TShape;
begin

  FormAguarde:=  TForm.Create(Application);
  FormAguarde.BorderStyle:= bsNone;
  FormAguarde.Position:= poDesktopCenter;
  FormAguarde.AutoSize:=TRUE;
  FormAguarde.Height:= 30;

  Borda:= TShape.Create(Application);
  Borda.Parent:= FormAguarde;
  Borda.Align:= alClient;
  Borda.PEn.Color := clWhite;

  MSG:=  TLabel.Create(Application);
  MSG.Font.Size:=18;
  MSG.Font.Color := clNavy;
  MSG.Font.Style := [fsBold];
  MSG.Parent:=FormAguarde;
  MSG.Transparent:= true;
  MSG.AutoSize:= TRUE;
  Msg.Caption:=mensagem;//'Gerando listagem, aguarde...';

  FormAguarde.Show;
  FormAguarde.Update;

end;

procedure EscondeAguarde;
begin
  FormAguarde.Free;
end;


procedure GeraPlanilha(Query: tClientDataset; grid:TDbGrid);
var
  Excel: Variant;
  Linha, i, x: Integer;
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
        x:=0;
        for i:= 0 to Grid.Columns.Count - 1do
        begin
          if (grid.Columns[i].Visible = true) AND (LowerCase(grid.Columns[i].fieldname)<>'selecionado') then
          begin
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,x+1] := grid.Columns[i].Title.Caption;
              x:=x+1;
          end;
        end;
        linha := linha +1;

        while not Query.Eof do
        begin
           x:=0;
           for i:= 0 to Grid.Columns.Count-1 do
           begin
                  if (grid.Columns[i].Visible = true)AND (LowerCase(grid.Columns[i].fieldname)<>'selecionado') then
                  begin
                        If grid.DataSource.DataSet.Fieldbyname(grid.Columns[i].fieldname) is tfmtbcdfield then
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,x+1].numberformat  := 'R$ #.##0,00_);(R$ #.##0,00)';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,x+1] :=grid.Columns.Items[i].Field.asfloat//formatfloat(',0.00',dbgrid.Columns.Items[i-1].Field.Value)
                        end
                        else
                        begin
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,x+1].numberformat :=  '@';
                           Excel.WorkBooks[1].Sheets[1].Cells[Linha,x+1] :=  grid.Columns.Items[i].Field.AsString;
                        end;
                        x:=x+1;
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


function SetRichEditAdvOption(Editor: TRichEdit): Boolean;
const
  WM_USER = $400;
  EM_EXSETSEL = (WM_USER + 55);
  EM_SETTYPOGRAPHYOPTIONS = (WM_USER + 202);
  EM_GETTYPOGRAPHYOPTIONS = (WM_USER + 203);
  TO_ADVANCEDTYPOGRAPHY = $1;
  mZERO = $0;
var
  L: Integer;
begin
  L := SendMessageA(Editor.Handle, EM_SETTYPOGRAPHYOPTIONS, TO_ADVANCEDTYPOGRAPHY, TO_ADVANCEDTYPOGRAPHY);
  Result := L = 1;
end;


procedure JustifyRichEdit(RichEdit :TRichEdit; AllText :Boolean);
const
  TO_ADVANCEDTYPOGRAPHY   = $1;
  EM_SETTYPOGRAPHYOPTIONS = (WM_USER + 202);
  EM_GETTYPOGRAPHYOPTIONS = (WM_USER + 203);
var
  ParaFormat :TParaFormat;
  SelStart,
  SelLength :Integer;
begin
  ParaFormat.cbSize := SizeOf(ParaFormat);
  if SendMessage(RichEdit.handle,
              EM_SETTYPOGRAPHYOPTIONS,
              TO_ADVANCEDTYPOGRAPHY,
              TO_ADVANCEDTYPOGRAPHY) = 1 then
  begin
    SelStart := RichEdit.SelStart;
    SelLength := RichEdit.SelLength;
    if AllText then
      RichEdit.SelectAll;
    ParaFormat.dwMask := PFM_ALIGNMENT;
    ParaFormat.wAlignment := PFA_JUSTIFY;
    SendMessage(RichEdit.handle, EM_SETPARAFORMAT, 0, LongInt(@ParaFormat));
// Restaura sele��o caso tenhamos mudado para All
    RichEdit.SelStart := SelStart;
    RichEdit.SelLength := SelLength;
  end;
end;

function buscaCEP(lcCEP: string): TStringList;
var
loHTTP : TNMHTTP;
loURL : TNMURL;
lnCont : integer;
begin
//try
loHTTP := TNMHTTP.Create(Application);
loURL := TNMURL.Create(Application);
try
loHTTP.Get('http://republicavirtual.com.br/web_cep.php?cep='+lcCEP+'&formato=query_string');
// retorna o conteudo da string e formata-o
loURL.InputString := loHTTP.Body;
// usa o separador de quebra de linha
result := TStringList.Create;
result.Text := UpperCase(StringReplace(loURL.Decode, '&', #13#10, [rfreplaceAll]));
for lnCont := result.Count - 1 downto 0 do
if trim(result[lnCont]) = '' then
result.Delete(lncont);
finally
loHTTP.Free;
loURL.Free;
end;
//except
//result := nil;
//end;
end;


function RemoveAcento(Str: string): string;

const
  ComAcento = '����������������������������';

  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';

var

   x: Integer;

begin;

  for x := 1 to Length(Str) do

  if Pos(Str[x],ComAcento) <> 0 then

    Str[x] := SemAcento[Pos(Str[x], ComAcento)];

  Result := Str;
end;

Function gerarPDF(report: TQuickrep; caminho, nomearq:String):integer;
var
  sImagePDFFileName,
   oPath, ScriptBaseName: String;
  //start: Extended;
  c: Integer;
  FPDFCreator:OleVariant;

  printJobCount:integer;
  indexpr:integer;
  impressoraPadraoAntiga: string;

begin
  try
  try
 // start := Now();

  oPath := IncludeTrailingPathDelimiter(caminho);

  FPDFCreator := CreateoleObject('PDFCreator.clsPDFCreator');

  FPDFCreator.cStart('/NoProcessingAtStartup', TRUE);
  FPDFCreator.cOption['Autosave'] := 1;
  FPDFCreator.cOption['UseAutosave'] := 1;
  FPDFCreator.cOption['UseAutosaveDirectory'] := 1;
  FPDFCreator.cOption['AutosaveDirectory'] := opath;
  FPDFCreator.cOption['RunProgramAfterSaving'] := 0;
  FPDFCreator.cOption['AutosaveFormat'] := 0;
  indexpr := Printer.PrinterIndex;
  impressoraPadraoAntiga:= Printer.Printers[Printer.PrinterIndex];
  Printer.PrinterIndex :=  Printer.Printers.IndexOf('CADCONTROLPDF');

  ScriptBaseName :=nomearq;
  FPDFCreator.cDefaultprinter := 'CADCONTROLPDF';
  FPDFCreator.cClearcache;
  FPDFCreator.cOption['AutosaveFilename'] := ScriptBaseName; //'<REDMON_DOCNAME>';

    FPDFCreator.cPrinterStop := True;
  printJobCount := FPDFCreator.cCountOfPrintJobs;
  report.ShowProgress:=false;
  report.Print;
  FPDFCreator.cPrinterStop := false;
  result := 1;

  repeat
     sleep(100);
     printJobCount := FPDFCreator.cCountOfPrintJobs;
  until printJobCount >0;



  except
    result :=0;
  end;


  finally
   Printer.PrinterIndex := indexpr;
   trocaImpressoraPadrao(impressoraPadraoAntiga);
  end;
end;
Function EnviarEmail(destino,assunto,mensagem, caminhoarqs:string):integer;
var
    olObjeto: OleVariant;
begin

    olObjeto := CreateOleObject('Mailer.Mail');

    olObjeto.SmtpHost :='smtp.sircomrj.com.br';
    olObjeto.port := 587;
    olObjeto.from := 'sistema@sircomrj.com.br';
    olObjeto.username := 'sistema@sircomrj.com.br';
    olObjeto.password := 'sind2710';
    olObjeto.subject := assunto;
    if caminhoarqs='' then
       olObjeto.attachment := null
    else
        olObjeto.attachment :=caminhoarqs;
    olObjeto.to :=destino;
    olObjeto.ReplyTo :='sindicato@sircomrj.com.br';
    olObjeto.text :=mensagem;

    result := olObjeto.Send;

    olObjeto := null;
end;

Function EnviarEmailsemAnexo(destino,assunto,mensagem:string):integer;
var
    olObjeto: OleVariant;
begin

    olObjeto := CreateOleObject('Mailer.Mail');

    olObjeto.SmtpHost :='smtp.sircomrj.com.br';
    olObjeto.port := 587;
    olObjeto.from := 'sistema@sircomrj.com.br';
    olObjeto.username := 'sistema@sircomrj.com.br';
    olObjeto.password := 'sind2710';
    olObjeto.subject := assunto;
    olObjeto.to :=destino;
    olObjeto.ReplyTo :='sindicato@sircomrj.com.br';
    olObjeto.text :=mensagem;

    result := olObjeto.SendSemAnexo;

    olObjeto := null;
end;


function ArquivosDIr(pasta:string; anexar:integer=0; docanexar:integer=0):string;

var

  REC: TSearchRec;

  //Ret: Integer;

  TempNome: string;

  arquivos:string;

begin

  arquivos:='';

 if SysUtils.FindFirst(pasta + '\*.pdf', faDirectory, Rec) = 0 then
 begin
      repeat
         if arquivos ='' then
            arquivos:= pasta+'\'+rec.Name
         else
           arquivos:= arquivos+';'+ pasta+'\'+rec.Name;


      if anexar = 1 then
      begin
          DMAssociado.cdsAnexo.Close;
          DMAssociado.cdsAnexo.Params[0].clear;
          DMAssociado.cdsAnexo.Open;
          DMAssociado.cdsAnexo.Append;
          DMAssociado.cdsAnexo.Edit;
          DMAssociado.cdsAnexoIMAGEM.LoadFromFile(pasta+'\'+rec.Name);
          DMAssociado.cdsAnexoNOMEARQUIVO.value := ExtractFilename(pasta+'\'+rec.Name);
          DMAssociado.cdsAnexoDESCRICAO.value := copy(ExtractFilename(pasta+'\'+rec.Name),1,length(rec.Name)-4);

          DMAssociado.PROC_FOTO_UI.close;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value;
          DMAssociado.PROC_FOTO_UI.Params[1].Assign(DMAssociado.cdsAnexoIMAGEM);
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('DATA_INCLUSAO').value :=  DataAtual;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value := DMAssociado.cdsAnexoIMG_ID.value;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('TIPO').value:=2;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('DESCRICAO').value:=DMAssociado.cdsAnexoDESCRICAO.value;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('NOMEARQUIVO').value:=DMAssociado.cdsAnexoNOMEARQUIVO.value;
          DMAssociado.PROC_FOTO_UI.ExecProc;
          DMConexao.Log('Inclus�o de PDF de Extrato pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' - Anexo:'+ DMAssociado.cdsAnexoNOMEARQUIVO.value +'('+datetostr(DMAssociado.cdsAnexoDATA_INCLUSAO.value)+')' , 'I', DMAssociado.cdsAssocASS_ID.value);
          DMAssociado.cdsLocAnexos.close;
          DMAssociado.cdsLocAnexos.Open;
      end;

      until SysUtils.FindNext(Rec) <> 0;

      if (arquivos <>'') and (docanexar = 1) then
         arquivos := arquivos+';'+ ExtractFilePath(Application.ExeName)+ '\CEF_ CONTRIBUICAO_SINDICAL_URBANA.pdf';

 end ;

 FindClose(Rec);

  result :=arquivos;
end;


function RICH_HTML(RICH: TRichEdit): string;
var
  I,J,MAX_ARRAY: integer;
  HTML: string;
  F,FO: array [0..5] of string;
  STR,LGT: integer;
  SIZE: integer;
  COR : string;
begin
  HTML := '';
  STR := RICH.SelStart;
  LGT := RICH.SelLength;
  MAX_ARRAY := 5;

  for J := 0 to MAX_ARRAY do
  begin
    F[J] := '';
    FO[J] := '';
  end;

  for I := 0 to length(RICH.text) do
  begin
    RICH.SelStart := I;
    RICH.SelLength := 1;

    for J := 0 to MAX_ARRAY do
      FO[J] := F[J];

    if (RICH.SelAttributes.Style - [fsItalic] - [fsUnderline] - [fsStrikeOut] = [fsBold]) then
      F[0] := '<b>'
    else
      F[0] := '</b>';

    if (RICH.SelAttributes.Style - [fsItalic] - [fsBold] - [fsStrikeOut] = [fsUnderline]) then
      F[1] := '<u>'
    else
      F[1] := '</u>';

    if (RICH.SelAttributes.Style - [fsUnderline] - [fsBold] - [fsStrikeOut] = [fsItalic]) then
      F[2] := '<i>'
    else
      F[2] := '</i>';

    if RICH.SelAttributes.size < 10 then
      SIZE := 1
    else if RICH.SelAttributes.size < 12 then
      SIZE := 2
    else if RICH.SelAttributes.size < 14 then
      SIZE := 3
    else if RICH.SelAttributes.size < 18 then
      SIZE := 4
    else if RICH.SelAttributes.size < 22 then
      SIZE := 5
    else if RICH.SelAttributes.size < 32 then
      SIZE := 6
    else
      SIZE := 7;
    COR := ColorToString(RICH.SelAttributes.Color);
    if (COR = 'clWindowText') or (COR = 'clBlack') then
      COR := '#000000'
    else if COR = 'clWite' then
      COR := '#FFFFFF'
    else if COR = 'clAqua' then
      COR := '#00FFFF'
    else if COR = 'clFuchsia' then
      COR := '#FF00FF'
    else if COR = 'clBlue' then
      COR := '#0000FF'
    else if COR = 'clYellow' then
      COR := '#FFFF00'
    else if COR = 'clLime' then
      COR := '#00FF00'
    else if COR = 'clRed' then
      COR := '#FF0000'
    else if COR = 'clSilver' then
      COR := '#C0C0C0'
    else if COR = 'clGray' then
      COR := '#808080'
    else if COR = 'clTeal' then
      COR := '#008080'
    else if COR = 'clPurple' then
      COR := '#800080'
    else if COR = 'clNavy' then
      COR := '#000080'
    else if COR = 'clOlive' then
      COR := '#808000'
    else if COR = 'clGreen' then
      COR := '#008000'
    else if COR = 'clMaroon' then
      COR := '#800000'
    else if copy(COR,1,1) = '$' then
      COR := '#'+copy(COR,length(COR)-1,2)
                +copy(COR,length(COR)-3,2)
                +copy(COR,length(COR)-5,2)
    else
      COR := '#000000';
    F[3] := '</font><font face="'+RICH.SelAttributes.Name+'" size='+inttostr(SIZE)+' color="'+COR+'">';

    if RICH.Paragraph.Alignment = taCenter then
      F[4] := '<center>'
    else
      F[4] := '</center>';

    if RICH.Paragraph.Alignment = taRightJustify then
      F[5] := '<div align="right">'
    else
      F[5] := '</div>';

    for J := 0 to MAX_ARRAY do
      if FO[J] <> F[J] then
        HTML := HTML + F[J];

    if copy(RICH.text,I+1,1) = #13 then
      HTML := HTML + '<br>';

    HTML := HTML + copy(RICH.text,I+1,1);
  end;
  RICH.SelStart := STR;
  RICH.SelLength := LGT;

  result := HTML;
end;

function trocaImpressoraPadrao(pNomeNovaImpressora: string):boolean;
var
  W2KSDP: function(pszPrinter: PChar): Boolean; stdcall;
  H: THandle;
  Size, Dummy: Cardinal;
  PI: PPrinterInfo2;
begin     
  Result:= False;
  try
    if pNomeNovaImpressora <> '' then
    begin
      if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
      begin
        @W2KSDP := GetProcAddress(GetModuleHandle(winspl), 'SetDefaultPrinterA');

        if (@W2KSDP <> nil)and(W2KSDP(PChar(pNomeNovaImpressora))) then
          Result:= true
        else
          RaiseLastOSError;
      end
      else
      begin
        if OpenPrinter(PChar(pNomeNovaImpressora), H, nil) then
        try
          Winspool.GetPrinter(H, 2, nil, 0, @Size);

          if GetLastError <> ERROR_INSUFFICIENT_BUFFER then
            RaiseLastOSError;

          GetMem(PI, Size) ;
          try
            if Winspool.GetPrinter(H, 2, PI, Size, @Dummy) then
            begin
              PI^.Attributes := PI^.Attributes or PRINTER_ATTRIBUTE_DEFAULT;
              if Winspool.SetPrinter(H, 2, PI, PRINTER_CONTROL_SET_STATUS) then
                Result:= True
              else
                RaiseLastOSError;
            end
            else
              RaiseLastOSError;
          finally
            FreeMem(PI) ;
          end;
        finally
          ClosePrinter(H) ;
        end
        else
          RaiseLastOSError;
      end;
    end;
  except
    raise;
  end;
end;

procedure CopyDataSet(Source, Dest: TDataSet; Key: string);
var
    i: Integer;
    BMD, BMS: TBookmark;
begin
    //  BMS := Source.GetBookmark;
    Source.DisableControls;
    try
        //    BMD := Dest.GetBookmark;
        Dest.DisableControls;
        try
            Source.First;
            while not Source.Eof do
            begin
                if (not Assigned(Source.FindField(KEY))) or
                    (Source.FieldByName(KEY).IsNull) or
                    (not Dest.Locate(key, Source.FieldByName(KEY).Value, [])) then
                    Dest.Append
                else
                    Dest.Edit;
                for i := 0 to Source.Fields.Count - 1 do
                begin
                    if (Assigned(Dest.FindField(Source.Fields[i].FieldName))) and (not Source.Fields[i].IsNull) then
                        Dest.FieldByName(Source.Fields[i].FieldName).Value := Source.Fields[i].Value;
                end;
                Dest.Post;
                Source.Next;
            end;
        finally
            //      Dest.GotoBookmark(BMD);
            Dest.EnableControls;
        end;
    finally
        //    Source.GotoBookmark(BMS);
        Source.EnableControls;
    end;
end;
procedure SubstituirTexto(richedit1:TRichEdit; textovelho, textonovo:string);
var
        ver: String;
        i, ii, cont, ini, fim: Integer;
        FoundAt:Longint;
        de, para: String;
begin
        cont:=0;
        de:= textovelho;
        para:= textonovo;
        For i:= 0 To richedit1.Lines.Count -1 Do
        Begin
                For ii:=1 To Length(richedit1.Lines.Strings[i]) Do
                Begin
                        ver:= Copy(richedit1.Lines.Strings[i], ii, Length(de));
                        If ver = de Then
                        Begin
                                ver:= Copy(richedit1.Lines.Strings[i], 1, ii-1) + para +
                                Copy(richedit1.Lines.Strings[i], ii + Length(de), Length(richedit1.Lines.Strings[i]));
                                richedit1.Lines.Strings[i] := ver;

                              {
                                richedit1.FindText(para, ini, fim, []);
                                richedit1.SelStart := ini;
                                richedit1.SelLength := fim;

                                //richedit1.SelStart := Pos(para, richedit1.Lines.Strings[i]);
                                //richedit1.SelLength := Length (para);
                                richedit1.SelAttributes.Style := [fsBold];
                                richedit1.SelAttributes.Size :=16;
                                }
                               // Negrito (richedit1,para);
                                Inc(cont);
                        End;
                End;
        End;
end;

function MaskCEP(CEP: string): string;
begin
    result := copy(CEP, 1, 2) + '.' + copy(CEP, 3, 3) + '-' + copy(CEP, 6, 3);

end;

function GeraPDF(Qr: TQuickrep; local:String;nomearquivo:string): integer;
var
    comando: string;
    continua, i: integer;
    SearchRec : TSearchRec;

begin

    try
        qr.Prepare;
        qr.QRPrinter.save(StringReplace(local+'\'+nomearquivo, '.pdf', '.qrp', [rfReplaceall]));

        comando := '"' +ExtractFilePath(Application.ExeName) + 'Gerador_PDF.exe" "' + StringReplace(local +'\'+nomearquivo, '.pdf', '.qrp"', [rfReplaceall]);


        WinExec(PChar(comando), SW_hide);
        continua := 1;
        repeat
           if FileExists(StringReplace(local+'\'+nomearquivo, '.qrp', '.pdf', [rfReplaceall]) ) then
           begin
                while FileExists(StringReplace(local+'\'+nomearquivo, '.pdf', '.qrp', [rfReplaceall]) ) do
                    DeleteFile(pchar(StringReplace(local+'\'+nomearquivo, '.pdf', '.qrp', [rfReplaceall])));
                continua := 0;
           end;
         until continua = 0;


        comando :=  'xcopy "' + local+'\'+nomearquivo+'"  "' + dmconexao.sdsConfigCAMINHONOTIFIC.value +'" /y/c/r/a';
         WinExec(PChar(comando), SW_HIDE);
        // ShellExecute(0, 'open', PChar(comando), '', '', SW_SHOWNORMAL);

         DMAssociado.PROC_NOTIFIC_I.close;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 4;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  nomearquivo;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
         DMAssociado.PROC_NOTIFIC_I.ExecProc;


         result := 1;

    except
        result := 0;
    end;

end;

function GeraPDF(Qr: TQuickrep; local:String): integer;
var
    numarquivo,comando: string;
    continua, i: integer;
    SearchRec : TSearchRec;

begin

    try
        numarquivo :=  Qr.ReportTitle +'_' + FormatDateTime('yyyymmdd_hhnnsszzz',now())+'.pdf';

        qr.Prepare;
        qr.QRPrinter.save(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]));

        comando := '"' +ExtractFilePath(Application.ExeName) + 'Gerador_PDF.exe" "' + StringReplace(local +'\'+numarquivo, '.pdf', '.qrp"', [rfReplaceall]);

        WinExec(PChar(comando), SW_hide);

        continua := 1;
        repeat
           if FileExists(StringReplace(local+'\'+numarquivo, '.qrp', '.pdf', [rfReplaceall]) ) then
           begin
                while FileExists(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]) ) do
                    DeleteFile(pchar(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall])));
                continua := 0;
           end;
         until continua = 0;

         DMAssociado.PROC_NOTIFIC_I.close;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 4;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  numarquivo;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
         DMAssociado.PROC_NOTIFIC_I.ExecProc;


         result := 1;

    except
        result := 0;
    end;

end;

function GeraPDF(Qr: TQuickrep; local:String; abrir:integer): integer; overload;
var
    numarquivo,comando: string;
    continua, i: integer;
    SearchRec : TSearchRec;

begin

    try
        numarquivo :=  Qr.ReportTitle +'_' + FormatDateTime('yyyymmdd_hhnnsszzz',now())+'.pdf';

        qr.Prepare;
        qr.QRPrinter.save(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]));

        comando := '"' +ExtractFilePath(Application.ExeName) + 'Gerador_PDF.exe" "' + StringReplace(local +'\'+numarquivo, '.pdf', '.qrp"', [rfReplaceall]);

        WinExec(PChar(comando), SW_hide);

        continua := 1;
        repeat
           if FileExists(StringReplace(local+'\'+numarquivo, '.qrp', '.pdf', [rfReplaceall]) ) then
           begin
                while FileExists(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]) ) do
                    DeleteFile(pchar(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall])));
                continua := 0;
           end;
         until continua = 0;
         result := 1;

         ShellExecute(0, 'open', PChar(local+'\'+numarquivo), '', '', SW_SHOWNORMAL);

    except
        result := 0;
    end;

end;

 function valorPorExtenso(vlr: real): string;
const
  unidade: array[1..19] of string = ('um', 'dois', 'tr�s', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
             'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
             'dezessete', 'dezoito', 'dezenove');
  centena: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
             'quatrocentos', 'quinhentos', 'seiscentos',
             'setecentos', 'oitocentos', 'novecentos');
  dezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array[0..4] of string = ('', 'mil', 'milh�o', 'bilh�o', 'trilh�o');
  qualificaP: array[0..4] of string = ('', 'mil', 'milh�es', 'bilh�es', 'trilh�es');
var
                        inteiro: Int64;
                          resto: real;
  vlrS, s, saux, vlrP, centavos: string;
     n, unid, dez, cent, tam, i: integer;
                    umReal, tem: boolean;
begin
  if (vlr = 0)
     then begin
            valorPorExtenso := 'zero';
            exit;
          end;

  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracion�ria do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
     then begin
            valorPorExtenso := 'Erro: valor superior a 999 trilh�es.';
            exit;
          end;

  s := '';
  centavos := inttostr(round(resto * 100));

// definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milh�es)
    if (tam > 3)
       then begin
              vlrP := copy(vlrS, tam-2, tam);
              vlrS := copy(vlrS, 1, tam-3);
            end
    else begin // �ltima parte do valor
           vlrP := vlrS;
           vlrS := '0';
         end;
    if (vlrP <> '000')
       then begin
              saux := '';
              if (vlrP = '100')
                 then saux := 'cem'
              else begin
                     n := strtoint(vlrP);        // para n = 371, tem-se:
                     cent := n div 100;          // cent = 3 (centena trezentos)
                     dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
                     unid := (n mod 100) mod 10; // unid = 1 (unidade um)
                     if (cent <> 0)
                        then saux := centena[cent];
                     if ((dez <> 0) or (unid <> 0))
                        then begin
                               if ((n mod 100) <= 19)
                                  then begin
                                         if (length(saux) <> 0)
                                            then saux := saux + ' e ' + unidade[n mod 100]
                                         else saux := unidade[n mod 100];
                                       end
                               else begin
                                      if (length(saux) <> 0)
                                         then saux := saux + ' e ' + dezena[dez]
                                      else saux := dezena[dez];
                                      if (unid <> 0)
                                         then if (length(saux) <> 0)
                                                 then saux := saux + ' e ' + unidade[unid]
                                              else saux := unidade[unid];
                                    end;
                             end;
                   end;
              if ((vlrP = '1') or (vlrP = '001'))
                 then begin
                        if (i = 0) // 1a. parte do valor (um real)
                           then umReal := true
                        else saux := saux + ' ' + qualificaS[i];
                      end
              else if (i <> 0)
                      then saux := saux + ' ' + qualificaP[i];
              if (length(s) <> 0)
                 then s := saux + ', ' + s
              else s := saux;
            end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0))
       then tem := true; // tem centena ou mil no valor
    i := i + 1; // pr�ximo qualificador: 1- mil, 2- milh�o, 3- bilh�o, ...
  end;

  if (length(s) <> 0)
     then begin
            if (umReal)
               then s := s + ' real'
            else if (tem)
                    then s := s + ' reais'
                 else s := s + ' de reais';
          end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
     then begin
            if (length(s) <> 0) // se n�o � valor somente com centavos
               then s := s + ' e ';
            if (centavos = '1')
               then s := s + 'um centavo'
            else begin
                   n := strtoint(centavos);
                   if (n <= 19)
                      then s := s + unidade[n]
                   else begin                 // para n = 37, tem-se:
                          unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
                          dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
                          s := s + dezena[dez];
                          if (unid <> 0)
                             then s := s + ' e ' + unidade[unid];
                       end;
                   s := s + ' centavos';
                 end;
          end;
//  valorPorExtenso := s;
  Result := s;
end;

function Retorna_Anos(ds:TDataSource; campo:string): string;
var
    anuidades:string;
begin
   anuidades := '';
   try
     TClientDataSet(ds.DataSet).IndexFieldNames := campo;
   except
       //
   end;

   ds.dataset.first;
   while not ds.DataSet.Eof do
   begin
       if Pos(anuidades,ds.DataSet.fieldbyname(campo).value) = 0 then
       begin
           if anuidades <>'' then
              anuidades := anuidades +', ';

           anuidades := anuidades + ds.DataSet.fieldbyname(campo).AsString;
       end;
       ds.DataSet.Next;
   end;

   if Length(anuidades)>5 then
      anuidades := Copy(anuidades,1, length(anuidades)-6) + ' e ' + Copy(anuidades,length(anuidades)-3,4);
   Result := Anuidades;
end;

procedure SubstituirTexto(richedit1:TRichEdit; textovelho: string; textonovo:string; negrito :Integer; sublinhado:Integer; italico:Integer); overload;
var
        ver: String;
        i, ii, cont: Integer;
        de, para: String;
        aux:Integer;
begin
   {     cont:=0;
        de:= textovelho;
        para:= textonovo;
        For i:= 0 To richedit1.Lines.Count -1 Do
        Begin
                For ii:=1 To Length(richedit1.Lines.Strings[i]) Do
                Begin
                        ver:= Copy(richedit1.Lines.Strings[i], ii, Length(de));
                        If ver = de Then
                        Begin
                                aux :=  length(textonovo);
                                ver:= Copy(richedit1.Lines.Strings[i], 1, ii-1) + para +
                                Copy(richedit1.Lines.Strings[i], ii + Length(de), Length(richedit1.Lines.Strings[i]));
                                richedit1.Lines.Strings[i] := ver;
                                Inc(cont);

                                If (negrito = 1) or (sublinhado = 1) or (italico = 1) then
                                begin
                                        RichEdit1.SelStart := ii;
                                        RichEdit1.SelLength := aux;
                                        if (negrito = 1) then
                                           RichEdit1.SelAttributes.Style := [fsBold];
                                End;
                        end;
                End;
        End;
        }
end;

procedure Negrito(RichEdit1 : TRichEdit; palavra:string);
var
  FoundAt : LongInt;
  StartPos, ToEnd : integer;
  str : string;
  st : TFontStyles;
begin

    RichEdit1.SelStart := 0;
    RichEdit1.SelLength := 0;
    repeat
      StartPos := RichEdit1.SelStart + RichEdit1.SelLength;
      ToEnd := Length(RichEdit1.Text) - StartPos;
      FoundAt := RichEdit1.FindText(palavra, StartPos, ToEnd, []);
      if FoundAt < 0 then Break;
      begin
        RichEdit1.SelStart := FoundAt;
        RichEdit1.SelLength := Length(palavra);
      end;

      if RichEdit1.SelAttributes.Style = [fsBold,fsUnderline] then
         //
      else
      if RichEdit1.SelAttributes.Style = [fsunderline] then
         RichEdit1.SelAttributes.Style := [fsunderline] + [fsBold]
      else
         RichEdit1.SelAttributes.Style := [fsBold];

    until False;
end;

procedure FormataTexto(RichEdit1 : TRichEdit; palavra:string; negrito:Integer;italico:integer; sublinhado:integer);
var
  FoundAt : LongInt;
  StartPos, ToEnd : integer;
  str : string;
  st : TFontStyles;
begin

    RichEdit1.SelStart := 0;
    RichEdit1.SelLength := 0;
    repeat
      StartPos := RichEdit1.SelStart + RichEdit1.SelLength;
      ToEnd := Length(RichEdit1.Text) - StartPos;
      FoundAt := RichEdit1.FindText(palavra, StartPos, ToEnd, []);
      if FoundAt < 0 then Break;
      begin
        RichEdit1.SelStart := FoundAt;
        RichEdit1.SelLength := Length(palavra);
      end;

     // RichEdit1.SelAttributes.Style :=[];
      if (negrito=1) then
          RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style +[fsBold];

      if (italico=1) then
          RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style +[fsItalic];

      if (sublinhado=1) then
          RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style +[fsUnderline];


    until False;



end;

function GeraPDF2(Qr: TQuickrep; local:String; abrir:integer): string;
var
    numarquivo,comando: string;
    continua, i: integer;
    SearchRec : TSearchRec;

begin

    try
        numarquivo :=  Qr.ReportTitle +'_' + FormatDateTime('yyyymmdd_hhnnsszzz',now())+'.pdf';

        qr.Prepare;
        qr.QRPrinter.save(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]));

        comando := '"'+ExtractFilePath(Application.ExeName) + 'Gerador_PDF.exe" "' + StringReplace(local +'\'+numarquivo, '.pdf', '.qrp"', [rfReplaceall]);

        WinExec(PChar(comando), SW_hide);

        continua := 1;
        repeat
           if FileExists(StringReplace(local+'\'+numarquivo, '.qrp', '.pdf', [rfReplaceall]) ) then
           begin
                while FileExists(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall]) ) do
                    DeleteFile(pchar(StringReplace(local+'\'+numarquivo, '.pdf', '.qrp', [rfReplaceall])));
                continua := 0;
           end;
         until continua = 0;

         if abrir=1 then
            ShellExecute(0, 'open', PChar(local+'\'+numarquivo), '', '', SW_SHOWNORMAL);

         result := StringReplace(local+'\'+numarquivo, '.qrp', '.pdf', [rfReplaceall]);

    except
        result := '';
    end;

end;

procedure GridListrado(grid: TdbGrid;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    if grid.DataSource.dataset.RecNo mod 2 = 1 then
    begin
        grid.Canvas.Brush.color := clwindow;
        grid.Canvas.Font.color := clblack;
        grid.DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
        grid.Canvas.Brush.Color := $00FFEFDF; //clInactiveCaptionText;
        grid.Canvas.Font.color := clblack;
        grid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;

    if gdselected in State then
    begin
        grid.Canvas.Brush.Color := clNavy;
        grid.Canvas.Font.Color := clWhite;
        //grid.Canvas.Font.Style := [fsBold];
        grid.Canvas.FillRect(Rect);
        grid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure Exportar_para_CSV(dtS: TDataSource);
var
    i: Integer;
    F: TextFile;
    Arquivo: string;
    NOSSO: INTEGER;
    Sd:TSaveDialog;
begin
    if dts.dataset.active = false then
        exit;
    if dts.DataSet.RecordCount = 0 then
        exit;
    sd:= TSavedialog.Create(nil);
    sd.FileName := 'Planilha_';
    if sd.execute then
        Arquivo := ChangeFileExt(sd.Filename, '.csv')
    else
        Exit;

    AssignFile(F, Arquivo);
    ReWrite(F);


    dtS.dataset.first;
    dtS.dataset.DisableControls;
    for i := 0 to Pred(dtS.dataset.FieldCount) do
    begin
        if dts.dataset.fields[i].Visible = true then
        begin

            Write(F, dtS.dataset.Fields[i].displaylabel);

            if (i < Pred(dtS.dataset.FieldCount)) then
                Write(F, ';');
        end;
    end;

    WriteLn(F);
    while (not dtS.dataset.Eof) do
    begin

        for i := 0 to Pred(dtS.dataset.FieldCount) do
        begin
            if (UpperCase(dts.dataset.fields[i].FieldName) = 'BOLETO') or (UpperCase(dts.dataset.fields[i].FieldName) = 'NOSSONUMERO')
                or (UpperCase(dts.dataset.fields[i].FieldName) = 'GUIA') or (UpperCase(dts.dataset.fields[i].FieldName) = 'NUMPROCESSO') then
                NOSSO := 1
            else
                NOSSO := 0;

            if dts.dataset.fields[i].Visible = true then
            begin
                if (NOSSO = 1) then
                    Write(F, '''' + dtS.dataset.Fields[i].AsString)
                else
                    Write(F, dtS.dataset.Fields[i].AsString);
                if (i < Pred(dtS.dataset.FieldCount)) then
                    Write(F, ';');
            end;
        end;
        WriteLn(F);
        dtS.dataset.Next;
    end;
    dtS.dataset.first;
    dtS.dataset.EnableControls;

    Flush(F);
    Close(F);

    //Winexec(pchar(arquivo), SW_MAXIMIZE);

    ShellExecute(0, 'open', PChar(arquivo), '', '', SW_SHOWNORMAL);
    aviso('Planilha gerada com sucesso. ');

end;

function RetiraSimbolos(SourceStr: string): string;
begin

    SourceStr := StringReplace(SourceStr, '/', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '&', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, ':', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, ';', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '.', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '-', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '_', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '(', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, ')', '',[rfReplaceall]);
    SourceStr := StringReplace(SourceStr, '*', '',[rfReplaceall]);
    Result := SourceStr;
end;
 Function gerarPDFNovo(report: TQuickrep; caminho, nomearq:String):integer;
 begin

 end;
end.

