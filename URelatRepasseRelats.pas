unit URelatRepasseRelats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, Grids, DBGrids, DBCtrls,
  StdCtrls, Buttons, Provider, SqlExpr, DBClient, DB, DBLocal, DBLocalS, JvSelectDirectory;

type
  TfrmRelatRepasseRelats = class(TModeloComum)
    pnl1: TPanel;
    Label7: TLabel;
    btnListar: TBitBtn;
    dblkcbbLote: TDBLookupComboBox;
    btn1: TBitBtn;
    btnEstorno: TBitBtn;
    grid1: TDBGrid;
    Label1: TLabel;
    btnImprimir: TBitBtn;
    sdsRepasse: TSQLClientDataSet;
    sdsRepasseREPASSE_ID: TIntegerField;
    sdsRepasseDATAREPASSE: TDateField;
    sdsRepasseVALORREPASSE: TFMTBCDField;
    sdsRepasseVALORTOTALPAGO: TFMTBCDField;
    sdsRepasseDESCRICAO: TStringField;
    dsRepasse: TDataSource;
    cdsAux: TClientDataSet;
    cdsAuxrepasse_id: TIntegerField;
    dsAux: TDataSource;
    sdsItens: TSQLClientDataSet;
    sdsItensREPASSEITEM_ID: TIntegerField;
    sdsItensANUID_ID: TIntegerField;
    sdsItensPARC_ID: TIntegerField;
    sdsItensVALORPAGO: TFMTBCDField;
    sdsItensVALORREPASSE: TFMTBCDField;
    sdsItensREPASSE_ID: TIntegerField;
    sdsItensDESCRICAO: TStringField;
    sdsItensGUIA: TStringField;
    sdsItensDATACREDITO: TDateField;
    sdsItensREGISTRO: TStringField;
    sdsItensNOME: TStringField;
    dsItens: TDataSource;
    Label2: TLabel;
    dbtxtDATAREPASSE: TDBText;
    Label4: TLabel;
    Label3: TLabel;
    labtotal: TLabel;
    dbtxtDATAREPASSE1: TDBText;
    dbtxtVALORTOTALPAGO: TDBText;
    Label5: TLabel;
    sdsRepassePERIODOINI: TDateField;
    sdsRepassePERIODOFIM: TDateField;
    sdsItensSINDICATO: TStringField;
    sdsItensVALORPAGO_1: TFMTBCDField;
    sdsItensVALORORIGINAL: TFMTBCDField;
    sdsItensENCARGOS: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dblkcbbLoteCloseUp(Sender: TObject);
    procedure btnEstornoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatRepasseRelats: TfrmRelatRepasseRelats;

implementation

uses UDMConexao, UFuncoes, UQrRepasse;

{$R *.dfm}

procedure TfrmRelatRepasseRelats.FormCreate(Sender: TObject);
begin
  inherited;
  cdsAux.CreateDataSet;
end;

procedure TfrmRelatRepasseRelats.btnListarClick(Sender: TObject);
begin
  inherited;
  sdsItens.close;
  labtotal.Caption :='0';
  btnEstorno.Enabled:=False;
  btnImprimir.Enabled:=False;
  sdsItens.Params.ParamByName('repasse_id').value := cdsAuxrepasse_id.value;
  sdsItens.Open;
  If sdsItens.RecordCount > 0 then
  begin
        labtotal.Caption := inttostr(sdsitens.RecordCount);
        btnEstorno.Enabled:=true;
        btnImprimir.Enabled:=true;
  end;

end;

procedure TfrmRelatRepasseRelats.FormShow(Sender: TObject);
begin
  inherited;
  sdsRepasse.Open;
  cdsAux.Edit;
  cdsAuxrepasse_id.value := sdsRepasseREPASSE_ID.Value;

end;

procedure TfrmRelatRepasseRelats.btn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatRepasseRelats.dblkcbbLoteCloseUp(Sender: TObject);
begin
  inherited;
  btnListar.Click;
end;

procedure TfrmRelatRepasseRelats.btnEstornoClick(Sender: TObject);
begin
  inherited;
  If Confirma('Confirma o estorno deste repasse? ') then
  begin
      try
              Dmconexao.ExecSQL('update loterepasse set status = 0 where repasse_id=' + inttostr(sdsRepasseREPASSE_ID.value));
              sdsRepasse.close;
              sdsRepasse.open;
              sdsItens.close;
      except
             Erro('Erro ao estornar o Repasse. Informe ao Administrador do Sistema. ');
      end;

  end;
end;

procedure TfrmRelatRepasseRelats.btnImprimirClick(Sender: TObject);
var
    i:Integer;
    total, totalpgto, totOrig,totencargos:real;
    sdDirectory: TJvSelectDirectory;
    local: string;
begin
   sdDirectory := TJvSelectDirectory.create(nil);
   if sdDirectory.Execute then
      local := sdDirectory.Directory
   else
      exit;

   try
       application.CreateForm(TQrRepasse,QrRepasse);
       QrRepasse.cdsRepasse.CreateDataSet;
       QrRepasse.cdsRepasse.Open;
       sdsItens.first;
       total:=0;
       totalpgto:=0;
       totOrig :=0;
       totencargos :=0;
       while not sdsItens.Eof do
       begin
          QrRepasse.cdsRepasse.Append;
          QrRepasse.cdsRepasse.Edit;
          QrRepasse.cdsRepasseregistro.value := sdsItensregistro.Value;
          QrRepasse.cdsRepassenome.value := sdsItensnome.Value;
          QrRepasse.cdsRepassedescricao.value := sdsItensDESCRICAO.Value;
          QrRepasse.cdsRepasseguia.value := sdsItensGUIA.Value;
          QrRepasse.cdsRepassedatacredito.value := sdsItensDATACREDITO.Value;
          QrRepasse.cdsRepassevalorpago.value := sdsItensVALORPAGO.asfloat;
          QrRepasse.cdsRepassevalorrepasse.value := sdsItensVALORREPASSE.asfloat;
          QrRepasse.cdsRepassesindicato.value := sdsItensSINDICATO.value;
          QrRepasse.cdsRepassevalororiginal.value := sdsItensVALORORIGINAL.asfloat;
          QrRepasse.cdsRepasseencargos.value := sdsItensENCARGOS.asfloat;
          total := total + sdsItensVALORREPASSE.asfloat;
          totalpgto := totalpgto + sdsItensVALORPAGO.asfloat;
          totOrig := totOrig + sdsItensVALORORIGINAL.AsFloat;
          totencargos := totencargos + sdsItensENCARGOS.AsFloat;

          QrRepasse.cdsRepasse.Post;
          sdsItens.Next;
       end;

       if (sdsRepasseDATAREPASSE.value = sdsRepassePERIODOINI.value ) and
          (sdsRepasseDATAREPASSE.value = sdsRepassePERIODOFIM.value ) then
       begin
           QrRepasse.QRLabel3.Caption :='';
           QrRepasse.labPeriodo.Caption :='';
       end
       else
       begin
           if sdsRepassePERIODOINI.value = sdsRepassePERIODOFIM.value then
               QrRepasse.labPeriodo.Caption := DateToStr(sdsRepassePERIODOINI.value)
           else
               QrRepasse.labPeriodo.Caption := DateToStr(sdsRepassePERIODOINI.value) + ' a ' + DateToStr(sdsRepassePERIODOFIM.value);
       end;

       QrRepasse.Labtotal.Caption := 'R$ ' + FormatFloat(',0.00', total);
       QrRepasse.labtotalpagto.Caption := 'R$ ' + FormatFloat(',0.00', totalpgto);
       QrRepasse.labTotOriginal.Caption := 'R$ ' + FormatFloat(',0.00', totOrig);
       QrRepasse.labTotEncargos.Caption := 'R$ ' + FormatFloat(',0.00', totencargos);

       QrRepasse.labDataRepasse.Caption := datetostr(sdsRepasseDATAREPASSE.value);

       QrRepasse.ReportTitle :='Repasse';

       if GeraPDF(QrRepasse, local, 1) = 0 then
       begin
        Aviso('Erro ao gerar PDF de Repasse.' + #13 + 'Por favor, informe ao Administrador do Sistema.');
       end



   finally
       QrRepasse.free;
   end;

end;

end.
