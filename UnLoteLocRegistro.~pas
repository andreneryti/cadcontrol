unit UnLoteLocRegistro;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
    WinSkinData, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
    TfrmLoteLocRegistro = class(TModeloComum)
        Label1: TLabel;
        editAno1: TMaskEdit;
        Label5: TLabel;
        editano2: TMaskEdit;
        Label2: TLabel;
        editLoc: TEdit;
        gridcad: TDBGrid;
        btnAdd: TBitBtn;
        bvl1: TBevel;
        gridSind: TDBGrid;
        Label3: TLabel;
        sdsLoccadastro: TSQLClientDataSet;
        sdsLoccadastroASS_ID: TIntegerField;
        sdsLoccadastroREGISTRO: TStringField;
        sdsLoccadastroNOME: TStringField;
        sdsLoccadastroTP_PESSOA: TStringField;
        sdsLoccadastroCPFCNPJ: TStringField;
        sdsLoccadastroEMP_ID: TIntegerField;
        sdsLoccadastroSINDICATO: TStringField;
        dsLocCadastro: TDataSource;
        btn5: TBitBtn;
        sdsContribs: TSQLClientDataSet;
        dsContribs: TDataSource;
        sdsContribsTIPOCONTRIB: TStringField;
        sdsContribsANUID_ID: TIntegerField;
        sdsContribsVENCIMENTO: TDateField;
        sdsContribsANO: TIntegerField;
        sdsContribsTOTAL: TFMTBCDField;
        sdsContribsVALOR: TFMTBCDField;
        sdsContribsMULTA: TFMTBCDField;
        sdsContribsJUROS: TFMTBCDField;
        sdsContribsCORRECAO: TFMTBCDField;
        procedure FormShow(Sender: TObject);
        procedure editLocChange(Sender: TObject);
        procedure btnAddClick(Sender: TObject);
        procedure btn5Click(Sender: TObject);
        procedure AtualizaContribs;
        procedure sdsLoccadastroAfterScroll(DataSet: TDataSet);
        procedure editAno1Change(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmLoteLocRegistro: TfrmLoteLocRegistro;
    idLote: Integer;

implementation

uses
    UFuncoes, UDMConexao, ULotesControle;

{$R *.dfm}

procedure TfrmLoteLocRegistro.FormShow(Sender: TObject);
begin
    inherited;
    editAno1.Text := inttostr(extractyear(DataAtual) - 5);
    editAno2.Text := inttostr(extractyear(DataAtual));
    editLoc.SetFocus;
end;

procedure TfrmLoteLocRegistro.editLocChange(Sender: TObject);
begin
    inherited;
    if editLoc.text<>'' then
    begin
        try
            strtoint(editAno1.Text);
            strtoint(editAno2.Text);
        except
            Aviso('Ano inválido. ');
            Exit;
        end;

        if Length(editLoc.Text) > 2 then
        begin
            sdsLoccadastro.close;
            sdsLoccadastro.Params.ParamByName('texto').Value := editLoc.Text + '%';
            sdsLoccadastro.Open;

        end
        else
            sdsLoccadastro.close;
    end
    else
    sdsLoccadastro.close;


end;

procedure TfrmLoteLocRegistro.btnAddClick(Sender: TObject);
var
    iditem: Integer;
begin
    inherited;
    if sdsLoccadastro.Active = true then
        if sdsContribs.RecordCount = 0 then
        begin
            Aviso('Não existe sindical em aberto para este representante. ');
            Exit;
        end;

    if sdsLoccadastro.RecordCount > 0 then
    begin
        if frmLotesControle.cdsItens.locate('ass_id', sdsLoccadastroASS_ID.Value, []) then
            Aviso('Cadastro já existente no Lote. ')
        else
        begin
            iditem := DMConexao.GeraAutoNumber('GEN_LOTEITENS_ID', 1);
            if (DMConexao.ExecuteProc('PROC_LOTEITENS_I', inttostr(iditem) + ',' + inttostr(idLote) + ',' + inttostr(sdsLoccadastroASS_ID.value) + ',' + quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' + inttostr(UserId))) = 0 then
            begin
                Aviso('Erro de integridade, ao adicionar o Cadastro no Lote. ' + #13 + 'Informe ao adminitrador do Sistema. Registro ' + sdsLoccadastroREGISTRO.value + '.');
                Exit;
            end
            else
            begin
                sdsContribs.DisableControls;
                sdsContribs.filtered := false;
                sdsContribs.first;
                while not sdsContribs.eof do
                begin
                    if sdsContribsTIPOCONTRIB.Value = 'Sindical' then
                    begin

                        if (DMConexao.ExecuteProc('PROC_LOTEITENSCONTRIBS_I',
                                                    inttostr(0) + ',' +
                                                    inttostr(iditem) + ',' +
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

                            try
                                DMConexao.ExecSQL('delete from lotecontribstatus s where s.idlotecontribstatus in (select s.idlotecontribstatus from lotecontribstatus s inner join loteitenscontribs c on c.idloteitemcontrib = s.idloteitemcontrib  where c.idloteitem = ' + inttostr(iditem) + ')');
                                DMConexao.ExecSQL('delete from loteitenscontribs where idloteitem = ' + inttostr(iditem));
                                DMConexao.ExecSQL('delete from LOTEITEMSTATUS where idloteitem = ' + inttostr(iditem));
                                DMConexao.ExecSQL('delete from loteitens where idloteitem = ' + inttostr(iditem));
                                Aviso('Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + '. ');
                            except
                                Aviso('Erro ao estornar o Cadastro do Lote. Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + #13 + 'Contate o administrador. ');
                            end;
                            exit;
                        end;

                    end
                    else if sdsContribsTIPOCONTRIB.Value = 'Confederativa' then
                    begin
                        if (DMConexao.ExecuteProc('PROC_LOTEITENSCONTRIBS_I',
                                                inttostr(0) + ',' +
                                                inttostr(iditem) + ',' +
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

                            try
                                DMConexao.ExecSQL('delete from lotecontribstatus s where s.idlotecontribstatus in (select s.idlotecontribstatus from lotecontribstatus s inner join loteitenscontribs c on c.idloteitemcontrib = s.idloteitemcontrib  where c.idloteitem = ' + inttostr(iditem) + ')');
                                DMConexao.ExecSQL('delete from loteitenscontribs where idloteitem = ' + inttostr(iditem));
                                DMConexao.ExecSQL('delete from LOTEITEMSTATUS where idloteitem = ' + inttostr(iditem));
                                DMConexao.ExecSQL('delete from loteitens where idloteitem = ' + inttostr(iditem));
                                Aviso('Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + '. ');
                            except
                                Aviso('Erro ao estornar o Cadastro do Lote. Erro na inclusão da contribuição de ' + inttostr(sdsContribsANO.value) + #13 + 'Contate o administrador. ');
                            end;
                            exit;
                        end;
                    end;
                    sdsContribs.Next;
                end;

                sdsContribs.filtered := true;
                sdsContribs.first;
                sdsContribs.EnableControls;

            end;
            frmLotesControle.AtualizaItens;
            frmLotesControle.cdsItens.locate('ass_id', sdsLoccadastroASS_ID.Value, []);
        end;
        editLoc.SetFocus;

    end;

end;

procedure TfrmLoteLocRegistro.btn5Click(Sender: TObject);
begin
    inherited;
    close;
end;

procedure TfrmLoteLocRegistro.AtualizaContribs;
begin
    sdsContribs.close;
    sdsContribs.CommandText := ' select p.tipocontrib, p.anuid_id,p.vencimento, p.ano, p.total, p.valor, p.multa, p.juros, p.correcao from proc_debitos( ';
    sdsContribs.CommandText := sdsContribs.CommandText + inttostr(sdsLoccadastroASS_ID.value) + ', ' + quotedstr('A') + ', ' + QuotedStr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ') p';
    sdsContribs.CommandText := sdsContribs.CommandText + ' where p.ano between ' + editAno1.text + '  and  ' + editAno2.text + ' order by p.ano, p.tipocontrib desc ';
    sdsContribs.Open;

    sdsContribs.Filtered := false;
    sdsContribs.Filter := 'tipocontrib=''Sindical''';
    sdsContribs.Filtered := true;

end;

procedure TfrmLoteLocRegistro.sdsLoccadastroAfterScroll(DataSet: TDataSet);
begin
    inherited;
    AtualizaContribs;
end;

procedure TfrmLoteLocRegistro.editAno1Change(Sender: TObject);
begin
    inherited;
    editLoc.Clear;
    sdsLoccadastro.Close;
    sdsContribs.close;
end;

end.

