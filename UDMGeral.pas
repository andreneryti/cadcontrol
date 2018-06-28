unit UDMGeral;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMGeral = class(TDataModule)
    sdsIndice: TSQLDataSet;
    dspIndice: TDataSetProvider;
    cdsIndice: TClientDataSet;
    dsIndice: TDataSource;
    PROC_INDICE_I: TSQLStoredProc;
    PROC_INDICE_DEL: TSQLStoredProc;
    sdsTipoContato: TSQLDataSet;
    dspTipoContato: TDataSetProvider;
    cdsTipoContato: TClientDataSet;
    dsTpoContato: TDataSource;
    cdsTipoContatoTP_CONTATO: TIntegerField;
    cdsTipoContatoTP_CONTATO_DESC: TStringField;
    PROC_TIPO_CONTATO_UI: TSQLStoredProc;
    PROC_TIPO_CONTATO_DEL: TSQLStoredProc;
    sdsValorContrib: TSQLDataSet;
    dspValorContrib: TDataSetProvider;
    cdsValorContrib: TClientDataSet;
    dsValorContrib: TDataSource;
    cdsValorContribVALOR_CONTRIB_ID: TIntegerField;
    cdsValorContribTP_ASSOC_ID: TIntegerField;
    cdsValorContribEMP_ID: TIntegerField;
    cdsValorContribTP_CONTRIB_ID: TIntegerField;
    cdsValorContribVALOR: TFMTBCDField;
    cdsValorContribANO: TIntegerField;
    cdsValorContribVENCIMENTO: TDateField;
    cdsValorContribFAIXA_CAPITAL: TFMTBCDField;
    cdsValorContribVALOR_ALIQUOTA: TFMTBCDField;
    sdsEmp_Regiao: TSQLDataSet;
    dspEmp_Regiao: TDataSetProvider;
    cdsEmp_regiao: TClientDataSet;
    cdsEmp_regiaoEMP_ID: TIntegerField;
    cdsEmp_regiaoREGIAO: TStringField;
    dsEmp_Regiao: TDataSource;
    sdsTp_Pessoa: TSQLDataSet;
    dspTp_Pessoa: TDataSetProvider;
    cdsTp_Pessoa: TClientDataSet;
    cdsTp_PessoaTP_ASSOC_ID: TIntegerField;
    cdsTp_PessoaTP_ASSOC_DESC: TStringField;
    dsTp_Pessoa: TDataSource;
    sdsTpContrib: TSQLDataSet;
    dspTpContrib: TDataSetProvider;
    cdsTpContrib: TClientDataSet;
    dsTpContrib: TDataSource;
    cdsTpContribTP_CONTRIB_ID: TIntegerField;
    cdsTpContribTP_CONTRIB_DESCRICAO: TStringField;
    PROC_VALORCONTRIB_UI: TSQLStoredProc;
    PROC_VALORES_DEL: TSQLStoredProc;
    PROC_TPMOVIMENTO_DEL: TSQLStoredProc;
    PROC_TPMOVIMENTO_UI: TSQLStoredProc;
    sdsTipoMovimento: TSQLDataSet;
    dspTipoMovimento: TDataSetProvider;
    cdsTipoMovimento: TClientDataSet;
    dsTipoMovimento: TDataSource;
    cdsTipoMovimentoTP_MOV_ID: TIntegerField;
    cdsTipoMovimentoTP_MOV_DESCRICAO: TStringField;
    sdsIndiceINDICE_ID: TIntegerField;
    sdsIndiceTP_INDICE_ID: TIntegerField;
    sdsIndiceVALOR2: TFMTBCDField;
    sdsIndiceMES: TIntegerField;
    sdsIndiceANO: TIntegerField;
    sdsIndiceDT_LANCAMENTO: TDateField;
    sdsIndiceDT_VIGENCIA: TDateField;
    sdsIndiceDIA_SEMANA: TStringField;
    cdsIndiceINDICE_ID: TIntegerField;
    cdsIndiceTP_INDICE_ID: TIntegerField;
    cdsIndiceVALOR2: TFMTBCDField;
    cdsIndiceMES: TIntegerField;
    cdsIndiceANO: TIntegerField;
    cdsIndiceDT_LANCAMENTO: TDateField;
    cdsIndiceDT_VIGENCIA: TDateField;
    cdsIndiceDIA_SEMANA: TStringField;
    sdsIndiceigpm: TSQLDataSet;
    dspIndiceIpgm: TDataSetProvider;
    cdsIndiceigpm: TClientDataSet;
    dsIndiceigpm: TDataSource;
    cdsIndiceigpmINDICE_ID: TIntegerField;
    cdsIndiceigpmTP_INDICE_ID: TIntegerField;
    cdsIndiceigpmVALOR: TFMTBCDField;
    cdsIndiceigpmMES: TIntegerField;
    cdsIndiceigpmANO: TIntegerField;
    cdsIndiceigpmDT_LANCAMENTO: TDateField;
    cdsIndiceigpmDT_VIGENCIA: TDateField;
    cdsIndiceigpmMES_EXTENSO: TStringField;
    PROC_INDICE_IGPM_I: TSQLStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGeral: TDMGeral;

implementation

uses UDMConexao;

{$R *.dfm}

end.
