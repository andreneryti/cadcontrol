unit ULoteAdicionarRegs;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls,
    DBCtrls, DB, DBClient, Provider, SqlExpr, DBLocal, DBLocalS, Mask;

type
    TfrmLoteAdicionarRegs = class(TModeloComum)
        BtnOK: TBitBtn;
        BitBtn3: TBitBtn;
        dsLocLotes: TDataSource;
        Panel2: TPanel;
        comboLote: TDBLookupComboBox;
        radexiste: TRadioButton;
        radNovo: TRadioButton;
        editLote: TEdit;
        Bevel1: TBevel;
        cbIncluidos: TCheckBox;
        Label2: TLabel;
        cbNaoIncluidos: TCheckBox;
        cdsAux: TClientDataSet;
        cdsAuxidlote: TIntegerField;
        dsAux: TDataSource;
        sdsVerExisteLote: TSQLClientDataSet;
        sdsVerExisteLoteQTDE: TIntegerField;
        Panel4: TPanel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        editAno1: TMaskEdit;
        editAno2: TMaskEdit;
        Bevel3: TBevel;
        cdsAuxnomelote: TStringField;
    cbConfeds: TCheckBox;
    txtDescricao: TDBText;
        procedure BitBtn3Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure radexisteClick(Sender: TObject);
        procedure radNovoClick(Sender: TObject);
        procedure BtnOKClick(Sender: TObject);
        procedure LocLotes;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmLoteAdicionarRegs: TfrmLoteAdicionarRegs;
    tplote:string;

implementation

uses UDmlotes, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmLoteAdicionarRegs.BitBtn3Click(Sender: TObject);
begin
    inherited;
    close;
end;

procedure TfrmLoteAdicionarRegs.FormCreate(Sender: TObject);
begin
    inherited;
    cdsAux.CreateDataSet;
end;

procedure TfrmLoteAdicionarRegs.FormShow(Sender: TObject);
begin
    inherited;
    Loclotes;
    editLote.setfocus;
    editAno1.text := inttostr(ExtractYear(DataAtual) - 5);
    editAno2.text := inttostr(ExtractYear(DataAtual) - 1);
end;

procedure TfrmLoteAdicionarRegs.radexisteClick(Sender: TObject);
begin
    inherited;
    editLote.clear;
    editLote.Enabled := false;
    comboLote.Enabled := true;
    DMLotes.cdsLocLotes.First;
    cdsAux.edit;
    cdsAuxidlote.value := DMLotes.cdsLocLotesIDLOTE.value;
    cdsAuxnomelote.value := DMLotes.cdsLocLotesNOMELOTE.value;
    comboLote.SetFocus;
    txtDescricao.Visible:=true;

end;

procedure TfrmLoteAdicionarRegs.radNovoClick(Sender: TObject);
begin
    inherited;
    editLote.Enabled := true;
    comboLote.Enabled := false;
    editLote.SetFocus;
    editLote.Text:= Dmlotes.NovoNumLote(tplote);
    txtDescricao.Visible:=false;
end;

procedure TfrmLoteAdicionarRegs.BtnOKClick(Sender: TObject);
label TesteNome;
var
  descr:string;
begin
    inherited;
    try
        strtoint(editAno1.text);
    except
        Aviso('Ano inicial inválido. ');
        ModalResult := mrnone;
        editAno1.setfocus;
        Exit;
    end;

    try
        strtoint(editAno2.text);
    except
        Aviso('Ano inicial inválido. ');
        ModalResult := mrnone;
        editAno2.setfocus;
        Exit;
    end;

    if strtoint(editAno1.text) > strtoint(editAno1.text) then
    begin
        Aviso('Ano inicial não pode ser maior que ano final. ');
        ModalResult := mrnone;
        editAno1.setfocus;
        Exit;
    end;

    if radnovo.Checked = true then
    begin
        TesteNome:
        sdsVerExisteLote.close;
        sdsVerExisteLote.Params.ParamByName('lote').value := editLote.text;
        sdsVerExisteLote.open;
        if sdsVerExisteLoteQTDE.value > 0 then
        begin
                editlote.Text := Dmlotes.NovoNumLote(tplote);
                Aviso('Um Lote acabou de ser criado com este nome. Novo nome: ' + editLote.text);
                goto TesteNome;
        end;

        descr:='Lote de ';
        If tplote='C' then
           descr := descr + 'Contribuição'
        else
        If tplote='P' then
           descr := descr + 'Parcelamento';

        InputQuery('Descrição do Lote: ', 'Novo Lote', descr);

        if (DMConexao.ExecuteProc('PROC_LOTE_I',
            quotedstr(editLote.text) + ',' +
            quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
            inttostr(UserId) + ',' +
            quotedstr(descr))) = 0 then
        begin
            Aviso('Erro ao tentar criar o novo lote. ');
            ModalResult := mrnone;
            exit;
        end;

        Dmconexao.GeraAutoNumber('GEN_NUMLOTE',1);

        LocLotes;

        if DMLotes.cdsLocLotes.Locate('NOMELOTE', editLote.text, []) then
        begin
            cdsAux.edit;
            cdsAuxidlote.value := DMLotes.cdsLocLotesIDLOTE.value;
            cdsAuxnomelote.value := DMLotes.cdsLocLotesNOMELOTE.value;
        end
        else
        begin
            Aviso('Erro interno. Informe ao administrador do Sistema. ');
            ModalResult := mrnone;
            exit;
        end;

    end
end;

procedure TfrmLoteAdicionarRegs.LocLotes;
begin
    dsLocLotes.DataSet.close;
    dsLocLotes.DataSet.open;
end;


end.

