unit Guias;

interface

uses SysUtils, Classes, ExtCtrls, Graphics;

type
   TTipo_Entidade = (teSindicato, teFederacao, teConfederacao, teCees);

   {Classe para gerar código de barras para boletos}
   TCodigoBarra = class
   private
      fCodigo: string; {Dados que serão incluídos no código de barras}
      function GetLinhaDigitavel : string; {Retorna a representação numérica do código de barras}
      function Define2de5 : string; {Define o formato do código de barras INTERCALADO 2 DE 5, retornando a seqüência de 0 e 1 que será usada para gerar a imagem do código de barras}
      function GetImagem    : TImage; {Gera a imagem do código de barras}
   public
      property Codigo    : string  read fCodigo write fCodigo;
      property LinhaDigitavel : string read GetLinhaDigitavel;
      property Imagem    : TImage read GetImagem;   
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
      fCNAE : string;
   public
      procedure Assign(ACedente: TCedente);
   published
      property CNPJ           : string read fCNPJ write fCNPJ;
      property SICAS_Completo : string read fSICAS_Completo write fSICAS_Completo;
      property SICAS_Simples  : string read fSICAS_Simples write fSICAS_Simples;
      property CNAE           : string read fCNAE write fCNAE;
   end;

   {Dados completos sobre o sacado - Classe derivada de TgbPessoa}
   TContribuinte = string[12];

   TSacado = class(TPessoa)
   private
      fContribuinte      : TContribuinte;
      fContribuinte_Mask : string;
      fCapital_Social    : real;
   public
      procedure Assign(ASacado: TSacado);
   published
      property Contribuinte      : TContribuinte read fContribuinte write fContribuinte;
      property Contribuinte_Mask : string read fContribuinte_Mask write fContribuinte_Mask;
      property Capital_Social    : real read fCapital_Social write fCapital_Social;
   end;

   {Dados sobre os cedentes ou sacados}
   TValores = class(TPersistent)
   private
      fContribuicao,
      fAbatimento,
      fDeducao,
      fMulta,
      fAcrescimo     : real;
   public
      constructor Create;
      destructor  Destroy; override;
      procedure   Assign(AValores: TValores); reintroduce;
   published
      property Contribuicao: real read fContribuicao write fContribuicao;
      property Abatimento  : real read fAbatimento write fAbatimento;
      property Deducao     : real read fDeducao write fDeducao;
      property Multa       : real read fMulta write fMulta;
      property Acrescimo   : real read fAcrescimo write fAcrescimo;
   end;


  TGuias = class(TComponent)
  private
    { Private declarations }
    fVencimento :TDateTime;
    fExercicio :String;
    fMensagem :TStringList;
    fCedente  :TCedente;
    fSacado :TSacado;
    fValores :TValores;
    fEspecie :String;
    fTipo_Entidade :TTipo_Entidade;

 //   procedure PrepararBoleto(ABoleto: TImp_GRCS);
    function  GerarCodigoBarra : TCodigoBarra;
    procedure SetMensagem(Texto: TStringList);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(Owner: TComponent); override;
    destructor  Destroy; override;
    property    CodigoBarra : TCodigoBarra read GerarCodigoBarra;
    procedure   Assign(AGuia: TGuias);
 //   procedure   Visualizar;
 //   procedure   Imprimir;
  published
    { Published declarations }
    property Vencimento         :TDateTime read fVencimento write fVencimento;
    property Exercicio          :string read fExercicio write fExercicio;
    property Mensagem           :TStringList read fMensagem write SetMensagem;
    property Cedente            :TCedente read fCedente write fCedente;
    property Sacado             :TSacado read fSacado write fSacado;
    property Valores            :TValores read fValores write fValores;
    property Especie            :string read fEspecie write fEspecie;
    property Tipo_Entidade      :TTipo_Entidade read fTipo_Entidade write fTipo_Entidade;
  end;

procedure Register;
function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
function Modulo11(Valor: String; Base: Integer = 9; Resto : boolean = false) : string;
function CalcularFatorVencimento(DataDesejada : TDateTime) : string;

implementation

function CalcularFatorVencimento(DataDesejada : TDateTime) : string;
{O fator de vencimento é a quantidade de dias entre 07/Nov/1997 e a data de vencimento do título}
begin
   Result := IntToStr( Trunc(DataDesejada - EncodeDate(1997,10,07)));
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
var
   Campo1, Campo2, Campo3, Campo4: string;
begin
   Campo1 := Copy(Codigo,  1, 11) ;
   Campo1 := Campo1 + Modulo11(Campo1);

   Campo2 := Copy(Codigo, 12, 11);
   Campo2 := Campo2 + Modulo11(Campo2);

   Campo3 := Copy(Codigo, 23, 11);
   Campo3 := Campo3 + Modulo11(Campo3);

   Campo4 := Copy(Codigo, 34, 11);
   Campo4 := Campo4 + Modulo11(Campo4);

   Result := Campo1 + ' - ' + Campo2 + ' - ' + Campo3 + ' - ' + Campo4;
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
   CNAE := ACedente.CNAE;
end;

procedure TSacado.Assign(ASacado: TSacado);
begin
   inherited Assign(ASacado);

   Contribuinte := ASacado.Contribuinte;
   Contribuinte_Mask := ASacado.Contribuinte_Mask;
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
   Exercicio     := AGuia.Exercicio;
   Especie       := AGuia.Especie;
   Tipo_Entidade := AGuia.Tipo_Entidade;
   Vencimento    := AGuia.Vencimento;
   Cedente.Assign(AGuia.Cedente);
   Sacado.Assign(AGuia.Sacado);
   Mensagem.Assign(AGuia.Mensagem);
end;


procedure TGuias.SetMensagem(Texto: TStringList);
begin
   fMensagem.Assign(Texto);
end;

{procedure TGuias.Visualizar;
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
      ABoleto.Print;
      ABoleto.Free;
   EXCEPT
      ABoleto.Free;
      Raise;
   END;
end;  }

////////////////////////////////////////////////////////////
////// termino da criação do componente
////////////////////////////////////////////////////////////

function TGuias.GerarCodigoBarra : TCodigoBarra;
var
   AValor_Total :Real;
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
   AFatorVencimento := Formatar(CalcularFatorVencimento(Vencimento),4,false,'0');
   AValorDocumento := FormatCurr('0000000000',AValor_Total*100); {Formata o valor com 10 dígitos, incluindo as casas decimais, mas não mostra o ponto decimal}
   ASICOB := '97';
   AEntidade := Cedente.SICAS_Simples;
   ACNAE_P1 := Copy(Cedente.CNAE, 1, 1);
   ATP_Entidade := '1';
   ASITCS := '77';
   AContribuinte := Sacado.Contribuinte;
   ACNAE_P2 := Copy(Cedente.CNAE, 2, 2);;

   {Calcula o dígito e completa o código de barras}
   ACodigoBarras := ACodigoBanco + ACodigoMoeda + AFatorVencimento + AValorDocumento + ASICOB +
                    AEntidade + ACNAE_P1 + ATP_Entidade + ASITCS + AContribuinte + ACNAE_P2;

   ADigitoCodigoBarras := Modulo11(ACodigoBarras,9);

//   ADigitoCodigoBarras := Calcula_QBarras(ACodigoBarras);
//   if ADigitoCodigoBarras = '0' then
//      ADigitoCodigoBarras := '1';

   Result.Codigo := Copy(ACodigoBarras,1,4) + ADigitoCodigoBarras + Copy(ACodigoBarras,5,length(ACodigoBarras)-4);
end;

{procedure TGuias.PrepararBoleto(ABoleto: TImp_GRCS);
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

   AInstrucoes.AddStrings(Instrucoes); }

{   with ABoleto do
   begin
      ReportTitle := 'Guia Sindical - ' + ' - Cedente: ' + Cedente.Nome + ' - Sacado: ' + Sacado.Nome;

      {Primeira via do boleto}
{     qrlEmpresa1.Caption := Cedente.Nome;

      txtValorDocumento.Caption := FormatCurr('#,##0.00',ValorDocumento);
      txtInstrucoes.Lines.Clear;
      txtInstrucoes.Lines.AddStrings(AInstrucoes);
      txtValorDescontoAbatimento.Caption := '';
      txtValorDescontoAbatimentoB.Caption := '';
      txtValorMoraMulta.Caption := '';
      txtValorMoraMultaB.Caption := '';
      txtValorCobrado.Caption := '';
      txtSacadoNome.Caption := AnsiUpperCase(Sacado.Nome);
      case Sacado.TipoInscricao of
         tiPessoaFisica  : txtSacadoCPFCGC.Caption := 'CPF: ' + FormatarComMascara('!000\.000\.000\-00;0; ',Sacado.NumeroCPFCGC);
         tiPessoaJuridica: txtSacadoCPFCGC.Caption := 'CNPJ: ' + FormatarComMascara('!00\.000\.000\/0000\-00;0; ',Sacado.NumeroCPFCGC);
         tiOutro         : txtSacadoCPFCGC.Caption := Sacado.NumeroCPFCGC;
      end;
      txtSacadoRuaNumeroComplemento.Caption := AnsiUpperCase(Sacado.Endereco.Rua + ', ' + Sacado.Endereco.Numero + '   ' + Sacado.Endereco.Complemento);
      txtSacadoCEPBairroCidadeEstado.Caption := AnsiUpperCase(FormatarComMascara('00000-000;0; ',Sacado.Endereco.CEP) + '    ' + Sacado.Endereco.Bairro + '    ' + Sacado.Endereco.Cidade + '    ' + Sacado.Endereco.Estado);
      txtCodigoBaixa.Caption := NossoNumero2;
}
      {Segunda via do boleto}
{      txtNomeBanco3.Caption := Cedente.ContaBancaria.Banco.Nome;
      txtCodigoBanco3.Caption := Cedente.ContaBancaria.Banco.Codigo + '-' + Cedente.ContaBancaria.Banco.Digito;
      txtLocalPagamento3.Caption := AnsiUpperCase(LocalPagamento);
      txtDataVencimento3.Caption := FormatDateTime('dd/mm/yyyy',DataVencimento);
      txtNomeCedente3.Caption := AnsiUpperCase(Cedente.Nome);
      txtAgenciaCodigoCedente3.Caption := Agencia2;
      txtDataDocumento3.Caption := FormatDateTime('dd/mm/yyyy',DataDocumento);
      txtNumeroDocumento3.Caption := NumeroDocumento;
      txtEspecieDocumento3.Caption := Especie;
      if AceiteDocumento = adSim then
         txtAceite3.Caption := 'S'
      else
         txtAceite3.Caption := 'N';
      txtDataProcessamento3.Caption := FormatDateTime('dd/mm/yyyy',Now);
      txtNossoNumero3.Caption := NossoNumero2;
      txtUsoBanco3.Caption := '';
      txtCarteira3.Caption := ACarteira;
      txtEspecieMoeda3.Caption := 'R$';
      txtQuantidadeMoeda3.Caption := '';
      txtValorMoeda3.Caption := '';
      txtValorDocumento3.Caption := FormatCurr('#,##0.00',ValorDocumento);
      txtInstrucoes3.Lines.Clear;
      txtInstrucoes3.Lines.AddStrings(AInstrucoes);
      txtValorDescontoAbatimento3.Caption := '';
      txtValorDescontoAbatimentoB3.Caption := '';
      txtValorMoraMulta3.Caption := '';
      txtValorMoraMultaB3.Caption := '';
      txtValorCobrado3.Caption := '';
      txtSacadoNome3.Caption := AnsiUpperCase(Sacado.Nome);
      case Sacado.TipoInscricao of
         tiPessoaFisica  : txtSacadoCPFCGC3.Caption := 'CPF: ' + FormatarComMascara('!000\.000\.000\-00;0; ',Sacado.NumeroCPFCGC);
         tiPessoaJuridica: txtSacadoCPFCGC3.Caption := 'CNPJ: ' + FormatarComMascara('!00\.000\.000\/0000\-00;0; ',Sacado.NumeroCPFCGC);
         tiOutro         : txtSacadoCPFCGC3.Caption := Sacado.NumeroCPFCGC;
      end;
      txtSacadoRuaNumeroComplemento3.Caption := AnsiUpperCase(Sacado.Endereco.Rua + ', ' + Sacado.Endereco.Numero + '   ' + Sacado.Endereco.Complemento);
      txtSacadoCEPBairroCidadeEstado3.Caption := AnsiUpperCase(FormatarComMascara('00000-000;0; ',Sacado.Endereco.CEP) + '    ' + Sacado.Endereco.Bairro + '    ' + Sacado.Endereco.Cidade + '    ' + Sacado.Endereco.Estado);
      txtCodigoBaixa3.Caption := NossoNumero2;
      txtLinhaDigitavel3.Caption := CodigoBarra.LinhaDigitavel; }
    //  imgCodigoBarras.Picture.Assign(CodigoBarra.Imagem.Picture);
   //end;

  // AInstrucoes.Free;
//end;

procedure Register;
begin
  RegisterComponents('GRCS', [TGuias]);
end;




end.

 