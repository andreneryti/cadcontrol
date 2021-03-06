unit UManutAnuidadesRegPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, JvEdit,
  JvTypedEdit, Mask, Buttons, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfrmManutAnuidadesRegPagto = class(TModeloComum)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    labDescricao: TLabel;
    labVencimento: TLabel;
    labTotal: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edDtPagto: TMaskEdit;
    edValorPago: TJvCurrencyEdit;
    Bevel2: TBevel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    sdsVerRecibo: TSQLDataSet;
    dspVerRecibo: TDataSetProvider;
    cdsVerRecibo: TClientDataSet;
    cdsVerReciboQTDE: TIntegerField;
    sdsGeraRecibo: TSQLDataSet;
    dspGeraRecibo: TDataSetProvider;
    cdsGeraRecibo: TClientDataSet;
    cdsGeraReciboRECIBO: TStringField;
    edrecibo: TEdit;
    procedure edReciboKeyPress(Sender: TObject; var Key: Char);
    procedure edReciboExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutAnuidadesRegPagto: TfrmManutAnuidadesRegPagto;

implementation

uses UFuncoes, UDMAssociado, UDMConexao;

{$R *.dfm}

procedure TfrmManutAnuidadesRegPagto.edReciboKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((key <#47) or (key>#58)) and (key<>#8) then
     key := #0;

end;

procedure TfrmManutAnuidadesRegPagto.edReciboExit(Sender: TObject);
begin
  inherited;
   If trim(edRecibo.text)='' then
       edRecibo.clear;
end;

procedure TfrmManutAnuidadesRegPagto.BtnOKClick(Sender: TObject);
begin
  inherited;
  Try
  strtodate(edDtPagto.Text);
  except
  Erro('Data inv�lida.      ');
  edDtPagto.setfocus;
  ModalResult := mrnone;
  Abort;
  end;

  if edValorPago.Value = 0 then
  begin
     Aviso('Valor pago n�o pode ser zero. ');
     edValorPago.setfocus;
     ModalResult := mrnone;
     Abort;

  end;

  if edValorPago.Value < strtofloat(
                                        stringreplace(
                                                stringreplace(labTotal.Caption,'.','',[rfReplaceAll])
                                                ,'R$ ','',[rfReplaceAll])

                                        )then
  begin
     if not confirma ('Valor pago � menor que o valor a pagar. '+#13 + 'Deseja continuar? ') then
     begin
        edValorPago.setfocus;
        ModalResult := mrnone;
        Abort;
     end;
  end;

  If edRecibo.text<>'' then
  begin
      cdsVerRecibo.close;
      cdsVerRecibo.Params.ParamByName('nossonumero').value := edRecibo.text;
      cdsVerRecibo.open;

      If cdsVerReciboQTDE.value > 0 then
      begin
         Aviso('N�o � poss�vel registrar este pagamento, pois j� existe um recibo com este n�mero.');
         edRecibo.setfocus;
         ModalResult := mrnone;
         abort;
      end;
  end
  else
  If edRecibo.text='' then
  begin
     cdsGeraRecibo.close;
     cdsGeraRecibo.Open;
     edRecibo.text := cdsGeraReciboRECIBO.value;
     cdsGeraRecibo.close;
  end;

end;

procedure TfrmManutAnuidadesRegPagto.FormShow(Sender: TObject);
begin
  inherited;
  edDtPagto.setfocus;
end;

end.
