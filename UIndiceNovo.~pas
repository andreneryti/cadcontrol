unit UIndiceNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, WinSkinData, ExtCtrls, StdCtrls, Mask, Buttons,
  FMTBcd, DB, SqlExpr;

type
  TfrmIndiceNovo = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    editDtVigencia: TMaskEdit;
    Bevel1: TBevel;
    sdsVerIndice: TSQLDataSet;
    sdsVerIndiceQTDE: TIntegerField;
    edIndice: TMaskEdit;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndiceNovo: TfrmIndiceNovo;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmIndiceNovo.BtnOKClick(Sender: TObject);
begin
  inherited;
  try
  strtodate(editDtVigencia.text);
  except
      Aviso('Data inválida. ');
      Modalresult := mrnone;
      editDtVigencia.setfocus;
      exit;
  end;


  sdsVerIndice.close;
  sdsVerIndice.ParamByName('data').value:= strtodate(editDtVigencia.text);
  sdsVerIndice.Open;

  If sdsVerIndiceQTDE.value > 0 then
  begin
      Aviso('Já existe um índice cadastrado para este data. ');
      ModalResult := mrnone;
      exit;
  end;

end;

procedure TfrmIndiceNovo.FormShow(Sender: TObject);
begin
  inherited;
  editDtVigencia.Setfocus;
end;

end.
