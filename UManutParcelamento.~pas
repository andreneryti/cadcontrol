unit UManutParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, DB, DBClient, StdCtrls,
  Buttons, Grids, DBGrids;

type
  TfrmManutParcelamento = class(TModeloComum)
    DBGrid1: TDBGrid;
    btPagar: TBitBtn;
    cdsDebitos: TClientDataSet;
    cdsDebitosParc_ID: TIntegerField;
    cdsDebitosDESCRICAO: TStringField;
    cdsDebitosVALOR: TFMTBCDField;
    cdsDebitosVENCIMENTO: TDateField;
    cdsDebitosMULTA: TFMTBCDField;
    cdsDebitosJUROS: TFMTBCDField;
    cdsDebitosCORRECAO: TFMTBCDField;
    cdsDebitosTOTAL: TFMTBCDField;
    cdsDebitosnossonumero: TStringField;
    cdsDebitosDtPagto: TDateField;
    cdsDebitosValorPago: TFloatField;
    dsDebitos: TDataSource;
    btCancelar: TBitBtn;
    labParcelamento: TLabel;
    btSair: TBitBtn;
    cdsDebitosEmp_id: TIntegerField;
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPagarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutParcelamento: TfrmManutParcelamento;

implementation

uses UManutAnuidadesRegPagto, UDmBoleto, UDMAssociado, UDmFinancas,
  UFuncoes, UDMConexao, URecebo, UBoleto;

{$R *.dfm}

procedure TfrmManutParcelamento.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutParcelamento.FormCreate(Sender: TObject);
begin
  inherited;
  cdsDebitos.CreateDataSet;
end;

procedure TfrmManutParcelamento.btPagarClick(Sender: TObject);
var
  recibo:string;
  conta,bol_id:integer;
begin
  inherited;
If cdsDebitosnossonumero.Value <>'' then
  begin
      Aviso('Contribuição selecionada já está paga. ');
      Abort;
  end;
  if Confirma('Deseja registrar o pagamento da parcela selecionada? ') then
  begin
      try Application.createform(TfrmManutAnuidadesRegPagto,frmManutAnuidadesRegPagto);
      frmManutAnuidadesRegPagto.labDescricao.caption := cdsDebitosDESCRICAO.value;
      frmManutAnuidadesRegPagto.labTotal.caption:='R$ ' + FormatFloat(',0.00', cdsDebitosTOTAL.asfloat);
      frmManutAnuidadesRegPagto.labVencimento.caption:= datetostr(cdsDebitosVENCIMENTO.Value);
      frmManutAnuidadesRegPagto.edValorPago.VALUE := cdsDebitosTOTAL.asfloat;
      frmManutAnuidadesRegPagto.edDtPagto.Text:= datetostr(DataAtual);

      if frmManutAnuidadesRegPagto.showmodal = mrok then
      begin

          dmfinancas.PROC_MANUT_PAGTO.close;
          If cdsDebitosEmp_id.value = 1  then
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 5
          else
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 2;

          dmfinancas.PROC_MANUT_PAGTO.ParamByName('HOJE').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VENCIMENTO').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_TOTAL').value := cdsDebitosTOTAL.asfloat;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('NOSSONUMERO').value := frmManutAnuidadesRegPagto.edRecibo.text;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DT_RECEBIMENTO').value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_PAGO').value := frmManutAnuidadesRegPagto.edValorPago.Value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('PARC_ID').value := cdsDebitosParc_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ANUID_ID').value := 0;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DESCRICAO_ITEM').value := cdsDebitosDESCRICAO.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ExecProc;
          DMConexao.Log('Registro de Pagamento de Parcela (Parcelamento) para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Parc_id:' +inttostr(cdsDebitosParc_ID.value)+'-'+frmManutAnuidadesRegPagto.edRecibo.text, 'O', DMAssociado.cdsAssocASS_ID.value);

          cdsDebitos.Edit;
          cdsDebitosDtPagto.value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.text);
          cdsDebitosnossonumero.value := frmManutAnuidadesRegPagto.edRecibo.Text;
          cdsDebitosValorPago.value := frmManutAnuidadesRegPagto.edValorPago.value;
          cdsDebitos.Post;

      end;
      finally
      frmManutAnuidadesRegPagto.free;
      end;

  end;

  {

  If cdsDebitosnossonumero.Value <>'' then
  begin
      Aviso('Contribuição selecionada já está paga. ');
      Abort;
  end;
  if Confirma('Deseja registrar o pagamento da parcela selecionada? ') then
  begin
      try Application.createform(TfrmManutAnuidadesRegPagto,frmManutAnuidadesRegPagto);
      frmManutAnuidadesRegPagto.labDescricao.caption := cdsDebitosDESCRICAO.value;
      frmManutAnuidadesRegPagto.labTotal.caption:='R$ ' + FormatFloat(',0.00', cdsDebitosTOTAL.asfloat);
      frmManutAnuidadesRegPagto.labVencimento.caption:= datetostr(cdsDebitosVENCIMENTO.Value);
      frmManutAnuidadesRegPagto.edValorPago.VALUE := cdsDebitosTOTAL.asfloat;
      frmManutAnuidadesRegPagto.edDtPagto.Text:= datetostr(DataAtual);

      if frmManutAnuidadesRegPagto.showmodal = mrok then
      begin
      try Application.createform(TfrmManutAnuidadesRegPagto,frmManutAnuidadesRegPagto);
      frmManutAnuidadesRegPagto.labDescricao.caption := cdsDebitosDESCRICAO.value;
      frmManutAnuidadesRegPagto.labTotal.caption:='R$ ' + FormatFloat(',0.00', cdsDebitosTOTAL.asfloat);
      frmManutAnuidadesRegPagto.labVencimento.caption:= datetostr(cdsDebitosVENCIMENTO.Value);
      frmManutAnuidadesRegPagto.edValorPago.VALUE := cdsDebitosTOTAL.asfloat;
      frmManutAnuidadesRegPagto.edDtPagto.Text:= datetostr(DataAtual);

      if frmManutAnuidadesRegPagto.showmodal = mrok then
      begin

          dmfinancas.PROC_MANUT_PAGTO.close;
          If cdsDebitosEmp_id.value = 1  then
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 5
          else
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 2;

          dmfinancas.PROC_MANUT_PAGTO.ParamByName('HOJE').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VENCIMENTO').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_TOTAL').value := cdsDebitosTOTAL.asfloat;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('NOSSONUMERO').value := frmManutAnuidadesRegPagto.edRecibo.text;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DT_RECEBIMENTO').value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_PAGO').value := frmManutAnuidadesRegPagto.edValorPago.Value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('PARC_ID').value := cdsDebitosParc_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ANUID_ID').value := 0;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DESCRICAO_ITEM').value := cdsDebitosDESCRICAO.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ExecProc;
          DMConexao.Log('Registro de Pagamento de Parcela (Parcelamento) para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Parc_id:' +inttostr(cdsDebitosParc_ID.value)+'-'+frmManutAnuidadesRegPagto.edRecibo.text, 'O', DMAssociado.cdsAssocASS_ID.value);

          cdsDebitos.Edit;
          cdsDebitosDtPagto.value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.text);
          cdsDebitosnossonumero.value := frmManutAnuidadesRegPagto.edRecibo.Text;
          cdsDebitosValorPago.value := frmManutAnuidadesRegPagto.edValorPago.value;
          cdsDebitos.Post;

      end;
      finally
      frmManutAnuidadesRegPagto.free;
      end;

          dmfinancas.PROC_MANUT_PAGTO.close;
          If cdsDebitosEmp_id.value = 1  then
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 5
          else
             dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := 2;


          dmassociado.sdsReciboPrint.open;
          recibo := copy(dmassociado.sdsReciboPrintrecibo.value,1,8);
          dmassociado.sdsReciboPrint.close;

          dmfinancas.PROC_MANUT_PAGTO.ParamByName('HOJE').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VENCIMENTO').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_TOTAL').value := cdsDebitosTOTAL.asfloat;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('NOSSONUMERO').value := recibo;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DT_RECEBIMENTO').value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_PAGO').value := frmManutAnuidadesRegPagto.edValorPago.Value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('PARC_ID').value := cdsDebitosParc_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ANUID_ID').value := 0;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DESCRICAO_ITEM').value := cdsDebitosDESCRICAO.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ExecProc;
          DMConexao.Log('Registro de Pagamento de Parcela (Parcelamento) para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Parc_id:' +inttostr(cdsDebitosParc_ID.value)+'-'+frmManutAnuidadesRegPagto.edRecibo.text, 'O', DMAssociado.cdsAssocASS_ID.value);

          cdsDebitos.Edit;
          cdsDebitosDtPagto.value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.text);
          cdsDebitosnossonumero.value := recibo;
          cdsDebitosValorPago.value := frmManutAnuidadesRegPagto.edValorPago.value;
          cdsDebitos.Post;

      try
          DMConexao.StartTransaction;

          Try application.createform(TQrRecibo,QrRecibo);

          QrRecibo.qrlEmpresa.caption := Stringreplace(QrRecibo.qrlEmpresa.caption,'<<localidade>>',Dmassociado.cdsEmp_regiaoREGIAO.value, [rfReplaceAll]);

          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Município' then
          begin
             QrRecibo.LabEndereco1.caption := 'Av. Graça Aranha, 416 - Sala 1108 - Centro - CEP 20030-001';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2524-2859 / 2210-1838 - E-mail: sindicato@sircomrj.com.br - Site: www.sircomrj.com.br';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 30/11/1943';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 34.046.375/0001-04';
             conta := 9;
          end
          else
          If Dmassociado.cdsEmp_regiaoREGIAO.value ='Estado' then
          begin
             QrRecibo.LabEndereco1.caption := 'Rua Dr. Borman, nº 6 - Sala 204 - Niterói - RJ - CEP 24020-320';
             QrRecibo.LabEndereco2.caption := 'Tels.: 2717-8261 / 2524-2859 - E-mail: sindicato@sircomrj.com.br - Site: www.sircomrj.com.br';
             QrRecibo.LabEndereco3.caption := 'Reconhecido pelo Ministério do Trabalho em 30/11/1943';
             QrRecibo.LabEndereco4.caption := 'CNPJ: 30.141.717/0001-14';
             conta := 10;
          end;

          QrRecibo.qrmCedente1.lines.add('Nome: '+Dmassociado.cdsAssocNOME.value);
          If DMAssociado.cdsAssocTP_ASSOC_ID.Value = 1 then
              QrRecibo.qrmCedente1.lines.add('Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CNPJ: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value))
          else
              QrRecibo.qrmCedente1.lines.add('Nº: '+ copy(Dmassociado.cdsAssocREGISTRO.value,1,7)+'/'+copy(Dmassociado.cdsAssocREGISTRO.value,8,4)+'  -   CPF: ' + MaskCPFCGC(DMAssociado.cdsAssocCPFCNPJ.value)) ;

          QrRecibo.qrmCedente2.lines.Assign(QrRecibo.qrmCedente1.lines);

          QrRecibo.labpagto.caption := datetostr(DataAtual);

          QrRecibo.labrecibo.caption := recibo;
          QrRecibo.qrlTotal1.caption := floattostr(frmManutAnuidadesRegPagto.edValorPago.Value);
          //criando o boleto
          try
               bol_id := DMConexao.GeraAutoNumber('GEN_BOLETO_ID', 1);
               DmBoleto.PROC_BOLETO_I.ParamByName('BOL_ID').Value := BOL_ID;
               DmBoleto.PROC_BOLETO_I.ParamByName('ass_ID').Value := DMAssociado.cdsAssocASS_ID.value;
               DmBoleto.PROC_BOLETO_I.ParamByName('CONTA_ID').Value := conta;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_CRIACAO').Value := DataAtual;
               DmBoleto.PROC_BOLETO_I.ParamByName('DT_VENCIMENTO').Value := Dataatual;
               DmBoleto.PROC_BOLETO_I.ParamByName('TP_STATUS_ID').Value :=1;
               DmBoleto.PROC_BOLETO_I.ParamByName('VALOR_TOTAL').Value := cdsDebitosTOTAL.asfloat;
               DmBoleto.PROC_BOLETO_I.ParamByName('NOSSONUMERO').Value := recibo;
               DmBoleto.PROC_BOLETO_I.ParamByName('TPBOLETO_ID').Value := 2;
               DmBoleto.PROC_BOLETO_I.ExecProc;
           except
               Erro('Erro gerando o boleto nº ' + recibo);
               abort;
           end;

          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('BOL_ID').AsInteger := bol_id;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ITEM_BOL_ID').AsInteger := 0;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('PARC_ID').AsInteger := cdsDebitosParc_ID.value;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('ANUID_ID').AsInteger := 0;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('DESCRICAO_ITEM').value := DmFinancas.cdsParcelamentoDESCRICAO_PARC.value +' - ' +cdsDebitosDESCRICAO.value;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_ITEM').value := cdsDebitosVALOR.asfloat;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_MULTA').value := cdsDebitosMULTA.asfloat;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_JUROS').value := cdsDebitosJUROS.asfloat;
          DmBoleto.PROC_BOLETO_ITENS_I.ParamByName('VALOR_CORRECAO').value := cdsDebitosCORRECAO.asfloat;
          DmBoleto.PROC_BOLETO_ITENS_I.ExecProc;

          QrRecibo.labitens.Lines.Add(DmFinancas.cdsParcelamentoDESCRICAO_PARC.value +' - ' + cdsDebitosDESCRICAO.value +'): ' +formatfloat(',0.00',cdsDebitosTOTAL.AsFloat));
          QrRecibo.labitens2.Lines.Add(DmFinancas.cdsParcelamentoDESCRICAO_PARC.value +' - ' + cdsDebitosDESCRICAO.value+ '): ' +formatfloat(',0.00',cdsDebitosTOTAL.AsFloat));

          DMConexao.Log('Geração de Recibo: ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Num.Recibo:'+Recibo , 'O', DMAssociado.cdsAssocASS_ID.value);


          QrRecibo.qrData.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';
          QrRecibo.qrData2.caption:= 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy',DataAtual)+'.';

          QrRecibo.Preview;


          Try
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Close;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('PAGO').value := 1;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('BOL_ID').value :=  bol_id;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_RECEBIMENTO').value :=strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_CREDITO').value :=strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DT_BAIXA').value :=DataAtual;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('MULTA_PAGA').value :=0;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('JUROS_PAGO').value :=0;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('CORRECAO_PAGA').value :=0;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('DESCONTO_PAGTO').value :=0;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('ENCARGOS_PAGO').value :=0;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('VALOR_RECEBIMENTO').value :=frmManutAnuidadesRegPagto.edValorPago.VALUE;
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.Params.ParamByName('FORMA_PAGTO').value :='Baixa Recibo';
          DmFinancas.PROC_BOLETO_PAGAR_MANUAL.ExecProc;
          except
              Erro('Erro ao baixar o pagamento do recibo ' + recibo);
          end;

          finally
             QrRecibo.free;
          end;

          DMConexao.Commit;

      except
          DMConexao.Rollback;
      end;

      end;
      finally
      frmManutAnuidadesRegPagto.free;
      end;

  end;
    }
end;

procedure TfrmManutParcelamento.btCancelarClick(Sender: TObject);
begin
  inherited;
  If cdsDebitosnossonumero.Value ='' then
  begin
      Aviso('Contribuição selecionada não consta como paga. ');
      Abort;
  end;

  If Confirma('Todos os dados lançados de pagamento desta Contribuição serão excluídos.'+#13+'Confirma cancelamento? ') then
  begin
      dmboleto.PROC_MANUT_BOLETO_UPD.close;
      dmboleto.PROC_MANUT_BOLETO_UPD.ParamByName('nossonumero').value :=cdsDebitosnossonumero.value;
      dmboleto.PROC_MANUT_BOLETO_UPD.ExecProc;
      DMConexao.Log('Cancelamento de Pagamento de Parcela (Parcelamento) para o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Nosso Numero:' +cdsDebitosnossonumero.value, 'O', DMAssociado.cdsAssocASS_ID.value);
      cdsDebitos.Edit;
      cdsDebitosDtPagto.Clear;
      cdsDebitosnossonumero.clear;
      cdsDebitosValorPago.clear;
      cdsDebitos.post;
  end;

end;

end.
