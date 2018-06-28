unit UDMMalaDireta;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient, DBLocal,
  DBLocalS;

type
  TDMMalaDireta = class(TDataModule)
    PROC_MALADIRETA_UI: TSQLStoredProc;
    sdsMalas: TSQLClientDataSet;
    sdsMalasMALA_ID: TIntegerField;
    sdsMalasDATACRIACAO: TDateField;
    sdsMalasUSUARIO: TIntegerField;
    sdsMalasASSUNTO: TStringField;
    sdsMalasTEXTOEMAIL: TBlobField;
    sdsMalasTEXTOMALADIRETA: TStringField;
    sdsMalasPRIORIDADE: TIntegerField;
    sdsMalasSTATUS: TIntegerField;
    sdsMalasNOMEUSER: TStringField;
    sdsMalasSTATUSNOME: TStringField;
    PROC_MALADIRETA_PRIORIDADE: TSQLStoredProc;
    PROC_MALADIRETA_D: TSQLStoredProc;
    PROC_MALADIRETA_ORGANPRIOR: TSQLStoredProc;
    sdsMalasNOMEIDENTIFICACAO: TStringField;
    PROC_MALADIRETAITEM_I: TSQLStoredProc;
    PROC_MALADIRETAITEM_ANEXO_I: TSQLStoredProc;
    sdsMalaItemID: TSQLClientDataSet;
    sdsMalaItemIDIDITEM: TIntegerField;
    sdsMalasTOTALEMAILS: TIntegerField;
    sdsMalasAENVIAR: TIntegerField;
    sdsMalasENVIADOS: TIntegerField;
    sdsMalasERRO_ENVIAR: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMalaDireta: TDMMalaDireta;

implementation

uses UDMConexao;

{$R *.dfm}

end.
