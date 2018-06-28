unit uGuias;

interface

uses SysUtils, Classes, ExtCtrls, Graphics, uImp_GRCS,uImp_GRCS_CR, MaskUtils;
type
   TTipo_Entidade = (teSindicato, teFederacao, teConfederacao, teCees);

   {Classe para gerar código de barras para boletos}
   TCodigoBarra = class
   private
      fCodigo: string; {Dados que serão incluídos no código de barras}
      //fCodigo_CR: string; {Dados que serão incluídos no código de barras}
      function GetLinhaDigitavel : string; {Retorna a representação numérica do código de barras}
      function Define2de5 : string; {Define o formato do código de barras INTERCALADO 2 DE 5, retornando a seqüência de 0 e 1 que será usada para gerar a imagem do código de barras}
      function GetImagem    : TImage;
   // function GetLinhaDigitavel_CR: string; {Gera a imagem do código de barras}
   public
      property Codigo    : string  read fCodigo write fCodigo;
     // property Codigo_CR    : string  read fCodigo_CR write fCodigo_CR;
      property LinhaDigitavel : string read GetLinhaDigitavel;
     // property LinhaDigitavel_CR : string read GetLinhaDigitavel_CR;
      property Imagem    : TImage read GetImagem;
   end;

   TCodigoBarra_CR = class
   private
      fCodigo_CR: string; {Dados que serão incluídos no código de barras}
      function Define2de5_cr : string; {Define o formato do código de barras INTERCALADO 2 DE 5, retornando a seqüência de 0 e 1 que será usada para gerar a imagem do código de barras}
      function GetImagemCR    : TImage;
    function GetLinhaDigitavel_CR: string;
   // function GetImagem: TImage; {Gera a imagem do código de barras}
   public
      property Codigo_CR    : string  read fCodigo_CR write fCodigo_CR;
      property LinhaDigitavel_CR : string read GetLinhaDigitavel_CR;
      property Imagem    : TImage read GetImagemCR;
   end;


   {TEndereco representa o endereço de cedentes ou sacados}
   TEstado = string[2];
   TCEP = string[8];

   TEndereco = class(TPersistent)
   public
      fRua,
      fNumero,
      fComplemento,
      fBairro,
      fCidade,
      fEMail : string;
      fEstado : TEstado;
      fCEP : TCEP;
      procedure Assign(AEndereco: TEndereco); reintroduce;
   published
      property Rua : string read fRua write fRua;
      property Numero : string read fNumero write fNumero;
      property Complemento : string read fComplemento write fComplemento;
      property Bairro : string read fBairro write fBairro;
      property Cidade : string read fCidade write fCidade;
      property Estado : TEstado read fEstado write fEstado;
      property CEP : TCEP read fCEP write fCEP;
      property EMail : string read fEMail write fEMail;
   end;

   {Dados sobre os cedentes ou sacados}
   TPessoa = class(TPersistent)
   private
      fNome         : string;
      fEndereco     : TEndereco;
   public
      constructor Create;
      destructor  Destroy; override;
      procedure   Assign(APessoa: TPessoa); reintroduce;
   published
      property Nome         : string read fNome write fNome;
      property Endereco     : TEndereco read fEndereco write fEndereco;
   end;

   {Dados completos sobre o cedente - Classe derivada de TgbPessoa}
   TCedente = class(TPessoa)
   private
      fCNPJ,
      fSICAS_Completo,
      fSICAS_Simples,
      fAgencia,
      fCNAE : string;
   public
      procedure Assign(ACedente: TCedente);
   published
      property CNPJ           : string read fCNPJ write fCNPJ;
      property SICAS_Completo : string read fSICAS_Completo write fSICAS_Completo;
      property SICAS_Simples  : string read fSICAS_Simples write fSICAS_Simples;
      property Agencia        : string read fAgencia write fAgencia;
      property CNAE           : string read fCNAE write fCNAE;
   end;

   {Dados completos sobre o sacado - Classe derivada de TgbPessoa}
   TContribuinte = string[17];

   TSacado = class(TPessoa)
   private
      fContribuinte      : TContribuinte;
      fContribuinte_Mask : string;
      fContribuintecpfcnpj : string;
      fCapital_Social    : Double;
   public
      procedure Assign(ASacado: TSacado);
   published
      property Contribuinte      : TContribuinte read fContribuinte write fContribuinte;
      property Contribuinte_Mask : string read fContribuinte_Mask write fContribuinte_Mask;
      property Contribuintecpfcnpj : string read fContribuintecpfcnpj write fContribuintecpfcnpj;
      property Capital_Social    : Double read fCapital_Social write fCapital_Social;
   end;

   {Dados sobre os cedentes ou sacados}
   TValores = class(TPersistent)
   private
      fContribuicao,
      fAbatimento,
      fDeducao,
      fMulta,
      fAcrescimo     : Double;
   public
      constructor Create;
      destructor  Destroy; override;
      procedure   Assign(AValores: TValores); reintroduce;
   published
      property Contribuicao: Double read fContribuicao write fContribuicao;
      property Abatimento  : Double read fAbatimento write fAbatimento;
      property Deducao     : Double read fDeducao write fDeducao;
      property Multa       : Double read fMulta write fMulta;
      property Acrescimo   : Double read fAcrescimo write fAcrescimo;
   end;



  TGuias = class(TComponent)
  private
    { Private declarations }
    fVencimento :TDateTime;
    fExercicio :String;
    fMensagem :TStringList;
    fMensagemContrib1:TStringList;
    fMensagemContrib2:TStringList;
    fCedente  :TCedente;
    fSacado :TSacado;
    fValores :TValores;
    fEspecie :String;
    fNumero_Documento :Integer;
    fTipo_Entidade :TTipo_Entidade;
    FTipo_pessoa: String;

    procedure PrepararBoleto(ABoleto: TImp_GRCS);
    procedure PrepararBoleto_CR(ABoleto: TImp_GRCS_CR);

    function  GerarCodigoBarra : TCodigoBarra;
    function  GerarCodigoBarra_CR : TCodigoBarra_CR;
    procedure SetMensagem(Texto: TStringList);
    procedure SetMensagemContrib1(Texto: TStringList);
    procedure SetMensagemContrib2(Texto: TStringList);
    procedure SetTipo_pessoa(const Value: String);
    function GerarPDF_SIGCB_e_PDF(caminho, arquivo: string): integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(Owner: TComponent); override;
    destructor  Destroy; override;
    property    CodigoBarra : TCodigoBarra read GerarCodigoBarra;
    property    CodigoBarra_CR : TCodigoBarra_CR read GerarCodigoBarra_CR;
    procedure   Assign(AGuia: TGuias);
    procedure   Visualizar;
    procedure   Visualizar_CR;
    procedure Visualizar_CR_e_PDF(nomearquivo:String);
    function GerarPDF_SIGCB(caminho, arquivo: string): integer;
    procedure   Imprimir;
    procedure Imprimir_CR;
    procedure Imprimir_CR_e_PDF(nomearquivo:String);
  published
    { Published declarations }
    property Vencimento         : TDateTime read fVencimento write fVencimento;
    property Exercicio          : string read fExercicio write fExercicio;
    property Mensagem           : TStringList read fMensagem write SetMensagem;
    property MensagemContrib1   : TStringList read fMensagemContrib1 write SetMensagemContrib1;
    property MensagemContrib2   : TStringList read fMensagemContrib2 write SetMensagemContrib2;
    property Cedente            : TCedente read fCedente write fCedente;
    property Sacado             : TSacado read fSacado write fSacado;
    property Valores            : TValores read fValores write fValores;
    property Especie            : string read fEspecie write fEspecie;
    property Numero_Documento   : Integer read fNumero_Documento write fNumero_Documento;
    property Tipo_Entidade      : TTipo_Entidade read fTipo_Entidade write fTipo_Entidade;
    Property Tipo_pessoa        : String read FTipo_pessoa write SetTipo_pessoa;
  end;

procedure Register;
function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
function Modulo11(Valor: String; Base: Integer = 9; Resto : boolean = false) : string;
function Modulo11COMZERO(Valor: String; Base: Integer = 9; Resto : boolean = false) : string;
function CalcularFatorVencimento(DataDesejada : TDateTime) : string;
function Modulo10(Valor: String) : string;

implementation

uses UFuncoes, UDmBoleto, UPrincipal, UDMConexao, UDMAssociado;

function StrZero(Zeros:string;Quant:integer):String;
var
   I,Tamanho:integer;
   aux: string;
begin
   aux := zeros;
   Tamanho := length(ZEROS);
   ZEROS:='';
   for I:=1 to quant-tamanho do
       ZEROS:=ZEROS + '0';
   aux := zeros + aux;
   StrZero := aux;
end;

function Converte_Entidade(Entidade:TTipo_Entidade):String;
Begin
   Case Entidade of
      teSindicato:Result := '1';
      teFederacao:Result := '2';
      teConfederacao:Result := '3';
      teCees:Result := '4';
   End;
End;

function CalcularFatorVencimento(DataDesejada : TDateTime) : string;
{O fator de vencimento é a quantidade de dias entre 07/Nov/1997 e a data de vencimento do título}
begin
   Result := IntToStr( Trunc(DataDesejada - EncodeDate(1997,10,07)));
end;

function Modulo10(Valor: String) : string;
{
   Rotina usada para cálculo de alguns dígitos verificadores
   Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
   esquerda e multiplica-se por 2121212...
   Soma-se cada um dos subprodutos. Caso algum dos subprodutos tenha mais de um
   dígito, deve-se somar cada um dos dígitos. (Exemplo: 7*2 = 14 >> 1+4 = 5)
   Divide-se a soma por 10.
   Faz-se a operação 10-Resto da divisão e devolve-se o resultado dessa operação
   como resultado da função Modulo10.
   Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
   Auxiliar : string;
   Contador, Peso : integer;
   Digito : integer;
begin
   Auxiliar := '';
   Peso := 2;
   for Contador := Length(Valor) downto 1 do
   begin
      Auxiliar := IntToStr(StrToInt(Valor[Contador]) * Peso) + Auxiliar;
      if Peso = 1 then
         Peso := 2
      else
         Peso := 1;
   end;

   Digito := 0;
   for Contador := 1 to Length(Auxiliar) do
   begin
      Digito := Digito + StrToInt(Auxiliar[Contador]);
   end;
   Digito := 10 - (Digito mod 10);
   if (Digito > 9) then
      Digito := 0;
   Result := IntToStr(Digito);
end;

function Modulo11(Valor: String; Base: Integer = 9; Resto : boolean = false) : string;
{
   Rotina muito usada para calcular dígitos verificadores
   Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
   esquerda e multiplica-se pela seqüência de pesos 2, 3, 4 ... até BASE.
   Por exemplo: se a base for 9, os pesos serão 2,3,4,5,6,7,8,9,2,3,4,5...
   Se a base for 7, os pesos serão 2,3,4,5,6,7,2,3,4...
   Soma-se cada um dos subprodutos.
   Divide-se a soma por 11.
   Faz-se a operação 11-Resto da divisão e devolve-se o resultado dessa operação
   como resultado da função Modulo11.
   Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
   Soma : integer;
   Contador, Peso, Digito : integer;
begin
   Soma := 0;
   Peso := 2;
   for Contador := Length(Valor) downto 1 do
   begin
      Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
      if Peso < Base then
         Peso := Peso + 1
      else
         Peso := 2;
   end;

   if Resto then
      Result := IntToStr(Soma mod 11)
   else
   begin
      Digito := 11 - (Soma mod 11);
      if (Digito > 9) then
         Digito := 0;

      if (Digito = 0) Then Digito := 1;

      Result := IntToStr(Digito);
   end
end;

function Modulo11COMZERO(Valor: String; Base: Integer = 9; Resto : boolean = false) : string;
{
   Rotina muito usada para calcular dígitos verificadores
   Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
   esquerda e multiplica-se pela seqüência de pesos 2, 3, 4 ... até BASE.
   Por exemplo: se a base for 9, os pesos serão 2,3,4,5,6,7,8,9,2,3,4,5...
   Se a base for 7, os pesos serão 2,3,4,5,6,7,2,3,4...
   Soma-se cada um dos subprodutos.
   Divide-se a soma por 11.
   Faz-se a operação 11-Resto da divisão e devolve-se o resultado dessa operação
   como resultado da função Modulo11.
   Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
   Soma : integer;
   Contador, Peso, Digito : integer;
begin
   Soma := 0;
   Peso := 2;
   for Contador := Length(Valor) downto 1 do
   begin
      Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
      if Peso < Base then
         Peso := Peso + 1
      else
         Peso := 2;
   end;

   if Resto then
      Result := IntToStr(Soma mod 11)
   else
   begin
      Digito := 11 - (Soma mod 11);
      if (Digito > 9) then
         Digito := 0;

    //  if (Digito = 0) Then Digito := 1;

      Result := IntToStr(Digito);
   end
end;


function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   OBJETIVO: Eliminar caracteres inválidos e acrescentar caracteres à esquerda ou à direita do texto original para que a string resultante fique com o tamanho desejado

   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante deverá ter
   AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
      TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
             Se o tamanho do texto for MAIOR que o desejado, eliminar últimos caracteres do texto
      FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
             Se o tamanho do texto for MAIOR que o desejado, eliminar primeiros caracteres do texto
   CaracterAcrescentar: Carácter que deverá ser acrescentado
}
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(AnsiUpperCase(Texto));
   TamanhoTexto := Length(Texto);
   for i := 1 to (TamanhoTexto) do
   begin
      if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
      begin
         case Texto[i] of
            'Á','À','Â','Ä','Ã' : Texto[i] := 'A';
            'É','È','Ê','Ë' : Texto[i] := 'E';
            'Í','Ì','Î','Ï' : Texto[i] := 'I';
            'Ó','Ò','Ô','Ö','Õ' : Texto[i] := 'O';
            'Ú','Ù','Û','Ü' : Texto[i] := 'U';
            'Ç' : Texto[i] := 'C';
            'Ñ' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;

   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;


{TCodigoBarra}

function TCodigoBarra.Define2de5 : string;
{Traduz dígitos do código de barras para valores de 0 e 1, formando um código do tipo Intercalado 2 de 5}
var
   CodigoAuxiliar : string;
   Start   : string;
   Stop    : string;
   T2de5   : array[0..9] of string;
   Codifi  : string;
   I       : integer;

begin
   Result := 'Erro';
   Start    := '0000';
   Stop     := '100';
   T2de5[0] := '00110';
   T2de5[1] := '10001';
   T2de5[2] := '01001';
   T2de5[3] := '11000';
   T2de5[4] := '00101';
   T2de5[5] := '10100';
   T2de5[6] := '01100';
   T2de5[7] := '00011';
   T2de5[8] := '10010';
   T2de5[9] := '01010';

   { Digitos }
   for I := 1 to length(Codigo) do
   begin
      if pos(Codigo[I],'0123456789') <> 0 then
         Codifi := Codifi + T2de5[StrToInt(Codigo[I])]
      else
         Exit;
   end;

   {Se houver um número ímpar de dígitos no Código, acrescentar um ZERO no início}
   if odd(length(Codigo)) then
      Codifi := T2de5[0] + Codifi;

   {Intercalar números - O primeiro com o segundo, o terceiro com o quarto, etc...}
   I := 1;
   CodigoAuxiliar := '';
   while I <= (length(Codifi) - 9)do
   begin
      CodigoAuxiliar := CodigoAuxiliar + Codifi[I] + Codifi[I+5] + Codifi[I+1] + Codifi[I+6] + Codifi[I+2] + Codifi[I+7] + Codifi[I+3] + Codifi[I+8] + Codifi[I+4] + Codifi[I+9];
      I := I + 10;
   end;

   { Acrescentar caracteres Start e Stop }
   Result := Start + CodigoAuxiliar + Stop;
end;

function TCodigoBarra.GetLinhaDigitavel : string;
Var Linha, Campo1, Campo2, Campo3, Campo4, Campo5, DigitoGeral:String;
begin
   Linha := '';

   Linha := Linha + Copy(Codigo,  1,  3); // Código do Banco
   Linha := Linha + Copy(Codigo,  4,  1); // Código da Moeda
   Linha := Linha + Copy(Codigo, 20,  2); // Identificador SICOB (97)
   Linha := Linha + Copy(Codigo, 22,  5); // Código da Entidade
   Linha := Linha + Copy(Codigo, 27,  1); // 1º Posição do CNAE
   Linha := Linha + Copy(Codigo, 28,  1); // Tipo da Entidade
   Linha := Linha + Copy(Codigo, 29,  2); // Identificador SITCS (77)
   Linha := Linha + Copy(Codigo, 31, 12); // Código do Contribuinte
   Linha := Linha + Copy(Codigo, 43,  2); // 2º e 3º Posição do CNAE
   Linha := Linha + Copy(Codigo,  5,  1); // Digito geral
   Linha := Linha + Copy(Codigo,  6,  4); // Fator de Vencimento
   Linha := Linha + Copy(Codigo, 10, 10); // Valor do Documento

   Campo1 := Copy(Linha,  1,  9);
   Campo1 := Campo1 + Modulo10(Campo1);

   Campo2 := Copy(Linha, 10, 10);
   Campo2 := Campo2 + Modulo10(Campo2);

   Campo3 := Copy(Linha, 20, 10);
   Campo3 := Campo3 + Modulo10(Campo3);

   Campo4 := Copy(Linha, 30,  1);

   Campo5 := Copy(Linha, 31, 14);

   Linha := Campo1 + Campo2 + Campo3 + Campo4 + Campo5;

   Result := FormatMaskText('99999.99999 99999.999999 99999.999999 9 99999999999999;0; ', Linha);
end;

function TCodigoBarra.GetImagem : TImage;
const
   CorBarra           = clBlack;
   CorEspaco          = clWhite;
   LarguraBarraFina   = 1;
   LarguraBarraGrossa = 3;
   AlturaBarra        = 50;
var
   X            : integer;
   Col          : integer;
   Lar          : integer;
   CodigoAuxiliar : string;
begin
   CodigoAuxiliar := Define2de5;
   Result := TImage.Create(nil);
   Result.Height := AlturaBarra;
   Result.Width := 0;
   For X := 1 to Length(CodigoAuxiliar) do
      case CodigoAuxiliar[X] of
         '0' : Result.Width := Result.Width + LarguraBarraFina;
         '1' : Result.Width := Result.Width + LarguraBarraGrossa;
      end;

   Col    := 0;

   if CodigoAuxiliar <> 'Erro' then
   begin
      for X := 1 to length(CodigoAuxiliar) do
      begin
         {Desenha barra}
         with Result.Canvas do
         begin
            if Odd(X) then
               Pen.Color := CorBarra
            else
               Pen.Color := CorEspaco;

            if CodigoAuxiliar[X] = '0' then
            begin
               for Lar := 1 to LarguraBarraFina do
               begin
                  MoveTo(Col,0);
                  LineTo(Col,AlturaBarra);
                  Col := Col + 1;
               end;
            end
            else
            begin
               for Lar := 1 to LarguraBarraGrossa do
               begin
                  MoveTo(Col,0);
                  LineTo(Col,AlturaBarra);
                  Col := Col + 1;
               end;
            end;
         end;
      end;

   end
   else
      Result.Canvas.TextOut(0,0,'Erro');


end;

function TCodigoBarra_CR.Define2de5_cr: string;
var
   CodigoAuxiliar : string;
   Start   : string;
   Stop    : string;
   T2de5   : array[0..9] of string;
   Codifi  : string;
   I       : integer;

begin
   Result := 'Erro';
   Start    := '0000';
   Stop     := '100';
   T2de5[0] := '00110';
   T2de5[1] := '10001';
   T2de5[2] := '01001';
   T2de5[3] := '11000';
   T2de5[4] := '00101';
   T2de5[5] := '10100';
   T2de5[6] := '01100';
   T2de5[7] := '00011';
   T2de5[8] := '10010';
   T2de5[9] := '01010';

   { Digitos }
   for I := 1 to length(Codigo_Cr) do
   begin
      if pos(Codigo_CR[I],'0123456789') <> 0 then
         Codifi := Codifi + T2de5[StrToInt(Codigo_Cr[I])]
      else
         Exit;
   end;

   {Se houver um número ímpar de dígitos no Código, acrescentar um ZERO no início}
   if odd(length(Codigo_Cr)) then
      Codifi := T2de5[0] + Codifi;

   {Intercalar números - O primeiro com o segundo, o terceiro com o quarto, etc...}
   I := 1;
   CodigoAuxiliar := '';
   while I <= (length(Codifi) - 9)do
   begin
      CodigoAuxiliar := CodigoAuxiliar + Codifi[I] + Codifi[I+5] + Codifi[I+1] + Codifi[I+6] + Codifi[I+2] + Codifi[I+7] + Codifi[I+3] + Codifi[I+8] + Codifi[I+4] + Codifi[I+9];
      I := I + 10;
   end;

   { Acrescentar caracteres Start e Stop }
   Result := Start + CodigoAuxiliar + Stop;
end;


function TCodigoBarra_CR.GetImagemCR: TImage;
const
   CorBarra           = clBlack;
   CorEspaco          = clWhite;
   LarguraBarraFina   = 1;
   LarguraBarraGrossa = 3;
   AlturaBarra        = 50;
var
   X            : integer;
   Col          : integer;
   Lar          : integer;
   CodigoAuxiliar : string;
begin
   CodigoAuxiliar := Define2de5_CR;
   Result := TImage.Create(nil);
   Result.Height := AlturaBarra;
   Result.Width := 0;
   For X := 1 to Length(CodigoAuxiliar) do
      case CodigoAuxiliar[X] of
         '0' : Result.Width := Result.Width + LarguraBarraFina;
         '1' : Result.Width := Result.Width + LarguraBarraGrossa;
      end;

   Col    := 0;

   if CodigoAuxiliar <> 'Erro' then
   begin
      for X := 1 to length(CodigoAuxiliar) do
      begin
         {Desenha barra}
         with Result.Canvas do
         begin
            if Odd(X) then
               Pen.Color := CorBarra
            else
               Pen.Color := CorEspaco;

            if CodigoAuxiliar[X] = '0' then
            begin
               for Lar := 1 to LarguraBarraFina do
               begin
                  MoveTo(Col,0);
                  LineTo(Col,AlturaBarra);
                  Col := Col + 1;
               end;
            end
            else
            begin
               for Lar := 1 to LarguraBarraGrossa do
               begin
                  MoveTo(Col,0);
                  LineTo(Col,AlturaBarra);
                  Col := Col + 1;
               end;
            end;
         end;
      end;

   end
   else
      Result.Canvas.TextOut(0,0,'Erro');


end;

function TCodigoBarra_CR.GetLinhaDigitavel_CR: string;
Var Linha, Campo1, Campo2, Campo3, Campo4, Campo5, DigitoGeral:String;
begin
   Linha := '';

   Linha := Linha + Copy(Codigo_CR,  1,  3); // Código do Banco    1 a 3
   Linha := Linha + Copy(Codigo_CR,  4,  1); // Código da Moeda    4
   Linha := Linha + Copy(Codigo_CR, 20,  5); // cinco primeiras posições do campo livre    20 a 24
   Linha := Linha + Copy(Codigo_CR, 25,  10); // 6 a 15 do campo livre  25 a 34
   Linha := Linha + Copy(Codigo_CR, 35,  10); // 16 a 25 do campo livre    35 a 44
   Linha := Linha + Copy(Codigo_CR,  5,  1); // Digito geral
   Linha := Linha + Copy(Codigo_CR, 6,  4); // fator de vencimento" (posições 6 a 9 do código de barras) 6 a 9
   Linha := Linha + Copy(Codigo_CR, 10,  10); // valor 10 a 19
   {
   Linha := Linha + Copy(Codigo, 31, 12); // Código do Contribuinte
   Linha := Linha + Copy(Codigo, 43,  2); // 2º e 3º Posição do CNAE
   Linha := Linha + Copy(Codigo,  6,  4); // Fator de Vencimento
   Linha := Linha + Copy(Codigo, 10, 10); // Valor do Documento
   }

   Campo1 := Copy(Linha,  1,  9);
   Campo1 := Campo1 + Modulo10(Campo1);

   Campo2 := Copy(Linha, 10, 10);
   Campo2 := Campo2 + Modulo10(Campo2);

   Campo3 := Copy(Linha, 20, 10);
   Campo3 := Campo3 + Modulo10(Campo3);

   Campo4 := Copy(Linha, 30,  1);

   Campo5 := Copy(Linha, 31, 14);

   Linha := Campo1 + Campo2 + Campo3 + Campo4 + Campo5;

   Result := FormatMaskText('99999.99999 99999.999999 99999.999999 9 99999999999999;0; ', Linha);
end;

{TEndereco}
procedure TEndereco.Assign(AEndereco: TEndereco);
begin
   Rua := AEndereco.Rua;
   Numero := AEndereco.Numero;
   Complemento := AEndereco.Complemento;
   Bairro := AEndereco.Bairro;
   Cidade := AEndereco.Cidade;
   Estado := AEndereco.Estado;
   CEP := AEndereco.CEP;
   EMail := AEndereco.EMail;
end;

{TPessoa}
constructor TPessoa.Create;
begin
   inherited Create;
   Endereco := TEndereco.Create;
end;

destructor TPessoa.Destroy;
begin
   Endereco.Destroy;
   inherited Destroy;
end;

procedure TPessoa.Assign(APessoa: TPessoa);
begin
   Nome := APessoa.Nome;
   Endereco.Assign(APessoa.Endereco);
end;

procedure TCedente.Assign(ACedente: TCedente);
begin
   inherited Assign(ACedente);

   CNPJ := ACedente.CNPJ;
   SICAS_Completo := ACedente.SICAS_Completo;
   SICAS_Simples := ACedente.SICAS_Simples;
   Agencia := ACedente.Agencia;
   CNAE := ACedente.CNAE;
end;

procedure TSacado.Assign(ASacado: TSacado);
begin
   inherited Assign(ASacado);

   Contribuinte := ASacado.Contribuinte;
   Contribuinte_Mask := ASacado.Contribuinte_Mask;
   Contribuintecpfcnpj := ASacado.Contribuintecpfcnpj;
   Capital_Social := ASacado.Capital_Social;
end;

{TValores}
constructor TValores.Create;
begin
   inherited Create;

   //Valores := TValores.Create;
end;

destructor TValores.Destroy;
begin
   inherited Destroy;
end;

procedure TValores.Assign(AValores: TValores);
begin
   Contribuicao := AValores.Contribuicao;
   Abatimento := AValores.Abatimento;
   Deducao := AValores.Deducao;
   Multa := AValores.Multa;
   Acrescimo := AValores.Acrescimo;
end;

{TGuias}
constructor TGuias.Create(Owner: TComponent);
begin
   inherited Create(Owner);  // Initialize inherited parts
   fCedente := TCedente.Create;
   fSacado  := TSacado.Create;
   fValores := TValores.Create;
   fMensagem := TStringList.Create;
   fMensagemContrib1 := TStringList.Create;
   fMensagemContrib2 := TStringList.Create;

   fNumero_Documento := 0;
   fEspecie := 'R$';
   fVencimento := Date;
end;

destructor TGuias.Destroy;
begin
   Cedente.Destroy;
   Sacado.Destroy;
   Valores.Destroy;
   Mensagem.Destroy;
   inherited Destroy;
end;

procedure TGuias.Assign(AGuia: TGuias);
begin
   Exercicio        := AGuia.Exercicio;
   Especie          := AGuia.Especie;
   Tipo_Entidade    := AGuia.Tipo_Entidade;
   Vencimento       := AGuia.Vencimento;
   Numero_Documento := AGuia.Numero_Documento;
   Cedente.Assign(AGuia.Cedente);
   Sacado.Assign(AGuia.Sacado);
   Mensagem.Assign(AGuia.Mensagem);
end;


procedure TGuias.SetMensagem(Texto: TStringList);
begin
   fMensagem.Assign(Texto);
end;

procedure TGuias.Visualizar;
var
   ABoleto : TImp_GRCS;
begin
   ABoleto := TImp_GRCS.Create(nil);
   TRY
      PrepararBoleto(ABoleto);
      ABoleto.Preview;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;

procedure TGuias.Imprimir;
var
   ABoleto : TImp_GRCS;
begin
   ABoleto := TImp_GRCS.Create(nil);
   TRY
      PrepararBoleto(ABoleto);
      ABoleto.ShowProgress := False;
      ABoleto.ReportTitle := 'Guia Sindical ' + Sacado.Contribuinte;
      ABoleto.Print;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;  

////////////////////////////////////////////////////////////
////// termino da criação do componente
////////////////////////////////////////////////////////////

function TGuias.GerarCodigoBarra : TCodigoBarra;
var
   AValor_Total :Double;
   ACodigoBanco,
   ACodigoMoeda,
   ADigitoCodigoBarras,
   AFatorVencimento,
   AValorDocumento,
   ASICOB,
   AEntidade,
   ACNAE_P1,
   ATP_Entidade,
   ASITCS,
   AContribuinte,
   ACNAE_P2,
   ACodigoBarras: string;
begin
   Result := TCodigoBarra.Create;

   With Valores do
      AValor_Total := Contribuicao - (Abatimento + Deducao) + (Multa + Acrescimo);

   {Primeira parte do código de barras}
   ACodigoBanco := '104';
   ACodigoMoeda := '9';

   // Aqui entra o digito verificador que será calculado no final (1 Posição);

   AFatorVencimento := Formatar(CalcularFatorVencimento(Vencimento),4,false,'0');

   AValorDocumento := FormatCurr('0000000000',AValor_Total*100); {Formata o valor com 10 dígitos, incluindo as casas decimais, mas não mostra o ponto decimal}
  // AValorDocumento := '0000000000';

   ASICOB := '97';
   AEntidade := Cedente.SICAS_Simples;
   ACNAE_P1 := Copy(Cedente.CNAE, 1, 1);
   ATP_Entidade := Converte_Entidade(Tipo_Entidade);
   ASITCS := '77';
   AContribuinte := Sacado.Contribuinte;
   ACNAE_P2 := Copy(Cedente.CNAE, 2, 2);;

   {Calcula o dígito e completa o código de barras}
   ACodigoBarras := ACodigoBanco + ACodigoMoeda + AFatorVencimento + AValorDocumento + ASICOB +
                    AEntidade + ACNAE_P1 + ATP_Entidade + ASITCS + AContribuinte + ACNAE_P2;

   ADigitoCodigoBarras := Modulo11(ACodigoBarras,9);

   Result.Codigo := Copy(ACodigoBarras,1,4) + ADigitoCodigoBarras + Copy(ACodigoBarras,5,length(ACodigoBarras)-4);
end;

procedure TGuias.PrepararBoleto(ABoleto: TImp_GRCS);
var
   Agencia2,
   NossoNumero2,
   Especie,
   AAgenciaCodigoCedente,
   ANossoNumero,
   ACarteira,
   AEspecieDocumento,
   ACodigoBanco: string;
   AInstrucoes: TStringList;
   codigotexto:string;
begin
   AInstrucoes := TStringList.Create;

  {
   if DataProtesto <> 0 then
      AInstrucoes.Add('Protestar em ' + FormatDateTime('dd/mm/yyyy',DataProtesto));

   if ValorAbatimento <> 0 then
      if DataAbatimento <> 0 then
         AInstrucoes.Add('Conceder abatimento de ' + FormatCurr('R$ #,##0.00',ValorAbatimento) + ' para pagamento até ' + FormatDateTime('dd/mm/yyyy',DataAbatimento))
      else
         AInstrucoes.Add('Conceder abatimento de ' + FormatCurr('R$ #,##0.00',ValorAbatimento) + ' para pagamento até ' + FormatDateTime('dd/mm/yyyy',DataVencimento));

   if ValorDesconto <> 0 then
      if DataDesconto <> 0 then
         AInstrucoes.Add('Conceder desconto de ' + FormatCurr('R$ #,##0.00',ValorDesconto) + ' por dia de antecipação para pagamento até ' + FormatDateTime('dd/mm/yyyy',DataDesconto))
      else
         AInstrucoes.Add('Conceder desconto de ' + FormatCurr('R$ #,##0.00',ValorDesconto) + ' por dia de antecipação');

   if ValorMoraJuros <> 0 then
      if DataMoraJuros <> 0 then
         AInstrucoes.Add('Cobrar juros de ' + FormatCurr('R$ #,##0.00',ValorMoraJuros) + ' por dia de atraso para pagamento a partir de ' + FormatDateTime('dd/mm/yyyy',DataMoraJuros))
      else
         AInstrucoes.Add('Cobrar juros de ' + FormatCurr('R$ #,##0.00',ValorMoraJuros) + ' por dia de atraso');

   AInstrucoes.AddStrings(Mensagem);   }

   with ABoleto do
   begin
      ReportTitle := 'Guia Sindical - ' + ' - Cedente: ' + Cedente.Nome + ' - Sacado: ' + Sacado.Nome;

      {Primeira via do boleto}
      qrlVencimento1.Caption := DateToStr(Vencimento);
      qrlVencimento2.Caption := qrlVencimento1.Caption;
      qrlVencimento3.Caption := qrlVencimento1.Caption;

      if  (Tipo_pessoa = 'F') then
        QRLabel34.Left := 280
      else
        QRLabel34.Left := 26;

      qrlCNAE1.Caption := Cedente.CNAE;

      qrlExercicio1.Caption  := Exercicio;
      qrlExecicio2.Caption   := qrlExercicio1.Caption;
      qrlUsoBanco.Caption    := 'EXERC ' + qrlExercicio1.Caption;

      //qrlSicas1.Caption := FormatMaskText('999.999.99999-9;0; ',Cedente.SICAS_Completo);
       //qrlSicas3.Caption := Cedente.Agencia + '/' + qrlSicas1.Caption;

      {qrlSicas3.Caption := Cedente.Agencia + '/'+Cedente.Nome[1]+'-' + cedente.SICAS_Simples;}
      if Cedente.Nome[1] = 'S' then
      begin
         qrlSicas1.Caption := 'S '+cedente.SICAS_Simples;
         qrlSicas3.Caption := Cedente.Agencia + '/S ' + cedente.SICAS_Simples;
      end
      else
      if Cedente.Nome[1] = 'F' then
      begin
          qrlSicas1.Caption := 'F 111' ;
          qrlSicas3.Caption := Cedente.Agencia + '/F 111';

      end;

      qrlSicas2.Caption := qrlSicas1.Caption;
      
      qrlEmpresa1.Caption := Cedente.Nome;
      qrlCedente.Caption  := qrlEmpresa1.Caption;

      qrlEndereco1.Caption    := Cedente.Endereco.Rua;
      qrlNumero1.Caption      := Cedente.Endereco.Numero;
      qrlComplemento1.Caption := Cedente.Endereco.Complemento;
      qrlBairro1.Caption      := Cedente.Endereco.Bairro;
      qrlCEP1.Caption         := FormatMaskText('99999-999;0; ',Cedente.Endereco.CEP);
      qrlMunicipio1.Caption   := Cedente.Endereco.Cidade;
      qrlUF1.Caption          := Cedente.Endereco.Estado;
      qrlCNPJ.Caption         := FormatMaskText('!00\.000\.000\/0000\-00;0; ',Cedente.CNPJ);

      qrlSacado1.Caption        := Sacado.Nome;
      qrlEnd_Sacado1.Caption    := Sacado.Endereco.Rua;
      qrlNum_Sacado1.Caption    := Sacado.Endereco.Numero;
      qrlComp_Sacado1.Caption   := Sacado.Endereco.Complemento;
      qrlBairro_Sacado1.Caption := Sacado.Endereco.Bairro;
      qrlCEP_Sacado1.Caption    := FormatMaskText('99999-999;0; ',Sacado.Endereco.CEP);
      qrlMuni_Sacado1.Caption   := Sacado.Endereco.Cidade;
      qrlUF_Sacado1.Caption     := Sacado.Endereco.Estado;

      qrlContrtibuinte1.Caption := FormatMaskText(Sacado.Contribuinte_Mask,Sacado.Contribuinte);
//      qrlContrtibuinte2.Caption := qrlContrtibuinte1.Caption;
      qrlContrtibuinte2.Caption := Sacado.Contribuinte;
      qrlContrtibuinte3.Caption := qrlContrtibuinte2.Caption;

      qrlCap_Social1.Caption    := FormatCurr('#,##0.00',Sacado.Capital_Social);
      qrlCap_Social2.Caption    := qrlCap_Social1.Caption;

      qrlValor1.Caption      := FormatCurr('#,##0.00',Valores.Contribuicao);
      qrlAbatimento1.Caption := FormatCurr('#,##0.00',Valores.Abatimento);
      qrlDesconto1.Caption   := FormatCurr('#,##0.00',Valores.Deducao);
      qrlMulta1.Caption      := FormatCurr('#,##0.00',Valores.Multa);
      qrlCorrecao1.Caption   := FormatCurr('#,##0.00',Valores.Acrescimo);

      qrlTotal1.Caption     := '0,00';
      //qrlTotal1.Caption     := FormatCurr('#,##0.00',Valores.Contribuicao + Valores.Multa + Valores.Acrescimo)

     // With Valores do
     //     qrlTotal1.Caption := FormatCurr('#,##0.00',(Contribuicao - (Abatimento + Deducao) + (Multa + Acrescimo)));

      qrlNum_Documento.Caption := StrZero(IntToStr(Numero_Documento), 8);

      qrlTotal2.Caption := qrlTotal1.Caption;

      qrlTotal3.Caption := qrlValor1.Caption;

      qrlValor2.Caption      :=  qrlValor1.Caption;
      qrlAbatimento2.Caption :=  qrlAbatimento1.Caption;
      qrlDesconto2.Caption   :=  qrlDesconto1.Caption;
      qrlMulta2.Caption      :=  qrlMulta1.Caption;
      qrlCorrecao2.Caption   :=  qrlCorrecao1.Caption;

      

      qrlRep_Numerica1.Caption := CodigoBarra.LinhaDigitavel;
      qrlRep_Numerica2.Caption := qrlRep_Numerica1.Caption;

      //Alterado COBREG
      {qrlDt_Documento.Caption := DateToStr(Vencimento-5);
      qrlDt_Precessamento.Caption := DateToStr(Vencimento-5);}


      if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
      begin
         qrlDt_Documento.Caption := DateToStr(Vencimento-5);
         qrlDt_Precessamento.Caption := DateToStr(Vencimento-5);
      end
      else
      begin
          qrlDt_Documento.Caption := DateToStr(DataAtual);
          qrlDt_Precessamento.Caption := DateToStr(DataAtual);
      end;

      qrmSacado.Lines.Add(AnsiUpperCase(Sacado.Nome));
      qrmSacado.Lines.Add(AnsiUpperCase(Sacado.Endereco.Rua + ', ' + Sacado.Endereco.Numero + '   ' + Sacado.Endereco.Complemento));
      qrmSacado.Lines.Add(AnsiUpperCase(FormatMaskText('99999-999;0; ',Sacado.Endereco.CEP) + '    ' + Sacado.Endereco.Bairro + '    ' + Sacado.Endereco.Cidade + '    ' + Sacado.Endereco.Estado));

      qrmMensagem.Lines.Clear;
      qrmMensagem.Lines.AddStrings(Mensagem);
      qrmMensagemContrib1.Lines.AddStrings(MensagemContrib1);
//      qrmMensagemContrib2.Lines.AddStrings(MensagemContrib2);


      CodigoBarra.Imagem.Picture.SaveToFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');
      imgCodigoBarras.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');
      DeleteFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');

      // GerarCodigo (CodigoBarra.Codigo,imgCodigoBarras.canvas)
      //imgCodigoBarras.Picture.Assign(CodigoBarra.Imagem.Picture);
      //imgCodigoBarras.Picture.Assign(CodigoBarra.Imagem.Picture);
   end;

   AInstrucoes.Free;
end;

procedure Register;
begin
  RegisterComponents('GRCS', [TGuias]);
end;




procedure TGuias.SetTipo_pessoa(const Value: String);
begin
  FTipo_pessoa := Value;
end;

procedure TGuias.SetMensagemContrib1(Texto: TStringList);
begin
   fMensagemContrib1.Assign(Texto);
end;

procedure TGuias.SetMensagemContrib2(Texto: TStringList);
begin
   fMensagemContrib2.Assign(Texto);

end;



function TGuias.GerarPDF_SIGCB(caminho, arquivo: string): integer;
var
   ABoleto : TImp_GRCS_CR;
begin
   ABoleto := TImp_GRCS_CR.Create(nil);
   TRY
      ABoleto.ShowProgress :=false;
      PrepararBoleto_CR(ABoleto);
      //result := gerarPDF(ABoleto,caminho,arquivo);
      result := GeraPDF(ABoleto,caminho, arquivo);
      DMAssociado.dsDocsAnexos.dataset.close;
      DMAssociado.dsDocsAnexos.dataset.open;

      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;

end;

procedure TGuias.Visualizar_CR;
var
   ABoleto : TImp_GRCS_CR;
begin
   ABoleto := TImp_GRCS_CR.Create(nil);
   TRY
      PrepararBoleto_CR(ABoleto);
      ABoleto.Preview;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;

end;

procedure TGuias.Imprimir_CR;
var
   ABoleto : TImp_GRCS_CR;
begin
   ABoleto := TImp_GRCS_CR.Create(nil);
   TRY
      PrepararBoleto_CR(ABoleto);
      ABoleto.ShowProgress := False;
      ABoleto.ReportTitle := 'Guia Sindical ' + Sacado.Contribuinte;
      ABoleto.Print;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;

procedure TGuias.PrepararBoleto_CR(ABoleto: TImp_GRCS_CR);
var
   Agencia2,
   NossoNumero2,
   Especie,
   AAgenciaCodigoCedente,
   ANossoNumero,
   ACarteira,
   AEspecieDocumento,
   ACodigoBanco: string;
   AInstrucoes: TStringList;
   codigotexto:string;
begin
   AInstrucoes := TStringList.Create;

   with ABoleto do
   begin
      ReportTitle := 'Guia Sindical - ' + ' - Cedente: ' + Cedente.Nome + ' - Sacado: ' + Sacado.Nome;

      {Primeira via do boleto}
      qrlVencimento1.Caption := DateToStr(Vencimento);
      qrlVencimento2.Caption := qrlVencimento1.Caption;
      qrlVencimento3.Caption := qrlVencimento1.Caption;

      if  (Tipo_pessoa = 'F') then
        QRLabel34.Left := 280
      else
        QRLabel34.Left := 26;


      qrlCNAE1.Caption := Cedente.CNAE;

      qrlExercicio1.Caption  := Exercicio;
      qrlExecicio2.Caption   := qrlExercicio1.Caption;
      qrlUsoBanco.Caption    := qrlExercicio1.Caption;

      if Cedente.Nome[1] = 'S' then
      begin
         //alterado COBREG
         //qrlSicas1.Caption := 'S '+cedente.SICAS_Simples;
         //qrlSicas3.Caption := Cedente.Agencia + '/S ' + cedente.SICAS_Simples;
         if dmboleto.cdsContaCONTA_ID.value = 3 then
         begin
              qrlSicas1.Caption := FormatMaskText('999.999.99999-9;0; ',DmBoleto.cdsContaSICASCOMPLETO.value);//+ '0' );
             // qrlSicas3.Caption := Cedente.Agencia + '/' + DmBoleto.cdsContaSICASCOMPLETO.value+ '-0';
         end
         else
         begin
              qrlSicas1.Caption := FormatMaskText('999.999.99999-9;0; ',DmBoleto.cdsContaSICASCOMPLETO.value);//+ '2' );
             // qrlSicas3.Caption := Cedente.Agencia + '/' + DmBoleto.cdsContaSICASCOMPLETO.value+ '-2';
         end;


      end
      else
      if Cedente.Nome[1] = 'F' then
      begin
         //alterado COBREG
          //qrlSicas1.Caption := 'F 111' ;
          //qrlSicas3.Caption := Cedente.Agencia + '/F 111';
         qrlSicas1.Caption := FormatMaskText('999.999.99999-9;0; ',DmBoleto.cdsContaSICASCOMPLETO.value);//+ '5' );
        // qrlSicas3.Caption := Cedente.Agencia + '/' + DmBoleto.cdsContaSICASCOMPLETO.value+ '-5';
      end;

     //  qrlSicas3.Caption := Cedente.Agencia + '/' + DmBoleto.cdsContaCT_CODCEDENTE.value +'-'+ DmBoleto.cdsContaCT_CODCEDENTE_DV.value;
     qrlSicas3.Caption := Cedente.Agencia + '/' + qrlSicas1.Caption;

      qrlSicas2.Caption := qrlSicas1.Caption;
     // qrlSicas2.Caption := DmBoleto.cdsContaCT_CODCEDENTE.value +'-'+ DmBoleto.cdsContaCT_CODCEDENTE_DV.value;

      
      qrlEmpresa1.Caption := Cedente.Nome;
      qrlCedente.Caption  := qrlEmpresa1.Caption;

      qrlCap_Social1.Caption    := FormatCurr('#,##0.00',Sacado.Capital_Social);
      qrlCap_Social2.Caption    := qrlCap_Social1.Caption;

      qrlEndereco1.Caption    := Cedente.Endereco.Rua;
      qrlNumero1.Caption      := Cedente.Endereco.Numero;
      qrlComplemento1.Caption := Cedente.Endereco.Complemento;
      qrlBairro1.Caption      := Cedente.Endereco.Bairro;
      qrlCEP1.Caption         := FormatMaskText('99999-999;0; ',Cedente.Endereco.CEP);
      qrlMunicipio1.Caption   := Cedente.Endereco.Cidade;
      qrlUF1.Caption          := Cedente.Endereco.Estado;
      qrlCNPJ.Caption         := FormatMaskText('!00\.000\.000\/0000\-00;0; ',Cedente.CNPJ);

      qrlSacado1.Caption        := Sacado.Nome;
      qrlEnd_Sacado1.Caption    := Sacado.Endereco.Rua;
      qrlNum_Sacado1.Caption    := Sacado.Endereco.Numero;
      qrlComp_Sacado1.Caption   := Sacado.Endereco.Complemento;
      qrlBairro_Sacado1.Caption := Sacado.Endereco.Bairro;
      qrlCEP_Sacado1.Caption    := FormatMaskText('99999-999;0; ',Sacado.Endereco.CEP);
      qrlMuni_Sacado1.Caption   := Sacado.Endereco.Cidade;
      qrlUF_Sacado1.Caption     := Sacado.Endereco.Estado;

      qrlContrtibuinte1.Caption := MaskCPFCGC(Sacado.Contribuintecpfcnpj);

      qrlContrtibuinte2.Caption := Sacado.Contribuinte ;
      qrlContrtibuinte3.Caption := qrlContrtibuinte2.Caption;

      qrlValor1.Caption      := FormatCurr('#,##0.00',Valores.Contribuicao);
      qrlAbatimento1.Caption := FormatCurr('#,##0.00',Valores.Abatimento);
      qrlDesconto1.Caption   := FormatCurr('#,##0.00',Valores.Deducao);
      qrlMulta1.Caption      := FormatCurr('#,##0.00',Valores.Multa);
      qrlCorrecao1.Caption   := FormatCurr('#,##0.00',Valores.Acrescimo);

      //qrlTotal1.Caption     := '0,00';
      qrlTotal1.Caption     := FormatCurr('#,##0.00',Valores.Contribuicao + Valores.Multa + Valores.Acrescimo);


      qrlNum_Documento.Caption := StrZero(IntToStr(Numero_Documento), 8);

      qrlTotal2.Caption := qrlTotal1.Caption;

      qrlTotal3.Caption := qrlValor1.Caption;

      qrlValor2.Caption      :=  qrlValor1.Caption;
      qrlAbatimento2.Caption :=  qrlAbatimento1.Caption;
      qrlDesconto2.Caption   :=  qrlDesconto1.Caption;
      qrlMulta2.Caption      :=  qrlMulta1.Caption;
      qrlCorrecao2.Caption   :=  qrlCorrecao1.Caption;

      qrlRep_Numerica1.Caption := CodigoBarra_CR.LinhaDigitavel_CR;
      qrlRep_Numerica2.Caption := qrlRep_Numerica1.Caption;

      //Alterado COBREG
      {qrlDt_Documento.Caption := DateToStr(Vencimento-5);
      qrlDt_Precessamento.Caption := DateToStr(Vencimento-5);}

      if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
      begin
         qrlDt_Documento.Caption := DateToStr(Vencimento-5);
         qrlDt_Precessamento.Caption := DateToStr(Vencimento-5);
      end
      else
      begin
          qrlDt_Documento.Caption := DateToStr(DataAtual);
          qrlDt_Precessamento.Caption := DateToStr(DataAtual);
      end;

      qrmSacado.Lines.Add(AnsiUpperCase(Sacado.Nome));
      qrmSacado.Lines.Add(AnsiUpperCase(Sacado.Endereco.Rua + ', ' + Sacado.Endereco.Numero + '   ' + Sacado.Endereco.Complemento));
      qrmSacado.Lines.Add(AnsiUpperCase(FormatMaskText('99999-999;0; ',Sacado.Endereco.CEP) + '    ' + Sacado.Endereco.Bairro + '    ' + Sacado.Endereco.Cidade + '    ' + Sacado.Endereco.Estado));

 //     qrmMensagem.Lines.Clear;
   //   qrmMensagem.Lines.AddStrings(Mensagem);
      qrmMensagemContrib1.Lines.AddStrings(MensagemContrib1);


      CodigoBarra_CR.Imagem.Picture.SaveToFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');
      imgCodigoBarras.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');
      DeleteFile(ExtractFilePath(ParamStr(0)) +'boleto.bmp');

   end;

   AInstrucoes.Free;
end;

function TGuias.GerarCodigoBarra_CR: TCodigoBarra_CR;
var
   AValor_Total :Double;
   ACodigoBanco,
   ACodigoMoeda,
   ADigitoCodigoBarras,
   AFatorVencimento,
   AValorDocumento,
   ASICOB,
   AEntidade,
   ACNAE_P1,
   ATP_Entidade,
   ASITCS,
   AContribuinte,
   ACNAE_P2,
   ACodigoBarras, campolivre: string;
begin
   Result := TCodigoBarra_CR.Create;

   With Valores do
      AValor_Total := Contribuicao - (Abatimento + Deducao) + (Multa + Acrescimo);

   {Primeira parte do código de barras}
   ACodigoBanco := '104';
   ACodigoMoeda := '9';

   // Aqui entra o digito verificador que será calculado no final (1 Posição);

   AFatorVencimento := Formatar(CalcularFatorVencimento(Vencimento),4,false,'0');

   AValorDocumento := FormatCurr('0000000000',AValor_Total*100); {Formata o valor com 10 dígitos, incluindo as casas decimais, mas não mostra o ponto decimal}
  // AValorDocumento := '0000000000';

   //AEntidade := Char_Left(Cedente.SICAS_Simples,6,'0');
   AEntidade := DmBoleto.cdsContaCT_CODCEDENTE.value;
   ATP_Entidade := Converte_Entidade(Tipo_Entidade);
   AContribuinte := Sacado.Contribuinte;

   //campolivre :=   AEntidade + Modulo11(AEntidade,9) + Copy(AContribuinte,3,3) + Copy(AContribuinte,1,1) +
   campolivre :=   AEntidade + DmBoleto.cdsContaCT_CODCEDENTE_DV.value + Copy(AContribuinte,3,3) + Copy(AContribuinte,1,1) +
                   Copy(AContribuinte,6,3)  + Copy(AContribuinte,2,1)  + Copy(AContribuinte,9,9);

   ACodigoBarras :=     ACodigoBanco + ACodigoMoeda + AFatorVencimento + AValorDocumento +
                        campolivre + Modulo11COMZERO(campolivre,9);

   ADigitoCodigoBarras := Modulo11(ACodigoBarras,9);

   Result.Codigo_CR := Copy(ACodigoBarras,1,4) + ADigitoCodigoBarras + Copy(ACodigoBarras,5,length(ACodigoBarras)-4);
end;
function TGuias.GerarPDF_SIGCB_e_PDF(caminho, arquivo: string): integer;
begin

end;

procedure TGuias.Imprimir_CR_e_PDF(nomearquivo: String);
var
   ABoleto : TImp_GRCS_CR;
begin
   ABoleto := TImp_GRCS_CR.Create(nil);
   TRY
      PrepararBoleto_CR(ABoleto);
      ABoleto.ShowProgress := False;
      ABoleto.ReportTitle := 'Guia Sindical ' + Sacado.Contribuinte;
      if GerarPDF_SIGCB(dmconexao.sdsConfigCAMINHONOTIFIC.value,nomearquivo + '.pdf') = 0 then
      begin
          Aviso('Erro ao salvar arquivo PDF. ');
          Exit;
      end;
{      else
      begin
           DMAssociado.PROC_NOTIFIC_I.close;
           DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 4;
           DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
           DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  nomearquivo+'.pdf';
           DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
           DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
           DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
           DMAssociado.PROC_NOTIFIC_I.ExecProc;
           DMAssociado.dsDocsAnexos.dataset.close;
           DMAssociado.dsDocsAnexos.dataset.open;
      end;    }

      ABoleto.Print;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;

procedure TGuias.Visualizar_CR_e_PDF(nomearquivo: String);
var
   ABoleto : TImp_GRCS_CR;
begin
   ABoleto := TImp_GRCS_CR.Create(nil);
   TRY
      PrepararBoleto_CR(ABoleto);
      ABoleto.ShowProgress := False;
      ABoleto.ReportTitle := 'Guia Sindical ' + Sacado.Contribuinte;
      if GerarPDF_SIGCB(dmconexao.sdsConfigCAMINHONOTIFIC.value,nomearquivo + '.pdf') = 0 then
      begin
          Aviso('Erro ao salvar arquivo PDF. ');
          Exit;
      end;
      { DMAssociado.PROC_NOTIFIC_I.close;
       DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 4;
       DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
       DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  nomearquivo+'.pdf';
       DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
       DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
       DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
       DMAssociado.PROC_NOTIFIC_I.ExecProc;    }
      ABoleto.preview;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;

end.


