unit UParcelamentoAntigoOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls,
  ComCtrls, Mask, Grids, DBGrids, DB, DBClient, JvEdit, JvTypedEdit;

type
  TfrmParcelamentoAntigoOpcoes = class(TModeloComum)
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UdparcsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CalculaParcs(totalparc:integer; dataprim:TDatetime; ValorTotal:real);
    procedure CalculaParcs2(totalparc:integer; dataprim:TDatetime; ValorTotal:real);
    procedure BitBtn1Click(Sender: TObject);
    procedure edPrimVenctoChange(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelamentoAntigoOpcoes: TfrmParcelamentoAntigoOpcoes;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}


procedure TfrmParcelamentoAntigoOpcoes.CalculaParcs(totalparc: integer;
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

procedure TfrmParcelamentoAntigoOpcoes.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmParcelamentoAntigoOpcoes.UdparcsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmParcelamentoAntigoOpcoes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
  CalculaParcs2(strtoint(edNumParc.text), strtodate(edPrimVencto.text), strtofloat(stringreplace(edValor.text,'.','',[rfreplaceall])));
  except
  Erro('Erro ao gerar as parcelas. ');
  end;
end;

procedure TfrmParcelamentoAntigoOpcoes.edPrimVenctoChange(Sender: TObject);
begin
  inherited;
   cdsParcelas.EmptyDataSet;
end;

procedure TfrmParcelamentoAntigoOpcoes.BtnOKClick(Sender: TObject);
begin
  inherited;
  If cdsparcelas.RecordCount = 0 then
  Begin
     Aviso('Gere as parcelas primeiro. ');
     ModalResult := mrnone;
  end;
end;

procedure TfrmParcelamentoAntigoOpcoes.FormShow(Sender: TObject);
begin
  inherited;
  if UserId in [13,25] then
     Udparcs.Max := 48;
end;

procedure TfrmParcelamentoAntigoOpcoes.CalculaParcs2(totalparc: integer;
  dataprim: TDatetime; ValorTotal: real);
var
  i:integer;
  valorparcreal, valorPrimParc : real;
  valorparcint:Integer;
  datavenc: TDatetime;
begin
   datavenc := Dataprim;
   valorparcint :=  trunc(ValorTotal / totalparc);

   valorPrimParc := valorparcint + (valortotal - ( valorparcint * totalparc));


{   If (valorparc * totalparc) > ValorTotal then
      valorparc := valorparc - 0.01;
   If (valorparc * totalparc) < ValorTotal then
      valorPrimParc := valorparc + ( ValorTotal - (valorparc * totalparc) )
   else
      valorPrimParc := valorparc;}

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
         cdsParcelasValor.value := valorparcint;
      cdsParcelasVencimento.value := datavenc;
      cdsParcelasNumParc.value := i;
      cdsParcelasParcela_descr.value := 'Parcela '+ inttostr(i)+'/'+inttostr(totalparc);
      cdsParcelas.Post;
      datavenc := IncMonth(Dataprim,i);
   end;
   cdsParcelas.First;
end;

end.
