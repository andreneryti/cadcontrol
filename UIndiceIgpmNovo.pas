unit UIndiceIgpmNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Mask, Buttons,
  FMTBcd, DB, SqlExpr;

type
  TfrmIndiceIgpmNovo = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    editAno: TMaskEdit;
    cbmes: TComboBox;
    Bevel1: TBevel;
    editValor: TEdit;
    sdsVerIndice: TSQLDataSet;
    sdsVerIndiceQTDE: TIntegerField;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndiceIgpmNovo: TfrmIndiceIgpmNovo;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmIndiceIgpmNovo.BtnOKClick(Sender: TObject);
begin
  inherited;
  If editAno.text='' then
  begin
      Aviso('Ano não pode ser vazio. ');
      Modalresult := mrnone;
      Editano.setfocus;
      Abort;
  end;

  If cbmes.ItemIndex=-1 then
  begin
      Aviso('Mês não pode ser vazio. ');
      Modalresult := mrnone;
      cbmes.setfocus;
      Abort;
  end;

  If editValor.text ='' then
  begin
      Aviso('Valor do índice não pode ser vazio. ');
      Modalresult := mrnone;
      editValor.setfocus;
      Abort;
  end;

  sdsVerIndice.close;
  sdsVerIndice.ParamByName('ano').value:= strtoint(editano.text);
  sdsVerIndice.ParamByName('mes').value:= cbmes.ItemIndex+1;
  sdsVerIndice.Open;

  If sdsVerIndiceQTDE.value > 0 then
  begin
      Aviso('Já existe um índice cadastrado para este ano e mês. ');
      ModalResult := mrnone;
      Abort;
  end;

end;

procedure TfrmIndiceIgpmNovo.FormShow(Sender: TObject);
begin
  inherited;
  editAno.Setfocus;
end;

end.
