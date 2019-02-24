unit gbCob104;

interface

uses
   classes, SysUtils, gbCobranca
     , Variants, MaskUtils, contnrs, DateUtils, JvDateUtil  ;
   

const
   CodigoBanco = '104';
   NomeBanco = 'Caixa Econ�mica Federal';

type

   TgbBanco104 = class(TPersistent)
   private
{$IFNDEF VER120}
      function GerarRemessaCNAB240(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
      function GerarRemessaCNAB240_SIGCB(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
      function GerarRemessaCNAB240_SIGCB_CR_SIND(var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
      function GerarRemessaCNAB240_SIGCB_CR_SIND_NOVA(var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
      function GerarRemessaCNAB240_SIGCB_CR_CONF(var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
      function GerarRemessaCNAB400(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
      function LerRetornoCNAB240(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
      function LerRetorno_BB_MG(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
      function LerRetornoCNAB400(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
{$ENDIF}
   published
      function  GetNomeBanco   : string; {Retorna o nome do banco}
      function  GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string; {Retorna o conte�do da parte vari�vel do c�digo de barras}
      function  CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string; {Calcula o d�gito do NossoNumero, conforme crit�rios definidos por cada banco}
      procedure FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string); {Define o formato como alguns valores ser�o apresentados no boleto }
{$IFNDEF VER120}
      function  LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean; {L� o arquivo retorno recebido do banco}
      function  LerRetorno_bb(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean; {L� o arquivo retorno recebido do banco}
      function  GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean; {Gerar arquivo remessa para enviar ao banco}
{$ENDIF}
   end;


implementation

uses UFuncoes, UDMConexao;


function TgbBanco104.GetNomeBanco : string;
begin
   Result := NomeBanco;
end;

function TgbBanco104.CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ADigitoNossoNumero : string;
begin
   Result := '0';
//   if sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-RN' THEN
//      ANossoNumero := COPY(ATitulo.NossoNumero,1,2)+COPY(ATitulo.NossoNumero,4,15)
//   ELSE
     ANossoNumero := COPY(ATitulo.NossoNumero,1,2)+COPY(ATitulo.NossoNumero,3,15);
   ADigitoNossoNumero := Modulo11(ANossoNumero,9);

   Result := ADigitoNossoNumero;
end;

function TgbBanco104.GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ACodigoAgencia,
   ACodigoCedente: string;
begin

   {
    A primeira parte do c�digo de barras ser� calculada automaticamente.
    Ela � composta por:
    C�digo do banco (3 posi��es)
    C�digo da moeda = 9 (1 posi��o)
    D�gito do c�digo de barras (1 posi��o) - Ser� calculado e inclu�do pelo componente
    Fator de vencimento (4 posi��es) - Obrigat�rio a partir de 03/07/2000
    Valor do documento (10 posi��es) - Sem v�rgula decimal e com ZEROS � esquerda

    A segunda parte do c�digo de barras � um campo livre, que varia de acordo
    com o banco. Esse campo livre ser� calculado por esta fun��o (que voc� dever�
    alterar de acordo com as informa��es fornecidas pelo banco).
   }

   {Segunda parte do c�digo de barras - Campo livre - Varia de acordo com o banco}
{   IF (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-PB') OR
      (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-CE') OR
      (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-RS')THEN
   BEGIN
       with ATitulo do
       begin
          ANossoNumero := Formatar(NossoNumero,10,false,'0');
          ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
          ACodigoCedente := Formatar(Cedente.CodigoCedente,11,false,'0');
          IF (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-RS')THEN
              ACodigoCedente := '870'+ copy(ACodigoCedente,4,8)
          ELSE
             ACodigoCedente := copy(ACodigoCedente,1,2)+'3'+ copy(ACodigoCedente,4,8);  // apenas para CE e PB
       end;
        Result := ANossoNumero + ACodigoAgencia + ACodigoCedente;
   END
   ELSE
   IF (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-RN')  THEN
   BEGIN
 }      with ATitulo do
       begin
          ANossoNumero := COPY(NossoNumero,3,3)+ COPY(NossoNumero,1,1)+COPY(NossoNumero,6,3)+COPY(NossoNumero,2,1)+COPY(NossoNumero,9,9);
          ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
          ACodigoCedente := Formatar(Cedente.CodigoCedente,6,false,'0') ;
         //CodigoCedente := ACodigoCedente +  Modulo11(ACodigoCedente);
          ACodigoCedente := ACodigoCedente + Cedente.DigitoCodigoCedente;
       end;
       Result := ACodigoCedente + ANossoNumero + Modulo11(ACodigoCedente + ANossoNumero);
 {  END
   ELSE
   IF (SISTEMA.cdsEmpresaEMP_NOME_ABREV.VALUE = 'CORE-MG') THEN
   BEGIN
       with ATitulo do
       begin
          ANossoNumero := COPY(NossoNumero,3,3)+ COPY(NossoNumero,1,1)+COPY(NossoNumero,6,3)+COPY(NossoNumero,2,1)+COPY(NossoNumero,9,9);
          ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
          ACodigoCedente := Formatar(Cedente.CodigoCedente,6,false,'0') ;
          ACodigoCedente := ACodigoCedente + Modulo11(ACodigoCedente);
       end;
       Result := ACodigoCedente + ANossoNumero + Modulo11(ACodigoCedente + ANossoNumero);
   END }

end;

procedure TgbBanco104.FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string);
Var
  S : String;
begin
   with ATitulo do
   begin
      S := Formatar(Cedente.CodigoCedente,11,false,'0');
//      if Sistema.cdsEmpresaEMP_NOME_ABREV.value='CORE-RS' THEN
//           S := '870/' + Copy (s,4,255)
//      else
          S := Copy (s,1,2) + '3/' + Copy (s,4,255);
      AAgenciaCodigoCedente := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0') + '.' +  S + '-' + Cedente.DigitoCodigoCedente;
      ANossoNumero := Formatar(NossoNumero,10,false,'0') + '-' + DigitoNossoNumero;
      ACarteira := Formatar(Carteira,3);
      case EspecieDocumento of
         edApoliceSeguro                : AEspecieDocumento := 'AP';
         edCheque                       : AEspecieDocumento := 'CH';
         edDuplicataMercantil           : AEspecieDocumento := 'DM';
         edDuplicataMercantialIndicacao : AEspecieDocumento := 'DMI';
         edDuplicataRural               : AEspecieDocumento := 'DR';
         edDuplicataServico             : AEspecieDocumento := 'DS';
         edDuplicataServicoIndicacao    : AEspecieDocumento := 'DSI';
         edFatura                       : AEspecieDocumento := 'FAT';
         edLetraCambio                  : AEspecieDocumento := 'LC';
         edMensalidadeEscolar           : AEspecieDocumento := 'ME';
         edNotaCreditoComercial         : AEspecieDocumento := 'NCC';
         edNotaCreditoExportacao        : AEspecieDocumento := 'NCE';
         edNotaCreditoIndustrial        : AEspecieDocumento := 'NCI';
         edNotaCreditoRural             : AEspecieDocumento := 'NCR';
         edNotaDebito                   : AEspecieDocumento := 'ND';
         edNotaPromissoria              : AEspecieDocumento := 'NP';
         edNotaPromissoriaRural         : AEspecieDocumento := 'NPR';
         edNotaSeguro                   : AEspecieDocumento := 'NS';
         edParcelaConsorcio             : AEspecieDocumento := 'PC';
         edRecibo                       : AEspecieDocumento := 'RC';
         edTriplicataMercantil          : AEspecieDocumento := 'TM';
         edTriplicataServico            : AEspecieDocumento := 'TS'
      else
         AEspecieDocumento := '';
      end;
   end;
end;


{$IFNDEF VER120}

function TgbBanco104.GerarRemessaCNAB240(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
var
   ACedenteTipoInscricao, ASacadoTipoInscricao,
   Registro : string;
   NumeroRegistro, NumeroLote : integer;
begin
   Result := FALSE;
   NumeroRegistro := 0;
   NumeroLote := 1;
   Registro := '';
   Remessa.Clear;

   if ACobranca.Titulos.Count < 1 then
      Exception.Create('N�o h� t�tulos para gerar remessa');

   with ACobranca do
   begin

      { GERAR REGISTRO-HEADER DO ARQUIVO }

      case Titulos[NumeroRegistro].Cedente.TipoInscricao of
         tiPessoaFisica  : ACedenteTipoInscricao := '1';
         tiPessoaJuridica: ACedenteTipoInscricao := '2';
         tiOutro         : ACedenteTipoInscricao := '3';
      end;

      if Formatar(CodigoBanco,3,false,'0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') then
         Raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)',[Titulos[NumeroRegistro].NossoNumero,CodigoBanco,NomeBanco]);

      Registro := Formatar(CodigoBanco,3,false,'0'); {1 a 3 - C�digo do banco}
      Registro := Registro + '0000'; {4 a 7 - Lote de servi�o}
      Registro := Registro + '0'; {8 - Tipo de registro - Registro header de arquivo}
      Registro := Registro + Formatar(' ',9); {9 a 17 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,14,false,'0'); {19 a 32 - N�mero de inscri��o do cedente}

      {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0'); {33 a 36 - C�digo da ag�ncia}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,11,false,'0'); {37 a 47 - C�digo do conv�nio no banco}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.DigitoCodigoCedente,1,false,'0'); {48 - D�gito do c�digo do conv�nio no banco}

      Registro := Registro + Formatar('',4); {49 a 52 - Uso exclusivo CAIXA}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {53 a 57 - C�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {58 - D�gito do c�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0'); {59 a 70 - C�digo da conta corrente vinculada � cobran�a / n�o � o n�mero da conta corrente comum}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1,false,'0'); {71 - D�gito da conta corrente vinculada � cobran�a}
      Registro := Registro + Modulo11(Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0')); {72 - D�gito verificador da ag�ncia / conta do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' '); {73 a 102 - Nome do cedente}
      Registro := Registro + Formatar('CAIXA ECONOMICA FEDERAL',30,true,' '); {103 a 132 - Nome do banco}
      Registro := Registro + Formatar('',10); {133 a 142 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + '1'; {143 - C�digo de Remessa (1) / Retorno (2)}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {144 a 151 - Data do de gera��o do arquivo}
      Registro := Registro + FormatDateTime('hhmmss',DataArquivo);  {152 a 157 - Hora de gera��o do arquivo}
      Registro := Registro + Formatar(IntToStr(NumeroArquivo),6,false,'0'); {158 a 163 N�mero seq�encial do arquivo}
      Registro := Registro + '030'; {164 a 166 - N�mero da vers�o do layout do arquivo}
      Registro := Registro + Formatar('',5,false,'0'); {167 a 171 - Densidade de grava��o do arquivo (BPI)}
      Registro := Registro + Formatar('',20); {172 a 191 - Uso reservado do banco}
     // if TipoMovimento = tmRemessaTeste then
         Registro := Registro + Formatar('REMESSA-TESTE',20) {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes};
     // else
     //    Registro := Registro + Formatar('REMESSA-PRODUCAO',20); {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}
      Registro := Registro + Formatar('',29); {212 a 240 - Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

      {GERAR REGISTRO HEADER DO LOTE}
      Registro := Formatar(CodigoBanco,3,false,'0'); {1a 3 - C�digo do banco}
      Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {4 a 7 - N�mero do lote de servi�o}
      Registro := Registro + '1'; {8 - Tipo do registro - Registro header de lote}
      Registro := Registro + 'R'; {9 - Tipo de opera��o: R (Remessa) ou T (Retorno)}
      Registro := Registro + '01'; {10 a 11 - Tipo de servi�o: 01 (Cobran�a)}
      Registro := Registro + '00'; {12 a 13 - Forma de lan�amento: preencher com ZEROS no caso de cobran�a}
      Registro := Registro + '020'; {14 a 16 - N�mero da vers�o do layout do lote}
      Registro := Registro + ' '; {17 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,15,false,'0'); {19 a 33 - N�mero de inscri��o do cedente}

      {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0'); {34 a 37 - C�digo da ag�ncia}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,11,false,'0'); {38 a 48 - C�digo do conv�nio no banco}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.DigitoCodigoCedente,1,false,'0'); {49 - D�gito do c�digo do conv�nio no banco}

      Registro := Registro + Formatar('',4); {50 a 53 - Uso exclusivo CAIXA}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {54 a 58 - C�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {59 - D�gito da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0'); {60 a 71 - N�mero da conta vinculada � cobran�a / n�o � o n�mero da conta corrente comum}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1,false,'0'); {72 - D�gito do c�digo do cedente no banco}
      Registro := Registro + Modulo11(Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0')); {73 - D�gito verificador da ag�ncia / conta}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' '); {74 a 103 - Nome do cedente}
      Registro := Registro + Formatar('',40); {104 a 143 - Mensagem 1 para todos os boletos do lote}
      Registro := Registro + Formatar('',40); {144 a 183 - Mensagem 2 para todos os boletos do lote}
      Registro := Registro + Formatar(IntToStr(NumeroArquivo),8,false,'0'); {184 a 191 - N�mero do arquivo}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {192 a 199 - Data de gera��o do arquivo}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {200 a 207 - Data do cr�dito - Informar a mesma data da grava��o do arquivo}
      Registro := Registro + Formatar('',33); {208 a 240 - Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

      { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
      while NumeroRegistro <= (Titulos.Count - 1) do
      begin

         if Formatar(CodigoBanco,3,false,'0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') then
            Raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)',[Titulos[NumeroRegistro].NossoNumero,CodigoBanco,NomeBanco]);

         {SEGMENTO P}
         if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') <> Formatar(CodigoBanco,3,false,'0') then
            Raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s',[CodigoBanco,NomeBanco]);

         case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica  : ACedenteTipoInscricao := '1';
            tiPessoaJuridica: ACedenteTipoInscricao := '2';
            tiOutro         : ACedenteTipoInscricao := '9';
         end;

         Registro := Formatar(CodigoBanco,3,false,'0'); {1 a 3 - C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {4 a 7 - N�mero do lote}
         Registro := Registro + '3'; {8 - Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(2*NumeroRegistro+1),5,false,'0'); {9 a 13 - N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'P'; {14 - C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {15 - Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {16 a 17 - C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {18 a 22 - Ag�ncia mantenedora da conta}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {23 - D�gito verificador da ag�ncia}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0'); {24 a 35 - N�mero da conta vinculada � cobran�a / n�o � o n�mero da conta corrente comum}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1,false,'0'); {36 - D�gito da conta vinculada � cobran�a}
         Registro := Registro + Modulo11(Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,12,false,'0')); {37 - D�gito verificador da ag�ncia / conta}
         Registro := Registro + Formatar('',9); {38 a 46 - Uso exclusivo CAIXA: Brancos}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].NossoNumero,11,false,'0'); {47 a 57 - Nosso n�mero - identifica��o do t�tulo no banco}
         Registro := Registro + '1'; {58 - Cobran�a Simples}
         Registro := Registro + '1'; {59 - Forma de cadastramento do t�tulo no banco: com cadastramento}
         Registro := Registro + '2'; {60 - Tipo de documento: Escritural}
         case Titulos[NumeroRegistro].EmissaoBoleto of {61 a 62 - Quem emite e quem distribui o boleto?}
            ebBancoEmite      : Registro := Registro + '1' + '1';
            ebClienteEmite    : Registro := Registro + '2' + '2';
            ebBancoReemite    : Registro := Registro + '4' + '1';
            ebBancoNaoReemite : Registro := Registro + '5' + '2';
         else
            Raise Exception.CreateFmt('Identifica��o inv�lida de emiss�o de boleto em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].EmissaoBoleto}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].SeuNumero,11,false,'0'); {63 a 73 - N�mero que identifica o t�tulo na empresa}
         Registro := Registro + Formatar('',4); {74 a 77 - Uso exclusivo CAIXA: Brancos}
         Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {78 a 85 - Data de vencimento do t�tulo}
         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorDocumento * 100); {86 a 100 - Valor nominal do t�tulo}
         Registro := Registro + '00000'; {101 a 105 - Ag�ncia cobradora. Deixar zerado. A Caixa determinar� automaticamente pelo CEP do sacado}
         Registro := Registro + '0'; {106 - D�gito da ag�ncia cobradora}
         case Titulos[NumeroRegistro].EspecieDocumento of {107 a 108 - Esp�cie do documento}
            edApoliceSeguro                : Registro := Registro + '20'; {AP  AP�LICE DE SEGURO}
            edCheque                       : Registro := Registro + '01'; {CH  CHEQUE}
            edDuplicataMercantil           : Registro := Registro + '02'; {DM  DUPLICATA MERCANTIL}
            edDuplicataMercantialIndicacao : Registro := Registro + '03'; {DMI DUPLICATA MERCANTIL P/ INDICA��O}
            edDuplicataRural               : Registro := Registro + '06'; {DR  DUPLICATA RURAL}
            edDuplicataServico             : Registro := Registro + '04'; {DS  DUPLICATA DE SERVI�O}
            edDuplicataServicoIndicacao    : Registro := Registro + '05'; {DSI DUPLICATA DE SERVI�O P/ INDICA��O}
            edFatura                       : Registro := Registro + '18'; {FAT FATURA}
            edLetraCambio                  : Registro := Registro + '07'; {LC  LETRA DE C�MBIO}
            edMensalidadeEscolar           : Registro := Registro + '21'; {ME  MENSALIDADE ESCOLAR}
            edNotaCreditoComercial         : Registro := Registro + '08'; {NCC NOTA DE CR�DITO COMERCIAL}
            edNotaCreditoExportacao        : Registro := Registro + '09'; {NCE NOTA DE CR�DITO A EXPORTA��O}
            edNotaCreditoIndustrial        : Registro := Registro + '10'; {NCI NOTA DE CR�DITO INDUSTRIAL}
            edNotaCreditoRural             : Registro := Registro + '11'; {NCR NOTA DE CR�DITO RURAL}
            edNotaDebito                   : Registro := Registro + '19'; {ND  NOTA DE D�BITO}
            edNotaPromissoria              : Registro := Registro + '12'; {NP  NOTA PROMISS�RIA}
            edNotaPromissoriaRural         : Registro := Registro + '13'; {NPR NOTA PROMISS�RIA RURAL}
            edNotaSeguro                   : Registro := Registro + '16'; {NS  NOTA DE SEGURO}
            edParcelaConsorcio             : Registro := Registro + '22'; {PC  PARCELA DE CONSORCIO}
            edRecibo                       : Registro := Registro + '17'; {RC  RECIBO}
            edTriplicataMercantil          : Registro := Registro + '14'; {TM  TRIPLICATA MERCANTIL}
            edTriplicataServico            : Registro := Registro + '15' {TS  TRIPLICATA DE SERVI�O}
         else
            Registro := Registro + '99'; {OUTROS}
         end; {case Titulos[NumeroRegistro].EspecieDocumento}
         case Titulos[NumeroRegistro].AceiteDocumento of {109 - Identifica��o de t�tulo Aceito / N�o aceito}
            adSim : Registro := Registro + 'A';
            adNao : Registro := Registro + 'N';
         end; {case Titulos[NumeroRegistro].AceiteDocumento}
         Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataDocumento); {110 a 117 - Data da emiss�o do documento}
         if Titulos[NumeroRegistro].ValorMoraJuros > 0 then
         begin
            Registro := Registro + '1'; {118 - C�digo de juros de mora: Valor por dia}
            if Titulos[NumeroRegistro].DataMoraJuros <> Null then
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataMoraJuros) {119 a 126 - Data a partir da qual ser�o cobrados juros}
            else
               Registro := Registro + Formatar('',8,false,'0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorMoraJuros * 100); {127 a 141 - Valor de juros de mora por dia}
         end
         else
         begin
            Registro := Registro + '4'; {118 - C�digo de juros de mora: Acata cadastramento na CAIXA}
            Registro := Registro + Formatar('',8,false,'0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + Formatar('',15,false,'0'); {127 a 141 - Valor de juros de mora por dia}
         end;
         if Titulos[NumeroRegistro].ValorDesconto > 0 then
         begin
            Registro := Registro + '1'; {142 - C�digo de desconto: Valor fixo at� a data informada}
            if Titulos[NumeroRegistro].DataDesconto <> null then
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataDesconto) {143 a 150 - Data do desconto}
            else
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {143 a 150 - se n�o houver desconto, deve ser informada a mesma data do vencimento}
            Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorDesconto * 100); {151 a 165 - Valor do desconto por dia}
         end
         else
         begin
            Registro := Registro + '0'; {142 - C�digo de desconto: Sem desconto}
            Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {143 a 150 - se n�o houver desconto, deve ser informada a mesma data do vencimento}
            Registro := Registro + Formatar('',15,false,'0'); {151 a 165 - Valor do desconto por dia}
         end;
         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorIOF * 100); {166 a 180 - Valor do IOF a ser recolhido}
         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorAbatimento * 100); {181 a 195 - Valor do abatimento}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].SeuNumero,25); {196 a 220 - Identifica��o do t�tulo na empresa}
         if (Titulos[NumeroRegistro].DataProtesto <> null) and (Titulos[NumeroRegistro].DataProtesto > Titulos[NumeroRegistro].DataVencimento) then
         begin
            Registro := Registro + '1'; {221 - C�digo de protesto: Protestar em XX dias corridos}
            Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataProtesto, Titulos[NumeroRegistro].DataVencimento)),2,false,'0'); {222 a 223 - Prazo para protesto (em dias corridos)}
         end
         else
         begin
            Registro := Registro + '3'; {221 - C�digo de protesto: N�o protestar}
            Registro := Registro + Formatar('',2,false,'0'); {222 a 223 - Prazo para protesto (em dias corridos)}
         end;
         if (Titulos[NumeroRegistro].DataBaixa <> null) and (Titulos[NumeroRegistro].DataBaixa > Titulos[NumeroRegistro].DataVencimento) then
         begin
            Registro := Registro + '1'; {224 - C�digo para baixa/devolu��o: Baixar/devolver}
            Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataBaixa,Titulos[NumeroRegistro].DataVencimento)),3,false,'0'); {225 a 227 - Prazo para baixa/devolu��o (em dias corridos)}
         end
         else
         begin
            Registro := Registro + '2'; {224 - C�digo para baixa/devolu��o: N�o baixar/n�o devolver}
            Registro := Registro + Formatar('',3,false,'0'); {Prazo para baixa/devolu��o (225 a 227 - em dias corridos)}
         end;
         Registro := Registro + '09'; {228 a 229 - C�digo da moeda: Real}
         Registro := Registro + Formatar('',10); {230 a 239 - Uso exclusivo FEBRABAN/CNAB}
         Registro := Registro + Formatar('',1); {240 - Uso exclusivo FEBRABAN/CNAB}

         Remessa.Add(Registro);
         Registro := '';

         {SEGMENTO Q}
         case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica  : ASacadoTipoInscricao := '1';
            tiPessoaJuridica: ASacadoTipoInscricao := '2';
            tiOutro         : ASacadoTipoInscricao := '9';
         end;

         Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
         Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(2*NumeroRegistro+2),5,false,'0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'Q'; {C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}
         {Dados do sacado}
         Registro := Registro + Formatar(ASacadoTipoInscricao,1,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC,15,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua+' '+Titulos[NumeroRegistro].Sacado.Endereco.Numero+' '+Titulos[NumeroRegistro].Sacado.Endereco.Complemento,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro,15);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP,8,true,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade,15,true);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado,2,false);
         {Dados do sacador/avalista}
         Registro := Registro + '0'; {Tipo de inscri��o: N�o informado}
         Registro := Registro + Formatar('',15,false,'0'); {N�mero de inscri��o}
         Registro := Registro + Formatar('',40); {Nome do sacador/avalista}

         Registro := Registro + Formatar('',3); {Uso exclusivo FEBRABAN/CNAB}
         Registro := Registro + Formatar('',20); {Uso exclusivo FEBRABAN/CNAB}
         Registro := Registro + Formatar('',8); {Uso exclusivo FEBRABAN/CNAB}

         Remessa.Add(Registro);
         NumeroRegistro := NumeroRegistro + 1;
      end; {GERAR TODOS OS REGISTROS DETALHE DA REMESSA}

      {REGISTRO TRAILER DO LOTE}
      Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
      Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
      Registro := Registro + '5'; {Tipo do registro: Registro trailer do lote}
      Registro := Registro + Formatar('',9); {Uso exclusivo FEBRABAN/CNAB}
      {Quantidade de registros do lote, incluindo header e trailer do lote.
       At� este momento Remessa cont�m:
       1 registro header de arquivo - � preciso exclu�-lo desta contagem
       1 registro header de lote
       Diversos registros detalhe
       Falta incluir 1 registro trailer de lote
       Ou seja Quantidade = Remessa.Count - 1 header de arquivo + 1 trailer de lote = Remessa.Count}
      Registro := Registro + Formatar(IntToStr(Remessa.Count),6,false,'0');
      {Totaliza��o da cobran�a simples - S� � usado no arquivo retorno}
      Registro := Registro + Formatar('',6,false,'0'); {Quantidade t�tulos em cobran�a}
      Registro := Registro + Formatar('',17,false,'0'); {Valor dos t�tulos em carteiras}
      {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar('',23); {Uso exclusivo FEBRABAN/CNAB}
      {Totaliza��o da cobran�a caucionada - S� � usado no arquivo retorno}
      Registro := Registro + Formatar('',6,false,'0'); {Quantidade t�tulos em cobran�a}
      Registro := Registro + Formatar('',17,false,'0'); {Valor dos t�tulos em carteiras}
      {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar('',31); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar('',117); {Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

      {GERAR REGISTRO TRAILER DO ARQUIVO}
      Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
      Registro := Registro + '9999'; {Lote de servi�o}
      Registro := Registro + '9'; {Tipo do registro: Registro trailer do arquivo}
      Registro := Registro + Formatar('',9); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar(IntToStr(NumeroLote),6,false,'0'); {Quantidade de lotes do arquivo}
      Registro := Registro + Formatar(IntToStr(Remessa.Count + 1),6,false,'0'); {Quantidade de registros do arquivo, inclusive este registro que est� sendo criado agora}
      Registro := Registro + Formatar('',6); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar('',205); {Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
   end;

   Result := TRUE;
end;

function TgbBanco104.GerarRemessaCNAB400(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
var
   ACedenteTipoInscricao, ASacadoTipoInscricao,
   Registro : string;
   NumeroRegistro, X : integer;
begin
   Result := FALSE;
   NumeroRegistro := 0;
   Remessa.Clear;

   with ACobranca do
   begin

      { GERAR REGISTRO-HEADER DA REMESSA }

     Remessa.Add('01REMESSA'+'01'+Formatar('COBRANCA',15)+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,11,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1)+Formatar('',4)+Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' ')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0')+Formatar('C ECON FEDERAL',15,true,' ')+FormatDateTime('ddmmyy',DataArquivo)+Formatar('',289)+Formatar(IntToStr(NumeroArquivo),5,false,'0')+'000001');
      X:=2;
      { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
      while NumeroRegistro <= (Titulos.Count - 1) do
      begin
         if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') <> Formatar(CodigoBanco,3,false,'0') then
            Raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s',[CodigoBanco,NomeBanco]);
         case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica  : ACedenteTipoInscricao := '01';
            tiPessoaJuridica: ACedenteTipoInscricao := '02';
            tiOutro         : ACedenteTipoInscricao := '03';
         end;
         case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica  : ASacadoTipoInscricao := '01';
            tiPessoaJuridica: ASacadoTipoInscricao := '02';
            tiOutro         : ASacadoTipoInscricao := '03';
         end;
         Registro := '';

         { REGISTRO TIPO 1 }
         Registro := '1';
         Registro := Registro + Formatar(ACedenteTipoInscricao,2,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,14,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,11,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1);
         Registro := Registro + Formatar(' ',2);
         Registro := Registro + '00';
         Registro := Registro + Formatar(Titulos[NumeroRegistro].SeuNumero,25,true,' ');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].NossoNumero,10,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].DigitoNossoNumero,1,false,'0');
         Registro := Registro + Formatar(' ',3);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[0],30,True,' ');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Carteira,2,false,'0');
         Registro := Registro + '01';
         Registro := Registro + copy(Titulos[NumeroRegistro].SeuNumero,2,6)+copy(Titulos[NumeroRegistro].SeuNumero,9,4);
         Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataVencimento);
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorDocumento * 100);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0');
         Registro := Registro + Formatar(' ',5,false,'0');
         Registro := Registro + '09';
         Registro := Registro + 'N';
         Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataDocumento);
         Registro := Registro + Formatar(' ',2);
         Registro := Registro + Formatar('0',2);
         Registro := Registro + Formatar(' ',13,false,'0');
         Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataVencimento);
         Registro := Registro + Formatar(' ',13,false,'0');
         Registro := Registro + Formatar(' ',13,false,'0');
         Registro := Registro + Formatar(' ',13,false,'0');
         Registro := Registro + Formatar(ASacadoTipoInscricao,2,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC,14,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome,40, true, ' ');
//         Registro := Registro + Formatar(' ',5);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua+' '+Titulos[NumeroRegistro].Sacado.Endereco.Numero+' '+Titulos[NumeroRegistro].Sacado.Endereco.Complemento,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro,12);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP,8,true,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade,15,true);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado,2,false);
         Registro := Registro + Formatar(' ',6,false,'0');
         Registro := Registro + Formatar(' ',10,false,'0');
         Registro := Registro + Formatar(' ',22);
         Registro := Registro + '01';
         Registro := Registro + '00';
         Registro := Registro + '1';
        // Registro := Registro + Formatar(IntToStr(NumeroRegistro+2),6,false,'0');
        Registro := Registro + Formatar(IntToStr(X),6,false,'0');

         Remessa.Add(Registro);

         Registro := '';
         X:=X+1;

         { REGISTRO TIPO 2 }
         Registro := '2';
         Registro := Registro + Formatar(ACedenteTipoInscricao,2,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,14,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,11,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1);
         Registro := Registro + Formatar(' ',29);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].NossoNumero,10,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].DigitoNossoNumero,1,false,'0');
         Registro := Registro + Formatar(' ',33);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Carteira,2,false,'0');
         Registro := Registro + '01';
         Registro := Registro + Formatar(' ',29);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[1],40,True,' '); { mensagem 2 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[2],40,True,' '); { mensagem 3 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[3],40,True,' '); { mensagem 4 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[4],40,True,' '); { mensagem 5 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[5],40,True,' '); { mensagem 6 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[6],40,True,' '); { mensagem 7 }
         Registro := Registro + Formatar(' ',12);
        //Registro := Registro + Formatar(IntToStr(NumeroRegistro+3),6,false,'0');
         Registro := Registro + Formatar(IntToStr(X),6,false,'0');

         Remessa.Add(Registro);
         X:=X+1;
         NumeroRegistro := NumeroRegistro + 1;
      end;

      { GERAR REGISTRO TRAILER DA REMESSA }

      Remessa.Add('9'+Formatar(' ',393)+Formatar(IntToStr(x),6,false,'0'));

   end;

   Result := TRUE;
end;

function TgbBanco104.GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
begin
  if tipocobr = 'C' then
     Result := GerarRemessaCNAB240_SIGCB_CR_CONF(ACobranca, Remessa)
  else
  if tipocobr = 'S' then
      Result :=  GerarRemessaCNAB240_SIGCB_CR_SIND_NOVA(ACobranca, Remessa);

     //antiga ate 05/10/2017
     //Result := GerarRemessaCNAB240_SIGCB_CR_SIND(ACobranca, Remessa);

end;

function TgbBanco104.LerRetornoCNAB240(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
var
   ACodigoBanco,
   ANomeCedente,
   ATipoInscricao,
   ANumeroCPFCGC,
   ACodigoCedente,
   ADigitoCodigoCedente,
   ACodigoAgencia,
   ADigitoCodigoAgencia,
   ANumeroConta,
   ADigitoNumeroConta : string;
   NumeroRegistro : integer;
   ATitulo : TgbTitulo;
begin
   NumeroRegistro := 0;
   ATitulo := TgbTitulo.Create(nil);

   TRY

      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de t�tulos, antes de incluir os t�tulos do arquivo retorno}

         if Retorno.Count < 4 then
            Raise Exception.Create('O retorno est� vazio. N�o h� dados para processar');

         if length(Retorno[0]) <> 240 then
         begin
            LayoutArquivo := laOutro;
            Raise Exception.CreateFmt('Tamanho de registro diferente de 240 bytes. Tamanho = %d bytes',[length(Retorno[0])]);
         end;

         LayoutArquivo := laCNAB240;

         {Ver se o arquivo � mesmo RETORNO DE COBRAN�A}
         if Copy(Retorno.Strings[NumeroRegistro],143,1) <> '2' then
            Raise Exception.Create(NomeArquivo+' n�o � um arquivo de retorno de cobran�a com layout CNAB240');

         { L� registro HEADER}
         ACodigoBanco := Copy(Retorno.Strings[NumeroRegistro],1,3);
         if ACodigoBanco <> CodigoBanco then
            Raise Exception.CreateFmt('Este n�o � um retorno de cobran�a do banco %s - %s',[CodigoBanco,NomeBanco]);

         if Copy(Retorno.Strings[NumeroRegistro],8,1) <> '0' then
            Raise Exception.Create('Este n�o � um registro HEADER v�lido para arquivo de retorno de cobran�a com layout CNAB240');

         {Dados do cedente do t�tulo}
         ATipoInscricao := Copy(Retorno.Strings[NumeroRegistro],18,1);
         ANumeroCPFCGC := Copy(Retorno.Strings[NumeroRegistro],19,14);
         ACodigoCedente := Copy(Retorno.Strings[NumeroRegistro],33,15);
         ADigitoCodigoCedente := Copy(Retorno.Strings[NumeroRegistro],48,1);
         ACodigoAgencia := Copy(Retorno.Strings[NumeroRegistro],53,5);
         ADigitoCodigoAgencia := Copy(Retorno.Strings[NumeroRegistro],58,1);
         ANumeroConta := Copy(Retorno.Strings[NumeroRegistro],59,12);
         ADigitoNumeroConta := Copy(Retorno.Strings[NumeroRegistro],71,1);
         ANomeCedente := Trim(Copy(Retorno.Strings[NumeroRegistro],73,30));

         NumeroRegistro := 1;

         {L� registro HEADER DE LOTE}
         {Verifica se � um lote de retorno de cobran�a}
         if Copy(Retorno.Strings[NumeroRegistro],9,3) <> 'T01' then
            Raise Exception.Create('Este n�o � um lote de retorno de cobran�a');

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],192,8),8,false,'0') <> '00000000' then
            DataArquivo := EncodeDate(StrToInt(Copy(Retorno.Strings[NumeroRegistro],196,4)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],194,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],192,2)))
         else
            DataArquivo := 0;

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],184,8),8,false,'0') <> '00000000' then
            NumeroArquivo := StrToInt(Trim(Copy(Retorno.Strings[NumeroRegistro],184,8)))
         else
            NumeroArquivo := 0;

         {L� os registros DETALHE}
         NumeroRegistro := NumeroRegistro + 1;
         {L� at� o antepen�ltimo registro porque o pen�ltimo cont�m apenas o TRAILER DO LOTE e o �ltimo cont�m apenas o TRAILER DO ARQUIVO E 2 EM BRANCO }
         while (NumeroRegistro < Retorno.Count - 2) do
         begin
            {Registro detalhe com tipo de segmento = T}
            if Copy(Retorno.Strings[NumeroRegistro],14,1) = 'T' then
            begin
               {Dados do titulo}
               with ATitulo do
               begin
                  OcorrenciaOriginal := Copy(Retorno.Strings[NumeroRegistro],16,2);
                  {Tipo de ocorr�ncia}
                  case StrToInt(OcorrenciaOriginal) of
                     2 : TipoOcorrencia := toRetornoRegistroConfirmado;
                     3 : TipoOcorrencia := toRetornoRegistroRecusado;
                     6 : TipoOcorrencia := toRetornoLiquidado;
                     9 : TipoOcorrencia := toRetornoBaixado;
                     12: TipoOcorrencia := toRetornoRecebimentoInstrucaoConcederAbatimento;
                     13: TipoOcorrencia := toRetornoRecebimentoInstrucaoCancelarAbatimento;
                     14: TipoOcorrencia := toRetornoRecebimentoInstrucaoAlterarVencimento;
                     17: TipoOcorrencia := toRetornoLiquidado;
                     19: TipoOcorrencia := toRetornoRecebimentoInstrucaoProtestar;
                     20: TipoOcorrencia := toRetornoRecebimentoInstrucaoSustarProtesto;
                     23: TipoOcorrencia := toRetornoEncaminhadoACartorio;
                     24: TipoOcorrencia := toRetornoRetiradoDeCartorio;
                     25: TipoOcorrencia := toRetornoProtestado;
                     26: TipoOcorrencia := toRetornoComandoRecusado;
                     27: TipoOcorrencia := toRetornoRecebimentoInstrucaoAlterarDados;
                     28: TipoOcorrencia := toRetornoDebitoTarifas;
                     30: TipoOcorrencia := toRetornoRegistroRecusado;
                     36: TipoOcorrencia := toRetornoRecebimentoInstrucaoConcederDesconto;
                     37: TipoOcorrencia := toRetornoRecebimentoInstrucaoCancelarDesconto;
                     43: TipoOcorrencia := toRetornoProtestoOuSustacaoEstornado;
                     44: TipoOcorrencia := toRetornoBaixaOuLiquidacaoEstornada;
                     45: TipoOcorrencia := toRetornoDadosAlterados;
                  else
                     TipoOcorrencia := toRetornoOutrasOcorrencias;
                  end; {case StrToInt(OcorrenciaOriginal)}

                  if (TipoOcorrencia = toRetornoRegistroRecusado) or (TipoOcorrencia = toRetornoComandoRecusado) then
                  begin
                     MotivoRejeicaoComando := Copy(Retorno.Strings[NumeroRegistro],214,2);
                     case StrToInt(MotivoRejeicaoComando) of
                        01 : MotivoRejeicaoComando := '01 - Codigo do banco invalido';
                        02 : MotivoRejeicaoComando := '02 - C�digo do registro invalido';
                        03 : MotivoRejeicaoComando := '03 - C�digo do segmento invalido';
                        05 : MotivoRejeicaoComando := '05 - C�digo de movimento invalido';
                        06 : MotivoRejeicaoComando := '06 - Tipo/numero de inscricao do cedente invalidos';
                        07 : MotivoRejeicaoComando := '07 - Ag�ncia/Conta/DV invalido';
                        08 : MotivoRejeicaoComando := '08 - Nosso numero invalido';
                        09 : MotivoRejeicaoComando := '09 - Nosso numero duplicado';
                        10 : MotivoRejeicaoComando := '10 - Carteira invalida';
                        11 : MotivoRejeicaoComando := '11 - Forma de cadastramento do titulo invalido';
                        12 : MotivoRejeicaoComando := '12 - Tipo de documento invalido';
                        13 : MotivoRejeicaoComando := '13 - Identificacao da emissao do bloqueto invalida';
                        14 : MotivoRejeicaoComando := '14 - Identificacao da distribuicao do bloqueto invalida';
                        15 : MotivoRejeicaoComando := '15 - Caracteristicas da cobran�a incompativeis';
                        16 : MotivoRejeicaoComando := '16 - Data de vencimento invalida';
                        20 : MotivoRejeicaoComando := '20 - Valor do titulo invalido';
                        21 : MotivoRejeicaoComando := '21 - Especie do titulo invalida';
                        23 : MotivoRejeicaoComando := '23 - Aceite invalido';
                        24 : MotivoRejeicaoComando := '24 - Data da emissao invalida';
                        26 : MotivoRejeicaoComando := '26 - Codigo de juros de mora invalido';
                        27 : MotivoRejeicaoComando := '27 - Valor/Taxa de juros de mora invalido';
                        28 : MotivoRejeicaoComando := '28 - Codigo do desconto invalido';
                        29 : MotivoRejeicaoComando := '29 - Valor do desconto maior ou igual ao valor do titulo';
                        30 : MotivoRejeicaoComando := '30 - Desconto a conceder nao confere';
                        32 : MotivoRejeicaoComando := '32 - Valor do IOF invalido';
                        33 : MotivoRejeicaoComando := '33 - Valor do abatimento invalido';
                        37 : MotivoRejeicaoComando := '37 - Codigo para protesto invalido';
                        38 : MotivoRejeicaoComando := '38 - Prazo para protesto invalido';
                        40 : MotivoRejeicaoComando := '40 - Titulo com ordem de protesto emitida';
                        42 : MotivoRejeicaoComando := '42 - Codigo para baixa/devolucao invalido';
                        43 : MotivoRejeicaoComando := '43 - Prazo para baixa/devolucao invalido';
                        44 : MotivoRejeicaoComando := '44 - Codigo da moeda invalido';
                        45 : MotivoRejeicaoComando := '45 - Nome do sacado nao informado';
                        46 : MotivoRejeicaoComando := '46 - Tipo/numero de inscricao do sacado invalidos';
                        47 : MotivoRejeicaoComando := '47 - Endereco do sacado n�o informado';
                        48 : MotivoRejeicaoComando := '48 - CEP invalido';
                        49 : MotivoRejeicaoComando := '49 - CEP sem praca de cobranca (nao localizado)';
                        52 : MotivoRejeicaoComando := '52 - Unidade da federacao invalida';
                        53 : MotivoRejeicaoComando := '53 - Tipo/numero de inscricao do sacador/avalista invalidos';
                        57 : MotivoRejeicaoComando := '57 - Codigo da multa invalido';
                        58 : MotivoRejeicaoComando := '58 - Data da multa invalida';
                        59 : MotivoRejeicaoComando := '59 - Valor/Percentual da multa invalido';
                        60 : MotivoRejeicaoComando := '60 - Movimento para titulo nao cadastrado';
                        61 : MotivoRejeicaoComando := '61 - Agencia cobradora invalida';
                        62 : MotivoRejeicaoComando := '62 - Tipo de impressao invalido';
                        63 : MotivoRejeicaoComando := '63 - Entrada para titulo ja cadastrado';
                        68 : MotivoRejeicaoComando := '68 - Movimentacao invalida para o titulo';
                        69 : MotivoRejeicaoComando := '69 - Alteracao de dados invalida';
                        70 : MotivoRejeicaoComando := '70 - Apelido do cliente nao cadastrado';
                        71 : MotivoRejeicaoComando := '71 - Erro na composi��o do arquivo';
                        72 : MotivoRejeicaoComando := '72 - Lote de servico invalido';
                        73 : MotivoRejeicaoComando := '73 - Codigo do cedente invalido';
                        74 : MotivoRejeicaoComando := '74 - Cedente nao pertence a cobranca eletronica/apelido nao confere com cedente';
                        75 : MotivoRejeicaoComando := '75 - Nome da empresa invalido';
                        76 : MotivoRejeicaoComando := '76 - Nome do banco invalido';
                        77 : MotivoRejeicaoComando := '77 - Codigo da remessa invalido';
                        78 : MotivoRejeicaoComando := '78 - Data/Hora de geracao do arquivo invalida';
                        79 : MotivoRejeicaoComando := '79 - Numero sequencial do arquivo invalido';
                        80 : MotivoRejeicaoComando := '80 - Numero da versao do Layout do arquivo/lote invalido';
                        81 : MotivoRejeicaoComando := '81 - Literal ''REMESSA-TESTE'' valida somente para fase de testes';
                        82 : MotivoRejeicaoComando := '82 - Literal ''REMESSA-TESTE'' obrigatorio para fase de testes';
                        83 : MotivoRejeicaoComando := '83 - Tipo/numero de inscricao da empresa invalidos';
                        84 : MotivoRejeicaoComando := '84 - Tipo de operacao invalido';
                        85 : MotivoRejeicaoComando := '85 - Tipo de servico invalido';
                        86 : MotivoRejeicaoComando := '86 - Forma de lancamento invalido';
                        87 : MotivoRejeicaoComando := '87 - Numero da remessa invalido';
                        88 : MotivoRejeicaoComando := '88 - Numero da remessa menor/igual que da remessa anterior';
                        89 : MotivoRejeicaoComando := '89 - Lote de servico divergente';
                        90 : MotivoRejeicaoComando := '90 - Numero sequencial do registro invalido';
                        91 : MotivoRejeicaoComando := '91 - Erro na sequ�ncia de segmento do registro detalhe';
                        92 : MotivoRejeicaoComando := '92 - C�digo de movimento divergente entre grupo de segmentos';
                        93 : MotivoRejeicaoComando := '93 - Quantidade de registros no lote invalido';
                        94 : MotivoRejeicaoComando := '94 - Quantidade de registros no lote divergente';
                        95 : MotivoRejeicaoComando := '95 - Quantidade de lotes do arquivo invalido';
                        96 : MotivoRejeicaoComando := '96 - Quantidade de lotes no arquivo divergente';
                        97 : MotivoRejeicaoComando := '97 - Quantidade de registros no arquivo invalido';
                        98 : MotivoRejeicaoComando := '98 - Quantidade de registros no arquivo divergente';
                     else
                        MotivoRejeicaoComando := MotivoRejeicaoComando + ' - Outros motivos'
                     end; {case MotivoRejeicaoComando of}
                  end; {if TipoOcorrencia...}



                  {Nosso n�mero SEM D�GITO}
               {   if (Sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-PB') OR
                    (Sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-CE')  OR
                    (Sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-RS') THEN
                  BEGIN
                      NossoNumero := Copy(Retorno.Strings[NumeroRegistro],47,10);
                      SeuNumero := Copy(Retorno.Strings[NumeroRegistro],59,11);
                  END
                  ELSE
                  IF (Sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-RN') OR (Sistema.cdsEmpresaEMP_NOME_ABREV.value = 'CORE-MG')THEN
                  BEGIN
                  }
                      NossoNumero := Copy(Retorno.Strings[NumeroRegistro],40,17);
                      SeuNumero := Copy(Retorno.Strings[NumeroRegistro],59,11);
                //  END;


                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],74,8),8,false,'0') <> '00000000' then
                     DataVencimento := EncodeDate(StrToInt(Copy(Retorno.Strings[NumeroRegistro],78,4)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],76,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],74,2)))
                  else
                     DataVencimento := 0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],82,15),15,false,'0') <> '000000000000000' then
                     ValorDocumento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],82,15))/100
                  else
                     ValorDocumento := 0.0;


                  {Dados do cedente do t�tulo}
                  with Cedente do
                  begin
                     if ATipoInscricao = '1' then
                        TipoInscricao := tiPessoaFisica
                     else if ATipoInscricao = '2' then
                        TipoInscricao := tiPessoaJuridica
                     else
                        TipoInscricao := tiOutro;
                     NumeroCPFCGC := ANumeroCPFCGC;
                     CodigoCedente := ACodigoCedente;
                     DigitoCodigoCedente := ADigitoCodigoCedente;
                     with ContaBancaria do
                     begin
                        Banco.Codigo := ACodigoBanco;
                        CodigoAgencia := ACodigoAgencia;
                        DigitoAgencia := ADigitoCodigoAgencia;
                        NumeroConta := ANumeroConta;
                        DigitoConta := ADigitoNumeroConta;
                     end;
                     Nome := ANomeCedente;
                  end; {with ACedente}

                  {Dados do sacado do t�tulo}
                  with Sacado do
                  begin
                     if Copy(Retorno.Strings[NumeroRegistro],133,1) = '1' then
                        TipoInscricao := tiPessoaFisica
                     else if Copy(Retorno.Strings[NumeroRegistro],133,1) = '2' then
                        TipoInscricao := tiPessoaJuridica
                     else
                        TipoInscricao := tiOutro;
                     NumeroCPFCGC := Copy(Retorno.Strings[NumeroRegistro],135,14);
                     Nome := Trim(Copy(Retorno.Strings[NumeroRegistro],149,40));
                  end; {with ACedente}

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],199,15),15,false,'0') <> '000000000000000' then
                     ValorDespesaCobranca := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],199,15))/100
                  else
                     ValorDespesaCobranca := 0.0

               end; {with ATitulo}

               NumeroRegistro := NumeroRegistro + 1;
            end; {if Copy(Retorno.Strings[NumeroRegistro],14,1) = 'T'}

            {Registro detalhe com tipo de segmento = U}
            if Copy(Retorno.Strings[NumeroRegistro],14,1) = 'U' then
            begin
               with ATitulo do
               begin
                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],18,15),15,false,'0') <> '000000000000000' then
                     ValorMoraJuros := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],18,15))/100
                  else
                     ValorMoraJuros := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],33,15),15,false,'0') <> '000000000000000' then
                     ValorDesconto := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],33,15))/100
                  else
                     ValorDesconto := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],48,15),15,false,'0') <> '000000000000000' then
                     ValorAbatimento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],48,15))/100
                  else
                     ValorAbatimento := 0.0;

                  iF ValorDesconto = 0 THEN
                     ValorDesconto := ValorAbatimento;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],63,15),15,false,'0') <> '000000000000000' then
                     ValorIOF := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],63,15))/100
                  else
                     ValorIOF := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],78,15),15,false,'0') <> '000000000000000' then
                     ValorPago := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],78,15))/100
                  else
                     ValorPago := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],108,15),15,false,'0') <> '000000000000000' then
                     ValorOutrasDespesas := StrToFloat(Trim(Copy(Retorno.Strings[NumeroRegistro],108,15)))/100
                  else
                     ValorOutrasDespesas := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],123,15),15,false,'0') <> '000000000000000' then
                     ValorOutrosCreditos := StrToFloat(Trim(Copy(Retorno.Strings[NumeroRegistro],123,15)))/100
                  else
                     ValorOutrosCreditos := 0.0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],138,8),8,false,'0') <> '00000000' then
                     DataOcorrencia := EncodeDate(StrToInt(Copy(Retorno.Strings[NumeroRegistro],142,4)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],140,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],138,2)))
                  else
                     DataOcorrencia := 0;

                  if Formatar(Copy(Retorno.Strings[NumeroRegistro],146,8),8,false,'0') <> '00000000' then
                     DataCredito := EncodeDate(StrToInt(Copy(Retorno.Strings[NumeroRegistro],150,4)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],148,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],146,2)))
                  else
                     DataCredito := 0;

               end; {with ATitulo}

               NumeroRegistro := NumeroRegistro + 1;
            end
            ELSE
              NumeroRegistro := NumeroRegistro + 1;
              {Insere o t�tulo}
            Titulos.Add(ATitulo);


         end;

      end;

      ATitulo.Free;
      Result := TRUE
   EXCEPT
      ATitulo.Free;
      Result := FALSE;
      Raise; {Propaga o erro}
   END;
end;


function TgbBanco104.LerRetornoCNAB400(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
var
   ACodigoBanco,
   ANomeCedente,
   ATipoInscricao : string;
   NumeroRegistro : integer;
   ATitulo : TgbTitulo;
begin
   NumeroRegistro := 0;
   ATitulo := TgbTitulo.Create(nil);

   TRY

      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de t�tulos, antes de incluir os t�tulos do arquivo retorno}

         if Retorno.Count < 3 then
            Raise Exception.Create('O retorno est� vazio. N�o h� dados para processar');

         if length(Retorno[0]) <> 400 then
         begin
            LayoutArquivo := laOutro;
            Raise Exception.CreateFmt('Tamanho de registro diferente de 400 bytes. Tamanho = %d bytes',[length(Retorno[0])]);
         end;

         LayoutArquivo := laCNAB400;

         {Ver se o arquivo � mesmo RETORNO DE COBRAN�A}
         if Copy(Retorno.Strings[NumeroRegistro],1,19) <> '02RETORNO01COBRANCA' then
            Raise Exception.Create(NomeArquivo+' n�o � um arquivo de retorno de cobran�a com layout CNAB400');

         { L� registro HEADER}
         ACodigoBanco := Copy(Retorno.Strings[NumeroRegistro],77,3);
         if ACodigoBanco <> CodigoBanco then
            Raise Exception.CreateFmt('Este n�o � um retorno de cobran�a do banco %s - %s',[CodigoBanco,NomeBanco]);

         ANomeCedente := Trim(Copy(Retorno.Strings[NumeroRegistro],47,30));

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],95,6),6,false,'0') <> '000000' then
            if StrToInt(Copy(Retorno.Strings[NumeroRegistro],99,2)) <= 69 then
               DataArquivo := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)))
            else
               DataArquivo := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)))
         else
            DataArquivo := null;

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],390,5),5,false,'0') <> '00000' then
            NumeroArquivo := StrToInt(Trim(Copy(Retorno.Strings[NumeroRegistro],390,5)))
         else
            NumeroArquivo := 0;

         {L� os registros DETALHE}
         {Processa at� o pen�ltimo registro porque o �ltimo cont�m apenas o TRAILLER}
         for NumeroRegistro := 1 to (Retorno.Count - 2) do
         begin
            {Confirmar se o tipo do registro � 1}
            if Copy(Retorno.Strings[NumeroRegistro],1,1) <> '1' then
               Continue; {N�o processa o registro atual}

            { Ler t�tulos do arquivo retorno}
            {Dados do titulo}
            with ATitulo do
            begin
               {Dados do cedente do t�tulo}
               with Cedente do
               begin
                  ATipoInscricao := Copy(Retorno.Strings[NumeroRegistro],2,2);
                  if ATipoInscricao = '01' then
                     TipoInscricao := tiPessoaFisica
                  else if ATipoInscricao = '02' then
                     TipoInscricao := tiPessoaJuridica
                  else
                     TipoInscricao := tiOutro;
                  NumeroCPFCGC := Copy(Retorno.Strings[NumeroRegistro],4,14);
                  ContaBancaria.Banco.Codigo := ACodigoBanco;
                  Nome := ANomeCedente;
               end; {with ACedente}

               NumeroDocumento := Copy(Retorno.Strings[NumeroRegistro],38,25);

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],111,6),6,false,'0') <> '000000' then
                  if StrToInt(Copy(Retorno.Strings[NumeroRegistro],115,2)) <= 69 then
                     DataOcorrencia := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)))
                  else
                     DataOcorrencia := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)))
               else
                  DataOcorrencia := 0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],147,6),6,false,'0') <> '000000' then
                  if StrToInt(Copy(Retorno.Strings[NumeroRegistro],151,2)) <= 69 then
                     DataVencimento := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],151,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],149,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],147,2)))
                  else
                     DataVencimento := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],151,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],149,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],147,2)))
               else
                  DataVencimento := 0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],153,13),13,false,'0') <> '0000000000000' then
                  ValorDocumento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],153,13))/100
               else
                  ValorDocumento := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],215,13),13,false,'0') <> '0000000000000' then
                  ValorIOF := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],215,13))/100
               else
                  ValorIOF := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],228,13),13,false,'0') <> '0000000000000' then
                  ValorAbatimento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],228,13))/100
               else
                  ValorAbatimento := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],241,13),13,false,'0') <> '0000000000000' then
                  ValorDesconto := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],241,13))/100
               else
                  ValorDesconto := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],254,13),13,false,'0') <> '0000000000000' then
                     ValorPago := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],254,13))/100
               else
                     ValorPago := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],267,13),13,false,'0') <> '0000000000000' then
                  ValorMoraJuros := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],267,13))/100
               else
                  ValorMoraJuros := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],280,13),13,false,'0') <> '0000000000000' then
                  ValorOutrosCreditos := StrToFloat(Trim(Copy(Retorno.Strings[NumeroRegistro],280,13)))/100
               else
                  ValorOutrosCreditos := 0.0;



               {Dados que variam de acordo com o banco}

               {Nosso n�mero SEM D�GITO}
               NossoNumero := Copy(Retorno.Strings[NumeroRegistro],63,10);
               Cedente.ContaBancaria.CodigoAgencia := Copy(Retorno.Strings[NumeroRegistro],18,4);
               Cedente.ContaBancaria.NumeroConta := Copy(Retorno.Strings[NumeroRegistro],22,11);
               Cedente.ContaBancaria.DigitoConta := Copy(Retorno.Strings[NumeroRegistro],33,1);

               {Tipo de ocorr�ncia}
               OcorrenciaOriginal := Copy(Retorno.Strings[NumeroRegistro],109,2);
               case StrToInt(OcorrenciaOriginal) of
                  01: TipoOcorrencia := toRetornoRegistroConfirmado;
                  02: TipoOcorrencia := toRetornoBaixado;
                  03: TipoOcorrencia := toRetornoAbatimentoConcedido;
                  04: TipoOcorrencia := toRetornoAbatimentoCancelado;
                  05: TipoOcorrencia := toRetornoVencimentoAlterado;
                  06: TipoOcorrencia := toRetornoDadosAlterados;
                  07: TipoOcorrencia := toRetornoDadosAlterados;
                  08: TipoOcorrencia := toRetornoDadosAlterados;
                  09: TipoOcorrencia := toRetornoDadosAlterados;
                  10: TipoOcorrencia := toRetornoDadosAlterados;
                  11: TipoOcorrencia := toRetornoDadosAlterados;
                  12: TipoOcorrencia := toRetornoDadosAlterados;
                  20: TipoOcorrencia := toRetornoTituloEmSer;
                  21: TipoOcorrencia := toRetornoLiquidado;
                  22: TipoOcorrencia := toRetornoLiquidadoEmCartorio;
                  23: TipoOcorrencia := toRetornoBaixadoPorDevolucao;
                  24: TipoOcorrencia := toRetornoBaixadoFrancoPagamento;
                  25: TipoOcorrencia := toRetornoBaixaPorProtesto;
                  26: TipoOcorrencia := toRetornoEncaminhadoACartorio;
                  27: TipoOcorrencia := toRetornoProtestoSustado;
                  28: TipoOcorrencia := toRetornoProtestoOuSustacaoEstornado;
                  29: TipoOcorrencia := toRetornoProtestoOuSustacaoEstornado;
                  30: TipoOcorrencia := toRetornoDadosAlterados;
                  31: TipoOcorrencia := toRetornoManutencaoTituloVencido;
                  32: TipoOcorrencia := toRetornoDebitoTarifas;
                  33: TipoOcorrencia := toRetornoBaixaOuLiquidacaoEstornada;
                  99: TipoOcorrencia := toRetornoRegistroRecusado;
               else
                  TipoOcorrencia := toRetornoOutrasOcorrencias;
               end; {case StrToInt(ATipoOcorrencia)}

               if (TipoOcorrencia = toRetornoRegistroRecusado) or (TipoOcorrencia = toRetornoComandoRecusado) then
               begin
                  MotivoRejeicaoComando := Copy(Retorno.Strings[NumeroRegistro],80,3);
                  case StrToInt(MotivoRejeicaoComando) of
                     01 : MotivoRejeicaoComando := '01 - Movimento sem Cedente Correspondente';
                     02 : MotivoRejeicaoComando := '02 - Movimento sem Titulo Correspondente';
                     08 : MotivoRejeicaoComando := '08 - Movimento para Titulo j� com Movimentacao no dia';
                     09 : MotivoRejeicaoComando := '09 - Nosso Numero nao Pertence ao Cedente';
                     10 : MotivoRejeicaoComando := '10 - Inclusao de Titulo ja Existente';
                     12 : MotivoRejeicaoComando := '12 - Movimento  Duplicado';
                     13 : MotivoRejeicaoComando := '13 - Entrada Invalida para Cobranca Caucionada (Cedente nao possui conta Caucao)';
                     20 : MotivoRejeicaoComando := '20 - CEP do Sacado nao Encontrado (Nao foi possivel a Determinacao da Agencia Cobradora para o Titulo)';
                     21 : MotivoRejeicaoComando := '21 - Agencia Cobradora nao Encontrada (Agencia Designada para Cobradora nao Cadastrada no Sistema)';
                     45 : MotivoRejeicaoComando := '45 - Data de Vencimento com prazo mais de 1 ano';
                     49 : MotivoRejeicaoComando := '49 - Movimento Invalido para Titulo Baixado/Liquidado';
                     50 : MotivoRejeicaoComando := '50 - Movimento Invalido para Titulo Protestado';
                     54 : MotivoRejeicaoComando := '54 - Faixa de CEP da Agencia Cobradora nao Abrange CEP do Sacado';
                     55 : MotivoRejeicaoComando := '55 - Titulo ja com Opcao de Devolucao';
                     56 : MotivoRejeicaoComando := '56 - Processo de Protesto em Andamento';
                     57 : MotivoRejeicaoComando := '57 - Titulo ja com Opcao de Protesto';
                     58 : MotivoRejeicaoComando := '58 - Processo de Devolucao em Andamento';
                     59 : MotivoRejeicaoComando := '59 - Novo Prazo p/ Protesto/ Devolucao Invalido';
                     76 : MotivoRejeicaoComando := '76 - Alteracao de Prazo de Protesto Invalida';
                     77 : MotivoRejeicaoComando := '77 - Alteracao de  Prazo  de  Devolu��o  Inv�lida';
                     81 : MotivoRejeicaoComando := '81 - CEP  do  Sacado  Inv�lido';
                     82 : MotivoRejeicaoComando := '82 - CGC/CPF  do  Sacado  Inv�lido  (D�gito  n�o  Confere)';
                  else
                     MotivoRejeicaoComando := MotivoRejeicaoComando + ' - Outros motivos'
                  end; {case MotivoRejeicaoComando of}
               end; {if TipoOcorrencia...}

               Carteira := Copy(Retorno.Strings[NumeroRegistro],107,2);

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],176,13),13,false,'0') <> '0000000000000' then
                  ValorDespesaCobranca := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],176,13))/100
               else
                  ValorDespesaCobranca := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],294,6),6,false,'0') <> '000000' then
                  if StrToInt(Copy(Retorno.Strings[NumeroRegistro],298,2)) <= 69 then
                     DataCredito := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],298,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],296,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],294,2)))
                  else
                     DataCredito := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],298,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],296,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],294,2)))
               else
                  DataCredito := 0;

            end; {with ATitulo}

            {Insere o t�tulo}
            Titulos.Add(ATitulo);
         end;
      end;

      ATitulo.Free;
      Result := TRUE
   EXCEPT
      ATitulo.Free;
      Result := FALSE;
      Raise; {Propaga o erro}
   END;
end;


function TgbBanco104.LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
begin
   TRY
      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de t�tulos, antes de incluir os t�tulos do arquivo retorno}

         if Retorno.Count <= 0 then
            Raise Exception.Create('O retorno est� vazio. N�o h� dados para processar');

         case length(Retorno[0]) of
            240 :
               begin
                  LayoutArquivo := laCNAB240;
                  Result := LerRetornoCNAB240(ACobranca, Retorno);
               end;
            400 :
               begin
                  LayoutArquivo := laCNAB400;
                  Result := LerRetornoCNAB400(ACobranca, Retorno);
               end
         else
            begin
               LayoutArquivo := laOutro;
               Raise Exception.CreateFmt('Tamanho de registro inv�lido: %d',[length(Retorno[0])]);
            end;
         end; {case length(Retorno[0])}
      end; {with ACobranca}
   EXCEPT
      Result := FALSE;
      Raise; {Propaga o erro}
   END;
end;

{$ENDIF}

function TgbBanco104.GerarRemessaCNAB240_SIGCB(var ACobranca: TgbCobranca;
  var Remessa: TStringList): boolean;
var
   ACedenteTipoInscricao, ASacadoTipoInscricao,
   Registro : string;
   NumeroRegistro, NumeroLote, X : integer;
begin
   Result := FALSE;
   NumeroRegistro := 0;
   NumeroLote := 1;
   Registro := '';
   Remessa.Clear;
  // Acobranca.DataArquivo := Sistema.DataAtual;
   if ACobranca.Titulos.Count < 1 then
      Exception.Create('N�o h� t�tulos para gerar remessa');
   X:=1;
   with ACobranca do
   begin

      { GERAR REGISTRO-HEADER DO ARQUIVO }

      case Titulos[NumeroRegistro].Cedente.TipoInscricao of
         tiPessoaFisica  : ACedenteTipoInscricao := '1';
         tiPessoaJuridica: ACedenteTipoInscricao := '2';
         tiOutro         : ACedenteTipoInscricao := '3';
      end;

      case Titulos[NumeroRegistro].Sacado.TipoInscricao of
         tiPessoaFisica  : ASacadoTipoInscricao := '1';
         tiPessoaJuridica: ASacadoTipoInscricao := '2';
         tiOutro         : ASacadoTipoInscricao := '3';
      end;

      if Formatar(CodigoBanco,3,false,'0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') then
         Raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)',[Titulos[NumeroRegistro].NossoNumero,CodigoBanco,NomeBanco]);

      Registro := Formatar(CodigoBanco,3,false,'0'); {1 a 3 - C�digo do banco}
      Registro := Registro + '0000'; {4 a 7 - Lote de servi�o}
      Registro := Registro + '0'; {8 - Tipo de registro - Registro header de arquivo}
      Registro := Registro + Formatar(' ',9); {9 a 17 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,14,false,'0'); {19 a 32 - N�mero de inscri��o do cedente}
      Registro := Registro + '00000000000000000000'; // 33 a 52 - Uso Exclusivo CAIXA

      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {53 a 57 - C�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {58 - D�gito do c�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,6,false,'0'); {59 a 64 - C�digo dom cedente no banco}
      Registro := Registro + '00000000'; // 65 a 72 - Uso Exclusivo CAIXA

      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' '); {73 a 102 - Nome do cedente}
      Registro := Registro + Formatar('CAIXA ECONOMICA FEDERAL',30,true,' '); {103 a 132 - Nome do banco}
      Registro := Registro + Formatar(' ',10); {133 a 142 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + '1'; {143 - C�digo de Remessa (1) / Retorno (2)}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {144 a 151 - Data do de gera��o do arquivo}
      Registro := Registro + FormatDateTime('hhmmss',DataArquivo);  {152 a 157 - Hora de gera��o do arquivo}

      Registro := Registro + Formatar(IntToStr(NumeroArquivo),6,false,'0'); {158 a 163 N�mero seq�encial do arquivo}
      Registro := Registro + '050'; {164 a 166 - N�mero da vers�o do layout do arquivo}
      Registro := Registro + Formatar(' ',5,false,'0'); {167 a 171 - Densidade de grava��o do arquivo (BPI)}
      Registro := Registro + Formatar(' ',20); {172 a 191 - Uso reservado do banco}

      TipoMovimento :=tmRemessa;

      if TipoMovimento = tmRemessaTeste then
         Registro := Registro + Formatar('REMESSA-TESTE',20) {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}
      else
        Registro := Registro + Formatar('REMESSA-PRODUCAO',20); //Formatar('',20); {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}

     Registro := Registro + Formatar(' ',29); {212 a 240 - Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

     {GERAR REGISTRO HEADER DO LOTE}
      Registro := Formatar(CodigoBanco,3,false,'0'); {1a 3 - C�digo do banco}
      Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {4 a 7 - N�mero do lote de servi�o}
      Registro := Registro + '1'; {8 - Tipo do registro - Registro header de lote}
      Registro := Registro + 'R'; {9 - Tipo de opera��o: R (Remessa) ou T (Retorno)}
      Registro := Registro + '02'; {10 a 11 - Tipo de servi�o: 01 (Cobran�a)}
      Registro := Registro + '00'; {12 a 13 - Forma de lan�amento: preencher com ZEROS no caso de cobran�a}
      Registro := Registro + '030'; {14 a 16 - N�mero da vers�o do layout do lote}
      Registro := Registro + ' '; {17 - Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,15,false,'0'); {19 a 33 - N�mero de inscri��o do cedente}

      {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,6,false,'0'); {34 a 39 - C�digo do conv�nio no banco}
      Registro := Registro + '00000000000000'; {40 a 53 - Uso exclusivo CAIXA}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {54 a 58 - C�digo da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {59 - D�gito da ag�ncia do cedente}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,6,false,'0'); {60 a 65 - C�digo do Conv�nio no Banco}
      Registro := Registro + '0000000'; {66 a 72 - C�digo do Modelo Personalizado}
      Registro := Registro + Formatar('0',1); {73 - Uso Exclusivo CAIXA}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' '); {74 a 103 - Nome do cedente}

      Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[0],40,True,' '); {104 a 143 - Mensagem 1 para todos os boletos do lote}
      Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[1],40,True,' '); {144 a 183 - Mensagem 2 para todos os boletos do lote}
      Registro := Registro + Formatar(IntToStr(NumeroArquivo),8,false,'0'); {184 a 191 - N�mero do arquivo}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {192 a 199 - Data de gera��o do arquivo}
      Registro := Registro + FormatDateTime('ddmmyyyy',DataArquivo); {200 a 207 - Data do cr�dito - Informar a mesma data da grava��o do arquivo}
      Registro := Registro + Formatar(' ',33); {208 a 240 - Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

      { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
      while NumeroRegistro <= (Titulos.Count - 1) do
      begin

         if Formatar(CodigoBanco,3,false,'0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') then
            Raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)',[Titulos[NumeroRegistro].NossoNumero,CodigoBanco,NomeBanco]);

         {SEGMENTO P}
         if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') <> Formatar(CodigoBanco,3,false,'0') then
            Raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s',[CodigoBanco,NomeBanco]);

         case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica  : ACedenteTipoInscricao := '1';
            tiPessoaJuridica: ACedenteTipoInscricao := '2';
            tiOutro         : ACedenteTipoInscricao := '9';
         end;

         Registro := Formatar(CodigoBanco,3,false,'0'); {1 a 3 - C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {4 a 7 - N�mero do lote}
         Registro := Registro + '3'; {8 - Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(X),5,false,'0'); {9 a 13 - N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'P'; {14 - C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {15 - Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {16 a 17 - C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,5,false,'0'); {18 a 22 - Ag�ncia mantenedora da conta}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia,1,false,'0'); {23 - D�gito verificador da ag�ncia}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente,6,false,'0'); {24 a 29 - C�digo do Conv�nio no Banco}
         Registro := Registro + '00000000000'; {30 a 40 - Uso Exclusivo da CAIXA}
//         if Sistema.cdsEmpresaEMP_NOME_ABREV.value='CORE-RN' THEN
            Registro := Registro + copy(Titulos[NumeroRegistro].NossoNumero,1,2) + copy(Titulos[NumeroRegistro].NossoNumero,4,15); {41 a 57 - modalidade da carteira (24) + Nosso n�mero - identifica��o do t�tulo no banco}
//         ELSE
//            Registro := Registro + Titulos[NumeroRegistro].NossoNumero; {41 a 57 - modalidade da carteira (24) + Nosso n�mero - identifica��o do t�tulo no banco}
         Registro := Registro + '1'; {58 - Cobran�a Simples}
         Registro := Registro + '2'; {59 - Forma de cadastramento do t�tulo no banco: com cadastramento}
         Registro := Registro + '2'; {60 - Tipo de documento: Escritural}
         case Titulos[NumeroRegistro].EmissaoBoleto of {61 a 62 - Quem emite e quem distribui o boleto?}
            ebBancoEmite      : Registro := Registro + '1' + '1';
            ebClienteEmite    : Registro := Registro + '2' + '2';
            ebBancoReemite    : Registro := Registro + '4' + '1';
            ebBancoNaoReemite : Registro := Registro + '5' + '2';
         else
            Raise Exception.CreateFmt('Identifica��o inv�lida de emiss�o de boleto em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].EmissaoBoleto}

         //Registro := Registro + copy(Titulos[NumeroRegistro].SeuNumero,1,7) + copy(Titulos[NumeroRegistro].SeuNumero,9,4); {63 a 73 - N�mero que identifica o t�tulo na empresa}
         Registro := Registro + Titulos[NumeroRegistro].SeuNumero; {63 a 73 - N�mero que identifica o t�tulo na empresa}

         Registro := Registro + '    '; {74 a 77 - Uso exclusivo CAIXA: Brancos}
         Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {78 a 85 - Data de vencimento do t�tulo}
         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorDocumento * 100); {86 a 100 - Valor nominal do t�tulo}
         Registro := Registro + '00000'; {101 a 105 - Ag�ncia cobradora. Deixar zerado. A Caixa determinar� automaticamente pelo CEP do sacado}
         Registro := Registro + '0'; {106 - D�gito da ag�ncia cobradora}
         case Titulos[NumeroRegistro].EspecieDocumento of {107 a 108 - Esp�cie do documento}
            edApoliceSeguro                : Registro := Registro + '20'; {AP  AP�LICE DE SEGURO}
            edCheque                       : Registro := Registro + '01'; {CH  CHEQUE}
            edDuplicataMercantil           : Registro := Registro + '02'; {DM  DUPLICATA MERCANTIL}
            edDuplicataMercantialIndicacao : Registro := Registro + '03'; {DMI DUPLICATA MERCANTIL P/ INDICA��O}
            edDuplicataRural               : Registro := Registro + '06'; {DR  DUPLICATA RURAL}
            edDuplicataServico             : Registro := Registro + '04'; {DS  DUPLICATA DE SERVI�O}
            edDuplicataServicoIndicacao    : Registro := Registro + '05'; {DSI DUPLICATA DE SERVI�O P/ INDICA��O}
            edFatura                       : Registro := Registro + '18'; {FAT FATURA}
            edLetraCambio                  : Registro := Registro + '07'; {LC  LETRA DE C�MBIO}
            edMensalidadeEscolar           : Registro := Registro + '21'; {ME  MENSALIDADE ESCOLAR}
            edNotaCreditoComercial         : Registro := Registro + '08'; {NCC NOTA DE CR�DITO COMERCIAL}
            edNotaCreditoExportacao        : Registro := Registro + '09'; {NCE NOTA DE CR�DITO A EXPORTA��O}
            edNotaCreditoIndustrial        : Registro := Registro + '10'; {NCI NOTA DE CR�DITO INDUSTRIAL}
            edNotaCreditoRural             : Registro := Registro + '11'; {NCR NOTA DE CR�DITO RURAL}
            edNotaDebito                   : Registro := Registro + '19'; {ND  NOTA DE D�BITO}
            edNotaPromissoria              : Registro := Registro + '12'; {NP  NOTA PROMISS�RIA}
            edNotaPromissoriaRural         : Registro := Registro + '13'; {NPR NOTA PROMISS�RIA RURAL}
            edNotaSeguro                   : Registro := Registro + '16'; {NS  NOTA DE SEGURO}
            edParcelaConsorcio             : Registro := Registro + '22'; {PC  PARCELA DE CONSORCIO}
            edRecibo                       : Registro := Registro + '17'; {RC  RECIBO}
            edTriplicataMercantil          : Registro := Registro + '14'; {TM  TRIPLICATA MERCANTIL}
            edTriplicataServico            : Registro := Registro + '15' {TS  TRIPLICATA DE SERVI�O}
         else
            Registro := Registro + '99'; {OUTROS}
         end; {case Titulos[NumeroRegistro].EspecieDocumento}

         case Titulos[NumeroRegistro].AceiteDocumento of {109 - Identifica��o de t�tulo Aceito / N�o aceito}
            adSim : Registro := Registro + 'A';
            adNao : Registro := Registro + 'N';
         end; {case Titulos[NumeroRegistro].AceiteDocumento}

         Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataDocumento); {110 a 117 - Data da emiss�o do documento}

         if Titulos[NumeroRegistro].ValorMoraJuros > 0 then
         begin
            Registro := Registro + '3'; {118 - C�digo de juros de mora: Valor por dia}
            if Titulos[NumeroRegistro].DataMoraJuros <> Null then
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataMoraJuros) {119 a 126 - Data a partir da qual ser�o cobrados juros}
            else
               Registro := Registro + Formatar(' ',8,false,'0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorMoraJuros * 100); {127 a 141 - Valor de juros de mora por dia}
         end
         else
         begin
            Registro := Registro + '3'; {118 - C�digo de juros de mora: Acata cadastramento na CAIXA}
            Registro := Registro + Formatar(' ',8,false,'0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + Formatar(' ',15,false,'0'); {127 a 141 - Valor de juros de mora por dia}
         end;

         if Titulos[NumeroRegistro].ValorDesconto > 0 then
         begin
            Registro := Registro + '1'; {142 - C�digo de desconto: Valor fixo at� a data informada}
            if Titulos[NumeroRegistro].DataDesconto <> null then
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataDesconto) {143 a 150 - Data do desconto}
            else
               Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {143 a 150 - se n�o houver desconto, deve ser informada a mesma data do vencimento}
            Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorDesconto * 100); {151 a 165 - Valor do desconto por dia}
         end
         else
         begin
            Registro := Registro + '0'; {142 - C�digo de desconto: Sem desconto}
            Registro := Registro + FormatDateTime('ddmmyyyy',Titulos[NumeroRegistro].DataVencimento); {143 a 150 - se n�o houver desconto, deve ser informada a mesma data do vencimento}
            Registro := Registro + Formatar(' ',15,false,'0'); {151 a 165 - Valor do desconto por dia}
         end;

         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorIOF * 100); {166 a 180 - Valor do IOF a ser recolhido}

         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorAbatimento * 100); {181 a 195 - Valor do abatimento}

         Registro := Registro + Formatar(STRINGREPLACE(Titulos[NumeroRegistro].SeuNumero,'/','',[RFREPLACEALL]),25); {196 a 220 - Identifica��o do t�tulo na empresa}

         if (Titulos[NumeroRegistro].DataProtesto <> null) and (Titulos[NumeroRegistro].DataProtesto > Titulos[NumeroRegistro].DataVencimento) then
         begin
            Registro := Registro + '1'; {221 - C�digo de protesto: Protestar em XX dias corridos}
            Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataProtesto, Titulos[NumeroRegistro].DataVencimento)),2,false,'0'); {222 a 223 - Prazo para protesto (em dias corridos)}
         end
         else
         begin
            Registro := Registro + '3'; {221 - C�digo de protesto: N�o protestar}
            Registro := Registro + Formatar('',2,false,'0'); {222 a 223 - Prazo para protesto (em dias corridos)}
         end;

         if (Titulos[NumeroRegistro].DataBaixa <> null) and (Titulos[NumeroRegistro].DataBaixa > Titulos[NumeroRegistro].DataVencimento) then
         begin
            Registro := Registro + '1'; {224 - C�digo para baixa/devolu��o: Baixar/devolver}
            Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataBaixa,Titulos[NumeroRegistro].DataVencimento)),3,false,'0'); {225 a 227 - Prazo para baixa/devolu��o (em dias corridos)}
         end
         else
         begin
            Registro := Registro + '2'; {224 - C�digo para baixa/devolu��o: N�o baixar/n�o devolver}
            Registro := Registro + Formatar('',3,false,'0'); {Prazo para baixa/devolu��o (225 a 227 - em dias corridos)}
         end;

         Registro := Registro + '09'; {228 a 229 - C�digo da moeda: Real}

         Registro := Registro + '0000000000'; {230 a 239 - Uso exclusivo Caixa}

         Registro := Registro + Formatar(' ',1); {240 - Uso exclusivo FEBRABAN/CNAB}

         Remessa.Add(Registro);
         Registro := '';
         X:=X+1;

         {SEGMENTO Q}
         case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica  : ASacadoTipoInscricao := '1';
            tiPessoaJuridica: ASacadoTipoInscricao := '2';
            tiOutro         : ASacadoTipoInscricao := '9';
         end;

         Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
         Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(X),5,false,'0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'Q'; {C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}
         {Dados do sacado}
         Registro := Registro + Formatar(ASacadoTipoInscricao,1,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC,15,false,'0');  //19 A 33
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua+' '+Titulos[NumeroRegistro].Sacado.Endereco.Numero+' '+Titulos[NumeroRegistro].Sacado.Endereco.Complemento,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro,15);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP,8,true,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade,15,true);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado,2,false);
         Registro := Registro + Formatar(ASacadoTipoInscricao,1,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC,15,false,'0');

        // Dados do sacador/avalista}
         {Registro := Registro + '000'; //Numero do Banco de Sacado
         Registro := Registro + Formatar(' ',35); {Banco e Codigo
         Registro := Registro + '0'; {Identifica��o Manuten��o
         Registro := Registro + FormatCurr('000000000000000',Titulos[NumeroRegistro].ValorDocumento * 100); {Valor do Titulo

         Registro := Registro + Formatar(' ',2); {Uso exclusivo FEBRABAN/CNAB
         }
         Registro := Registro + Formatar(' ',71); {Uso exclusivo FEBRABAN/CNAB}


         Remessa.Add(Registro);
         Registro := '';
         X:=X+1;



         {SEGMENTO R -  para impress�o da mensagem - instru��o}
         Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
         Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(x),5,false,'0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'R'; {C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}

         registro := Registro + '000000000000000000000000000000000000000000000000000000000000000000000000'; {de 18 a 89}
         registro := Registro + '          ';
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[2],40,True,' '); { mensagem 3 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[3],40,True,' '); { mensagem 4 }
         Registro := Registro + Formatar(' ',50); {Uso exclusivo FEBRABAN/CNAB}
         Registro := Registro + Formatar(' ',11); {Uso exclusivo FEBRABAN/CNAB}

         Remessa.Add(Registro);
         //NumeroRegistro := NumeroRegistro + 1;
         X:=X+1;


         {SEGMENTO S -  para impress�o da mensagem - instru��o}
         Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
         Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
         Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
         Registro := Registro + Formatar(IntToStr(x),5,false,'0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
         Registro := Registro + 'S'; {C�digo do segmento do registro detalhe}
         Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
         case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
            toRemessaRegistrar                 : Registro := Registro + '01';
            toRemessaBaixar                    : Registro := Registro + '02';
            toRemessaConcederAbatimento        : Registro := Registro + '04';
            toRemessaCancelarAbatimento        : Registro := Registro + '05';
            toRemessaConcederDesconto          : Registro := Registro + '07';
            toRemessaCancelarDesconto          : Registro := Registro + '08';
            toRemessaAlterarVencimento         : Registro := Registro + '06';
            toRemessaProtestar                 : Registro := Registro + '09';
            toRemessaCancelarInstrucaoProtesto : Registro := Registro + '10';
            toRemessaDispensarJuros            : Registro := Registro + '31';
            toRemessaAlterarNomeEnderecoSacado : Registro := Registro + '31';
         else
            Raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end; {case Titulos[NumeroRegistro].TipoOcorrencia}

         Registro := Registro + '3'; {Identifica��o da Impress�o}
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[4],40,True,' '); { mensagem 5 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[5],40,True,' '); { mensagem 6 }
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[6],40,True,' '); { mensagem 7 }
         //Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[7],40,True,' '); { mensagem 8 }
         Registro := Registro + Formatar(' ',40);
         Registro := Registro + Formatar(' ',40); {Uso exclusivo FEBRABAN/CNAB}
         Registro := Registro + Formatar(' ',22); {Uso exclusivo FEBRABAN/CNAB}

         Remessa.Add(Registro);
         NumeroRegistro := NumeroRegistro + 1;
         X:=X+1;
      end;

      {REGISTRO TRAILER DO LOTE}
      Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
      Registro := Registro + Formatar(IntToStr(NumeroLote),4,false,'0'); {N�mero do lote}
      Registro := Registro + '5'; {Tipo do registro: Registro trailer do lote}
      Registro := Registro + Formatar('',9); {Uso exclusivo FEBRABAN/CNAB}
      {Quantidade de registros do lote, incluindo header e trailer do lote.
       At� este momento Remessa cont�m:
       1 registro header de arquivo - � preciso exclu�-lo desta contagem
       1 registro header de lote
       Diversos registros detalhe
       Falta incluir 1 registro trailer de lote
       Ou seja Quantidade = Remessa.Count - 1 header de arquivo + 1 trailer de lote = Remessa.Count}
      Registro := Registro + Formatar(IntToStr(Remessa.Count),6,false,'0');
      {Totaliza��o da cobran�a simples - S� � usado no arquivo retorno}
      Registro := Registro + Formatar(' ',6,false,'0'); {Quantidade t�tulos em cobran�a}
      Registro := Registro + Formatar(' ',17,false,'0'); {Valor dos t�tulos em carteiras}
      {Totaliza��o da cobran�a caucionada - S� � usado no arquivo retorno}
      Registro := Registro + Formatar(' ',6,false,'0'); {Quantidade t�tulos em cobran�a}
      Registro := Registro + Formatar(' ',17,false,'0'); {Valor dos t�tulos em carteiras}
      Registro := Registro + Formatar(' ',6,false,'0'); {Quantidade t�tulos em cobran�a}
      Registro := Registro + Formatar(' ',17,false,'0'); {Valor dos t�tulos em carteiras}
      {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar(' ',31); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar(' ',117); {Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
      Registro := '';

      {GERAR REGISTRO TRAILER DO ARQUIVO}
      Registro := Formatar(CodigoBanco,3,false,'0'); {C�digo do banco}
      Registro := Registro + '9999'; {Lote de servi�o}
      Registro := Registro + '9'; {Tipo do registro: Registro trailer do arquivo}
      Registro := Registro + Formatar(' ',9); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar(IntToStr(NumeroLote),6,false,'0'); {Quantidade de lotes do arquivo}
      Registro := Registro + Formatar(IntToStr(Remessa.Count + 1),6,false,'0'); {Quantidade de registros do arquivo, inclusive este registro que est� sendo criado agora}
      Registro := Registro + Formatar(' ',6); {Uso exclusivo FEBRABAN/CNAB}
      Registro := Registro + Formatar(' ',205); {Uso exclusivo FEBRABAN/CNAB}

      Remessa.Add(Registro);
   end;

   Result := TRUE;
end;

function TgbBanco104.LerRetorno_bb(var ACobranca: TgbCobranca;
  Retorno: TStringList): boolean;
begin
   TRY
      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de t�tulos, antes de incluir os t�tulos do arquivo retorno}

         if Retorno.Count <= 0 then
            Raise Exception.Create('O retorno est� vazio. N�o h� dados para processar');

         LayoutArquivo := laCNAB240;
         Result := LerRetorno_BB_MG(ACobranca, Retorno);

      end; {with ACobranca}
   EXCEPT
      Result := FALSE;
      Raise; {Propaga o erro}
   END;
end;

function TgbBanco104.LerRetorno_BB_MG(var ACobranca: TgbCobranca;
  Retorno: TStringList): boolean;
var
   ACodigoBanco,
   ANomeCedente,
   ATipoInscricao,
   ANumeroCPFCGC,
   ACodigoCedente,
   ADigitoCodigoCedente,
   ACodigoAgencia,
   ADigitoCodigoAgencia,
   ANumeroConta,
   ADigitoNumeroConta : string;
   NumeroRegistro : integer;
   ATitulo : TgbTitulo;
begin
  // Sistema.Aviso('Arquivo de Retorno do Banco do Brasil em Desenvolvimento.');

   NumeroRegistro := 0;
   ATitulo := TgbTitulo.Create(nil);

   TRY

      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de t�tulos, antes de incluir os t�tulos do arquivo retorno}

         if Retorno.Count < 3 then
            Raise Exception.Create('O retorno est� vazio. N�o h� dados para processar');

         if length(Retorno[0]) <> 400 then
         begin
            LayoutArquivo := laOutro;
            Raise Exception.CreateFmt('Tamanho de registro diferente de 400 bytes. Tamanho = %d bytes',[length(Retorno[0])]);
         end;

         LayoutArquivo := laCNAB400;

         {Ver se o arquivo � mesmo RETORNO DE COBRAN�A}
         if Copy(Retorno.Strings[NumeroRegistro],1,19) <> '02RETORNO01COBRANCA' then
            Raise Exception.Create(NomeArquivo+' n�o � um arquivo de retorno de cobran�a com layout CNAB400');

         { L� registro HEADER}
         ACodigoBanco := Copy(Retorno.Strings[NumeroRegistro],77,3);
         if ACodigoBanco <> CodigoBanco then
            Raise Exception.CreateFmt('Este n�o � um retorno de cobran�a do banco %s - %s',[CodigoBanco,NomeBanco]);

         ANomeCedente := Trim(Copy(Retorno.Strings[NumeroRegistro],47,30));

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],95,6),6,false,'0') <> '000000' then
            if StrToInt(Copy(Retorno.Strings[NumeroRegistro],99,2)) <= 69 then
               DataArquivo := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)))
            else
               DataArquivo := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)))
         else
            DataArquivo := null;

         if Formatar(Copy(Retorno.Strings[NumeroRegistro],395,5),5,false,'0') <> '00000' then
            NumeroArquivo := StrToInt(Trim(Copy(Retorno.Strings[NumeroRegistro],395,5)))
         else
            NumeroArquivo := 0;

         {L� os registros DETALHE}
         {Processa at� o pen�ltimo registro porque o �ltimo cont�m apenas o TRAILLER}
         for NumeroRegistro := 1 to (Retorno.Count - 2) do
         begin
            {Confirmar se o tipo do registro � 1}
            if Copy(Retorno.Strings[NumeroRegistro],1,1) <> '7' then
               Continue; {N�o processa o registro atual}

            { Ler t�tulos do arquivo retorno}
            {Dados do titulo}
            with ATitulo do
            begin
               {Dados do cedente do t�tulo}
               with Cedente do
               begin
//                  ATipoInscricao := Copy(Retorno.Strings[NumeroRegistro],2,2);
//                  if ATipoInscricao = '01' then
//                     TipoInscricao := tiPessoaFisica
//                  else if ATipoInscricao = '02' then
//                     TipoInscricao := tiPessoaJuridica
//                  else
//                     TipoInscricao := tiOutro;
//                  NumeroCPFCGC := Copy(Retorno.Strings[NumeroRegistro],4,14);
//                  ContaBancaria.Banco.Codigo := ACodigoBanco;
                  Nome := ANomeCedente;
               end; {with ACedente}

               NumeroDocumento := Copy(Retorno.Strings[NumeroRegistro],117,10);

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],111,6),6,false,'0') <> '000000' then
                  if StrToInt(Copy(Retorno.Strings[NumeroRegistro],115,2)) <= 69 then
                     DataOcorrencia := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)))
                  else
                     DataOcorrencia := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)))
               else
                  DataOcorrencia := 0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],153,13),13,false,'0') <> '0000000000000' then
                  ValorDocumento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],153,13))/100
               else
                  ValorDocumento := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],215,13),13,false,'0') <> '0000000000000' then
                  ValorIOF := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],215,13))/100
               else
                  ValorIOF := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],228,13),13,false,'0') <> '0000000000000' then
                  ValorAbatimento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],228,13))/100
               else
                  ValorAbatimento := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],241,13),13,false,'0') <> '0000000000000' then
                  ValorDesconto := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],241,13))/100
               else
                  ValorDesconto := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],267,13),13,false,'0') <> '0000000000000' then
                  ValorMoraJuros := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],267,13))/100
               else
                  ValorMoraJuros := 0.0;

               if Formatar(Copy(Retorno.Strings[NumeroRegistro],280,13),13,false,'0') <> '0000000000000' then
                  ValorOutrosCreditos := StrToFloat(Trim(Copy(Retorno.Strings[NumeroRegistro],280,13)))/100
               else
                  ValorOutrosCreditos := 0.0;

               {Dados que variam de acordo com o banco}

               {Nosso n�mero SEM D�GITO}
               NossoNumero := Copy(Retorno.Strings[NumeroRegistro],64,17);
               Cedente.ContaBancaria.CodigoAgencia := Copy(Retorno.Strings[NumeroRegistro],18,5);
               Cedente.ContaBancaria.NumeroConta := Copy(Retorno.Strings[NumeroRegistro],23,8);
               Cedente.ContaBancaria.DigitoConta := Copy(Retorno.Strings[NumeroRegistro],31,1);

               {Tipo de ocorr�ncia}
               OcorrenciaOriginal := Copy(Retorno.Strings[NumeroRegistro],109,2);
               case StrToInt(OcorrenciaOriginal) of
                  01: TipoOcorrencia := toRetornoRegistroConfirmado;
                  02: TipoOcorrencia := toRetornoBaixado;
                  03: TipoOcorrencia := toRetornoAbatimentoConcedido;
                  04: TipoOcorrencia := toRetornoAbatimentoCancelado;
                  05: TipoOcorrencia := toRetornoVencimentoAlterado;
                  06: TipoOcorrencia := toRetornoDadosAlterados;
                  07: TipoOcorrencia := toRetornoDadosAlterados;
                  08: TipoOcorrencia := toRetornoDadosAlterados;
                  09: TipoOcorrencia := toRetornoDadosAlterados;
                  10: TipoOcorrencia := toRetornoDadosAlterados;
                  11: TipoOcorrencia := toRetornoDadosAlterados;
                  12: TipoOcorrencia := toRetornoDadosAlterados;
                  20: TipoOcorrencia := toRetornoTituloEmSer;
                  21: TipoOcorrencia := toRetornoLiquidado;
                  22: TipoOcorrencia := toRetornoLiquidadoEmCartorio;
                  23: TipoOcorrencia := toRetornoBaixadoPorDevolucao;
                  24: TipoOcorrencia := toRetornoBaixadoFrancoPagamento;
                  25: TipoOcorrencia := toRetornoBaixaPorProtesto;
                  26: TipoOcorrencia := toRetornoEncaminhadoACartorio;
                  27: TipoOcorrencia := toRetornoProtestoSustado;
                  28: TipoOcorrencia := toRetornoProtestoOuSustacaoEstornado;
                  29: TipoOcorrencia := toRetornoProtestoOuSustacaoEstornado;
                  30: TipoOcorrencia := toRetornoDadosAlterados;
                  31: TipoOcorrencia := toRetornoManutencaoTituloVencido;
                  32: TipoOcorrencia := toRetornoDebitoTarifas;
                  33: TipoOcorrencia := toRetornoBaixaOuLiquidacaoEstornada;
                  99: TipoOcorrencia := toRetornoRegistroRecusado;
               else
                  TipoOcorrencia := toRetornoOutrasOcorrencias;
               end; {case StrToInt(ATipoOcorrencia)}

       {        if (TipoOcorrencia = toRetornoRegistroRecusado) or (TipoOcorrencia = toRetornoComandoRecusado) then
               begin
                  MotivoRejeicaoComando := Copy(Retorno.Strings[NumeroRegistro],80,3);
                  case StrToInt(MotivoRejeicaoComando) of
                     01 : MotivoRejeicaoComando := '01 - Movimento sem Cedente Correspondente';
                     02 : MotivoRejeicaoComando := '02 - Movimento sem Titulo Correspondente';
                     08 : MotivoRejeicaoComando := '08 - Movimento para Titulo j� com Movimentacao no dia';
                     09 : MotivoRejeicaoComando := '09 - Nosso Numero nao Pertence ao Cedente';
                     10 : MotivoRejeicaoComando := '10 - Inclusao de Titulo ja Existente';
                     12 : MotivoRejeicaoComando := '12 - Movimento  Duplicado';
                     13 : MotivoRejeicaoComando := '13 - Entrada Invalida para Cobranca Caucionada (Cedente nao possui conta Caucao)';
                     20 : MotivoRejeicaoComando := '20 - CEP do Sacado nao Encontrado (Nao foi possivel a Determinacao da Agencia Cobradora para o Titulo)';
                     21 : MotivoRejeicaoComando := '21 - Agencia Cobradora nao Encontrada (Agencia Designada para Cobradora nao Cadastrada no Sistema)';
                     45 : MotivoRejeicaoComando := '45 - Data de Vencimento com prazo mais de 1 ano';
                     49 : MotivoRejeicaoComando := '49 - Movimento Invalido para Titulo Baixado/Liquidado';
                     50 : MotivoRejeicaoComando := '50 - Movimento Invalido para Titulo Protestado';
                     54 : MotivoRejeicaoComando := '54 - Faixa de CEP da Agencia Cobradora nao Abrange CEP do Sacado';
                     55 : MotivoRejeicaoComando := '55 - Titulo ja com Opcao de Devolucao';
                     56 : MotivoRejeicaoComando := '56 - Processo de Protesto em Andamento';
                     57 : MotivoRejeicaoComando := '57 - Titulo ja com Opcao de Protesto';
                     58 : MotivoRejeicaoComando := '58 - Processo de Devolucao em Andamento';
                     59 : MotivoRejeicaoComando := '59 - Novo Prazo p/ Protesto/ Devolucao Invalido';
                     76 : MotivoRejeicaoComando := '76 - Alteracao de Prazo de Protesto Invalida';
                     77 : MotivoRejeicaoComando := '77 - Alteracao de  Prazo  de  Devolu��o  Inv�lida';
                     81 : MotivoRejeicaoComando := '81 - CEP  do  Sacado  Inv�lido';
                     82 : MotivoRejeicaoComando := '82 - CGC/CPF  do  Sacado  Inv�lido  (D�gito  n�o  Confere)';
                  else
                     MotivoRejeicaoComando := MotivoRejeicaoComando + ' - Outros motivos'
                  end; {case MotivoRejeicaoComando of}
         //      end; {if TipoOcorrencia...}

               Carteira := Copy(Retorno.Strings[NumeroRegistro],107,2);

{               if Formatar(Copy(Retorno.Strings[NumeroRegistro],176,13),13,false,'0') <> '0000000000000' then
                  ValorDespesaCobranca := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],176,13))/100
               else
                  ValorDespesaCobranca := 0.0;
 }
               if Formatar(Copy(Retorno.Strings[NumeroRegistro],176,6),6,false,'0') <> '000000' then
                  if StrToInt(Copy(Retorno.Strings[NumeroRegistro],180,2)) <= 69 then
                     DataCredito := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],180,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],178,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],176,2)))
                  else
                     DataCredito := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],180,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],178,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],176,2)))
               else
                  DataCredito := 0;

            end; {with ATitulo}

            {Insere o t�tulo}
            Titulos.Add(ATitulo);
         end;
      end;

      ATitulo.Free;
      Result := TRUE
   EXCEPT
      ATitulo.Free;
      Result := FALSE;
      Raise; {Propaga o erro}
   END;

end;

function TgbBanco104.GerarRemessaCNAB240_SIGCB_CR_SIND(
  var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
var
    ACedenteTipoInscricao, ASacadoTipoInscricao,
        Registro: string;
    NumeroRegistro, NumeroLote, X: integer;
    soma :real;
begin
    Result := FALSE;
    NumeroRegistro := 0;
    NumeroLote := 1;
    Registro := '';
    Remessa.Clear;
    // Acobranca.DataArquivo := Sistema.DataAtual;
    if ACobranca.Titulos.Count < 1 then
        Exception.Create('N�o h� t�tulos para gerar remessa');
    X := 1;
    with ACobranca do
    begin

        { GERAR REGISTRO-HEADER DO ARQUIVO }

        case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica: ACedenteTipoInscricao := '1';
            tiPessoaJuridica: ACedenteTipoInscricao := '2';
            tiOutro: ACedenteTipoInscricao := '3';
        end;

        case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica: ASacadoTipoInscricao := '1';
            tiPessoaJuridica: ASacadoTipoInscricao := '2';
            tiOutro: ASacadoTipoInscricao := '3';
        end;

        if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
            raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

        Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
        Registro := Registro + '0000'; {4 a 7 - Lote de servi�o}
        Registro := Registro + '0'; {8 - Tipo de registro - Registro header de arquivo}
        Registro := Registro + Formatar(' ', 9); {9 a 17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 14, false, '0'); {19 a 32 - N�mero de inscri��o do cedente}
        Registro := Registro + '00000000000000000000'; // 33 a 52 - Uso Exclusivo CAIXA

        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {53 a 57 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {58 - D�gito do c�digo da ag�ncia do cedente}
        Registro := Registro + '0'+Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 5, false, '0'); {59 a 64 - C�digo dom cedente no banco}
        Registro := Registro + '00000000'; // 65 a 72 - Uso Exclusivo CAIXA

        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {73 a 102 - Nome do cedente}
        Registro := Registro + Formatar('CAIXA ECONOMICA FEDERAL', 30, true, ' '); {103 a 132 - Nome do banco}
        Registro := Registro + Formatar(' ', 10); {133 a 142 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + '1'; {143 - C�digo de Remessa (1) / Retorno (2)}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {144 a 151 - Data do de gera��o do arquivo}
        Registro := Registro + FormatDateTime('hhmmss', DataArquivo); {152 a 157 - Hora de gera��o do arquivo}

        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 6, false, '0'); {158 a 163 N�mero seq�encial do arquivo}
        Registro := Registro + '101'; {164 a 166 - N�mero da vers�o do layout do arquivo}
        Registro := Registro + Formatar(' ', 5, false, '0'); {167 a 171 - Densidade de grava��o do arquivo (BPI)}
        Registro := Registro + Formatar(' ', 20); {172 a 191 - Uso reservado do banco}

        TipoMovimento := tmRemessa;

        if TipoMovimento = tmRemessaTeste then
            Registro := Registro + Formatar('REMESSA-TESTE', 20) {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}
        else
            Registro := Registro + Formatar('REMESSA-PRODUCAO', 20); //Formatar('',20); {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}

        Registro := Registro + Formatar(' ', 29); {212 a 240 - Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO HEADER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {1a 3 - C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote de servi�o}
        Registro := Registro + '1'; {8 - Tipo do registro - Registro header de lote}
        Registro := Registro + 'R'; {9 - Tipo de opera��o: R (Remessa) ou T (Retorno)}
        Registro := Registro + '01'; {10 a 11 - Tipo de servi�o: 01 (Cobran�a)}
        Registro := Registro + '00'; {12 a 13 - Forma de lan�amento: preencher com ZEROS no caso de cobran�a}
        Registro := Registro + '060'; {14 a 16 - N�mero da vers�o do layout do lote}
        Registro := Registro + ' '; {17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 14, false, '0'); {19 a 32 - N�mero de inscri��o do cedente}

        {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
        Registro := Registro + '0'+Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 5, false, '0'); {33 a 38 - C�digo do conv�nio no banco}
        Registro := Registro + '000000000000000'; {39 a 53 - Uso exclusivo CAIXA}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {54 a 58 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {59 - D�gito da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 6, false, '0'); {60 a 65 - C�digo do Conv�nio no Banco}
        Registro := Registro + '0000000'; {66 a 72 - C�digo do Modelo Personalizado}
        Registro := Registro + Formatar('0', 1); {73 - Uso Exclusivo CAIXA}
        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {74 a 103 - Nome do cedente}

        //Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[0], 40, True, ' '); {104 a 143 - Mensagem 1 para todos os boletos do lote}
        //Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[1], 40, True, ' '); {144 a 183 - Mensagem 2 para todos os boletos do lote}

        Registro := Registro + Formatar(' ', 40, True, ' '); {104 a 143 - Mensagem 1 para todos os boletos do lote}
        Registro := Registro + Formatar(' ', 40, True, ' '); {144 a 183 - Mensagem 2 para todos os boletos do lote}

        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 8, false, '0'); {184 a 191 - N�mero do arquivo}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {192 a 199 - Data de gera��o do arquivo}
        Registro := Registro + '00000000'; // 200 a 207 a pedido do banco - homologacao de RS
      //  Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {200 a 207 - Data do cr�dito - Informar a mesma data da grava��o do arquivo}
        Registro := Registro + Formatar(' ', 33); {208 a 240 - Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        soma:=0;
        { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
        while NumeroRegistro <= (Titulos.Count - 1) do
        begin

            if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
                raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

            {SEGMENTO P}
            if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') <> Formatar(CodigoBanco, 3, false, '0') then
                raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s', [CodigoBanco, NomeBanco]);

            case Titulos[NumeroRegistro].Cedente.TipoInscricao of
                tiPessoaFisica: ACedenteTipoInscricao := '1';
                tiPessoaJuridica: ACedenteTipoInscricao := '2';
                tiOutro: ACedenteTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote}
            Registro := Registro + '3'; {8 - Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {9 a 13 - N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'P'; {14 - C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {15 - Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {16 a 17 - C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {18 a 22 - Ag�ncia mantenedora da conta}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {23 - D�gito verificador da ag�ncia}
            Registro := Registro + '0'+Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 5, false, '0'); {24 a 29 - C�digo do Conv�nio no Banco}
            Registro := Registro + '00000000000'; {30 a 40 - Uso Exclusivo da CAIXA}
            Registro := Registro + Titulos[NumeroRegistro].NossoNumero; {41 a 57 - modalidade da carteira (24) + Nosso n�mero - identifica��o do t�tulo no banco}
            Registro := Registro + '1'; {58 - Cobran�a Simples}
            Registro := Registro + '1'; {59 - Forma de cadastramento do t�tulo no banco: com cadastramento}
            Registro := Registro + '2'; {60 - Tipo de documento: Escritural}

            Registro := Registro + '2' + '0';    // 2 para Cliente e 0 para Cliente Distribiui

            Registro := Registro + Titulos[NumeroRegistro].SeuNumero; {63 a 73 - N�mero que identifica o t�tulo na empresa}

            Registro := Registro + '    '; {74 a 77 - Uso exclusivo CAIXA: Brancos}
            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataVencimento); {78 a 85 - Data de vencimento do t�tulo}
            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorDocumento * 100); {86 a 100 - Valor nominal do t�tulo}
            soma := soma  + Titulos[NumeroRegistro].ValorDocumento * 100;
            Registro := Registro + '00000'; {101 a 105 - Ag�ncia cobradora. Deixar zerado. A Caixa determinar� automaticamente pelo CEP do sacado}
            Registro := Registro + '0'; {106 - D�gito da ag�ncia cobradora}
            Registro := Registro + '99'; {outros}

            case Titulos[NumeroRegistro].AceiteDocumento of {109 - Identifica��o de t�tulo Aceito / N�o aceito}
                adSim: Registro := Registro + 'A';
                adNao: Registro := Registro + 'N';
            end; {case Titulos[NumeroRegistro].AceiteDocumento}

            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataDocumento); {110 a 117 - Data da emiss�o do documento}

            Registro := Registro + '2'; {118 - C�digo de juros de mora: Acata cadastramento na CAIXA}
            Registro := Registro + FormatDateTime('ddmmyyyy', IncDay(Titulos[NumeroRegistro].DataVencimento,1)); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + Formatar('000000000000100', 15, false, '0'); {127 a 141 - Valor de juros de mora por dia}

            Registro := Registro + '0'; //142 - C�digo de desconto: Sem desconto
            Registro := Registro + Formatar('', 8, false, '0'); //143 a 150 - Data at� a qual ser� concedido desconto
            Registro := Registro + Formatar('', 15, false, '0'); //151 a 165 - Valor do desconto por dia

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorIOF * 100); {166 a 180 - Valor do IOF a ser recolhido}

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorAbatimento * 100); {181 a 195 - Valor do abatimento}

            Registro := Registro + Formatar(STRINGREPLACE(Titulos[NumeroRegistro].SeuNumero, '/', '', [RFREPLACEALL]), 25); {196 a 220 - Identifica��o do t�tulo na empresa}

            if (Titulos[NumeroRegistro].DataProtesto <> null) and (Titulos[NumeroRegistro].DataProtesto > Titulos[NumeroRegistro].DataVencimento) then
            begin
                Registro := Registro + '1'; {221 - C�digo de protesto: Protestar em XX dias corridos}
                Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataProtesto, Titulos[NumeroRegistro].DataVencimento)), 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end
            else
            begin
                Registro := Registro + '3'; {221 - C�digo de protesto: N�o protestar}
                Registro := Registro + Formatar('', 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end;

            Registro := Registro + '1'; {224 - C�digo para baixa/devolu��o: Baixar/devolver}
            Registro := Registro + '005'; {225 a 227 - Prazo para baixa/devolu��o (em dias corridos)}

            Registro := Registro + '09'; {228 a 229 - C�digo da moeda: Real}

            Registro := Registro + '0000000000'; {230 a 239 - Uso exclusivo Caixa}

            Registro := Registro + Formatar(' ', 1); {240 - Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            {SEGMENTO Q}
            case Titulos[NumeroRegistro].Sacado.TipoInscricao of
                tiPessoaFisica: ASacadoTipoInscricao := '1';
                tiPessoaJuridica: ASacadoTipoInscricao := '2';
                tiOutro: ASacadoTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
            Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'Q'; {C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            {Dados do sacado}
            Registro := Registro + Formatar(ASacadoTipoInscricao, 1, false, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC, 15, false, '0'); //19 A 33
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Numero + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Complemento, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro, 15);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP, 8, true, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade, 15, true);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado, 2, false);
            Registro := Registro + Formatar('0', 13, false, '0');
            Registro := Registro + Formatar('0', 13, false, '0');
            Registro := Registro + Formatar('0', 9, false, '0');
            Registro := Registro + Formatar('0', 13, false, '0');
            Registro := Registro + Formatar('0', 9, false, '0');
            Registro := Registro + Formatar('0', 5, false, '0');
            Registro := Registro + '0';
            Registro := Registro + Formatar('0', 5, false, '0');
            Registro := Registro + Formatar(' ', 19); {Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            NumeroRegistro := NumeroRegistro + 1;
        end;

        {REGISTRO TRAILER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
        Registro := Registro + '5'; {Tipo do registro: Registro trailer do lote}
        Registro := Registro + Formatar('', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(Remessa.Count), 6, false, '0');
        Registro := Registro + Formatar(IntToStr(Titulos.Count), 6, false, '0');
        Registro := Registro + FormatCurr('00000000000000000',soma);
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 31); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 117); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO TRAILER DO ARQUIVO}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + '9999'; {Lote de servi�o}
        Registro := Registro + '9'; {Tipo do registro: Registro trailer do arquivo}
        Registro := Registro + Formatar(' ', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 6, false, '0'); {Quantidade de lotes do arquivo}
        Registro := Registro + Formatar(IntToStr(Remessa.Count + 1), 6, false, '0'); {Quantidade de registros do arquivo, inclusive este registro que est� sendo criado agora}
        Registro := Registro + Formatar(' ', 6); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 205); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
    end;

    Result := TRUE;
end;

function TgbBanco104.GerarRemessaCNAB240_SIGCB_CR_CONF(
  var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
var
    ACedenteTipoInscricao, ASacadoTipoInscricao,
        Registro: string;
    NumeroRegistro, NumeroLote, X: integer;
    soma :real;
begin
    Result := FALSE;
    NumeroRegistro := 0;
    NumeroLote := 1;
    Registro := '';
    Remessa.Clear;
    // Acobranca.DataArquivo := Sistema.DataAtual;
    if ACobranca.Titulos.Count < 1 then
        Exception.Create('N�o h� t�tulos para gerar remessa');
    X := 1;
    with ACobranca do
    begin

        { GERAR REGISTRO-HEADER DO ARQUIVO }

        case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica: ACedenteTipoInscricao := '1';
            tiPessoaJuridica: ACedenteTipoInscricao := '2';
            tiOutro: ACedenteTipoInscricao := '3';
        end;

        case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica: ASacadoTipoInscricao := '1';
            tiPessoaJuridica: ASacadoTipoInscricao := '2';
            tiOutro: ASacadoTipoInscricao := '3';
        end;

        if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
            raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

        Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
        Registro := Registro + '0000'; {4 a 7 - Lote de servi�o}
        Registro := Registro + '0'; {8 - Tipo de registro - Registro header de arquivo}
        Registro := Registro + Formatar(' ', 9); {9 a 17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 14, false, '0'); {19 a 32 - N�mero de inscri��o do cedente}
        Registro := Registro + '00000000000000000000'; // 33 a 52 - Uso Exclusivo CAIXA

        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {53 a 57 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {58 - D�gito do c�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 6, false, '0'); {59 a 64 - C�digo dom cedente no banco}
        Registro := Registro + '00000000'; // 65 a 72 - Uso Exclusivo CAIXA

        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {73 a 102 - Nome do cedente}
        Registro := Registro + Formatar('CAIXA ECONOMICA FEDERAL', 30, true, ' '); {103 a 132 - Nome do banco}
        Registro := Registro + Formatar(' ', 10); {133 a 142 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + '1'; {143 - C�digo de Remessa (1) / Retorno (2)}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {144 a 151 - Data do de gera��o do arquivo}
        Registro := Registro + FormatDateTime('hhmmss', DataArquivo); {152 a 157 - Hora de gera��o do arquivo}

        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 6, false, '0'); {158 a 163 N�mero seq�encial do arquivo}
        Registro := Registro + '050'; {164 a 166 - N�mero da vers�o do layout do arquivo}
        Registro := Registro + Formatar(' ', 5, false, '0'); {167 a 171 - Densidade de grava��o do arquivo (BPI)}
        Registro := Registro + Formatar(' ', 20); {172 a 191 - Uso reservado do banco}

        TipoMovimento := tmRemessa;

        if TipoMovimento = tmRemessaTeste then
            Registro := Registro + Formatar('REMESSA-TESTE', 20) {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}
        else
            Registro := Registro + Formatar('REMESSA-PRODUCAO', 20); //Formatar('',20); {192 a 211 - Dever� conter a literal REMESSA-TESTE para fase de testes}

        Registro := Registro + Formatar(' ', 29); {212 a 240 - Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO HEADER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {1a 3 - C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote de servi�o}
        Registro := Registro + '1'; {8 - Tipo do registro - Registro header de lote}
        Registro := Registro + 'R'; {9 - Tipo de opera��o: R (Remessa) ou T (Retorno)}
        Registro := Registro + '01'; {10 a 11 - Tipo de servi�o: 01 (Cobran�a)}
        Registro := Registro + '00'; {12 a 13 - Forma de lan�amento: preencher com ZEROS no caso de cobran�a}
        Registro := Registro + '030'; {14 a 16 - N�mero da vers�o do layout do lote}
        Registro := Registro + ' '; {17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 15, false, '0'); {19 a 33 - N�mero de inscri��o do cedente}

        {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 6, false, '0'); {34 a 39 - C�digo do conv�nio no banco}
        Registro := Registro + '00000000000000'; {40 a 53 - Uso exclusivo CAIXA}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {54 a 58 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {59 - D�gito da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 6, false, '0'); {60 a 65 - C�digo do Conv�nio no Banco}
        Registro := Registro + '0000000'; {66 a 72 - C�digo do Modelo Personalizado}
        Registro := Registro + Formatar('0', 1); {73 - Uso Exclusivo CAIXA}
        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {74 a 103 - Nome do cedente}

        //Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[0], 40, True, ' '); {104 a 143 - Mensagem 1 para todos os boletos do lote}
        //Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[1], 40, True, ' '); {144 a 183 - Mensagem 2 para todos os boletos do lote}

        Registro := Registro + Formatar(' ', 40, True, ' '); {104 a 143 - Mensagem 1 para todos os boletos do lote}
        Registro := Registro + Formatar(' ', 40, True, ' '); {144 a 183 - Mensagem 2 para todos os boletos do lote}

        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 8, false, '0'); {184 a 191 - N�mero do arquivo}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {192 a 199 - Data de gera��o do arquivo}
        Registro := Registro + '00000000'; // 200 a 207 a pedido do banco - homologacao de RS
      //  Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {200 a 207 - Data do cr�dito - Informar a mesma data da grava��o do arquivo}
        Registro := Registro + Formatar(' ', 33); {208 a 240 - Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        soma:=0;
        { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
        while NumeroRegistro <= (Titulos.Count - 1) do
        begin

            if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
                raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

            {SEGMENTO P}
            if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') <> Formatar(CodigoBanco, 3, false, '0') then
                raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s', [CodigoBanco, NomeBanco]);

            case Titulos[NumeroRegistro].Cedente.TipoInscricao of
                tiPessoaFisica: ACedenteTipoInscricao := '1';
                tiPessoaJuridica: ACedenteTipoInscricao := '2';
                tiOutro: ACedenteTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote}
            Registro := Registro + '3'; {8 - Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {9 a 13 - N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'P'; {14 - C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {15 - Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {16 a 17 - C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {18 a 22 - Ag�ncia mantenedora da conta}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {23 - D�gito verificador da ag�ncia}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 6, false, '0'); {24 a 29 - C�digo do Conv�nio no Banco}
            Registro := Registro + '00000000000'; {30 a 40 - Uso Exclusivo da CAIXA}
            Registro := Registro + Titulos[NumeroRegistro].NossoNumero; {41 a 57 - modalidade da carteira (24) + Nosso n�mero - identifica��o do t�tulo no banco}
            Registro := Registro + '1'; {58 - Cobran�a Simples}
            Registro := Registro + '1'; {59 - Forma de cadastramento do t�tulo no banco: com cadastramento}
            Registro := Registro + '2'; {60 - Tipo de documento: Escritural}

            Registro := Registro + '2' + '0';    // 2 para Cliente e 0 para Cliente Distribiui

            Registro := Registro + Titulos[NumeroRegistro].SeuNumero; {63 a 73 - N�mero que identifica o t�tulo na empresa}

            Registro := Registro + '    '; {74 a 77 - Uso exclusivo CAIXA: Brancos}
            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataVencimento); {78 a 85 - Data de vencimento do t�tulo}
            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorDocumento * 100); {86 a 100 - Valor nominal do t�tulo}
            soma := soma  + Titulos[NumeroRegistro].ValorDocumento * 100;
            Registro := Registro + '00000'; {101 a 105 - Ag�ncia cobradora. Deixar zerado. A Caixa determinar� automaticamente pelo CEP do sacado}
            Registro := Registro + '0'; {106 - D�gito da ag�ncia cobradora}
            case Titulos[NumeroRegistro].EspecieDocumento of {107 a 108 - Esp�cie do documento}
                edApoliceSeguro: Registro := Registro + '20'; {AP  AP�LICE DE SEGURO}
                edCheque: Registro := Registro + '01'; {CH  CHEQUE}
                edDuplicataMercantil: Registro := Registro + '02'; {DM  DUPLICATA MERCANTIL}
                edDuplicataMercantialIndicacao: Registro := Registro + '03'; {DMI DUPLICATA MERCANTIL P/ INDICA��O}
                edDuplicataRural: Registro := Registro + '06'; {DR  DUPLICATA RURAL}
                edDuplicataServico: Registro := Registro + '04'; {DS  DUPLICATA DE SERVI�O}
                edDuplicataServicoIndicacao: Registro := Registro + '05'; {DSI DUPLICATA DE SERVI�O P/ INDICA��O}
                edFatura: Registro := Registro + '18'; {FAT FATURA}
                edLetraCambio: Registro := Registro + '07'; {LC  LETRA DE C�MBIO}
                edMensalidadeEscolar: Registro := Registro + '21'; {ME  MENSALIDADE ESCOLAR}
                edNotaCreditoComercial: Registro := Registro + '08'; {NCC NOTA DE CR�DITO COMERCIAL}
                edNotaCreditoExportacao: Registro := Registro + '09'; {NCE NOTA DE CR�DITO A EXPORTA��O}
                edNotaCreditoIndustrial: Registro := Registro + '10'; {NCI NOTA DE CR�DITO INDUSTRIAL}
                edNotaCreditoRural: Registro := Registro + '11'; {NCR NOTA DE CR�DITO RURAL}
                edNotaDebito: Registro := Registro + '19'; {ND  NOTA DE D�BITO}
                edNotaPromissoria: Registro := Registro + '12'; {NP  NOTA PROMISS�RIA}
                edNotaPromissoriaRural: Registro := Registro + '13'; {NPR NOTA PROMISS�RIA RURAL}
                edNotaSeguro: Registro := Registro + '16'; {NS  NOTA DE SEGURO}
                edParcelaConsorcio: Registro := Registro + '22'; {PC  PARCELA DE CONSORCIO}
                edRecibo: Registro := Registro + '17'; {RC  RECIBO}
                edTriplicataMercantil: Registro := Registro + '14'; {TM  TRIPLICATA MERCANTIL}
                edTriplicataServico: Registro := Registro + '15' {TS  TRIPLICATA DE SERVI�O}
            else
                Registro := Registro + '99'; {OUTROS}
            end; {case Titulos[NumeroRegistro].EspecieDocumento}

            case Titulos[NumeroRegistro].AceiteDocumento of {109 - Identifica��o de t�tulo Aceito / N�o aceito}
                adSim: Registro := Registro + 'A';
                adNao: Registro := Registro + 'N';
            end; {case Titulos[NumeroRegistro].AceiteDocumento}

            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataDocumento); {110 a 117 - Data da emiss�o do documento}

            if Titulos[NumeroRegistro].ValorMoraJuros > 0 then
            begin
                Registro := Registro + '3'; {118 - C�digo de juros de mora: Valor por dia}
                if Titulos[NumeroRegistro].DataMoraJuros <> Null then
                    Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataMoraJuros) {119 a 126 - Data a partir da qual ser�o cobrados juros}
                else
                    Registro := Registro + Formatar(' ', 8, false, '0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
                Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorMoraJuros * 100); {127 a 141 - Valor de juros de mora por dia}
            end
            else
            begin
                Registro := Registro + '3'; {118 - C�digo de juros de mora: Acata cadastramento na CAIXA}
                Registro := Registro + Formatar(' ', 8, false, '0'); {119 a 126 - Data a partir da qual ser�o cobrados juros}
                Registro := Registro + Formatar(' ', 15, false, '0'); {127 a 141 - Valor de juros de mora por dia}
            end;

            Registro := Registro + '0'; //142 - C�digo de desconto: Sem desconto
            Registro := Registro + Formatar('', 8, false, '0'); //143 a 150 - Data at� a qual ser� concedido desconto
            Registro := Registro + Formatar('', 15, false, '0'); //151 a 165 - Valor do desconto por dia

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorIOF * 100); {166 a 180 - Valor do IOF a ser recolhido}

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorAbatimento * 100); {181 a 195 - Valor do abatimento}

            Registro := Registro + Formatar(STRINGREPLACE(Titulos[NumeroRegistro].SeuNumero, '/', '', [RFREPLACEALL]), 25); {196 a 220 - Identifica��o do t�tulo na empresa}

            if (Titulos[NumeroRegistro].DataProtesto <> null) and (Titulos[NumeroRegistro].DataProtesto > Titulos[NumeroRegistro].DataVencimento) then
            begin
                Registro := Registro + '1'; {221 - C�digo de protesto: Protestar em XX dias corridos}
                Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataProtesto, Titulos[NumeroRegistro].DataVencimento)), 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end
            else
            begin
                Registro := Registro + '3'; {221 - C�digo de protesto: N�o protestar}
                Registro := Registro + Formatar('', 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end;

            Registro := Registro + '1'; {224 - C�digo para baixa/devolu��o: Baixar/devolver}
            Registro := Registro + '005'; {225 a 227 - Prazo para baixa/devolu��o (em dias corridos)}

            Registro := Registro + '09'; {228 a 229 - C�digo da moeda: Real}

            Registro := Registro + '0000000000'; {230 a 239 - Uso exclusivo Caixa}

            Registro := Registro + Formatar(' ', 1); {240 - Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            {SEGMENTO Q}
            case Titulos[NumeroRegistro].Sacado.TipoInscricao of
                tiPessoaFisica: ASacadoTipoInscricao := '1';
                tiPessoaJuridica: ASacadoTipoInscricao := '2';
                tiOutro: ASacadoTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
            Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'Q'; {C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            {Dados do sacado}
            Registro := Registro + Formatar(ASacadoTipoInscricao, 1, false, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC, 15, false, '0'); //19 A 33
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Numero + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Complemento, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro, 15);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP, 8, true, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade, 15, true);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado, 2, false);
            Registro := Registro + '0'; //Formatar(ACedenteTipoInscricao, 1, false, '0');
            Registro := Registro + Formatar('0', 15, false, '0');

            Registro := Registro + Formatar(' ', 40); // Sacador avalista 170 a 209
            Registro := Registro + '   '; // preecnher com zeros de 210 a 2012
            Registro := Registro + Formatar(' ', 28); {Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            {SEGMENTO R -  para impress�o da mensagem - instru��o}
            Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
            Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(x), 5, false, '0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'R'; {C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}

            registro := Registro + '0';  //Desconto 2
            registro := Registro + '00000000';
            registro := Registro + '000000000000000';

            registro := Registro + '0'; //desconto 3
            registro := Registro + '00000000';
            registro := Registro + '000000000000000';

            Registro := Registro + Formatar('0', 24, false, '0');

            registro := Registro + '          ';
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[0], 40, True, ' '); { mensagem 3 }
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Instrucoes.Strings[1], 40, True, ' '); { mensagem 4 }
            Registro := Registro + Formatar(' ', 50); {Uso exclusivo FEBRABAN/CNAB}
            Registro := Registro + Formatar(' ', 11); {Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            X := X + 1;

            NumeroRegistro := NumeroRegistro + 1;
        end;

        {REGISTRO TRAILER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
        Registro := Registro + '5'; {Tipo do registro: Registro trailer do lote}
        Registro := Registro + Formatar('', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(Remessa.Count), 6, false, '0');
        Registro := Registro + Formatar(IntToStr(Titulos.Count), 6, false, '0');
        Registro := Registro + FormatCurr('00000000000000000',soma);
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 31); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 117); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO TRAILER DO ARQUIVO}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + '9999'; {Lote de servi�o}
        Registro := Registro + '9'; {Tipo do registro: Registro trailer do arquivo}
        Registro := Registro + Formatar(' ', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 6, false, '0'); {Quantidade de lotes do arquivo}
        Registro := Registro + Formatar(IntToStr(Remessa.Count + 1), 6, false, '0'); {Quantidade de registros do arquivo, inclusive este registro que est� sendo criado agora}
        Registro := Registro + Formatar(' ', 6); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 205); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
    end;

    Result := TRUE;
end;


function TgbBanco104.GerarRemessaCNAB240_SIGCB_CR_SIND_NOVA(
  var ACobranca: TgbCobranca; var Remessa: TStringList): boolean;
var
    ACedenteTipoInscricao, ASacadoTipoInscricao,
        Registro: string;
    NumeroRegistro, NumeroLote, X: integer;
    soma :real;
begin
    Result := FALSE;
    NumeroRegistro := 0;
    NumeroLote := 1;
    Registro := '';
    Remessa.Clear;
    // Acobranca.DataArquivo := Sistema.DataAtual;
    if ACobranca.Titulos.Count < 1 then
        Exception.Create('N�o h� t�tulos para gerar remessa');
    X := 1;
    with ACobranca do
    begin

        { GERAR REGISTRO-HEADER DO ARQUIVO }

        case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica: ACedenteTipoInscricao := '1';
            tiPessoaJuridica: ACedenteTipoInscricao := '2';
            tiOutro: ACedenteTipoInscricao := '3';
        end;

        case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica: ASacadoTipoInscricao := '1';
            tiPessoaJuridica: ASacadoTipoInscricao := '2';
            tiOutro: ASacadoTipoInscricao := '3';
        end;

        if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
            raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

        Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
        Registro := Registro + '0000'; {4 a 7 - Lote de servi�o}
        Registro := Registro + '0'; {8 - Tipo de registro - Registro header de arquivo}
        Registro := Registro + Formatar(' ', 9); {9 a 17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 14, false, '0'); {19 a 32 - N�mero de inscri��o do cedente}
        Registro := Registro + '00000000000000000000'; // 33 a 52 - Uso Exclusivo CAIXA

        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {53 a 57 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {58 - D�gito do c�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 7, false, '0'); {59 a 65 - C�digo dom cedente no banco}
        Registro := Registro + '0000000'; // 66 a 72 - Uso Exclusivo CAIXA
        Registro := Registro + '0'; // 73 - Uso Exclusivo CAIXA

        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {74 a 103 - Nome do cedente}
        Registro := Registro + Formatar('CAIXA ECONOMICA FEDERAL', 30, true, ' '); {104 a 133 - Nome do banco}
        Registro := Registro + Formatar(' ', 10); {134 a 143 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + '1'; {144 - C�digo de Remessa (1) / Retorno (2)}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {145 a 152 - Data do de gera��o do arquivo}
        Registro := Registro + FormatDateTime('hhmmss', DataArquivo); {153 a 158 - Hora de gera��o do arquivo}

        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 6, false, '0'); {159 a 164 N�mero seq�encial do arquivo}
        Registro := Registro + '101'; {165 a 167 - N�mero da vers�o do layout do arquivo}
        Registro := Registro + Formatar(' ', 5, false, '0'); {168 - 172 - Densidade de grava��o do arquivo (BPI)}

        if Titulos[NumeroRegistro].Cedente.CodigoCedente = '109067' then
            Registro := Registro + '2' {173 - Tipo de Entidade}
        else
            Registro := Registro + '1';   {173 - Tipo de Entidade}

      //  Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 5, false, '0'); {174 - 178 -  C�digo sindical da Entidade Sindical}

        if Titulos[NumeroRegistro].Cedente.CodigoCedente = '109067' then
                Registro := Registro + '00111' {217 1 221 0 cod sindical}
        else
        if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103912' then
                Registro := Registro + '87232' {217 1 221 0 cod sindical}
        else
            if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103911' then
                Registro := Registro + '87231';{217 1 221 0 cod sindical}

        Registro := Registro + Formatar(' ', 20); {179 a 198 - Uso reservado do banco}

        Registro := Registro + Formatar(' ', 4); {199 - 202 Vers�o Aplicativo CAIXA}

        Registro := Registro + Formatar(' ', 38); {203 - 240 Uso da Febraban}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO HEADER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {1a 3 - C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote de servi�o}
        Registro := Registro + '1'; {8 - Tipo do registro - Registro header de lote}
        Registro := Registro + 'R'; {9 - Tipo de opera��o: R (Remessa) ou T (Retorno)}
        Registro := Registro + '01'; {10 a 11 - Tipo de servi�o: 01 (Cobran�a)}
        Registro := Registro + '00'; {12 a 13 - Forma de lan�amento: preencher com ZEROS no caso de cobran�a}
        Registro := Registro + '060'; {14 a 16 - N�mero da vers�o do layout do lote}
        Registro := Registro + ' '; {17 - Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + ACedenteTipoInscricao; {18 - Tipo de inscri��o do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC, 14, false, '0'); {19 a 32 - N�mero de inscri��o do cedente}

        {C�DIGO DO CONV�NIO = AG�NCIA + N�MERO CONV�NIO + DV}
        Registro := Registro +Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 7, false, '0'); {33 a 39 - C�digo do conv�nio no banco}
        Registro := Registro + '000000000000000'; {40 a 54 - Uso exclusivo CAIXA}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {55 a 59 - C�digo da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {60 - D�gito da ag�ncia do cedente}
        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 7, false, '0'); {61 a 67 - C�digo do Conv�nio no Banco}
       // Registro := Registro +'0'+ Titulos[NumeroRegistro].Cedente.CodigoCedente; {61 a 67 - C�digo do Conv�nio no Banco}

        if Titulos[NumeroRegistro].Cedente.CodigoCedente = '109067' then
            Registro := Registro + '2' {68 - Tipo de Entidade}
        else
        if Titulos[NumeroRegistro].Cedente.Nome[1]='S' then
            Registro := Registro + '1';   {68 - Tipo de Entidade}

//        Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 5, true, '0'); {69 - 73 -  C�digo sindical da Entidade Sindical}

         if Titulos[NumeroRegistro].Cedente.CodigoCedente = '109067' then
                Registro := Registro + '00111' {217 1 221 0 cod sindical}
         else
         if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103912' then
                Registro := Registro + '87232' {217 1 221 0 cod sindical}
         else
         if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103911' then
                Registro := Registro + '87231';{217 1 221 0 cod sindical}
        Registro := Registro + '00'; {74 a 75 - Uso da Caixa}
        Registro := Registro + RemoveAcento(copy(Titulos[NumeroRegistro].Cedente.Nome,1, 30)); {76 a 105 - Nome do cedente}
        Registro := Registro + Formatar(' ', 40, True, ' '); {106 a 145 - Mensagem 1 para todos os boletos do lote}
        Registro := Registro + Formatar(' ', 40, True, ' '); {146 a 185 - Mensagem 2 para todos os boletos do lote}
        Registro := Registro + Formatar(IntToStr(NumeroArquivo), 12, false, '0'); {186 a 197 - N�mero do arquivo}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {198 a 205 - Data de gera��o do arquivo}
        Registro := Registro + FormatDateTime('ddmmyyyy', DataArquivo); {206 a 213 - Data do cr�dito - Informar a mesma data da grava��o do arquivo}
        Registro := Registro + Formatar(' ', 27); {214 a 240 - Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        soma:=0;
        { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
        while NumeroRegistro <= (Titulos.Count - 1) do
        begin

            if Formatar(CodigoBanco, 3, false, '0') <> Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') then
                raise Exception.CreateFmt('O t�tulo (Nosso N�mero: %s) n�o pertence ao banco %s (%s)', [Titulos[NumeroRegistro].NossoNumero, CodigoBanco, NomeBanco]);

            {SEGMENTO P}
            if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo, 3, false, '0') <> Formatar(CodigoBanco, 3, false, '0') then
                raise Exception.CreateFmt('Titulo n�o pertence ao banco %s - %s', [CodigoBanco, NomeBanco]);

            case Titulos[NumeroRegistro].Cedente.TipoInscricao of
                tiPessoaFisica: ACedenteTipoInscricao := '1';
                tiPessoaJuridica: ACedenteTipoInscricao := '2';
                tiOutro: ACedenteTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {1 a 3 - C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {4 a 7 - N�mero do lote}
            Registro := Registro + '3'; {8 - Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {9 a 13 - N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'P'; {14 - C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {15 - Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {16 a 17 - C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia, 5, false, '0'); {18 a 22 - Ag�ncia mantenedora da conta}
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoAgencia, 1, false, '0'); {23 - D�gito verificador da ag�ncia}
            Registro := Registro +Formatar(Titulos[NumeroRegistro].Cedente.CodigoCedente, 7, false, '0'); {24 a 30 - C�digo do Conv�nio no Banco}
            //Registro := Registro +'0'+Titulos[NumeroRegistro].Cedente.CodigoCedente; {24 a 30 - C�digo do Conv�nio no Banco}
            Registro := Registro + '0000000'; {31 a 37 - Uso Exclusivo da CAIXA}
            Registro := Registro + '000'; {38 a 40 - Uso Exclusivo da CAIXA}
            //Registro := Registro + Titulos[NumeroRegistro].NossoNumero; {41 a 57 - modalidade da carteira (14) + Nosso n�mero - identifica��o do t�tulo no banco}
            Registro := Registro + '00000000000000000'; {41 a 57 - modalidade da carteira (14) + Nosso n�mero - identifica��o do t�tulo no banco}
            Registro := Registro + '1'; {58 - Cobran�a Simples}
            Registro := Registro + '1'; {59 - Forma de cadastramento do t�tulo no banco: com cadastramento}
            Registro := Registro + '2'; {60 - Tipo de documento: Escritural}

            Registro := Registro + '2' + '0';    // 2 para Cliente e 0 para Cliente Distribiui

            //Registro := Registro + Titulos[NumeroRegistro].SeuNumero; {63 a 73 - N�mero que identifica o t�tulo na empresa}

            Registro := Registro + Formatar(IntToStr(ExtractMonth(Titulos[NumeroRegistro].DataVencimento))+'/'+ IntToStr(ExtractYear(DataAtual)),11,false,'0')  ; {63 a 73 - N�mero que identifica o t�tulo na empresa}

            Registro := Registro + '    '; {74 a 77 - Uso exclusivo CAIXA: Brancos}
            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataVencimento); {78 a 85 - Data de vencimento do t�tulo}
            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorDocumento * 100); {86 a 100 - Valor nominal do t�tulo}
            soma := soma  + Titulos[NumeroRegistro].ValorDocumento * 100;
            Registro := Registro + '00000'; {101 a 105 - Ag�ncia cobradora. Deixar zerado. A Caixa determinar� automaticamente pelo CEP do sacado}
            Registro := Registro + '0'; {106 - D�gito da ag�ncia cobradora}
            Registro := Registro + '99'; {outros}

            case Titulos[NumeroRegistro].AceiteDocumento of {109 - Identifica��o de t�tulo Aceito / N�o aceito}
                adSim: Registro := Registro + 'A';
                adNao: Registro := Registro + 'N';
            end; {case Titulos[NumeroRegistro].AceiteDocumento}

            Registro := Registro + FormatDateTime('ddmmyyyy', Titulos[NumeroRegistro].DataDocumento); {110 a 117 - Data da emiss�o do documento}

            Registro := Registro + '3'; {118 - C�digo de juros de mora: Acata cadastramento na CAIXA - 3 = isento orientacao do manual}
            //Registro := Registro + FormatDateTime('ddmmyyyy', IncDay(Titulos[NumeroRegistro].DataVencimento,1)); {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + '00000000'; {119 a 126 - Data a partir da qual ser�o cobrados juros}
            Registro := Registro + Formatar('000000000000000', 15, false, '0'); {127 a 141 - Valor de juros de mora por dia}

            Registro := Registro + '0'; //142 - C�digo de desconto: Sem desconto
            Registro := Registro + Formatar('', 8, false, '0'); //143 a 150 - Data at� a qual ser� concedido desconto
            Registro := Registro + Formatar('', 15, false, '0'); //151 a 165 - Valor do desconto por dia

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorIOF * 100); {166 a 180 - Valor do IOF a ser recolhido}

            Registro := Registro + FormatCurr('000000000000000', Titulos[NumeroRegistro].ValorAbatimento * 100); {181 a 195 - Valor do abatimento}

            Registro := Registro + Formatar(STRINGREPLACE(Titulos[NumeroRegistro].SeuNumero, '/', '', [RFREPLACEALL]), 25); {196 a 220 - Identifica��o do t�tulo na empresa}

            if (Titulos[NumeroRegistro].DataProtesto <> null) and (Titulos[NumeroRegistro].DataProtesto > Titulos[NumeroRegistro].DataVencimento) then
            begin
                Registro := Registro + '1'; {221 - C�digo de protesto: Protestar em XX dias corridos}
                Registro := Registro + Formatar(IntToStr(DaysBetween(Titulos[NumeroRegistro].DataProtesto, Titulos[NumeroRegistro].DataVencimento)), 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end
            else
            begin
                Registro := Registro + '3'; {221 - C�digo de protesto: N�o protestar}
                Registro := Registro + Formatar('', 2, false, '0'); {222 a 223 - Prazo para protesto (em dias corridos)}
            end;

            Registro := Registro + '1'; {224 - C�digo para baixa/devolu��o: Baixar/devolver}
            Registro := Registro + '090'; {225 a 227 - Prazo para baixa/devolu��o (em dias corridos)}

            Registro := Registro + '09'; {228 a 229 - C�digo da moeda: Real}

            Registro := Registro + '0000000000'; {230 a 239 - Uso exclusivo Caixa}

            //Registro := Registro + ' '; {240 - Uso exclusivo FEBRABAN/CNAB}
            Registro := Registro + '1'; {240 - valor fixo e nao autoriza pagto parcial}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            {SEGMENTO Q}
            case Titulos[NumeroRegistro].Sacado.TipoInscricao of
                tiPessoaFisica: ASacadoTipoInscricao := '1';
                tiPessoaJuridica: ASacadoTipoInscricao := '2';
                tiOutro: ASacadoTipoInscricao := '9';
            end;

            Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
            Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
            Registro := Registro + '3'; {Tipo do registro: Registro detalhe}
            Registro := Registro + Formatar(IntToStr(X), 5, false, '0'); {N�mero seq�encial do registro no lote - Cada t�tulo tem 2 registros (P e Q)}
            Registro := Registro + 'Q'; {C�digo do segmento do registro detalhe}
            Registro := Registro + ' '; {Uso exclusivo FEBRABAN/CNAB: Branco}
            case Titulos[NumeroRegistro].TipoOcorrencia of {C�digo de movimento}
                toRemessaRegistrar: Registro := Registro + '01';
                toRemessaBaixar: Registro := Registro + '02';
                toRemessaConcederAbatimento: Registro := Registro + '04';
                toRemessaCancelarAbatimento: Registro := Registro + '05';
                toRemessaConcederDesconto: Registro := Registro + '07';
                toRemessaCancelarDesconto: Registro := Registro + '08';
                toRemessaAlterarVencimento: Registro := Registro + '06';
                toRemessaProtestar: Registro := Registro + '09';
                toRemessaCancelarInstrucaoProtesto: Registro := Registro + '10';
                toRemessaDispensarJuros: Registro := Registro + '31';
                toRemessaAlterarNomeEnderecoSacado: Registro := Registro + '31';
            else
                raise Exception.CreateFmt('Ocorr�ncia inv�lida em remessa - Nosso n�mero: %s / Seu n�mero: %s', [Titulos[NumeroRegistro].NossoNumero, Titulos[NumeroRegistro].SeuNumero]);
            end; {case Titulos[NumeroRegistro].TipoOcorrencia}
            {Dados do sacado}
            Registro := Registro + Formatar(ASacadoTipoInscricao, 1, false, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC, 15, false, '0'); //19 A 33
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Numero + ' ' + Titulos[NumeroRegistro].Sacado.Endereco.Complemento, 40);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro, 15);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP, 8, true, '0');
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade, 15, true);
            Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado, 2, false);
            Registro := Registro + Formatar('0', 13, false, '0'); // Capsocial da empresa
            Registro := Registro + Formatar('0', 13, false, '0'); // capsocial do estabelecimento
            Registro := Registro + Formatar('0', 9, false, '0');  // num empregados contribuintes
            Registro := Registro + Formatar('0', 13, false, '0'); // total de remunera��o  contribuintes
            Registro := Registro + Formatar('0', 9, false, '0');  // Total de empregados do estabelecimento
            //Registro := Registro + Formatar('0', 5, false, '0'); // codigo cnae
            Registro := Registro + '00461'; // codigo cnae

            if Titulos[NumeroRegistro].Cedente.Nome[1]='S' then
                Registro := Registro + '1'   {216 - Tipo de Entidade}

            else
            if Titulos[NumeroRegistro].Cedente.Nome[1]='F' then
                Registro := Registro + '2'; {216 - Tipo de Entidade}

            if Titulos[NumeroRegistro].Cedente.CodigoCedente = '109067' then
                Registro := Registro + '00111' {217 1 221 0 cod sindical}
            else
            if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103912' then
                Registro := Registro + '87232' {217 1 221 0 cod sindical}
            else
            if Titulos[NumeroRegistro].Cedente.CodigoCedente = '103911' then
                Registro := Registro + '87231';{217 1 221 0 cod sindical}

            Registro := Registro + Formatar(' ', 19); {Uso exclusivo FEBRABAN/CNAB}

            Remessa.Add(Registro);
            Registro := '';
            X := X + 1;

            NumeroRegistro := NumeroRegistro + 1;
        end;

        {REGISTRO TRAILER DO LOTE}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 4, false, '0'); {N�mero do lote}
        Registro := Registro + '5'; {Tipo do registro: Registro trailer do lote}
        Registro := Registro + Formatar('', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(Remessa.Count), 6, false, '0');
        Registro := Registro + Formatar(IntToStr(Titulos.Count), 6, false, '0');
        Registro := Registro + FormatCurr('00000000000000000',soma);
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 6, false, '0'); {Quantidade t�tulos em cobran�a}
        Registro := Registro + Formatar(' ', 17, false, '0'); {Valor dos t�tulos em carteiras}
        Registro := Registro + Formatar(' ', 31); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 117); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
        Registro := '';

        {GERAR REGISTRO TRAILER DO ARQUIVO}
        Registro := Formatar(CodigoBanco, 3, false, '0'); {C�digo do banco}
        Registro := Registro + '9999'; {Lote de servi�o}
        Registro := Registro + '9'; {Tipo do registro: Registro trailer do arquivo}
        Registro := Registro + Formatar(' ', 9); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(IntToStr(NumeroLote), 6, false, '0'); {Quantidade de lotes do arquivo}
        Registro := Registro + Formatar(IntToStr(Remessa.Count + 1), 6, false, '0'); {Quantidade de registros do arquivo, inclusive este registro que est� sendo criado agora}
        Registro := Registro + Formatar(' ', 6); {Uso exclusivo FEBRABAN/CNAB}
        Registro := Registro + Formatar(' ', 205); {Uso exclusivo FEBRABAN/CNAB}

        Remessa.Add(Registro);
    end;

    Result := TRUE;
end;

initialization
RegisterClass(TgbBanco104);

end.
