unit UNovoAnexo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Mask, JvToolEdit, JvDBCtrl;

type
  TfrmNovoAnexo = class(TModeloInserir)
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    btArquivo: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure btGravarClick(Sender: TObject);
    procedure btArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoAnexo: TfrmNovoAnexo;

implementation

uses UDMAssociado, UFuncoes;

{$R *.dfm}

procedure TfrmNovoAnexo.btGravarClick(Sender: TObject);
begin
  inherited;
  if DMAssociado.cdsAnexoNOMEARQUIVO.value = '' then
  begin
     Aviso('O arquivo ainda não foi selecionado. ');
     btArquivo.setfocus;
     ModalResult := mrNone;
  end;
end;

procedure TfrmNovoAnexo.btArquivoClick(Sender: TObject);
begin
  inherited;
  If OpenDialog1.execute then
  begin
      DMAssociado.cdsAnexoIMAGEM.LoadFromFile(OpenDialog1.FileName);
      DMAssociado.cdsAnexoNOMEARQUIVO.value := ExtractFilename(OpenDialog1.Filename);
  end;
end;

end.
