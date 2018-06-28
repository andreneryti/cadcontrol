unit UNovoAssoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, StdCtrls, Buttons, ComCtrls, WinSkinData,
  ExtCtrls, Mask, UCDefine, DBCtrls, DB, Grids, DBGrids, dbcgrids, ToolWin,
  dblookup, ShellApi, Printers, gbcobranca, Menus,  Provider,
  SqlExpr, DBClient, DBLocal,  DBLocalS;

type
  TfrmNovoAssoc = class(TModeloInserir)
    pcPrincipal: TPageControl;
    tsDadosPessoais: TTabSheet;
    tscontatos: TTabSheet;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    UCControls1: TUCControls;
    Bevel1: TBevel;
    edRegistro: TDBEdit;
    edNome: TDBEdit;
    edcpfcnpj: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label6: TLabel;
    dbiFoto: TDBImage;
    btfoto: TButton;
    Label7: TLabel;
    Label8: TLabel;
    editDataRegistro: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    editIdentidade: TDBEdit;
    Label11: TLabel;
    editDataemissao: TDBEdit;
    Label12: TLabel;
    editOE: TDBEdit;
    Label13: TLabel;
    editDataNasc: TDBEdit;
    Label14: TLabel;
    editNaturalidade: TDBEdit;
    Label15: TLabel;
    editNacionalidade: TDBEdit;
    Label16: TLabel;
    editPai: TDBEdit;
    Label17: TLabel;
    editMae: TDBEdit;
    labRegSocial: TLabel;
    editRegistroSocial: TDBEdit;
    Bevel3: TBevel;
    Label20: TLabel;
    editTitulo: TDBEdit;
    Label21: TLabel;
    editZona: TDBEdit;
    Label22: TLabel;
    editSecao: TDBEdit;
    Label23: TLabel;
    editCNH: TDBEdit;
    Bevel2: TBevel;
    Bevel4: TBevel;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    gridOBS: TDBGrid;
    spOBSPrint: TSpeedButton;
    GroupBox2: TGroupBox;
    gridEnder: TDBGrid;
    Bevel5: TBevel;
    GroupBox3: TGroupBox;
    gridContato: TDBGrid;
    GroupBox4: TGroupBox;
    gridCorresp: TDBGrid;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    SpEnderExclui: TSpeedButton;
    spEnderEdit: TSpeedButton;
    spEnderAdd: TSpeedButton;
    spContatoExcluir: TSpeedButton;
    spContatoEdit: TSpeedButton;
    spContatoAdd: TSpeedButton;
    spCorrespExcluir: TSpeedButton;
    spCorrespEdit: TSpeedButton;
    spCorrespAdd: TSpeedButton;
    spOBSAdd: TSpeedButton;
    spOBSEditar: TSpeedButton;
    spOBSExcluir: TSpeedButton;
    Bevel7: TBevel;
    Panel4: TPanel;
    Label5: TLabel;
    editStatus: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    spCapSocDel: TSpeedButton;
    spCapSocEdit: TSpeedButton;
    spCapSocAdd: TSpeedButton;
    gridCapSocial: TDBGrid;
    GroupBox6: TGroupBox;
    spSegmentoDel: TSpeedButton;
    spSegmentoAdd: TSpeedButton;
    DBGrid6: TDBGrid;
    GroupBox7: TGroupBox;
    spSindDel: TSpeedButton;
    spSindAdd: TSpeedButton;
    DBGrid7: TDBGrid;
    GroupBox8: TGroupBox;
    spRelDel: TSpeedButton;
    spRelEdit: TSpeedButton;
    spRelAdd: TSpeedButton;
    DBGrid8: TDBGrid;
    Bevel6: TBevel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label41: TLabel;
    Label45: TLabel;
    Label24: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label25: TLabel;
    DBText5: TDBText;
    spMovimentoAdd: TSpeedButton;
    spMovimentoEdit: TSpeedButton;
    spMovimentoDel: TSpeedButton;
    spMovimentoPrint: TSpeedButton;
    Bevel8: TBevel;
    Bevel9: TBevel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    spPrescricao: TSpeedButton;
    spExtrato: TSpeedButton;
    spBoleto: TSpeedButton;
    spPrevisao: TSpeedButton;
    DBGrid9: TDBGrid;
    TabSheet1: TTabSheet;
    Bevel10: TBevel;
    GroupBox9: TGroupBox;
    spDocsEntregueEditar: TSpeedButton;
    DBGrid10: TDBGrid;
    GroupBox10: TGroupBox;
    spAnexosDel: TSpeedButton;
    spAnexosEditar: TSpeedButton;
    sdAnexoAdd: TSpeedButton;
    DBGrid11: TDBGrid;
    editEstadocivil: TDBLookupComboBox;
    editRepresentacao: TDBLookupComboBox;
    DBText4: TDBText;
    Label18: TLabel;
    Bevel11: TBevel;
    TabSheet2: TTabSheet;
    Label19: TLabel;
    Label27: TLabel;
    DBGrid2: TDBGrid;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    SpNovoParc: TSpeedButton;
    spExcluirParc: TSpeedButton;
    SpAtivarParc: TSpeedButton;
    Bevel12: TBevel;
    PageControl1: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Label26: TLabel;
    DBGrid3: TDBGrid;
    Label28: TLabel;
    DBGrid4: TDBGrid;
    spManutencao: TSpeedButton;
    spManutencaoParcelamento: TSpeedButton;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    labparcelamento: TLabel;
    Timer1: TTimer;
    spPrintParcel: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Label29: TLabel;
    DBGrid1: TDBGrid;
    Label30: TLabel;
    DBGrid5: TDBGrid;
    DBGrid12: TDBGrid;
    Label31: TLabel;
    spExtornoPresc: TSpeedButton;
    spIsencao: TSpeedButton;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    EditarVencimentoValor1: TMenuItem;
    sdsCapGuia: TSQLClientDataSet;
    sdsEmail: TSQLClientDataSet;
    sdsEmailCONTATO_DESCR: TStringField;
    cdsParcelsPagos: TClientDataSet;
    cdsParcelsPagosparcel_id: TIntegerField;
    cdsParcelsPagostotalpago: TFloatField;
    sdsverParcelamento: TSQLClientDataSet;
    sdsverParcelamentoPARCEL_ID: TIntegerField;
    sdsParcelamentoValorTotal: TSQLClientDataSet;
    sdsParcelamentoValorTotalTOTAL: TFMTBCDField;
    popupImprimeGuia: TPopupMenu;
    ImprimirGuia1: TMenuItem;
    Bevel13: TBevel;
    spRecibo: TSpeedButton;
    spReciboParcelamento: TSpeedButton;
    Label32: TLabel;
    editSexo: TDBComboBox;
    tmrExisteLote: TTimer;
    LabelLoteExiste: TLabel;
    cdsLoteAnuids: TClientDataSet;
    cdsLoteAnuidsidloteitem: TIntegerField;
    labPedido: TLabel;
    dbtxtDT_MOV: TDBText;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    sdsRespTec: TSQLClientDataSet;
    sdsRespTecREL_ID: TIntegerField;
    sdsRespTecASS_IDFILHO: TIntegerField;
    sdsRespTecREGISTRO: TStringField;
    sdsRespTecNOME: TStringField;
    sdsRespTecCPFSOCIO: TStringField;
    sdsRespTecNACIONALIDADE: TStringField;
    sdsRespTecESTCIVIL_DESC: TStringField;
    sdsRespTecIDENTIDADE: TStringField;
    sdsRespTecIDENT_OE: TStringField;
    sdsRespTecIDENT_DTEMISSAO: TDateField;
    GroupBox11: TGroupBox;
    spDocumentoExcluir: TSpeedButton;
    spDocumentoNOvo: TSpeedButton;
    DBGrid13: TDBGrid;
    spEmail: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btfotoClick(Sender: TObject);
    procedure PegaDados(ass_id:integer);
    procedure spOBSAddClick(Sender: TObject);
    procedure gridOBSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btGravarClick(Sender: TObject);
    procedure editDataNascChange(Sender: TObject);
    procedure editRepresentacaoCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btGravarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btSairMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure spOBSEditarClick(Sender: TObject);
    procedure spOBSExcluirClick(Sender: TObject);
    procedure spOBSPrintClick(Sender: TObject);
    procedure spEnderAddClick(Sender: TObject);
    procedure gridEnderDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridContatoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spEnderEditClick(Sender: TObject);
    procedure SpEnderExcluiClick(Sender: TObject);
    procedure spContatoAddClick(Sender: TObject);
    procedure spContatoEditClick(Sender: TObject);
    procedure spContatoExcluirClick(Sender: TObject);
    procedure spCorrespAddClick(Sender: TObject);
    procedure spCorrespEditClick(Sender: TObject);
    procedure spCorrespExcluirClick(Sender: TObject);
    procedure gridCorrespDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spRelAddClick(Sender: TObject);
    procedure spRelEditClick(Sender: TObject);
    procedure spRelDelClick(Sender: TObject);
    procedure spCapSocAddClick(Sender: TObject);
    procedure Regerar_Previsao;
    procedure spCapSocEditClick(Sender: TObject);
    procedure spCapSocDelClick(Sender: TObject);
    procedure spSegmentoAddClick(Sender: TObject);
    procedure spSegmentoDelClick(Sender: TObject);
    procedure spSindAddClick(Sender: TObject);
    procedure spSindDelClick(Sender: TObject);
    procedure spDocsEntregueEditarClick(Sender: TObject);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridCapSocialDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid10DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid11DblClick(Sender: TObject);
    procedure sdAnexoAddClick(Sender: TObject);
    procedure spAnexosEditarClick(Sender: TObject);
    procedure spAnexosDelClick(Sender: TObject);
    procedure spMovimentoAddClick(Sender: TObject);
    procedure spMovimentoEditClick(Sender: TObject);
    procedure spMovimentoDelClick(Sender: TObject);
    procedure spMovimentoPrintClick(Sender: TObject);
    procedure DBGrid9DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spPrevisaoClick(Sender: TObject);
    procedure spBoletoClick(Sender: TObject);

    procedure spExtratoClick(Sender: TObject);
    procedure spPrescricaoClick(Sender: TObject);
    procedure SpNovoParcClick(Sender: TObject);
    PROCEDURE CALVALORTOTNOVO;
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure AtualizaParcels;
    procedure AtualizaParcelasParc;
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure spExcluirParcClick(Sender: TObject);
    procedure SpAtivarParcClick(Sender: TObject);
    procedure spManutencaoClick(Sender: TObject);
    procedure spManutencaoParcelamentoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure spPrintParcelClick(Sender: TObject);
    procedure spExtornoPrescClick(Sender: TObject);
    procedure spIsencaoClick(Sender: TObject);
    procedure EditarVencimentoValor1Click(Sender: TObject);
    procedure DBGrid8DblClick(Sender: TObject);
    procedure RefreshAll(ass_id:integer);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirGuia1Click(Sender: TObject);
    procedure spReciboClick(Sender: TObject);
    procedure spReciboParcelamentoClick(Sender: TObject);
    procedure VerExistemeLote;
    procedure tmrExisteLoteTimer(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
          Index: Integer);
    procedure TermodeParcelamento;
    procedure ConfissaodeDivida;
    procedure ConfissaodeDividaParcelNovo;
    procedure DBGrid13DblClick(Sender: TObject);
    procedure spDocumentoNOvoClick(Sender: TObject);
    procedure spDocumentoExcluirClick(Sender: TObject);
    procedure spEmailClick(Sender: TObject);

  private
    { Private declarations }
  public


    { Public declarations }
  end;



  var
  frmNovoAssoc: TfrmNovoAssoc;
  ExisteemLote, AnuidEmLote:Integer;
  valortotParNOvo: real;

implementation

uses UDMConexao, UDMAssociado, captura, UFuncoes, UNovaObs, DBXUserControl,
  UQR_OBS, UNovoEnder, UNovoContato, UNovaCorresp, UNovoRelacionamento,
  UNovoCapSocial, UNovoSegmento, UNovoAssocSindic, UDocsEntregueEditar,
  UNovoAnexo, UNovaMovimentacao, UQR_Movimentacao, UDmFinancas,
  UGerarPrevisao, UBoleto, UDmBoleto, UBoletoVencimento, UBoletoOpcoes,
  Guias, uGuias, UPrintOpcoes, UExtratoOpcoes, UQRExtrato, UPrescricao,
  UParcelamentoContribs, UParcelamentoNovoOpcoes,  UManutAnuidades,
  UManutParcelamento, UDadosGuiaComplementar, UFichaCadastral, UPrincipal,
  UQRParcelamento, UQRParcelamentoNovo, UFormParcelaAlterDados,
  UOpcoesMetodo, UParcelamentoAntigoOpcoes, UExtratoEnvioEmail,
  gbBoleto_A4SIGCB_new, URecebo, UipoIsencao, UfrmTermoImprimirOpcoes,
  UQRConfissaoDivida, UConfDividaDadosComprom, UQRConfissaoDividaParcelNovo,
  UDocumentoAdd;

{$R *.dfm}

procedure TfrmNovoAssoc.FormShow(Sender: TObject);
begin
  inherited;
  SetRichEditAdvOption(TRichEdit(RichEdit1));
  SetRichEditAdvOption(TRichEdit(RichEdit2));
  SetRichEditAdvOption(TRichEdit(RichEdit3));
{  labparcelamento.Visible:=false;
  pcPrincipal.ActivePage :=tscontatos;
  pcPrincipal.ActivePage :=tsDadosPessoais;
  DMAssociado.cdsTp_Status.Open;
  DMAssociado.cdsEst_Civil.Open;
  DMAssociado.cdsTp_Pessoa.Open;
  DMAssociado.cdsEmp_Regiao.Open;
  DMAssociado.cdsRepresentacao.Open;
  If DMAssociado.cdsAssocTP_ASSOC_ID.value = 2 then
  begin
      labRegSocial.Visible:=false;
      editRegistroSocial.Visible:=false;
  end;

  PegaDados(DMAssociado.cdsAssocASS_ID.value);
  btgravar.Enabled :=false;

  If DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
  begin
      editDataNasc.Enabled := false;
      editEstadocivil.Enabled := false;
      editNaturalidade.Enabled := false;
      editNacionalidade.Enabled := false;
      editPai.Enabled := false;
      editMae.Enabled := false;
      editDataNasc.Enabled := false;
      editIdentidade.Enabled := false;
      editDataemissao.Enabled := false;
      editOE.Enabled := false;
      editTitulo.Enabled := false;
      editZona.Enabled := false;
      editSecao.Enabled := false;
      editCnh.Enabled := false;
  end
  else
  begin
      spCapSocAdd.Enabled := false;
      spCapSocEdit.Enabled := false;
      spCapSocDel.Enabled := false;
      gridCapSocial.Enabled := false;
  end;
 }

end;



procedure TfrmNovoAssoc.btfotoClick(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmCaptura, frmCaptura);
    if frmCaptura.ShowModal = mrOk then
    begin
      frmCaptura.Image1.Picture.BitMap.SaveToFile(ExtractFilePath(Application.ExeName)+'Foto.jpg');
      DMAssociado.cdsFoto.Edit;
      dbiFoto.Picture.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName)+'Foto.jpg');
      TGraphicField(dbiFoto.Field).LoadFromFile(ExtractFilePath(Application.ExeName)+'Foto.jpg');

      DMAssociado.PROC_FOTO_UI.close;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMAGEM').value:=DMAssociado.cdsFotoIMAGEM.value;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('DATA_INCLUSAO').value :=  DataAtual;
      If DMAssociado.cdsFotoIMG_ID.value <> null then
         DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value := DMAssociado.cdsFotoIMG_ID.value
      else
         DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value:=0;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('TIPO').value:=1;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('DESCRICAO').value:='Foto';
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('NOMEARQUIVO').value:='Foto';
      DMAssociado.PROC_FOTO_UI.ExecProc;

      DMConexao.Log('Inclusão/Alteração de Foto do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ '.', 'A', DMAssociado.cdsAssocASS_ID.value);

    end;
  finally
    frmCaptura.free;
  end;
end;

procedure TfrmNovoAssoc.PegaDados(ass_id: integer);
begin
   //Foto
   DMAssociado.cdsFoto.close;
   DMAssociado.cdsFoto.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsFoto.OPen;

   //Observações
   DMAssociado.cdsObs.Close;
   DMAssociado.cdsObs.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsObs.OPen;

   //Endereços
   DMAssociado.cdsLocEnder.Close;
   DMAssociado.cdsLocEnder.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsLocEnder.OPen;

   //Contatos
   DMAssociado.cdsLocContato.close;
   DMAssociado.cdsLocContato.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsLocContato.OPen;

   //Correspondência
   DMAssociado.cdsLocCorresp.close;
   DMAssociado.cdsLocCorresp.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsLocCorresp.OPen;

   //Relacionamentos
   DMAssociado.cdsLocRelacion.close;
   DMAssociado.cdsLocRelacion.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsLocRelacion.OPen;

   //Cap. Social
   DMAssociado.cdsLocCapSocial.close;
   DMAssociado.cdsLocCapSocial.Params.ParamByName('ass_id').Value := ass_id;
   DMAssociado.cdsLocCapSocial.OPen;

   //Segmentos
   DMAssociado.cdsLocAssocSegs.Close;
   DMAssociado.cdsLocAssocSegs.params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsLocAssocSegs.Open;

   //Sindicatos
   DMAssociado.cdsLocAssocSindic.Close;
   DMAssociado.cdsLocAssocSindic.params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsLocAssocSindic.Open;

   //Docs Entregue
   DMAssociado.cdsLocDocsEntreg.close;
   DMAssociado.cdsLocDocsEntreg.Params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsLocDocsEntreg.Params.ParamByName('tp_assoc').value := DMAssociado.cdsAssocTP_ASSOC_ID.value;
   DMAssociado.cdsLocDocsEntreg.Open;

   //Docs anexos
   DMAssociado.cdsDocsAnexos.close;
   DMAssociado.cdsDocsAnexos.Params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsDocsAnexos.Open;

   //Anexos
   DMAssociado.cdsLocAnexos.close;
   DMAssociado.cdsLocAnexos.Params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsLocAnexos.Open;

   //Movimentação
   DMAssociado.cdsLocMoviment.close;
   DMAssociado.cdsLocMoviment.Params.ParamByName('ass_id').value := ass_id;
   DMAssociado.cdsLocMoviment.Open;

   //Débitos Anuidades
   DmFinancas.cdsDebitosAnuidades.close;
   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := ass_id;
   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
   DmFinancas.cdsDebitosAnuidades.Open;

   //Débitos Parcelamentos
   DmFinancas.cdsDebitosParcelamento.close;
   DmFinancas.cdsDebitosParcelamento.Params.ParamByName('ass_id').value := ass_id;
   DmFinancas.cdsDebitosParcelamento.Params.ParamByName('tipo').value := 'P';
   DmFinancas.cdsDebitosParcelamento.Params.ParamByName('dataatual').value := DataAtual;
   DmFinancas.cdsDebitosParcelamento.Open;

   //Pagamentos
   DmFinancas.cdsPagtos.close;
   DmFinancas.cdsPagtos.Params.ParamByName('ass_id').value := ass_id;
   DmFinancas.cdsPagtos.open;
   iF DmFinancas.cdsPagtos.RecordCount = 0 then
       DmFinancas.cdspagtosItens.close;

   //Parcelamentos
   DmFinancas.cdsParcelamento.close;
   DmFinancas.cdsParcelamento.Params.ParamByName('ass_id').value := ass_id;
   DmFinancas.cdsParcelamento.Open;
   If DmFinancas.cdsParcelamento.RecordCount > 0 then
   begin
      //Parcelas do Parcelamento
      DmFinancas.cdsParcelamento.First;
      DmFinancas.cdsParcelasParc.Close;
      DmFinancas.cdsParcelasParc.Params.ParamByName('p_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      DmFinancas.cdsParcelasParc.Open;

      //Anuidades Parceladas
      Dmfinancas.cdsParcelAnuidades.close;
      Dmfinancas.cdsParcelAnuidades.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      Dmfinancas.cdsParcelAnuidades.Open;

      DmFinancas.sdsQtdeParcelAtivos.close;
      DmFinancas.sdsQtdeParcelAtivos.Params.ParamByName('ass_id').value := ass_id;
      DmFinancas.sdsQtdeParcelAtivos.Open;
      If DmFinancas.sdsQtdeParcelAtivosQTDE.value > 0  then
      begin
        Timer1.Enabled := true;
        labparcelamento.Visible:=true;
      end
      else
      begin
        Timer1.Enabled := false;
        labparcelamento.Visible:=false;
      end;
      AtualizaParcelasParc;
   end
   else
   begin
      DmFinancas.cdsParcelasParc.Close;
      Dmfinancas.cdsParcelAnuidades.close;
      Timer1.Enabled := false;
      labparcelamento.Visible:=false;
   end;

   //Prescrição / Isenção
   DMAssociado.cdsPrescIsencao.Close;
   DMAssociado.cdsPrescIsencao.Params.parambyname('ass_id').value := ass_id;
   DMAssociado.cdsPrescIsencao.open;

   VerExistemeLote;

end;

procedure TfrmNovoAssoc.spOBSAddClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovaObs,frmNovaObs);
  frmNovaObs.dtpDataObs.text := datetostr(DataAtual);
  frmNovaObs.edhora.text := timetostr(time());
  frmNovaObs.Editar(true);
  frmNovaObs.Timer1.Enabled:=true;
  if frmNovaObs.ShowModal = mrok then
  begin
       DMAssociado.PROC_OBS_UI.close;
       DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
       DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:=frmNovaObs.memoObs.lines.text;
       DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
       DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= strtodate(frmNovaObs.dtpDataObs.text);
       DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= frmNovaObs.edhora.text;
       DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
       DMAssociado.PROC_OBS_UI.ExecProc;
       DMConexao.Log('Inclusão de observação para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ 'Obs: '+frmNovaObs.dtpDataObs.text + ' - ' +copy(frmNovaObs.memoObs.lines.text,1,30)+'...'+  '.', 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsObs.Refresh;
  end;
  finally
  frmNovaObs.free;
  end;
end;

procedure TfrmNovoAssoc.gridOBSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if  gridOBS.DataSource.dataset.RecNo mod 2 = 1 then
  begin
    gridOBS.Canvas.Brush.color := clwindow;
    gridOBS.DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else
  begin
    gridOBS.Canvas.Brush.Color := $00FFCECE;
    gridOBS.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if gdselected in State then
  begin
    gridOBS.Canvas.Brush.Color := clNavy;
    gridOBS.Canvas.Font.Color := clwhite;
    gridOBS.Canvas.FillRect(Rect);
    gridOBS.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmNovoAssoc.btGravarClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i := 0 to DMAssociado.PROC_ASSOC_IU.Params.count - 1 do
  begin
          if Assigned(DMAssociado.cdsAssoc.FindField(DMAssociado.PROC_ASSOC_IU.Params[i].Name)) then
            DMAssociado.PROC_ASSOC_IU.ParamByName(DMAssociado.PROC_ASSOC_IU.Params[i].Name).value := DMAssociado.cdsAssoc.FindField(DMAssociado.PROC_ASSOC_IU.Params[i].Name).value;
  end;
  DMAssociado.PROC_ASSOC_IU.ParamByName('oper').value:='U';
  DMAssociado.PROC_ASSOC_IU.ExecProc;
  btgravar.Enabled :=false;
end;

procedure TfrmNovoAssoc.editDataNascChange(Sender: TObject);
begin
  inherited;
   btgravar.Enabled :=true;
end;

procedure TfrmNovoAssoc.editRepresentacaoCloseUp(Sender: TObject);
begin
  inherited;
//  btgravar.Enabled :=true;
end;

procedure TfrmNovoAssoc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if btGravar.Enabled = true then
  begin
      If Confirma('Os dados não foram salvos.'+#13+'Deseja salvar antes de sair?  ' ) then
      begin
         btGravar.click;
         close;
      end;
  end;
end;

procedure TfrmNovoAssoc.btGravarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btGravar.setfocus;
end;

procedure TfrmNovoAssoc.btSairMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btSair.setfocus;
end;

procedure TfrmNovoAssoc.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btSair.setfocus;
end;

procedure TfrmNovoAssoc.spOBSEditarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsObs.Active=true then
     If DMAssociado.cdsObs.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovaObs,frmNovaObs);
        If (DMAssociado.dsObs.DataSet.FieldByName('user_id').value = userid)or (userid in [13,25]) then
        begin
           frmNovaObs.Editar(true);
           frmNovaObs.Caption:='Edição de Observação';
        end
        else
        begin
           frmNovaObs.Editar(false);
           frmNovaObs.Caption := '::: Visualização de Observação :::';
        end;

        frmNovaObs.dtpDataObs.text :=datetostr(DMAssociado.dsObs.DataSet.FieldByName('DT_OBS').value );
        frmNovaObs.edhora.text := DMAssociado.dsObs.DataSet.FieldByName('hora').value ;
        frmNovaObs.memoObs.lines.Text := DMAssociado.dsObs.DataSet.FieldByName('OBS_DESCRICAO').value ;

        if frmNovaObs.ShowModal = mrok then
        begin
             DMAssociado.PROC_OBS_UI.close;
             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=DMAssociado.dsObs.DataSet.FieldByName('obs_id').value ;
             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:=frmNovaObs.memoObs.lines.text;
             DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
             DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= strtodate(frmNovaObs.dtpDataObs.text);
             DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= frmNovaObs.edhora.text;
             DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
             DMAssociado.PROC_OBS_UI.ExecProc;
             DMConexao.Log('Alteração de observação do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ 'Obs: '+frmNovaObs.dtpDataObs.text + ' - ' +copy(frmNovaObs.memoObs.lines.text,1,100)+'...'+  '.', 'A', DMAssociado.cdsAssocASS_ID.value);             
             DMAssociado.cdsObs.Refresh;
        end;
        finally
        frmNovaObs.free;
        end;
     end
     else
       Aviso('Não há observações na listagem. ');
end;

procedure TfrmNovoAssoc.spOBSExcluirClick(Sender: TObject);
begin
  inherited;
 If DMAssociado.cdsObs.Active=true then
     If DMAssociado.cdsObs.RecordCount > 0 then
     begin
        If (DMAssociado.dsObs.DataSet.FieldByName('user_id').value = userid)or (userid in [13,25 ]) then
        begin
           If Confirma('Confirma exclusão da observação selecionada? ')then
           begin
               DMAssociado.PROC_OBS_DEL.Close;
               DMAssociado.PROC_OBS_DEL.ParamByName('obs_id').value:=  DMAssociado.dsObs.DataSet.FieldByName('obs_id').value;
               DMAssociado.PROC_OBS_DEL.ExecProc;
               DMConexao.Log('Exclusão do observação do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ 'Obs: '+datetostr(DMAssociado.cdsObsDT_OBS.value) + ' - ' +copy(DMAssociado.cdsObsOBS_DESCRICAO.value,1,100)+'...'+  '.', 'E', DMAssociado.cdsAssocASS_ID.value);               
               DMAssociado.cdsObs.Refresh;
           end;
        end
        else
           Aviso('Somente o usuário criador e o administrador pode excluir esta observação. ');
     end
     else
       Aviso('Não há observações na listagem. ');
end;

procedure TfrmNovoAssoc.spOBSPrintClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsObs.Active=true then
     If DMAssociado.cdsObs.RecordCount > 0 then
     begin
        try Application.CreateForm(TQR_OBS,QR_OBS);
        Qr_obs.labRegistro.caption:=copy(edRegistro.Text,1,7)+'/'+copy(edRegistro.Text,8,4);
        Qr_obs.labnome.caption:=ednome.Text;
        QR_OBS.preview;
        finally
        QR_OBS.free;
        end;
     end
     else
       Aviso('Não há observações na listagem. ');
end;

procedure TfrmNovoAssoc.spEnderAddClick(Sender: TObject);
var
   i:integer;
begin
  inherited;
  Try Application.CreateForm(TfrmNovoEnder,frmNovoEnder);
  DMAssociado.cdsEnder.Open;
  DMAssociado.cdsEnder.Append;
  DMAssociado.cdsEnder.Edit;
  DMAssociado.cdsEnderASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  DMAssociado.cdsEnderEND_ID.value:= 0;
  DMAssociado.cdsEnderEND_CORRESP_DEV.value:= 0;
  DMAssociado.cdsEnderEND_CORRESP.value:= 0;
  DMAssociado.cdsEnderEND_ID.value:= 0;

  frmNovoEnder.cbEstado.Clear;
  frmNovoEnder.cdsEstado.Open;
  while not frmNovoEnder.cdsEstado.eof do
  begin
      frmNovoEnder.cbEstado.Items.add(frmNovoEnder.cdsEstadoESTADO_SIGLA.Value);
      frmNovoEnder.cdsEstado.next;
  end;

  frmNovoEnder.cbEstado.text:='RJ';
  frmNovoEnder.cbEstadoSelect(SENDER);
  if frmNovoEnder.ShowModal = mrok then
  begin
       DMAssociado.PROC_ENDER_UI.close;
       for i := 0 to DMAssociado.PROC_ENDER_UI.Params.count - 1 do
       begin
          if Assigned(DMAssociado.cdsEnder.FindField(DMAssociado.PROC_ENDER_UI.Params[i].Name)) then
            DMAssociado.PROC_ENDER_UI.ParamByName(DMAssociado.PROC_ENDER_UI.Params[i].Name).value := DMAssociado.cdsEnder.FindField(DMAssociado.PROC_ENDER_UI.Params[i].Name).value;
       end;
       DMAssociado.PROC_ENDER_UI.ExecProc;
       DMConexao.Log('Inclusão de Endereço pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Endereço: '+DMAssociado.cdsEnderEND_LOGRADOURO.value+','+DMAssociado.cdsEnderEND_NUMERO.value+','+DMAssociado.cdsEnderEND_COMPLEMENTO.value+','+DMAssociado.cdsEnderEND_BAIRRO.value + '- CIDADE ID:'+inttostr(DMAssociado.cdsEnderCIDADE_ID.value)+',CEP:'+DMAssociado.cdsEnderEND_CEP.value+ '(CORRESP:'+INTTOSTR(DMAssociado.cdsEnderEND_CORRESP.value)+') DEV:'+INTTOSTR(DMAssociado.cdsEnderEND_CORRESP_DEV.VALUE) + ').', 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocEnder.Refresh;
  end
  else
    DMAssociado.cdsEnder.Cancel;
  finally
  frmNovoEnder.free;
  end;
end;

procedure TfrmNovoAssoc.gridEnderDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.gridContatoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.spEnderEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If DMAssociado.cdsLocEnder.Active=true then
     If DMAssociado.cdsLocEnder.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovoEnder,frmNovoEnder);
        DMAssociado.cdsEnder.Close;
        DMAssociado.cdsEnder.Params.ParamByName('end_id').value := DMAssociado.cdsLocEnderEND_ID.Value;
        DMAssociado.cdsEnder.Open;
        DMAssociado.cdsEnder.Edit;

        frmNovoEnder.cbEstado.Clear;
        frmNovoEnder.cdsEstado.Open;
        frmNovoEnder.Caption :=':::Edição de Endereço:::';
        while not frmNovoEnder.cdsEstado.eof do
        begin
            frmNovoEnder.cbEstado.Items.add(frmNovoEnder.cdsEstadoESTADO_SIGLA.Value);
            frmNovoEnder.cdsEstado.next;
        end;

        frmNovoEnder.cbEstado.text:=DMAssociado.cdsLocEnderESTADO_SIGLA.value;
        frmNovoEnder.cbEstadoSelect(SENDER);

        if frmNovoEnder.ShowModal = mrok then
        begin
             DMAssociado.PROC_ENDER_UI.close;
             for i := 0 to DMAssociado.PROC_ENDER_UI.Params.count - 1 do
             begin
                if Assigned(DMAssociado.cdsEnder.FindField(DMAssociado.PROC_ENDER_UI.Params[i].Name)) then
                  DMAssociado.PROC_ENDER_UI.ParamByName(DMAssociado.PROC_ENDER_UI.Params[i].Name).value := DMAssociado.cdsEnder.FindField(DMAssociado.PROC_ENDER_UI.Params[i].Name).value;
             end;
             DMAssociado.PROC_ENDER_UI.ExecProc;
             DMAssociado.cdsLocEnder.Refresh;
             DMConexao.Log('Alteração do Endereço do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Endereço: '+DMAssociado.cdsLocEnderEND_LOGRADOURO.value+','+DMAssociado.cdsLocEnderEND_NUMERO.value+','+DMAssociado.cdsLocEnderEND_COMPLEMENTO.value+','+DMAssociado.cdsLocEnderEND_BAIRRO.value + '-'+DMAssociado.cdsLocEnderCIDADE_NOME.value+'/'+DMAssociado.cdsLocEnderESTADO_SIGLA.value+',CEP:'+DMAssociado.cdsLocEnderEND_CEP.value+ '(CORRESP:'+DMAssociado.cdsLocEnderEND_CORRESP.value+') DEV:'+DMAssociado.cdsLocEnderEND_CORRESP_DEV.VALUE + ').', 'A', DMAssociado.cdsAssocASS_ID.value);
        end
        else
          DMAssociado.cdsEnder.Cancel;
        finally
        frmNovoEnder.free;
        end;
     end;
end;

procedure TfrmNovoAssoc.SpEnderExcluiClick(Sender: TObject);
var
  msg:string;
begin
  inherited;
   If DMAssociado.cdsLocEnder.Active=true then
     If DMAssociado.cdsLocEnder.RecordCount > 0 then
     begin
        If DMAssociado.cdsLocEnderEND_CORRESP.value = 'Sim' then
           msg :='O endereço selecionado é de correspondência.'+#13+'Confirma exclusão do endereço? '
        else
           msg := 'Confirma exclusão do endereço? ';
        If Confirma(msg) then
        begin
            DMAssociado.PROC_ENDER_DEL.Close;
            DMAssociado.PROC_ENDER_DEL.ParamByName('end_id').value := DMAssociado.cdsLocEnderEND_ID.value;
            DMAssociado.PROC_ENDER_DEL.ExecProc;
            DMConexao.Log('Exclusão do Endereço do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Endereço: '+DMAssociado.cdsLocEnderEND_LOGRADOURO.value+','+DMAssociado.cdsLocEnderEND_NUMERO.value+','+DMAssociado.cdsLocEnderEND_COMPLEMENTO.value+','+DMAssociado.cdsLocEnderEND_BAIRRO.value + '-'+DMAssociado.cdsLocEnderCIDADE_NOME.value+'/'+DMAssociado.cdsLocEnderESTADO_SIGLA.value+',CEP:'+DMAssociado.cdsLocEnderEND_CEP.value+ '(CORRESP:'+DMAssociado.cdsLocEnderEND_CORRESP.value+') DEV:'+DMAssociado.cdsLocEnderEND_CORRESP_DEV.VALUE + ').', 'E', DMAssociado.cdsAssocASS_ID.value);
            DMAssociado.cdsLocEnder.Refresh;
            if not DMAssociado.cdsLocEnder.Locate('end_corresp','Sim',[]) then
               Aviso('Este filiado está sem endereço de correspondência cadastrado. ')
            else
               DMAssociado.cdsLocEnder.first;
        end;
     end
     else
        Aviso('Não há endereço cadastrado. ');
end;

procedure TfrmNovoAssoc.spContatoAddClick(Sender: TObject);
var
   i:integer;
begin
  inherited;
  Try Application.CreateForm(TfrmNovoContato,frmNovoContato);
  DMAssociado.cdsContato.Close;
  DMAssociado.cdsContato.Open;
  DMAssociado.cdsContato.Append;
  DMAssociado.cdsContato.Edit;
  DMAssociado.cdsContatoASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  DMAssociado.cdsContatoCONTATO.value:= 0;
  DMAssociado.cdsContatoTP_STATUS_ID.value:= 1;
  if frmNovoContato.ShowModal = mrok then
  begin
       DMAssociado.PROC_CONTATO_UI.close;
       for i := 0 to DMAssociado.PROC_CONTATO_UI.Params.count - 1 do
       begin
          if Assigned(DMAssociado.cdsContato.FindField(DMAssociado.PROC_CONTATO_UI.Params[i].Name)) then
            DMAssociado.PROC_CONTATO_UI.ParamByName(DMAssociado.PROC_CONTATO_UI.Params[i].Name).value := DMAssociado.cdsContato.FindField(DMAssociado.PROC_CONTATO_UI.Params[i].Name).value;
       end;
       DMAssociado.PROC_CONTATO_UI.ExecProc;
       DMConexao.Log('Inclusão de Contato pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / '+  frmnovocontato.cbTipo.text+':'+ DMAssociado.cdsContatoCONTATO_DESCR.value+ '.', 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocContato.Refresh;
  end
  else
    DMAssociado.cdsContato.Cancel;
  finally
  frmNovoContato.free;
  end;
end;

procedure TfrmNovoAssoc.spContatoEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If DMAssociado.cdsLocContato.Active=true then
     If DMAssociado.cdsLocContato.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovoContato,frmNovoContato);
        DMAssociado.cdsContato.Close;
        DMAssociado.cdsContato.Params.ParamByName('contato_id').value := DMAssociado.cdsLocContatoCONTATO.Value;
        DMAssociado.cdsContato.Open;
        DMAssociado.cdsContato.Edit;
        frmNovoContato.Caption:=':::Edição de Contato:::';
        if frmNovoContato.ShowModal = mrok then
        begin
             DMAssociado.PROC_CONTATO_UI.close;
             for i := 0 to DMAssociado.PROC_CONTATO_UI.Params.count - 1 do
             begin
                if Assigned(DMAssociado.cdsContato.FindField(DMAssociado.PROC_CONTATO_UI.Params[i].Name)) then
                  DMAssociado.PROC_CONTATO_UI.ParamByName(DMAssociado.PROC_CONTATO_UI.Params[i].Name).value := DMAssociado.cdsContato.FindField(DMAssociado.PROC_CONTATO_UI.Params[i].Name).value;
             end;
             DMAssociado.PROC_CONTATO_UI.ExecProc;
             DMAssociado.cdsLocContato.Refresh;
             DMConexao.Log('Alteração de Contato do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / '+  DMAssociado.cdsLocContatoTP_CONTATO_DESC.value +':'+ DMAssociado.cdsLocContatoCONTATO_DESCR.value+ '.', 'A', DMAssociado.cdsAssocASS_ID.value);
        end
        else
          DMAssociado.cdsContato.Cancel;
        finally
        frmNovoContato.free;
        end;
     end;
end;

procedure TfrmNovoAssoc.spContatoExcluirClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocContato.Active=true then
     If DMAssociado.cdsLocContato.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão do contato selecionado? ')then
       begin
           DMAssociado.PROC_CONTATO_DEL.Close;
           DMAssociado.PROC_CONTATO_DEL.ParamByName('contato').value:=  DMAssociado.dsLocContato.DataSet.FieldByName('Contato').value;
           DMAssociado.PROC_CONTATO_DEL.ExecProc;
           DMConexao.Log('Exclusão do Contato do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / '+DMAssociado.cdsLocContatoTP_CONTATO_DESC.value + ':'+DMAssociado.cdsLocContatoCONTATO_DESCR.value+ ').', 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocContato.Refresh;
       end;
     end
     else
       Aviso('Não há contatos na listagem. ');
end;

procedure TfrmNovoAssoc.spCorrespAddClick(Sender: TObject);
var
   i:integer;
begin
  inherited;
  Try Application.CreateForm(TfrmNovaCorresp,frmNovaCorresp);
  DMAssociado.cdsCorresp.Close;
  DMAssociado.cdsCorresp.Open;
  DMAssociado.cdsCorresp.Append;
  DMAssociado.cdsCorresp.Edit;
  DMAssociado.cdsCorrespASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  DMAssociado.cdsCorrespCORRESP_ID.value:= 0;
  DMAssociado.cdsCorrespDT_CRIACAO.value:= DataAtual;
  if frmNovaCorresp.ShowModal = mrok then
  begin
       DMAssociado.PROC_CORRESP_UI.close;
       for i := 0 to DMAssociado.PROC_CORRESP_UI.Params.count - 1 do
       begin
          if Assigned(DMAssociado.cdsCorresp.FindField(DMAssociado.PROC_CORRESP_UI.Params[i].Name)) then
            DMAssociado.PROC_CORRESP_UI.ParamByName(DMAssociado.PROC_CORRESP_UI.Params[i].Name).value := DMAssociado.cdsCorresp.FindField(DMAssociado.PROC_CORRESP_UI.Params[i].Name).value;
       end;
       DMAssociado.PROC_CORRESP_UI.ExecProc;
       DMConexao.Log('Inclusão de Correspondência pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Tipo: '+ inttostr(DMAssociado.cdsCorrespTP_CORRESP_ID.value)+' - Envio:'+datetostr(DMAssociado.cdsCorrespDT_ENVIO.value)+ '.', 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocCorresp.Refresh;
  end
  else
    DMAssociado.cdsCorresp.Cancel;
  finally
  frmNovaCorresp.free;
  end;
end;
procedure TfrmNovoAssoc.spCorrespEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If DMAssociado.cdsLocCorresp.Active=true then
     If DMAssociado.cdsLocCorresp.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovaCorresp,frmNovaCorresp);
        DMAssociado.cdsCorresp.Close;
        DMAssociado.cdsCorresp.Params.ParamByName('corresp_id').value := DMAssociado.cdsLocCorrespCORRESP_ID.Value;
        DMAssociado.cdsCorresp.Open;
        DMAssociado.cdsCorresp.Edit;
        frmNovaCorresp.Caption:='::: Edição de Correspondência :::';
        if frmNovaCorresp.ShowModal = mrok then
        begin
             DMAssociado.PROC_CORRESP_UI.close;
             for i := 0 to DMAssociado.PROC_CORRESP_UI.Params.count - 1 do
             begin
                if Assigned(DMAssociado.cdsCorresp.FindField(DMAssociado.PROC_CORRESP_UI.Params[i].Name)) then
                  DMAssociado.PROC_CORRESP_UI.ParamByName(DMAssociado.PROC_CORRESP_UI.Params[i].Name).value := DMAssociado.cdsCorresp.FindField(DMAssociado.PROC_CORRESP_UI.Params[i].Name).value;
             end;
             DMAssociado.PROC_CORRESP_UI.ExecProc;
             DMAssociado.cdsLocCorresp.Refresh;
             DMConexao.Log('Alteração de Correspondência do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / '+  DMAssociado.cdsLocCorrespTP_CORRESP_DESCR.value +' Envio em '+ datetostr(DMAssociado.cdsLocCorrespDT_ENVIO.value)+ ', Sit:'+ DMAssociado.cdsLocCorrespSIT_CORRESP_DESC.value+'.', 'A', DMAssociado.cdsAssocASS_ID.value);
        end
        else
          DMAssociado.cdsCorresp.Cancel;
        finally
        frmNovaCorresp.free;
        end;
     end;
end;


procedure TfrmNovoAssoc.spCorrespExcluirClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocCorresp.Active=true then
     If DMAssociado.cdsLocCorresp.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão da Correspondência selecionada? ')then
       begin
           DMAssociado.PROC_CORRESP_DEL.Close;
           DMAssociado.PROC_CORRESP_DEL.ParamByName('corresp_id').value:=  DMAssociado.dsLocCorresp.DataSet.FieldByName('corresp_id').value;
           DMAssociado.PROC_CORRESP_DEL.ExecProc;
           DMConexao.Log('Exclusão de Correspondência do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / '+DMAssociado.cdsLocCorrespTP_CORRESP_DESCR.value + ' Enviada em '+datetostr( DMAssociado.cdsLocCorrespDT_ENVIO.value)+ '.', 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocCorresp.Close;
           DMAssociado.cdsLocCorresp.Open;
       end;
     end
     else
       Aviso('Não há correspondências na listagem. ');
end;

procedure TfrmNovoAssoc.gridCorrespDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.spRelAddClick(Sender: TObject);
var
   i:integer;
begin
  inherited;
  Try Application.CreateForm(TfrmNovoRelacionamento,frmNovoRelacionamento);
  DMAssociado.cdsRelac.Close;
  DMAssociado.cdsRelac.Open;
  DMAssociado.cdsRelac.Append;
  DMAssociado.cdsRelac.Edit;
  if DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
  begin
     DMAssociado.cdsRelacASS_IDPAI.value:= DMAssociado.cdsAssocASS_ID.value;
     DMAssociado.cdsRelacASS_IDFILHO.value:= 0;
  end
  else
  if DMAssociado.cdsAssocTP_ASSOC_ID.value = 2 then
  begin
     DMAssociado.cdsRelacASS_IDPAI.value:= 0;
     DMAssociado.cdsRelacASS_IDFILHO.value:= DMAssociado.cdsAssocASS_ID.value;
  end;

  DMAssociado.cdsRelacREL_ID.value:= 0;
  DMAssociado.cdsRelacDT_INCLUSAO.value:= DataAtual;
  DMAssociado.cdsRelacTP_STATUS_ID.value := 1;
  if frmNovoRelacionamento.ShowModal = mrok then
  begin
       DMAssociado.PROC_RELACION_UI.close;
       for i := 0 to DMAssociado.PROC_RELACION_UI.Params.count - 1 do
       begin
          if Assigned(DMAssociado.cdsRelac.FindField(DMAssociado.PROC_RELACION_UI.Params[i].Name)) then
            DMAssociado.PROC_RELACION_UI.ParamByName(DMAssociado.PROC_RELACION_UI.Params[i].Name).value := DMAssociado.cdsRelac.FindField(DMAssociado.PROC_RELACION_UI.Params[i].Name).value;
       end;
       DMAssociado.PROC_RELACION_UI.ExecProc;
       DMConexao.Log('Inclusão de Relacionamento pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Tipo:'+ inttostr(DMAssociado.cdsRelacTP_REL_ID.value) +' - ' +DMAssociado.cdsRelacNOMESOCIO.value+ '.', 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocRelacion.Refresh;
  end
  else
    DMAssociado.cdsRelac.Cancel;
  finally
  frmNovoRelacionamento.free;
  end;
end;

procedure TfrmNovoAssoc.spRelEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If DMAssociado.cdsLocRelacion.Active=true then
     If DMAssociado.cdsLocRelacion.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovoRelacionamento,frmNovoRelacionamento);
        DMAssociado.cdsRelac.Close;
        DMAssociado.cdsRelac.Params.ParamByName('rel_id').value := DMAssociado.cdsLocRelacionREL_ID.Value;
        DMAssociado.cdsRelac.Open;
        DMAssociado.cdsRelac.Edit;

        if (DMAssociado.cdsRelacTP_REL_ID.value = 1) then
        begin
           frmNovoRelacionamento.sdsPegaRergistro.close;
           If (DMAssociado.cdsAssocTP_ASSOC_ID.value = 1) then
               frmNovoRelacionamento.sdsPegaRergistro.ParamByName('ass_id').value := DMAssociado.cdsRelacASS_IDFILHO.value
           else
               frmNovoRelacionamento.sdsPegaRergistro.ParamByName('ass_id').value := DMAssociado.cdsRelacASS_IDPAI.value;
           frmNovoRelacionamento.sdsPegaRergistro.open;
           frmNovoRelacionamento.edRegistro.text := frmNovoRelacionamento.sdsPegaRergistroREGISTRO.value;
        end;

        frmNovoRelacionamento.Caption:='::: Edição de Relacionamento :::';
        if frmNovoRelacionamento.ShowModal = mrok then
        begin
             DMAssociado.PROC_RELACION_UI.close;
             for i := 0 to DMAssociado.PROC_RELACION_UI.Params.count - 1 do
             begin
                if Assigned(DMAssociado.cdsRelac.FindField(DMAssociado.PROC_RELACION_UI.Params[i].Name)) then
                  DMAssociado.PROC_RELACION_UI.ParamByName(DMAssociado.PROC_RELACION_UI.Params[i].Name).value := DMAssociado.cdsRelac.FindField(DMAssociado.PROC_RELACION_UI.Params[i].Name).value;
             end;
             DMAssociado.PROC_RELACION_UI.ExecProc;
             DMAssociado.cdsLocRelacion.Refresh;
             DMConexao.Log('Alteração do Relacionamento do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Tipo: '+ DMAssociado.cdsLocRelacionTP_REL_DESCRICAO.value +' - ' + DMAssociado.cdsLocRelacionNOMESOCIO.value  + '.', 'A', DMAssociado.cdsAssocASS_ID.value);
        end
        else
          DMAssociado.cdsRelac.Cancel;
        finally
        frmNovoRelacionamento.free;
        end;
     end;
end;



procedure TfrmNovoAssoc.spRelDelClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocRelacion.Active=true then
     If DMAssociado.cdsLocRelacion.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão do Relacionamento selecionado? ')then
       begin
           DMAssociado.PROC_RELACION_DEL.Close;
           DMAssociado.PROC_RELACION_DEL.ParamByName('rel_id').value:=  DMAssociado.dsLocRelacion.DataSet.FieldByName('rel_id').value;
           DMAssociado.PROC_RELACION_DEL.ExecProc;
           DMConexao.Log('Exclusão do Relacionamento do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Tipo: '+DMAssociado.cdsLocRelacionTP_REL_DESCRICAO.value+' - '+DMAssociado.cdsLocRelacionNOMESOCIO.value, 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocRelacion.Close;
           DMAssociado.cdsLocRelacion.Open;
       end;
     end
     else
       Aviso('Não há relacionamentos na listagem. ');
end;

procedure TfrmNovoAssoc.spCapSocAddClick(Sender: TObject);
var
   i:integer;
begin
  inherited;
  If DMAssociado.cdsAssocTP_ASSOC_ID.value <> 1 then
  begin
      Aviso('Este tipo de pessoa não tem capital social. ');
      Abort;
  end;
  Try Application.CreateForm(TfrmNovoCapSocial,frmNovoCapSocial);
  DMAssociado.cdsCapSocial.Close;
  DMAssociado.cdsCapSocial.Params.ParamByName('cap_id').Clear;
  DMAssociado.cdsCapSocial.Open;
  DMAssociado.cdsCapSocial.Append;
  DMAssociado.cdsCapSocial.Edit;
  DMAssociado.cdsCapSocialASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  DMAssociado.cdsCapSocialCAPSOCIAL_ID.value:= 0;
  DMAssociado.cdsCapSocialDT_CADASTRO.value:= DataAtual;
  if frmNovoCapSocial.ShowModal = mrok then
  begin
      try
       DMAssociado.PROC_CAPSOCIAL_UI.close;
       for i := 0 to DMAssociado.PROC_CAPSOCIAL_UI.Params.count - 1 do
       begin
          if Assigned(DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name)) then
            DMAssociado.PROC_CAPSOCIAL_UI.ParamByName(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value := DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value;
       end;
       DMAssociado.PROC_CAPSOCIAL_UI.ExecProc;
       DMConexao.Log('Inclusão de Capital Social pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Data:'+ datetostr(DMAssociado.cdsCapSocialDT_CAPSOCIAL.value) +' - Valor: ' +floattostr(Dmassociado.cdsCapSocialVALOR.asfloat), 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocCapSocial.Refresh;
        Regerar_Previsao;
       except
         //
       end;
  end
  else
    DMAssociado.cdsCapSocial.Cancel;
  finally
  frmNovoCapSocial.free;
  end;
end;

procedure TfrmNovoAssoc.spCapSocEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If DMAssociado.cdsLocCapSocial.Active=true then
     If DMAssociado.cdsLocCapSocial.RecordCount > 0 then
     begin
        Try Application.CreateForm(TfrmNovoCapSocial,frmNovoCapSocial);
        DMAssociado.cdsCapSocial.Close;
        DMAssociado.cdsCapSocial.Params.ParamByName('cap_id').value := DMAssociado.cdsLocCapSocialCAPSOCIAL_ID.Value;
        DMAssociado.cdsCapSocial.Open;
        DMAssociado.cdsCapSocial.Edit;
        frmNovoCapSocial.Caption:=':::Edição de Capital Social:::';
        if frmNovoCapSocial.ShowModal = mrok then
        begin
             DMAssociado.PROC_CAPSOCIAL_UI.close;
             for i := 0 to DMAssociado.PROC_CAPSOCIAL_UI.Params.count - 1 do
             begin
                if Assigned(DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name)) then
                begin
                   if DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name) is tfmtbcdfield then
                      DMAssociado.PROC_CAPSOCIAL_UI.ParamByName(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value := stringreplace(DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value,'.','',[rfReplaceAll])
                   else
                      DMAssociado.PROC_CAPSOCIAL_UI.ParamByName(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value := DMAssociado.cdsCapSocial.FindField(DMAssociado.PROC_CAPSOCIAL_UI.Params[i].Name).value;
                end;
             end;
             DMAssociado.PROC_CAPSOCIAL_UI.ExecProc;
             DMAssociado.cdsLocCapSocial.Refresh;
             DMConexao.Log('Alteração de Capital Social do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Data:'+ datetostr(DMAssociado.cdsLocCapSocialDT_CAPSOCIAL.value) +' - Valor: ' +floattostr(Dmassociado.cdsLocCapSocialVALOR.asfloat)  + '.', 'A', DMAssociado.cdsAssocASS_ID.value);
             try
                Regerar_Previsao;
             except
             //
             end;
        end
        else
          DMAssociado.cdsCapSocial.Cancel;
        finally
        frmNovoCapSocial.free;
        end;
     end;
end;

procedure TfrmNovoAssoc.spCapSocDelClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocCapSocial.Active=true then
     If DMAssociado.cdsLocCapSocial.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão do capital social selecionado? ')then
       begin
           DMAssociado.PROC_CAPSOCIAL_DEL.Close;
           DMAssociado.PROC_CAPSOCIAL_DEL.ParamByName('CAPSOCIAL_ID').value:=  DMAssociado.dsLocCapSocial.DataSet.FieldByName('CAPSOCIAL_ID').value;
           DMAssociado.PROC_CAPSOCIAL_DEL.ExecProc;
           DMConexao.Log('Exclusão de Capital Social do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Data:'+ datetostr(DMAssociado.cdsLocCapSocialDT_CAPSOCIAL.value) +' - Valor: ' +floattostr(Dmassociado.cdsLocCapSocialVALOR.asfloat), 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocCapSocial.close;
           DMAssociado.cdsLocCapSocial.open;
           Regerar_Previsao;
       end;
     end
     else
       Aviso('Não há capital social na listagem. ');

end;

procedure TfrmNovoAssoc.spSegmentoAddClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovoSegmento,frmNovoSegmento);
  DMAssociado.cdsAssocSegs.Close;
  DMAssociado.cdsAssocSegs.Params.ParamByName('segmento_id').Clear;
  DMAssociado.cdsAssocSegs.Params.ParamByName('ass_id').Clear;
  DMAssociado.cdsAssocSegs.Open;
  DMAssociado.cdsAssocSegs.Append;
  DMAssociado.cdsAssocSegs.Edit;
  DMAssociado.cdsAssocSegsASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  if frmNovoSegmento.ShowModal = mrok then
  begin
       DMAssociado.PROC_ASSOCSEGMENTO_I.close;
       DMAssociado.PROC_ASSOCSEGMENTO_I.ParamByName('segmento_id').value := DMAssociado.cdsAssocSegsSEGMENTO_ID.value;
       DMAssociado.PROC_ASSOCSEGMENTO_I.ParamByName('ass_id').value := DMAssociado.cdsAssocSegsASS_ID.value;
       DMAssociado.PROC_ASSOCSEGMENTO_I.ExecProc;
       DMConexao.Log('Inclusão de Segmento pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Segmento Cod:'+ inttostr(DMAssociado.cdsAssocSegsSEGMENTO_ID.value) , 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocAssocSegs.Refresh;
  end
  else
    DMAssociado.cdsAssocSegs.Cancel;
  finally
  frmNovoSegmento.free;
  end;
end;

procedure TfrmNovoAssoc.spSegmentoDelClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocAssocSegs.Active=true then
     If DMAssociado.cdsLocAssocSegs.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão do segmento selecionado? ')then
       begin
           DMAssociado.PROC_ASSOCSEGMENTO_DEL.Close;
           DMAssociado.PROC_ASSOCSEGMENTO_DEL.ParamByName('segmento_id').value:=  DMAssociado.dsLocAssocSegs.DataSet.FieldByName('Segmento_ID').value;
           DMAssociado.PROC_ASSOCSEGMENTO_DEL.ParamByName('Ass_id').value:=  DMAssociado.dsAssoc.DataSet.FieldByName('Ass_ID').value;
           DMAssociado.PROC_ASSOCSEGMENTO_DEL.ExecProc;
           DMConexao.Log('Exclusão de Segmento do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Segmento:'+ DMAssociado.cdsLocAssocSegsDESCRICAO.value, 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocAssocSegs.close;
           DMAssociado.cdsLocAssocSegs.Open;

       end;
     end
     else
       Aviso('Não há segmento na listagem. ');
end;

procedure TfrmNovoAssoc.spSindAddClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovoAssocSindic,frmNovoAssocSindic);
  DMAssociado.cdsAssocSindic.Close;
  DMAssociado.cdsAssocSindic.Params.ParamByName('sindic_id').Clear;
  DMAssociado.cdsAssocSindic.Params.ParamByName('ass_id').Clear;
  DMAssociado.cdsAssocSindic.Open;
  DMAssociado.cdsAssocSindic.Append;
  DMAssociado.cdsAssocSindic.Edit;
  DMAssociado.cdsAssocSindicASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  if frmNovoAssocSindic.ShowModal = mrok then
  begin
       DMAssociado.cdsAssocSindicANO.value:= strtoint(frmNovoAssocSindic.Editano.text);

       try
       DMAssociado.PROC_ASSOCSINDICATO_I.close;
       DMAssociado.PROC_ASSOCSINDICATO_I.ParamByName('sindic_id').value := DMAssociado.cdsAssocSindicSINDIC_ID.value;
       DMAssociado.PROC_ASSOCSINDICATO_I.ParamByName('ass_id').value := DMAssociado.cdsAssocSindicASS_ID.value;
       DMAssociado.PROC_ASSOCSINDICATO_I.ParamByName('OBSERVACAO').value := DMAssociado.cdsAssocSindicOBSERVACAO.value;
       DMAssociado.PROC_ASSOCSINDICATO_I.ParamByName('ANO').value := DMAssociado.cdsAssocSindicANO.value;
       DMAssociado.PROC_ASSOCSINDICATO_I.ExecProc;
       Except
           Aviso('Já existe cadastro deste Sindicato/Federação/Associação neste ano. ');
           abort;
       end;
       DMConexao.Log('Inclusão de Outros Sind/Fed/Associação pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Sind_Id: '+ inttostr(DMAssociado.cdsAssocSindicSINDIC_ID.value) +' ANO: ' + inttostr(DMAssociado.cdsAssocSindicANO.value), 'I', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocAssocSindic.close;
       DMAssociado.cdsLocAssocSindic.Open;
  end
  else
    DMAssociado.cdsAssocSindic.Cancel;
  finally
  frmNovoAssocSindic.free;
  end;

end;

procedure TfrmNovoAssoc.spSindDelClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocAssocSindic.Active=true then
     If DMAssociado.cdsLocAssocSindic.RecordCount > 0 then
     begin
       If Confirma('Confirma exclusão do sindicato selecionado? ')then
       begin
           DMAssociado.PROC_ASSOCSINDICATO_DEL.Close;
           DMAssociado.PROC_ASSOCSINDICATO_DEL.ParamByName('sindic_id').value:=  DMAssociado.dsLocAssocSindic.DataSet.FieldByName('Sindic_ID').value;
           DMAssociado.PROC_ASSOCSINDICATO_DEL.ParamByName('Ass_id').value:=  DMAssociado.dsAssoc.DataSet.FieldByName('Ass_ID').value;
           DMAssociado.PROC_ASSOCSINDICATO_DEL.ParamByName('ano').value:=  DMAssociado.dsLocAssocSindic.DataSet.FieldByName('ano').value;
           DMAssociado.PROC_ASSOCSINDICATO_DEL.ExecProc;
           DMConexao.Log('Exclusão de Outros Sind/Fed/Associação do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Sind/Fed/Associação:'+ DMAssociado.cdsLocAssocSindicSINDIC_NOME.value+'('+DMAssociado.cdsLocAssocSindicOBSERVACAO.value+')', 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocAssocSindic.close;
           DMAssociado.cdsLocAssocSindic.Open;
       end;
     end
     else
       Aviso('Não há sindicato na listagem. ');

end;

procedure TfrmNovoAssoc.spDocsEntregueEditarClick(Sender: TObject);
begin
  inherited;
  Try application.createform(tfrmDocsEntregueEditar,frmDocsEntregueEditar);
  frmDocsEntregueEditar.cdsLocDocsEntreg.Close;
  frmDocsEntregueEditar.cdsLocDocsEntreg.Params.ParamByName('ass_id').value:=DMAssociado.cdsLocDocsEntreg.Params.ParamByName('ass_id').value;
  frmDocsEntregueEditar.cdsLocDocsEntreg.Params.ParamByName('tp_assoc').value:=DMAssociado.cdsLocDocsEntreg.Params.ParamByName('tp_assoc').value;
  frmDocsEntregueEditar.cdsLocDocsEntreg.Open;
  frmDocsEntregueEditar.cdsLocDocsEntreg.First;
  frmDocsEntregueEditar.cdsLocDocsEntreg.Edit;
  frmDocsEntregueEditar.showmodal;
  frmDocsEntregueEditar.cdsLocDocsEntreg.first;
  while not frmDocsEntregueEditar.cdsLocDocsEntreg.eof do
  begin
      DMAssociado.PROC_DOCENTREGUE.close;
      DMAssociado.PROC_DOCENTREGUE.Params.ParamByName('doc_id').value:= frmDocsEntregueEditar.cdsLocDocsEntregDOC_ID.Value;
      DMAssociado.PROC_DOCENTREGUE.Params.ParamByName('ass_id').value:= DMAssociado.cdsAssocASS_ID.value;
      DMAssociado.PROC_DOCENTREGUE.Params.ParamByName('oper').value:=copy(frmDocsEntregueEditar.cdsLocDocsEntregSITUACAO.value,1,1);
      DMAssociado.PROC_DOCENTREGUE.ExecProc;
      DMConexao.Log('Alteração de Documentos Entregue pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'- Doc: '+ DMAssociado.cdsLocDocsEntregDOC_DESCRICAO.Value+' - Situação:'+ copy(frmDocsEntregueEditar.cdsLocDocsEntregSITUACAO.value,1,1) , 'A', DMAssociado.cdsAssocASS_ID.value);
      frmDocsEntregueEditar.cdsLocDocsEntreg.next;
  end;
  DMAssociado.cdsLocDocsEntreg.close;
  DMAssociado.cdsLocDocsEntreg.Open;
  finally
  end;
end;

procedure TfrmNovoAssoc.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

  if (DMAssociado.cdsLocRelacioncanc.value=1) then
  begin
    Tdbgrid(Sender).Canvas.Font.Color := clred;
    Tdbgrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TfrmNovoAssoc.gridCapSocialDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid10DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid11DblClick(Sender: TObject);
var
  b:TStream;
  f:TFileStream;
  arq:string;

begin
  b := DMAssociado.cdsLocAnexos.CreateBlobStream( DMAssociado.cdsLocAnexosIMAGEM, bmRead);
  arq:=    ExtractFilePath(Application.ExeName)+'anexos\' + inttostr(ExtractDay(dataatual))+inttostr(ExtractMonth(dataatual))+DMAssociado.cdsLocAnexosNOMEARQUIVO.value ;

  f := TFileStream.create (arq, fmcreate);
  f.CopyFrom(b,0);

  b.free;
  f.free;

  ShellExecute(handle,'open',PChar(arq), '','',SW_SHOWNORMAL);

end;

procedure TfrmNovoAssoc.sdAnexoAddClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovoAnexo,frmNovoAnexo);
  DMAssociado.cdsAnexo.Close;
  DMAssociado.cdsAnexo.Params[0].clear;
  DMAssociado.cdsAnexo.Open;
  DMAssociado.cdsAnexo.Append;
  DMAssociado.cdsAnexo.Edit;
  DMAssociado.cdsAnexoDATA_INCLUSAO.value := DataAtual;
  If frmNovoAnexo.ShowModal = mrok then
  begin
      DMAssociado.PROC_FOTO_UI.close;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value;
      DMAssociado.PROC_FOTO_UI.Params[1].Assign(DMAssociado.cdsAnexoIMAGEM);
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('DATA_INCLUSAO').value :=  DMAssociado.cdsAnexoDATA_INCLUSAO.value;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value := DMAssociado.cdsAnexoIMG_ID.value;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('TIPO').value:=2;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('DESCRICAO').value:=DMAssociado.cdsAnexoDESCRICAO.value;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('NOMEARQUIVO').value:=DMAssociado.cdsAnexoNOMEARQUIVO.value;
      DMAssociado.PROC_FOTO_UI.ExecProc;
      DMConexao.Log('Inclusão de Anexo pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' - Anexo:'+ DMAssociado.cdsAnexoNOMEARQUIVO.value +'('+datetostr(DMAssociado.cdsAnexoDATA_INCLUSAO.value)+')' , 'I', DMAssociado.cdsAssocASS_ID.value);
      DMAssociado.cdsLocAnexos.close;
      DMAssociado.cdsLocAnexos.Open;
  end;
  finally
  frmNovoAnexo.free;
  end;
end;

procedure TfrmNovoAssoc.spAnexosEditarClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocAnexos.RecordCount > 0 then
  begin
      Try Application.CreateForm(TfrmNovoAnexo,frmNovoAnexo);
      DMAssociado.cdsAnexo.Close;
      DMAssociado.cdsAnexo.Params[0].value := DMAssociado.cdsLocAnexosIMG_ID.value;
      DMAssociado.cdsAnexo.Open;
      DMAssociado.cdsAnexo.Edit;
      frmNovoAnexo.Caption :='::: Edição de Anexo :::';
      If frmNovoAnexo.ShowModal = mrok then
      begin
          DMAssociado.PROC_FOTO_UI.close;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value;
          DMAssociado.PROC_FOTO_UI.Params[1].Assign(DMAssociado.cdsAnexoIMAGEM);
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('DATA_INCLUSAO').value :=  DMAssociado.cdsAnexoDATA_INCLUSAO.value;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value := DMAssociado.cdsAnexoIMG_ID.value;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('TIPO').value:=2;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('DESCRICAO').value:=DMAssociado.cdsAnexoDESCRICAO.value;
          DMAssociado.PROC_FOTO_UI.Params.ParamByName('NOMEARQUIVO').value:=DMAssociado.cdsAnexoNOMEARQUIVO.value;
          DMAssociado.PROC_FOTO_UI.ExecProc;
          DMAssociado.cdsLocAnexos.close;
          DMAssociado.cdsLocAnexos.Open;
          DMConexao.Log('Alteração do Anexo do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Anexo: '+inttostr(DMAssociado.cdsAnexoIMG_ID.value)+' - '+ DMAssociado.cdsLocAnexosNOMEARQUIVO.value +' - ' + DMAssociado.cdsLocAnexosDESCRICAO.value  + '.', 'A', DMAssociado.cdsAssocASS_ID.value);
      end;
      finally
      frmNovoAnexo.free;
      end;
  end;
end;

procedure TfrmNovoAssoc.spAnexosDelClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocAnexos.RecordCount > 0 then
  begin
     If Confirma('Confirma exclusão do anexo selecionado? ') then
     begin
       DMAssociado.PROC_IMG_DEL.close;
       DMAssociado.PROC_IMG_DEL.ParamByName('img_id').value:= DMAssociado.cdsLocAnexosIMG_ID.value;
       DMAssociado.PROC_IMG_DEL.Execproc;
       DMConexao.Log('Exclusão do Anexo do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Anexo: '+inttostr(DMAssociado.cdsAnexoIMG_ID.value)+'-'+DMAssociado.cdsLocAnexosNOMEARQUIVO.value+' - '+DMAssociado.cdsLocAnexosDESCRICAO.value, 'E', DMAssociado.cdsAssocASS_ID.value);
       DMAssociado.cdsLocAnexos.Close;
       DMAssociado.cdsLocAnexos.Open;
     End;
  end;
end;

procedure TfrmNovoAssoc.spMovimentoAddClick(Sender: TObject);
begin
  inherited;
  Try Application.CreateForm(TfrmNovaMovimentacao,frmNovaMovimentacao);
  DMAssociado.cdsMoviment.Close;
  DMAssociado.cdsMoviment.Params.ParamByName('mov_id').Clear;
  DMAssociado.cdsMoviment.Open;
  DMAssociado.cdsMoviment.Append;
  DMAssociado.cdsMoviment.Edit;
  DMAssociado.cdsMovimentASS_ID.value:= DMAssociado.cdsAssocASS_ID.value;
  DMAssociado.cdsMovimentDT_MOV.value := DataAtual;
  DMAssociado.cdsMovimentHORA.value := copy(Timetostr(now),1,5);
  if frmNovaMovimentacao.ShowModal = mrok then
  begin
       DMAssociado.PROC_MOVIMENTO_UI.close;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('mov_id').value :=0 ;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('tp_mov_id').value := DMAssociado.cdsMovimentTP_MOV_ID.value;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('ASS_ID').value :=DMAssociado.cdsMovimentASS_ID.value ;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DT_MOV').value :=DMAssociado.cdsMovimentDT_MOV.value ;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('OBS_MOV').value := DMAssociado.cdsMovimentOBS_MOV.value;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('USERID').value := UserId;
       DMAssociado.PROC_MOVIMENTO_UI.ParamByName('HORA').value := DMAssociado.cdsMovimentHORA.value;
       if DMAssociado.cdsMovimentTP_MOV_ID.value <> 3 then
          DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').clear
       else
       if DMAssociado.cdsMovimentDATAPEDIDO.value = 0 then
         DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').clear
       else
       begin
         DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').value := DMAssociado.cdsMovimentDATAPEDIDO.value;

         try
             Dmassociado.Proc_Cancel_Anuid.close;
             Dmassociado.Proc_Cancel_Anuid.Params.ParamByName('ass_id').value :=DMAssociado.cdsMovimentASS_ID.value;
             Dmassociado.Proc_Cancel_Anuid.Params.ParamByName('datapedido').value :=DMAssociado.cdsMovimentDATAPEDIDO.value;
             Dmassociado.Proc_Cancel_Anuid.ExecProc;
             DmFinancas.cdsDebitosAnuidades.close;
             DmFinancas.cdsDebitosAnuidades.open;

         except
             Aviso('Erro ao excluir as contribuições posteriores à data do pedido. ');
         end;

       end;
       DMAssociado.PROC_MOVIMENTO_UI.ExecProc;
       DMAssociado.cdsLocMoviment.close;
       DMAssociado.cdsLocMoviment.Open;
       DMConexao.Log('Inclusão de Movimento pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'- Movimento:'+ DMAssociado.cdsLocMovimentTP_MOV_DESCRICAO.value +'('+Dmassociado.cdsLocMovimentOBS_MOV.value+')' , 'I', DMAssociado.cdsAssocASS_ID.value);
  end
  else
    DMAssociado.cdsMoviment.Cancel;
  finally
  frmNovaMovimentacao.free;
  end;

end;

procedure TfrmNovoAssoc.spMovimentoEditClick(Sender: TObject);
begin
  inherited;
  If (DMAssociado.dsLocMoviment.DataSet.FieldByName('userid').value = userid)or (userid in [13,25,19,30]) then
  begin
        Try Application.CreateForm(TfrmNovaMovimentacao,frmNovaMovimentacao);
        frmNovaMovimentacao.Caption :='::: Editar Movimentação';
        DMAssociado.cdsMoviment.Close;
        DMAssociado.cdsMoviment.Params.ParamByName('mov_id').value := DMAssociado.cdsLocMovimentMOV_ID.value;
        DMAssociado.cdsMoviment.Open;
        DMAssociado.cdsMoviment.Edit;
        If DMAssociado.cdsLocMovimentTP_MOV_ID.value = 3 then
        begin           
          frmNovaMovimentacao.labPedido.Visible :=True;
          frmNovaMovimentacao.dbedtDTPedido.Visible :=True;
        end;
        if frmNovaMovimentacao.ShowModal = mrok then
        begin
             DMAssociado.PROC_MOVIMENTO_UI.close;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('mov_id').value :=DMAssociado.cdsMovimentMOV_ID.value ;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('tp_mov_id').value := DMAssociado.cdsMovimentTP_MOV_ID.value;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('ASS_ID').value :=DMAssociado.cdsMovimentASS_ID.value ;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DT_MOV').value :=DMAssociado.cdsMovimentDT_MOV.value ;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('OBS_MOV').value := DMAssociado.cdsMovimentOBS_MOV.value;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('USERID').value := UserId;
             DMAssociado.PROC_MOVIMENTO_UI.ParamByName('HORA').value := DMAssociado.cdsMovimentHORA.value;
             if DMAssociado.cdsMovimentTP_MOV_ID.value <> 3 then
                DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').clear
             else
             if DMAssociado.cdsMovimentDATAPEDIDO.value = 0 then
               DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').clear
             else
             begin
               DMAssociado.PROC_MOVIMENTO_UI.ParamByName('DATAPEDIDO').value := DMAssociado.cdsMovimentDATAPEDIDO.value;

               try
                   Dmassociado.Proc_Cancel_Anuid.close;
                   Dmassociado.Proc_Cancel_Anuid.Params.ParamByName('ass_id').value :=DMAssociado.cdsMovimentASS_ID.value;
                   Dmassociado.Proc_Cancel_Anuid.Params.ParamByName('datapedido').value :=DMAssociado.cdsMovimentDATAPEDIDO.value;
                   Dmassociado.Proc_Cancel_Anuid.ExecProc;
                   DmFinancas.cdsDebitosAnuidades.close;
                   DmFinancas.cdsDebitosAnuidades.open;

               except
                   Aviso('Erro ao excluir as contribuições posteriores à data do pedido. ');
               end;

             end;
             DMAssociado.PROC_MOVIMENTO_UI.ExecProc;
             DMAssociado.cdsLocMoviment.close;
             DMAssociado.cdsLocMoviment.Open;
             DMConexao.Log('Alteração de Movimento do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Movimento: '+Dmassociado.cdsLocMovimentTP_MOV_DESCRICAO.value+' ('+ Dmassociado.cdsLocMovimentOBS_MOV.value  + ').', 'A', DMAssociado.cdsAssocASS_ID.value);
        end
        else
          DMAssociado.cdsMoviment.Cancel;
        finally
        frmNovaMovimentacao.free;
        end;
  end
  else
    Aviso('Somente o usuário que incluiu ou o usuário Master tem autorização'+#13+'para editar uma movimentação. ' );

end;

procedure TfrmNovoAssoc.spMovimentoDelClick(Sender: TObject);
begin
  inherited;
  If (DMAssociado.dsLocMoviment.DataSet.FieldByName('userid').value = userid)or (userid in [13,25]) then
  begin

     If DMAssociado.cdsLocMoviment.RecordCount > 0 then
      begin
         If Confirma('Confirma exclusão da movimentação selecionada? ') then
         begin
           DMAssociado.PROC_MOVIMENTO_DEL.close;
           DMAssociado.PROC_MOVIMENTO_DEL.ParamByName('mov_id').value:= DMAssociado.cdsLocMovimentMOV_ID.value;
           DMAssociado.PROC_MOVIMENTO_DEL.Execproc;
           DMConexao.Log('Exclusão do movimentação do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ ' / Movimento: '+Dmassociado.cdsLocMovimentTP_MOV_DESCRICAO.value+' ('+ Dmassociado.cdsLocMovimentOBS_MOV.value  + ').', 'E', DMAssociado.cdsAssocASS_ID.value);
           DMAssociado.cdsLocMoviment.Close;
           DMAssociado.cdsLocMoviment.Open;
         End;
      end;
     end
     else
        Aviso('Somente o usuário que incluiu ou o usuário Master tem autorização'+#13+'para excluir uma movimentação. ' );
end;

procedure TfrmNovoAssoc.spMovimentoPrintClick(Sender: TObject);
begin
  inherited;
  If DMAssociado.cdsLocMoviment.RecordCount > 0 then
  begin
      Try Application.createform(TQR_Movimentacao,QR_Movimentacao);
      QR_Movimentacao.labRegistro.caption:=copy(edRegistro.Text,1,7)+'/'+copy(edRegistro.Text,8,4);
      QR_Movimentacao.labnome.caption:=ednome.Text;
      QR_Movimentacao.preview;
      finally
      QR_Movimentacao.free;
      end;
  end;

end;

procedure TfrmNovoAssoc.DBGrid9DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.spPrevisaoClick(Sender: TObject);
begin
  inherited;
  Try Application.Createform(TfrmGerarPrevisao,frmGerarPrevisao);
  If frmGerarPrevisao.showmodal = mrok then
  begin
      If frmGerarPrevisao.radRegerar.Checked=true then
      begin
          Dmfinancas.PROC_ANUIDADE_DEL.close;
          Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ass_id').value:=DMAssociado.cdsAssocASS_ID.value ;
          Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('dataatual').value:= DataAtual;
          Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('TP_CONTRIB').value:= frmGerarPrevisao.cbTipo.ItemIndex;
          if frmGerarPrevisao.cbOpcao.ItemIndex = 0 then
             Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ano').value:= 0
          else
             Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ano').value:= strtoint( frmGerarPrevisao.edano.Text);
          Dmfinancas.PROC_ANUIDADE_DEL.ExecProc;
          DMConexao.Log('Regeração de Previsão pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'- Ano:'+inttostr(Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ano').value), 'O', DMAssociado.cdsAssocASS_ID.value);
      end;

      DmFinancas.PROC_GERA_ANUIDADE.close;
      if frmGerarPrevisao.cbOpcao.ItemIndex = 0 then
         DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ANO').value := 0
      else
         DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ANO').value :=strtoint( frmGerarPrevisao.edano.Text);
      DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value ;
      DmFinancas.PROC_GERA_ANUIDADE.ParamByName('DATAATUAL').value := DataAtual;
      DmFinancas.PROC_GERA_ANUIDADE.ParamByName('TIPOCONTRIB').value := frmGerarPrevisao.cbTipo.ItemIndex;
      DmFinancas.PROC_GERA_ANUIDADE.ExecProc;

      DMConexao.Log('Geração de Previsão pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'- Ano:'+inttostr(DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ANO').value ), 'O', DMAssociado.cdsAssocASS_ID.value);

      DmFinancas.PROC_ACERTAIBLGERAL.close;
      DmFinancas.PROC_ACERTAIBLGERAL.ParamS.ParamByName('ass_id').value:= DMAssociado.cdsAssocASS_ID.value;
      DmFinancas.PROC_ACERTAIBLGERAL.ExecProc;


      DmFinancas.cdsDebitosAnuidades.close;
      DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
      DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
      DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
      DmFinancas.cdsDebitosAnuidades.Open;

  end;
  finally
  frmGerarPrevisao.free;
  end;
end;

procedure TfrmNovoAssoc.spBoletoClick(Sender: TObject);
var
  bol_id, i:integer;
  Venc, vencimentoCon:tDatetime;
  Valor_Boleto, ValorGuiaComplem,valorpagoguiacomp,ValorGuiaepoca:real;
  NossoNumero, tipo, Imp, emailenvio:String;
  cont:integer;
  boletoEmail, visualizar, imprimir:integer;
  caminho, novoarquivo, pasta:string;
  FBoleto_SIGCB : TBoleto_A4SIGCB;
  anuidades:string;


begin
  inherited;

  if DMConexao.sdsConfigCOBRREGISTRADA.Value = 1 then
  begin
        if (DMAssociado.cdsAssocCPFCNPJ.Value ='') then
        begin
           Aviso('Campo CPF/CNPJ é obrigatório para geração de boleto de Cobrança Registrada. ');
           Exit;
        end
        else
        if ValidaCPFCNPJ(DMAssociado.cdsAssocCPFCNPJ.Value) = false then
        begin
           Aviso('Dígito verificador do campo CPF/CNPJ é inválido. ');
           Exit;
        end ;

        if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Sim','Não']),[] ) then
        begin
           Aviso('Não é possível gerar Boleto de Cobrança Registrada sem endereço de correspondência cadastrado. ');
           Exit;        
        end;
  end;

  boletoEmail :=0;
  imprimir :=0;
  visualizar:=0;

  If (DmFinancas.dsDebitosAnuidades.DataSet.RecordCount = 0) and (DmFinancas.cdsDebitosParcelamento.RecordCount =1) then
  begin
     Aviso('Não têm anuidades em aberto para este filiado. ');
     abort;
  end;

  try Application.createform(TfrmBoletoOpcoes,frmBoletoOpcoes);
  frmBoletoOpcoes.Width := 290;
  frmBoletoOpcoes.Height := 198;
  frmBoletoOpcoes.panelOpcoes.Visible := true;
  if frmBoletoOpcoes.showmodal=mrok then
  begin
      If frmBoletoOpcoes.radSind.checked = true then
         tipo := 'Sindical'
      else
      If frmBoletoOpcoes.radConf.checked = true then
         tipo := 'Confederativa';

      If frmBoletoOpcoes.cbVisualizar.Checked = true then
          visualizar:=1;

      If frmBoletoOpcoes.cbImprimir.Checked = true then
          imprimir:=1;

      emailenvio:='';
      If frmBoletoOpcoes.cbEmail.Checked = true then
      begin
          sdsEmail.close;
          sdsEmail.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          sdsEmail.open;
          If sdsEmail.RecordCount = 0 then
          begin
             Aviso('Não existe e-mail válido cadastrado para este filiado. ');
             boletoEmail:=0;
             Exit;
          end
          else
          begin
            sdsEmail.first;
            while not sdsEmail.eof do
            begin
                If emailenvio = '' then
                   emailenvio := sdsEmailCONTATO_DESCR.value
                else
                   emailenvio := emailenvio + ';'+sdsEmailCONTATO_DESCR.value;
                sdsEmail.Next;
            end;

            boletoEmail:=1;

            caminho := ExtractFilePath(Application.ExeName) +'email';

            DMAssociado.sdsNovoGenEmail.open;
            pasta := DMAssociado.sdsNovoGenEmailNOVO.value ;
            DMAssociado.sdsNovoGenEmail.close;

            try
              CreateDir(caminho+'\'+pasta);
            except
              Aviso('Usuário sem permissão de acesso ao disco. ');
              exit;
            end;

            DMAssociado.sdsNovoGenArquivo.open;

            novoarquivo :=  inttostr(ExtractYear(DataAtual))+'_'+DMAssociado.sdsNovoGenArquivoNOVO.value;
            DMAssociado.sdsNovoGenArquivo.close;


          end;

      end

  end
  else
      abort;
  finally
  frmBoletoOpcoes.free;
  end;

  try Application.CreateForm(TfrmBoleto,frmBoleto);
  frmBoleto.cbGuiaComplementar.Checked:=false;
  if tipo = 'Sindical' then
     frmBoleto.cbGuiaComplementar.Visible:=true
  else
     frmBoleto.cbGuiaComplementar.Visible:=false;

  DmFinancas.cdsGerarBoletos.close;
  DmFinancas.cdsGerarBoletos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
  DmFinancas.cdsGerarBoletos.Params.ParamByName('tipo').value := 'T';
  DmFinancas.cdsGerarBoletos.Params.ParamByName('dataatual').value := DataAtual;
  DmFinancas.cdsGerarBoletos.Params.ParamByName('tipocontrib').value := tipo;
  DmFinancas.cdsGerarBoletos.Open;

  frmBoleto.cdsAnuidades.CreateDataSet;
  If DmFinancas.cdsGerarBoletos.RecordCount > 0 then
  begin
     DmFinancas.cdsGerarBoletos.first;
     While not DmFinancas.cdsGerarBoletos.eof do
     begin
         frmBoleto.cdsAnuidades.Append;
         frmBoleto.cdsAnuidades.Edit;
         frmBoleto.cdsAnuidadesAno.value := DmFinancas.cdsGerarBoletos.fieldbyname('ANO').value;
         frmBoleto.cdsAnuidadesAnuid_Id.value := DmFinancas.cdsGerarBoletos.fieldbyname('ANUID_ID').value;
         frmBoleto.cdsAnuidadesCorrecao.asfloat := DmFinancas.cdsGerarBoletos.fieldbyname('CORRECAO').value;
         frmBoleto.cdsAnuidadesDescricao.value := DmFinancas.cdsGerarBoletos.fieldbyname('DESCRICAO').value;
         frmBoleto.cdsAnuidadesJuros.asfloat := DmFinancas.cdsGerarBoletos.fieldbyname('JUROS').value;
         frmBoleto.cdsAnuidadesMulta.asfloat := DmFinancas.cdsGerarBoletos.fieldbyname('MULTA').value;
         frmBoleto.cdsAnuidadesNum_Parcela.value := DmFinancas.cdsGerarBoletos.fieldbyname('NUM_PARCELA').value;
         frmBoleto.cdsAnuidadesParc_Id.value := DmFinancas.cdsGerarBoletos.fieldbyname('PARC_ID').value;
         frmBoleto.cdsAnuidadesTipoContrib.value := DmFinancas.cdsGerarBoletos.fieldbyname('TIPOCONTRIB').value;
         frmBoleto.cdsAnuidadestotal.asfloat := DmFinancas.cdsGerarBoletos.fieldbyname('TOTAL').value;
         frmBoleto.cdsAnuidadesTpContrib_id.value := DmFinancas.cdsGerarBoletos.fieldbyname('TPCONTRIB_ID').value;
         frmBoleto.cdsAnuidadesValor.asfloat := DmFinancas.cdsGerarBoletos.fieldbyname('VALOR').value;
         frmBoleto.cdsAnuidadesVencimento.value := DmFinancas.cdsGerarBoletos.fieldbyname('VENCIMENTO').value;
         frmBoleto.cdsAnuidades.Post;
         DmFinancas.cdsGerarBoletos.Next;
     end;
     frmBoleto.cdsAnuidades.First;
  end;

  if frmBoleto.showmodal = mrok then
  begin
        If Tipo='Confederativa' then
        begin
           DmBoleto.cdsDadosAssoc.close;
           DmBoleto.cdsDadosAssoc.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
           DmBoleto.cdsDadosAssoc.Params.ParamByName('corresp').value := 1;
           DmBoleto.cdsDadosAssoc.Open;
           If DmBoleto.cdsDadosAssoc.RecordCount = 0 then
              If not (Confirma('Filiado sem endereço de correspondência cadastrado.' +#13+'Deseja continuar assim mesmo? ' )) then
                 abort;

           cont :=0;
           frmBoleto.cdsAnuidades.DisableControls;
           frmBoleto.cdsAnuidades.First;
           anuidades :='';
           while not frmBoleto.cdsAnuidades.eof do
           begin
                if frmBoleto.cdsAnuidadesSelecionado.value = true then
                begin
                   cont := cont + 1;
                   vencimentoCon := frmBoleto.cdsAnuidadesVencimento.value;
                   If anuidades ='' then
                      anuidades := inttostr(frmBoleto.cdsAnuidadesAno.value)
                   else
                      anuidades := anuidades+', '+ inttostr(frmBoleto.cdsAnuidadesAno.value);
                end;
                frmBoleto.cdsAnuidades.Next;
           end;
           frmBoleto.cdsAnuidades.First;
           frmBoleto.cdsAnuidades.EnableControls;


           If (cont = 1) and (vencimentoCon >= DataAtual) then
              venc := vencimentoCon
           else
           begin

               //Definindo o Vencimento
               Try Application.CreateForm(TfrmBoletoVencimento,frmBoletoVencimento);
               frmBoletoVencimento.edDataVencto.text := Datetostr(DataAtual);
               if frmBoletoVencimento.showmodal = mrok then
                    Venc := strtodate(frmBoletoVencimento.edDataVencto.text)
               else
                   abort;
               finally
               frmBoletoVencimento.free;
               end;
           end;
           //Dados da Conta e Cedente
           DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 2);
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  DmBoleto.cdsContaBAN_CODIGO.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
           DmBoleto.gbTitulo1.SeuNumero := '';
           DmBoleto.gbTitulo1.DataDocumento := Dataatual;
           DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

           DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
           DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

           DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
           DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
           DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
           DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
           DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
           DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
           //Fim dados do Cedente

           Valor_Boleto := 0;
           Dmboleto.gbTitulo1.Instrucoes.Clear;

           // Adicionando as instruções do boleto, Valor total e vencimento
           frmBoleto.cdsAnuidades.DisableControls;
           frmBoleto.cdsAnuidades.First;
           while not frmBoleto.cdsAnuidades.eof do
           begin
                if frmBoleto.cdsAnuidadesSelecionado.value = true then
                begin
                    Valor_Boleto := Valor_Boleto + frmBoleto.cdsAnuidadestotal.asfloat;
                    Dmboleto.gbTitulo1.Instrucoes.Add(frmBoleto.cdsAnuidadesDescricao.Value +'('+frmBoleto.cdsAnuidadesTipoContrib.value+'): ' + formatfloat(',0.00 ', frmBoleto.cdsAnuidadestotal.asfloat));

                    //Cancelando boleto ou tirando o vinculo com Boleto_itens
                    DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= frmBoleto.cdsAnuidadesAnuid_Id.value;
                    DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value:=  frmBoleto.cdsAnuidadesParc_Id.value;
                    DmBoleto.PROC_BOLETO_STATUS.ExecProc;

                end;

                frmBoleto.cdsAnuidades.Next;
           end;
           frmBoleto.cdsAnuidades.First;
           frmBoleto.cdsAnuidades.EnableControls;

           DmBoleto.gbTitulo1.ValorDocumento := Valor_Boleto;
           DmBoleto.gbTitulo1.DataVencimento := venc;

           DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

           if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
           begin

               DmBoleto.sdsNossoNumero.close;
               DmBoleto.sdsNossoNumero.Open;

               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                   NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14)
               else
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   NossoNumero := '24' + '8'+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);

               DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
               DmBoleto.gbTitulo1.Carteira := 'SR';
           end
           else
           if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
           begin
               DmBoleto.sdsNossoNumeroCR.close;
               DmBoleto.sdsNossoNumeroCR.Open;

               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                   NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'2'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
               else
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   NossoNumero := '14' + '32'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

               DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
               DmBoleto.gbTitulo1.Carteira := 'RG';
           end;

           //Dados do Sacado
           DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);
           DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
           DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
           DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
           DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

           if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
              DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
           else
              DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;


           //Criando o Boleto
           try
               bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
               DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
               DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := DMAssociado.cdsAssocASS_ID.value;
               DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := DmBoleto.gbTitulo1.DataVencimento;
               DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
               DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := DmBoleto.gbTitulo1.ValorDocumento;
               DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.gbTitulo1.NossoNumero;
               DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
               DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;

               DmBoleto.PROC_BOLETO_I.ExecProc;
           except
               Erro('Erro gerando o boleto nº ' + DmBoleto.gbTitulo1.NossoNumero);
               abort;
           end;

           //Criando os itens
           frmBoleto.cdsAnuidades.DisableControls;
           frmBoleto.cdsAnuidades.First;
           while not frmBoleto.cdsAnuidades.eof do
           begin
                if frmBoleto.cdsAnuidadesSelecionado.value = true then
                begin
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmBoleto.cdsAnuidadesValor.AsFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := frmBoleto.cdsAnuidadesMulta.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := frmBoleto.cdsAnuidadesJuros.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := frmBoleto.cdsAnuidadesCorrecao.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                    DMConexao.Log('Geração de Boleto Confederativa pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / ' +frmBoleto.cdsAnuidadesDescricao.value +' - Nosso Número:'+Dmboleto.gbTitulo1.NossoNumero , 'O', DMAssociado.cdsAssocASS_ID.value);
                end;

                frmBoleto.cdsAnuidades.Next;
           end;

           for i := 0 to Dmboleto.gbTitulo1.Instrucoes.Count - 1 do
              DMConexao.ExecSQL( 'insert into boletoinstrucoes (bol_id, mensagem, ordem ) values (' + IntToStr(bol_id)+','+ QuotedStr(Dmboleto.gbTitulo1.Instrucoes[i])+' ,' + IntToStr(i+1)+');');


           If visualizar = 1 then
              Dmboleto.gbTitulo1.Visualiazar_SIGCB;

           if imprimir = 1 then
           begin
               If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                   Dmboleto.gbTitulo1.Imprimir_SIGCB
               else
               begin
                  Dmboleto.gbTitulo1.Imprimir_SIGCB_e_PDF('Conf_'+anuidades+ '_'+Dmboleto.gbTitulo1.NossoNumero);
                  DMAssociado.dsDocsAnexos.dataset.close;
                  DMAssociado.dsDocsAnexos.dataset.open;
               end;
           end;


           frmBoleto.cdsAnuidades.First;
           frmBoleto.cdsAnuidades.EnableControls;


           DMAssociado.PROC_OBS_UI.close;
           DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
           DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Impressão de Guia(s) Confederativa(S) ' + anuidades+ ' gerada(s). ';
           DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
           DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
           DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(Now),1,5);
           DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
           DMAssociado.PROC_OBS_UI.ExecProc;
           DMAssociado.cdsObs.Refresh;


           if boletoEmail = 1 then
           begin

                ExibeAguarde('Preparando e-mail. Por favor aguarde...');

                try
                    if  Dmboleto.gbTitulo1.GerarPDF_SIGCB(caminho+'\'+pasta,'Confederativa '+anuidades+ '.pdf') = 0 then
                    begin
                        Aviso('Erro ao gerar arquivo PDF a ser enviado. ');
                        Exit;
                    end;
                except
                    Aviso('Erro ao gerar PDF. ');
                    exit;
                end;

                Sleep(3000);

                EscondeAguarde;

                try Application.createform(TfrmExtratoEnviarEmail,frmExtratoEnviarEmail);
                frmExtratoEnviarEmail.edPARA.text := emailenvio;
                frmExtratoEnviarEmail.edPARA.enabled := false;
                frmExtratoEnviarEmail.edPARA.ReadOnly:=true;
                frmExtratoEnviarEmail.labmsg.caption :='';
                frmExtratoEnviarEmail.edAssunto.text := 'Envio de Guia Confederativa';
                frmExtratoEnviarEmail.Memomsg.Lines.clear;
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Aos cuidados de: '+ Dmassociado.cdsAssocNOME.value + ' (Cadastro Nº ' + copy(DMAssociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(DMAssociado.cdsAssocREGISTRO.value,8,4)+').');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Prezados Senhores(as),');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Em atenção à sua solicitação encaminhamos, anexas, Guias de Contribuição Confederativa que poderão ser pagas em qualquer banco ou casa lotérica. ');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Com o intuito de agilizar a baixa, pedimos que após o pagamento traga ou envie por e-mail cópia dos comprovantes para sindicato@sircomrj.com.br.');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Atenciosamente,');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Sindicato dos Representantes Comerciais do Rio de Janeiro');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Site: www.sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('E-mail: sindicato@sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Endereço: Av. Graça Aranha 416 Sl. 425, Castelo, Rio de Janeiro, CEP 24.020-320');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Tel: (21) 2524-2859 (21) 2210-1838');

                If frmExtratoEnviarEmail.showmodal = mrok then
                begin
                     try
                     ExibeAguarde('Enviando e-mail. Por favor aguarde...');
                     if EnviarEmail(frmExtratoEnviarEmail.edPARA.text,frmExtratoEnviarEmail.edAssunto.text,RICH_HTML(frmExtratoEnviarEmail.Memomsg),ArquivosDIr(caminho+'\'+pasta,1)) = 1 then
                     begin
                         EscondeAguarde;

                         DMAssociado.PROC_OBS_UI.close;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Envio de E-mail: Confederativa '+ anuidades +'.';
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr( time()),1,5);
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                         DMAssociado.PROC_OBS_UI.ExecProc;
                         DMAssociado.cdsObs.Refresh;

                         Aviso('E-mail enviado com sucesso.');
                     end
                     else
                     begin
                       Aviso('Erro ao enviar e-mail.  '+chr(13)+ 'Verifique se o e-mail está correto e sem seu computador está conectado a internet. ' );
                        EscondeAguarde;
                     end;
                     except
                        EscondeAguarde;
                         Aviso('Erro ao enviar e-mail. ');
                         exit;
                     end;
                end;

                finally
                   frmExtratoEnviarEmail.Free;

                end;

           end;


        end //Fim Confederativa

        else

        If Tipo = 'Sindical' then
        begin
           //DmBoleto.Guias1.Tipo_Entidade := teSindicato;

           ExibeAguarde('Gerando guias. Por favor aguarde...');

           //Dados da Conta e Cedente
           DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 1);
           DmBoleto.Guias1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.value;
           //Alterado COBREG
           //DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaCT_CODCEDENTE.value+Dmboleto.cdsContaCT_CODCEDENTE_DV.value;
           DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaSICASCOMPLETO.value;
           If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
           begin
              DmBoleto.Guias1.Cedente.SICAS_Simples := '00111';
              DmBoleto.Guias1.Tipo_Entidade := teFederacao;
           end
           else
           begin
              //Alterado COBREG
              //DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
              DmBoleto.Guias1.Cedente.SICAS_Simples := Dmboleto.cdsContaCODSINDICAL.value;
              DmBoleto.Guias1.Tipo_Entidade := teSindicato;
           end;
           DmBoleto.Guias1.Cedente.Agencia := Dmboleto.cdsContaCT_AGENCIA.Value;
           DmBoleto.Guias1.Cedente.CNPJ := Dmboleto.cdsContaCNPJ.Value;
           DmBoleto.Guias1.Cedente.Endereco.Rua := Dmboleto.cdsContaENDER_LOGRADOURO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Bairro := Dmboleto.cdsContaENDER_BAIRRO.Value;
           DmBoleto.Guias1.Cedente.Endereco.CEP := Dmboleto.cdsContaENDER_CEP.Value;
           DmBoleto.Guias1.Cedente.Endereco.Cidade := Dmboleto.cdsContaCIDADE_NOME.Value;
           DmBoleto.Guias1.Cedente.Endereco.Numero := Dmboleto.cdsContaENDER_NUMERO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Complemento := Dmboleto.cdsContaENDER_COMPLEMENTO.Value;
           DmBoleto.Guias1.Cedente.Endereco.Estado := Dmboleto.cdsContaESTADO_SIGLA.Value;
           DmBoleto.Guias1.Cedente.CNAE := '461';

           //Dados do Sacado
           DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);

           DmBoleto.Guias1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
           DmBoleto.Guias1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
           DmBoleto.Guias1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
           DmBoleto.Guias1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
           DmBoleto.Guias1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
           DmBoleto.Guias1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
           DmBoleto.Guias1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
           DmBoleto.Guias1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;

           DmBoleto.cdsOutrosSind.close;
           DmBoleto.cdsOutrosSind.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
           DmBoleto.cdsOutrosSind.Open;

           frmBoleto.cdsAnuidades.DisableControls;
           frmBoleto.cdsAnuidades.First;
           anuidades:='';
           while not frmBoleto.cdsAnuidades.eof do
           begin
                if frmBoleto.cdsAnuidadesSelecionado.value = true then
                begin

                     ValorGuiaComplem := 0;
                   If anuidades ='' then
                      anuidades := inttostr(frmBoleto.cdsAnuidadesAno.value)
                   else
                      anuidades := anuidades+', '+ inttostr(frmBoleto.cdsAnuidadesAno.value);


                   If frmBoleto.cbGuiaComplementar.Checked = true then
                     begin
                          Try Application.CreateForm(TfrmDadosGuiaComplementar,frmDadosGuiaComplementar);
                          //frmDadosGuiaComplementar.edValor.value:=  Frmboleto.cdsAnuidadestotal.asfloat;
                          frmDadosGuiaComplementar.edValorContrib.value := Frmboleto.cdsAnuidadesValor.asfloat;
                          frmDadosGuiaComplementar.edDtVencimento.text := datetostr(Frmboleto.cdsAnuidadesVencimento.value);

                          If frmDadosGuiaComplementar.showmodal <> mrok then
                             abort;

                          ValorGuiaepoca := FrmDadosGuiaComplementar.edValorContrib.value;
                          ValorGuiaComplem := FrmDadosGuiaComplementar.edValoraPagar.Value;
                          valorpagoguiacomp := FrmDadosGuiaComplementar.edValorAntigo.value;


                          //venc := UltimoDia(DataAtual);
                          venc :=  strtodate(frmDadosGuiaComplementar.edDtVencimento.text )

                          finally
                          frmDadosGuiaComplementar.free;
                          end;

                     end
                     else
                        venc := frmBoleto.cdsAnuidadesVencimento.value;

                     Dmboleto.Guias1.Vencimento := Venc;
                     Dmboleto.Guias1.Exercicio := inttostr(Frmboleto.cdsAnuidadesAno.value);
                     Dmboleto.Guias1.Numero_Documento := strtoint(copy(DMAssociado.cdsAssocREGISTRO.value,1,7));

                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                        DmBoleto.Guias1.Sacado.Contribuinte := Copy(DMAssociado.cdsAssocREGISTRO.Value,2, 20) + Copy(DmBoleto.Guias1.Exercicio , 3,2)
                     else
                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
                     begin
                         DmBoleto.sdsNossoNumeroCR.close;
                         DmBoleto.sdsNossoNumeroCR.Open;

                         If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                             NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'1'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
                            // NossoNumero := '1400' + copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
                         else
                         If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                             NossoNumero := '14' + '31'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

                         DmBoleto.Guias1.Sacado.Contribuinte := NossoNumero;
                     end;
                     DmBoleto.Guias1.Sacado.Contribuintecpfcnpj := DMAssociado.cdsAssocCPFCNPJ.Value;
                     //Instruções
                     DmBoleto.Guias1.Mensagem.Clear;
                     DmBoleto.Guias1.MensagemContrib1.Clear;

                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                     begin
                         DmBoleto.Guias1.Mensagem.Add('BLOQUETO DE CONTRIBUIÇÃO SINDICAL URBANA');
                         DmBoleto.Guias1.Mensagem.Add('');
                         DmBoleto.Guias1.Mensagem.Add('Até o vencimento, pagável nas Lotéricas, Correspondentes Caixa Aqui, Agências da CAIXA e Rede Bancária.');
                         DmBoleto.Guias1.Mensagem.Add('Documento vencido pagável somente nas Agências da CAIXA.');
                         DmBoleto.Guias1.Mensagem.Add('Guia vencida -  cobrar multa de 10% nos trinta primeiros dias, com adicional ');
                         DmBoleto.Guias1.Mensagem.Add('de 2% por mês subseqüente de atraso e juros de mora de 1% ao mês e correção monetária (Selic).');
                         //DmBoleto.Guias1.MensagemContrib1.Add('');
                     end;
                     DmBoleto.Guias1.MensagemContrib1.Add('Esta guia não quita débitos anteriores.');

                     if DmBoleto.cdsOutrosSindQTDE.value = 1 then
                        DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicato.')
                     else
                     if DmBoleto.cdsOutrosSind.RecordCount > 1 then
                        DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicatos.');

                     if (ValorGuiaComplem > 0) then //and (valorpagoguiacomp > 0) then
                     begin
                        DmBoleto.Guias1.Mensagem.Add('Guia Complementar de R$ ' + formatfloat(',0.00',ValorGuiaepoca - ValorGuiaComplem));
                        DmBoleto.Guias1.MensagemContrib1.Add('Guia Complementar de R$ ' + formatfloat(',0.00',ValorGuiaepoca - ValorGuiaComplem));
                     end;

                     DmBoleto.Guias1.Sacado.Contribuinte_Mask := '999999/9999-99;0; ';


                     DmBoleto.Guias1.Sacado.Capital_Social := 0;
                     If DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
                     begin
                       DmBoleto.Guias1.Tipo_pessoa:='J';

                       DMAssociado.cdsPegaCapSocial.close;
                       DMAssociado.cdsPegaCapSocial.params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                       DMAssociado.cdsPegaCapSocial.params.ParamByName('dataatual').value := DataAtual ;
                       If ExtractYear(Dmassociado.cdsAssocDT_REGSOCIAL.value) = ExtractYear(Frmboleto.cdsAnuidadesVencimento.value) then
                            DMAssociado.cdsPegaCapSocial.params.ParamByName('vencimento').value := Dmassociado.cdsAssocDT_REGSOCIAL.value
                      else
                            DMAssociado.cdsPegaCapSocial.params.ParamByName('vencimento').value := Dmboleto.Guias1.Vencimento;

                      DMAssociado.cdsPegaCapSocial.Open;

                       If DMAssociado.cdsPegaCapSocial.RecordCount = 0 then
                       begin
                          DMAssociado.cdsPegaCapSocial.close;
                          DMAssociado.cdsPegaCapSocial.params.ParamByName('dataatual').value := DataAtual;
                          DMAssociado.cdsPegaCapSocial.Open;
                       end;

                       If DMAssociado.cdsPegaCapSocial.RecordCount > 0 then
                             DmBoleto.Guias1.Sacado.Capital_Social := DMAssociado.cdsPegaCapSocialVALOR.AsFloat ;

                     end
                     else
                     begin
                        DmBoleto.Guias1.Tipo_pessoa:='F';
                       
                     end;


                   DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= frmBoleto.cdsAnuidadesAnuid_Id.value;
                    DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value:=  frmBoleto.cdsAnuidadesParc_Id.value;
                    DmBoleto.PROC_BOLETO_STATUS.ExecProc;
                     //Criando Boleto e Item Boleto
                     try
                          bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                          DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                          DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value :=DMAssociado.cdsAssocASS_ID.value;
                          DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                          DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                          DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := DmBoleto.Guias1.Vencimento;
                          DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
                          DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := Frmboleto.cdsAnuidadesValor.asfloat;
                          DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.Guias1.Sacado.Contribuinte;
                          DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                          DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                          DmBoleto.PROC_BOLETO_I.ExecProc;

                          If ValorGuiaComplem = 0 then
                          begin
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmBoleto.cdsAnuidadesValor.AsFloat;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                         end
                         else
                         begin
                              //Item Já pago
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmBoleto.cdsAnuidadesValor.AsFloat - ValorGuiaComplem;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;


                              //Item não pago
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value +' (Guia Complementar)';
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := ValorGuiaComplem;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                              DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                         end;

                     except
                         Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
                         abort;
                     end;


                     // Valores
                     If ValorGuiaComplem > 0 then
                        DmBoleto.Guias1.Valores.Contribuicao := ValorGuiaComplem
                     else
                        DmBoleto.Guias1.Valores.Contribuicao    := Frmboleto.cdsAnuidadesValor.asfloat;

                   DmBoleto.Guias1.Valores.Abatimento      := 0;
                   DmBoleto.Guias1.Valores.Deducao         := 0;
                   DMConexao.Log('Geração de Guia Sindical pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / ' +frmBoleto.cdsAnuidadesDescricao.value +' - Nosso Número:'+DmBoleto.Guias1.Sacado.Contribuinte , 'O', DMAssociado.cdsAssocASS_ID.value);

                   If visualizar = 1 then
                   begin
                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                         DmBoleto.Guias1.Visualizar
                     else
                         DmBoleto.Guias1.Visualizar_CR;

                   end;

                   if imprimir = 1 then
                   begin
                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                          DmBoleto.Guias1.Imprimir
                     else
                     begin
                         If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                             DmBoleto.Guias1.Imprimir_CR
                         else
                         begin
                             DmBoleto.Guias1.Imprimir_CR_e_PDF('Sind_'+DmBoleto.Guias1.Exercicio+ '_'+DmBoleto.Guias1.Sacado.Contribuinte);
                             DMAssociado.dsDocsAnexos.dataset.close;
                             DMAssociado.dsDocsAnexos.dataset.open;
                         end;
                     end;
                   end;

                   DMAssociado.PROC_OBS_UI.close;
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Impressão de Guia Sindical ' + DmBoleto.Guias1.Exercicio + ' gerada. ';
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(Now),1,5);
                   DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                   DMAssociado.PROC_OBS_UI.ExecProc;
                   DMAssociado.cdsObs.Refresh;

                   if boletoEmail = 1 then
                   begin


                       // ExibeAguarde('Preparando e-mail. Por favor aguarde...');

                        try
                            if  Dmboleto.Guias1.GerarPDF_SIGCB(caminho+'\'+pasta, 'Contribuição Sindical ' + inttostr(frmBoleto.cdsAnuidadesAno.value)+ '.pdf') = 0 then
                            begin
                                Aviso('Erro ao gerar arquivo PDF a ser enviado. ');
                                Exit;
                            end;
                        except
                            Aviso('Erro ao gerar PDF. ');
                            exit;
                        end;

                        Sleep(3000);

                      //  EscondeAguarde;
                     end;

                   end;

                frmBoleto.cdsAnuidades.Next;
           end;
           frmBoleto.cdsAnuidades.First;
           frmBoleto.cdsAnuidades.EnableControls;

           EscondeAguarde;



           If boletoEmail = 1 then
           begin
                try Application.createform(TfrmExtratoEnviarEmail,frmExtratoEnviarEmail);
                frmExtratoEnviarEmail.edPARA.text := emailenvio;
                frmExtratoEnviarEmail.edPARA.enabled := false;
                frmExtratoEnviarEmail.edPARA.ReadOnly:=true;
                frmExtratoEnviarEmail.labmsg.caption :='';
                frmExtratoEnviarEmail.edAssunto.text := 'Envio de Guia Sindical';
                frmExtratoEnviarEmail.Memomsg.Lines.clear;
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Aos cuidados de: '+ Dmassociado.cdsAssocNOME.value + ' (Cadastro Nº ' + copy(DMAssociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(DMAssociado.cdsAssocREGISTRO.value,8,4)+').');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Prezados Senhores(as),');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Em atenção à sua solicitação encaminhamos, anexas, Guias de Contribuição Sindical para quitação de débitos junto à este Sindicato.');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Informamos que as guias vencidas só poderão ser pagas na Caixa Econômica Federal mediante atualização dos valores em setor próprio da Caixa, conforme documento da CEF anexado a este e-mail.  ');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Com o intuito de agilizar a baixa, pedimos que após o pagamento traga ou envie por e-mail cópia dos comprovantes para sindicato@sircomrj.com.br.');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Atenciosamente,');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Sindicato dos Representantes Comerciais do Rio de Janeiro');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Site: www.sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('E-mail: sindicato@sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Endereço: Av. Graça Aranha 416 Sl. 425, Castelo, Rio de Janeiro, CEP 24.020-320');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Tel: (21) 2524-2859 (21) 2210-1838');

                If frmExtratoEnviarEmail.showmodal = mrok then
                begin
                     try
                     ExibeAguarde('Enviando e-mail. Por favor aguarde...');
                     if EnviarEmail(frmExtratoEnviarEmail.edPARA.text,frmExtratoEnviarEmail.edAssunto.text,RICH_HTML(frmExtratoEnviarEmail.Memomsg),ArquivosDIr(caminho+'\'+pasta,1,1)) = 1 then
                     begin
                         EscondeAguarde;

                         DMAssociado.PROC_OBS_UI.close;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Envio de E-mail: Sindical '+ anuidades +'.';
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr( time()),1,5);
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                         DMAssociado.PROC_OBS_UI.ExecProc;
                         DMAssociado.cdsObs.Refresh;

                         Aviso('E-mail enviado com sucesso.');
                     end
                     else
                     begin
                        Aviso('Erro ao enviar e-mail.  '+chr(13)+ 'Verifique se o e-mail está correto e sem seu computador está conectado a internet. ' );
                        EscondeAguarde;
                     end;
                     except
                        EscondeAguarde;
                         Aviso('Erro ao enviar e-mail. ');
                         exit;
                     end;
                end;

                finally
                   frmExtratoEnviarEmail.Free;

                end;
            end;


        end;
        AtualizaParcels;
        AtualizaParcelasParc;
  end;
  finally
  frmBoleto.free;
  end;

  spBoleto.Click;

end;

procedure TfrmNovoAssoc.spExtratoClick(Sender: TObject);
var
   validade :tdatetime;
   boletoEmail, visualizar, imprimir:integer;
   emailenvio, caminho, pasta, novoarquivo:string;
   tot, totsind, totconf, totparcel, totalpago:real;

begin
  inherited;
  boletoEmail :=0;
  visualizar :=0;
  imprimir:= 0;

  Try Application.CreateForm(TfrmExtratoOpcoes,frmExtratoOpcoes);
  frmExtratoOpcoes.edAnoIni.text :=  inttostr( ExtractYear(DataAtual) - 5);
  frmExtratoOpcoes.edAnoFim.text := inttostr( ExtractYear(DataAtual));
  If frmExtratoOpcoes.showmodal = mrok then
  begin

      If frmExtratoOpcoes.cbVisualizar.Checked = true then
          visualizar:=1;

      If frmExtratoOpcoes.cbImprimir.Checked = true then
          imprimir:=1;

      emailenvio:='';
      If frmExtratoOpcoes.cbEmail.Checked = true then
      begin
          sdsEmail.close;
          sdsEmail.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          sdsEmail.open;
          If sdsEmail.RecordCount = 0 then
          begin
             Aviso('Não existe e-mail válido cadastrado para este filiado. ');
             boletoEmail:=0;
             Exit;
          end
          else
          begin
            sdsEmail.first;
            while not sdsEmail.eof do
            begin
                If emailenvio = '' then
                   emailenvio := sdsEmailCONTATO_DESCR.value
                else
                   emailenvio := emailenvio + ';'+sdsEmailCONTATO_DESCR.value;
                sdsEmail.Next;
            end;

            boletoEmail:=1;

            caminho := ExtractFilePath(Application.ExeName) +'email';

            DMAssociado.sdsNovoGenEmail.open;
            pasta := DMAssociado.sdsNovoGenEmailNOVO.value ;
            DMAssociado.sdsNovoGenEmail.close;

            try
              CreateDir(caminho+'\'+pasta);
            except
              Aviso('Usuário sem permissão de acesso ao disco. ');
              exit;
            end;

            DMAssociado.sdsNovoGenArquivo.open;

            novoarquivo :=  inttostr(ExtractYear(DataAtual))+'_'+DMAssociado.sdsNovoGenArquivoNOVO.value;
            DMAssociado.sdsNovoGenArquivo.close;


          end;

      end;


     Try Application.createform(TQRExtrato,QRExtrato);

     Dmfinancas.cdsExtratogeral.Close;
     Dmfinancas.cdsExtratogeral.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
     Dmfinancas.cdsExtratogeral.Params.ParamByName('hoje').asdate := DataAtual;
     Dmfinancas.cdsExtratogeral.Params.ParamByName('anoini').value := strtoint(frmExtratoOpcoes.edAnoIni.text);
     Dmfinancas.cdsExtratogeral.Params.ParamByName('anofim').value := strtoint(frmExtratoOpcoes.edAnoFim.text);
     Dmfinancas.cdsExtratogeral.Params.ParamByName('tp_contrib_id').value := frmExtratoOpcoes.cbtipo.ItemIndex;
     Dmfinancas.cdsExtratogeral.open;

    { if DmFinancas.cdsExtratogeral.recordcount = 0 then
     begin
         Aviso('Não há débitos para este filiado. ');
         Exit;
     end
     else
     }
     begin
       Dmfinancas.cdsExtratogeral.first;
       tot:=0;
       totsind:=0;
       totconf:=0;
       cdsParcelsPagos.Close;
       cdsParcelsPagos.Open;
       cdsParcelsPagos.EmptyDataSet;

       while not Dmfinancas.cdsExtratogeral.eof do
       begin
           totparcel :=0;
           if (Dmfinancas.cdsExtratogeralSITUACAO.value='Em aberto') then
           begin
              tot:= tot + Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat;
              if Dmfinancas.cdsExtratogeralTIPOCONTRIB.value='Sindical' then
                 totsind := totsind +Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat
              else
                 totconf := totconf +Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat;
           end
           else
           if (Dmfinancas.cdsExtratogeralSITUACAO.value='Parcelado em Aberto') then
           begin
               sdsverParcelamento.Close;
               sdsverParcelamento.Params.ParamByName('anuid_id').value  :=Dmfinancas.cdsExtratogeralANUID_ID.value;
               sdsverParcelamento.open;
               If sdsverParcelamento.RecordCount > 0 then
               begin
                  tot:= tot + Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat;
                  if Dmfinancas.cdsExtratogeralTIPOCONTRIB.value='Sindical' then
                     totsind := totsind +Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat
                  else
                     totconf := totconf +Dmfinancas.cdsExtratogeralVALORTOTAL.asfloat;
               end;
           end;

          Dmfinancas.cdsExtratogeral.next;
       end;
       Dmfinancas.cdsExtratogeral.first;

       totparcel :=0;
       sdsParcelamentoValorTotal.Close;
       sdsParcelamentoValorTotal.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
       sdsParcelamentoValorTotal.Params.ParamByName('hoje1').value := DataAtual;
       sdsParcelamentoValorTotal.Params.ParamByName('hoje2').value := DataAtual;
       sdsParcelamentoValorTotal.Open;

       if sdsParcelamentoValorTotalTOTAL.asfloat > 0 then
         totparcel:=sdsParcelamentoValorTotalTOTAL.asfloat;
     end;


     tot := tot +totparcel;

     QRExtrato.labtotal.caption:= 'R$ ' + FormatCurr(',0.00',tot);
     QRExtrato.labtotalsind.caption:= 'R$ ' + FormatCurr(',0.00',totsind);
     QRExtrato.labtotalconf.caption:= 'R$ ' + FormatCurr(',0.00',totconf);

 {    If totparcel = 0 then
     begin
       QRExtrato.QRLabel16.Caption:='';
       QRExtrato.QRLabel24.Caption:='';
       QRExtrato.labtotalDevidoParcel.Caption:='';

       QRExtrato.QRLabel9.top := QRExtrato.QRLabel16.top;
       QRExtrato.QRLabel14.top := QRExtrato.QRLabel24.top;
       QRExtrato.labtotal.top := QRExtrato.labtotalDevidoParcel.top;

     end
     else  }
       QRExtrato.labtotalDevidoParcel.caption:='R$ ' + FormatCurr(',0.00',totparcel);

     If frmExtratoOpcoes.cbTotais.checked=true then
     begin
        QRExtrato.labValorTitulo.Caption :='';
        QRExtrato.labJurosTitulo.Caption :='';
        QRExtrato.labMultaTitulo.Caption :='';
        QRExtrato.labCorrecaoTitulo.Caption :='';
        QRExtrato.labvalor.DataField:='';
        QRExtrato.labjuros.DataField:='';
        QRExtrato.labcorrecao.DataField:='';
        QRExtrato.labMulta.DataField:='';
     end;

   //  QRExtrato.labtotal.caption:='Total: R$ ' + formatfloat(',0.00', DmFinancas.sdsTotalExtratoTOTAL.asfloat);

     QRExtrato.labtitulo.caption := QRExtrato.labtitulo.caption + ' - ' + frmExtratoOpcoes.cbtipo.Text;
     QRExtrato.Labnome.caption := DMAssociado.cdsAssocNOME.value;
     QRExtrato.Labregistro.Caption:= copy(DMAssociado.dsAssoc.DataSet.fieldbyname('registro').Value,1,7)+'/'+copy(DMAssociado.dsAssoc.DataSet.fieldbyname('registro').Value,8,4);

     DMAssociado.sdsEmpresa.close;
     DMAssociado.sdsEmpresa.ParamByName('emp_id').value := DMAssociado.cdsAssocEMP_ID.value;
     DMAssociado.sdsEmpresa.Open;

     QRExtrato.labEmpresa.caption := DMAssociado.sdsEmpresaNOMEEMP.value;

     validade := DataAtual;
     QRExtrato.labValidade.caption := Datetostr(validade)+'.';
     DMConexao.Log('Visualizaçao/Impressão de Extrato de Débitos pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value, 'P', DMAssociado.cdsAssocASS_ID.value);

     QRExtrato.ShowProgress := false;
     If visualizar = 1 then
        QRExtrato.Preview;

     If imprimir = 1 then
        QRExtrato.print;

     Application.ProcessMessages;

     if boletoEmail = 1 then
     begin

                ExibeAguarde('Preparando e-mail. Por favor aguarde...');

                try
                if gerarPDF(QRExtrato,caminho+'\'+pasta,'Extrato_Débitos_'+novoarquivo+ '.pdf') = 0 then
                begin
                    Aviso('Erro ao gerar arquivo PDF a ser enviado. ');
                    Exit;
                end;
                except
                   Aviso('Erro ao gerar PDF. ');
                   exit;
                end;

                Sleep(3000);

                EscondeAguarde;

                try application.createform(TfrmExtratoEnviarEmail,frmExtratoEnviarEmail);
                frmExtratoEnviarEmail.edPARA.text := emailenvio;
                frmExtratoEnviarEmail.edPARA.enabled := false;
                frmExtratoEnviarEmail.edPARA.ReadOnly:=true;
                frmExtratoEnviarEmail.labmsg.caption :='';
                frmExtratoEnviarEmail.edAssunto.text := 'Envio de Extrato de Débitos';
                frmExtratoEnviarEmail.Memomsg.Lines.clear;
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Aos cuidados de: ' + DMAssociado.cdsAssocNOME.value+ ' (Cadastro Nº ' + copy(DMAssociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(DMAssociado.cdsAssocREGISTRO.value,8,4) +').');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Prezados Senhores(as),');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Em atenção à sua solicitação encaminhamos, anexo, extrato de débito de Contribuições, para simples conferência.');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Atenciosamente,');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Sindicato dos Representantes Comerciais do Rio de Janeiro');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Site: www.sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('E-mail: sindicato@sircomrj.com.br');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Endereço: Av. Graça Aranha 416 Sl. 425, Castelo, Rio de Janeiro, CEP 24.020-320');
                frmExtratoEnviarEmail.Memomsg.Lines.Add('Tel: (21) 2524-2859 (21) 2210-1838');


                if frmExtratoEnviarEmail.showmodal = mrok then
                begin
                    ExibeAguarde('Enviando e-mail. Por favor aguarde...');
                    try
                    if EnviarEmail(frmExtratoEnviarEmail.edPARA.text,frmExtratoEnviarEmail.edAssunto.text,RICH_HTML(frmExtratoEnviarEmail.Memomsg),ArquivosDIr(caminho+'\'+pasta,1)) = 1 then
                    begin
                       EscondeAguarde;

                       DMAssociado.PROC_OBS_UI.close;
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Envio de E-mail: Extrato de Débitos. ';
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr( time()),1,5);
                       DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                       DMAssociado.PROC_OBS_UI.ExecProc;
                       DMAssociado.cdsObs.Refresh;

                      Aviso('E-mail enviado com sucesso.');
                     end
                     ELSE
                     BEGIN
                       Aviso('Erro ao enviar e-mail.  '+chr(13)+ 'Verifique se o e-mail está correto e sem seu computador está conectado a internet. ' );

                     END;

                    except
                       EscondeAguarde;
                       Aviso('Erro ao enviar e-mail. ');
                       exit;
                    end;
                end;

                finally
                   frmExtratoEnviarEmail.free;
                end;

     end;


     Finally
     QRExtrato.free;
     end;
  end;
  finally
  frmExtratoOpcoes.free;
  end;







end;

procedure TfrmNovoAssoc.spPrescricaoClick(Sender: TObject);
begin
  inherited;
  DmFinancas.cdsPrescricao.close;
  DmFinancas.cdsPrescricao.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
  DmFinancas.cdsPrescricao.Params.ParamByName('tipo').value :='A';
  DmFinancas.cdsPrescricao.Params.ParamByName('dataatual').value :=DataAtual;
  DmFinancas.cdsPrescricao.Params.ParamByName('ano').asinteger := ExtractYear(DataAtual)-5;
  DmFinancas.cdsPrescricao.Open;
  If DmFinancas.cdsPrescricao.RecordCount = 0 then
     Aviso('Não têm contribuições a serem prescritas. ')
  else
  begin
      Try Application.createform(TFrmPrescricao,FrmPrescricao);

      DmFinancas.cdsPrescricao.first;
      While not DmFinancas.cdsPrescricao.eof do
      begin
         FrmPrescricao.cdsAnuidades.Append;
         FrmPrescricao.cdsAnuidades.Edit;
         FrmPrescricao.cdsAnuidadesAno.value := DmFinancas.cdsPrescricao.fieldbyname('ANO').value;
         FrmPrescricao.cdsAnuidadesAnuid_Id.value := DmFinancas.cdsPrescricao.fieldbyname('ANUID_ID').value;
         FrmPrescricao.cdsAnuidadesCorrecao.asfloat := DmFinancas.cdsPrescricao.fieldbyname('CORRECAO').asfloat;
         FrmPrescricao.cdsAnuidadesDescricao.value := DmFinancas.cdsPrescricao.fieldbyname('DESCRICAO').value;
         FrmPrescricao.cdsAnuidadesJuros.asfloat := DmFinancas.cdsPrescricao.fieldbyname('JUROS').asfloat;
         FrmPrescricao.cdsAnuidadesMulta.asfloat := DmFinancas.cdsPrescricao.fieldbyname('MULTA').asfloat;
         FrmPrescricao.cdsAnuidadesNum_Parcela.value := DmFinancas.cdsPrescricao.fieldbyname('NUM_PARCELA').value;
         FrmPrescricao.cdsAnuidadesParc_Id.value := DmFinancas.cdsPrescricao.fieldbyname('PARC_ID').value;
         FrmPrescricao.cdsAnuidadesTipoContrib.value := DmFinancas.cdsPrescricao.fieldbyname('TIPOCONTRIB').value;
         FrmPrescricao.cdsAnuidadestotal.asfloat := DmFinancas.cdsPrescricao.fieldbyname('TOTAL').asfloat;
         FrmPrescricao.cdsAnuidadesTpContrib_id.value := DmFinancas.cdsPrescricao.fieldbyname('TPCONTRIB_ID').value;
         FrmPrescricao.cdsAnuidadesValor.asfloat := DmFinancas.cdsPrescricao.fieldbyname('VALOR').asfloat;
         FrmPrescricao.cdsAnuidadesVencimento.value := DmFinancas.cdsPrescricao.fieldbyname('VENCIMENTO').value;
         FrmPrescricao.cdsAnuidadesSelecionado.Value := true;
         FrmPrescricao.cdsAnuidades.Post;
         DmFinancas.cdsPrescricao.Next;
      end;
      FrmPrescricao.cdsAnuidades.First;

      if FrmPrescricao.showmodal = mrok then
      begin
          FrmPrescricao.cdsAnuidades.first;
          while not FrmPrescricao.cdsAnuidades.eof do
          begin
              If FrmPrescricao.cdsAnuidadesSelecionado.value = true then
              begin
                  DmFinancas.PROC_PRESCRICAO.Close;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('anuid_id').value := FrmPrescricao.cdsAnuidadesAnuid_Id.value;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('situacao').value :='P';
                  DmFinancas.PROC_PRESCRICAO.ParamByName('data').value :=DataAtual;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('obs').value :='Prescrita por '+ uppercase(UserName);
                  DmFinancas.PROC_PRESCRICAO.ExecProc;
                  DMConexao.Log('Prescrição de Contribuição pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Anuid_id:' +inttostr(FrmPrescricao.cdsAnuidadesAnuid_Id.value) , 'O', DMAssociado.cdsAssocASS_ID.value);
              end;
              FrmPrescricao.cdsAnuidades.next;
          end;

          //Débitos Anuidades
          DmFinancas.cdsDebitosAnuidades.close;
          DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
          DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
          DmFinancas.cdsDebitosAnuidades.Open;

          //Prescrição / Isenção
          DMAssociado.cdsPrescIsencao.Close;
          DMAssociado.cdsPrescIsencao.Params.parambyname('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          DMAssociado.cdsPrescIsencao.open;

      end;
      finally
      FrmPrescricao.free;
      end;
  End;
end;

procedure TfrmNovoAssoc.SpNovoParcClick(Sender: TObject);
var
  tipo, msg : String;
  parcel_id, x, bol_id, i:integer;
  Valor_Boleto:real;
  NossoNumero, anuidades:String;
  Itemstatus:Integer;

begin
  inherited;
  cdsLoteAnuids.Open;
  cdsLoteAnuids.EmptyDataSet;
  spPrintParcel.Enabled := false;
  try Application.createform(TfrmBoletoOpcoes,frmBoletoOpcoes);
  frmBoletoOpcoes.panelOpcoes.Visible :=false;
  tipo:='';
  if frmBoletoOpcoes.showmodal=mrok then
  begin
      If frmBoletoOpcoes.radSind.checked = true then
         tipo := 'Sindical'
      else
      If frmBoletoOpcoes.radConf.checked = true then
         tipo := 'Confederativa';

      if not DmFinancas.dsDebitosAnuidades.dataset.locate('TIPOCONTRIB',tipo,[]) then
      begin
         Aviso('Não existe Contribuição ' + tipo + ' em aberto. ');
         abort;
      end;

  end
  else
  begin
      tipo:='';
      abort;
  end;
  finally
  frmBoletoOpcoes.free;
  end;

  if tipo<>'' then
  begin
        try Application.CreateForm(TfrmParcelamentoContribs,frmParcelamentoContribs);
        DmFinancas.cdsContribsParcelamento.close;
        DmFinancas.cdsContribsParcelamento.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
        DmFinancas.cdsContribsParcelamento.Params.ParamByName('tipo').value := 'T';
        DmFinancas.cdsContribsParcelamento.Params.ParamByName('dataatual').value := DataAtual;
        DmFinancas.cdsContribsParcelamento.Params.ParamByName('tipocontrib').value := tipo;
        DmFinancas.cdsContribsParcelamento.Open;

        frmParcelamentoContribs.cdsAnuidades.CreateDataSet;
        If DmFinancas.cdsContribsParcelamento.RecordCount > 0 then
        begin
           DmFinancas.cdsContribsParcelamento.first;
           While not DmFinancas.cdsContribsParcelamento.eof do
           begin
               frmParcelamentoContribs.cdsAnuidades.Append;
               frmParcelamentoContribs.cdsAnuidades.Edit;
               frmParcelamentoContribs.cdsAnuidadesAno.value := DmFinancas.cdsContribsParcelamento.fieldbyname('ANO').value;
               frmParcelamentoContribs.cdsAnuidadesAnuid_Id.value := DmFinancas.cdsContribsParcelamento.fieldbyname('ANUID_ID').value;
               frmParcelamentoContribs.cdsAnuidadesCorrecao.asfloat := DmFinancas.cdsContribsParcelamento.fieldbyname('CORRECAO').value;
               frmParcelamentoContribs.cdsAnuidadesDescricao.value := DmFinancas.cdsContribsParcelamento.fieldbyname('DESCRICAO').value;
               frmParcelamentoContribs.cdsAnuidadesJuros.asfloat := DmFinancas.cdsContribsParcelamento.fieldbyname('JUROS').value;
               frmParcelamentoContribs.cdsAnuidadesMulta.asfloat := DmFinancas.cdsContribsParcelamento.fieldbyname('MULTA').value;
               frmParcelamentoContribs.cdsAnuidadesNum_Parcela.value := DmFinancas.cdsContribsParcelamento.fieldbyname('NUM_PARCELA').value;
               frmParcelamentoContribs.cdsAnuidadesParc_Id.value := DmFinancas.cdsContribsParcelamento.fieldbyname('PARC_ID').value;
               frmParcelamentoContribs.cdsAnuidadesTipoContrib.value := DmFinancas.cdsContribsParcelamento.fieldbyname('TIPOCONTRIB').value;
               frmParcelamentoContribs.cdsAnuidadestotal.asfloat := DmFinancas.cdsContribsParcelamento.fieldbyname('TOTAL').value;
               frmParcelamentoContribs.cdsAnuidadesTpContrib_id.value := DmFinancas.cdsContribsParcelamento.fieldbyname('TPCONTRIB_ID').value;
               frmParcelamentoContribs.cdsAnuidadesValor.asfloat := DmFinancas.cdsContribsParcelamento.fieldbyname('VALOR').value;
               frmParcelamentoContribs.cdsAnuidadesVencimento.value := DmFinancas.cdsContribsParcelamento.fieldbyname('VENCIMENTO').value;
               frmParcelamentoContribs.cdsAnuidades.Post;
               DmFinancas.cdsContribsParcelamento.Next;
           end;
           frmParcelamentoContribs.cdsAnuidades.First;
        end;

        if frmParcelamentoContribs.showmodal = mrok then
        begin
             try application.createform(TFormOpcoesMetodo,FormOpcoesMetodo);
             If FormOpcoesMetodo.showmodal = mrok then
             begin

               If FormOpcoesMetodo.radantigo.checked = true then // Parcelamento forma antiga
               begin

                    Try application.Createform(TfrmParcelamentoAntigoOpcoes,frmParcelamentoAntigoOpcoes);
                    frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.CreateDataSet;
                    frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.Open;
                    frmParcelamentoAntigoOpcoes.cdsParcelas.CreateDataSet;

                     AnuidEmLote := 0;
                    //Pegando as Anuidades Parceladas, montando a descricao e guardando os IDs
                    anuidades :='';
                    frmParcelamentoContribs.cdsAnuidades.First;
                    while not frmParcelamentoContribs.cdsAnuidades.eof do
                    begin
                        If frmParcelamentoContribs.cdsAnuidadesSelecionado.Value = true then
                        begin
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.append;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.Edit;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsanuid_id.value := frmParcelamentoContribs.cdsAnuidadesAnuid_Id.value;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsvalor.value := frmParcelamentoContribs.cdsAnuidadesValor.asfloat;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsmulta.value := frmParcelamentoContribs.cdsAnuidadesMulta.asfloat;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsjuros.value := frmParcelamentoContribs.cdsAnuidadesJuros.asfloat;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcscorrecao.value := frmParcelamentoContribs.cdsAnuidadesCorrecao.asfloat;
                            frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.post;

                            If anuidades ='' then
                                   anuidades := inttostr(frmParcelamentoContribs.cdsAnuidadesAno.value)
                                else
                                   anuidades := anuidades + '/'+inttostr(frmParcelamentoContribs.cdsAnuidadesAno.value);

                            if ExisteemLote = 1 then
                            begin
                                DMAssociado.sdsVerExisteAnuid.close;
                                DMAssociado.sdsVerExisteAnuid.params.ParamByName('anuid_id').value :=frmParcelamentoContribs.cdsAnuidadesAnuid_Id.value;
                                DMAssociado.sdsVerExisteAnuid.open;
                                if DMAssociado.sdsVerExisteAnuidIDLOTEITEM.value> 0 then
                                begin
                                   If not cdsLoteAnuids.Locate('idloteitem',DMAssociado.sdsVerExisteAnuidIDLOTEITEM.value,[]) then
                                   begin
                                       cdsLoteAnuids.Append;
                                       cdsLoteAnuids.Edit;
                                       cdsLoteAnuidsidloteitem.value := DMAssociado.sdsVerExisteAnuidIDLOTEITEM.Value;
                                       cdsLoteAnuids.Post;
                                       AnuidEmLote := 1;
                                   end;

                                end;
                            end;
                         end;
                            frmParcelamentoContribs.cdsAnuidades.Next;
                    end;

                    frmParcelamentoAntigoOpcoes.edDataParc.text := datetostr(DataAtual);

                    frmParcelamentoAntigoOpcoes.edDescricao.text := 'Parcelamento ('+tipo+')';
                    frmParcelamentoAntigoOpcoes.edValor.text := formatfloat(',0.00', Valortotalparc);

                    frmParcelamentoAntigoOpcoes.edPrimVencto.Text := datetostr(DataAtual);

                    frmParcelamentoAntigoOpcoes.cdsParcelas.Open;
                    frmParcelamentoAntigoOpcoes.cdsParcelas.Append;
                    frmParcelamentoAntigoOpcoes.cdsParcelas.Edit;
                    frmParcelamentoAntigoOpcoes.cdsParcelasParcela_descr.Value := 'Parcela 1/1';
                    frmParcelamentoAntigoOpcoes.cdsParcelasNumParc.value := 1;
                    frmParcelamentoAntigoOpcoes.cdsParcelasVencimento.Value := DataAtual;
                    frmParcelamentoAntigoOpcoes.cdsParcelasValor.value := Valortotalparc;

                    If frmParcelamentoAntigoOpcoes.showmodal = mrok then
                    begin
                          Try

                               parcel_id := DMConexao.GeraAutoNumber('GEN_PARCEL_ID',1);

                               DmFinancas.PROC_PARCELAMENTOI.Close;
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('PARCEL_ID').value := parcel_id;
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('DESCRICAO_PARC').value := frmParcelamentoAntigoOpcoes.edDescricao.Text;
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('DT_PARCEL').value := strtodate(frmParcelamentoAntigoOpcoes.edDataParc.Text);
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('NUM_PARC').value := strtoint(frmParcelamentoAntigoOpcoes.edNumParc.Text);
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('VALOR_TOTAL').value := strtofloat( StringReplace(frmParcelamentoAntigoOpcoes.edValor.Text,'.','',[rfreplaceall]));
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('DT_PRIM_PARCELA').value := strtodate(frmParcelamentoAntigoOpcoes.edPrimVencto.Text);
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('TP_STATUS_ID').value :=1;
                               DmFinancas.PROC_PARCELAMENTOI.ParamByName('ORIGEMRECUP').value :=AnuidEmLote;
                               DmFinancas.PROC_PARCELAMENTOI.ExecProc;
                               DMConexao.Log('Inclusão de Parcelamento para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / parcel_id:' +inttostr(parcel_id)+'-'+frmParcelamentoAntigoOpcoes.edDescricao.Text , 'I', DMAssociado.cdsAssocASS_ID.value);

                               DMAssociado.PROC_OBS_UI.close;
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Parcelamento ' + tipo+ ' efetuado nesta data referente ao(s) ano(s) ' + anuidades+'.';
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(time()),1,5);
                               DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                               DMAssociado.PROC_OBS_UI.ExecProc;
                               DMAssociado.dsObs.DataSet.Refresh;


                               If AnuidEmLote =1 then
                               begin
                                  cdsLoteAnuids.First;
                                  while not cdsLoteAnuids.eof do
                                  begin
                                      DMAssociado.sdsVerExisteStatus.Close;
                                      DMAssociado.sdsVerExisteStatus.Params.ParamByName('tipo').value := 7;
                                      DMAssociado.sdsVerExisteStatus.Params.ParamByName('data').value := DataAtual;
                                      DMAssociado.sdsVerExisteStatus.Params.ParamByName('item').value := cdsLoteAnuidsidloteitem.Value;
                                      DMAssociado.sdsVerExisteStatus.Open;

                                      if DMAssociado.sdsVerExisteStatusQTDE.Value = 0 then
                                      begin
                                           if (DMConexao.ExecuteProc('LOTEPARCELITEM_I',
                                                inttostr(parcel_id) + ',' +
                                                inttostr(cdsLoteAnuidsidloteitem.value) )) = 0 then
                                           begin
                                                  Erro('Erro ao associar o item ao Parcelamento: ' + ' Item Nº ' + inttostr(cdsLoteAnuidsidloteitem.value));
                                                  Exit;
                                           end;
                                       end;


                                      cdsLoteAnuids.Next;
                                  end;
                               end;      


                               frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.First;
                               while not frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.eof do
                               begin
                                   DmFinancas.PROC_PARCELANUIDADES_I.close;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('PARCEL_ID').value := parcel_id;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('ANUID_ID').value := frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsanuid_id.value;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('VALOR_ANUID').value := frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsvalor.value;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('MULTA_ANUID').value := frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsmulta.value;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('JUROS_ANUID').value := frmParcelamentoAntigoOpcoes.cdsAnuidadesParcsjuros.value;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('CORRECAO_ANUID').value := frmParcelamentoAntigoOpcoes.cdsAnuidadesParcscorrecao.value;
                                   DmFinancas.PROC_PARCELANUIDADES_I.ExecProc;

                                   frmParcelamentoAntigoOpcoes.cdsAnuidadesParcs.Next;
                               end;


                               frmParcelamentoAntigoOpcoes.cdsParcelas.First;
                               while not frmParcelamentoAntigoOpcoes.cdsParcelas.eof do
                               begin
                                   DmFinancas.PROC_PARCELPARCELAS_I.Close;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('PARC_ID').clear;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('NUM_PARCELA').value := frmParcelamentoAntigoOpcoes.cdsParcelasNumParc.value;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('DT_VENCIMENTO').value := frmParcelamentoAntigoOpcoes.cdsParcelasVencimento.value;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('VALOR_PARC').value := frmParcelamentoAntigoOpcoes.cdsParcelasValor.value;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('PARCEL_ID').value := parcel_id;
                                   DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('PAR_DESCRICAO').value := 'Parcela ' + inttostr(DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('NUM_PARCELA').value);
                                   DmFinancas.PROC_PARCELPARCELAS_I.Execproc;

                                   frmParcelamentoAntigoOpcoes.cdsParcelas.Next;
                               end;

                               AtualizaParcels;
                               //Débitos Anuidades
                               DmFinancas.cdsDebitosAnuidades.close;
                               DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                               DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                               DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                               DmFinancas.cdsDebitosAnuidades.Open;

                               DmFinancas.cdsParcelamento.Locate('PARCEL_ID',parcel_id,[]);
                               ConfissaodeDivida;
                          except
                          Erro('Erro ao gerar o parcelamento' );

                          abort;
                          end;
                      end;

                      finally
                      frmParcelamentoAntigoOpcoes.free;
                      end;
               end

               else

               If FormOpcoesMetodo.radNovo.checked = true then // Parcelamento forma nova
               begin

                    Try application.Createform(TfrmParcelamentoNovoOpcoes,frmParcelamentoNovoOpcoes);
                    frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.CreateDataSet;
                    frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Open;
                    frmParcelamentoNovoOpcoes.cdsParcelas.CreateDataSet;

                    //Pegando as Anuidades Parceladas, montando a descricao e guardando os IDs
                    frmParcelamentoContribs.cdsAnuidades.First;
                    x:=1;
                    anuidades:='';
                    valortotParNOvo :=0;
                    while not frmParcelamentoContribs.cdsAnuidades.eof do
                    begin
                        If frmParcelamentoContribs.cdsAnuidadesSelecionado.Value = true then
                        begin
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.append;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Edit;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value := frmParcelamentoContribs.cdsAnuidadesAnuid_Id.value;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsvalor.value := frmParcelamentoContribs.cdsAnuidadesValor.asfloat;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsmulta.value := frmParcelamentoContribs.cdsAnuidadesMulta.asfloat;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsjuros.value := frmParcelamentoContribs.cdsAnuidadesJuros.asfloat;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcscorrecao.value := frmParcelamentoContribs.cdsAnuidadesCorrecao.asfloat;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsAno.value := frmParcelamentoContribs.cdsAnuidadesAno.asinteger;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcsnumparc.value := x;
                                frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.post;
                                valortotParNOvo := valortotParNOvo + ( frmParcelamentoContribs.cdsAnuidadesValor.asfloat + frmParcelamentoContribs.cdsAnuidadesMulta.asfloat + frmParcelamentoContribs.cdsAnuidadesJuros.asfloat + frmParcelamentoContribs.cdsAnuidadesCorrecao.asfloat);
                                x:=x+1;
                                If anuidades ='' then
                                   anuidades := inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsAno.value)
                                else
                                   anuidades := anuidades + '/'+inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsAno.value);
                        end;
                        frmParcelamentoContribs.cdsAnuidades.Next;
                    end;

                    frmParcelamentoNovoOpcoes.edDataParc.text := datetostr(DataAtual);

                    frmParcelamentoNovoOpcoes.edDescricao.text := 'Parcelamento ('+tipo+')';
                    frmParcelamentoNovoOpcoes.edValor.text := formatfloat(',0.00', Valortotalparc);

                    frmParcelamentoNovoOpcoes.edPrimVencto.Text := datetostr(DataAtual);

                    frmParcelamentoNovoOpcoes.cdsParcelas.Open;

                    If frmParcelamentoNovoOpcoes.showmodal = mrok then
                    begin
                        Try
                             parcel_id := DMConexao.GeraAutoNumber('GEN_PARCEL_ID',1);

                             DmFinancas.PROC_PARCELAMENTOI.Close;
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('PARCEL_ID').value := parcel_id;
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('DESCRICAO_PARC').value := frmParcelamentoNovoOpcoes.edDescricao.Text;
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('DT_PARCEL').value := strtodate(frmParcelamentoNovoOpcoes.edDataParc.Text);
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('NUM_PARC').value := strtoint(frmParcelamentoNovoOpcoes.edNumParc.Text);
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('VALOR_TOTAL').value := 0;
                            //DmFinancas.PROC_PARCELAMENTOI.ParamByName('VALOR_TOTAL').value := strtofloat( StringReplace(frmParcelamentoNovoOpcoes.edValor.Text,'.','',[rfreplaceall]));
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('DT_PRIM_PARCELA').value := strtodate(frmParcelamentoNovoOpcoes.edPrimVencto.Text);
                             DmFinancas.PROC_PARCELAMENTOI.ParamByName('TP_STATUS_ID').value :=1;
                             DmFinancas.PROC_PARCELAMENTOI.ExecProc;
                             DMConexao.Log('Inclusão de Parcelamento para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / parcel_id:' +inttostr(parcel_id)+'-'+frmParcelamentoNovoOpcoes.edDescricao.Text , 'I', DMAssociado.cdsAssocASS_ID.value);

                             DMAssociado.PROC_OBS_UI.close;
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Parcelamento ' + tipo+ ' efetuado nesta data referente ao(s) ano(s) ' + anuidades+'.';
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(time()),1,5);
                             DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                             DMAssociado.PROC_OBS_UI.ExecProc;
                             DMAssociado.dsObs.DataSet.Refresh;

                             frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.First;
                             while not frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.eof do
                             begin
                                 frmParcelamentoNovoOpcoes.cdsParcelas.locate('anuid_id',frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value,[]);

                                 DmFinancas.PROC_PARCELANUIDADES_I.close;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('PARCEL_ID').value := parcel_id;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('ANUID_ID').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('VALOR_ANUID').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsvalor.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('MULTA_ANUID').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsmulta.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('JUROS_ANUID').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsjuros.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('CORRECAO_ANUID').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcscorrecao.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ParamByName('numparc').value :=  frmParcelamentoNovoOpcoes.cdsParcelasNumParc.value ;//frmParcelamentoNovoOpcoes.cdsAnuidadesParcsnumparc.value;
                                 DmFinancas.PROC_PARCELANUIDADES_I.ExecProc;

                                 frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Next;
                             end;


                             frmParcelamentoNovoOpcoes.cdsParcelas.First;
                             while not frmParcelamentoNovoOpcoes.cdsParcelas.eof do
                             begin
                                 DmFinancas.PROC_PARCELPARCELAS_I.Close;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('PARC_ID').clear;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('NUM_PARCELA').value := frmParcelamentoNovoOpcoes.cdsParcelasNumParc.value;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('DT_VENCIMENTO').value := frmParcelamentoNovoOpcoes.cdsParcelasVencimento.value;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('VALOR_PARC').value := frmParcelamentoNovoOpcoes.cdsParcelasValor.value;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('PARCEL_ID').value := parcel_id;
                                 DmFinancas.PROC_PARCELPARCELAS_I.ParamByName('par_descricao').value := frmParcelamentoNovoOpcoes.cdsParcelasParcela_descr.value;
                                 DmFinancas.PROC_PARCELPARCELAS_I.Execproc;

                                 frmParcelamentoNovoOpcoes.cdsParcelas.Next;
                             end;

                             AtualizaParcels;
                             //Débitos Anuidades
                             DmFinancas.cdsDebitosAnuidades.close;
                             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                             DmFinancas.cdsDebitosAnuidades.Open;

                             AtualizaParcelasParc;

                             If tipo = 'Sindical' then
                                msg :='Deseja gerar as Guias Sindicais relacionadas a este parcelamento?'
                             else
                                msg :='Deseja gerar os Boletos das Guias Confederativas relacionadas a este parcelamento?';

                             If Confirma(msg) then
                             begin

                                  if DMConexao.sdsConfigCOBRREGISTRADA.Value = 1 then
                                  begin
                                        if (DMAssociado.cdsAssocCPFCNPJ.Value ='') then
                                        begin
                                           Aviso('Campo CPF/CNPJ é obrigatório para geração de boleto de Cobrança Registrada. ');
                                           Exit;
                                        end
                                        else
                                        if ValidaCPFCNPJ(DMAssociado.cdsAssocCPFCNPJ.Value) = false then
                                        begin
                                           Aviso('Dígito verificador do campo CPF/CNPJ é inválido. ');
                                           Exit;
                                        end ;

                                        if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Sim','Não']),[] ) then
                                        begin
                                           Aviso('Não é possível gerar Boleto de Cobrança Registrada sem endereço de correspondência cadastrado. ');
                                           Exit;
                                        end;
                                  end;

                                  ExibeAguarde('Impressão em andamento. Por favor aguarde...');
                                  If Tipo='Confederativa' then
                                  begin
                                     DmBoleto.cdsDadosAssoc.close;
                                     DmBoleto.cdsDadosAssoc.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
                                     DmBoleto.cdsDadosAssoc.Params.ParamByName('corresp').value := 1;
                                     DmBoleto.cdsDadosAssoc.Open;
                                     If DmBoleto.cdsDadosAssoc.RecordCount = 0 then
                                        If not (Confirma('Filiado sem endereço de correspondência cadastrado.' +#13+'Deseja continuar assim mesmo? ' )) then
                                           abort;

                                     //Dados da Conta e Cedente
                                     DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 2);
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  DmBoleto.cdsContaBAN_CODIGO.AsString;
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
                                     DmBoleto.gbTitulo1.SeuNumero := '';
                                     DmBoleto.gbTitulo1.DataDocumento := Dataatual;
                                     DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

                                     DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
                                     DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
                                     DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

                                     DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
                                     DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
                                     DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
                                     DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
                                     //Fim dados do Cedente

                                    //Dados do Sacado
                                     DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);
                                     DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
                                     DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
                                     DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
                                     DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

                                     if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
                                        DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
                                     else
                                        DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;
                                     //Fim Dados do Sacado

                                     frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.First;
                                     frmParcelamentoNovoOpcoes.cdsParcelas.First;


                                     while not frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.eof do
                                     begin

                                         if  (extractyear(DataAtual) <> frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value)  then
                                         begin
                                             try
                                                Valor_Boleto := 0;
                                                Dmboleto.gbTitulo1.Instrucoes.Clear;

                                                // Adicionando as instruções do boleto, Valor total e vencimento


                                                frmParcelamentoNovoOpcoes.cdsParcelas.Locate('Parcela_descr', 'Exercício de '+ inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value),[]);

                                                Valor_Boleto := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsvalor.AsFloat + frmParcelamentoNovoOpcoes.cdsAnuidadesParcsmulta.AsFloat + frmParcelamentoNovoOpcoes.cdsAnuidadesParcsjuros.AsFloat + frmParcelamentoNovoOpcoes.cdsAnuidadesParcscorrecao.AsFloat;
                                                Dmboleto.gbTitulo1.Instrucoes.Add('Contribuição '+ inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value) + '('+ Tipo+'): ' + formatfloat(',0.00 ', Valor_Boleto));

                                                //Cancelando boleto ou tirando o vinculo com Boleto_itens
                                                DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value;
                                                DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value:=  0;
                                                DmBoleto.PROC_BOLETO_STATUS.ExecProc;

                                                DmBoleto.gbTitulo1.ValorDocumento := Valor_Boleto;


                                                DmBoleto.gbTitulo1.DataVencimento := frmParcelamentoNovoOpcoes.cdsParcelasVencimento.value;

                                                DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

                                                 if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                                                 begin

                                                     DmBoleto.sdsNossoNumero.close;
                                                     DmBoleto.sdsNossoNumero.Open;

                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                                                         NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14)
                                                     else
                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                                                         NossoNumero := '24' + '8'+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);

                                                     DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
                                                     DmBoleto.gbTitulo1.Carteira := 'SR';
                                                 end
                                                 else
                                                 if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
                                                 begin
                                                     DmBoleto.sdsNossoNumeroCR.close;
                                                     DmBoleto.sdsNossoNumeroCR.Open;

                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                                                         NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'2'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
                                                     else
                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                                                         NossoNumero := '14' + '32'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

                                                     DmBoleto.gbTitulo1.NossoNumero := NossoNumero;
                                                     DmBoleto.gbTitulo1.Carteira := 'RG';
                                                 end;

                                                //Criando o Boleto
                                                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                                                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := DMAssociado.cdsAssocASS_ID.value;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := DmBoleto.gbTitulo1.DataVencimento;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := DmBoleto.gbTitulo1.ValorDocumento;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.gbTitulo1.NossoNumero;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                                                DmBoleto.PROC_BOLETO_I.ExecProc;

                                                //Criando o Item
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := 'Contribuição ('+   inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value)+')';
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsvalor.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsmulta.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcsjuros.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := frmParcelamentoNovoOpcoes.cdsAnuidadesParcscorrecao.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                                                DMConexao.Log('Geração de Boleto Confederativa pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / ' +'Contribuição '+ Tipo + ' ('+ inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value)+')'+' - Nosso Número:'+Dmboleto.gbTitulo1.NossoNumero , 'O', DMAssociado.cdsAssocASS_ID.value);

                                                for i := 0 to Dmboleto.gbTitulo1.Instrucoes.Count - 1 do
                                                     DMConexao.ExecSQL( 'insert into boletoinstrucoes (bol_id, mensagem, ordem ) values (' + IntToStr(bol_id)+','+ QuotedStr(Dmboleto.gbTitulo1.Instrucoes[i])+' ,' + IntToStr(i+1)+');');



                                                If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                                                begin
                                                   Dmboleto.gbTitulo1.Imprimir_SIGCB_e_PDF('Conf_'+inttostr(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value)+ '_'+Dmboleto.gbTitulo1.NossoNumero);
                                                   DMAssociado.dsDocsAnexos.dataset.close;
                                                   DMAssociado.dsDocsAnexos.dataset.open;
                                                end
                                                else
                                                   Dmboleto.gbTitulo1.Imprimir_SIGCB;

                                                 DMAssociado.PROC_OBS_UI.close;
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Guia Confederativa ' + inttostr( frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.Value)+ ' gerada. ';
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(Now),1,5);
                                                 DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                                                 DMAssociado.PROC_OBS_UI.ExecProc;
                                                 DMAssociado.cdsObs.Refresh;




                                           except
                                               Erro('Erro gerando o boleto nº ' + DmBoleto.gbTitulo1.NossoNumero);
                                               abort;
                                           end;
                                       end;
                                       frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Next;
                                       frmParcelamentoNovoOpcoes.cdsParcelas.Next;

                                    end ;//Fim Confederativa

                                  end
                                  else
                                  If Tipo = 'Sindical' then
                                  begin
                                     //Dados da Conta e Cedente
                                     DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 1);
                                     DmBoleto.Guias1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.value;
                                     DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaCT_CODCEDENTE.value+Dmboleto.cdsContaCT_CODCEDENTE_DV.value;
                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                                     begin
                                        DmBoleto.Guias1.Cedente.SICAS_Simples := '00111';
                                        DmBoleto.Guias1.Tipo_Entidade := teFederacao;
                                     end
                                     else
                                     begin
                                        DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
                                        DmBoleto.Guias1.Tipo_Entidade := teSindicato;
                                     end;
                                     DmBoleto.Guias1.Cedente.Agencia := Dmboleto.cdsContaCT_AGENCIA.Value;
                                     DmBoleto.Guias1.Cedente.CNPJ := Dmboleto.cdsContaCNPJ.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Rua := Dmboleto.cdsContaENDER_LOGRADOURO.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Bairro := Dmboleto.cdsContaENDER_BAIRRO.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.CEP := Dmboleto.cdsContaENDER_CEP.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Cidade := Dmboleto.cdsContaCIDADE_NOME.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Numero := Dmboleto.cdsContaENDER_NUMERO.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Complemento := Dmboleto.cdsContaENDER_COMPLEMENTO.Value;
                                     DmBoleto.Guias1.Cedente.Endereco.Estado := Dmboleto.cdsContaESTADO_SIGLA.Value;
                                     DmBoleto.Guias1.Cedente.CNAE := '461';

                                     //Dados do Sacado
                                     DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);

                                     DmBoleto.Guias1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
                                     DmBoleto.Guias1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
                                     DmBoleto.Guias1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;

                                     DmBoleto.cdsOutrosSind.close;
                                     DmBoleto.cdsOutrosSind.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                                     DmBoleto.cdsOutrosSind.Open;

                                     frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.First;
                                     frmParcelamentoNovoOpcoes.cdsParcelas.First;

{                                     //Para pular a primeira
                                     if  pos(inttostr(extractyear(DataAtual)),frmParcelamentoNovoOpcoes.cdsParcelasParcela_descr.value) > 0  then
                                     begin
                                       frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.next;
                                       frmParcelamentoNovoOpcoes.cdsParcelas.next;
                                     end;
 }

                                     while not frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.eof do
                                     begin

                                         if  (extractyear(DataAtual) <> frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value)  then
                                         begin


                                             try
                                                Valor_Boleto := 0;

                                                DmFinancas.cdsDebitosAnuidades.Locate('Anuid_Id',frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.value,[]);

                                                Dmboleto.Guias1.Vencimento := DmFinancas.cdsDebitosAnuidadesVencimento.value;

                                                Dmboleto.Guias1.Exercicio := inttostr(DmFinancas.cdsDebitosAnuidadesAno.value);
                                                Dmboleto.Guias1.Numero_Documento := strtoint(copy(DMAssociado.cdsAssocREGISTRO.value,1,7));

                                                 if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                                                    DmBoleto.Guias1.Sacado.Contribuinte := Copy(DMAssociado.cdsAssocREGISTRO.Value,2, 20) + Copy(DmBoleto.Guias1.Exercicio , 3,2)
                                                 else
                                                 if DMConexao.sdsConfigCOBRREGISTRADA.value = 1 then
                                                 begin
                                                     DmBoleto.sdsNossoNumeroCR.close;
                                                     DmBoleto.sdsNossoNumeroCR.Open;

                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='S' then
                                                         NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+'1'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13)
                                                     else
                                                     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                                                         NossoNumero := '14' + '31'+ copy(DmBoleto.sdsNossoNumeroCRNOSSONUMERO.value,1,13);

                                                     DmBoleto.Guias1.Sacado.Contribuinte := NossoNumero;
                                                 end;
                                                 DmBoleto.Guias1.Sacado.Contribuintecpfcnpj := DMAssociado.cdsAssocCPFCNPJ.Value;
                                                //Instruções
                                                DmBoleto.Guias1.Mensagem.Clear;
                                                DmBoleto.Guias1.MensagemContrib1.Clear;

                                                if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                                                begin
                                                    DmBoleto.Guias1.Mensagem.Add('BLOQUETO DE CONTRIBUIÇÃO SINDICAL URBANA');
                                                    DmBoleto.Guias1.Mensagem.Add('');
                                                     DmBoleto.Guias1.Mensagem.Add('Até o vencimento, pagável nas Lotéricas, Correspondentes Caixa Aqui, Agências da CAIXA e Rede Bancária.');
                                                     DmBoleto.Guias1.Mensagem.Add('Documento vencido pagável somente nas Agências da CAIXA.');
                                                     DmBoleto.Guias1.Mensagem.Add('Guia vencida -  cobrar multa de 10% nos trinta primeiros dias, com adicional ');
                                                     DmBoleto.Guias1.Mensagem.Add('de 2% por mês subseqüente de atraso e juros de mora de 1% ao mês e correção monetária (Selic).');
                                                   // DmBoleto.Guias1.MensagemContrib1.Add('');
                                                end;
                                               
                                                DmBoleto.Guias1.MensagemContrib1.Add('Esta guia não quita débitos anteriores.');

                                                if DmBoleto.cdsOutrosSindQTDE.value = 1 then
                                                      DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicato.')
                                                else
                                                if DmBoleto.cdsOutrosSind.RecordCount > 1 then
                                                      DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicatos.');

                                                DmBoleto.Guias1.Sacado.Capital_Social := 0;
                                                If DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
                                                begin
                                                     DmBoleto.Guias1.Tipo_pessoa:='J';

                                                     if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                                                     begin
                                                         DMAssociado.cdsPegaCapSocial.close;
                                                         DMAssociado.cdsPegaCapSocial.params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                                                         DMAssociado.cdsPegaCapSocial.params.ParamByName('vencimento').value := strtodate('31/01/' + inttostr(Dmfinancas.cdsDebitosAnuidadesAno.value) );
                                                         DMAssociado.cdsPegaCapSocial.params.ParamByName('dataatual').value := DataAtual ;
                                                         DMAssociado.cdsPegaCapSocial.Open;
                                                         If DMAssociado.cdsPegaCapSocial.RecordCount > 0 then
                                                               DmBoleto.Guias1.Sacado.Capital_Social := DMAssociado.cdsPegaCapSocialVALOR.AsFloat ;
                                                     end;
                                                end
                                                else
                                                      DmBoleto.Guias1.Tipo_pessoa:='F';

                                                DmBoleto.PROC_BOLETO_STATUS.ParamByName('anuid_id').value:= DmFinancas.cdsDebitosAnuidadesAnuid_Id.value;
                                                DmBoleto.PROC_BOLETO_STATUS.ParamByName('parc_id').value:=  0;
                                                DmBoleto.PROC_BOLETO_STATUS.ExecProc;

                                                bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
                                                DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value :=DMAssociado.cdsAssocASS_ID.value;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := DmBoleto.cdsContaCONTA_ID.value;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := DmBoleto.Guias1.Vencimento;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := DmFinancas.cdsDebitosAnuidadesValor.asfloat;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := DmBoleto.Guias1.Sacado.Contribuinte;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 1;
                                                DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
                                                DmBoleto.PROC_BOLETO_I.ExecProc;

                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := DmFinancas.cdsDebitosAnuidadesAnuid_Id.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := DmFinancas.cdsDebitosAnuidadesDescricao.value;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := DmFinancas.cdsDebitosAnuidadesValor.AsFloat;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := 0;
                                                DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;
                                             except
                                               Erro('Erro gerando o boleto/item NossoNumero=' + DmBoleto.gbTitulo1.NossoNumero);
                                               abort;
                                             end;

                                             DmBoleto.Guias1.Valores.Contribuicao    := DmFinancas.cdsDebitosAnuidadesValor.asfloat;

                                             DmBoleto.Guias1.Valores.Abatimento      := 0;
                                             DmBoleto.Guias1.Valores.Deducao         := 0;

                                             DMConexao.Log('Geração de Guia Sindical pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / ' +DmFinancas.cdsDebitosAnuidadesDescricao.value +' - Nosso Número:'+DmBoleto.Guias1.Sacado.Contribuinte , 'O', DMAssociado.cdsAssocASS_ID.value);

                                             if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                                                  DmBoleto.Guias1.Imprimir
                                             else
                                             begin
                                                  If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)='F' then
                                                     DmBoleto.Guias1.Imprimir_CR
                                                  else
                                                  begin
                                                      DmBoleto.Guias1.Imprimir_CR_e_PDF('Sind_'+DmBoleto.Guias1.Exercicio+ '_'+DmBoleto.Guias1.Sacado.Contribuinte);
                                                      DMAssociado.dsDocsAnexos.dataset.close;
                                                      DMAssociado.dsDocsAnexos.dataset.open;
                                                  end;
                                             end;

                                             DMAssociado.PROC_OBS_UI.close;
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Guia Sindical ' + inttostr( DmFinancas.cdsDebitosAnuidadesANO.Value)+ ' gerada. ';
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr(Now),1,5);
                                             DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                                             DMAssociado.PROC_OBS_UI.ExecProc;
                                             DMAssociado.cdsObs.Refresh;


                                         end;

                                         frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Next;
                                         frmParcelamentoNovoOpcoes.cdsParcelas.Next;
                                     end;

                                  end; // Fim Sindical
                                  EscondeAguarde;
                                  DmFinancas.cdsParcelamento.LOCATE('PARCEL_ID',parcel_id,[]);

                               end;

                            AtualizaParcels;
                            AtualizaParcelasParc;


                            DmFinancas.cdsParcelamento.Locate('PARCEL_ID',parcel_id,[]);
                            ConfissaodeDividaParcelNovo;

                        except
                        Erro('Erro ao gerar o parcelamento' );
                        abort;
                        end;
                    end;

                    finally
                    frmParcelamentoNovoOpcoes.free;
                    end;
                 end;
               end;

           finally
           FormOpcoesMetodo.free;
           end;
        end;
        finally
        frmParcelamentoContribs.free;
        end;
    end;

    spPrintParcel.Enabled := true;

end;

procedure TfrmNovoAssoc.DBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  AtualizaParcelasParc;


end;

procedure TfrmNovoAssoc.AtualizaParcels;
begin
   //Parcelamentos
   DmFinancas.cdsParcelamento.close;
   DmFinancas.cdsParcelamento.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
   DmFinancas.cdsParcelamento.Open;
   If DmFinancas.cdsParcelamento.RecordCount > 0 then
   begin
      //Parcelas do Parcelamento
      DmFinancas.cdsParcelamento.First;
      DmFinancas.cdsParcelasParc.Close;
      DmFinancas.cdsParcelasParc.Params.ParamByName('p_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      DmFinancas.cdsParcelasParc.Open;

      //Anuidades Parceladas
      Dmfinancas.cdsParcelAnuidades.close;
      Dmfinancas.cdsParcelAnuidades.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      Dmfinancas.cdsParcelAnuidades.Open;
      AtualizaParcelasParc;
   end
   else
   begin
      DmFinancas.cdsParcelasParc.Close;
      Dmfinancas.cdsParcelAnuidades.close;
   end;

end;

procedure TfrmNovoAssoc.AtualizaParcelasParc;
begin
   If DmFinancas.cdsParcelamento.RecordCount > 0 then
   begin
      If DmFinancas.cdsParcelamentoDT_PARCEL.value >=strtodate('12/07/2012') then
      begin
         dbgrid3.Columns[2].Visible := false;
         dbgrid3.Columns[1].Title.Caption:='Data p/Pagamento';
      end
      else
      begin
         dbgrid2.Columns[3].Visible := true;
         dbgrid3.Columns[2].Visible := true;
         dbgrid3.Columns[1].Title.Caption:='Vencimento';
      end;





   end;

      //Parcelas do Parcelamento
      //DmFinancas.cdsParcelasParc.Close;
 { If DmFinancas.cdsParcelamento.RecordCount > 0 then
   begin
      //Parcelas do Parcelamento
      DmFinancas.cdsParcelasParc.Close;
      DmFinancas.cdsParcelasParc.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      DmFinancas.cdsParcelasParc.Open;

      //Anuidades Parceladas
      Dmfinancas.cdsParcelAnuidades.close;
      Dmfinancas.cdsParcelAnuidades.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
      Dmfinancas.cdsParcelAnuidades.Open;
   end
   else
   begin
      DmFinancas.cdsParcelasParc.Close;
      Dmfinancas.cdsParcelAnuidades.close;
   end;}
end;

procedure TfrmNovoAssoc.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 AtualizaParcelasParc;;
end;

procedure TfrmNovoAssoc.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  AtualizaParcelasParc;
end;

procedure TfrmNovoAssoc.spExcluirParcClick(Sender: TObject);
begin
  inherited;
  If DmFinancas.cdsParcelamento.Active = true then
     If DmFinancas.cdsParcelamento.RecordCount > 0 then
        if  DmFinancas.cdsParcelamentoTP_STATUS_ID.value = 1 then
        begin
           DmFinancas.cdsPROC_PARCELAMENTO_DEL.close;
           DmFinancas.cdsPROC_PARCELAMENTO_DEL.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
           DmFinancas.cdsPROC_PARCELAMENTO_DEL.Open;
           If DmFinancas.cdsPROC_PARCELAMENTO_DELEXCLUIDO.value = 0 then
              Erro('O Parcelamento não pode ser excluído por possuir uma ou mais parcelas pagas.'+#13+'Sugiro que use "Desativar" o Parcelamento.')
           else
           begin
                   if (DMConexao.ExecuteProc('PROCPARCELITEM_D',
                        inttostr(DmFinancas.cdsParcelamentoPARCEL_ID.value) )) = 0 then
                   begin
                      Erro('Este Parcelamento tem ITENS DE RECUPERAÇÃO DE CRÉDITO relacionados que nao puderam ser excluído. '+#13+'Informe ao administrador o Código: Parcel. ' + inttostr(DmFinancas.cdsParcelamentoPARCEL_ID.value) );
                   end;

                   AtualizaParcels;
                   //Débitos Anuidades
                   DmFinancas.cdsDebitosAnuidades.close;
                   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                   DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                   DmFinancas.cdsDebitosAnuidades.Open;
                   Aviso('Parcelamento excluído com sucesso. ');
                   DMConexao.Log('Exclusão Parcelamento do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / parcel_id:' +inttostr(DmFinancas.cdsParcelamentoPARCEL_ID.value), 'E', DMAssociado.cdsAssocASS_ID.value);

           end;
        end;
end;

procedure TfrmNovoAssoc.SpAtivarParcClick(Sender: TObject);
var     oper:integer;
        msg:string;
begin
  inherited;
  If DmFinancas.cdsParcelamento.Active = true then
     If DmFinancas.cdsParcelamento.RecordCount > 0 then
     begin
         if DmFinancas.cdsParcelamentoTP_STATUS_ID.value = 2 then
         begin
            oper :=1;
            msg:=' ativar ';
         end
         else
         begin
            oper :=2;
            msg:=' desativar ';
         end;

         If Confirma('Deseja' +msg+'o parcelamento selecionado?') then
         begin
             DmFinancas.cdsPROC_PARCELAMENTO_AT.Close;
             DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('PARCEL_ID').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
             DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('OPERACAO').value :=oper;
             DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('force').value :=0;
             DmFinancas.cdsPROC_PARCELAMENTO_AT.Open;

             If DmFinancas.cdsPROC_PARCELAMENTO_ATAVISO.value = 0 then
             begin
                if Confirma('Este parcelamento não é um caso para Ativação/Desativação pois não possui parcelas pagas.'+#13+'Sugiro que seja excluído.'+#13+'Deseja Ativar/Desativar mesmo assim?') = true then
                begin
                     DmFinancas.cdsPROC_PARCELAMENTO_AT.Close;
                     DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('PARCEL_ID').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
                     DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('OPERACAO').value :=oper;
                     DmFinancas.cdsPROC_PARCELAMENTO_AT.Params.ParamByName('force').value :=1;
                     DmFinancas.cdsPROC_PARCELAMENTO_AT.Open;
                end;
             end;

             If DmFinancas.cdsPROC_PARCELAMENTO_ATAVISO.value = 1 then
             begin
                 AtualizaParcels;
                 //Débitos Anuidades
                 DmFinancas.cdsDebitosAnuidades.close;
                 DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                 DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                 DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                 DmFinancas.cdsDebitosAnuidades.Open;
                 DMConexao.Log('Ativação/Desativação Inclusão de Parcelamento para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / parcel_id:' +inttostr(DmFinancas.cdsParcelamentoPARCEL_ID.value), 'O', DMAssociado.cdsAssocASS_ID.value);
                 If oper = 2 then
                    Aviso('Parcelamento desativado com sucesso. ')
                 else
                    Aviso('Parcelamento ativado com sucesso. ');
                 AtualizaParcels;                    
             end
             else
             If DmFinancas.cdsPROC_PARCELAMENTO_ATAVISO.value = 2 then
             begin
                Erro('Este parcelamento não pode ser reativado pois possui parcelas pagas.');
             end;

              DmFinancas.sdsQtdeParcelAtivos.close;
              DmFinancas.sdsQtdeParcelAtivos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
              DmFinancas.sdsQtdeParcelAtivos.Open;

              If DmFinancas.sdsQtdeParcelAtivosQTDE.value > 0  then
              begin
                Timer1.Enabled := true;
                labparcelamento.Visible:=true;
              end
              else
              begin
                Timer1.Enabled := false;
                labparcelamento.Visible:=false;
              end;

         end;
     end;
end;

procedure TfrmNovoAssoc.spManutencaoClick(Sender: TObject);
begin
  inherited;
  If DmFinancas.dsDebitosAnuidades.DataSet.active = true then
  begin
     If DmFinancas.dsDebitosAnuidades.DataSet.RecordCount > 0 then
     begin

         Try Application.createform(TfrmManutAnuidades,frmManutAnuidades);
         DmFinancas.cdsDebitosAnuidades.DisableControls;
         DmFinancas.cdsDebitosAnuidades.First;
         frmManutAnuidades.cdsDebitos.Open;
         while not DmFinancas.cdsDebitosAnuidades.eof do
         begin
             frmManutAnuidades.cdsDebitos.Append;
             frmManutAnuidades.cdsDebitos.Edit;
             frmManutAnuidades.cdsDebitosANUID_ID.value :=  DmFinancas.cdsDebitosAnuidadesANUID_ID.value;
             frmManutAnuidades.cdsDebitosCORRECAO.value :=  DmFinancas.cdsDebitosAnuidadesCORRECAO.value;
             frmManutAnuidades.cdsDebitosDESCRICAO.value := DmFinancas.cdsDebitosAnuidadesDESCRICAO.value;
             frmManutAnuidades.cdsDebitosJUROS.value := DmFinancas.cdsDebitosAnuidadesJUROS.value;
             frmManutAnuidades.cdsDebitosMULTA.value :=  DmFinancas.cdsDebitosAnuidadesMULTA.value;
             frmManutAnuidades.cdsDebitosTIPOCONTRIB.value :=  DmFinancas.cdsDebitosAnuidadesTIPOCONTRIB.value;
             frmManutAnuidades.cdsDebitosTOTAL.value :=  DmFinancas.cdsDebitosAnuidadesTOTAL.value;
             frmManutAnuidades.cdsDebitosVALOR.value :=  DmFinancas.cdsDebitosAnuidadesVALOR.value;
             frmManutAnuidades.cdsDebitosVENCIMENTO.value := DmFinancas.cdsDebitosAnuidadesVENCIMENTO.value;
             frmManutAnuidades.cdsDebitos.Post;

             DmFinancas.cdsDebitosAnuidades.Next;
         end;

         DmFinancas.cdsDebitosAnuidades.enableControls;

         frmManutAnuidades.showmodal;
         finally
         frmManutAnuidades.free;
         end;

         //Débitos Anuidades
         DmFinancas.cdsDebitosAnuidades.close;
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
         DmFinancas.cdsDebitosAnuidades.Open;

         //Pagamentos
         DmFinancas.cdsPagtos.close;
         DmFinancas.cdsPagtos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
         DmFinancas.cdsPagtos.open;
         AtualizaParcels;
     end;
  end;
end;

procedure TfrmNovoAssoc.spManutencaoParcelamentoClick(Sender: TObject);

begin
  inherited;
  If Dmfinancas.cdsParcelamentoVALOR_TOTAL.asfloat = 0 then
//  dbgrid3.Columns[2].Visible = false then
  begin
     aviso('Este parcelamento não é recebível. '+#13+ 'As guias de cada Contribuição parcelada que devem ser baixadas. ');
     exit;
  end;
  if DmFinancas.dsParcelamento.dataset.Active = true then
  begin
    if DmFinancas.dsParcelamento.dataset.recordcount > 0 then
    begin
      If DmFinancas.dsParcelamento.DataSet.FieldByName('TP_STATUS_DESCR').value <>'Ativo' then
      begin
         Aviso('O Parcelamento selecionado está cancelado. ');
         Abort;
      end;

      Try application.createform(TfrmManutParcelamento,frmManutParcelamento);

      frmManutParcelamento.cdsDebitos.Open;
      DmFinancas.dsParcelasParc.DataSet.DisableControls;
      DmFinancas.dsParcelasParc.DataSet.First;
      while not DmFinancas.dsParcelasParc.DataSet.eof do
      begin
          If (DmFinancas.dsParcelasParc.DataSet.FieldByName('NOSSONUMERO').value ='') or (DmFinancas.dsParcelasParc.DataSet.FieldByName('NOSSONUMERO').value =null) then
          begin
             DmFinancas.cdsEncargos.close;
             DmFinancas.cdsEncargos.Params.ParamByName('VALOR').value := DmFinancas.dsParcelasParc.DataSet.FieldByName('VALOR_PARC').value;
             DmFinancas.cdsEncargos.Params.ParamByName('VENCIMENTO').value := DmFinancas.dsParcelasParc.DataSet.FieldByName('DT_VENCIMENTO').value;
             DmFinancas.cdsEncargos.Params.ParamByName('DATAATUAL').value :=DataAtual;
             DmFinancas.cdsEncargos.Open;

             frmManutParcelamento.cdsDebitos.Append;
             frmManutParcelamento.cdsDebitos.edit;
             frmManutParcelamento.cdsDebitosparc_ID.value := DmFinancas.cdsParcelasParcPARC_ID.value;
             frmManutParcelamento.cdsDebitosCORRECAO.ASFLOAT := DmFinancas.cdsEncargosCORRECAO.VALUE;
             frmManutParcelamento.cdsDebitosDESCRICAO.value := DmFinancas.cdsParcelasParcPAR_DESCRICAO.value;
             frmManutParcelamento.cdsDebitosJUROS.ASFLOAT :=  DmFinancas.cdsEncargosJUROS.VALUE;
             frmManutParcelamento.cdsDebitosMULTA.ASFLOAT := DmFinancas.cdsEncargosMULTA.VALUE;
             frmManutParcelamento.cdsDebitosVALOR.value := DmFinancas.cdsParcelasParcVALOR_PARC.value;
             frmManutParcelamento.cdsDebitosVENCIMENTO.value := DmFinancas.cdsParcelasParcDT_VENCIMENTO.value;
             frmManutParcelamento.cdsDebitosTOTAL.asfloat := frmManutParcelamento.cdsDebitosVALOR.asfloat + frmManutParcelamento.cdsDebitosCORRECAO.asfloat + frmManutParcelamento.cdsDebitosJUROS.asfloat + frmManutParcelamento.cdsDebitosMULTA.asfloat;
             frmManutParcelamento.cdsDebitosEmp_id.value :=DMAssociado.cdsAssocemp_id.value;
             frmManutParcelamento.cdsDebitos.Post;
          end;

          DmFinancas.dsParcelasParc.DataSet.Next;

      end;
      DmFinancas.dsParcelasParc.DataSet.first;
      DmFinancas.dsParcelasParc.DataSet.EnableControls;

      if frmManutParcelamento.cdsDebitos.RecordCount =0 then
      begin
         Aviso('Não já parcelas em aberto. ');
         Abort;
      end;
      frmManutParcelamento.cdsDebitos.first;
      frmManutParcelamento.labParcelamento.caption := DmFinancas.cdsParcelamentoDESCRICAO_PARC.value +' '+inttostr(DmFinancas.cdsParcelamentoNUM_PARC.value)+ ' parc. - R$ '+ formatfloat(',0.00',DmFinancas.cdsParcelamentoVALOR_TOTAL.asfloat);
      frmManutParcelamento.showmodal;

       //Parcelamentos
       DmFinancas.cdsParcelamento.close;
       DmFinancas.cdsParcelamento.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
       DmFinancas.cdsParcelamento.Open;
       If DmFinancas.cdsParcelamento.RecordCount > 0 then
       begin
          //Parcelas do Parcelamento
          DmFinancas.cdsParcelamento.First;
          DmFinancas.cdsParcelasParc.Close;
          DmFinancas.cdsParcelasParc.Params.ParamByName('p_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
          DmFinancas.cdsParcelasParc.Open;

          //Anuidades Parceladas
          Dmfinancas.cdsParcelAnuidades.close;
          Dmfinancas.cdsParcelAnuidades.Params.ParamByName('parcel_id').value := DmFinancas.cdsParcelamentoPARCEL_ID.value;
          Dmfinancas.cdsParcelAnuidades.Open;
       end
       else
       begin
          DmFinancas.cdsParcelasParc.Close;
          Dmfinancas.cdsParcelAnuidades.close;
       end;

       //Pagamentos
       DmFinancas.cdsPagtos.close;
       DmFinancas.cdsPagtos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
       DmFinancas.cdsPagtos.open;

      finally
      frmManutParcelamento.free;
      end;
    end;
  end;
end;

procedure TfrmNovoAssoc.BitBtn1Click(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled :=false;
  try application.createform(TQRFichaCadastral,QRFichaCadastral);
  DMAssociado.sdsPegaEmp.close;;
  DMAssociado.sdsPegaEmp.Params.ParamByName('emp_id').value := DMAssociado.cdsAssocEMP_ID.value;
  DMAssociado.sdsPegaEmp.open;

  QRFichaCadastral.labEmpresa.caption:= DMAssociado.sdsPegaEmpNOMEEMP.value;
  QRFichaCadastral.labTppessoa.caption:= DMAssociado.dsTp_Pessoa.dataset.fieldbyname('TP_ASSOC_DESC').value;
  QRFichaCadastral.labSituacao.caption:=DMAssociado.dsTp_Status.dataset.fieldbyname('TP_STATUS_DESCR').value;
  If editEstadocivil.text <>'' then
      QRFichaCadastral.labEstCivil.caption:=DMAssociado.dsEst_Civil.dataset.fieldbyname('ESTCIVIL_DESC').value
  else
     QRFichaCadastral.labEstCivil.caption:='';
  QRFichaCadastral.labRepres.caption:= DMAssociado.dsRepresentacao.dataset.fieldbyname('DESCR').value;
  DMAssociado.cdsEnderCorresp.close;
  DMAssociado.cdsEnderCorresp.Params.ParamByName('ass_id').value:= DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsEnderCorresp.Params.ParamByName('corresp').value:=1;
  DMAssociado.cdsEnderCorresp.open;
  If DMAssociado.cdsEnderCorresp.RecordCount = 0 then
  begin
    DMAssociado.cdsEnderCorresp.close;
    DMAssociado.cdsEnderCorresp.Params.ParamByName('ass_id').value:= DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
    DMAssociado.cdsEnderCorresp.Params.ParamByName('corresp').value:=0;
    DMAssociado.cdsEnderCorresp.open;
  end;

  If DMAssociado.cdsEnderCorresp.RecordCount =1 then
  begin
      QRFichaCadastral.labEnderTipo.caption := DMAssociado.cdsEnderCorrespTP_ENDER_DESCR.value;
      QRFichaCadastral.labEnderLogradouro.caption := DMAssociado.cdsEnderCorrespEND_LOGRADOURO.value;
      QRFichaCadastral.labEnderNumero.caption := DMAssociado.cdsEnderCorrespEND_NUMERO.value;
      QRFichaCadastral.labEnderComplemento.caption := DMAssociado.cdsEnderCorrespEND_COMPLEMENTO.value;
      QRFichaCadastral.labEnderBairro.caption := DMAssociado.cdsEnderCorrespEND_BAIRRO.value;
      QRFichaCadastral.labEnderCidade.caption := DMAssociado.cdsEnderCorrespCIDADE_NOME.value;
      QRFichaCadastral.labEnderEstado.caption := DMAssociado.cdsEnderCorrespESTADO_SIGLA.value;
  end
  else
  begin
      QRFichaCadastral.labEnderTipo.caption :='';
      QRFichaCadastral.labEnderLogradouro.caption :='';
      QRFichaCadastral.labEnderNumero.caption :='';
      QRFichaCadastral.labEnderComplemento.caption :='';
      QRFichaCadastral.labEnderBairro.caption :='';
      QRFichaCadastral.labEnderCidade.caption :='';
      QRFichaCadastral.labEnderEstado.caption :='';
  end;

  //tel
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 1;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labTel.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labTel.caption:= '';

  //Cel
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 2;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labCel.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labCel.caption:= '';

  //Tel emergencia
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 6;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labTelEmerg.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labTelEmerg.caption:= '';

  //Fax
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 4;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labfax.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labfax.caption:= '';

  //Email
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 3;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labEmail.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labEmail.caption:= '';

  //Site
  DMAssociado.cdsPegaContatos.close;
  DMAssociado.cdsPegaContatos.Params.ParamByName('ass_id').value :=  DMAssociado.dsAssoc.DataSet.fieldbyname('ass_id').value;
  DMAssociado.cdsPegaContatos.Params.ParamByName('tipo').value := 5;
  DMAssociado.cdsPegaContatos.open;
  If DMAssociado.cdsPegaContatos.RecordCount = 1 then
     QRFichaCadastral.labSite.caption:= DMAssociado.cdsPegaContatosCONTATO_DESCR.value
  else
     QRFichaCadastral.labSite.caption:= '';

  //Relacionamentos
  DMAssociado.dsLocRelacion.dataset.First;
  QRFichaCadastral.memoRelacs.Lines.Clear;
  while not DMAssociado.dsLocRelacion.dataset.eof do
  begin
     QRFichaCadastral.memoRelacs.Lines.add( DMAssociado.dsLocRelacion.dataset.fieldbyname('NOMESOCIO').value+ ' (' + DMAssociado.dsLocRelacion.dataset.fieldbyname('TP_REL_DESCRICAO').value+')');
     DMAssociado.dsLocRelacion.dataset.next;
  end;
  DMAssociado.dsLocRelacion.dataset.First;

  //Sindicatos
  DMAssociado.dsLocAssocSindic.dataset.First;
  QRFichaCadastral.memoSind.Lines.Clear;
  while not DMAssociado.dsLocAssocSindic.dataset.eof do
  begin
     QRFichaCadastral.memoSind.Lines.add( DMAssociado.dsLocAssocSindic.DataSet.fieldbyname('SINDIC_NOME').value);
     DMAssociado.dsLocAssocSindic.dataset.next;
  end;
  DMAssociado.dsLocAssocSindic.dataset.First;

  //Segmentos
  DMAssociado.dsLocAssocSegs.dataset.First;
  QRFichaCadastral.memoSeg.Lines.Clear;
  while not DMAssociado.dsLocAssocSegs.dataset.eof do
  begin
     QRFichaCadastral.memoSeg.Lines.add( DMAssociado.dsLocAssocSegs.DataSet.fieldbyname('DESCRICAO').value);
     DMAssociado.dsLocAssocSegs.dataset.next;
  end;
  DMAssociado.dsLocAssocSegs.dataset.First;


  DMConexao.Log('Visualização/Impressão da Ficha Cadastral do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+  '.', 'P', DMAssociado.cdsAssocASS_ID.value);
  QRFichaCadastral.preview;
  finally
  QRFichaCadastral.free;
  end;

  BitBtn1.Enabled :=true;
end;

procedure TfrmNovoAssoc.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if  Tdbgrid(sender).DataSource.dataset.RecNo mod 2 = 1 then
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

procedure TfrmNovoAssoc.Timer1Timer(Sender: TObject);
begin
  inherited;
  labparcelamento.Visible := not labparcelamento.Visible; 
end;

procedure TfrmNovoAssoc.spPrintParcelClick(Sender: TObject);

begin
  inherited;
  iF DmFinancas.dsParcelamento.DATASET.RECORDCOUNT =0 THEN
     ABORT;

  if DmFinancas.dsParcelamento.dataset.Active = true then
  begin
    if DmFinancas.dsParcelamento.dataset.recordcount > 0 then
    begin
       spPrintParcel.Enabled := false;
       try
                application.CreateForm(TfrmTermoImprimirOpcoes,frmTermoImprimirOpcoes);
                if frmTermoImprimirOpcoes.showmodal = mrok then
                begin
                   if frmTermoImprimirOpcoes.rbTermo.Checked = True then
                      TermodeParcelamento
                   else
                   if frmTermoImprimirOpcoes.rbConfissao.Checked = True then
                   begin
                      if DmFinancas.cdsParcelamentoVALOR_TOTAL.asfloat = 0 then
                          ConfissaodeDividaParcelNovo
                      else
                          ConfissaodeDivida;
                   end;
                end
                else
                        Exit;
       finally
                frmTermoImprimirOpcoes.free;
       end;
       spPrintParcel.Enabled := true;
    end;
  end;
end;

procedure TfrmNovoAssoc.spExtornoPrescClick(Sender: TObject);
begin
  inherited;
  if dmassociado.cdsPrescIsencao.recordcount > 0 then
  begin
      If confirma('Confirma o estorno da Prescrição/Isenção selecionada? ') then
      begin
        DmFinancas.PROC_PRESCRICAO.Close;
        DmFinancas.PROC_PRESCRICAO.ParamByName('anuid_id').value := dmassociado.cdsPrescIsencaoANUID_ID.value;
        DmFinancas.PROC_PRESCRICAO.ParamByName('situacao').value :='';
        DmFinancas.PROC_PRESCRICAO.ParamByName('data').Clear;
        DmFinancas.PROC_PRESCRICAO.ParamByName('obs').value :='';
        DmFinancas.PROC_PRESCRICAO.ExecProc;
        DMConexao.Log('Estorno de Prescrição/Isenção pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Anuid_id:' +inttostr(dmassociado.cdsPrescIsencaoAnuid_Id.value) , 'O', DMAssociado.cdsAssocASS_ID.value);

        //Débitos Anuidades
        DmFinancas.cdsDebitosAnuidades.close;
        DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
        DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
        DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
        DmFinancas.cdsDebitosAnuidades.Open;

        //Prescrição / Isenção
        DMAssociado.cdsPrescIsencao.Close;
        DMAssociado.cdsPrescIsencao.Params.parambyname('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
        DMAssociado.cdsPrescIsencao.open;
      end;
  end;
end;

procedure TfrmNovoAssoc.spIsencaoClick(Sender: TObject);
var
  obs:string;
begin
  inherited;
  If DmFinancas.cdsDebitosAnuidades.RecordCount > 0 then
  begin
        Try application.createform(TfrmTipoIsencao,frmTipoIsencao);

        if frmTipoIsencao.showmodal = mrok then
        begin

           if frmTipoIsencao.cbInsecao.checked=true then
           begin

              If Confirma('Confirma Isenção da Contribuição selecionada? ') then
              begin
                 obs := InputBox('Isenção de Contribuição: ', 'Observação:','');

                 If obs='' then
                    obs := 'Isenta por ' + UserName
                 else
                    obs := obs + ' (Isenta por ' + UserName+')';

                  DmFinancas.PROC_PRESCRICAO.Close;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('anuid_id').value :=DmFinancas.cdsDebitosAnuidadesANUID_ID.value;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('situacao').value :='I';
                  DmFinancas.PROC_PRESCRICAO.ParamByName('data').value := DataAtual;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('obs').value :=obs;
                  DmFinancas.PROC_PRESCRICAO.ExecProc;
                  DMConexao.Log('Isenção pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Anuid_id:' +inttostr(DmFinancas.cdsDebitosAnuidadesANUID_ID.value) , 'O', DMAssociado.cdsAssocASS_ID.value);

                  //Débitos Anuidades
                  DmFinancas.cdsDebitosAnuidades.close;
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                  DmFinancas.cdsDebitosAnuidades.Open;

                  //Prescrição / Isenção
                  DMAssociado.cdsPrescIsencao.Close;
                  DMAssociado.cdsPrescIsencao.Params.parambyname('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                  DMAssociado.cdsPrescIsencao.open;

              end;
           end
           else
           if frmTipoIsencao.cbSuperSimples.checked=true then
           begin
              If Confirma('Confirma Isenção Supersimples da Contribuição selecionada? ') then
              begin
                 obs := 'Isenção Simples Nacional';

                 obs := obs + ' (por ' + UserName+')';

                  DmFinancas.PROC_PRESCRICAO.Close;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('anuid_id').value :=DmFinancas.cdsDebitosAnuidadesANUID_ID.value;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('situacao').value :='S';
                  DmFinancas.PROC_PRESCRICAO.ParamByName('data').value := DataAtual;
                  DmFinancas.PROC_PRESCRICAO.ParamByName('obs').value :=obs;
                  DmFinancas.PROC_PRESCRICAO.ExecProc;
                  DMConexao.Log('Isenção Supersimples pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Anuid_id:' +inttostr(DmFinancas.cdsDebitosAnuidadesANUID_ID.value) , 'O', DMAssociado.cdsAssocASS_ID.value);

                  //Débitos Anuidades
                  DmFinancas.cdsDebitosAnuidades.close;
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
                  DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
                  DmFinancas.cdsDebitosAnuidades.Open;

                  //Prescrição / Isenção
                  DMAssociado.cdsPrescIsencao.Close;
                  DMAssociado.cdsPrescIsencao.Params.parambyname('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                  DMAssociado.cdsPrescIsencao.open;

              end;

           end;
        end;
    finally
    frmTipoIsencao.free;
    end;
  end;
end;

procedure TfrmNovoAssoc.Regerar_Previsao;
begin
     Dmfinancas.PROC_ANUIDADE_DEL.close;
     Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ass_id').value:=DMAssociado.cdsAssocASS_ID.value ;
     Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('dataatual').value:= DataAtual;
     Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('TP_CONTRIB').value:= 0;
     Dmfinancas.PROC_ANUIDADE_DEL.ParamByName('ano').value:= 0;
     Dmfinancas.PROC_ANUIDADE_DEL.ExecProc;

     DmFinancas.PROC_GERA_ANUIDADE.close;
     DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ANO').value := 0;
     DmFinancas.PROC_GERA_ANUIDADE.ParamByName('ASS_ID').value := DMAssociado.cdsAssocASS_ID.value ;
     DmFinancas.PROC_GERA_ANUIDADE.ParamByName('DATAATUAL').value := DataAtual;
     DmFinancas.PROC_GERA_ANUIDADE.ParamByName('TIPOCONTRIB').value := 0;
     DmFinancas.PROC_GERA_ANUIDADE.ExecProc;

     DmFinancas.cdsDebitosAnuidades.close;
     DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
     DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
     DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
     DmFinancas.cdsDebitosAnuidades.Open;
end;

procedure TfrmNovoAssoc.EditarVencimentoValor1Click(Sender: TObject);
begin
  inherited;
  If DmFinancas.cdsDebitosAnuidades.RecordCount > 0 then
  begin
      try Application.createform(TFormParcelaAlterDados,FormParcelaAlterDados);
      Anuid_id := DmFinancas.cdsDebitosAnuidadesANUID_ID.value;
      FormParcelaAlterDados.editdescricao.text:= DmFinancas.cdsDebitosAnuidadesDESCRICAO.value;
      FormParcelaAlterDados.EditContribuicao.text:= DmFinancas.cdsDebitosAnuidadesTIPOCONTRIB.value;
      FormParcelaAlterDados.editano.text:= inttostr(DmFinancas.cdsDebitosAnuidadesANO.value);
      FormParcelaAlterDados.EditVencimento.text:= datetostr( DmFinancas.cdsDebitosAnuidadesVENCIMENTO.value);
      FormParcelaAlterDados.editValor.Value:= DmFinancas.cdsDebitosAnuidadesVALOR.asfloat;
      if FormParcelaAlterDados.showmodal = mrok then
      begin
        try
             DmFinancas.PROC_PARCELA_ALTERDADOS.Close;
             DmFinancas.PROC_PARCELA_ALTERDADOS.params.ParamByName('anuid_id').value := Anuid_id;
             DmFinancas.PROC_PARCELA_ALTERDADOS.params.ParamByName('vencimento').value := strtodate(FormParcelaAlterDados.EditVencimento.text);
             DmFinancas.PROC_PARCELA_ALTERDADOS.params.ParamByName('valor').value := FormParcelaAlterDados.editValor.Value;
             DmFinancas.PROC_PARCELA_ALTERDADOS.ExecProc;

             DmFinancas.cdsDebitosAnuidades.close;
             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
             DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
             DmFinancas.cdsDebitosAnuidades.Open;

             DMConexao.Log('Alteração de Dados da Contribuição ' + FormParcelaAlterDados.EditContribuicao.text + ' ' + FormParcelaAlterDados.editano.text  +' - Registro:' +  DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Anuid_id:' +inttostr(Anuid_id) , 'O', DMAssociado.cdsAssocASS_ID.value);
        except
            erro('Erro ao atualizar dados da contribuição. ');
            exit;
        end;
      end;
      finally
      FormParcelaAlterDados.free;
      end;
  end;
end;

procedure TfrmNovoAssoc.DBGrid8DblClick(Sender: TObject);
begin
  inherited;
  if DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
      RefreshAll(Dmassociado.cdsLocRelacionASS_IDFILHO.value)
  else
     RefreshAll(Dmassociado.cdsLocRelacionASS_IDPAI.value);

  FormShow(sender);
  pcPrincipal.ActivePage := tsDadosPessoais;

end;




procedure TfrmNovoAssoc.RefreshAll(ass_id: integer);
begin
  //Dados do Associado
  DMAssociado.cdsAssoc.close;
  DMAssociado.cdsAssoc.Params.ParamByName('ass_id').value := ass_id;
  DMAssociado.cdsAssoc.open;
  frmNovoAssoc.Caption:='Dados de ' +DMAssociado.cdsAssocNOME.value;
  frmNovoAssoc.labparcelamento.Visible:=false;
  frmNovoAssoc.pcPrincipal.ActivePage :=frmNovoAssoc.tscontatos;
  frmNovoAssoc.pcPrincipal.ActivePage :=frmNovoAssoc.tsDadosPessoais;
  DMAssociado.cdsTp_Status.Open;
  DMAssociado.cdsEst_Civil.Open;
  DMAssociado.cdsTp_Pessoa.Open;
  DMAssociado.cdsEmp_Regiao.Open;
  DMAssociado.cdsRepresentacao.Open;

  PegaDados(ass_id);
  btgravar.Enabled :=false;

  If DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
  begin
      editDataNasc.Enabled := false;
      editEstadocivil.Enabled := false;
      editSexo.Enabled := false;
      editNaturalidade.Enabled := false;
      editNacionalidade.Enabled := false;
      editPai.Enabled := false;
      editMae.Enabled := false;
      editDataNasc.Enabled := false;
      editIdentidade.Enabled := false;
      editDataemissao.Enabled := false;
      editOE.Enabled := false;
      editTitulo.Enabled := false;
      editZona.Enabled := false;
      editSecao.Enabled := false;
      editCnh.Enabled := false;

      //labRegSocial.enabled:=true;
      editRegistroSocial.enabled:=true;
      spCapSocAdd.Enabled := true;
      spCapSocEdit.Enabled := true;
      spCapSocDel.Enabled := true;
      gridCapSocial.Enabled := true;



  end
  else
  begin
      editDataNasc.Enabled := true;
      editEstadocivil.Enabled := true;
      editSexo.Enabled := true;
      editNaturalidade.Enabled := true;
      editNacionalidade.Enabled := true;
      editPai.Enabled := true;
      editMae.Enabled := true;
      editDataNasc.Enabled := true;
      editIdentidade.Enabled := true;
      editDataemissao.Enabled := true;
      editOE.Enabled := true;
      editTitulo.Enabled := true;
      editZona.Enabled := true;
      editSecao.Enabled := true;
      editCnh.Enabled := true;

      //labRegSocial.enabled:=false;
      editRegistroSocial.enabled:=false;
      spCapSocAdd.Enabled := false;
      spCapSocEdit.Enabled := false;
      spCapSocDel.Enabled := false;
      gridCapSocial.Enabled := false;
  end;

end;





procedure TfrmNovoAssoc.FormCreate(Sender: TObject);
begin
  inherited;
  cdsParcelsPagos.createdataset;
  cdsLoteAnuids.createdataset;
end;

procedure TfrmNovoAssoc.ImprimirGuia1Click(Sender: TObject);
var
  Venc:tdatetime;
  Valor_Boleto :real;
  conta:integer;
  recibo:string;
  textoitem:string;
begin
  inherited;

  if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
  begin
      Aviso('Não é permitida a impressão de Guias/Boletos sem registro. ');
      Exit;
  end;

  If DmFinancas.cdsPagtosTIPOBOLETO.value = 2 then //  recibo
  begin

          Try application.createform(TQrRecibo,QrRecibo);

          QrRecibo.qrlEmpresa.caption := Stringreplace(QrRecibo.qrlEmpresa.caption,'<<localidade>>',Dmassociado.cdsEmp_regiaoREGIAO.value, [rfReplaceAll]);

          if  Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
              FreeAndNil(QrRecibo.qrimage1);
              FreeAndNil(QrRecibo.qrimage2);
              QrRecibo.qrlEmpresa.left := QrRecibo.qrlEmpresa.left -70;
              QrRecibo.QRShape6.left := QrRecibo.QRShape6.left -70;
              QrRecibo.LabEndereco1.left := QrRecibo.LabEndereco1.left -70;
              QrRecibo.labEndereco2.left := QrRecibo.labEndereco2.left -70;
              QrRecibo.labEndereco3.left := QrRecibo.labEndereco3.left -70;
              QrRecibo.labEndereco4.left := QrRecibo.labEndereco4.left -70;
              QrRecibo.QRLabel16.left := QrRecibo.QRLabel16.left -70;
              QrRecibo.QRShape18.left := QrRecibo.QRShape18.left -70;
              QrRecibo.QRLabel9.left := QrRecibo.QRLabel9.left -70;
              QrRecibo.QRLabel18.left := QrRecibo.QRLabel18.left -70;
              QrRecibo.QRLabel20.left := QrRecibo.QRLabel20.left -70;
              QrRecibo.QRLabel19.left := QrRecibo.QRLabel19.left -70;
          end;
          

          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Município' then
          begin
             QrRecibo.LabEndereco1.caption := 'Av. Graça Aranha, 416 - Sls. 424/425 e 1108 a 1110 - Centro - CEP 20030-001';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2524-2859 / 2210-1838 - E-mail: sindicato@sircomrj.com.br - Site: www.sircomrj.com.br';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 30/11/1943';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 34.046.375/0001-04';
             conta := 9;
          end
          else
          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
             QrRecibo.LabEndereco1.caption := 'Rua Dr. Borman, nº 6 - Sala 204 - Niterói - RJ - CEP 24020-320';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2717-8261 / 2524-2859';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 16/11/1967';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 30.141.717/0001-14';
             conta := 10;
          end;

          QrRecibo.qrmCedente1.lines.add('Nome: '+Dmassociado.cdsAssocNOME.value);

          If DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CNPJ: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value))
          else
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CPF: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value)) ;

          QrRecibo.qrmCedente2.lines.Assign(QrRecibo.qrmCedente1.lines);

          QrRecibo.labpagto.caption := datetostr(Dmfinancas.cdsPagtosDT_RECEBIMENTO.value);

          recibo := Dmfinancas.cdsPagtosNOSSONUMERO.value;

          QrRecibo.labrecibo.caption := recibo;
          QrRecibo.qrlTotal1.caption := formatfloat(',0.00',Dmfinancas.cdsPagtosVALOR_RECEBIMENTO.asfloat);

          DMConexao.Log('Reimpressão de Recibo: ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Num.Recibo:'+Recibo , 'O', DMAssociado.cdsAssocASS_ID.value);

          DmFinancas.cdspagtosItens.first;
          while not DmFinancas.cdspagtosItens.Eof do
          begin
             textoitem :=DmFinancas.cdspagtosItensDESCRICAO_ITEM.value;
             if pos('Sindical',DmFinancas.cdspagtosItensDESCRICAO_ITEM.value) > 0 then
                 textoitem := StringReplace (StringReplace (DmFinancas.cdspagtosItensDESCRICAO_ITEM.value,'Contribuição ', 'Contribuição Sindical ',[rfReplaceall]),'- Sindical', '',[rfReplaceall])
             else
             if pos('Confederativa',DmFinancas.cdspagtosItensDESCRICAO_ITEM.value) > 0 then
                 textoitem := StringReplace (StringReplace (DmFinancas.cdspagtosItensDESCRICAO_ITEM.value,'Contribuição ', 'Contribuição Confederativa ',[rfReplaceall]),'- Confederativa', '',[rfReplaceall]);
             QrRecibo.labitens.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',DmFinancas.cdspagtosItensTOTALITEM.asfloat));
             QrRecibo.labitens2.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',DmFinancas.cdspagtosItensTOTALITEM.asfloat));


             //QrRecibo.labitens.Lines.Add(DmFinancas.cdspagtosItensDESCRICAO_ITEM.value  + ': ' +formatfloat(',0.00',DmFinancas.cdspagtosItensTOTALITEM.asfloat));
             //QrRecibo.labitens2.Lines.Add(DmFinancas.cdspagtosItensDESCRICAO_ITEM.value  + ': ' +formatfloat(',0.00',DmFinancas.cdspagtosItensTOTALITEM.asfloat));
             DmFinancas.cdspagtosItens.Next;
          end;

          QrRecibo.qrData.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',Dmfinancas.cdsPagtosDT_RECEBIMENTO.value)+'.';
          QrRecibo.qrData2.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',Dmfinancas.cdsPagtosDT_RECEBIMENTO.value)+'.';

          QrRecibo.Preview;

          finally
             QrRecibo.free;
          end;

  end
  else  // Guia ou Boleto
  begin
        If DmFinancas.cdsPagtosTP_CONTRIB_DESCRICAO.value='Sindical' then
        begin
                 //Dados da Conta e Cedente
                 DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 1);
                 DmBoleto.Guias1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.value;
                 //Alterado COBREG
                 //DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaCT_CODCEDENTE.value + Dmboleto.cdsContaCT_CODCEDENTE_DV.value;
                 DmBoleto.Guias1.Cedente.SICAS_Completo := Dmboleto.cdsContaSICASCOMPLETO.value;

                 //Alterado COBREG
                 //DmBoleto.Guias1.Cedente.SICAS_Simples := Copy(DmBoleto.Guias1.Cedente.SICAS_Completo, 7, 5);
                 DmBoleto.Guias1.Cedente.SICAS_Simples := Dmboleto.cdsContaCODSINDICAL.value;

                 DmBoleto.Guias1.Tipo_Entidade := teSindicato;

                 DmBoleto.Guias1.Cedente.Agencia := Dmboleto.cdsContaCT_AGENCIA.Value;
                 DmBoleto.Guias1.Cedente.CNPJ := Dmboleto.cdsContaCNPJ.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Rua := Dmboleto.cdsContaENDER_LOGRADOURO.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Bairro := Dmboleto.cdsContaENDER_BAIRRO.Value;
                 DmBoleto.Guias1.Cedente.Endereco.CEP := Dmboleto.cdsContaENDER_CEP.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Cidade := Dmboleto.cdsContaCIDADE_NOME.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Numero := Dmboleto.cdsContaENDER_NUMERO.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Complemento := Dmboleto.cdsContaENDER_COMPLEMENTO.Value;
                 DmBoleto.Guias1.Cedente.Endereco.Estado := Dmboleto.cdsContaESTADO_SIGLA.Value;
                 DmBoleto.Guias1.Cedente.CNAE := '461';

                 //Dados do Sacado
                 DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);

                 DmBoleto.Guias1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
                 DmBoleto.Guias1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
                 DmBoleto.Guias1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;

                 DmBoleto.cdsOutrosSind.close;
                 DmBoleto.cdsOutrosSind.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                 DmBoleto.cdsOutrosSind.Open;

                // venc := strtodate('31/10/2013');

                 Dmboleto.Guias1.Vencimento :=  DmFinancas.cdsPagtosDT_VENCIMENTO.value;
                 If pos('/', Dmfinancas.cdspagtosItensDESCRICAO_ITEM.value) = 0 then
                    Dmboleto.Guias1.Exercicio := copy(Dmfinancas.cdspagtosItensDESCRICAO_ITEM.value,14,4)
                 else
                    Dmboleto.Guias1.Exercicio := copy(Dmfinancas.cdspagtosItensDESCRICAO_ITEM.value,15,4);
      //           inttostr(ExtractYear(DmFinancas.cdsPagtosDT_VENCIMENTO.value));

                 Dmboleto.Guias1.Numero_Documento := strtoint(copy(DMAssociado.cdsAssocREGISTRO.value,1,7));

                 DmBoleto.Guias1.Sacado.Contribuinte_Mask := '999999/9999-99;0; ';
                 DmBoleto.Guias1.Sacado.Contribuinte := Copy(DMAssociado.cdsAssocREGISTRO.Value,2, 20) + Copy(DmBoleto.Guias1.Exercicio , 3,2);

                           //Instruções
                 DmBoleto.Guias1.Mensagem.Clear;
                 DmBoleto.Guias1.MensagemContrib1.Clear;
                 if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                 begin
                     DmBoleto.Guias1.Mensagem.Add('BLOQUETO DE CONTRIBUIÇÃO SINDICAL URBANA');
                     DmBoleto.Guias1.Mensagem.Add('');
                     DmBoleto.Guias1.Mensagem.Add('Até o vencimento, pagável nas Lotéricas, Correspondentes Caixa Aqui, Agências da CAIXA e Rede Bancária.');
                     DmBoleto.Guias1.Mensagem.Add('Documento vencido pagável somente nas Agências da CAIXA.');
                     DmBoleto.Guias1.Mensagem.Add('Guia vencida -  cobrar multa de 10% nos trinta primeiros dias, com adicional ');
                     DmBoleto.Guias1.Mensagem.Add('de 2% por mês subseqüente de atraso e juros de mora de 1% ao mês e correção monetária (Selic).');
                    // DmBoleto.Guias1.MensagemContrib1.Add('');
                 end;
                 DmBoleto.Guias1.MensagemContrib1.Add('Esta guia não quita débitos anteriores.');

                 if DmBoleto.cdsOutrosSindQTDE.value = 1 then
                              DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicato.')
                 else
                 if DmBoleto.cdsOutrosSind.RecordCount > 1 then
                              DmBoleto.Guias1.MensagemContrib1.Add('Obs: Filiado paga para ' +IntToStr(DmBoleto.cdsOutrosSindQTDE.Value) +' Sindicatos.');

              DmBoleto.Guias1.Sacado.Capital_Social := 0;
                If DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
                begin
                       DmBoleto.Guias1.Tipo_pessoa:='J';
                       DMAssociado.cdsPegaCapSocial.close;
                       DMAssociado.cdsPegaCapSocial.params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
                       DMAssociado.cdsPegaCapSocial.params.ParamByName('dataatual').value := DataAtual;
                       DMAssociado.cdsPegaCapSocial.params.ParamByName('vencimento').value := Dmfinancas.cdsPagtosDT_VENCIMENTO.value;
                       DMAssociado.cdsPegaCapSocial.Open;


                       {If DMAssociado.cdsPegaCapSocial.RecordCount = 0 then
                       begin
                          DMAssociado.cdsPegaCapSocial.close;
                          DMAssociado.cdsPegaCapSocial.params.ParamByName('data').value := DataAtual;
                          DMAssociado.cdsPegaCapSocial.Open;
                       end;
                        }

                             DMAssociado.cdsPegaCapSocial.Open;
                             If DMAssociado.cdsPegaCapSocial.RecordCount > 0 then
                                   DmBoleto.Guias1.Sacado.Capital_Social := DMAssociado.cdsPegaCapSocialVALOR.AsFloat ;
                end
                else
                   DmBoleto.Guias1.Tipo_pessoa:='F';

               DmBoleto.Guias1.Valores.Contribuicao    :=  DmFinancas.cdsPagtosVALOR_RECEBIMENTO.asfloat ;

               DmBoleto.Guias1.Valores.Abatimento      := 0;
               DmBoleto.Guias1.Valores.Deducao         := 0;

              sdsCapGuia.Close;
              sdsCapGuia.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
              If Dmassociado.cdsAssocDT_REGISTRO.value <= Dmboleto.Guias1.Vencimento then
                 sdsCapGuia.Params.ParamByName('vencimento').value := Dmboleto.Guias1.Vencimento
              else
                 sdsCapGuia.Params.ParamByName('vencimento').value := Dmassociado.cdsAssocDT_REGISTRO.value;
              sdsCapGuia.Params.ParamByName('dataatual').value := DataAtual;
              sdsCapGuia.open;

              If sdsCapGuia.RecordCount > 0 then
                 DmBoleto.Guias1.Sacado.Capital_Social := sdsCapGuia.fieldbyname('valor').value;

              //DmBoleto.Guias1.Visualizar;

              if DMConexao.sdsConfigCOBRREGISTRADA.value = 0 then
                   DmBoleto.Guias1.Imprimir
              else
                   DmBoleto.Guias1.Imprimir_CR;

        end
        else
        If DmFinancas.cdsPagtosTP_CONTRIB_DESCRICAO.value='Confederativa' then
        begin

               // Venc := strtodate('31/10/2013');

                 //Dados da Conta e Cedente
                 DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 2);
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Codigo :=  DmBoleto.cdsContaBAN_CODIGO.AsString;
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.Banco.Digito := DmBoleto.cdsContaBAN_DIGITO.AsString;
                 DmBoleto.gbTitulo1.SeuNumero := '';
                 DmBoleto.gbTitulo1.DataDocumento := Dataatual;
                 DmBoleto.gbTitulo1.DataProcessamento := Dataatual;

                 DmBoleto.gbTitulo1.Cedente.TipoInscricao := tiPessoaJuridica;
                 DmBoleto.gbTitulo1.Cedente.CodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE.AsString;
                 DmBoleto.gbTitulo1.Cedente.DigitoCodigoCedente := DmBoleto.cdsContaCT_CODCEDENTE_DV.AsString;

                 DmBoleto.gbTitulo1.EspecieDocumento:= edDuplicataMercantil;
                 DmBoleto.gbTitulo1.LocalPagamento := 'PREFERENCIAMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE';

                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.NomeCliente := DmBoleto.cdsContaCT_NOMECLIENTE.AsString;
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := DmBoleto.cdsContaCT_AGENCIA.AsString;
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := DmBoleto.cdsContaCT_AGENCIA_DV.AsString;
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.NumeroConta := DmBoleto.cdsContaCT_CONTA.AsString;
                 DmBoleto.gbTitulo1.Cedente.ContaBancaria.DigitoConta := DmBoleto.cdsContaCT_CONTA_DV.AsString;
                 DmBoleto.gbTitulo1.Cedente.Nome := DmBoleto.cdsContaCT_NOMECLIENTE.AsString + ' - CNPJ: '+ MaskCPFCGC(DmBoleto.cdsContaCNPJ.value);
                 DmBoleto.gbTitulo1.Cedente.Endereco.Rua := DmBoleto.cdsContaENDER_LOGRADOURO.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.Numero := DmBoleto.cdsContaENDER_NUMERO.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.Complemento := DmBoleto.cdsContaENDER_COMPLEMENTO.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.CEP := DmBoleto.cdsContaENDER_CEP.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.Bairro := DmBoleto.cdsContaENDER_BAIRRO.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.Cidade := DmBoleto.cdsContaCIDADE_NOME.AsString;
                 DmBoleto.gbTitulo1.Cedente.Endereco.Estado := DmBoleto.cdsContaESTADO_SIGLA.AsString;
                 //Fim dados do Cedente

                 Valor_Boleto := DmFinancas.cdsPagtosVALOR_RECEBIMENTO.asfloat;

                 Dmboleto.gbTitulo1.Instrucoes.Clear;

                 If DmFinancas.cdspagtosItens.RecordCount = 1 then
                    Dmboleto.gbTitulo1.Instrucoes.Add( DmFinancas.cdspagtosItensDESCRICAO_ITEM.value + ' (Confederativa): ' + formatfloat(',0.00 ', Valor_Boleto))
                 else
                    Dmboleto.gbTitulo1.Instrucoes.Add( DmFinancas.cdspagtosItensDESCRICAO_ITEM.value +  ' e outros (Confederativa): ' + formatfloat(',0.00 ', Valor_Boleto));

                 DmBoleto.gbTitulo1.ValorDocumento := Valor_Boleto;

                 DmBoleto.gbTitulo1.DataVencimento :=  DmFinancas.cdsPagtosDT_VENCIMENTO.value;

                 DmBoleto.gbTitulo1.Instrucoes.Add('Não receber após o Vencimento.');

                 //If (copy(DmFinancas.cdsPagtosNOSSONUMERO.value,1,2) ='24') and (length(DmFinancas.cdsPagtosNOSSONUMERO.value) =17 ) then
                 If (copy(DmFinancas.cdsPagtosNOSSONUMERO.value,1,2) ='14') and (length(DmFinancas.cdsPagtosNOSSONUMERO.value) =17 ) then
                    DmBoleto.gbTitulo1.NossoNumero := DmFinancas.cdsPagtosNOSSONUMERO.value
                 else
                 begin
                    DmBoleto.sdsNossoNumero.close;
                    DmBoleto.sdsNossoNumero.Open;
                    //DmBoleto.gbTitulo1.NossoNumero := '24' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);
                    DmBoleto.gbTitulo1.NossoNumero := '14' + inttostr(DmBoleto.cdsContaEMP_ID.value)+ copy(DmBoleto.sdsNossoNumeroNOSSONUMERO.value,1,14);
                 end;

                 DmBoleto.gbTitulo1.Carteira := 'SR';

                 //Dados do Sacado
                 DmBoleto.DadosSacado(DMAssociado.cdsAssocASS_ID.value);
                 DmBoleto.gbTitulo1.Sacado.Nome := DmBoleto.cdsDadosAssocNOME.value;
                 DmBoleto.gbTitulo1.Sacado.NumeroCPFCGC := DmBoleto.cdsDadosAssocCPFCNPJ.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Bairro := DmBoleto.cdsDadosAssocEND_BAIRRO.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.CEP := DmBoleto.cdsDadosAssocEND_CEP.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Cidade := DmBoleto.cdsDadosAssocCIDADE_NOME.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Complemento := DmBoleto.cdsDadosAssocEND_COMPLEMENTO.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Estado := DmBoleto.cdsDadosAssocESTADO_SIGLA.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Numero := DmBoleto.cdsDadosAssocEND_NUMERO.AsString;
                 DmBoleto.gbTitulo1.Sacado.Endereco.Rua := DmBoleto.cdsDadosAssocEND_LOGRADOURO.AsString;
                 DmBoleto.gbTitulo1.NumeroDocumento := DmBoleto.cdsDadosAssocREGISTRO.value;

                 if DmBoleto.cdsDadosAssocTP_ASSOC_ID.asinteger = 2 then
                    DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica
                 else
                    DmBoleto.gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;


                 //Dmboleto.gbTitulo1.Visualiazar_SIGCB;

                 Dmboleto.gbTitulo1.Imprimir_SIGCB;

                 Aviso('Boleto impresso com sucesso. ');

        end;
  end;
end;

procedure TfrmNovoAssoc.spReciboClick(Sender: TObject);
var
  recibo:string;
  bol_id, conta:integer;
  textoitem:string;
begin
  inherited;
  if DmFinancas.dsDebitosAnuidades.dataset.recordcount = 0 then
  begin
      abort;
  end;

  try Application.CreateForm(TfrmBoleto,frmBoleto);
  frmBoleto.cbGuiaComplementar.Checked:=false;
  frmBoleto.cbGuiaComplementar.Visible:=false;

  DmFinancas.cdsContribsRecibo.close;
  DmFinancas.cdsContribsRecibo.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
  DmFinancas.cdsContribsRecibo.Params.ParamByName('tipo').value := 'A';
  DmFinancas.cdsContribsRecibo.Params.ParamByName('dataatual').value := DataAtual;
  DmFinancas.cdsContribsRecibo.Open;

  frmBoleto.cdsAnuidades.CreateDataSet;
  If DmFinancas.cdsContribsRecibo.RecordCount > 0 then
  begin
     DmFinancas.cdsContribsRecibo.first;
     While not DmFinancas.cdsContribsRecibo.eof do
     begin
         frmBoleto.cdsAnuidades.Append;
         frmBoleto.cdsAnuidades.Edit;
         frmBoleto.cdsAnuidadesAno.value := DmFinancas.cdsContribsRecibo.fieldbyname('ANO').value;
         frmBoleto.cdsAnuidadesAnuid_Id.value := DmFinancas.cdsContribsRecibo.fieldbyname('ANUID_ID').value;
         frmBoleto.cdsAnuidadesCorrecao.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('CORRECAO').value;
         frmBoleto.cdsAnuidadesDescricao.value := DmFinancas.cdsContribsRecibo.fieldbyname('DESCRTIPO').value;
         frmBoleto.cdsAnuidadesJuros.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('JUROS').value;
         frmBoleto.cdsAnuidadesMulta.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('MULTA').value;
         frmBoleto.cdsAnuidadesNum_Parcela.value := DmFinancas.cdsContribsRecibo.fieldbyname('NUM_PARCELA').value;
         frmBoleto.cdsAnuidadesParc_Id.value := DmFinancas.cdsContribsRecibo.fieldbyname('PARC_ID').value;
         frmBoleto.cdsAnuidadesTipoContrib.value := DmFinancas.cdsContribsRecibo.fieldbyname('TIPOCONTRIB').value;
         frmBoleto.cdsAnuidadestotal.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('TOTAL').value;
         frmBoleto.cdsAnuidadesTpContrib_id.value := DmFinancas.cdsContribsRecibo.fieldbyname('TPCONTRIB_ID').value;
         frmBoleto.cdsAnuidadesValor.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('VALOR').value;
         frmBoleto.cdsAnuidadesVencimento.value := DmFinancas.cdsContribsRecibo.fieldbyname('VENCIMENTO').value;
         frmBoleto.cdsAnuidades.Post;
         DmFinancas.cdsContribsRecibo.Next;
     end;
     frmBoleto.cdsAnuidades.First;
  end;

  frmBoleto.grid1.Columns[2].Visible:=false ;
  frmBoleto.grid1.Columns[1].Width := 380;
  frmBoleto.Caption :='::: Gerar Recibo :::';
  frmBoleto.labtexto.caption:='Selecione os Ítens para compor o Recibo.';
  tipo:='Recibo';
  if frmBoleto.showmodal = mrok then
  begin

      try
          DMConexao.StartTransaction;

          Try application.createform(TQrRecibo,QrRecibo);

          QrRecibo.qrlEmpresa.caption := Stringreplace(QrRecibo.qrlEmpresa.caption,'<<localidade>>',Dmassociado.cdsEmp_regiaoREGIAO.value, [rfReplaceAll]);

          if  Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
              FreeAndNil(QrRecibo.qrimage1);
              FreeAndNil(QrRecibo.qrimage2);
              QrRecibo.qrlEmpresa.left := QrRecibo.qrlEmpresa.left -70;
              QrRecibo.QRShape6.left := QrRecibo.QRShape6.left -70;
              QrRecibo.LabEndereco1.left := QrRecibo.LabEndereco1.left -70;
              QrRecibo.labEndereco2.left := QrRecibo.labEndereco2.left -70;
              QrRecibo.labEndereco3.left := QrRecibo.labEndereco3.left -70;
              QrRecibo.labEndereco4.left := QrRecibo.labEndereco4.left -70;
              QrRecibo.QRLabel16.left := QrRecibo.QRLabel16.left -70;
              QrRecibo.QRShape18.left := QrRecibo.QRShape18.left -70;
              QrRecibo.QRLabel9.left := QrRecibo.QRLabel9.left -70;
              QrRecibo.QRLabel18.left := QrRecibo.QRLabel18.left -70;
              QrRecibo.QRLabel20.left := QrRecibo.QRLabel20.left -70;
              QrRecibo.QRLabel19.left := QrRecibo.QRLabel19.left -70;
          end;

          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Município' then
          begin
             QrRecibo.LabEndereco1.caption := 'Av. Graça Aranha, 416 - Sls. 424/425 e 1108 a 1110 - Centro - CEP 20030-001';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2524-2859 / 2210-1838 - E-mail: sindicato@sircomrj.com.br - Site: www.sircomrj.com.br';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 30/11/1943';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 34.046.375/0001-04';
             conta := 9;
          end
          else
          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
             QrRecibo.LabEndereco1.caption := 'Rua Dr. Borman, nº 6 - Sala 204 - Niterói - RJ - CEP 24020-320';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2717-8261 / 2524-2859';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 16/11/1967';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 30.141.717/0001-14';
             conta := 10;
          end;

          QrRecibo.qrmCedente1.lines.add('Nome: '+Dmassociado.cdsAssocNOME.value);
          If DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CNPJ: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value))
          else
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CPF: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value)) ;

          QrRecibo.qrmCedente2.lines.Assign(QrRecibo.qrmCedente1.lines);

          QrRecibo.labpagto.caption := datetostr(DataAtual);


          dmassociado.sdsReciboPrint.CLOSE;
          dmassociado.sdsReciboPrint.Params[0].VALUE := Dmassociado.cdsAssocEMP_ID.value;
          dmassociado.sdsReciboPrint.Params[1].VALUE := 1;
          dmassociado.sdsReciboPrint.Open;
          recibo := dmassociado.sdsReciboPrintrecibo.value;
          dmassociado.sdsReciboPrint.close;

          QrRecibo.labrecibo.caption := recibo;
          QrRecibo.qrlTotal1.caption := 'R$ ' + frmBoleto.labtotal.caption;
          //criando o boleto
          try
               bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
               DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
               DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := DMAssociado.cdsAssocASS_ID.value;
               DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := conta;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dataatual;
               DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
               DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := strtofloat(stringreplace(frmboleto.labtotal.caption,'.','',[rfReplaceAll]));
               DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := recibo;
               DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 2;
               DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
               DmBoleto.PROC_BOLETO_I.ExecProc;
           except
               Erro('Erro gerando o boleto nº ' + recibo);

              dmassociado.sdsReciboPrint.CLOSE;
              dmassociado.sdsReciboPrint.Params[0].VALUE := Dmassociado.cdsAssocEMP_ID.value;
              dmassociado.sdsReciboPrint.Params[1].VALUE := -1;
              dmassociado.sdsReciboPrint.Open;
              dmassociado.sdsReciboPrint.close;

               abort;
           end;

          
          frmBoleto.cdsAnuidades.First;
          while not frmBoleto.cdsAnuidades.eof do
          begin
               If frmBoleto.cdsAnuidadesSelecionado.Value = true then
               begin

                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmBoleto.cdsAnuidadesValor.AsFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := frmBoleto.cdsAnuidadesMulta.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := frmBoleto.cdsAnuidadesJuros.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := frmBoleto.cdsAnuidadesCorrecao.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

                   textoitem :=frmBoleto.cdsAnuidadesDescricao.value;
                   if pos('Sindical',frmBoleto.cdsAnuidadesDescricao.value) > 0 then
                       textoitem := StringReplace (StringReplace (frmBoleto.cdsAnuidadesDescricao.value,'Contribuição ', 'Contribuição Sindical ',[rfReplaceall]),'- Sindical', '',[rfReplaceall])
                   else
                   if pos('Confederativa',frmBoleto.cdsAnuidadesDescricao.value) > 0 then
                       textoitem := StringReplace (StringReplace (frmBoleto.cdsAnuidadesDescricao.value,'Contribuição ', 'Contribuição Confederativa ',[rfReplaceall]),'- Confederativa', '',[rfReplaceall]);
                   QrRecibo.labitens.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.asfloat));
                   QrRecibo.labitens2.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.asfloat));


                  //  QrRecibo.labitens.Lines.Add(frmBoleto.cdsAnuidadesDescricao.value + ': ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.AsFloat));
                 //   QrRecibo.labitens2.Lines.Add(frmBoleto.cdsAnuidadesDescricao.value + ': ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.AsFloat));
               end;

               frmBoleto.cdsAnuidades.Next;

          end;

          DMConexao.Log('Geração de Recibo: ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Num.Recibo:'+Recibo , 'O', DMAssociado.cdsAssocASS_ID.value);

          QrRecibo.qrData.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';
          QrRecibo.qrData2.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';

          QrRecibo.Preview;

          If Confirma('Confirma baixa no recibo de nº ' + Recibo+'? ') then
          begin
              Try
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Close;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('PAGO').value := 1;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('BOL_ID').value :=  bol_id;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_RECEBIMENTO').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_CREDITO').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_BAIXA').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('MULTA_PAGA').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('JUROS_PAGO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('CORRECAO_PAGA').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DESCONTO_PAGTO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('ENCARGOS_PAGO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('VALOR_RECEBIMENTO').value :=DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('FORMA_PAGTO').value :='Baixa Recibo';
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.ExecProc;
              except
                  Erro('Erro ao baixar o pagamento do recibo ' + recibo);
              end;
          end
          else
          If Confirma('Deseja cancelar o recibo de nº ' + Recibo+'? ') then
          begin
             DMConexao.ExecSQL('update boleto set   tp_status_id = 2    where nossonumero = ' + QuotedStr(recibo));
          end;

          finally
             QrRecibo.free;
          end;

          DMConexao.Commit;



        //Débitos Anuidades
         DmFinancas.cdsDebitosAnuidades.close;
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('tipo').value := 'A';
         DmFinancas.cdsDebitosAnuidades.Params.ParamByName('dataatual').value := DataAtual;
         DmFinancas.cdsDebitosAnuidades.Open;



         //Pagamentos
         DmFinancas.cdsPagtos.close;
         DmFinancas.cdsPagtos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
         DmFinancas.cdsPagtos.open;
         iF DmFinancas.cdsPagtos.RecordCount = 0 then
             DmFinancas.cdspagtosItens.close;

      except
          DMConexao.Rollback;
      end;


  end;

  finally
    frmBoleto.free;
  end;
end;

procedure TfrmNovoAssoc.spReciboParcelamentoClick(Sender: TObject);
var
  recibo:string;
  bol_id, conta:integer;
  textoitem:string;
begin
  inherited;

 If Dmfinancas.cdsParcelamentoVALOR_TOTAL.asfloat > 0 then
 begin
     aviso('Este parcelamento é do método antigo, deve ser tratado na opção Manutenção.  ');
     exit;
 end;

 if DmFinancas.dsParcelamento.dataset.Active = true then
 begin
    if DmFinancas.dsParcelamento.dataset.recordcount > 0 then
    begin
      If DmFinancas.dsParcelamento.DataSet.FieldByName('TP_STATUS_DESCR').value <>'Ativo' then
      begin
         Aviso('O Parcelamento selecionado está cancelado. ');
         Abort;
      end;
    end
    else
       abort;
 end
 else
    abort;


  try Application.CreateForm(TfrmBoleto,frmBoleto);
  frmBoleto.cbGuiaComplementar.Checked:=false;
  frmBoleto.cbGuiaComplementar.Visible:=false;

  DmFinancas.cdsContribsRecibo.close;
  DmFinancas.cdsContribsRecibo.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
  DmFinancas.cdsContribsRecibo.Params.ParamByName('tipo').value := 'A';
  DmFinancas.cdsContribsRecibo.Params.ParamByName('dataatual').value := DataAtual;
  DmFinancas.cdsContribsRecibo.Open;

  frmBoleto.cdsAnuidades.CreateDataSet;
  If DmFinancas.cdsContribsRecibo.RecordCount > 0 then
  begin
     DmFinancas.cdsContribsRecibo.first;
     While not DmFinancas.cdsContribsRecibo.eof do
     begin
         If Dmfinancas.cdsParcelAnuidades.Locate('anuid_id',DmFinancas.cdsContribsReciboANUID_ID.value, [] ) then
         begin
             frmBoleto.cdsAnuidades.Append;
             frmBoleto.cdsAnuidades.Edit;
             frmBoleto.cdsAnuidadesAno.value := DmFinancas.cdsContribsRecibo.fieldbyname('ANO').value;
             frmBoleto.cdsAnuidadesAnuid_Id.value := DmFinancas.cdsContribsRecibo.fieldbyname('ANUID_ID').value;
             frmBoleto.cdsAnuidadesCorrecao.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('CORRECAO').value;
             frmBoleto.cdsAnuidadesDescricao.value := DmFinancas.cdsContribsRecibo.fieldbyname('DESCRTIPO').value;
             frmBoleto.cdsAnuidadesJuros.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('JUROS').value;
             frmBoleto.cdsAnuidadesMulta.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('MULTA').value;
             frmBoleto.cdsAnuidadesNum_Parcela.value := DmFinancas.cdsContribsRecibo.fieldbyname('NUM_PARCELA').value;
             frmBoleto.cdsAnuidadesParc_Id.value := DmFinancas.cdsContribsRecibo.fieldbyname('PARC_ID').value;
             frmBoleto.cdsAnuidadesTipoContrib.value := DmFinancas.cdsContribsRecibo.fieldbyname('TIPOCONTRIB').value;
             frmBoleto.cdsAnuidadestotal.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('TOTAL').value;
             frmBoleto.cdsAnuidadesTpContrib_id.value := DmFinancas.cdsContribsRecibo.fieldbyname('TPCONTRIB_ID').value;
             frmBoleto.cdsAnuidadesValor.asfloat := DmFinancas.cdsContribsRecibo.fieldbyname('VALOR').value;
             frmBoleto.cdsAnuidadesVencimento.value := DmFinancas.cdsContribsRecibo.fieldbyname('VENCIMENTO').value;
             frmBoleto.cdsAnuidades.Post;
         end;
         DmFinancas.cdsContribsRecibo.Next;
     end;
     frmBoleto.cdsAnuidades.First;
  end;

  If frmBoleto.cdsAnuidades.RecordCount = 0 then
  begin
      Aviso('Não existe anuidade para ser baixada. ');
      Abort;
  end;

  frmBoleto.grid1.Columns[2].Visible:=false ;
  frmBoleto.grid1.Columns[1].Width := 380;
  frmBoleto.Caption :='::: Gerar Recibo :::';
  frmBoleto.labtexto.caption:='Selecione os Ítens para compor o Recibo.';
  tipo:='Recibo';
  if frmBoleto.showmodal = mrok then
  begin

      try
          DMConexao.StartTransaction;

          Try application.createform(TQrRecibo,QrRecibo);

          QrRecibo.qrlEmpresa.caption := Stringreplace(QrRecibo.qrlEmpresa.caption,'<<localidade>>',Dmassociado.cdsEmp_regiaoREGIAO.value, [rfReplaceAll]);

          if  Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
              FreeAndNil(QrRecibo.qrimage1);
              FreeAndNil(QrRecibo.qrimage2);
              QrRecibo.qrlEmpresa.left := QrRecibo.qrlEmpresa.left -70;
              QrRecibo.QRShape6.left := QrRecibo.QRShape6.left -70;
              QrRecibo.LabEndereco1.left := QrRecibo.LabEndereco1.left -70;
              QrRecibo.labEndereco2.left := QrRecibo.labEndereco2.left -70;
              QrRecibo.labEndereco3.left := QrRecibo.labEndereco3.left -70;
              QrRecibo.labEndereco4.left := QrRecibo.labEndereco4.left -70;
              QrRecibo.QRLabel16.left := QrRecibo.QRLabel16.left -70;
              QrRecibo.QRShape18.left := QrRecibo.QRShape18.left -70;
              QrRecibo.QRLabel9.left := QrRecibo.QRLabel9.left -70;
              QrRecibo.QRLabel18.left := QrRecibo.QRLabel18.left -70;
              QrRecibo.QRLabel20.left := QrRecibo.QRLabel20.left -70;
              QrRecibo.QRLabel19.left := QrRecibo.QRLabel19.left -70;
          end;
        


          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Município' then
          begin
             QrRecibo.LabEndereco1.caption := 'Av. Graça Aranha, 416 - Sls. 424/425 e 1108 a 1110 - Centro - CEP 20030-001';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2524-2859 / 2210-1838 - E-mail: sindicato@sircomrj.com.br - Site: www.sircomrj.com.br';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 30/11/1943';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 34.046.375/0001-04';
             conta := 9;
          end
          else
          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
             QrRecibo.LabEndereco1.caption := 'Rua Dr. Borman, nº 6 - Sala 204 - Niterói - RJ - CEP 24020-320';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2717-8261 / 2524-2859';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 16/11/1967';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 30.141.717/0001-14';
             conta := 10;
          end;

          QrRecibo.qrmCedente1.lines.add('Nome: '+Dmassociado.cdsAssocNOME.value);
          If DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CNPJ: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value))
          else
              QrRecibo.qrmCedente1.lines.add('Cadastro Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CPF: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value)) ;

          QrRecibo.qrmCedente2.lines.Assign(QrRecibo.qrmCedente1.lines);

          QrRecibo.labpagto.caption := datetostr(DataAtual);


          dmassociado.sdsReciboPrint.CLOSE;
          dmassociado.sdsReciboPrint.Params[0].VALUE := Dmassociado.cdsAssocEMP_ID.value;
          dmassociado.sdsReciboPrint.Params[1].VALUE := 1;
          dmassociado.sdsReciboPrint.Open;
          recibo := dmassociado.sdsReciboPrintrecibo.value;
          dmassociado.sdsReciboPrint.close;

          QrRecibo.labrecibo.caption := recibo;
          QrRecibo.qrlTotal1.caption := 'R$ ' +frmBoleto.labtotal.caption;
          //criando o boleto
          try
               bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
               DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
               DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := DMAssociado.cdsAssocASS_ID.value;
               DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := conta;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dataatual;
               DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
               DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := strtofloat(stringreplace(frmboleto.labtotal.caption,'.','',[rfReplaceAll]));
               DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := recibo;
               DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 2;
               DmBoleto.PROC_BOLETO_I.ParamByName('COMREGISTRO').Value := DMConexao.sdsConfigCOBRREGISTRADA.value;
               DmBoleto.PROC_BOLETO_I.ExecProc;
           except
                Erro('Erro gerando o boleto nº ' + recibo);
                dmassociado.sdsReciboPrint.CLOSE;
                dmassociado.sdsReciboPrint.Params[0].VALUE := Dmassociado.cdsAssocEMP_ID.value;
                dmassociado.sdsReciboPrint.Params[1].VALUE := -1;
                dmassociado.sdsReciboPrint.Open;
                dmassociado.sdsReciboPrint.CLOSE;
               abort;
           end;

          
          frmBoleto.cdsAnuidades.First;
          while not frmBoleto.cdsAnuidades.eof do
          begin
               If frmBoleto.cdsAnuidadesSelecionado.Value = true then
               begin

                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := 0;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := frmBoleto.cdsAnuidadesAnuid_Id.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := frmBoleto.cdsAnuidadesDescricao.value;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := frmBoleto.cdsAnuidadesValor.AsFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := frmBoleto.cdsAnuidadesMulta.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := frmBoleto.cdsAnuidadesJuros.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := frmBoleto.cdsAnuidadesCorrecao.asFloat;
                    DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

                   textoitem :=frmBoleto.cdsAnuidadesDescricao.value;
                   if pos('Sindical',frmBoleto.cdsAnuidadesDescricao.value) > 0 then
                       textoitem := StringReplace (StringReplace (frmBoleto.cdsAnuidadesDescricao.value,'Contribuição ', 'Contribuição Sindical ',[rfReplaceall]),'- Sindical', '',[rfReplaceall])
                   else
                   if pos('Confederativa',frmBoleto.cdsAnuidadesDescricao.value) > 0 then
                       textoitem := StringReplace (StringReplace (frmBoleto.cdsAnuidadesDescricao.value,'Contribuição ', 'Contribuição Confederativa ',[rfReplaceall]),'- Confederativa', '',[rfReplaceall]);
                   QrRecibo.labitens.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.asfloat));
                   QrRecibo.labitens2.Lines.Add(textoitem  + ': R$ ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.asfloat));


                    //QrRecibo.labitens.Lines.Add(frmBoleto.cdsAnuidadesDescricao.value + ': ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.AsFloat));
                   // QrRecibo.labitens2.Lines.Add(frmBoleto.cdsAnuidadesDescricao.value + ': ' +formatfloat(',0.00',frmBoleto.cdsAnuidadestotal.AsFloat));
               end;

               frmBoleto.cdsAnuidades.Next;

          end;

          DMConexao.Log('Geração de Recibo: ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Num.Recibo:'+Recibo , 'O', DMAssociado.cdsAssocASS_ID.value);


          QrRecibo.qrData.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';
          QrRecibo.qrData2.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';
          
          QrRecibo.Preview;

          If Confirma('Confirma baixa no recibo de nº ' + Recibo+'? ') then
          begin
              Try
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Close;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('PAGO').value := 1;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('BOL_ID').value :=  bol_id;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_RECEBIMENTO').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_CREDITO').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_BAIXA').value :=DataAtual;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('MULTA_PAGA').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('JUROS_PAGO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('CORRECAO_PAGA').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DESCONTO_PAGTO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('ENCARGOS_PAGO').value :=0;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('VALOR_RECEBIMENTO').value :=DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value;
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('FORMA_PAGTO').value :='Baixa Recibo';
              DmFinancas.PROC_BOLETO_PAGAR_MANUAL.ExecProc;
              except
                  Erro('Erro ao baixar o pagamento do recibo ' + recibo);
              end;
          end
          else
          If Confirma('Deseja cancelar o recibo de nº ' + Recibo+'? ') then
          begin
             DMConexao.ExecSQL('update boleto set   tp_status_id = 2    where nossonumero = ' + QuotedStr(recibo));
          end;

          finally
             QrRecibo.free;
          end;

          DMConexao.Commit;

        //atualizando os dados do parcel
        Dmfinancas.cdsParcelAnuidades.close;
        Dmfinancas.cdsParcelAnuidades.open;
        Dmfinancas.cdsParcelasParc.close;
        Dmfinancas.cdsParcelasParc.Open;
        DmFinancas.cdsDebitosAnuidades.close;
        DmFinancas.cdsDebitosAnuidades.open;

         //Pagamentos
         DmFinancas.cdsPagtos.close;
         DmFinancas.cdsPagtos.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
         DmFinancas.cdsPagtos.open;
         iF DmFinancas.cdsPagtos.RecordCount = 0 then
             DmFinancas.cdspagtosItens.close;

      except
          DMConexao.Rollback;
      end;


  end;

  finally
    frmBoleto.free;
  end;
end;

procedure TfrmNovoAssoc.VerExistemeLote;
begin
  DMAssociado.sdsVerExisteLoteitem.close;
  DMAssociado.sdsVerExisteLoteitem.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.Value;
  DMAssociado.sdsVerExisteLoteitem.open;
  if DMAssociado.sdsVerExisteLoteitemQTDE.Value > 0 then
  begin
      ExisteemLote :=1;
      tmrExisteLote.Enabled := True;
  end
  else
  begin
     ExisteemLote :=0;
     LabelLoteExiste.Visible := False;
     tmrExisteLote.Enabled := false;
  end;

end;

procedure TfrmNovoAssoc.tmrExisteLoteTimer(Sender: TObject);
begin
  inherited;
  LabelLoteExiste.Visible := not LabelLoteExiste.Visible;
end;

procedure TfrmNovoAssoc.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
   if DMAssociado.dsLocMoviment.DataSet.FieldByName('tp_mov_id').Value = 3 then
   begin
      labPedido.Visible := True;
      dbtxtDT_MOV.Visible := True;
   end
   else
   begin
      labPedido.Visible := false;
      dbtxtDT_MOV.Visible := false;
   end

end;

procedure TfrmNovoAssoc.TermodeParcelamento;
var ender, anuidades:string;
  i:integer;
begin
       if DmFinancas.dsParcelamento.dataset.FieldByName('valor_total').value > 0 then
       begin


            Try application.CreateForm(TQRParcelamento,QRParcelamento);
            SetRichEditAdvOption(TRichEdit(QRParcelamento.QRMemo1));
            QRParcelamento.labtotal.caption := formatfloat(',0.00', DmFinancas.dsParcelamento.DataSet.fieldbyname('valor_total').value);
            QRParcelamento.labregistro.caption := copy(DMAssociado.dsAssoc.dataset.fieldbyname('registro').value,1,7) +'/'+ copy(DMAssociado.dsAssoc.dataset.fieldbyname('registro').value,8,4);
            QRParcelamento.labExercicio.caption := DmFinancas.dsParcelamento.DataSet.fieldbyname('descricao_parc').value;
            QRParcelamento.LABLOCALIDADE.caption:=stringreplace(UpperCase(DMAssociado.dsEmp_Regiao.dataset.fieldbyname('regiao').value),'í','Í',[rfreplaceall])+ ' DO RIO DE JANEIRO';
            QRParcelamento.labnome.Caption:= DMAssociado.dsAssoc.dataset.fieldbyname('nome').value;
            QRParcelamento.labdata.Caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DmFinancas.dsParcelamento.DataSet.fieldbyname('dt_parcel').value)+'.';
            QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'<#nome#>',DMAssociado.dsAssoc.dataset.fieldbyname('nome').value,[rfReplaceall,rfIgnoreCase]);
            QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'<#cpfcnpj#>', MaskCPFCGC(DMAssociado.dsAssoc.dataset.fieldbyname('CPFCNPJ').value),[rfReplaceall,rfIgnoreCase]);
            If POS('Confederativa',DmFinancas.dsParcelamento.DataSet.FieldByName('DESCRICAO_PARC').value) > 0  then
                   QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'Sindicais', 'Confederativas',[rfReplaceall,rfIgnoreCase]);

            IF NOT DMAssociado.dsLocEnder.dataset.Locate('END_CORRESP','Sim',[]) THEN
            begin
               aviso('Endereço de Correspondência não cadastrado. ');
               exit;
            end
            else
            begin
               ender := DMAssociado.dsLocEnder.dataset.fieldbyname('end_logradouro').value;

               If (DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value<>'') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value<>NULL) then
                  ender := ender + ', ' +DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value;

               if (DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value <> '') and (DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value <> null) then
                   ender := ender +' - ' +DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value;

               if (DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value <> '') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value <> NULL) then
                  ender := ender +', '+ DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value;

               if (DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value <> '') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value <> NULL) then
                  ender := ender +' - '+ DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value;

               if (DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value <> '')AND (DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value <> NULL) then
                  ender := ender +'/'+DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value;

               QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'<#endereco#>',ENDER, [rfReplaceall]);
            end;

            //Anuidades
            anuidades:='';
            if DmFinancas.dsParcelAnuidades.DataSet.recordcount = 1 then
               QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'<#anuidades#>',inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value)), [rfReplaceall])
            else
            begin

                DmFinancas.dsParcelAnuidades.DataSet.first;


                for i:= 1 to DmFinancas.dsParcelAnuidades.DataSet.recordcount -1 do
                begin
                   if pos(inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value)),anuidades) = 0 then
                   begin
                    If i=1 then
                       anuidades:=inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value))
                    else
                       anuidades:=anuidades+', ' + inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value));
                   end;
                    DmFinancas.dsParcelAnuidades.DataSet.next;
                end;

                if pos(inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value)),anuidades) = 0 then
                    anuidades:=anuidades+' e ' + inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value));

                QRParcelamento.QRMemo1.lines.text:=StringReplace(QRParcelamento.QRMemo1.lines.text,'<#anuidades#>',anuidades, [rfReplaceall]);
            end;

            QRParcelamento.print;
            finally
            QRParcelamento.free;
            end;
           end

       else // Novos Parcelamentos
       begin
                Try application.CreateForm(TQRParcelamentoNovo,QRParcelamentoNovo);
                SetRichEditAdvOption(TRichEdit(QRParcelamentoNovo.QRMemo1));
                QRParcelamentoNovo.labregistro.caption := copy(DMAssociado.dsAssoc.dataset.fieldbyname('registro').value,1,7) +'/'+ copy(DMAssociado.dsAssoc.dataset.fieldbyname('registro').value,8,4);
                QRParcelamentoNovo.LABLOCALIDADE.caption:=stringreplace(UpperCase(DMAssociado.dsEmp_Regiao.dataset.fieldbyname('regiao').value)+ ' DO RIO DE JANEIRO','í','Í',[rfreplaceAll]);
                QRParcelamentoNovo.labnome.Caption:= DMAssociado.dsAssoc.dataset.fieldbyname('nome').value;
                QRParcelamentoNovo.labdata.Caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DmFinancas.dsParcelamento.DataSet.fieldbyname('dt_parcel').value)+'.';
                QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#nome#>',DMAssociado.dsAssoc.dataset.fieldbyname('nome').value,[rfReplaceall,rfIgnoreCase]);
                QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#cpfcnpj#>', MaskCPFCGC(DMAssociado.dsAssoc.dataset.fieldbyname('CPFCNPJ').value),[rfReplaceall,rfIgnoreCase]);
                If POS('Confederativa',DmFinancas.dsParcelamento.DataSet.FieldByName('DESCRICAO_PARC').value) > 0  then
                   QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'Sindicais', 'Confederativas',[rfReplaceall,rfIgnoreCase]);

                IF NOT DMAssociado.dsLocEnder.dataset.Locate('END_CORRESP','Sim',[]) THEN
                begin
                   aviso('Endereço de Correspondência não cadastrado. ');
                   exit;
                end
                else
                begin
                   ender := DMAssociado.dsLocEnder.dataset.fieldbyname('end_logradouro').value;

                   If (DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value<>'') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value<>NULL) then
                      ender := ender + ', ' +DMAssociado.dsLocEnder.dataset.fieldbyname('end_numero').value;

                   if (DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value <> '') and (DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value <> null) then
                       ender := ender +' - ' +DMAssociado.dsLocEnder.dataset.fieldbyname('END_COMPLEMENTO').value;

                   if (DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value <> '') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value <> NULL) then
                      ender := ender +',  '+ DMAssociado.dsLocEnder.dataset.fieldbyname('END_BAIRRO').value;

                   if (DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value <> '') AND (DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value <> NULL) then
                      ender := ender +'  -  '+ DMAssociado.dsLocEnder.dataset.fieldbyname('CIDADE_NOME').value;

                   if (DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value <> '')AND (DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value <> NULL) then
                      ender := ender +' / '+DMAssociado.dsLocEnder.dataset.fieldbyname('ESTADO_SIGLA').value;

                   QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#endereco#>',ENDER, [rfReplaceall]);
                   //RichEdit1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#endereco#>',ENDER, [rfReplaceall]);
                end;

                //Anuidades
                anuidades:='';
                if DmFinancas.dsParcelAnuidades.DataSet.recordcount = 1 then
                   QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#anuidades#>',inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value)), [rfReplaceall])

                else
                begin

                    DmFinancas.dsParcelAnuidades.DataSet.first;


                    for i:= 1 to DmFinancas.dsParcelAnuidades.DataSet.recordcount -1 do
                    begin
                        If i=1 then
                           anuidades:=inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value))
                        else
                           anuidades:=anuidades+', ' + inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value));
                        DmFinancas.dsParcelAnuidades.DataSet.next;
                    end;
                    anuidades:=anuidades+' e ' + inttostr(ExtractYear(DmFinancas.dsParcelAnuidades.DataSet.fieldbyname('VENCIMENTO').value));

                    QRParcelamentoNovo.QRMemo1.lines.text:=StringReplace(QRParcelamentoNovo.QRMemo1.lines.text,'<#anuidades#>',anuidades, [rfReplaceall]);

                end;

               // QRParcelamentoNovo.QRRichText1.ParentRichEdit := TRichEdit(FrmnovoAssoc.RichEdit1);


                QRParcelamentoNovo.print;
                finally
                QRParcelamentoNovo.free;
                end;
       end;

end;

procedure TfrmNovoAssoc.ConfissaodeDivida;
var
  qtd: integer;
  local, endereco,contrib: string;
  arquivo, dadosprocurador:string;

begin
  local := ExtractFilePath(Application.ExeName) + 'termos';

  ExibeAguarde('Gerando a Confissão de Dívida. Por favor aguarde...');

  if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Sim','Não']),[] ) then
  begin
      if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Não','Não']),[] ) then
      begin
         Aviso('Não existe endereço válido cadastrado. ');
         EscondeAguarde;
         Exit;
      end
  end;


  endereco := DMAssociado.cdsLocEnderEND_LOGRADOURO.value;
  if DMAssociado.cdsLocEnderEND_NUMERO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_NUMERO.value;
  if DMAssociado.cdsLocEnderEND_COMPLEMENTO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_COMPLEMENTO.value;
  if DMAssociado.cdsLocEnderEND_BAIRRO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_BAIRRO.value;
  if DMAssociado.cdsLocEnderCIDADE_NOME.value <> '' then
    Endereco := Endereco + ' - ' + DMAssociado.cdsLocEnderCIDADE_NOME.value;
  if DMAssociado.cdsLocEnderESTADO_SIGLA.value <> '' then
    Endereco := Endereco + ' - ' + DMAssociado.cdsLocEnderESTADO_SIGLA.value;
  if DMAssociado.cdsLocEnderEND_CEP.value <> '' then
  begin
    if Length(DMAssociado.cdsLocEnderEND_CEP.value) = 8 then
      Endereco := Endereco + ' - CEP ' + MaskCEP(DMAssociado.cdsLocEnderEND_CEP.value)
    else
      Endereco := Endereco + ' - CEP ' + DMAssociado.cdsLocEnderEND_CEP.value;
  end;


  try
      application.createform(TQRConfissaoDivida, QRConfissaoDivida);
      QRConfissaoDivida.cdsRelTermo.createdataset;

      DMConexao.sdsConfig.close;
      DMConexao.sdsConfig.open;
      DMConexao.sdsConfig.first;
      if DMAssociado.cdsAssocEMP_ID.value = 2 then
         DMConexao.sdsConfig.next;
      if DMAssociado.cdsAssocEMP_ID.value = 1 then
      begin
        QRConfissaoDivida.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO MUNICÍPIO DO RIO DE JANEIRO';
        QRConfissaoDivida.labrodape1.caption:='Av. Graça Aranha, nº 416 - salas 424/425 e 1108 a 1110- Rio de Janeiro - Telefone: (21) 2524-2859';
      end
      else
      if DMAssociado.cdsAssocEMP_ID.value = 2 then
      begin
        QRConfissaoDivida.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO ESTADO DO RIO DE JANEIRO';
        FreeAndNil(QRConfissaoDivida.imglogo);
        QRConfissaoDivida.labrodape1.caption:='Rua Dr. Borman, 06/204, Centro - Niterói - Rio de Janeiro - RJ CEP: 24020-320'
      end;
      QRConfissaoDivida.labrodape2.caption:= 'www.sircomrj.com.br';

      if DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
      begin
          RichEdit3.lines.Assign(Dmconexao.sdsConfigTEXTO1_CONFISSAO_PJ);

          SubstituirTexto(RichEdit3, '<#numero#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

          SubstituirTexto(RichEdit3, '<#nome#>',DMAssociado.cdsAssocNOME.value);

          SubstituirTexto(RichEdit3, '<#cpfcnpj#>', MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value));

          SubstituirTexto(RichEdit3, '<#registro#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

          SubstituirTexto(RichEdit3, '<#enderecocompleto#>', endereco);


          try Application.createform(TfrmConfDividaDadosComprom,frmConfDividaDadosComprom);


          sdsRespTec.close;
          sdsRespTec.params.ParamByName('pai').Value := DMAssociado.cdsAssocASS_ID.Value;
          sdsRespTec.Open;
          if sdsRespTec.RecordCount = 1 then
          begin

              frmConfDividaDadosComprom.editNome.Text := sdsRespTecNOME.value;
              frmConfDividaDadosComprom.editCpf.Text := sdsRespTecCPFSOCIO.value;
              frmConfDividaDadosComprom.cbbEstCivil.Text := sdsRespTecESTCIVIL_DESC.value;
              frmConfDividaDadosComprom.editNacionalidade.Text := sdsRespTecNACIONALIDADE.value;
              frmConfDividaDadosComprom.editIdentidade.Text := sdsRespTecIDENTIDADE.value;
              frmConfDividaDadosComprom.editOrgExp.Text := sdsRespTecIDENT_OE.value;
          end;



          if  frmConfDividaDadosComprom.ShowModal = mrok then
          begin
              if frmConfDividaDadosComprom.editNome.Text <>'' then
                    SubstituirTexto(RichEdit3, '<#nomert#>',frmConfDividaDadosComprom.editNome.Text)
              else
                   SubstituirTexto(RichEdit3, '<#nomert#>','_______________________');


              if frmConfDividaDadosComprom.editNacionalidade.Text ='' then
                 SubstituirTexto(RichEdit3, '<#nacionalidadert#>', '_______________________')
              else
                 SubstituirTexto(RichEdit3, '<#nacionalidadert#>', LowerCase(frmConfDividaDadosComprom.editNacionalidade.Text));

              if frmConfDividaDadosComprom.cbbEstCivil.Text ='' then
                 SubstituirTexto(RichEdit3, '<#estadocivilrt#>', '_______________________, ')
              else
                 SubstituirTexto(RichEdit3, '<#estadocivilrt#>', Trim(LowerCase(frmConfDividaDadosComprom.cbbEstCivil.Text)));

              if frmConfDividaDadosComprom.editIdentidade.Text ='' then
                 SubstituirTexto(RichEdit3, '<#identidadert#>','_______________________')
              else
                 SubstituirTexto(RichEdit3, '<#identidadert#>', frmConfDividaDadosComprom.editIdentidade.Text);

              if frmConfDividaDadosComprom.editOrgExp.Text ='' then
                 SubstituirTexto(RichEdit3, '<#orgaoexpedidorrt#>', '_______________________')
              else
                 SubstituirTexto(RichEdit3, '<#orgaoexpedidorrt#>', frmConfDividaDadosComprom.editOrgExp.Text);

              SubstituirTexto(RichEdit3, '<#cpfrt#>',  MaskCPFCGC(frmConfDividaDadosComprom.editCpf.Text));
          end
          else
          begin
                EscondeAguarde;
                exit;
          end;

          finally
              frmConfDividaDadosComprom.free;
          end;

          RichEdit2.lines.Assign(Dmconexao.sdsConfigTEXTO2_CONFISSAO_PJ);
      end
      else
      if DMAssociado.cdsAssocTP_ASSOC_ID.Value = 2 then
      begin

          RichEdit3.lines.Assign(Dmconexao.sdsConfigTEXTO1_CONFISSAO_PF);



          dadosprocurador :='';
          try Application.createform(TfrmConfDividaDadosComprom,frmConfDividaDadosComprom);

              frmConfDividaDadosComprom.editNome.Text := DMAssociado.cdsAssocNOME.value;
              frmConfDividaDadosComprom.editCpf.Text := DMAssociado.cdsAssocCPFCNPJ.value;
              frmConfDividaDadosComprom.cbbEstCivil.Text := LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value);
              frmConfDividaDadosComprom.editNacionalidade.Text := LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value);
              frmConfDividaDadosComprom.editIdentidade.Text := DMAssociado.cdsAssocIDENTIDADE.value;
              frmConfDividaDadosComprom.editOrgExp.Text := DMAssociado.cdsAssocIDENT_OE.value;

              if  frmConfDividaDadosComprom.ShowModal = mrok then
              begin
                   if frmConfDividaDadosComprom.editNome.Text <> DMAssociado.cdsAssocNOME.value then
                       dadosprocurador := 'por intermédio do seu procurador Sr(a) ' + frmConfDividaDadosComprom.editNome.Text+', ' +frmConfDividaDadosComprom.editNacionalidade.Text +', ' + frmConfDividaDadosComprom.cbbEstCivil.Text+' portador da célula de identidade nº '+ frmConfDividaDadosComprom.editIdentidade.Text+', expedida pelo ' + frmConfDividaDadosComprom.editOrgExp.Text+', e inscrito(a) no CPF sob o nº ' + frmConfDividaDadosComprom.editCpf.Text+', '
                   else
                       dadosprocurador := '';

                    SubstituirTexto(RichEdit3, '<#dadosprocurador#>',dadosprocurador);

                    if frmConfDividaDadosComprom.editNacionalidade.Text ='' then
                         SubstituirTexto(RichEdit3, '<#nacionalidade#>', '_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#nacionalidade#>', LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value));


                    if frmConfDividaDadosComprom.cbbEstCivil.Text ='' then
                         SubstituirTexto(RichEdit3, '<#estadocivil#>', '_______________________, ')
                    else
                         SubstituirTexto(RichEdit3, '<#estadocivil#>', Trim( LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value)));

                    if frmConfDividaDadosComprom.editIdentidade.Text ='' then
                         SubstituirTexto(RichEdit3, '<#identidade#>','_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#identidade#>', DMAssociado.cdsAssocIDENTIDADE.value);

                    if frmConfDividaDadosComprom.editOrgExp.Text ='' then
                         SubstituirTexto(RichEdit3, '<#orgaoexpedidor#>', '_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#orgaoexpedidor#>', DMAssociado.cdsAssocIDENT_OE.value);

                    SubstituirTexto(RichEdit3, '<#naturalidade#>',' ' + DMAssociado.cdsAssocNATURALIDADE.value);


                   end ;


          finally
                frmConfDividaDadosComprom.free;
          end;

         SubstituirTexto(RichEdit3, '<#nome#>',DMAssociado.cdsAssocNOME.VALUE);

          SubstituirTexto(RichEdit3, '<#numero#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );


          SubstituirTexto(RichEdit3, '<#registro#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

          SubstituirTexto(RichEdit3, '<#enderecocompleto#>', endereco);

          SubstituirTexto(RichEdit3, '<#naturalidade#>',' ' + DMAssociado.cdsAssocNATURALIDADE.value);

          SubstituirTexto(RichEdit3, '<#cpfcnpj#>',  MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.VALUE));
          SubstituirTexto(RichEdit3, '<#nacionalidade#>', LowerCase(DMAssociado.cdsAssocNACIONALIDADE.VALUE));
          SubstituirTexto(RichEdit3, '<#orgaoexpedidor#>', DMAssociado.cdsAssocIDENT_OE.VALUE);
          SubstituirTexto(RichEdit3, '<#identidade#>', DMAssociado.cdsAssocIDENTIDADE.VALUE);
          SubstituirTexto(RichEdit3, '<#estadocivil#>', Trim(LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.VALUE)));

         RichEdit2.lines.Assign(Dmconexao.sdsConfigTEXTO2_CONFISSAO_PF);
      end;

      SubstituirTexto(RichEdit3, '<#anuidades#>', Retorna_Anos(DmFinancas.dsParcelAnuidades,'ano'));

      SubstituirTexto(RichEdit3, '<#valordivida#>', FormatFloat(',0.00',DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat ));

      SubstituirTexto(RichEdit3, '<#valorextenso#>', valorPorExtenso(DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat));


      if Pos('Sindical', DmFinancas.cdsParcelamentoDESCRICAO_PARC.value) > 0 then
        contrib := 'SINDICAIS'
      else
      if Pos('Confederativa', DmFinancas.cdsParcelamentoDESCRICAO_PARC.value) > 0 then
        contrib := 'CONFEDERATIVAS'
      else
        contrib := '';

      SubstituirTexto(RichEdit3, '<#contribuicao#>', contrib);

      FormataTexto(RichEdit3,Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4),1,0,1 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocNOME.value,1,0,0 );
      FormataTexto(RichEdit3,MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value),1,0,0 );
      FormataTexto(RichEdit3,Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) ,1,0,0 );
      FormataTexto(RichEdit3,endereco ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecNOME.value ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(sdsRespTecNACIONALIDADE.value) ,1,0,0 );
      FormataTexto(RichEdit3,Trim(LowerCase(sdsRespTecESTCIVIL_DESC.value)) ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecIDENTIDADE.value ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecIDENT_OE.value ,1,0,0 );
      FormataTexto(RichEdit3,MaskCPFCGC(sdsRespTecCPFSOCIO.value) ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value) ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value) ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocIDENTIDADE.value ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocIDENT_OE.value ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocNATURALIDADE.value,1,0,0 );
      FormataTexto(RichEdit3,'COMPROMISSÁRIO (DEVEDOR)' ,1,0,1 );
      FormataTexto(RichEdit3,'TERMO DE CONFISSÃO DE DÍVIDA E COMPROMISSO DE PAGAMENTO' ,1,0,1 );
      FormataTexto(RichEdit3,Retorna_Anos(DmFinancas.dsParcelAnuidades,'ano') ,1,0,1 );
      FormataTexto(RichEdit3,FormatFloat(',0.00',DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat ),1,0,1 );
      FormataTexto(RichEdit3,valorPorExtenso(DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat),1,0,1 );

      QRConfissaoDivida.ricTexto1.ParentRichEdit := TRichEdit(RichEdit3);
      SetRichEditAdvOption(TRichEdit(RichEdit2));
      SetRichEditAdvOption(TRichEdit(RichEdit3));
      QRConfissaoDivida.ricTexto2.ParentRichEdit := TRichEdit(RichEdit2);

      DmFinancas.cdsParcelasParc.first;
      while not DmFinancas.cdsParcelasParc.eof do
      begin
        QRConfissaoDivida.cdsRelTermo.Append;
        QRConfissaoDivida.cdsRelTermo.Edit;
        QRConfissaoDivida.cdsRelTermovalor.Value := DmFinancas.cdsParcelasParcVALOR_PARC.asfloat;
        QRConfissaoDivida.cdsRelTermoparcela.Value := DmFinancas.cdsParcelasParcNUM_PARCELA.value;
        QRConfissaoDivida.cdsRelTermoperiodo.Value := '';
        QRConfissaoDivida.cdsRelTermodatavencto.Value := DmFinancas.cdsParcelasParcDT_VENCIMENTO.value;
        if DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value <> 0 then
        begin
           QRConfissaoDivida.cdsRelTermodatapagto.Value := DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value;
           QRConfissaoDivida.cdsRelTermorecibo.Value := DmFinancas.cdsParcelasParcNOSSONUMERO.value;
           QRConfissaoDivida.cdsRelTermovalorpago.Value := DmFinancas.cdsParcelasParcVALOR_PAGO.asfloat;
        end;
        QRConfissaoDivida.cdsRelTermo.post;
        DmFinancas.cdsParcelasParc.Next;
      end;

      QRConfissaoDivida.ReportTitle := 'ConfissaoDivida_' + DMAssociado.cdsAssocREGISTRO.value;
      QRConfissaoDivida.Prepare;

      QRConfissaoDivida.LabtotPags.Caption := IntToStr(QRConfissaoDivida.QRPrinter.PageCount);

      arquivo := GeraPDF2(QRConfissaoDivida, local,0);

      if arquivo = '' then
      //if GeraPDF(QRConfissaoDivida, local) = 0 then
      begin
        Aviso('Erro ao gerar PDF de Confissão de Dívida para: ' + Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) + Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) + ' - ' + DMAssociado.cdsAssocNOME.value + '.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
      end
      else
      begin
          QRConfissaoDivida.Print;
          QRConfissaoDivida.Print;

         CopyFile(PChar(arquivo), PChar(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo)), true);

         DMAssociado.PROC_NOTIFIC_I.close;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 2;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
         //DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo);
         DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  ExtractFileName(arquivo);
         DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
         DMAssociado.PROC_NOTIFIC_I.ExecProc;
         DMAssociado.cdsDocsAnexos.close;
         DMAssociado.cdsDocsAnexos.open;

         DMConexao.Log('Geração de Confissao de Divida - Parcelamento Antigo: ' + ExtractFileName(arquivo) + '.', 'I', DMAssociado.cdsAssocASS_ID.value);
      end;


    finally
      QRConfissaoDivida.free;
    end;

  EscondeAguarde;


end;

procedure TfrmNovoAssoc.ConfissaodeDividaParcelNovo;
var
  qtd: integer;
  local, endereco,contrib,arquivo, dadosprocurador:string;

begin
  local := ExtractFilePath(Application.ExeName) + 'termos';

  ExibeAguarde('Gerando a Confissão de Dívida. Por favor aguarde...');

  if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Sim','Não']),[] ) then
  begin
      if not DMAssociado.cdsLocEnder.locate('END_CORRESP;END_CORRESP_DEV',VarArrayOf(['Não','Não']),[] ) then
      begin
         Aviso('Não existe endereço válido cadastrado. ');
         EscondeAguarde;
         Exit;
      end
  end;


  endereco := DMAssociado.cdsLocEnderEND_LOGRADOURO.value;
  if DMAssociado.cdsLocEnderEND_NUMERO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_NUMERO.value;
  if DMAssociado.cdsLocEnderEND_COMPLEMENTO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_COMPLEMENTO.value;
  if DMAssociado.cdsLocEnderEND_BAIRRO.value <> '' then
    Endereco := Endereco + ', ' + DMAssociado.cdsLocEnderEND_BAIRRO.value;
  if DMAssociado.cdsLocEnderCIDADE_NOME.value <> '' then
    Endereco := Endereco + ' - ' + DMAssociado.cdsLocEnderCIDADE_NOME.value;
  if DMAssociado.cdsLocEnderESTADO_SIGLA.value <> '' then
    Endereco := Endereco + ' - ' + DMAssociado.cdsLocEnderESTADO_SIGLA.value;
  if DMAssociado.cdsLocEnderEND_CEP.value <> '' then
  begin
    if Length(DMAssociado.cdsLocEnderEND_CEP.value) = 8 then
      Endereco := Endereco + ' - CEP ' + MaskCEP(DMAssociado.cdsLocEnderEND_CEP.value)
    else
      Endereco := Endereco + ' - CEP ' + DMAssociado.cdsLocEnderEND_CEP.value;
  end;


  try
      application.createform(TQRConfissaoDividaParcelNovo, QRConfissaoDividaParcelNovo);
      QRConfissaoDividaParcelNovo.cdsRelTermo.createdataset;

      DMConexao.sdsConfig.close;
      DMConexao.sdsConfig.open;
      DMConexao.sdsConfig.first;
      if DMAssociado.cdsAssocEMP_ID.value = 2 then
         DMConexao.sdsConfig.next;
      if DMAssociado.cdsAssocEMP_ID.value = 1 then
      begin
        QRConfissaoDividaParcelNovo.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO MUNICÍPIO DO RIO DE JANEIRO';
        QRConfissaoDividaParcelNovo.labrodape1.caption:='Av. Graça Aranha, nº 416 - salas 424/425 e 1108 a 1110- Rio de Janeiro - Telefone: (21) 2524-2859';
      end
      else
      if DMAssociado.cdsAssocEMP_ID.value = 2 then
      begin
        QRConfissaoDividaParcelNovo.labSubtitulo.Caption := 'DOS REPRESENTANTES COMERCIAIS DO ESTADO DO RIO DE JANEIRO';
        FreeAndNil(QRConfissaoDividaParcelNovo.imglogo);
        QRConfissaoDividaParcelNovo.labrodape1.caption:='Rua Dr. Borman, 06/204, Centro - Niterói - Rio de Janeiro - RJ CEP: 24020-320'
      end;
      QRConfissaoDividaParcelNovo.labrodape2.caption:= 'www.sircomrj.com.br';

      if DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
      begin
          RichEdit3.lines.Assign(Dmconexao.sdsConfigTEXTO1_CONFISSAO_PJ);

          SubstituirTexto(RichEdit3, '<#numero#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

          SubstituirTexto(RichEdit3, '<#nome#>',DMAssociado.cdsAssocNOME.value);

          SubstituirTexto(RichEdit3, '<#cpfcnpj#>', MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value));

          SubstituirTexto(RichEdit3, '<#registro#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

          SubstituirTexto(RichEdit3, '<#enderecocompleto#>', endereco);


          try Application.createform(TfrmConfDividaDadosComprom,frmConfDividaDadosComprom);


              sdsRespTec.close;
              sdsRespTec.params.ParamByName('pai').Value := DMAssociado.cdsAssocASS_ID.Value;
              sdsRespTec.Open;
              if sdsRespTec.RecordCount = 1 then
              begin

                  frmConfDividaDadosComprom.editNome.Text := sdsRespTecNOME.value;
                  frmConfDividaDadosComprom.editCpf.Text := sdsRespTecCPFSOCIO.value;
                  frmConfDividaDadosComprom.cbbEstCivil.Text := sdsRespTecESTCIVIL_DESC.value;
                  frmConfDividaDadosComprom.editNacionalidade.Text := sdsRespTecNACIONALIDADE.value;
                  frmConfDividaDadosComprom.editIdentidade.Text := sdsRespTecIDENTIDADE.value;
                  frmConfDividaDadosComprom.editOrgExp.Text := sdsRespTecIDENT_OE.value;
              end;

              if  frmConfDividaDadosComprom.ShowModal = mrok then
              begin
                  if frmConfDividaDadosComprom.editNome.Text <>'' then
                        SubstituirTexto(RichEdit3, '<#nomert#>',frmConfDividaDadosComprom.editNome.Text)
                  else
                       SubstituirTexto(RichEdit3, '<#nomert#>','_______________________');


                  if frmConfDividaDadosComprom.editNacionalidade.Text ='' then
                     SubstituirTexto(RichEdit3, '<#nacionalidadert#>', '_______________________')
                  else
                     SubstituirTexto(RichEdit3, '<#nacionalidadert#>', LowerCase(frmConfDividaDadosComprom.editNacionalidade.Text));

                  if frmConfDividaDadosComprom.cbbEstCivil.Text ='' then
                     SubstituirTexto(RichEdit3, '<#estadocivilrt#>', '_______________________, ')
                  else
                     SubstituirTexto(RichEdit3, '<#estadocivilrt#>', Trim(LowerCase(frmConfDividaDadosComprom.cbbEstCivil.Text)));

                  if frmConfDividaDadosComprom.editIdentidade.Text ='' then
                     SubstituirTexto(RichEdit3, '<#identidadert#>','_______________________')
                  else
                     SubstituirTexto(RichEdit3, '<#identidadert#>', frmConfDividaDadosComprom.editIdentidade.Text);

                  if frmConfDividaDadosComprom.editOrgExp.Text ='' then
                     SubstituirTexto(RichEdit3, '<#orgaoexpedidorrt#>', '_______________________')
                  else
                     SubstituirTexto(RichEdit3, '<#orgaoexpedidorrt#>', frmConfDividaDadosComprom.editOrgExp.Text);

                  SubstituirTexto(RichEdit3, '<#cpfrt#>',  MaskCPFCGC(frmConfDividaDadosComprom.editCpf.Text));
              end  ;

          finally
              frmConfDividaDadosComprom.free;
          end;

          RichEdit2.lines.Assign(Dmconexao.sdsConfigTEXTO2_CONFISSAO_PJ);
      end
      else
      if DMAssociado.cdsAssocTP_ASSOC_ID.Value = 2 then
      begin

          RichEdit3.lines.Assign(Dmconexao.sdsConfigTEXTO1_CONFISSAO_PF);
          dadosprocurador :='';
          try Application.createform(TfrmConfDividaDadosComprom,frmConfDividaDadosComprom);

              frmConfDividaDadosComprom.editNome.Text := DMAssociado.cdsAssocNOME.value;
              frmConfDividaDadosComprom.editCpf.Text := DMAssociado.cdsAssocCPFCNPJ.value;
              frmConfDividaDadosComprom.cbbEstCivil.Text := LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value);
              frmConfDividaDadosComprom.editNacionalidade.Text := LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value);
              frmConfDividaDadosComprom.editIdentidade.Text := DMAssociado.cdsAssocIDENTIDADE.value;
              frmConfDividaDadosComprom.editOrgExp.Text := DMAssociado.cdsAssocIDENT_OE.value;

              if  frmConfDividaDadosComprom.ShowModal = mrok then
              begin
                   if frmConfDividaDadosComprom.editNome.Text <> DMAssociado.cdsAssocNOME.value then
                       dadosprocurador := 'por intermédio do seu procurador Sr(a) ' + frmConfDividaDadosComprom.editNome.Text+', ' +frmConfDividaDadosComprom.editNacionalidade.Text +', ' + frmConfDividaDadosComprom.cbbEstCivil.Text+' portador da célula de identidade nº '+ frmConfDividaDadosComprom.editIdentidade.Text+', expedida pelo ' + frmConfDividaDadosComprom.editOrgExp.Text+', e inscrito(a) no CPF sob o nº ' + frmConfDividaDadosComprom.editCpf.Text+', '
                   else
                       dadosprocurador := '';

                    SubstituirTexto(RichEdit3, '<#dadosprocurador#>',dadosprocurador);

                    if frmConfDividaDadosComprom.editNacionalidade.Text ='' then
                         SubstituirTexto(RichEdit3, '<#nacionalidade#>', '_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#nacionalidade#>', LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value));


                    if frmConfDividaDadosComprom.cbbEstCivil.Text ='' then
                         SubstituirTexto(RichEdit3, '<#estadocivil#>', '_______________________, ')
                    else
                         SubstituirTexto(RichEdit3, '<#estadocivil#>', Trim( LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value)));

                    if frmConfDividaDadosComprom.editIdentidade.Text ='' then
                         SubstituirTexto(RichEdit3, '<#identidade#>','_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#identidade#>', DMAssociado.cdsAssocIDENTIDADE.value);

                    if frmConfDividaDadosComprom.editOrgExp.Text ='' then
                         SubstituirTexto(RichEdit3, '<#orgaoexpedidor#>', '_______________________')
                    else
                         SubstituirTexto(RichEdit3, '<#orgaoexpedidor#>', DMAssociado.cdsAssocIDENT_OE.value);

                    SubstituirTexto(RichEdit3, '<#naturalidade#>',' ' + DMAssociado.cdsAssocNATURALIDADE.value);


                   end ;



          finally
              frmConfDividaDadosComprom.free;
          end;

         RichEdit2.lines.Assign(Dmconexao.sdsConfigTEXTO2_CONFISSAO_PF);
      end;


      SubstituirTexto(RichEdit3, '<#numero#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

      SubstituirTexto(RichEdit3, '<#nome#>',DMAssociado.cdsAssocNOME.value);

      SubstituirTexto(RichEdit3, '<#cpfcnpj#>', MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value));

      SubstituirTexto(RichEdit3, '<#registro#>',  Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) );

      SubstituirTexto(RichEdit3, '<#enderecocompleto#>', endereco);

      SubstituirTexto(RichEdit3, '<#anuidades#>', Retorna_Anos(DmFinancas.dsParcelAnuidades,'ano'));

      CALVALORTOTNOVO;
      SubstituirTexto(RichEdit3, '<#valordivida#>', FormatFloat(',0.00',valortotParNOvo ));

      SubstituirTexto(RichEdit3, '<#valorextenso#>', valorPorExtenso(valortotParNOvo));

      if Pos('Sindical', DmFinancas.cdsParcelamentoDESCRICAO_PARC.value) > 0 then
        contrib := 'SINDICAIS'
      else
      if Pos('Confederativa', DmFinancas.cdsParcelamentoDESCRICAO_PARC.value) > 0 then
        contrib := 'CONFEDERATIVAS'
      else
        contrib := '';

      SubstituirTexto(RichEdit3, '<#contribuicao#>', contrib);

      FormataTexto(RichEdit3,Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4),1,0,1 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocNOME.value,1,0,0 );
      FormataTexto(RichEdit3,MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value),1,0,0 );
      FormataTexto(RichEdit3,Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) +'/'+ Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) ,1,0,0 );
      FormataTexto(RichEdit3,endereco ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecNOME.value ,1,0,0 );
      FormataTexto(RichEdit3,dadosprocurador ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(sdsRespTecNACIONALIDADE.value) ,1,0,0 );
      FormataTexto(RichEdit3,Trim(LowerCase(sdsRespTecESTCIVIL_DESC.value)) ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecIDENTIDADE.value ,1,0,0 );
      FormataTexto(RichEdit3,sdsRespTecIDENT_OE.value ,1,0,0 );
      FormataTexto(RichEdit3,MaskCPFCGC(sdsRespTecCPFSOCIO.value) ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(DMAssociado.cdsAssocNACIONALIDADE.value) ,1,0,0 );
      FormataTexto(RichEdit3,LowerCase(DMAssociado.cdsEst_CivilESTCIVIL_DESC.value) ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocIDENTIDADE.value ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocIDENT_OE.value ,1,0,0 );
      FormataTexto(RichEdit3,DMAssociado.cdsAssocNATURALIDADE.value,1,0,0 );
      FormataTexto(RichEdit3,'COMPROMISSÁRIO (DEVEDOR)' ,1,0,1 );
      FormataTexto(RichEdit3,'TERMO DE CONFISSÃO DE DÍVIDA E COMPROMISSO DE PAGAMENTO' ,1,0,1 );
      FormataTexto(RichEdit3,Retorna_Anos(DmFinancas.dsParcelAnuidades,'ano') ,1,0,1 );
      FormataTexto(RichEdit3,FormatFloat(',0.00',DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat ),1,0,1 );
      FormataTexto(RichEdit3,valorPorExtenso(DmFinancas.cdsParcelamentoVALOR_TOTAL.AsFloat),1,0,1 );

      QRConfissaoDividaParcelNovo.ricTexto1.ParentRichEdit := TRichEdit(RichEdit3);
      SetRichEditAdvOption(TRichEdit(RichEdit2));
      SetRichEditAdvOption(TRichEdit(RichEdit3));
      QRConfissaoDividaParcelNovo.ricTexto2.ParentRichEdit := TRichEdit(RichEdit2);

      DmFinancas.cdsParcelasParc.First;
      while not DmFinancas.cdsParcelasParc.Eof do
      begin
         QRConfissaoDividaParcelNovo.cdsRelTermo.Append;
        QRConfissaoDividaParcelNovo.cdsRelTermo.Edit;
        QRConfissaoDividaParcelNovo.cdsRelTermoperiodo.Value :=StringReplace(DmFinancas.cdsParcelasParcPAR_DESCRICAO.Value,'Exercício de ','',[rfReplaceall]);
        QRConfissaoDividaParcelNovo.cdsRelTermodataparapagto.Value := DmFinancas.cdsParcelasParcDT_VENCIMENTO.VALUE;
        if DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value <> 0 then
        begin
            QRConfissaoDividaParcelNovo.cdsRelTermodatapagto.Value := DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value;
            QRConfissaoDividaParcelNovo.cdsRelTermorecibo.Value := DmFinancas.cdsParcelasParcNOSSONUMERO.value;;
            QRConfissaoDividaParcelNovo.cdsRelTermovalorpago.Value := DmFinancas.cdsParcelasParcVALOR_PAGO.asfloat;
        end;
        QRConfissaoDividaParcelNovo.cdsRelTermo.post;
        DmFinancas.cdsParcelasParc.Next;

      end ;

   {   frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.First;
      while not frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.eof do
      begin
        QRConfissaoDividaParcelNovo.cdsRelTermo.Append;
        QRConfissaoDividaParcelNovo.cdsRelTermo.Edit;
        QRConfissaoDividaParcelNovo.cdsRelTermoperiodo.Value := INTTOSTR(frmParcelamentoNovoOpcoes.cdsAnuidadesParcsano.value);
        frmParcelamentoNovoOpcoes.cdsParcelas.Locate('anuid_id',frmParcelamentoNovoOpcoes.cdsAnuidadesParcsanuid_id.Value,[]);
        QRConfissaoDividaParcelNovo.cdsRelTermodataparapagto.Value := frmParcelamentoNovoOpcoes.cdsParcelasVencimento.VALUE;

        if DmFinancas.cdsParcelasParc.Locate('NUM_PARCELA',frmParcelamentoNovoOpcoes.cdsAnuidadesParcsnumparc.Value,[]) then
        begin
            if DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value <> 0 then
            begin
               QRConfissaoDividaParcelNovo.cdsRelTermodatapagto.Value := DmFinancas.cdsParcelasParcDT_RECEBIMENTO.value;
               QRConfissaoDividaParcelNovo.cdsRelTermorecibo.Value := DmFinancas.cdsParcelasParcNOSSONUMERO.value;;
               QRConfissaoDividaParcelNovo.cdsRelTermovalorpago.Value := DmFinancas.cdsParcelasParcVALOR_PAGO.asfloat;
            end;
        end;
        QRConfissaoDividaParcelNovo.cdsRelTermo.post;
        frmParcelamentoNovoOpcoes.cdsAnuidadesParcs.Next;
      end;
           }
      QRConfissaoDividaParcelNovo.ReportTitle := 'ConfissaoDivida_' + DMAssociado.cdsAssocREGISTRO.value;
      QRConfissaoDividaParcelNovo.Prepare;

      QRConfissaoDividaParcelNovo.LabtotPags.Caption := IntToStr(QRConfissaoDividaParcelNovo.QRPrinter.PageCount);

       arquivo := GeraPDF2(QRConfissaoDividaParcelNovo, local,0);

      if arquivo = '' then
      //if GeraPDF(QRConfissaoDivida, local) = 0 then
      begin
        Aviso('Erro ao gerar PDF de Confissão de Dívida para: ' + Copy(DMAssociado.cdsAssocREGISTRO.value,1,7) + Copy(DMAssociado.cdsAssocREGISTRO.value,8,4) + ' - ' + DMAssociado.cdsAssocNOME.value + '.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
      end
      else
      begin
          QRConfissaoDividaParcelNovo.Print;
          QRConfissaoDividaParcelNovo.Print;

         CopyFile(PChar(arquivo), PChar(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo)), false);

         DMAssociado.PROC_NOTIFIC_I.close;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := 2;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
         //DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo);
         DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  ExtractFileName(arquivo);
         DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
         DMAssociado.PROC_NOTIFIC_I.ExecProc;
         DMAssociado.cdsDocsAnexos.close;
         DMAssociado.cdsDocsAnexos.open;         

         DMConexao.Log('Geração de Confissao de Divida - Parcelamento Novo: ' + ExtractFileName(arquivo) + '.', 'I', DMAssociado.cdsAssocASS_ID.value);
      end;



    finally
      QRConfissaoDividaParcelNovo.free;
    end;

  EscondeAguarde;


end;

procedure TfrmNovoAssoc.DBGrid13DblClick(Sender: TObject);
var
  arq:string;
begin
  if DMAssociado.cdsDocsAnexos.RecordCount > 0 then
  arq:=   dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+DMAssociado.cdsDocsAnexosCAMINHO.Value;
  if FileExists(arq) then
     ShellExecute(handle,'open',PChar(arq), '','',SW_SHOWNORMAL)
  else
     Aviso('Arquivo não encontrado. ');



end;

procedure TfrmNovoAssoc.spDocumentoNOvoClick(Sender: TObject);
var
    arquivo:string;
begin
  inherited;
  try application.CreateForm(tfrmDocumentoAdd,frmDocumentoAdd);
      frmDocumentoAdd.cdsAux.Open;
      frmDocumentoAdd.cdsAux.Append;
      frmDocumentoAdd.cdsAux.Edit;
      frmDocumentoAdd.cdsAuxtpnotif_id.Value :=0;
      if frmDocumentoAdd.ShowModal = mrok then
      begin
         arquivo:= frmDocumentoAdd.ediLocal.text;
         CopyFile(PChar(arquivo), PChar(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(arquivo)), true);
         DMAssociado.PROC_NOTIFIC_I.close;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('TPNOTIF_ID').value := frmDocumentoAdd.cdsAuxtpnotif_id.value;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAEMISSAO').value := DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('CAMINHO').value :=  ExtractFileName(arquivo);
         DMAssociado.PROC_NOTIFIC_I.ParamByName('IDUSER').value := UserId;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('DATAINCLUSAO').value :=  DataAtual;
         DMAssociado.PROC_NOTIFIC_I.ParamByName('ass_id').value :=  DMAssociado.cdsAssocASS_ID.value;
         DMAssociado.PROC_NOTIFIC_I.ExecProc;
         DMConexao.Log('Inclusão de documento: ' + frmDocumentoAdd.sdsTpNotifDESCRICAO.Value + ' - ' + arquivo +'.', 'I', DMAssociado.cdsAssocASS_ID.value);

         DMAssociado.cdsDocsAnexos.close;
         DMAssociado.cdsDocsAnexos.open;
      end;

  finally
    frmDocumentoAdd.free;
  end;
end;

procedure TfrmNovoAssoc.spDocumentoExcluirClick(Sender: TObject);
begin
  inherited;
  If Confirma('Confirma exclusão do documento selecionado? ') then
  begin
     try
        Dmconexao.ExecSQL('delete  from NOTIFICACOES where notif_id = ' + IntToStr(DMAssociado.cdsDocsAnexosNOTIF_ID.value));
        DMAssociado.cdsDocsAnexos.Close;
        DMAssociado.cdsDocsAnexos.open;

     except
        Aviso('Erro ao excluir o documento. Comunique ao administrador do Sistema.');
     end;

  end;
end;

procedure TfrmNovoAssoc.CALVALORTOTNOVO;
var X:INTEGER;
begin
  valortotParNOvo :=0;
  DmFinancas.cdsParcelAnuidades.First;
    while not DmFinancas.cdsParcelAnuidades.eof do
    begin
          valortotParNOvo := valortotParNOvo +DmFinancas.cdsParcelAnuidadesTOTAL.asfloat;
          DmFinancas.cdsParcelAnuidades.next;

    end;

end;

procedure TfrmNovoAssoc.spEmailClick(Sender: TObject);
var
   texto:string;
begin
  inherited;

  if dmassociado.cdsDocsAnexosTPNOTIF_ID.value <> 4 then
  begin
      Aviso('Documento sem permissão para envio por e-mail. ');
      Exit;
  end;


  if not DMAssociado.cdsLocContato.Locate('TP_CONTATO;TP_STATUS_DESCR', VarArrayOf([3,'Ativo']),[]) then
  begin
      Aviso('Representante sem e-mail cadastrado. ');
      Exit;
  end;

  if Pos('Sind',dmassociado.cdsDocsAnexosCAMINHO.value) > 0 then
  begin
      texto := Copy(dmassociado.cdsDocsAnexosCAMINHO.value, Pos('Sind',dmassociado.cdsDocsAnexosCAMINHO.value),9);
      texto := 'Guia Sindical de ' + copy(texto,6,5);
  end
  else
  if Pos('Conf',dmassociado.cdsDocsAnexosCAMINHO.value) > 0 then
  begin
      texto := Copy(dmassociado.cdsDocsAnexosCAMINHO.value,Pos('Conf',dmassociado.cdsDocsAnexosCAMINHO.value),9);
      texto := 'Guia Confederativa de ' + copy(texto,6,5);
  end
  else
     texto := '';


  try
        Application.createform(TfrmExtratoEnviarEmail,frmExtratoEnviarEmail);
        frmExtratoEnviarEmail.edPARA.text := DMAssociado.cdsLocContatoCONTATO_DESCR.value;
        frmExtratoEnviarEmail.edPARA.enabled := false;
        frmExtratoEnviarEmail.edPARA.ReadOnly:=true;
        frmExtratoEnviarEmail.labmsg.caption :='';
        frmExtratoEnviarEmail.edAssunto.text := texto;
        frmExtratoEnviarEmail.Memomsg.Lines.clear;
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Aos cuidados de: '+ Dmassociado.cdsAssocNOME.value + ' (Cadastro Nº ' + copy(DMAssociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(DMAssociado.cdsAssocREGISTRO.value,8,4)+').');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Prezados Senhores(as),');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Em atenção à sua solicitação encaminhamos, anexa, a Guia de Contribuição ' + stringreplace(texto,'Guia ','',[rfReplaceall])+' que poderá ser paga em qualquer banco ou casa lotérica. ');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Com o intuito de agilizar a baixa, pedimos que após o pagamento traga ou envie por e-mail cópia dos comprovantes para sindicato@sircomrj.com.br.');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Atenciosamente,');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Sindicato dos Representantes Comerciais do Rio de Janeiro');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Site: www.sircomrj.com.br');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('E-mail: sindicato@sircomrj.com.br');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Endereço: Av. Graça Aranha 416 Sl. 425, Castelo, Rio de Janeiro, CEP 24.020-320');
        frmExtratoEnviarEmail.Memomsg.Lines.Add('Tel: (21) 2524-2859 (21) 2210-1838');

        If frmExtratoEnviarEmail.showmodal = mrok then
        begin
             try
                  ExibeAguarde('Enviando e-mail. Por favor aguarde...');
                  if EnviarEmail(frmExtratoEnviarEmail.edPARA.text,frmExtratoEnviarEmail.edAssunto.text,RICH_HTML(frmExtratoEnviarEmail.Memomsg),PChar(dmconexao.sdsConfigCAMINHONOTIFIC.value+'\'+ExtractFileName(DMAssociado.cdsDocsAnexosCAMINHO.value))) = 1 then
                  begin
                         EscondeAguarde;

                         DMAssociado.PROC_OBS_UI.close;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_ID').value:=0;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('OBS_DESCRICAO').value:='Envio de E-mail ' +frmExtratoEnviarEmail.edAssunto.text+'.';
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('ASS_ID').value:= DMAssociado.cdsAssocASS_ID.value;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('DT_OBS').value:= DataAtual;
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('HORA').value:= copy(timetostr( time()),1,5);
                         DMAssociado.PROC_OBS_UI.Params.ParamByName('USER_ID').value:=Userid;
                         DMAssociado.PROC_OBS_UI.ExecProc;
                         DMAssociado.cdsObs.Refresh;

                         Aviso('E-mail enviado com sucesso.');
                  end
                  else
                  begin
                       Aviso('Erro ao enviar e-mail.  '+chr(13)+ 'Verifique se o e-mail está correto e sem seu computador está conectado a internet. ' );
                        EscondeAguarde;
                  end;
             except
                  EscondeAguarde;
                  Aviso('Erro ao enviar e-mail. ');
                  exit;
             end;
        end;
  finally
     frmExtratoEnviarEmail.free;
  end;
end;

end.


