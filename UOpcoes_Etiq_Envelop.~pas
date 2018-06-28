unit UOpcoes_Etiq_Envelop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBClient;

type
  TFrmOpcoes_Etiq_Env = class(TForm)
    radEtiqueta: TRadioButton;
    radEnvelope: TRadioButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Dados: TClientDataSet;
    DadosREGISTRO: TStringField;
    Dadosnome: TStringField;
    Dadosendereco: TStringField;
    Dadoscomplemento: TStringField;
    Dadosbairro: TStringField;
    Dadoscep: TStringField;
    Dadoscidade: TStringField;
    Dadosestado: TStringField;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Imprime_Envelopes(Tipo:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOpcoes_Etiq_Env: TFrmOpcoes_Etiq_Env;

implementation

uses UQR_Envelope_MG, UQR_Envelope_A4, UQR_Envelope_MG_TipoOficio, UFuncoes;

{$R *.dfm}

procedure TFrmOpcoes_Etiq_Env.FormCreate(Sender: TObject);
begin
  Dados.CreateDataSet;
end;

procedure TFrmOpcoes_Etiq_Env.Imprime_Envelopes(Tipo:integer);
var
  op:char;
  brasao:integer;
begin

  if dados.RecordCount = 0 then
     Aviso('Não há registros para impressão.')
  else
  begin
     If confirma('Deseja visualizar antes de imprimir?') then
        op:='V';


     if not (Confirma('Coloque o(s) envelope(s) na impressora. Quando estive pronto clique em Sim.'+#13+'Continuar?' )) then
        Exit;

     If Tipo = 1 then //Envelope Tipo Médio
     begin
         Dados.First;
         While not Dados.Eof do
         begin
            Try Application.createform(TQR_Envelope_MG,QR_Envelope_MG);
            QR_Envelope_MG.labregistro.caption := copy(dadosregistro.value,1,7)+'/'+copy(dadosregistro.value,8,4);
            QR_Envelope_MG.labAssociado.caption:=dadosnome.value;
            IF dadosbairro.value <>'' THEN
                QR_Envelope_MG.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value + ' - ' + dadosbairro.value
            else
                QR_Envelope_MG.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value;

            if Length(dadoscep.value) = 8 then
                  QR_Envelope_MG.labBairroCidade.caption :='CEP ' + copy(dadoscep.value,1,2)+'.'+ copy(dadoscep.value,3,3)+'-'+ copy(dadoscep.value,6,3) +' - ' + dadoscidade.value + ' - ' + Dadosestado.value
            else
                 QR_Envelope_MG.labBairroCidade.caption :='CEP ' + dadoscep.value +' - ' + dadoscidade.value + ' - ' + Dadosestado.value;
            QR_Envelope_MG.labEstadoCep.caption :='';

            QR_Envelope_MG.qrImgLogo.Width:=1;
            QR_Envelope_MG.qrImgLogo.Height:=1;
            QR_Envelope_MG.qrImgLogo.Top:=-100;
            QR_Envelope_MG.labcore.Caption:='';

            if op='V' then
               QR_Envelope_MG.preview
            else
              QR_Envelope_MG.print;
            finally
            QR_Envelope_MG.free;
            end;
            Dados.Next;
          End;
     end
     else
     If Tipo = 2 then //Envelope Tipo Oficio
     begin

         Dados.First;
         While not Dados.Eof do
         begin
            Try Application.createform(TQR_Envelope_MG_TipoOficio,QR_Envelope_MG_TipoOficio);
            QR_Envelope_MG_TipoOficio.labregistro.caption := copy(dadosregistro.value,1,7)+'/'+copy(dadosregistro.value,8,4);
            QR_Envelope_MG_TipoOficio.labAssociado.caption:=dadosnome.value;
            IF dadosbairro.value <>'' THEN
                QR_Envelope_MG_TipoOficio.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value + ' - ' + dadosbairro.value
            else
                QR_Envelope_MG_TipoOficio.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value;

            if Length(dadoscep.value) = 8 then
                  QR_Envelope_MG_TipoOficio.labBairroCidade.caption :='CEP ' + copy(dadoscep.value,1,2)+'.'+ copy(dadoscep.value,3,3)+'-'+ copy(dadoscep.value,6,3) +' - ' + dadoscidade.value + ' - ' + Dadosestado.value
            else
                 QR_Envelope_MG_TipoOficio.labBairroCidade.caption :='CEP ' + dadoscep.value +' - ' + dadoscidade.value + ' - ' + Dadosestado.value;
            QR_Envelope_MG_TipoOficio.labEstadoCep.caption :='';
             if op='V' then
               QR_Envelope_MG_TipoOficio.preview
            else
               QR_Envelope_MG_TipoOficio.print;
            finally
            QR_Envelope_MG_TipoOficio.free;
            end;
            Dados.Next;
          End;
     end
     else
     If Tipo = 3 then //Envelope Tipo A4
     begin
         Dados.First;
         While not Dados.Eof do
         begin
            Try Application.createform(TQR_Envelope_A4,QR_Envelope_A4);
            QR_Envelope_A4.labregistro.caption := copy(dadosregistro.value,1,7)+'/'+copy(dadosregistro.value,8,4);
            QR_Envelope_A4.labAssociado.caption:=dadosnome.value;
            IF dadosbairro.value <>'' THEN
                QR_Envelope_A4.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value + ' - ' + dadosbairro.value
            else
                QR_Envelope_A4.labendereco.caption :=dadosendereco.value+' ' + dadoscomplemento.value;

            if Length(dadoscep.value) = 8 then
                  QR_Envelope_A4.labBairroCidade.caption :='CEP ' + copy(dadoscep.value,1,2)+'.'+ copy(dadoscep.value,3,3)+'-'+ copy(dadoscep.value,6,3) +' - ' + dadoscidade.value + ' - ' + Dadosestado.value
            else
                 QR_Envelope_A4.labBairroCidade.caption :='CEP ' + dadoscep.value +' - ' + dadoscidade.value + ' - ' + Dadosestado.value;
            QR_Envelope_A4.labEstadoCep.caption :='';
             if op='V' then
               QR_Envelope_A4.preview
            else
               QR_Envelope_A4.print;
            finally
            QR_Envelope_A4.free;
            end;
            Dados.Next;
          End;
     end;
  end;
end;

end.
