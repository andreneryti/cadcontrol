{******************************************************************************}
{ Projeto: gbBoleto                                                            }
{ Biblioteca multi plataforma de componentes Delphi para interação com bancos  }
{ na impressão de Boletos e Controle de Cobranças                              }
{                                                                              }
{ Direitos Autorais Reservados (c) 2005 Projeto Delphi Boleto                  }
{                                       Genilton Barbosa                       }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Histórico
|*
|* 19/12/2005: Alexandre Oliveira e Alexandre Rocha Lima e Marcondes
|*  - Primeira Versao gbBoleto no ACBr
******************************************************************************}

unit gbBoleto_A4SIGCB_new;

interface

uses Classes, Controls, ExtCtrls, QuickRpt, Qrctrls, Graphics, QRBarcode, jpeg, SysUtils;

type
    TBoleto_A4SIGCB = class(TQuickRep)
        QRBand_SIGCB: TQRBand;
        QRLabel1: TQRLabel;
        QRLabel2: TQRLabel;
        QRLabel3: TQRLabel;
        QRLabel8: TQRLabel;
        QRShape4: TQRShape;
        QRShape5: TQRShape;
        QRShape6: TQRShape;
        QRShape9: TQRShape;
        QRLabel10: TQRLabel;
        QRLabel11: TQRLabel;
        QRLabel12: TQRLabel;
        QRLabel14: TQRLabel;
        QRLabel15: TQRLabel;
        QRLabel16: TQRLabel;
        QRLabel17: TQRLabel;
        QRLabel18: TQRLabel;
        txtMoedac: TQRLabel;
        txtAceitec: TQRLabel;
        txtCarteirac: TQRLabel;
        txtEspecieDocumentoc: TQRLabel;
        txtNumeroDocumentoc: TQRLabel;
        txtNossoNumeroc: TQRLabel;
        txtAgenciaCodigoCedentec: TQRLabel;
        txtNomeCedentec: TQRLabel;
        QRLabel23: TQRLabel;
        txtDataDocumentoc: TQRLabel;
        QRLabel24: TQRLabel;
        QRLabel25: TQRLabel;
        txtcpfcnpj: TQRLabel;
        QRLabel27: TQRLabel;
        QRLabel28: TQRLabel;
        txtVencimento: TQRLabel;
        txtvalor_titulo: TQRLabel;
        QRLabel36: TQRLabel;
        QRShape11: TQRShape;
        QRShape14: TQRShape;
        QRShape15: TQRShape;
        QRLabel40: TQRLabel;
        QRShape16: TQRShape;
        QRLabel41: TQRLabel;
        QRShape17: TQRShape;
        QRLabel42: TQRLabel;
        QRLabel43: TQRLabel;
        QRShape18: TQRShape;
        QRShape19: TQRShape;
        QRLabel45: TQRLabel;
        QRShape20: TQRShape;
        QRLabel46: TQRLabel;
        QRLabel47: TQRLabel;
        QRShape21: TQRShape;
        QRLabel48: TQRLabel;
        QRShape22: TQRShape;
        QRLabel49: TQRLabel;
        QRLabel51: TQRLabel;
        QRShape23: TQRShape;
        QRShape24: TQRShape;
        QRLabel54: TQRLabel;
        QRLabel55: TQRLabel;
        QRLabel56: TQRLabel;
        QRShape25: TQRShape;
        QRShape26: TQRShape;
        QRShape27: TQRShape;
        QRLabel57: TQRLabel;
        QRLabel58: TQRLabel;
        QRLabel59: TQRLabel;
        QRLabel60: TQRLabel;
        QRShape28: TQRShape;
        QRLabel61: TQRLabel;
        QRLabel65: TQRLabel;
        QRShape29: TQRShape;
        QRLabel66: TQRLabel;
        QRLabel67: TQRLabel;
        txtValorDocumento_SIGCB: TQRLabel;
        txtDataVencimento_SIGCB: TQRLabel;
        txtLinhaDigitavel_SIGCB: TQRLabel;
        imgCodigoBarras_SIGCB: TQRImage;
        txtSacadoNome_SIGCB: TQRLabel;
        txtSacadoRuaNumeroComplemento_SIGCB: TQRLabel;
        txtSacadoCEPBairroCidadeEstado_SIGCB: TQRLabel;
        lblSacadoCPFCGC3: TQRLabel;
        txtSacadoCPFCGC_SIGCB: TQRLabel;
        lblCodigoBaixa3: TQRLabel;
        txtAgenciaCodigoCedente_SIGCB: TQRLabel;
        txtCodigoBanco_SIGCB: TQRLabel;
        txtInstrucoes_SIGCB: TQRMemo;
        lblInstrucoes3: TQRLabel;
        txtLocalPagamento_SIGCB: TQRLabel;
        txtNomeCedente_SIGCB: TQRLabel;
        txtDataDocumento_SIGCB: TQRLabel;
        txtNumeroDocumento_SIGCB: TQRLabel;
        txtEspecieDocumento_SIGCB: TQRLabel;
        txtAceite_SIGCB: TQRLabel;
        txtDataProcessamento_SIGCB: TQRLabel;
        txtValorMoeda_SIGCB: TQRLabel;
        txtQuantidadeMoeda_SIGCB: TQRLabel;
        txtEspecieMoeda_SIGCB: TQRLabel;
        txtCarteira_SIGCB: TQRLabel;
        txtUsoBanco_SIGCB: TQRLabel;
        txtInstrucoesc: TQRMemo;
        txtSacadoNomec: TQRLabel;
        txtSacadoRuaNumeroComplementoc: TQRLabel;
        txtSacadoCEPBairroCidadeEstadoc: TQRLabel;
        txtSacadoBairroCidadeEstadoc: TQRLabel;
        QRLabel4: TQRLabel;
        QRLabel5: TQRLabel;
        QRLabel6: TQRLabel;
        QRLabel9: TQRLabel;
        QRShape2: TQRShape;
        QRShape7: TQRShape;
        QRShape3: TQRShape;
        QRShape8: TQRShape;
        txtValorDescontoAbatimento_SIGCB: TQRLabel;
        txtValorDescontoAbatimentoB_SIGCB: TQRLabel;
        txtValorMoraMulta_SIGCB: TQRLabel;
        txtValorMoraMultaB_SIGCB: TQRLabel;
        txtValorCobrado_SIGCB: TQRLabel;
        txtDataVencimentoc: TQRLabel;
        txtValorDocumentoc: TQRLabel;
        QRImage1: TQRImage;
        QRImage2: TQRImage;
        QRShape33: TQRShape;
        txtNossoNum_SIGCB: TQRLabel;
        QRLabel7: TQRLabel;
        QRLabel13: TQRLabel;
        QRLabel19: TQRLabel;
        QRLabel20: TQRLabel;
        QRLabel21: TQRLabel;
        QRLabel22: TQRLabel;
        QRLabel26: TQRLabel;
        QRLabel29: TQRLabel;
        QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape1: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape41: TQRShape;
    QRShape13: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
        procedure QRLabel13Print(sender: TObject; var Value: string);
        procedure QRLabel31Print(sender: TObject; var Value: string);
    private

    public

    end;

var
    Boleto_A4SIGCB: TBoleto_A4SIGCB;

implementation

uses UDMConexao;



{$R *.DFM}

procedure TBoleto_A4SIGCB.QRLabel13Print(sender: TObject;
    var Value: string);
begin
    value := txtLinhaDigitavel_SIGCB.Caption;
end;

procedure TBoleto_A4SIGCB.QRLabel31Print(sender: TObject;
    var Value: string);
var
    end1, end2, cidade: string;
begin
    DMConexao.sdsConfig.first;
    if txtAgenciaCodigoCedentec.caption = '0174/283219-4' then //Est
    begin
       if DMConexao.sdsConfigEMP_ID.value = 1 then
           DMConexao.sdsConfig.Next;
        cidade := 'NITERÓI';
    end
    else
    begin
         if DMConexao.sdsConfigEMP_ID.value = 1 then
         DMConexao.sdsConfig.prior;
         cidade := 'Rio de Janeiro';
    end;

    end1 := DMConexao.sdsConfigENDER_LOGRADOURO.value;
    if DmConexao.sdsConfigENDER_NUMERO.value <> '' then
        end1 := end1 + ', ' + DmConexao.sdsConfigENDER_NUMERO.value;

    if DmConexao.sdsConfigENDER_COMPLEMENTO.value <> '' then
        end1 := end1 + ', ' + DmConexao.sdsConfigENDER_COMPLEMENTO.value;

    if DmConexao.sdsConfigENDER_BAIRRO.value <> '' then
        end1 := end1 + ', ' + DmConexao.sdsConfigENDER_BAIRRO.value;

    end2 := copy(DmConexao.sdsConfigENDER_CEP.value,1,2)+'.'+copy(DmConexao.sdsConfigENDER_CEP.value,3,3)+'-'+copy(DmConexao.sdsConfigENDER_CEP.value,6,3) + ', ' + cidade + ' / RJ.';

    value := StringReplace(UpperCase( end1 + '- CEP. ' + end2),'ç','Ç',[rfreplaceall]);
end;

end.

