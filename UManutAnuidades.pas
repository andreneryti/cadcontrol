unit UManutAnuidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGrids, DB, DBClient;

type
  TfrmManutAnuidades = class(TModeloInserir)
    DBGrid1: TDBGrid;
    btPagar: TBitBtn;
    cdsDebitos: TClientDataSet;
    cdsDebitosANUID_ID: TIntegerField;
    cdsDebitosDESCRICAO: TStringField;
    cdsDebitosVALOR: TFMTBCDField;
    cdsDebitosVENCIMENTO: TDateField;
    cdsDebitosTIPOCONTRIB: TStringField;
    cdsDebitosMULTA: TFMTBCDField;
    cdsDebitosJUROS: TFMTBCDField;
    cdsDebitosCORRECAO: TFMTBCDField;
    cdsDebitosTOTAL: TFMTBCDField;
    dsDebitos: TDataSource;
    cdsDebitosnossonumero: TStringField;
    cdsDebitosDtPagto: TDateField;
    cdsDebitosValorPago: TFloatField;
    btCancelar: TBitBtn;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btPagarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutAnuidades: TfrmManutAnuidades;

implementation

uses UFuncoes, UManutAnuidadesRegPagto, UDmFinancas, SqlExpr, UDmBoleto,
  UDMAssociado, UDMConexao, URecebo, UBoleto;

{$R *.dfm}

procedure TfrmManutAnuidades.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmManutAnuidades.FormCreate(Sender: TObject);
begin
  inherited;
  cdsDebitos.CreateDataSet;
end;

procedure TfrmManutAnuidades.btPagarClick(Sender: TObject);

begin
  inherited;
  If cdsDebitosnossonumero.Value <>'' then
  begin
      Aviso('Contribuição selecionada já está paga. ');
      Abort;
  end;
  //if Confirma('Deseja registrar o pagamento da Contribuição selecionada? ') then
  //begin
      try Application.createform(TfrmManutAnuidadesRegPagto,frmManutAnuidadesRegPagto);
      frmManutAnuidadesRegPagto.labDescricao.caption := cdsDebitosDESCRICAO.value;
      frmManutAnuidadesRegPagto.labTotal.caption:= FormatFloat(',0.00', cdsDebitosTOTAL.asfloat);
      frmManutAnuidadesRegPagto.labVencimento.caption:= datetostr(cdsDebitosVENCIMENTO.Value);

      if frmManutAnuidadesRegPagto.showmodal = mrok then
      begin
          If cdsDebitosTIPOCONTRIB.value = 'Confederativa' then
             DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 2)
          else
             DmBoleto.DadosContaCedente(DMAssociado.cdsAssocEMP_ID.value, 1);


          dmfinancas.PROC_MANUT_PAGTO.close;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('CONTA_ID').value := dmBoleto.cdsContaCONTA_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('HOJE').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VENCIMENTO').value := DataAtual;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_TOTAL').value := cdsDebitosTOTAL.asfloat;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('NOSSONUMERO').value := frmManutAnuidadesRegPagto.edrecibo.text;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DT_RECEBIMENTO').value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.Text);
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('VALOR_PAGO').value := frmManutAnuidadesRegPagto.edValorPago.Value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ANUID_ID').value := cdsDebitosANUID_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('parc_ID').value := 0;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('ass_ID').value := DMAssociado.cdsAssocASS_ID.value;
          dmfinancas.PROC_MANUT_PAGTO.ParamByName('DESCRICAO_ITEM').value := cdsDebitosDESCRICAO.value;
          dmfinancas.PROC_MANUT_PAGTO.ExecProc;

          DMConexao.Log('Registro de pagamentos pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Nosso Numero:' +frmManutAnuidadesRegPagto.edRecibo.text , 'O', DMAssociado.cdsAssocASS_ID.value);

          cdsDebitos.Edit;
          cdsDebitosDtPagto.value := strtodate(frmManutAnuidadesRegPagto.edDtPagto.text);
          cdsDebitosnossonumero.value := frmManutAnuidadesRegPagto.edrecibo.text;
          cdsDebitosValorPago.value := frmManutAnuidadesRegPagto.edValorPago.value;
          cdsDebitos.Post;

      end;
      finally
      frmManutAnuidadesRegPagto.free;
      end;

  //end;
end;

procedure TfrmManutAnuidades.btCancelarClick(Sender: TObject);
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
      DMConexao.Log('Cancelamento de pagamento pata o Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+' / Nosso Numero:' +cdsDebitosnossonumero.value , 'O', DMAssociado.cdsAssocASS_ID.value);
      cdsDebitos.Edit;
      cdsDebitosDtPagto.Clear;
      cdsDebitosnossonumero.clear;
      cdsDebitosValorPago.clear;
      cdsDebitos.post;
  end;

end;

end.
