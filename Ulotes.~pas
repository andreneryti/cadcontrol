unit Ulotes;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Grids,
    DBGrids, ComCtrls, Buttons, DBCtrls, DB, DBClient, JvDBCtrl, ExRxDBGrid,
    Provider, SqlExpr, DBLocal, DBLocalS, FMTBcd, comObj, midaslib, JvSelectDirectory;

type
    TfrmLote = class(TModeloComum)
        Panel2: TPanel;
        radNovo: TRadioButton;
        radexiste: TRadioButton;
        DBLookupComboBox1: TDBLookupComboBox;
        Bevel1: TBevel;
        BitBtn1: TBitBtn;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        editLoc: TEdit;
        PageControl2: TPageControl;
        TabSheet2: TTabSheet;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        SpeedButton3: TSpeedButton;
        BitBtn2: TBitBtn;
        BitBtn3: TBitBtn;
        BitBtn5: TBitBtn;
        Label1: TLabel;
        labtotal: TLabel;
        BitBtn6: TBitBtn;
        dsLocLotes: TDataSource;
        cdsAux: TClientDataSet;
        cdsAuxidlote: TIntegerField;
        dsAux: TDataSource;
        dsContribs: TDataSource;
        BitBtn4: TBitBtn;
        Grid1: TExRxDBGrid;
        cdsItens: TClientDataSet;
        cdsItensselecionado: TBooleanField;
        dsItens: TDataSource;
        cdsItensREGISTRO: TStringField;
        cdsItensNOME: TStringField;
        cdsItensULT_STATUS: TStringField;
        cdsItensIDLOTEITEM: TIntegerField;
        cdsItensTP_PESSOA: TStringField;
        DBGrid2: TExRxDBGrid;
        cbMarcar: TCheckBox;
    spAtualizaContribs: TSpeedButton;
        txtDescricao: TDBText;
        SaveDialog1: TSaveDialog;
        sdsNumNotificacao: TSQLClientDataSet;
        sdsNumNotificacaoNUMNOTIF: TStringField;
        cdsItensass_id: TIntegerField;
        sdsEndereco: TSQLClientDataSet;
        sdsEnderecoEND_ID: TIntegerField;
        sdsEnderecoEND_LOGRADOURO: TStringField;
        sdsEnderecoEND_NUMERO: TStringField;
        sdsEnderecoEND_COMPLEMENTO: TStringField;
        sdsEnderecoEND_BAIRRO: TStringField;
        sdsEnderecoEND_CEP: TStringField;
        sdsEnderecoCIDADE_ID: TIntegerField;
        sdsEnderecoTP_ENDER_ID: TIntegerField;
        sdsEnderecoEND_CORRESP: TSmallintField;
        sdsEnderecoEND_CORRESP_DEV: TSmallintField;
        sdsEnderecoSTATUSCORRESP: TStringField;
        sdsEnderecoCIDADE_NOME: TStringField;
        sdsEnderecoESTADO_NOME: TStringField;
        sdsEnderecoTP_ENDER_DESCR: TStringField;
        cdsResultado: TClientDataSet;
        cdsResultadosituacao: TIntegerField;
        cdsResultadoregistro: TStringField;
        cdsResultadonome: TStringField;
        cdsResultadomotivo: TStringField;
    RichEdit2: TRichEdit;
    RichEdit1: TRichEdit;
    cdsItenscpfcnpj: TStringField;
    sdsContribs: TSQLDataSet;
    dspContribs: TDataSetProvider;
    sqlContribsold: TClientDataSet;
    sqlContribsoldANO: TIntegerField;
    sqlContribsoldVENCIMENTO: TDateField;
    sqlContribsoldULT_STATUS: TStringField;
    sqlContribsoldDATAREPASSE: TDateField;
    sqlContribsoldUSER_REPASSE: TStringField;
    sqlContribsoldIDUSERDATAREPASSE: TIntegerField;
    sqlContribsoldTOTAL: TFMTBCDField;
    sqlContribsoldVALOR: TFMTBCDField;
    sqlContribsoldMULTA: TFMTBCDField;
    sqlContribsoldJUROS: TFMTBCDField;
    sqlContribsoldCORRECAO: TFMTBCDField;
    sqlContribsoldDATAINCLUSAO: TDateField;
    sqlContribsoldUSER_INCLUSAO: TStringField;
    sqlContribsoldIDUSERINCLUSAO: TIntegerField;
    sqlContribsoldDATAATUALIZACAO: TDateField;
    sqlContribsoldUSER_ALTERACAO: TStringField;
    sqlContribsoldIDUSERATUALIZACAO: TIntegerField;
    sqlContribsoldIDLOTEITEMCONTRIB: TIntegerField;
    sqlContribsoldANUID_ID: TIntegerField;
    sqlContribsoldTPCONTRIB: TStringField;
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
    sqlContribsTPCONTRIB: TStringField;
        procedure BitBtn6Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure BitBtn1Click(Sender: TObject);
        procedure LocLotes;
        procedure AtualizaItens;
        procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBLookupComboBox1CloseUp(Sender: TObject);
        procedure editLocEnter(Sender: TObject);
        procedure editLocExit(Sender: TObject);
        procedure editLocChange(Sender: TObject);
        procedure AtualizaContribs;
        procedure BitBtn2Click(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure BitBtn3Click(Sender: TObject);
        procedure BitBtn4Click(Sender: TObject);
        procedure cdsItensAfterScroll(DataSet: TDataSet);
        procedure MarcarTodos(marc: boolean);
        procedure GeraNotificacao1;
        procedure GeraNotificacao2;
        procedure GeraNotificaoExtraJudicial;
        procedure GeraEtiquetas;
        function TestaEndereco(ass_id: integer): integer;
        procedure cbMarcarClick(Sender: TObject);
        procedure SpeedButton4Click(Sender: TObject);
        procedure spAtualizaContribsClick(Sender: TObject);
        procedure radNovoClick(Sender: TObject);
        procedure radexisteClick(Sender: TObject);
        function RetonaAnuidades:string;
    procedure BitBtn5Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmLote: TfrmLote;
    Endereco:string;
implementation

uses UDmlotes, ULoteNovo, UDMConexao, UFuncoes, ULoteGeraDocumento,
    ULotesAtualizarValores, ULotesRelatStatus, ULotesRelatRepasse,
    UqrRelatAddLote, UEtiquetas, UQrNotificacaoExtraJud;

{$R *.dfm}

procedure TfrmLote.BitBtn6Click(Sender: TObject);
begin
    inherited;
    close;
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
    inherited;
    cdsAux.CreateDataSet;
    cdsItens.CreateDataSet;
    cdsResultado.CreateDataSet;
end;

procedure TfrmLote.FormShow(Sender: TObject);
begin
    inherited;
    cdsAux.Open;
    cdsaux.append;
    cdsAux.Edit;
    LocLotes;
    cdsItens.open;
    SetRichEditAdvOption(TRichEdit(RichEdit1));
    SetRichEditAdvOption(TRichEdit(RichEdit2));

end;

procedure TfrmLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;
    DMLotes.cdsLocLotes.close;
end;

procedure TfrmLote.BitBtn1Click(Sender: TObject);
begin
    inherited;
    if radNovo.Checked = true then
    begin
        try application.createform(TfrmLoteNovo, frmLoteNovo);
            if frmLoteNovo.showmodal = mrok then
            begin

                if (DMConexao.ExecuteProc('PROC_LOTE_I',
                    quotedstr(frmLoteNovo.editNomeLote.text) + ',' +
                    quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                    inttostr(UserId) + ',' +
                    quotedstr(frmLoteNovo.editDescr.text))) = 0 then
                begin
                    Aviso('Erro ao tentar criar o novo lote. ');
                    exit;
                end;
                Dmconexao.GeraAutoNumber('GEN_NUMLOTE', 1);
                LocLotes;
                radexiste.Checked := true;
                DMLotes.cdsLocLotes.Locate('NOMELOTE', frmLoteNovo.editNomeLote.text, []);
                cdsAux.edit;
                cdsAuxidlote.value := DMLotes.cdsLocLotesIDLOTE.value;
            end;
        finally
            frmLoteNovo.free;
        end;
    end;

    AtualizaItens;

    labtotal.caption := inttostr(dsitens.dataset.RecordCount);

end;

procedure TfrmLote.LocLotes;
begin
    dmlotes.cdsLocLotes.close;
    dmlotes.cdsLocLotes.open;
    dmlotes.cdsLocLotes.first;
    cdsAuxidlote.value := dmlotes.cdsLocLotesIDLOTE.value

end;

procedure TfrmLote.DBGrid1DrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    inherited;
    if Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
    begin
        Tdbgrid(sender).Canvas.Brush.color := clwindow;
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
        Tdbgrid(sender).Canvas.Brush.Color := $00FFCECE;
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

    if gdselected in State then
    begin
        Tdbgrid(sender).Canvas.Brush.Color := clNavy;
        Tdbgrid(sender).Canvas.Font.Color := clwhite;
        Tdbgrid(sender).Canvas.FillRect(Rect);
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

end;

procedure TfrmLote.DBGrid2DrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    inherited;
    if Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
    begin
        Tdbgrid(sender).Canvas.Brush.color := clwindow;
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
        Tdbgrid(sender).Canvas.Brush.Color := $00FFCECE;
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

    if gdselected in State then
    begin
        Tdbgrid(sender).Canvas.Brush.Color := clNavy;
        Tdbgrid(sender).Canvas.Font.Color := clwhite;
        Tdbgrid(sender).Canvas.FillRect(Rect);
        Tdbgrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

end;

procedure TfrmLote.DBLookupComboBox1CloseUp(Sender: TObject);
begin
    inherited;
    dsitens.DataSet.close;
end;

procedure TfrmLote.editLocEnter(Sender: TObject);
begin
    inherited;
    if editLoc.text = '<<DIGITE PARA LOCALIZAR UM CADASTRO...>>' then
    begin
        editLoc.text := '';
        editloc.Font.color := clBlack;
    end;


end;

procedure TfrmLote.editLocExit(Sender: TObject);
begin
    inherited;
    if editLoc.text = '' then
    begin
        editLoc.text := '<<DIGITE PARA LOCALIZAR UM CADASTRO...>>';
        tclientdataset(dsItens.DataSet).Filtered := false;
        editloc.Font.color := clgray;
    end;
end;

procedure TfrmLote.editLocChange(Sender: TObject);
begin
    inherited;
    cdsitens.afterscroll := nil;
    tclientdataset(dsItens.DataSet).Filtered := false;
    if (editLoc.text <> '') and (editLoc.text <> '<<DIGITE PARA LOCALIZAR UM CADASTRO...>>') then
    begin
        tclientdataset(dsItens.DataSet).Filter := '(nome like ' + quotedStr(editLoc.Text + '%') + ' ) or (registro like ' + quotedStr(editLoc.text + '%') + ')';
        tclientdataset(dsItens.DataSet).Filtered := true;
    end;

    if tclientdataset(dsItens.DataSet).RecordCount = 0 then
        dsContribs.DataSet.close;

    cdsitens.afterscroll := cdsItensAfterScroll;
    sqlContribs.close;
    //AtualizaContribs;

end;

procedure TfrmLote.AtualizaContribs;
var
    strsql: string;
begin

    inherited;
    if cdsItensIDLOTEITEM.value <> 0 then
    begin
        try
            sqlContribs.close;
            sqlContribs.Params[0].value := cdsItensIDLOTEITEM.value ;
            sqlContribs.open;
        except
          sqlContribs.close;

        end;
    end;
end;

procedure TfrmLote.BitBtn2Click(Sender: TObject);
begin
    inherited;
    if dsItens.DataSet.active = true then
        if dsitens.DataSet.RecordCount > 0 then
        try application.createform(TfrmLoteGeraDocumento, frmLoteGeraDocumento);
            if frmLoteGeraDocumento.showmodal = mrok then
            begin
              //  cdsitens.DisableControls;
                cdsitens.filtered := false;
                cdsitens.filter := 'selecionado=true';
                cdsitens.filtered := true;
                cdsitens.first;
                if frmLoteGeraDocumento.radNot1.Checked = true then
                begin
                    GeraNotificaoExtraJudicial;

                end
{                else
                    if frmLoteGeraDocumento.radNot2.Checked = true then
                begin
                    GeraNotificacao2;

                end  }
                else
                    if frmLoteGeraDocumento.radEtiq.Checked = true then
                begin
                    GeraEtiquetas;

                end;


                cdsitens.filtered := false;
                cdsitens.filter := '';
                cdsitens.first;
                cdsitens.EnableControls;
                AtualizaContribs;
            end;
        finally
            frmLoteGeraDocumento.free;
        end;

end;

procedure TfrmLote.SpeedButton1Click(Sender: TObject);
begin
    inherited;
    if dsItens.DataSet.Active = true then
        if dsItens.DataSet.RecordCount > 0 then
        try application.createform(tfrmLotesAtualizarValores, frmLotesAtualizarValores);
            if frmLotesAtualizarValores.showmodal = mrok then
            begin


            end;
        finally
            frmLotesAtualizarValores.free;
        end;
end;

procedure TfrmLote.BitBtn3Click(Sender: TObject);
begin
    inherited;
    if dsItens.DataSet.active = true then
        if dsitens.DataSet.RecordCount > 0 then
        try application.createform(tfrmLotesRelatStatus, frmLotesRelatStatus);
            frmLotesRelatStatus.showmodal;
        finally
            frmLotesRelatStatus.free;
        end;

end;

procedure TfrmLote.BitBtn4Click(Sender: TObject);
begin
    inherited;
    if dsItens.DataSet.active = true then
        if dsitens.DataSet.RecordCount > 0 then
        try application.createform(tfrmLotesRelatRepasse, frmLotesRelatRepasse);
            frmLotesRelatRepasse.showmodal;
        finally
            frmLotesRelatRepasse.free;
        end;
end;

procedure TfrmLote.AtualizaItens;
var
    i: integer;
begin
    DMLotes.sdsItens.close;
    DMLotes.sdsItens.Params.ParamByName('idlote').value := cdsAuxidlote.value;
    DMLotes.sdsItens.open;
    cdsitens.AfterScroll := nil;
    cdsItens.open;
    cdsItens.EmptyDataSet;
    dmlotes.sdsItens.First;
    while not dmlotes.sdsItens.eof do
    begin
        cdsitens.Append;
        cdsitens.Edit;
        for i := 0 to dmlotes.sdsItens.fields.count - 1 do
        begin
            cdsItens.FieldByName(dmlotes.sdsItens.fields[i].FieldName).value := dmlotes.sdsItens.fieldbyname(dmlotes.sdsItens.fields[i].FieldName).value;
        end;
        cdsItensselecionado.Value := true;
        cdsitens.Post;
        dmlotes.sdsItens.next;
    end;
    cdsitens.afterscroll := cdsItensAfterScroll;
    cdsitens.first;

end;

procedure TfrmLote.cdsItensAfterScroll(DataSet: TDataSet);
begin
    inherited;
    //    AtualizaContribs;
   // sqlContribs.close;
end;

procedure TfrmLote.MarcarTodos(marc: boolean);
begin
  //  cdsitens.afterscroll := nil;
    cdsitens.DisableControls;
    cdsitens.First;
    while not cdsitens.eof do
    begin
        cdsitens.Edit;
        if cdsitensSelecionado.value = marc then
            cdsitensSelecionado.value := not marc;
        cdsitensSelecionado.value := marc;
        cdsitens.post;
        cdsitens.next;
    end;
    //cdsitens.afterscroll := cdsItensAfterScroll;
    cdsitens.First;
    cdsitens.EnableControls;

end;

procedure TfrmLote.cbMarcarClick(Sender: TObject);
begin
    inherited;
    if cdsitens.Active = true then
        if cdsitens.RecordCount > 0 then
            MarcarTodos(cbMarcar.Checked);
end;

procedure TfrmLote.SpeedButton4Click(Sender: TObject);
begin
    inherited;
   // AtualizaContribs;
end;

procedure TfrmLote.spAtualizaContribsClick(Sender: TObject);
begin
    inherited;
    AtualizaContribs;
end;

procedure TfrmLote.radNovoClick(Sender: TObject);
begin
    inherited;
    txtDescricao.visible := false;
end;

procedure TfrmLote.radexisteClick(Sender: TObject);
begin
    inherited;
    txtDescricao.visible := true;
end;

procedure TfrmLote.GeraEtiquetas;
begin
    try
        application.createform(TfrmEtiqueta, frmEtiqueta);
        frmEtiqueta.Dados.Open;
        frmEtiqueta.Dados.EmptyDataSet;

        cdsResultado.Open;
        cdsResultado.EmptyDataSet;

        while not cdsitens.Eof do
        begin

            if TestaEndereco(cdsItensass_id.value) = 0 then
            begin
                cdsResultado.append;
                cdsResultado.edit;
                cdsResultadoregistro.value := cdsItensREGISTRO.value;
                cdsResultadonome.value := cdsItensNOME.value;
                cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
                cdsResultado.post;
                cdsitens.next;
                Continue;
            end;

            frmEtiqueta.Dados.Append;
            frmEtiqueta.Dados.Edit;
            frmEtiqueta.DadosREGISTRO.value := StringReplace(cdsItens.fieldbyname('registro').Value,'/','',[rfreplaceall]);

            if sdsEnderecoEND_BAIRRO.value <> NULL then
                frmEtiqueta.Dadosbairro.value := sdsEnderecoEND_BAIRRO.value;

            if sdsEnderecoEND_COMPLEMENTO.value <> NULL then
                frmEtiqueta.Dadoscomplemento.value := sdsEnderecoEND_COMPLEMENTO.value;

            if sdsEnderecoEND_CEP.value <> NULL then
            begin
                if length(sdsEnderecoEND_CEP.value) = 8 then
                    frmEtiqueta.Dadoscep.value := copy(sdsEnderecoEND_CEP.value, 1, 2) + '.' + copy(sdsEnderecoEND_CEP.value, 3, 3) + '-' + copy(sdsEnderecoEND_CEP.value, 6, 3)
                else
                    frmEtiqueta.Dadoscep.value := sdsEnderecoEND_CEP.value;
            end;

            if sdsEnderecoCIDADE_NOME.value <> NULL then
                frmEtiqueta.Dadoscidade.value := sdsEnderecoCIDADE_NOME.value;

            if sdsEnderecoEND_LOGRADOURO.value <> NULL then
                frmEtiqueta.Dadosendereco.value := sdsEnderecoEND_LOGRADOURO.value;

            if sdsEnderecoESTADO_NOME.value <> NULL then
                frmEtiqueta.Dadosestado.value := sdsEnderecoESTADO_NOME.value;

            if cdsItensNOME.value <> NULL then
                frmEtiqueta.Dadosnome.value := cdsItensNOME.value;

            frmEtiqueta.Dados.post;

            cdsitens.next;
        end;

        if frmEtiqueta.Dados.recordcount > 0 then
        begin

            frmEtiqueta.showmodal;
            if (gerouetiqueta = 1) and (cdsResultado.RecordCount > 0) then
            begin
                if Confirma('Algumas etiquetas não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
                begin
                    try application.Createform(TQrRelatAddLote, QrRelatAddLote);
                        qrRelatAddLote.DataSet := cdsResultado;
                        qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                        qrRelatAddLote.txtnome.DataSet := cdsResultado;
                        qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                        qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Etiquetas não geradas';
                        qrRelatAddLote.labtitulo.Caption := 'Relatório de Geração de Etiquetas';
                        qrRelatAddLote.Preview;
                    finally
                        QrRelatAddLote.free;
                    end;

                end;

            end;
        end;
    finally
        frmEtiqueta.free;
    end;

end;

procedure TfrmLote.GeraNotificacao1;
var
    nomearquivo, arquivo: string;
    resp: Boolean;
    qtd: integer;
    winword, docs, doc: Variant;
begin
    SaveDialog1.FileName := 'Notif1';

    if SaveDialog1.Execute then
        nomearquivo := SaveDialog1.FileName
    else
        exit;

    resp := Confirma('Deseja imprimir as notificações agora?');

    arquivo := ExtractFilePath(Application.ExeName) + 'docs\notificacao1.doc';

    cdsResultado.Open;
    cdsResultado.EmptyDataSet;

    qtd := 0;
    while not cdsitens.Eof do
    begin

        if TestaEndereco(cdsItensass_id.value) = 0 then
        begin
            cdsResultado.append;
            cdsResultado.edit;
            cdsResultadoregistro.value := cdsItensREGISTRO.value;
            cdsResultadonome.value := cdsItensNOME.value;
            cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
            cdsResultado.post;
            cdsitens.Next;
            Continue;
        end;

        try

            WinWord := CreateOleObject('Word.Application');

            Docs := WinWord.Documents;
            Doc := Docs.Open(arquivo);

            sdsNumNotificacao.open;
            Doc.Content.Find.Execute(FindText := '<#numnotificaco#>', replacewith := sdsNumNotificacaoNUMNOTIF.value);
            sdsNumNotificacao.close;
            Doc.Content.Find.Execute(FindText := '<#nome#>', replacewith := dsItens.DataSet.fieldbyname('nome').value);
            Doc.Content.Find.Execute(FindText := '<#dataextenso#>', replacewith := FormatDateTime('"' + 'Rio de Janeiro' + ', "dd "de" mmmm "de" yyyy', DataAtual) + '.');

            Doc.saveas(nomearquivo + '_' + inttostr(dsItens.DataSet.fieldbyname('ass_id').value) + '_' + stringreplace(dsItens.DataSet.fieldbyname('registro').value, '/', '', [rfreplaceall]) + '_' + Stringreplace(Stringreplace(datetostr(dataatual), '/', '', [rfreplaceall]), '.', '', [rfreplaceall]) + '.doc');

            if resp = true then
                Doc.Printout;
            Winword.ActiveDocument.Close(0);

            //Timer1.Enabled := true;

            if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I',
                inttostr(0) + ',' +
                inttostr(dsItens.DataSet.fieldbyname('idloteitem').value) + ',' +
                inttostr(1) + ',' +
                quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                inttostr(UserId))) = 0 then
            begin
                Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + dsitens.DataSet.fieldbyname('registro').value);
            end;

        except
            WinWord.quit;
            Aviso('Erro ao gerar a Notificação para o Cadastro nº ' + dsitens.DataSet.fieldbyname('registro').value);
            Exit;
        end;
        qtd := qtd + 1;
        cdsitens.next;
    end;

    Aviso('Notificações geradas com sucesso. ' + #13 + 'Total: ' + inttostr(qtd) + '. ');

    if cdsResultado.RecordCount > 0 then
    begin
        if Confirma('Algumas notificações não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
        begin
            try application.Createform(TQrRelatAddLote, QrRelatAddLote);
                qrRelatAddLote.DataSet := cdsResultado;
                qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                qrRelatAddLote.txtnome.DataSet := cdsResultado;
                qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Notificações não geradas';
                qrRelatAddLote.labtitulo.Caption := 'Relatório de Notificações';
                qrRelatAddLote.Preview;
            finally
                QrRelatAddLote.free;
            end;

        end;

    end;

end;

procedure TfrmLote.GeraNotificacao2;
var
    nomearquivo, arquivo: string;
    resp: Boolean;
    qtd: integer;
    winword, docs, doc: Variant;
begin
    SaveDialog1.FileName := 'Notif2';

    if SaveDialog1.Execute then
        nomearquivo := SaveDialog1.FileName
    else
        exit;

    resp := Confirma('Deseja imprimir as notificações agora?');

    arquivo := ExtractFilePath(Application.ExeName) + 'docs\notificacao2.doc';

    cdsResultado.Open;
    cdsResultado.EmptyDataSet;

    qtd := 0;
    while not cdsitens.Eof do
    begin

        if TestaEndereco(cdsItensass_id.value) = 0 then
        begin
            cdsResultado.append;
            cdsResultado.edit;
            cdsResultadoregistro.value := cdsItensREGISTRO.value;
            cdsResultadonome.value := cdsItensNOME.value;
            cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
            cdsResultado.post;
            cdsitens.Next;
            Continue;
        end;
        try

            WinWord := CreateOleObject('Word.Application');

            Docs := WinWord.Documents;
            Doc := Docs.Open(arquivo);

            sdsNumNotificacao.open;
            Doc.Content.Find.Execute(FindText := '<#numnotificaco#>', replacewith := sdsNumNotificacaoNUMNOTIF.value);
            sdsNumNotificacao.close;
            Doc.Content.Find.Execute(FindText := '<#nome#>', replacewith := dsItens.DataSet.fieldbyname('nome').value);
            Doc.Content.Find.Execute(FindText := '<#dataextenso#>', replacewith := FormatDateTime('"' + 'Rio de Janeiro' + ', "dd "de" mmmm "de" yyyy', DataAtual) + '.');

            Doc.saveas(nomearquivo + '_' + inttostr(dsItens.DataSet.fieldbyname('ass_id').value) + '_' + stringreplace(dsItens.DataSet.fieldbyname('registro').value, '/', '', [rfreplaceall]) + '_' + Stringreplace(Stringreplace(datetostr(dataatual), '/', '', [rfreplaceall]), '.', '', [rfreplaceall]) + '.doc');

            if resp = true then
                Doc.Printout;
            Winword.ActiveDocument.Close(0);

            //Timer1.Enabled := true;

            if (DMConexao.ExecuteProc('PROC_LOTEITEMSTATUS_I',
                inttostr(0) + ',' +
                inttostr(dsItens.DataSet.fieldbyname('idloteitem').value) + ',' +
                inttostr(1) + ',' +
                quotedstr(inttostr(ExtractYear(DataAtual)) + '.' + inttostr(ExtractMonth(DataAtual)) + '.' + inttostr(ExtractDay(DataAtual))) + ',' +
                inttostr(UserId))) = 0 then
            begin
                Erro('Erro ao registrar a geração de notificação. Informe ao Administrador do Sistema: ' + 'Cadastro Nº ' + dsitens.DataSet.fieldbyname('registro').value);
            end;

        except
            WinWord.quit;
            Aviso('Erro ao gerar a Notificação para o Cadastro nº ' + dsitens.DataSet.fieldbyname('registro').value);
            Exit;
        end;
        qtd := qtd + 1;
        cdsitens.next;
    end;

    Aviso('Notificações geradas com sucesso. ' + #13 + 'Total: ' + inttostr(qtd) + '. ');

    if cdsResultado.RecordCount > 0 then
    begin
        if Confirma('Algumas notificações não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
        begin
            try application.Createform(TQrRelatAddLote, QrRelatAddLote);
                qrRelatAddLote.DataSet := cdsResultado;
                qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                qrRelatAddLote.txtnome.DataSet := cdsResultado;
                qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Notificações não geradas';
                qrRelatAddLote.labtitulo.Caption := 'Relatório de Notificações';
                qrRelatAddLote.Preview;
            finally
                QrRelatAddLote.free;
            end;

        end;

    end;

end;

function TfrmLote.TestaEndereco(ass_id: integer): integer;
begin
    sdsEndereco.close;
    sdsEndereco.Params.ParamByName('ass_id').value:= ass_id;
    sdsEndereco.open;

    If sdsEnderecoEND_ID.value > 0 then
    begin
         endereco := sdsEnderecoEND_LOGRADOURO.value;
         If sdsEnderecoEND_NUMERO.value <>'' then
            Endereco := Endereco + ', ' + sdsEnderecoEND_NUMERO.value;
         If sdsEnderecoEND_COMPLEMENTO.value <>'' then
            Endereco := Endereco + ', ' + sdsEnderecoEND_COMPLEMENTO.value;
         If sdsEnderecoEND_BAIRRO.value <>'' then
            Endereco := Endereco + ', ' + sdsEnderecoEND_BAIRRO.value;
         If sdsEnderecoCIDADE_NOME.value <>'' then
            Endereco := Endereco + ' - ' + sdsEnderecoCIDADE_NOME.value;
         If sdsEnderecoESTADO_NOME.value <>'' then
            Endereco := Endereco + ' - ' + sdsEnderecoESTADO_NOME.value;
         If sdsEnderecoEND_CEP.value <>'' then
         begin
           if Length(sdsEnderecoEND_CEP.value) = 8 then
              Endereco := Endereco + ' - CEP ' + MaskCEP(sdsEnderecoEND_CEP.value)
           else
             Endereco := Endereco + ' - CEP ' + sdsEnderecoEND_CEP.value;
         end;
    end;

    result := sdsEnderecoEND_ID.value;

end;

procedure TfrmLote.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if cdsitens.Active = true  then
  begin
      cdsitens.DisableControls;
      cdsitens.filtered := false;
      cdsitens.filter := 'selecionado=true';
      cdsitens.filtered := true;
      cdsitens.first;
      if cdsitens.RecordCount > 0 then
         GeraPlanilha(cdsitens, grid1);
      cdsitens.filtered := false;
      cdsitens.filter := '';
      cdsitens.first;
      cdsitens.EnableControls;
  end;

end;

procedure TfrmLote.GeraNotificaoExtraJudicial;
var
  qtd:integer;
  sdDirectory: TJvSelectDirectory;
  local:string;
begin
    sdDirectory := TJvSelectDirectory.create(nil);
    if sdDirectory.Execute then
        local := sdDirectory.Directory
    else
        exit;

    while not cdsitens.Eof do
    begin
        try
        sqlContribs.close;
        while sqlContribs.Active = false do
            AtualizaContribs;
        sqlContribs.Filtered := false;
        sqlContribs.Filter:='tpcontrib=''Sind.''';
        sqlContribs.Filtered := true;

        except
        end;

        If dsContribs.dataset.RecordCount = 0   then
        begin
            cdsResultado.append;
            cdsResultado.edit;
            cdsResultadoregistro.value := cdsItensREGISTRO.value;
            cdsResultadonome.value := cdsItensNOME.value;
            cdsResultadomotivo.value := 'Sem Contribuição Sindical relacionada. ';
            cdsResultado.post;
            cdsitens.Next;
            Continue;
        end;

        if TestaEndereco(cdsItensass_id.value) = 0 then
        begin
            cdsResultado.append;
            cdsResultado.edit;
            cdsResultadoregistro.value := cdsItensREGISTRO.value;
            cdsResultadonome.value := cdsItensNOME.value;
            cdsResultadomotivo.value := 'Sem endereço válido cadastrado. ';
            cdsResultado.post;
            cdsitens.Next;
            Continue;
        end;

        try
                application.createform(TQrNotificacaoExtraJud,QrNotificacaoExtraJud);
                QrNotificacaoExtraJud.cdsRelTermo.createdataset;
                sdsNumNotificacao.open;
                QrNotificacaoExtraJud.labNotif.caption:= QrNotificacaoExtraJud.labNotif.caption + sdsNumNotificacaoNUMNOTIF.value;
                sdsNumNotificacao.close;
                RichEdit1.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO1);
                SubstituirTexto(RichEdit1,'<#nome#>',cdsItensNOME.value);
                SubstituirTexto(RichEdit1,' <#endereco#>', ' ' +endereco);
                SubstituirTexto(RichEdit1,'<#cpfcnpj#>',MaskCPFCGC(cdsItenscpfcnpj.value));
                SubstituirTexto(RichEdit1,'<#anuidades#>',RetonaAnuidades);
                SetRichEditAdvOption(TRichEdit(RichEdit1));
                QrNotificacaoExtraJud.ricTexto1.ParentRichEdit := TRichEdit(RichEdit1);

                RichEdit2.lines.Assign(Dmconexao.sdsConfigNOTIF_TEXTO2);
                SetRichEditAdvOption(TRichEdit(RichEdit2));
                QrNotificacaoExtraJud.ricTexto2.ParentRichEdit := TRichEdit(RichEdit2);

                sqlContribs.first;
                while not sqlContribs.eof do
                begin
                    QrNotificacaoExtraJud.cdsRelTermo.Append;
                    QrNotificacaoExtraJud.cdsRelTermo.Edit;
                    QrNotificacaoExtraJud.cdsRelTermoano.Value := sqlContribs.fieldbyname('ano').value;
                    QrNotificacaoExtraJud.cdsRelTermovalor.Value := sqlContribs.fieldbyname('total').value;
                    QrNotificacaoExtraJud.cdsRelTermo.post;
                    sqlContribs.Next;
                end;

                QrNotificacaoExtraJud.ReportTitle := 'Notif_' + StringReplace(cdsItensREGISTRO.value,'/','',[rfreplaceAll]);

                if GeraPDF(QrNotificacaoExtraJud, local)= 0 then
                begin
                     Aviso('Erro ao gerar PDF de Notificação para: ' + cdsItensREGISTRO.value +' - ' + cdsItensNOME.value+'.'+#13+'Por favor, informe ao Administrador do Sistema.');
                end;

                //QrNotificacaoExtraJud.preview;
        finally
                QrNotificacaoExtraJud.free;
        end;
         qtd := qtd + 1;
        cdsitens.Next;
   end;

    Aviso('Notificações geradas com sucesso. ' + #13 + 'Total: ' + inttostr(qtd) + '. ');

    if cdsResultado.RecordCount > 0 then
    begin
        if Confirma('Algumas notificações não foram geradas por falta de endereço. ' + #13 + 'Deseja visualizar a listagem? ') then
        begin
            try application.Createform(TQrRelatAddLote, QrRelatAddLote);
                qrRelatAddLote.DataSet := cdsResultado;
                qrRelatAddLote.txtregistro.DataSet := cdsResultado;
                qrRelatAddLote.txtnome.DataSet := cdsResultado;
                qrRelatAddLote.txtmotivo.DataSet := cdsResultado;
                qrRelatAddLote.labsubtitulo.Caption := 'Resumo: Notificações não geradas';
                qrRelatAddLote.labtitulo.Caption := 'Relatório de Notificações';
                qrRelatAddLote.Preview;
            finally
                QrRelatAddLote.free;
            end;

        end;

    end;

    sqlContribs.Filtered := false;
    sqlContribs.Filter:='';


end;

function TfrmLote.RetonaAnuidades: string;
var
  ano1, ano2:integer;
begin
   sqlContribs.first;
   ano1 := sqlContribs.fieldbyname('ano').Value;
   sqlcontribs.Last;
   ano2 := sqlContribs.fieldbyname('ano').Value;

   if ano1 = ano2 then
      result := inttostr(ano1)
   else
      result := inttostr(ano1) +' a ' + inttostr(ano2);

end;

end.

