unit UBoletoRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Buttons,
  JvToolEdit, JvLookup, Mask, Grids, DBGrids, ComCtrls, ToolWin, DB,
  FMTBcd, DBClient, Provider, SqlExpr, UCDefine;

type
  TfrmBoletoRecibo = class(TModeloComum)
    btSair: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edregistro: TMaskEdit;
    cbTipoContrib: TJvLookupEdit;
    edBolini: TMaskEdit;
    edBolfin: TMaskEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    edDtEmissaoIni: TMaskEdit;
    Label9: TLabel;
    edDtEmissaoFin: TMaskEdit;
    EdDtVencIni: TMaskEdit;
    Label10: TLabel;
    EdDtVencFin: TMaskEdit;
    EdDtPagIni: TMaskEdit;
    Label11: TLabel;
    EdDtPagFin: TMaskEdit;
    btLocalizar: TBitBtn;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    btLimpar: TBitBtn;
    cbSituacao: TJvLookupEdit;
    Label14: TLabel;
    dsBoletos: TDataSource;
    sdsLocAssoc: TSQLDataSet;
    dspLocAssoc: TDataSetProvider;
    cdsLocAssoc: TClientDataSet;
    cdsLocAssocASS_ID: TIntegerField;
    sdsTpContrib: TSQLDataSet;
    dspTpContrib: TDataSetProvider;
    cdsTpContrib: TClientDataSet;
    cdsTpContribTP_CONTRIB_ID: TIntegerField;
    cdsTpContribTP_CONTRIB_DESCRICAO: TStringField;
    dsTpContrib: TDataSource;
    sdsTp_Status: TSQLDataSet;
    dspTp_Status: TDataSetProvider;
    cdsTp_Status: TClientDataSet;
    cdsTp_StatusTP_STATUS_ID: TIntegerField;
    cdsTp_StatusTP_STATUS_DESCR: TStringField;
    dsTp_Status: TDataSource;
    dsItens: TDataSource;
    spAtivarDesativar: TSpeedButton;
    spImprimir: TSpeedButton;
    UCControls1: TUCControls;
    spPagar: TSpeedButton;
    PROC_BOLETO_PAGAR_MANUAL: TSQLStoredProc;
    Label15: TLabel;
    cbfiltro: TComboBox;
    procedure btLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTipoContribExit(Sender: TObject);
    procedure cbSituacaoExit(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairClick(Sender: TObject);
    procedure AtualizaItensBoleto;
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure spAtivarDesativarClick(Sender: TObject);
    procedure spImprimirClick(Sender: TObject);
    function CalcTotalPago:real;
    procedure edregistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spPagarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoletoRecibo: TfrmBoletoRecibo;

implementation

uses UDmBoleto, UDMConexao, UFuncoes, UQRSituacaoBoletosImpressao,
  URegistrarPagto;

{$R *.dfm}

procedure TfrmBoletoRecibo.btLocalizarClick(Sender: TObject);
var
   i, ass_id:integer;
begin
   If edregistro.text<>'' then
   begin
     cdsLocAssoc.close;
     cdsLocAssoc.Params.ParamByName('registro').value :=edregistro.text;
     cdsLocAssoc.open;

     If cdsLocAssoc.RecordCount >1 then
     begin
        Aviso('Existe mais de um filiado com este número de registro.');
        abort;
     end
     else
     If cdsLocAssoc.RecordCount =0 then
     begin
        Aviso('Registro não encontrado.');
        abort;
     end
     else
       ass_id := cdsLocAssocASS_ID.value;
   end;


   dsBoletos.DataSet.Close;

   for i := 0 to 10 do
      DmBoleto.cdsLocBoletos.Params[i].clear;

   If edregistro.text<>'' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('ass_id').value := ass_id;

   If cbTipoContrib.text<>'<<Selecione>>' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('CONTRIB_ID').value := cdsTpContribTP_CONTRIB_ID.value;

   If cbSituacao.text<>'<<Selecione>>' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('STATUSBOL').value := cdsTp_StatusTP_STATUS_ID.value;

   If edBolini.text<>'' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('BOLETO_INI').value :=edBolini.text ;

   If edBolfin.text<>'' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('BOLETO_FIM').value :=edBolfin.text ;

   If edDtEmissaoIni.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_EMISSAO_INI').value :=strtodate(edDtEmissaoIni.text) ;

   If edDtEmissaoFin.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_EMISSAO_FIM').value :=strtodate(edDtEmissaoFin.text) ;

   If EdDtVencIni.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_VENCIMENTO_INI').value :=strtodate(EdDtVencIni.text) ;

   If EdDtVencFin.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_VENCIMENTO_FIM').value :=strtodate(EdDtVencFin.text) ;

   If EdDtPagIni.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_PAGAMENTO_INI').value :=strtodate(EdDtPagIni.text) ;

   If EdDtPagFin.text<>'  /  /    ' then
      DmBoleto.cdsLocBoletos.Params.ParamByName('DT_PAGAMENTO_FIM').value :=strtodate(EdDtPagFin.text) ;

    DmBoleto.cdsLocBoletos.Params.ParamByName('FILTROTIPO').value :=cbfiltro.text[1];      

   DmBoleto.cdsLocBoletos.Open;
   AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.FormShow(Sender: TObject);
begin
  inherited;
  dsBoletos.DataSet.Close;
  dsitens.DataSet.Close;
  dsTp_Status.DataSet.Open;
  dsTpContrib.DataSet.Open;
end;

procedure TfrmBoletoRecibo.cbTipoContribExit(Sender: TObject);
begin
  inherited;
  If cbTipoContrib.text<>'<<Selecione>>' then
  begin
      if not cdsTpContrib.locate('TP_CONTRIB_DESCRICAO', cbTipoContrib.text,[]) then
         cbTipoContrib.text:='<<Selecione>>';
  end;
end;

procedure TfrmBoletoRecibo.cbSituacaoExit(Sender: TObject);
begin
  inherited;
  If cbSituacao.text<>'<<Selecione>>' then
  begin
      if not cdsTp_Status.locate('TP_STATUS_DESCR', cbSituacao.text,[]) then
         cbSituacao.text:='<<Selecione>>';
  end;
end;

procedure TfrmBoletoRecibo.btLimparClick(Sender: TObject);
begin
  inherited;
  edregistro.clear;
  cbTipoContrib.text:='<<Selecione>>';
  cbSituacao.text:='<<Selecione>>';
  edBolini.clear;
  edBolfin.clear;
  edDtEmissaoIni.clear;
  edDtEmissaoFin.clear;
  EdDtVencIni.clear;
  EdDtVencFin.clear;
  EdDtPagIni.clear;
  EdDtPagFin.clear;
  DmBoleto.cdsLocBoletos.Close;
end;

procedure TfrmBoletoRecibo.DBGrid1DrawColumnCell(Sender: TObject;
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

  if (DmBoleto.cdsLocBoletosSTATUS.value = 'Cancelado') then
  begin
    Tdbgrid(Sender).Canvas.Font.Color := clred;
    Tdbgrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TfrmBoletoRecibo.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfrmBoletoRecibo.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmBoletoRecibo.AtualizaItensBoleto;
begin
//   DmBoleto.cdsLocBoletoItens.Close;
//   DmBoleto.cdsLocBoletoItens.Params.ParamByName('bol_id').value := DmBoleto.cdsLocBoletosBOL_ID.value;
//   DmBoleto.cdsLocBoletoItens.Open;
end;

procedure TfrmBoletoRecibo.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.DBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  AtualizaItensBoleto;
end;

procedure TfrmBoletoRecibo.spAtivarDesativarClick(Sender: TObject);
var
   oper:string;
begin
  inherited;
  If DmBoleto.cdsLocBoletos.Active = true then
  begin
     If DmBoleto.cdsLocBoletos.RecordCount > 0 then
     begin
        If DmBoleto.cdsLocBoletosSTATUS_ID.value = 1 then
           oper := 'Cancelar'
        else
           oper := 'Ativar';

         If Confirma('Deseja ' + oper+' o Boleto/Recibo Nº ' +  DmBoleto.cdsLocBoletosNOSSONUMERO.value+'?'  ) then
         begin
              Dmboleto.cdsBoletoStatus.close;
              Dmboleto.cdsBoletoStatus.Params.ParamByName('bol_id').value := DmBoleto.cdsLocBoletosBOL_ID.value;
              if DmBoleto.cdsLocBoletosSTATUS_ID.value = 1 then
                 Dmboleto.cdsBoletoStatus.Params.ParamByName('status').value :=2
              else
                 Dmboleto.cdsBoletoStatus.Params.ParamByName('status').value :=1;
              Dmboleto.cdsBoletoStatus.open;
              If Dmboleto.cdsBoletoStatusRESP.value = 0 then
                 Aviso('O Boleto não pôde ser alterado pois um ou mais'+#13+'de seus ítens tem um outro boleto ativo.')
              else
              begin
                 DmBoleto.cdsLocBoletos.Refresh;
                 DMConexao.Log('Ativação/Cancelamento de Boleto/Guia pata o Filiado ' + DmBoleto.cdsLocBoletosREGISTRO.value+'-'+DmBoleto.cdsLocBoletosNOME.value+' - Boleto/Guia:'+DmBoleto.cdsLocBoletosNOSSONUMERO.value, 'O', DmBoleto.cdsLocBoletosIDASSOC.value);
              end;
         end;
     end;
  end
end;

procedure TfrmBoletoRecibo.spImprimirClick(Sender: TObject);
begin
  If DmBoleto.cdsLocBoletos.Active = true then
  begin
     If DmBoleto.cdsLocBoletos.RecordCount > 0 then
     begin
       try Application.createform(TQRSituacaoBoletosImpressao,QRSituacaoBoletosImpressao);
       DmBoleto.cdsLocBoletos.First ;
       QRSituacaoBoletosImpressao.labtotal.caption := formatfloat (',0.00', CalcTotalPago);
       QRSituacaoBoletosImpressao.preview;
       finally
       QRSituacaoBoletosImpressao.free;
       end;
     end;
  end;
end;

function TfrmBoletoRecibo.CalcTotalPago: real;
var total:real;
begin
   total := 0;
   DmBoleto.cdsLocBoletos.First;
   DmBoleto.cdsLocBoletos.DisableControls;
   While not DmBoleto.cdsLocBoletos.eof do
   begin
      total := total + DmBoleto.cdsLocBoletosVALORRECEB.asfloat;
      DmBoleto.cdsLocBoletos.Next;
   end;
   DmBoleto.cdsLocBoletos.EnableControls;
   DmBoleto.cdsLocBoletos.First;
   result := total;
end;

procedure TfrmBoletoRecibo.edregistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
VAR I:INTEGER;
begin
  inherited;
  if Key = VK_DIVIDE then
  begin
    I    := Pos('/', edRegistro.EditMask) - 1;
    edRegistro.Text := Char_Left(Trim(Copy(edRegistro.Text, 1, i)), i, '0') + Copy(edRegistro.Text, 8, 4)
  end;

end;

procedure TfrmBoletoRecibo.spPagarClick(Sender: TObject);
begin
  inherited;
  If dsBoletos.DataSet.active = true then
  begin
    if dsBoletos.DataSet.RecordCount > 0 then
    begin
       If dsBoletos.DataSet.fieldbyname('STATUS').value = 'Cancelado' then
           Aviso('O Boleto/Guia selecionado está cancelado. ')
       else
       begin
          If (dsBoletos.DataSet.fieldbyname('DATAPAGAMENTO').value =  null) or (dsBoletos.DataSet.fieldbyname('DATAPAGAMENTO').value = Datanula) then
          begin
             Try application.createform(TfrmRegistrarPagto,frmRegistrarPagto);
             frmRegistrarPagto.labguia.caption := dsBoletos.DataSet.fieldbyname('NOSSONUMERO').value;
             frmRegistrarPagto.labVencimento.caption := datetostr(dsBoletos.DataSet.fieldbyname('DATAVENCIMENTO').value);
             frmRegistrarPagto.labTotal.caption := floattostr(dsBoletos.DataSet.fieldbyname('VALOR').value);
             valorprinc := DmBoleto.cdsLocBoletoItensVALOR_ITEM.asfloat;
             if frmRegistrarPagto.showmodal=mrok then
             begin

               PROC_BOLETO_PAGAR_MANUAL.Close;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('pago').value := 1;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('bol_id').value := dsBoletos.DataSet.fieldbyname('bol_id').value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_recebimento').value := strtodate(frmRegistrarPagto.edDtreceb.Text);
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_credito').value := strtodate(frmRegistrarPagto.edDtCredito.Text);
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_baixa').value := DataAtual;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('valor_recebimento').value :=  frmRegistrarPagto.edValorPago.value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('multa_paga').value :=frmRegistrarPagto.edValorMultapaga.value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('correcao_paga').value :=frmRegistrarPagto.edValorCorrecaoPaga.value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('juros_pago').value :=frmRegistrarPagto.edValorJurosPago.value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('desconto_pagto').value :=frmRegistrarPagto.edValorDescPago.value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('forma_pagto').value :=frmRegistrarPagto.cbFormapagto.text;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('encargos_pago').value :=frmRegistrarPagto.edValorEncargos.value;
               PROC_BOLETO_PAGAR_MANUAL.ExecProc;
               DMConexao.Log('Situação de Boleto: Baixa Manual de Pagamento de Boleto/Guia pata o Filiado ' + DmBoleto.cdsLocBoletosREGISTRO.value+'-'+DmBoleto.cdsLocBoletosNOME.value+' - Boleto/Guia:'+DmBoleto.cdsLocBoletosNOSSONUMERO.value, 'O', DmBoleto.cdsLocBoletosIDASSOC.value);
               dsBoletos.DataSet.refresh;
             end;
             finally
             frmRegistrarPagto.free;
             end;

          end
          else // Paga
          begin
             If Confirma('Deseja cancelar o pagamento deste Boleto/Guia? ') then
             begin
               PROC_BOLETO_PAGAR_MANUAL.Close;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('pago').value :=0;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('bol_id').value :=  dsBoletos.DataSet.fieldbyname('bol_id').value;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_recebimento').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_credito').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('dt_baixa').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('valor_recebimento').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('multa_paga').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('correcao_paga').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('juros_pago').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('desconto_pagto').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('forma_pagto').clear;
               PROC_BOLETO_PAGAR_MANUAL.ParamByName('encargos_pago').clear;
               PROC_BOLETO_PAGAR_MANUAL.ExecProc;
               dsBoletos.DataSet.refresh;
               DMConexao.Log('Situação de Boleto: Cancelamento de Pagamento de Boleto/Guia pata o Filiado ' + DmBoleto.cdsLocBoletosREGISTRO.value+'-'+DmBoleto.cdsLocBoletosNOME.value+' - Boleto/Guia:'+DmBoleto.cdsLocBoletosNOSSONUMERO.value, 'O', DmBoleto.cdsLocBoletosIDASSOC.value);
             end;


          end;


       end;



    end;
  end;
end;

procedure TfrmBoletoRecibo.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  DmBoleto.cdsLocBoletos.IndexFieldNames :=  Column.FieldName;
  DmBoleto.cdsLocBoletos.AfterScroll(DmBoleto.cdsLocBoletos);
end;

end.
