unit UPrincipal;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, jpeg, ExtCtrls, StdCtrls, Menus, ComCtrls, ToolWin, JclFileUtils,
    WinSkinData, Buttons, UCDefine, ShellApi;

type
    TfrmPrincipal = class(TForm)
        CoolBar1: TCoolBar;
        ToolBar1: TToolBar;
        MainMenu1: TMainMenu;
        DFDF1: TMenuItem;
        GDFD1: TMenuItem;
        N2: TMenuItem;
        Documentos1: TMenuItem;
        Documentos2: TMenuItem;
        Contatos1: TMenuItem;
        ipodeCorrespondncia1: TMenuItem;
        SituaodeCorrespondncia1: TMenuItem;
        N4: TMenuItem;
        ipodeMovimentao1: TMenuItem;
        N1: TMenuItem;
        ndicedeCorreo1: TMenuItem;
        N5: TMenuItem;
        Sair1: TMenuItem;
        Operaes1: TMenuItem;
        Usurio1: TMenuItem;
        rocarSenha1: TMenuItem;
        EfetuarLogoff1: TMenuItem;
        Mensagens1: TMenuItem;
        Manuteno1: TMenuItem;
        Usurios1: TMenuItem;
        CadastrodeUsurios1: TMenuItem;
        Permisses1: TMenuItem;
        LogdoSistema1: TMenuItem;
        Relatrios1: TMenuItem;
        labempresa: TLabel;
        Image1: TImage;
        spCadAssoc: TSpeedButton;
        Timer1: TTimer;
        Image2: TImage;
        Image3: TImage;
        spExtrato: TSpeedButton;
        LABUSER: TLabel;
        LABHORA: TLabel;
        LABDATA: TLabel;
        ExtratoNovoRegistro1: TMenuItem;
        N7: TMenuItem;
        DatadoSistema1: TMenuItem;
        N9: TMenuItem;
        BoletoRecibo1: TMenuItem;
        LeituradeRetorno1: TMenuItem;
        N10: TMenuItem;
        ValorContribuio1: TMenuItem;
        spSair: TSpeedButton;
        Inadimplncia1: TMenuItem;
        spSituacaoDeBoleto: TSpeedButton;
        UCControls1: TUCControls;
        ListagemdeFiliados1: TMenuItem;
        Parcelamentos1: TMenuItem;
        Selic1: TMenuItem;
        IGPM1: TMenuItem;
        N6: TMenuItem;
        ResumoCadastral1: TMenuItem;
        N8: TMenuItem;
        Recebimentos1: TMenuItem;
        MovimentoporPerodo1: TMenuItem;
        N12: TMenuItem;
        MalaDireta1: TMenuItem;
        N13: TMenuItem;
        SimulaodeValordeGuia1: TMenuItem;
        RecebimentosporPerodoGuias1: TMenuItem;
        N14: TMenuItem;
        GuiasNoIdentificadas1: TMenuItem;
    N15: TMenuItem;
    MovimentaoporPerodo1: TMenuItem;
    AdesoaoSimplesNacional1: TMenuItem;
    AtendimentosObservaes1: TMenuItem;
    N16: TMenuItem;
    N3: TMenuItem;
    LotesRecuperaodeCrditos1: TMenuItem;
    spLotes: TSpeedButton;
    N11: TMenuItem;
    Lotes1: TMenuItem;
    RepassedePagamentos1: TMenuItem;
    SkinData1: TSkinData;
    Remessa1: TMenuItem;
    N17: TMenuItem;
    LogdeEnviodeRemessa1: TMenuItem;
    ArquivodePrCrtica1: TMenuItem;
    N18: TMenuItem;
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure spCadAssocClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure spExtratoClick(Sender: TObject);
        procedure DatadoSistema1Click(Sender: TObject);
        procedure Sair1Click(Sender: TObject);
        procedure ValorContribuio1Click(Sender: TObject);
        procedure Documentos2Click(Sender: TObject);
        procedure Contatos1Click(Sender: TObject);
        procedure ipodeCorrespondncia1Click(Sender: TObject);
        procedure SituaodeCorrespondncia1Click(Sender: TObject);
        procedure ipodeMovimentao1Click(Sender: TObject);
        procedure BoletoRecibo1Click(Sender: TObject);
        procedure spSairClick(Sender: TObject);
        procedure spRelatoriosClick(Sender: TObject);
        procedure LeituradeRetorno1Click(Sender: TObject);
        procedure Cobrana1Click(Sender: TObject);
        procedure Inadimplncia1Click(Sender: TObject);
        procedure ListagemdeFiliados1Click(Sender: TObject);
        procedure Parcelamentos1Click(Sender: TObject);
        procedure Filiadosemdia1Click(Sender: TObject);
        procedure Selic1Click(Sender: TObject);
        procedure IGPM1Click(Sender: TObject);
        procedure ResumoCadastral1Click(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure MovimentoporPerodo1Click(Sender: TObject);
        procedure MalaDireta1Click(Sender: TObject);
        procedure SimulaodeValordeGuia1Click(Sender: TObject);
        procedure RecebimentosporPerodoGuias1Click(Sender: TObject);
    procedure GuiasNoIdentificadas1Click(Sender: TObject);
    procedure MovimentaoporPerodo1Click(Sender: TObject);
    procedure AdesoaoSimplesNacional1Click(Sender: TObject);
    procedure AtendimentosObservaes1Click(Sender: TObject);
    procedure spLotesClick(Sender: TObject);
    procedure RepassedePagamentos1Click(Sender: TObject);
    procedure Remessa1Click(Sender: TObject);
    procedure ExtratoNovoRegistroNova1Click(Sender: TObject);
    procedure LogdeEnviodeRemessa1Click(Sender: TObject);
    procedure ArquivodePrCrtica1Click(Sender: TObject);
    private
        //  FileInfo: TJclFileVersionInfo;
            { Private declarations }
    public
        { Public declarations }
    end;

var
    frmPrincipal: TfrmPrincipal;

implementation

uses UFuncoes, UnitLocAssoc, UDMConexao, UDemonstrativo, UDatadoSistema,
    UIndices, UDMGeral, UContribuicaoValores, UTiposDocumento, UTiposContato,
    UTiposCorrespondencia, USituacaoCorresp, UTipoMovimentacao, UBoletoRecibo,
    UfrmRelatorio, URetorno,  UInadimplencia, URelatListagemFiliado,
    UnitRelatParcelOpcoes, UQrParcelsTotais, UnitRelatParcelamentos,
    UFiliadosEmdia, UIndicesIgpm, UQRSituacaoCad, UDMAssociado,
    URelatMovimentoPeriodo, UfrmMalaDiretaCadastro, USimulacaoGuia,
  URelatRecebimentos, URelatGuiasNaoIdent, URelatMovimento,
  URelatSimplesNacional, URelatAtendimentos, Ulotes, ULotesControle,
  ULotesRelatRepasse, URemessa, UDemonstrativoNovo, UNovoAssoc2,
  ULogRemessa, ULerPreCritica;


{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    caption := Application.Title + ' ' + versaoexe;
    CreateDir(ExtractFilePath(Application.ExeName) + 'email');
    CreateDir(ExtractFilePath(Application.ExeName) + 'anexos');
    CreateDir(ExtractFilePath(Application.ExeName) + 'termos');
    

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    labempresa.caption := StringReplace(DMConexao.sdsConfigNOMEEMP.value, 'do Município ', '', [rfreplaceall]);
    UserId := DMConexao.UserControl.CurrentUser.UserID;
    UserName := DMConexao.UserControl.CurrentUser.UserName;
    LABUSER.caption := 'Usuário: ' + UserName;
    labempresa.Width := frmPrincipal.Width;
    LABUSER.Left := frmPrincipal.Width - 30 - LABUSER.Width;
    LABUSER.top := frmPrincipal.Height - 140;
    LABDATA.Left := frmPrincipal.Width - 30 - LABUSER.Width;
    LABDATA.top := frmPrincipal.Height - 115;
    LABHORA.Left := frmPrincipal.Width - 30 - LABUSER.Width;
    LABHORA.top := frmPrincipal.Height - 90;

    spExtrato.Enabled := ExtratoNovoRegistro1.enabled;
    spSituacaoDeBoleto.Enabled := BoletoRecibo1.enabled;
    spCadAssoc.Enabled := GDFD1.enabled;
    spLotes.Enabled := LotesRecuperaodeCrditos1.Enabled;
end;

procedure TfrmPrincipal.spCadAssocClick(Sender: TObject);
begin
    try application.createForm(TfrmLocAssoc, frmLocAssoc);
        frmLocAssoc.showmodal;
    finally
        frmLocAssoc.Free;
    end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    labdata.caption := datetostr(DataAtual);
    LABHORA.caption := timetostr(now);
    Application.ProcessMessages;

end;


procedure TfrmPrincipal.spExtratoClick(Sender: TObject);
begin
   try application.createform(tfrmDemonstrativoNovo, frmDemonstrativoNovo);
            frmDemonstrativoNovo.showmodal;
     finally
            frmDemonstrativoNovo.free;
     end;


{    try Application.CreateForm(TfrmDemonstrativo, frmDemonstrativo);
        frmDemonstrativo.showmodal;
    finally
        frmDemonstrativo.free;
    end;}
end;

procedure TfrmPrincipal.DatadoSistema1Click(Sender: TObject);
begin
    try Application.Createform(TfrmDatadoSistema, frmDatadoSistema);
        frmDatadoSistema.showmodal;
    finally
        frmDatadoSistema.free;
    end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPrincipal.ValorContribuio1Click(Sender: TObject);
begin
    try Application.createform(TfrmContribuicaoValores, frmContribuicaoValores);
        frmContribuicaoValores.showmodal;
    finally
        frmContribuicaoValores.free;
    end;
end;

procedure TfrmPrincipal.Documentos2Click(Sender: TObject);
begin
    try application.CreateForm(TfrmTiposDocumento, frmTiposDocumento);
        frmTiposDocumento.showmodal;
    finally
        frmTiposDocumento.free;
    end;
end;

procedure TfrmPrincipal.Contatos1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmTiposContato, frmTiposContato);
        DMGeral.dsTpoContato.DataSet.Open;
        frmTiposContato.showmodal;
        DMGeral.dsTpoContato.DataSet.Close;
    finally
        frmTiposContato.free;
    end;

end;

procedure TfrmPrincipal.ipodeCorrespondncia1Click(Sender: TObject);
begin
    { Try application.CreateForm(TfrmTiposCorrespondencia,frmTiposCorrespondencia);
     frmTiposCorrespondencia.showmodal;
     finally
     frmTiposCorrespondencia.free;
     end;
     }
end;

procedure TfrmPrincipal.SituaodeCorrespondncia1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmSituacaoCorresp, frmSituacaoCorresp);
        frmSituacaoCorresp.showmodal;
    finally
        frmSituacaoCorresp.free;
    end;

end;

procedure TfrmPrincipal.ipodeMovimentao1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmTipoMovimentacao, frmTipoMovimentacao);
        frmTipoMovimentacao.showmodal;
    finally
        frmTipoMovimentacao.free;
    end;
end;

procedure TfrmPrincipal.BoletoRecibo1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmBoletoRecibo, frmBoletoRecibo);
        frmBoletoRecibo.showmodal;
    finally
        frmBoletoRecibo.free;
    end;
end;

procedure TfrmPrincipal.spSairClick(Sender: TObject);
begin
    close;
end;

procedure TfrmPrincipal.spRelatoriosClick(Sender: TObject);
begin
    try application.CreateForm(TfrmRelatorio, frmRelatorio);
        frmRelatorio.showmodal;
    finally
        frmRelatorio.free;
    end;
end;

procedure TfrmPrincipal.LeituradeRetorno1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmRetorno, frmRetorno);
        frmRetorno.showmodal;
    finally
        frmRetorno.free;
    end;
end;

procedure TfrmPrincipal.Cobrana1Click(Sender: TObject);
begin
    //Aviso('Tela de Cobrança em Manutenção. ');
 {   try application.CreateForm(TfrmCobranca, frmCobranca);
        frmCobranca.showmodal;
    finally
        frmCobranca.free;
    end;
  }

end;

procedure TfrmPrincipal.Inadimplncia1Click(Sender: TObject);
begin
    try application.createForm(TfrmInadimplencia, frmInadimplencia);
        frmInadimplencia.showmodal;
    finally
        frmInadimplencia.Free;
    end;
end;

procedure TfrmPrincipal.ListagemdeFiliados1Click(Sender: TObject);
begin
    // Aviso('Tela - Listagem de Filiados em Manutenção. ');
    try application.createForm(TfrmRelatListagemFiliado, frmRelatListagemFiliado);
        frmRelatListagemFiliado.showmodal;
    finally
        frmRelatListagemFiliado.Free;
    end;
end;

procedure TfrmPrincipal.Parcelamentos1Click(Sender: TObject);
begin
    try application.createform(TfrmRelatParcOpcoes, frmRelatParcOpcoes);
        if frmRelatParcOpcoes.showmodal = mrok then
        begin
            if frmRelatParcOpcoes.radTotais.Checked = true then
            begin
                ExibeAguarde('Gerando Relatório. Aguarde...');
                try application.createform(TQrParcelamentosTotais, QrParcelamentosTotais);
                    QrParcelamentosTotais.cdsParcsTotais.Close;

                    if frmRelatParcOpcoes.cbTipoParc1.ItemIndex = 0 then
                    begin
                        QrParcelamentosTotais.sdsParcsTotais.CommandText := 'select total_parcs_firmados, total_parcs_ativos, total_parcs_desativados, total_parcs_quitados, total_parcs_aberto, total_parcs_emdia, total_parcs_ematraso  from proc_parcel_totais(:tipo,:filtro) ';
                        QrParcelamentosTotais.labtipo.caption := '(Parcelamento Método Antigo)';
                    end
                    else
                    begin
                        QrParcelamentosTotais.sdsParcsTotais.CommandText := 'select total_parcs_firmados, total_parcs_ativos, total_parcs_desativados, total_parcs_quitados, total_parcs_aberto, total_parcs_emdia, total_parcs_ematraso from proc_parcel_totais_novo(:tipo, :filtro) ';
                        QrParcelamentosTotais.labtipo.caption := '(Parcelamento Método Novo)';
                    end;
                    QrParcelamentosTotais.cdsParcsTotais.FetchParams;
                    QrParcelamentosTotais.cdsParcsTotais.Params.ParamByName('tipo').value := frmRelatParcOpcoes.comboTipo.ItemIndex;
                    QrParcelamentosTotais.cdsParcsTotais.Params.ParamByName('filtro').value := frmRelatParcOpcoes.comboFiltro.ItemIndex + 1;
                    QrParcelamentosTotais.cdsParcsTotais.Open;

                    if frmRelatParcOpcoes.comboTipo.ItemIndex = 0 then
                        QrParcelamentosTotais.labtitulo.caption := 'Contribuições Sindical e Confederativa'
                    else
                        QrParcelamentosTotais.labtitulo.caption := 'Contribuição ' + frmRelatParcOpcoes.comboTipo.Text;


                    QrParcelamentosTotais.labtitulo.caption := QrParcelamentosTotais.labtitulo.caption + ' (Filtro: ' + frmRelatParcOpcoes.comboFiltro.text + ')';
                    EscondeAguarde;
                    QrParcelamentosTotais.Preview;
                    QrParcelamentosTotais.cdsParcsTotais.Close;
                finally
                    QrParcelamentosTotais.free;
                end;
            end
            else
                if frmRelatParcOpcoes.radAtivos.Checked = true then
            begin
                try application.CreateForm(TfrmRelatParcelamentos, frmRelatParcelamentos);
                    frmRelatParcelamentos.showmodal;
                finally
                    frmRelatParcelamentos.free;
                end;
            end
        end;
    finally
        frmRelatParcOpcoes.free;
    end;
end;

procedure TfrmPrincipal.Filiadosemdia1Click(Sender: TObject);
begin
    Aviso('Tela - Filiados em dia em Manutenção. ');
    {  try application.createform(TfrmFiliadosEmdia,frmFiliadosEmdia);
      frmFiliadosEmdia.showmodal;
      finally
      frmFiliadosEmdia.free;
      end; }
end;

procedure TfrmPrincipal.Selic1Click(Sender: TObject);
begin
    try Application.CreateForm(TfrmIndices, frmIndices);
        DmGeral.cdsIndice.Open;
        frmIndices.showmodal;
        DmGeral.cdsIndice.close;
    finally
        frmIndices.free;
    end;
end;

procedure TfrmPrincipal.IGPM1Click(Sender: TObject);
begin
    try Application.CreateForm(TfrmIndiceIgpm, frmIndiceIgpm);
        DmGeral.cdsIndiceigpm.Open;
        frmIndiceIgpm.showmodal;
        DmGeral.cdsIndiceigpm.close;
    finally
        frmIndiceIgpm.free;
    end;

end;

procedure TfrmPrincipal.ResumoCadastral1Click(Sender: TObject);
begin
    try
        try application.createForm(TQRSituacaoCad, QRSituacaoCad);
            Dmassociado.cdsProc_ResumoCad.close;
            Dmassociado.cdsProc_ResumoCad.Params.ParamByName('dataatual').value := DataAtual;
            Dmassociado.cdsProc_ResumoCad.Open;
            QRSituacaoCad.labdata.caption := QRSituacaoCad.labdata.caption + ' ' + Datetostr(DataAtual);
            QRSituacaoCad.preview;

        finally
            QRSituacaoCad.free;
        end;
    except
        QRSituacaoCad.free;
    end;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
//    DeleteDirectory(ExtractFilePath(Application.ExeName) + 'email', false);
    // CreateDir(ExtractFilePath(Application.ExeName) +'email');
//    DeleteDirectory(ExtractFilePath(Application.ExeName) + 'anexos', false);
    // CreateDir(ExtractFilePath(Application.ExeName) +'anexos');
end;

procedure TfrmPrincipal.MovimentoporPerodo1Click(Sender: TObject);
begin
    try application.createform(TfrmRelatMovimentoPeriodo, frmRelatMovimentoPeriodo);
        frmRelatMovimentoPeriodo.showmodal;
    finally
        frmRelatMovimentoPeriodo.free;
    end;
end;

procedure TfrmPrincipal.MalaDireta1Click(Sender: TObject);
begin
    try application.createform(TfrmMalaDiretaCadastro, frmMalaDiretaCadastro);
        frmMalaDiretaCadastro.showmodal;
    finally
        frmMalaDiretaCadastro.free;
    end;
end;

procedure TfrmPrincipal.SimulaodeValordeGuia1Click(Sender: TObject);
begin
    try application.createform(TfrmSimulacaoGuia, frmSimulacaoGuia);
        frmSimulacaoGuia.showmodal;
    finally
        frmSimulacaoGuia.free;
    end;
end;

procedure TfrmPrincipal.RecebimentosporPerodoGuias1Click(Sender: TObject);
begin
    try
        Application.CreateForm(tfrmRelatRecebimentos, frmRelatRecebimentos);
        frmRelatRecebimentos.showmodal;
    finally
        frmRelatRecebimentos.free;
    end;
end;

procedure TfrmPrincipal.GuiasNoIdentificadas1Click(Sender: TObject);
begin
    try
        Application.CreateForm(tfrmRelatGuiasNaoIdent, frmRelatGuiasNaoIdent);
        frmRelatGuiasNaoIdent.showmodal;
    finally
        frmRelatGuiasNaoIdent.free;
    end;
end;

procedure TfrmPrincipal.MovimentaoporPerodo1Click(Sender: TObject);
begin
  //
  try Application.createform(tfrmRelatMovimento,frmRelatMovimento);
  frmRelatMovimento.showmodal;
  finally
  frmRelatMovimento.free;
  end;
end;

procedure TfrmPrincipal.AdesoaoSimplesNacional1Click(Sender: TObject);
begin
  try application.createform(TfrmRelatSimplesNacional,frmRelatSimplesNacional);
  frmRelatSimplesNacional.showmodal;
  finally
  frmRelatSimplesNacional.free;
  end;
end;

procedure TfrmPrincipal.AtendimentosObservaes1Click(Sender: TObject);
begin

  try application.createform(tfrmRelatAtendimentos,frmRelatAtendimentos);
  frmRelatAtendimentos.showmodal;
  finally
  frmRelatAtendimentos.free;
  end;

end;

procedure TfrmPrincipal.spLotesClick(Sender: TObject);
begin
  try application.createform(tfrmLotesControle,frmLotesControle);
  frmLotesControle.showmodal;
  finally
  frmLotesControle.free;
  end;
end;

procedure TfrmPrincipal.RepassedePagamentos1Click(Sender: TObject);
begin
     try application.createform(tfrmLotesRelatRepasse, frmLotesRelatRepasse);
            frmLotesRelatRepasse.showmodal;
     finally
            frmLotesRelatRepasse.free;
     end;
end;

procedure TfrmPrincipal.Remessa1Click(Sender: TObject);
begin
   try application.createform(tfrmRemessa, frmRemessa);
            frmRemessa.showmodal;
     finally
            frmRemessa.free;
     end;

end;

procedure TfrmPrincipal.ExtratoNovoRegistroNova1Click(Sender: TObject);
begin
  { try application.createform(tfrmDemonstrativoNovo, frmDemonstrativoNovo);
            frmDemonstrativoNovo.showmodal;
     finally
            frmDemonstrativoNovo.free;
     end; }

end;

procedure TfrmPrincipal.LogdeEnviodeRemessa1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmLogRemessa, frmLogRemessa);
        frmLogRemessa.showmodal;
    finally
        frmLogRemessa.free;
    end;

end;

procedure TfrmPrincipal.ArquivodePrCrtica1Click(Sender: TObject);
begin
    try application.CreateForm(TfrmLerPreCritica, frmLerPreCritica);
        frmLerPreCritica.showmodal;
    finally
        frmLerPreCritica.free;
    end;

end;

end.


