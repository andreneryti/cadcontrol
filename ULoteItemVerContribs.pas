unit ULoteItemVerContribs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, Provider, SqlExpr, ExtCtrls, StdCtrls, Buttons,
  DB, DBClient, DBLocal, DBLocalS, Grids, DBGrids, WinSkinData, Menus;

type
  TfrmLoteItemVerContribs = class(TModeloComum)
    Label1: TLabel;
    gridSind: TDBGrid;
    Label2: TLabel;
    labCadastro: TLabel;
    labLote: TLabel;
    dsContribs: TDataSource;
    sdsContribs: TSQLClientDataSet;
    btn5: TBitBtn;
    Bevel1: TBevel;
    sdsContribsIDLOTEITEMCONTRIB: TIntegerField;
    sdsContribsIDLOTEITEM: TIntegerField;
    sdsContribsANUID_ID: TIntegerField;
    sdsContribsDATAINCLUSAO: TDateField;
    sdsContribsDATAREPASSE: TDateField;
    sdsContribsIDUSERINCLUSAO: TIntegerField;
    sdsContribsIDUSERDATAREPASSE: TIntegerField;
    sdsContribsVALOR: TFMTBCDField;
    sdsContribsMULTA: TFMTBCDField;
    sdsContribsJUROS: TFMTBCDField;
    sdsContribsCORRECAO: TFMTBCDField;
    sdsContribsTOTAL: TFMTBCDField;
    sdsContribsDATAATUALIZACAO: TDateField;
    sdsContribsIDUSERATUALIZACAO: TIntegerField;
    sdsContribsANO: TIntegerField;
    sdsContribsVENCIMENTO: TDateField;
    sdsContribsVALORREPASSE: TFMTBCDField;
    Label3: TLabel;
    labtotal: TLabel;
    sdsContribsCONTRIBUICAO: TStringField;
    PopupMenu1: TPopupMenu;
    ExcluirContribuio1: TMenuItem;
    procedure btn5Click(Sender: TObject);
    procedure ExcluirContribuio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoteItemVerContribs: TfrmLoteItemVerContribs;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmLoteItemVerContribs.btn5Click(Sender: TObject);
begin
  inherited;
  If sdsContribs.RecordCount = 0 then
     Aviso('Atenção! Este cadastro ficou sem contribuição no lote de recuperação.'+#13+'Exclua ele do Lote. ');
  close;
end;

procedure TfrmLoteItemVerContribs.ExcluirContribuio1Click(Sender: TObject);
begin
  inherited;
  if confirma('Confirma a exclusão da ' + sdsContribsCONTRIBUICAO.Value +' do cadastro '+#13 + labCadastro.Caption+'?') then
  begin
    try
      DMConexao.ExecSQL('delete from lotecontribstatus s where s.idloteitemcontrib =' + IntToStr(sdsContribsIDLOTEITEMCONTRIB.Value));
      DMConexao.ExecSQL('delete from loteitenscontribs s where s.idloteitemcontrib =' + IntToStr(sdsContribsIDLOTEITEMCONTRIB.Value));
      sdsContribs.close;
      sdsContribs.open;

    except
      Aviso('Erro ao tentar excluir a contribuição selecionada. ');
    end;
  end;
end;

end.
