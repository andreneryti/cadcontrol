program CadControl;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UFuncoes in 'UFuncoes.pas',
  UDMConexao in 'UDMConexao.pas' {DMConexao: TDataModule},
  UnitModeloLoc in 'UnitModeloLoc.pas' {ModeloLocalizar},
  UnitModeloInserir in 'UnitModeloInserir.pas' {ModeloInserir},
  UnitLocAssoc in 'UnitLocAssoc.pas' {frmLocAssoc},
  UDMAssociado in 'UDMAssociado.pas' {DMAssociado: TDataModule},
  UnitModeloComum in 'UnitModeloComum.pas' {ModeloComum},
  UNovoAssocInicial in 'UNovoAssocInicial.pas' {frmNovoAssocInicial},
  captura in 'captura.pas' {frmCaptura},
  Camera in 'Camera.pas',
  AviCaptura in 'AviCaptura.pas',
  UNovaObs in 'UNovaObs.pas' {frmNovaObs},
  UnitModeloRelatorio in 'UnitModeloRelatorio.pas' {ModeloRelatorio: TQuickRep},
  UQR_OBS in 'UQR_OBS.pas' {QR_OBS: TQuickRep},
  UNovoEnder in 'UNovoEnder.pas' {frmNovoEnder},
  UNovoContato in 'UNovoContato.pas' {frmNovoContato},
  UNovaCorresp in 'UNovaCorresp.pas' {frmNovaCorresp: Unit1},
  UNovoRelacionamento in 'UNovoRelacionamento.pas' {frmNovoRelacionamento},
  UBuscaAssoc in 'UBuscaAssoc.pas' {frmBuscaAssoc},
  UNovoCapSocial in 'UNovoCapSocial.pas' {frmNovoCapSocial},
  UNovoSegmento in 'UNovoSegmento.pas' {frmNovoSegmento},
  UNovoAssocSindic in 'UNovoAssocSindic.pas' {frmNovoAssocSindic},
  USindicatoAdd in 'USindicatoAdd.pas' {frmSindicatoAdd},
  UDocsEntregueEditar in 'UDocsEntregueEditar.pas' {frmDocsEntregueEditar},
  UNovoAnexo in 'UNovoAnexo.pas' {frmNovoAnexo},
  UNovaMovimentacao in 'UNovaMovimentacao.pas' {frmNovaMovimentacao},
  UQR_Movimentacao in 'UQR_Movimentacao.pas' {QR_Movimentacao: TQuickRep},
  UDmFinancas in 'UDmFinancas.pas' {DmFinancas: TDataModule},
  UGerarPrevisao in 'UGerarPrevisao.pas' {frmGerarPrevisao},
  UBoleto in 'UBoleto.pas' {frmBoleto},
  UDmBoleto in 'UDmBoleto.pas' {DmBoleto: TDataModule},
  UBoletoVencimento in 'UBoletoVencimento.pas' {frmBoletoVencimento},
  gbCobranca in 'gbCobranca.pas',
  gbCob104 in 'gbCob104.pas',
  UBoletoOpcoes in 'UBoletoOpcoes.pas' {frmBoletoOpcoes},
  uImp_GRCS in 'uImp_GRCS.pas' {Imp_GRCS: TQuickRep},
  Guias in 'Guias.pas',
  uGuias in 'uGuias.pas',
  UPrintOpcoes in 'UPrintOpcoes.pas' {frmPrintOpcoes},
  UExtratoOpcoes in 'UExtratoOpcoes.pas' {frmExtratoOpcoes},
  UQRExtrato in 'UQRExtrato.pas' {QRExtrato: TQuickRep},
  UPrescricao in 'UPrescricao.pas' {frmPrescricao},
  UDemonstrativo in 'UDemonstrativo.pas' {frmDemonstrativo},
  UQRExtratoRecepcao in 'UQRExtratoRecepcao.pas' {QRExtratoRecepcao: TQuickRep},
  UParcelamentoContribs in 'UParcelamentoContribs.pas' {frmParcelamentoContribs},
  UParcelamentoNovoOpcoes in 'UParcelamentoNovoOpcoes.pas' {frmParcelamentoNovoOpcoes},
  UManutAnuidades in 'UManutAnuidades.pas' {frmManutAnuidades},
  gbBoleto_A4SIGCB_new in 'gbBoleto_A4SIGCB_new.pas' {Boleto_A4SIGCB: TQuickRep},
  UManutAnuidadesRegPagto in 'UManutAnuidadesRegPagto.pas' {frmManutAnuidadesRegPagto},
  UManutParcelamento in 'UManutParcelamento.pas' {frmManutParcelamento},
  UAlterDadosBasicos in 'UAlterDadosBasicos.pas' {frmAlterDadosBasicos},
  UDatadoSistema in 'UDatadoSistema.pas' {frmDatadoSistema},
  UIndices in 'UIndices.pas' {frmIndices},
  UDMGeral in 'UDMGeral.pas' {DMGeral: TDataModule},
  UIndiceNovo in 'UIndiceNovo.pas' {frmIndiceNovo},
  UContribuicaoValores in 'UContribuicaoValores.pas' {frmContribuicaoValores},
  UTiposDocumento in 'UTiposDocumento.pas' {frmTiposDocumento},
  UTiposContato in 'UTiposContato.pas' {frmTiposContato},
  UTiposCorrespondencia in 'UTiposCorrespondencia.pas' {frmTiposCorrespondencia},
  USituacaoCorresp in 'USituacaoCorresp.pas' {frmSituacaoCorresp},
  UTipoMovimentacao in 'UTipoMovimentacao.pas' {frmTipoMovimentacao},
  UBoletoRecibo in 'UBoletoRecibo.pas' {frmBoletoRecibo},
  UfrmRelatorio in 'UfrmRelatorio.pas' {frmRelatorio},
  UTipoContato in 'UTipoContato.pas' {frmTipoContato},
  UValorContribNovo in 'UValorContribNovo.pas' {frmValorContribNovo},
  UTipoMovimentoNovo in 'UTipoMovimentoNovo.pas' {frmTipoMovimentoNovo},
  UQRSituacaoBoletosImpressao in 'UQRSituacaoBoletosImpressao.pas' {QRSituacaoBoletosImpressao: TQuickRep},
  URetorno in 'URetorno.pas' {frmRetorno},
  UQRRetornoResult in 'UQRRetornoResult.pas' {QRRetornoResult: TQuickRep},
  UDadosGuiaComplementar in 'UDadosGuiaComplementar.pas' {frmDadosGuiaComplementar},
  UBoletoVencinento in 'UBoletoVencinento.pas' {frmBoletoVencinento},
  UOpcoes_Etiq_Envelop in 'UOpcoes_Etiq_Envelop.pas' {FrmOpcoes_Etiq_Env},
  UQR_Envelope_A4 in 'UQR_Envelope_A4.pas' {QR_Envelope_A4: TQuickRep},
  UQR_Envelope_MG in 'UQR_Envelope_MG.pas' {QR_Envelope_MG: TQuickRep},
  UQR_Envelope_MG_TipoOficio in 'UQR_Envelope_MG_TipoOficio.pas' {QR_Envelope_MG_TipoOficio: TQuickRep},
  UEtiquetas in 'UEtiquetas.pas' {frmEtiqueta},
  UOpenOffice in 'UOpenOffice.pas',
  UEnvelopeTipo in 'UEnvelopeTipo.pas' {frmEnvelopeTipo},
  UInadimplencia in 'UInadimplencia.pas' {frmInadimplencia},
  URelatListagemFiliado in 'URelatListagemFiliado.pas' {frmRelatListagemFiliado},
  UFichaCadastral in 'UFichaCadastral.pas' {QRFichaCadastral: TQuickRep},
  URegistrarPagto in 'URegistrarPagto.pas' {frmRegistrarPagto},
  UQRParcelamento in 'UQRParcelamento.pas' {QRParcelamento: TQuickRep},
  UnitRelatParcelOpcoes in 'UnitRelatParcelOpcoes.pas' {frmRelatParcOpcoes},
  UQrParcelsTotais in 'UQrParcelsTotais.pas' {QrParcelamentosTotais: TQuickRep},
  UnitRelatParcelamentos in 'UnitRelatParcelamentos.pas' {frmRelatParcelamentos},
  UQRParcelamentoNovo in 'UQRParcelamentoNovo.pas' {QRParcelamentoNovo: TQuickRep},
  UFiliadosEmdia in 'UFiliadosEmdia.pas' {frmFiliadosEmdia},
  UIndicesIgpm in 'UIndicesIgpm.pas' {frmIndiceIgpm},
  UIndiceIgpmNovo in 'UIndiceIgpmNovo.pas' {frmIndiceIgpmNovo},
  UFormParcelaAlterDados in 'UFormParcelaAlterDados.pas' {FormParcelaAlterDados},
  UOpcoesMetodo in 'UOpcoesMetodo.pas' {FormOpcoesMetodo},
  UParcelamentoAntigoOpcoes in 'UParcelamentoAntigoOpcoes.pas' {frmParcelamentoAntigoOpcoes},
  UInadimpCobrancaOpcoes in 'UInadimpCobrancaOpcoes.pas' {frmInadimpCobrancaOpcoes},
  UVenctoConfederativaInad in 'UVenctoConfederativaInad.pas' {FrmVenctoConfederativaInad},
  UQRSituacaoCad in 'UQRSituacaoCad.pas' {QRSituacaoCad: TQuickRep},
  UExtratoEnvioEmail in 'UExtratoEnvioEmail.pas' {frmExtratoEnviarEmail},
  URecebo in 'URecebo.pas' {QrRecibo: TQuickRep},
  URelatMovimentoPeriodo in 'URelatMovimentoPeriodo.pas' {frmRelatMovimentoPeriodo},
  URelatRecibimentos in 'URelatRecibimentos.pas' {frmRelatRecibimentos: TQuickRep},
  UfrmMalaDiretaCadastro in 'UfrmMalaDiretaCadastro.pas' {frmMalaDiretaCadastro},
  UMalaDiretaNova in 'UMalaDiretaNova.pas' {frmMalaDiretaNova},
  UDMMalaDireta in 'UDMMalaDireta.pas' {DMMalaDireta: TDataModule},
  UMalaDiretaVisualizar in 'UMalaDiretaVisualizar.pas' {frmMalaDiretaVisualizar},
  UQRItensMala in 'UQRItensMala.pas' {QRItensMala: TQuickRep},
  UParcelamentoMalaDireta in 'UParcelamentoMalaDireta.pas' {frmParcelamentoMalaDireta},
  USimulacaoGuia in 'USimulacaoGuia.pas' {frmSimulacaoGuia},
  UipoIsencao in 'UipoIsencao.pas' {frmTipoIsencao},
  URelatRecebimentos in 'URelatRecebimentos.pas' {frmRelatRecebimentos},
  URelatGuiasNaoIdent in 'URelatGuiasNaoIdent.pas' {frmRelatGuiasNaoIdent},
  URelatMovimento in 'URelatMovimento.pas' {frmRelatMovimento},
  URelatSimplesNacional in 'URelatSimplesNacional.pas' {frmRelatSimplesNacional},
  URelatAtendimentos in 'URelatAtendimentos.pas' {frmRelatAtendimentos},
  UDmlotes in 'UDmlotes.pas' {DMLotes: TDataModule},
  Ulotes in 'Ulotes.pas' {frmLote},
  ULoteNovo in 'ULoteNovo.pas' {frmLoteNovo},
  ULoteAdicionarRegs in 'ULoteAdicionarRegs.pas' {frmLoteAdicionarRegs},
  ULoteGeraDocumento in 'ULoteGeraDocumento.pas' {frmLoteGeraDocumento},
  ULotesAtualizarValores in 'ULotesAtualizarValores.pas' {frmLotesAtualizarValores},
  ULotesRelatStatus in 'ULotesRelatStatus.pas' {frmLotesRelatStatus},
  ULotesRelatRepasse in 'ULotesRelatRepasse.pas' {frmLotesRelatRepasse},
  UqrRelatAddLote in 'UqrRelatAddLote.pas' {qrRelatAddLote: TQuickRep},
  UQrNotificacaoExtraJud in 'UQrNotificacaoExtraJud.pas' {QrNotificacaoExtraJud: TQuickRep},
  ULotesControle in 'ULotesControle.pas' {frmLotesControle},
  UnLoteLocRegistro in 'UnLoteLocRegistro.pas' {frmLoteLocRegistro},
  ntdll in 'ntdll.pas',
  ULoteControleAddContrib in 'ULoteControleAddContrib.pas' {frmLoteControleAddContrib},
  ULoteRepasseDados in 'ULoteRepasseDados.pas' {frmLoteRepasseDados},
  UQrRepasse in 'UQrRepasse.pas' {QrRepasse: TQuickRep},
  URelatRepasseRelats in 'URelatRepasseRelats.pas' {frmRelatRepasseRelats},
  UQRConfissaoDivida in 'UQRConfissaoDivida.pas' {QRConfissaoDivida: TQuickRep},
  UfrmTermoImprimirOpcoes in 'UfrmTermoImprimirOpcoes.pas' {frmTermoImprimirOpcoes},
  UConfDividaDadosComprom in 'UConfDividaDadosComprom.pas' {frmConfDividaDadosComprom},
  UQrNotExtrajudicial in 'UQrNotExtrajudicial.pas' {QrNotExtrajudicial: TQuickRep},
  UQRConfissaoDividaParcelNovo in 'UQRConfissaoDividaParcelNovo.pas' {QRConfissaoDividaParcelNovo: TQuickRep},
  UDocumentoAdd in 'UDocumentoAdd.pas' {frmDocumentoAdd},
  ULoteItemVerContribs in 'ULoteItemVerContribs.pas' {frmLoteItemVerContribs},
  URemessa in 'URemessa.pas' {frmRemessa},
  UDemonstrativoNovo in 'UDemonstrativoNovo.pas' {frmDemonstrativoNovo},
  uImp_GRCS_CR in 'uImp_GRCS_CR.pas' {Imp_GRCS_CR: TQuickRep},
  UNovoAssoc in 'UNovoAssoc.pas' {frmNovoAssoc},
  UNovoAssoc2 in 'UNovoAssoc2.pas' {frmNovoAssoc2},
  ULogRemessa in 'ULogRemessa.pas' {frmLogRemessa},
  ULerPreCritica in 'ULerPreCritica.pas' {frmLerPreCritica};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CADCONTROL - Sistema de Controle Cadastral';
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TDMAssociado, DMAssociado);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TModeloLocalizar, ModeloLocalizar);
  Application.CreateForm(TModeloInserir, ModeloInserir);
  Application.CreateForm(TModeloComum, ModeloComum);
  Application.CreateForm(TDmFinancas, DmFinancas);
  Application.CreateForm(TDmBoleto, DmBoleto);
  Application.CreateForm(TDMGeral, DMGeral);
  Application.CreateForm(TDMMalaDireta, DMMalaDireta);
  Application.CreateForm(TDMLotes, DMLotes);
  Application.Run;
end.
