unit UAlterDadosBasicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, ExtCtrls, JvToolEdit, JvLookup, Mask, StdCtrls,
  Buttons, WinSkinData, FMTBcd, SqlExpr, Provider, DB, DBClient, DBCtrls;

type
  TfrmAlterDadosBasicos = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    edNome: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    edRegistro: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edTpPessoa: TJvLookupEdit;
    edlocalidade: TJvLookupEdit;
    Bevel1: TBevel;
    dsTp_Pessoa: TDataSource;
    cdsTp_Pessoa: TClientDataSet;
    cdsTp_PessoaTP_ASSOC_ID: TIntegerField;
    cdsTp_PessoaTP_ASSOC_DESC: TStringField;
    dspTp_Pessoa: TDataSetProvider;
    sdsTp_Pessoa: TSQLDataSet;
    dsEmp_Regiao: TDataSource;
    cdsEmp_regiao: TClientDataSet;
    cdsEmp_regiaoEMP_ID: TIntegerField;
    cdsEmp_regiaoREGIAO: TStringField;
    dspEmp_Regiao: TDataSetProvider;
    sdsEmp_Regiao: TSQLDataSet;
    edcpfcnpj: TMaskEdit;
    Label5: TLabel;
    dbStatus: TJvLookupEdit;
    sdsTp_Status: TSQLDataSet;
    dspTp_Status: TDataSetProvider;
    cdsTp_Status: TClientDataSet;
    cdsTp_StatusTP_STATUS_ID: TIntegerField;
    cdsTp_StatusTP_STATUS_DESCR: TStringField;
    dsTp_Status: TDataSource;
    procedure BtnOKClick(Sender: TObject);
    procedure edTpPessoaButtonClick(Sender: TObject);
    procedure edTpPessoaCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterDadosBasicos: TfrmAlterDadosBasicos;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmAlterDadosBasicos.BtnOKClick(Sender: TObject);
begin
  inherited;
  If edRegistro.text='' then
  begin
      Aviso('Campo Registro não pode ser vazio.');
      edRegistro.setfocus;
      modalresult :=mrnone;
      Abort;
  end;

  If edNome.text='' then
  begin
      Aviso('Campo Nome não pode ser vazio.');
      edNome.setfocus;
      modalresult :=mrnone;
      Abort;
  end;

  If edcpfcnpj.text='' then
  begin
      Aviso('Campo CPF/CNPJ não pode ser vazio.');
      edcpfcnpj.setfocus;
      modalresult :=mrnone;
      Abort;
  end;

  If edTpPessoa.text='' then
  begin
      Aviso('Campo Tipo de Pessoa não pode ser vazio.');
      edTpPessoa.setfocus;
      modalresult :=mrnone;
      Abort;
  end;


  If edlocalidade.text='' then
  begin
      Aviso('Campo Localidade não pode ser vazio.');
      edlocalidade.setfocus;
      modalresult :=mrnone;
      Abort;
  end;
end;

procedure TfrmAlterDadosBasicos.edTpPessoaButtonClick(Sender: TObject);
begin
  inherited;
  If edTpPessoa.text='Pessoa Física' then
  begin
     edcpfcnpj.EditMask:='999.999.999-99;0;_';
  end
  else
  If edTpPessoa.text='Pessoa Jurídica' then
  begin
     edcpfcnpj.EditMask:='99.999.999/9999-99;0;_';
  end;

end;

procedure TfrmAlterDadosBasicos.edTpPessoaCloseUp(Sender: TObject);
begin
  inherited;
  If edTpPessoa.text='Pessoa Física' then
  begin
     edcpfcnpj.EditMask:='999.999.999-99;0;_';
  end
  else
  If edTpPessoa.text='Pessoa Jurídica' then
  begin
     edcpfcnpj.EditMask:='99.999.999/9999-99;0;_';
  end;

end;

end.
