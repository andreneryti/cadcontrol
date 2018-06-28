unit UDmlotes;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBLocal,
  DBLocalS;

type
  TDMLotes = class(TDataModule)
    sdsLocLotes: TSQLDataSet;
    dspLocLotes: TDataSetProvider;
    cdsLocLotes: TClientDataSet;
    cdsLocLotesIDLOTE: TIntegerField;
    cdsLocLotesNOMELOTE: TStringField;
    cdsLocLotesDATACRIACAO: TDateField;
    cdsLocLotesIDUSER: TIntegerField;
    cdsLocLotesNOMEDATA: TStringField;
    sdsContribs: TSQLDataSet;
    dspContribs: TDataSetProvider;
    cdsContribs: TClientDataSet;
    sdsItensLote: TSQLDataSet;
    dspItensLote: TDataSetProvider;
    cdsItensLote: TClientDataSet;
    cdsItensLoteREGISTRO: TStringField;
    cdsItensLoteNOME: TStringField;
    cdsItensLoteTP_PESSOA: TStringField;
    cdsItensLoteULT_STATUS: TStringField;
    cdsItensLoteIDLOTEITEM: TIntegerField;
    sdsItensContribs: TSQLDataSet;
    dspItensContribs: TDataSetProvider;
    cdsItensContribs: TClientDataSet;
    cdsItensContribsANO: TIntegerField;
    cdsItensContribsVENCIMENTO: TDateField;
    cdsItensContribsULT_STATUS: TStringField;
    cdsItensContribsDATAREPASSE: TDateField;
    cdsItensContribsUSER_REPASSE: TStringField;
    cdsItensContribsIDUSERDATAREPASSE: TIntegerField;
    cdsItensContribsTOTAL: TFMTBCDField;
    cdsItensContribsVALOR: TFMTBCDField;
    cdsItensContribsMULTA: TFMTBCDField;
    cdsItensContribsJUROS: TFMTBCDField;
    cdsItensContribsCORRECAO: TFMTBCDField;
    cdsItensContribsDATAINCLUSAO: TDateField;
    cdsItensContribsUSER_INCLUSAO: TStringField;
    cdsItensContribsIDUSERINCLUSAO: TIntegerField;
    cdsItensContribsDATAATUALIZACAO: TDateField;
    cdsItensContribsUSER_ALTERACAO: TStringField;
    cdsItensContribsIDUSERATUALIZACAO: TIntegerField;
    cdsItensContribsIDLOTEITEMCONTRIB: TIntegerField;
    cdsItensContribsANUID_ID: TIntegerField;
    cdsItensContribsIDLOTEITEM: TIntegerField;
    sqlContribs: TSQLClientDataSet;
    sqlContribsANO: TIntegerField;
    sqlContribsVENCIMENTO: TDateField;
    sqlContribsULT_STATUS: TStringField;
    sqlContribsDATAREPASSE: TDateField;
    sqlContribsUSER_REPASSE: TStringField;
    sqlContribsIDUSERDATAREPASSE: TIntegerField;
    sqlContribsTOTAL: TFMTBCDField;
    sqlContribsVALOR: TFMTBCDField;
    sqlContribsMULTA: TFMTBCDField;
    sqlContribsJUROS: TFMTBCDField;
    sqlContribsCORRECAO: TFMTBCDField;
    sqlContribsDATAINCLUSAO: TDateField;
    sqlContribsUSER_INCLUSAO: TStringField;
    sqlContribsIDUSERINCLUSAO: TIntegerField;
    sqlContribsDATAATUALIZACAO: TDateField;
    sqlContribsUSER_ALTERACAO: TStringField;
    sqlContribsIDUSERATUALIZACAO: TIntegerField;
    sqlContribsIDLOTEITEMCONTRIB: TIntegerField;
    sqlContribsANUID_ID: TIntegerField;
    sdsItens: TSQLClientDataSet;
    sdsItensIDLOTEITEM: TIntegerField;
    sdsItensREGISTRO: TStringField;
    sdsItensNOME: TStringField;
    sdsItensTP_PESSOA: TStringField;
    sdsItensULT_STATUS: TStringField;
    cdsContribsANUID_ID: TIntegerField;
    cdsContribsANO: TIntegerField;
    cdsContribsVALOR: TFMTBCDField;
    cdsContribsVENCIMENTO: TDateField;
    cdsContribsMULTA: TFMTBCDField;
    cdsContribsJUROS: TFMTBCDField;
    cdsContribsCORRECAO: TFMTBCDField;
    cdsContribsTOTAL: TFMTBCDField;
    cdsContribsTPCONTRIB_ID: TIntegerField;
    sqlContribsTPCONTRIB: TStringField;
    SDSNUMLOTE: TSQLClientDataSet;
    SDSNUMLOTENUMLOTE: TStringField;
    cdsLocLotesDESCRICAO: TStringField;
    sdsItensASS_ID: TIntegerField;
    sdsItensCPFCNPJ: TStringField;
    sdsItensTOTALVALOR: TFMTBCDField;
    sdsItensANOS: TStringField;
    sdsItensEMP_ID: TIntegerField;
    sdsItensSINDICATO: TStringField;
    sdsLotesRepasse: TSQLClientDataSet;
    sdsLotesRepasseBOL_ID: TIntegerField;
    sdsLotesRepasseASS_ID: TIntegerField;
    sdsLotesRepasseNOSSONUMERO: TStringField;
    sdsLotesRepasseDT_RECEBIMENTO: TDateField;
    sdsLotesRepasseDT_CREDITO: TDateField;
    sdsLotesRepasseVALOR_RECEBIMENTO: TFMTBCDField;
    sdsLotesRepasseDESCONTO_PAGTO: TFMTBCDField;
    sdsLotesRepasseTP_CONTRIB_DESCRICAO: TStringField;
    sdsLotesRepasseFORMA_PAGTO: TStringField;
    sdsLotesRepasseENCARGOS_PAGO: TFMTBCDField;
    sdsLotesRepasseANUID_ID: TIntegerField;
    sdsLotesRepasseANO: TIntegerField;
    sdsLotesRepasseVALORAREPASSAR: TFMTBCDField;
    sdsLotesRepasseDATAREPASSE: TDateField;
    sdsLotesRepasseVALORREPASSADO: TFMTBCDField;
    sdsLotesRepasseVENCIMENTO: TDateField;
    sdsLotesRepasseDT_BAIXA: TDateField;
    sdsLotesRepassePARC_ID: TIntegerField;
    sdsLotesRepasseIDLOTE: TIntegerField;
    sdsLotesRepasseREGISTRO: TStringField;
    sdsLotesRepasseNOME: TStringField;
    sdsLotesRepasseSINDICATO: TStringField;
    sdsLotesRepasseTOTVALOR: TFMTBCDField;
    sdsItensEMAIL: TStringField;
    sdsItensNOTIFICACAO: TStringField;
    procedure sdsItensAfterScroll(DataSet: TDataSet);
    function NovoNumLote(tipo:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLotes: TDMLotes;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TDMLotes.sdsItensAfterScroll(DataSet: TDataSet);
begin
{  try
   sqlContribs.close;
   sqlContribs.Params.ParamByName('IDLOTEITEM').value := sdsitensIDLOTEITEM.value;
   sqlContribs.open;
  except
    sdsitens.first;
  end;}
 end;

function TDMLotes.NovoNumLote(tipo: string): string;
var
   numero:string;
begin
    SDSNUMLOTE.close;
    SDSNUMLOTE.open;
    numero := 'LOTE-'+tipo + SDSNUMLOTENUMLOTE.value;
    SDSNUMLOTE.close;
    result := numero;

end;

end.
