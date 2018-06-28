unit ULoteControleAddContrib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Mask, WinSkinData, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
  TfrmLoteControleAddContrib = class(TModeloComum)
    Label1: TLabel;
    editAno1: TMaskEdit;
    Label5: TLabel;
    editano2: TMaskEdit;
    labRegistroNome: TLabel;
    bvl1: TBevel;
    gridSind: TDBGrid;
    Label3: TLabel;
    btnAdd: TBitBtn;
    btnLocalizar: TBitBtn;
    btn2: TBitBtn;
    btn5: TBitBtn;
    dsContribs: TDataSource;
    sdsContribs: TSQLClientDataSet;
    sdsContribsTIPOCONTRIB: TStringField;
    sdsContribsANUID_ID: TIntegerField;
    sdsContribsVENCIMENTO: TDateField;
    sdsContribsANO: TIntegerField;
    sdsContribsTOTAL: TFMTBCDField;
    sdsContribsVALOR: TFMTBCDField;
    sdsContribsMULTA: TFMTBCDField;
    sdsContribsJUROS: TFMTBCDField;
    sdsContribsCORRECAO: TFMTBCDField;
    procedure btn5Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure editAno1Change(Sender: TObject);
    procedure AddContribuicao;
    procedure btnAddClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoteControleAddContrib: TfrmLoteControleAddContrib;
  ass_id, idloteitem:Integer;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmLoteControleAddContrib.AddContribuicao;
begin
      if sdsContribsTIPOCONTRIB.Value = 'Sindical' then
      begin

          if (DMConexao.ExecuteProc('PROC_LOTEITENSCONTRIBS_I',
                                      inttostr(0) + ',' +
                                      inttostr(idloteitem) + ',' +
                                      inttostr(sdsContribsANUID_ID.value) + ',' +
                                      quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                                      inttostr(UserId) + ',' +
                                      stringreplace(floattostr(sdsContribsVALOR.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                      stringreplace(floattostr(sdsContribsMULTA.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                      stringreplace(floattostr(sdsContribsJUROS.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                      stringreplace(floattostr(sdsContribsCORRECAO.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                      stringreplace(floattostr(sdsContribsTOTAL.asfloat), ',', '.', [rfReplaceAll]) + ', ' +
                                      quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                                      inttostr(UserId) + ',' +
                                      inttostr(sdsContribsANO.value) + ',' +
                                      quotedstr(inttostr(ExtractYear(sdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractMonth(sdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractDay(sdsContribsVENCIMENTO.value)))
                                      )) = 0 then
          begin
                  Aviso('Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + '. ');
          end;

      end
      else if sdsContribsTIPOCONTRIB.Value = 'Confederativa' then
      begin
          if (DMConexao.ExecuteProc('PROC_LOTEITENSCONTRIBS_I',
                                  inttostr(0) + ',' +
                                  inttostr(idloteitem) + ',' +
                                  inttostr(sdsContribsANUID_ID.value) + ',' +
                                  quotedstr(inttostr(ExtractYear(DataAtual)) + '.' +
                                  inttostr(ExtractMonth(DataAtual)) + '.' +
                                  inttostr(ExtractDay(DataAtual))) + ',' +
                                  inttostr(UserId) + ',' +
                                  inttostr(0) + ', ' +
                                  inttostr(0) + ', ' +
                                  inttostr(0) + ', ' +
                                  inttostr(0) + ', ' +
                                  inttostr(0) + ', ' +
                                  quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                                  inttostr(UserId) + ',' +
                                  inttostr(sdsContribsANO.value) + ',' +
                                  quotedstr(inttostr(ExtractYear(sdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractMonth(sdsContribsVENCIMENTO.value)) + '.' + inttostr(ExtractDay(sdsContribsVENCIMENTO.value))))) = 0 then
          begin
                  Aviso('Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + '. ');
          end;
      end;

end;

procedure TfrmLoteControleAddContrib.btn5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLoteControleAddContrib.btnLocalizarClick(Sender: TObject);
begin
  inherited;
    try
       strtoint(editAno1.text);
    except
        Aviso('Ano inicial inválido. ');
        Exit;
    end;
    try
       strtoint(editAno2.text);
    except
        Aviso('Ano final inválido. ');
        Exit;
    end;

    sdsContribs.close;
    sdsContribs.CommandText := ' select p.tipocontrib, p.anuid_id,p.vencimento, p.ano, p.total, p.valor, p.multa, p.juros, p.correcao from proc_debitos( ';
    sdsContribs.CommandText := sdsContribs.CommandText + inttostr(ass_id) + ', ' + quotedstr('A') + ', ' + QuotedStr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ') p';
    sdsContribs.CommandText := sdsContribs.CommandText + ' where  not exists (select 1 from loteitenscontribs lc where  lc.idloteitem = ' + IntToStr(idloteitem)+ ' and lc.anuid_id = p.anuid_id ) ';
    sdsContribs.CommandText := sdsContribs.CommandText + ' and p.ano between ' + editAno1.text + '  and  ' + editAno2.text + ' order by p.ano, p.tipocontrib desc ';
    sdsContribs.Open;

    sdsContribs.Filtered := false;
    sdsContribs.Filter := 'tipocontrib=''Sindical''';
    sdsContribs.Filtered := true;

end;

procedure TfrmLoteControleAddContrib.editAno1Change(Sender: TObject);
begin
  inherited;
  sdsContribs.close;
end;

procedure TfrmLoteControleAddContrib.btnAddClick(Sender: TObject);
var
    ano:Integer;
    filtro:string;
begin
  inherited;
  if sdsContribs.Active =true then
     if sdsContribs.RecordCount > 0 then
     begin
         AddContribuicao;
         ano := sdsContribsANO.Value;
         sdsContribs.DisableControls;
         sdsContribs.filtered := false;
         filtro := sdsContribs.Filter;
         sdsContribs.Filter := ' ano =' + IntToStr(ano) + 'and tipocontrib=''Confederativa''';
         sdsContribs.filtered := true;
         If sdsContribs.RecordCount > 0 then
         begin
            sdsContribs.first;
            while not sdsContribs.eof do
            begin
                    AddContribuicao;
                    sdsContribs.Next;
            end;
         end;
         sdsContribs.filtered := false;
         sdsContribs.Filter := filtro;
         sdsContribs.filtered := true;
         sdsContribs.first;
         sdsContribs.EnableControls;
         btnLocalizar.Click;
     end;

end;

procedure TfrmLoteControleAddContrib.btn2Click(Sender: TObject);
begin
  inherited;
  if sdsContribs.Active =true then
     if sdsContribs.RecordCount > 0 then
     begin
        sdsContribs.DisableControls;
        sdsContribs.filtered := false;
        sdsContribs.first;
        while not sdsContribs.eof do
        begin
                AddContribuicao;
                sdsContribs.Next;
        end;
        sdsContribs.filtered := true;
        sdsContribs.first;
        sdsContribs.EnableControls;
        btnLocalizar.Click;
     end;

end;

end.
