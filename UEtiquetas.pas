unit UEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient,comobj, ExtCtrls;

type
  TfrmEtiqueta = class(TForm)
    comboModelo: TComboBox;
    Label1: TLabel;
    Dados: TClientDataSet;
    Dadosnome: TStringField;
    Dadosendereco: TStringField;
    Dadoscomplemento: TStringField;
    Dadosbairro: TStringField;
    Dadoscep: TStringField;
    Dadoscidade: TStringField;
    Dadosestado: TStringField;
    DadosREGISTRO: TStringField;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    DadosFiscal: TClientDataSet;
    DadosFiscalCNPJ: TStringField;
    DadosFiscalNOME_EMP: TStringField;
    DadosFiscalNIRC_EMP: TStringField;
    DadosFiscalCIDADE_EMP: TStringField;
    DadosFiscalDATA_CONTROLE: TDateField;
    DadosFiscalDT_REGISTRO: TDateField;
    DadosFiscalVALOR_REG: TFloatField;
    DadosFiscalendereco: TStringField;
    DadosFiscalbairro: TStringField;
    DadosFiscalcep: TStringField;
    DadosFiscalestado: TStringField;
    DadosFiscalcartorio: TStringField;
    DadosFiscalatividade: TStringField;
    DadosFiscalemail: TStringField;
    DadosFiscalDATA_REG_SOCIAL: TDateField;
    DadosFiscalcapital: TFloatField;
    DadosFiscaldt_ult_alter: TDateField;
    DadosFiscaldt_homologacao: TDateField;
    procedure BitBtn1Click(Sender: TObject);
    function Vermodelo (Texto:String):String;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiqueta: TfrmEtiqueta;
  gerouetiqueta:integer;

implementation

uses UOpenOffice, UFuncoes;

{$R *.dfm}

procedure TfrmEtiqueta.BitBtn1Click(Sender: TObject);
var
MSWord: Variant;
finallinha:boolean;
begin
  Try
      {sera usada a uses COMOBJ}
      { Abre o Word }
      MSWord := CreateOleObject('Word.Application');
      {não visualizar Microsoft Word}
      MSWord.Visible:=false;

      { Abre documento em anexo junto ao  exe}
      MSWord.Documents.Open(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text));
      finallinha:=false;{Essa variavel foi criada para controlar o avanço de para cada celula da coluna }
      Dados.First;
      while not Dados.Eof do
      begin
           { Escreve na  célula }
           IF DadosREGISTRO.AsString ='' THEN
             MSWord.Selection.TypeText(Text :=trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +#13+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString )
           ELSE
             MSWord.Selection.TypeText(Text :=trim(DadosREGISTRO.AsString)+#13+trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +#13+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString );
           if finallinha=false then
             begin
               { Pula 1 celula}
               MSWord.Selection.MoveRight(12);
               MSWord.Selection.MoveRight(12);
               finallinha:=true;
             end
           else
             begin
               { vai para a proxima celula }
               MSWord.Selection.MoveRight(12);
               finallinha:=false;
             end;
           Dados.Next;
      end;
      {visualizar Microsoft word }
      MSWord.Visible:=true;
  except
  MSWord.quit;
  end;
end;

function TfrmEtiqueta.Vermodelo(Texto: String): String;
begin
   If texto ='Pimaco - A4 354' then
      result := 'Etiqueta_Pimaco_A4_354.doc'
   else
   If texto ='Pimaco - A4 355' then
      result := 'Etiqueta_Pimaco_A4_355.doc'
   else
   If texto ='Pimaco - A4 356' then
      result := 'Etiqueta_Pimaco_A4_356.doc'
   else
   If texto ='Pimaco - A4 360' then
      result := 'Etiqueta_Pimaco_A4_360.doc'
   else
   If texto ='Pimaco - A4 361' then
      result := 'Etiqueta_Pimaco_A4_361.doc'
   else
   If texto ='Pimaco - A4 362' then
      result := 'Etiqueta_Pimaco_A4_362.doc'
   else
   If texto ='Pimaco - A4 363' then
      result := 'Etiqueta_Pimaco_A4_363.doc'
   else
   If texto ='Pimaco - A4 SL33105' then
      result := 'Etiqueta_Pimaco_A4_SL33105.doc'
   else
   If texto ='Pimaco - A4 SL3370' then
      result := 'Etiqueta_Pimaco_A4_SL3370.doc'
   else
   If texto ='Pimaco - Carta 0080' then
      result := 'Etiqueta_Pimaco_Carta_0080.doc'
   else
   If texto ='Pimaco - Carta 0082' then
      result := 'Etiqueta_Pimaco_Carta_0082.doc'
   else
   If texto ='Pimaco - Carta 0087' then
      result := 'Etiqueta_Pimaco_Carta_0087.doc'
   else
   If texto ='Pimaco - Carta 3080/3081' then
      result := 'Etiqueta_Pimaco_Carta_3080_3081.doc'
   else
   If texto ='Pimaco - Carta 6080' then
      result := 'Etiqueta_Pimaco_Carta_6080.doc'
   else
   If texto ='Pimaco - Carta 6081' then
      result := 'Etiqueta_Pimaco_Carta_6081.doc'
   else
   If texto ='Pimaco - Carta 6082' then
      result := 'Etiqueta_Pimaco_Carta_6082.doc'
   else
   If texto ='Pimaco - Carta 6180' then
      result := 'Etiqueta_Pimaco_Carta_6180.doc'
   else
   If texto ='Pimaco - Carta 6181' then
      result := 'Etiqueta_Pimaco_Carta_6181.doc'
   else
   If texto ='Pimaco - Carta 6182' then
      result := 'Etiqueta_Pimaco_Carta_6182.doc'
   else
   If texto ='Pimaco - Carta 6280' then
      result := 'Etiqueta_Pimaco_Carta_6280.doc'
   else
   If texto ='Pimaco - Carta 6281' then
      result := 'Etiqueta_Pimaco_Carta_6281.doc'
   else
   If texto ='Pimaco - Carta 6282' then
      result := 'Etiqueta_Pimaco_Carta_6282.doc'
   else
   If texto ='Etiqueta_Modelo_Fiscal' then
      result := 'Etiqueta_Modelo_Fiscal.doc'
   else
   If texto = 'Etiqueta_Modelo_Matricial' then
      result :='Etiqueta_Modelo_Matricial.doc';
end;

procedure TfrmEtiqueta.FormCreate(Sender: TObject);
begin
   Dados.CreateDataset;
   DadosFiscal.CreateDataset;
end;

procedure TfrmEtiqueta.BitBtn3Click(Sender: TObject);
var
MSWord, Doc, Docs, texto: Variant;
finallinha:boolean;
  x, cont:integer;
begin
   ExibeAguarde('Gerando Etiquetas. Aguarde...');
   gerouetiqueta:=1;
   cont := 1;
   if comboModelo.text='Etiqueta_Modelo_Fiscal' then
   begin
        {sera usada a uses COMOBJ}
        { Abre o Word }
        MSWord := CreateOleObject('Word.Application');
        {não visualizar Microsoft Word}
        MSWord.Visible:=false;

        { Abre documento em anexo junto ao  exe}
        MSWord.Documents.Open(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text));
        DadosFiscal.First;
        while not DadosFiscal.Eof do
        begin
            { Escreve na  célula }
            MSWord.Selection.TypeText(Text :=trim(DadosFiscalNIRC_EMP.AsString)+'            ' + trim(DadosFiscalNOME_EMP.AsString) +#13+trim(DadosFiscalendereco.AsString) + ' '+trim(Dadosfiscalbairro.AsString)+#13+ trim(DadosFiscalcep.AsString)+ '  ' + trim(DadosFiscalCIDADE_EMP.AsString)+'       '+trim(DadosFiscalestado.AsString)+'  ' + trim(DadosFiscalCNPJ.asString)+ '  R$ '+ trim(formatfloat(',0.00',DadosFiscalCapital.value))+ '  ' + trim(DadosFiscalDATA_REG_SOCIAL.AsString) + #13 +trim(DadosFiscaldt_homologacao.AsString)+ '     ' + trim(DadosFiscaldt_ult_alter.AsString)+ '     ' + trim(DadosFiscalemail.AsString)+  '               ' + trim(DadosFiscalatividade.AsString)  );

            MSWord.Selection.MoveRight(12);
            DadosFiscal.Next;
        end;
        {visualizar Microsoft word }
        MSWord.Visible:=true;
        close;

   end
   else
   if comboModelo.text='Etiqueta_Modelo_Matricial' then
   begin

        {sera usada a uses COMOBJ}
        { Abre o Word }
        MSWord := CreateOleObject('Word.Application');
        {não visualizar Microsoft Word}
        MSWord.Visible:=false;

        { Abre documento em anexo junto ao  exe}
        MSWord.Documents.Open(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text));
        Dados.First;
        while not Dados.Eof do
        begin
             IF DadosREGISTRO.AsString ='' THEN
               MSWord.Selection.TypeText(Text :=trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString )
             ELSE
               MSWord.Selection.TypeText(Text :=trim(copy(DadosREGISTRO.AsString,1,7)+'/'+copy(DadosREGISTRO.AsString,8,4))+#13+trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString );

            MSWord.Selection.MoveRight(12);
            Dados.Next;
        end;
        {visualizar Microsoft word }
        MSWord.Visible:=true;
        close;


   end
   else
   if comboModelo.text='Pimaco - Carta 6180' then
   begin
      try
        x:=1;
        //sera usada a uses COMOBJ
        // Abre o Word
        MSWord := CreateOleObject('Word.Application');
        //não visualizar Microsoft Word
        MSWord.Visible:=false;

        //Abre documento em anexo junto ao  exe
        MSWord.Documents.Open(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text));
        finallinha:=false;//Essa variavel foi criada para controlar o avanço de para cada celula da coluna
        Dados.First;
        while not Dados.Eof do
        begin
             //Escreve na  célula
             IF DadosREGISTRO.AsString ='' THEN
               MSWord.Selection.TypeText(Text :=trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString )
             ELSE
               MSWord.Selection.TypeText(Text :=trim(copy(DadosREGISTRO.AsString,1,7)+'/'+copy(DadosREGISTRO.AsString,8,4))+#13+trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString );

             if x mod 3 = 0 then
                MSWord.Selection.MoveRight(12)
             else
             begin
                MSWord.Selection.MoveRight(12);
                MSWord.Selection.MoveRight(12);
             end;
             x:=x+1;
             Dados.Next;
        end;
        //visualizar Microsoft word
        MSWord.Visible:=true;
        close;

     except
           //BrOffice
            try
            x:=1;
            Docs :=  OpenDocument(FileName2URL(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text)));

            finallinha:=false;{Essa variavel foi criada para controlar o avanço de para cada celula da coluna }
            Dados.First;

            while not Dados.Eof do
            begin

                 If cont = 1 then
                 begin
                    InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,0);
                    Cont :=2;
                 end
                 else
                 begin
                   if x mod 3 = 0 then
                   begin
                      InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,1);
                   end
                   else
                   begin
                      InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,2);                   end;
                   x:=x+1;

                 end;

                 Dados.Next;
            end;

           Except
           erro('Microsoft Word e BrOffice Write não instalados.');
           end;
           close;

     end;

   end
   else
   begin // se não for etiqueta especial

      Try
        //sera usada a uses COMOBJ
        // Abre o Word
        MSWord := CreateOleObject('Word.Application');
        //não visualizar Microsoft Word
        MSWord.Visible:=false;

        // Abre documento em anexo junto ao  exe
        MSWord.Documents.Open(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text));
        finallinha:=false;//Essa variavel foi criada para controlar o avanço de para cada celula da coluna
        Dados.First;
        while not Dados.Eof do
        begin
             // Escreve na  célula
             IF DadosREGISTRO.AsString ='' THEN
               MSWord.Selection.TypeText(Text :=trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString )
             ELSE
               MSWord.Selection.TypeText(Text :=trim(copy(DadosREGISTRO.AsString,1,7)+'/'+copy(DadosREGISTRO.AsString,8,4))+#13+trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString );

             if finallinha=false then
               begin
                 // Pula 1 celula
                 MSWord.Selection.MoveRight(12);
                 MSWord.Selection.MoveRight(12);
                 finallinha:=true;
               end
             else
               begin
                 // vai para a proxima celula
                 MSWord.Selection.MoveRight(12);
                 finallinha:=false;
               end;
             Dados.Next;
        end;
        //visualizar Microsoft word
        MSWord.Visible:=true;
        close;

     except
           //BrOffice
            try
            Docs :=  OpenDocument(FileName2URL(ExtractFilePath(Application.ExeName)+ '\Etiquetas\'+Vermodelo(comboModelo.text)));

            finallinha:=false;{Essa variavel foi criada para controlar o avanço de para cada celula da coluna }
            Dados.First;

            while not Dados.Eof do
            begin

                 If cont = 1 then
                 begin
                    InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,0);
                    Cont :=2;
                 end
                 else
                 begin
                     if finallinha=false then
                       begin
                          InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,2);
                          finallinha:=true;
                       end
                     else
                       begin
                         InsertText( trim(Dadosnome.AsString)+#13+trim(Dadosendereco.AsString) + ' ' +trim(Dadoscomplemento.AsString) +' '+trim(Dadosbairro.AsString)+#13+trim(Dadoscidade.AsString)+' - '+trim(Dadosestado.AsString)+'  CEP '+Dadoscep.AsString , Docs,1);
                         finallinha:=false;
                       end;
                 end;

                 Dados.Next;
            end;

           Except
           erro('Microsoft Word e BrOffice Write não instalados.');
           end;
           close;

     end;
   end;
   EscondeAguarde;
end;
procedure TfrmEtiqueta.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEtiqueta.FormShow(Sender: TObject);
begin
  gerouetiqueta:=0;
end;

end.
