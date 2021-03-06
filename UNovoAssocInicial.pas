unit UNovoAssocInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, DBCtrls, StdCtrls, Mask, ExtCtrls, WinSkinData,
  Buttons, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
  TfrmNovoAssocInicial = class(TModeloComum)
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label2: TLabel;
    labcpfcnpj: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edRegistro: TDBEdit;
    edNome: TDBEdit;
    edcpfcnpj: TDBEdit;
    dbtppessoa: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    dbregsocial: TDBEdit;
    sdsVerCPFCNPJ: TSQLClientDataSet;
    sdsVerCPFCNPJNOME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure mudamask;
    procedure dbtppessoaClick(Sender: TObject);
    procedure dbtppessoaExit(Sender: TObject);
    procedure dbtppessoaCloseUp(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoAssocInicial: TfrmNovoAssocInicial;

implementation

uses UDMAssociado, UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmNovoAssocInicial.FormShow(Sender: TObject);
begin
  inherited;
  DMAssociado.cdsEmp_Regiao.Open;
  DMAssociado.cdsEmp_Regiao.First;
  DMAssociado.cdsTp_Pessoa.Open;
  DMAssociado.cdsTp_Pessoa.First;
  edNome.SetFocus;
  mudamask;

end;

procedure TfrmNovoAssocInicial.mudamask;
begin
    If dbtppessoa.text='Pessoa Jur�dica' then
    begin
        DMAssociado.dsAssoc.DataSet.FieldByName('cpfcnpj').EditMask:= '99.999.999/9999-99;0;';
        labcpfcnpj.caption:='CNPJ';
        dbregsocial.Enabled:=true;
    end
    else
    If dbtppessoa.text='Pessoa F�sica' then
    begin
        DMAssociado.dsAssoc.DataSet.FieldByName('cpfcnpj').EditMask:= '999.999.999-99;0;';
        labcpfcnpj.caption:='CPF';
        dbregsocial.Enabled:=false;
    end;
end;

procedure TfrmNovoAssocInicial.dbtppessoaClick(Sender: TObject);
begin
  inherited;
  mudamask
end;

procedure TfrmNovoAssocInicial.dbtppessoaExit(Sender: TObject);
begin
  inherited;
  mudamask
end;

procedure TfrmNovoAssocInicial.dbtppessoaCloseUp(Sender: TObject);
begin
  inherited;
  mudamask
end;

procedure TfrmNovoAssocInicial.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If DMAssociado.dsAssoc.DataSet.FieldByName('NOME').value=null then
  begin
     Aviso('Nome n�o pode ser vazio. ');
     ednome.SetFocus;
     modalresult := mrNone;
  end
  else
  If DMAssociado.dsAssoc.DataSet.FieldByName('CPFCNPJ').value=null then
  begin
     Aviso('CPF/CNPJ n�o pode ser vazio. ');
     edcpfcnpj.SetFocus;
     modalresult := mrNone;
  end
  else
  If (DMAssociado.dsAssoc.DataSet.FieldByName('TP_ASSOC_ID').value =1)
  and (DMAssociado.dsAssoc.DataSet.FieldByName('DT_REGSOCIAL').value=null) then
  begin
     Aviso('Data do Registro Social n�o pode ser vazia. ');
     dbregsocial.SetFocus;
     modalresult := mrNone;
  end
  else
  begin
     sdsVerCPFCNPJ.close;
     sdsVerCPFCNPJ.Params[0].value :=  DMAssociado.dsAssoc.DataSet.FieldByName('CPFCNPJ').value;
     sdsVerCPFCNPJ.open;
     If sdsVerCPFCNPJ.RecordCount = 1 then
     begin
         if not Confirma('J� existe um Registrado ativo com este CPF/CNPJ. '+#13+sdsVerCPFCNPJNOME.value+#13+'Deseja continuar mesmo assim? ') then
         begin
            edcpfcnpj.SetFocus;
            modalresult := mrNone;
         end;

     end;

  end;

  DMAssociado.sdsTestaRegistro.close;
  DMAssociado.sdsTestaRegistro.ParamByName('registro').value :=DMAssociado.cdsAssocREGISTRO.value;
  DMAssociado.sdsTestaRegistro.Open;

  if DMAssociado.sdsTestaRegistroQTDE.value > 0 then
  begin
     if Confirma('J� existe um filiado cadastrado com este n�mero de registro.'+#13+'Deseja gerar o pr�ximo n�mero?') then
     begin
        DMAssociado.sdsNovoRegistro.close;
        DMAssociado.sdsNovoRegistro.Open;
        DMAssociado.cdsAssocREGISTRO.value := trim(DMAssociado.sdsNovoRegistroNOVOREGISTRO.value) + inttostr(extractyear(DataAtual));
     end
     else
     begin
        Modalresult := mrnone;
        abort;
     end;
  end;


end;

procedure TfrmNovoAssocInicial.BitBtn1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   BITBTN1.SETFOCUS;
end;

end.
