unit UParcelamentoNovoOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls,
  ComCtrls, Mask, Grids, DBGrids, DB, DBClient, JvEdit, JvTypedEdit,
  Provider, SqlExpr, DBLocal, DBLocalS;

type
  TfrmParcelamentoNovoOpcoes = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    edDescricao: TEdit;
    Label2: TLabel;
    edDataParc: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    edPrimVencto: TMaskEdit;
    Label5: TLabel;
    edNumParc: TEdit;
    Udparcs: TUpDown;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    Bevel1: TBevel;
    cdsAnuidadesParcs: TClientDataSet;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsAnuidadesParcsanuid_id: TIntegerField;
    cdsAnuidadesParcsvalor: TFloatField;
    cdsAnuidadesParcscorrecao: TFloatField;
    cdsAnuidadesParcsmulta: TFloatField;
    cdsAnuidadesParcsjuros: TFloatField;
    cdsParcelasParcela_descr: TStringField;
    cdsParcelasValor: TFloatField;
    cdsParcelasVencimento: TDateField;
    cdsParcelasNumParc: TIntegerField;
    BitBtn1: TBitBtn;
    edValor: TMaskEdit;
    cbparcelas: TComboBox;
    cdsAnuidadesParcsano: TIntegerField;
    cdsAnuidadesParcsnumparc: TIntegerField;
    sdsAtualizaParcela: TSQLClientDataSet;
    sdsAtualizaParcelaANUID_ID: TIntegerField;
    sdsAtualizaParcelaDESCRICAO: TStringField;
    sdsAtualizaParcelaANO: TIntegerField;
    sdsAtualizaParcelaVALOR: TFMTBCDField;
    sdsAtualizaParcelaVENCIMENTO: TDateField;
    sdsAtualizaParcelaTIPOCONTRIB: TStringField;
    sdsAtualizaParcelaPARC_ID: TIntegerField;
    sdsAtualizaParcelaNUM_PARCELA: TIntegerField;
    sdsAtualizaParcelaTPCONTRIB_ID: TIntegerField;
    sdsAtualizaParcelaMULTA: TFMTBCDField;
    sdsAtualizaParcelaJUROS: TFMTBCDField;
    sdsAtualizaParcelaCORRECAO: TFMTBCDField;
    sdsAtualizaParcelaTOTAL: TFMTBCDField;
    cdsParcelasanuid_id: TIntegerField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UdparcsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CalculaParcs(totalparc:integer; dataprim:TDatetime; ValorTotal:real);
    procedure CalculaParcsNovo(forma:integer; dataprim:TDatetime; ValorTotal:real);
     procedure CalculaParcsNovo2018(forma:integer; dataprim:TDatetime; ValorTotal:real);
    procedure BitBtn1Click(Sender: TObject);
    procedure edPrimVenctoChange(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CarregaParcelas;
    procedure cbparcelasSelect(Sender: TObject);
    procedure edPrimVenctoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelamentoNovoOpcoes: TfrmParcelamentoNovoOpcoes;
  numparcelas:integer;

implementation

uses UFuncoes, UDMConexao, UDMAssociado, UDmFinancas;

{$R *.dfm}


procedure TfrmParcelamentoNovoOpcoes.CalculaParcs(totalparc: integer;
  dataprim: TDatetime; ValorTotal:real);
var
  i:integer;
  valorparc, valorPrimParc : real;
  datavenc: TDatetime;
begin
   datavenc := Dataprim;
   valorparc :=  strtofloat(FormatFloat('0.00', ValorTotal / totalparc));
   If (valorparc * totalparc) > ValorTotal then
      valorparc := valorparc - 0.01;
   If (valorparc * totalparc) < ValorTotal then
      valorPrimParc := valorparc + ( ValorTotal - (valorparc * totalparc) )
   else
      valorPrimParc := valorparc;

   cdsParcelas.EmptyDataSet;
   cdsParcelas.Open;
   for i := 1 to totalparc do
   begin
      cdsParcelas.Append;
      cdsParcelas.Edit;
      cdsParcelasNumParc.value := i;
      If i = 1 then
         cdsParcelasValor.value := valorPrimParc
      else
         cdsParcelasValor.value := valorparc;
      cdsParcelasVencimento.value := datavenc;
      cdsParcelasNumParc.value := i;
      cdsParcelasParcela_descr.value := 'Parcela '+ inttostr(i)+'/'+inttostr(totalparc);
      cdsParcelas.Post;
      datavenc := IncMonth(Dataprim,i);
   end;
   cdsParcelas.First;
end;

procedure TfrmParcelamentoNovoOpcoes.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmParcelamentoNovoOpcoes.UdparcsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmParcelamentoNovoOpcoes.BitBtn1Click(Sender: TObject);
var
   v1,v2:real;
   descr1,descr2:string;
   vencto1,vencto2:Tdatetime;
begin
  inherited;
  try
    strtodate(edPrimVencto.Text);
  except
    Aviso('Data do primeiro pagamento inválida. ');
    edPrimVencto.setfocus;
    exit;
  end;

  try
 // CalculaParcs(strtoint(edNumParc.text), strtodate(edPrimVencto.text), strtofloat(stringreplace(edValor.text,'.','',[rfreplaceall])));
  CalculaParcsNovo2018(cbparcelas.ItemIndex+1, strtodate(edPrimVencto.text), 0);

  //Atualiza Parcelas
 { cdsAnuidadesParcs.First;
  cdsParcelas.first;
  while not cdsAnuidadesParcs.eof do
  begin
      sdsAtualizaParcela.close;
      sdsAtualizaParcela.Params.ParamByName('ass_id').value := DMAssociado.cdsAssocASS_ID.value ;
      sdsAtualizaParcela.Params.ParamByName('tipo').value := 'T';
      sdsAtualizaParcela.Params.ParamByName('dataatual').value := cdsParcelasVencimento.value;
      sdsAtualizaParcela.Params.ParamByName('anuid_id').value := cdsAnuidadesParcsanuid_id.value;
      sdsAtualizaParcela.Open;

      cdsAnuidadesParcs.edit;
      cdsAnuidadesParcsvalor.value := sdsAtualizaParcelaVALOR.asfloat;
      cdsAnuidadesParcsmulta.value := sdsAtualizaParcelaMULTA.asfloat;
      cdsAnuidadesParcsjuros.value := sdsAtualizaParcelaJUROS.asfloat;
      cdsAnuidadesParcscorrecao.value := sdsAtualizaParcelaCORRECAO.asfloat;
      cdsAnuidadesParcs.post;

      cdsAnuidadesParcs.next;
      cdsParcelas.next;
  end;}

  except
  Erro('Erro ao gerar as parcelas. ');
  end;

 { cdsparcelas.last;
  iF strtoint(Copy(cdsParcelasParcela_descr.Value,length(cdsParcelasParcela_descr.Value)-3,4)) = ExtractYear(DataAtual) then
  begin
      v1 := cdsParcelasValor.value;
      vencto1 := cdsParcelasVencimento.value;
      descr1 := cdsParcelasParcela_descr.value;
      cdsparcelas.First;

      v2:= cdsParcelasValor.value;
      vencto2 := cdsParcelasVencimento.value;
      descr2 := cdsParcelasParcela_descr.value;

      cdsparcelas.Edit;
      cdsParcelasParcela_descr.value := descr1;
      cdsParcelasValor.value :=v1;
      cdsParcelasVencimento.value :=vencto1;
      cdsparcelas.post;


      cdsparcelas.last;
      cdsparcelas.Edit;
      cdsParcelasParcela_descr.value := descr2;
      cdsParcelasValor.value :=v2;
      cdsParcelasVencimento.value :=vencto2;
      cdsparcelas.post;

      cdsparcelas.first;
  end;
        }
end;

procedure TfrmParcelamentoNovoOpcoes.edPrimVenctoChange(Sender: TObject);
begin
  inherited;
   cdsParcelas.EmptyDataSet;
end;

procedure TfrmParcelamentoNovoOpcoes.BtnOKClick(Sender: TObject);
begin
  inherited;
  If cdsparcelas.RecordCount = 0 then
  Begin
     Aviso('Gere as parcelas primeiro. ');
     ModalResult := mrnone;
  end;
end;

procedure TfrmParcelamentoNovoOpcoes.FormShow(Sender: TObject);
begin
  inherited;

  BitBtn1.click;

end;

procedure TfrmParcelamentoNovoOpcoes.CarregaParcelas;
var
   numeroparcelas, i:integer;
   itemParc:String;
begin
 {  numeroparcelas := cdsAnuidadesParcs.RecordCount;
   cbparcelas.Items.Clear;
   for i:= 1 to 4 do
   begin
       if i = 1 then
          itemParc := ' x (Pagto.Mensal)'
       else
       if i = 2 then
          itemParc := ' x (Pagto.Bimestral)'
       else
       if i = 3 then
          itemParc := ' x (Pagto.Trimestral)'
       else
       if i = 4 then
          itemParc := ' x (Pagto.Quadrimestral)';

       cbparcelas.Items.Add(inttostr(numeroparcelas*i) + itemParc );
   end;
  }
end;

procedure TfrmParcelamentoNovoOpcoes.cbparcelasSelect(Sender: TObject);
begin
  inherited;
  cdsParcelas.EmptyDataSet;
  BitBtn1.Click;
end;

procedure TfrmParcelamentoNovoOpcoes.CalculaParcsNovo(forma: integer;
  dataprim: TDatetime; ValorTotal: real);
var
  i,x:integer;
  valorparc, valorPrimParc : real;
  datavenc: TDatetime;
  addmes:integer;
begin
   datavenc := Dataprim;
   cdsParcelas.EmptyDataSet;
   cdsParcelas.Open;
   i:=1;
   x := forma;

   if cdsAnuidadesParcs.locate('ano',ExtractYear(DataAtual),[]) then
   begin
      cdsParcelas.Append;
      cdsParcelas.Edit;
      cdsParcelasValor.value := ValorTotal;
      cdsParcelasVencimento.value := datavenc;
      cdsParcelasNumParc.value := 1;
      cdsParcelasParcela_descr.value := 'Exercício de '+ inttostr(cdsAnuidadesParcsano.value);
      cdsParcelasanuid_id.value := cdsAnuidadesParcsanuid_id.value;
      cdsParcelas.Post;
      datavenc := IncMonth(Dataprim,x);
      cdsAnuidadesParcs.next;
      i:=i+1;
      x:= x+forma;
   end;



   cdsAnuidadesParcs.first;
   while not cdsAnuidadesParcs.eof do
   begin
      if cdsAnuidadesParcsano.value <> extractyear(DataAtual) then
      begin
        cdsParcelas.Append;
        cdsParcelas.Edit;
        cdsParcelasValor.value := ValorTotal;
        cdsParcelasVencimento.value := datavenc;
        cdsParcelasNumParc.value := i;
        cdsParcelasParcela_descr.value := 'Exercício de '+ inttostr(cdsAnuidadesParcsano.value);
        cdsParcelasanuid_id.value := cdsAnuidadesParcsanuid_id.value;
        cdsParcelas.Post;
        datavenc := IncMonth(Dataprim,x);
        x:= x+forma;
         i := i +1;
      end;

      cdsAnuidadesParcs.next;
   end;



end;

procedure TfrmParcelamentoNovoOpcoes.edPrimVenctoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If key = #13 then
     if Length(trim(edPrimVencto.text)) = 10 then
        BitBtn1.click;
end;

procedure TfrmParcelamentoNovoOpcoes.CalculaParcsNovo2018(forma: integer;
  dataprim: TDatetime; ValorTotal: real);
var
  i,x:integer;
  valorparc, valorPrimParc : real;
  datavenc: TDatetime;
  addmes:integer;
  anuidid:integer;
begin
   datavenc := Dataprim;
   cdsParcelas.EmptyDataSet;
   cdsParcelas.Open;
   i:=1;
   x := forma;

   //Adicionando o maior ano como sendo a primeira parcela
   cdsAnuidadesParcs.IndexFieldNames:='ano';
   cdsAnuidadesParcs.last;

   cdsParcelas.Append;
   cdsParcelas.Edit;
   cdsParcelasValor.value := ValorTotal;
   cdsParcelasVencimento.value := datavenc;
   cdsParcelasNumParc.value := 1;
   cdsParcelasParcela_descr.value := 'Exercício de '+ inttostr(cdsAnuidadesParcsano.value);
   cdsParcelasanuid_id.value := cdsAnuidadesParcsanuid_id.value;
   anuidid := cdsAnuidadesParcsanuid_id.value;
   cdsParcelas.Post;

   datavenc := IncMonth(Dataprim,x);
   i:=i+1;
   x:= x+forma;


   cdsAnuidadesParcs.first;
   while not cdsAnuidadesParcs.eof do
   begin
      if anuidid <> cdsAnuidadesParcsanuid_id.value then
      begin
        cdsParcelas.Append;
        cdsParcelas.Edit;
        cdsParcelasValor.value := ValorTotal;
        cdsParcelasVencimento.value := datavenc;
        cdsParcelasNumParc.value := i;
        cdsParcelasParcela_descr.value := 'Exercício de '+ inttostr(cdsAnuidadesParcsano.value);
        cdsParcelasanuid_id.value := cdsAnuidadesParcsanuid_id.value;
        cdsParcelas.Post;
        datavenc := IncMonth(Dataprim,x);
        x:= x+forma;
        i := i +1;
      end;

      cdsAnuidadesParcs.next;
   end;


end;


end.
