unit UMalaDiretaNova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls,
  Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
  TfrmMalaDiretaNova = class(TModeloComum)
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    memoDescricao: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    editAssunto: TEdit;
    memoCorpo: TMemo;
    Bevel1: TBevel;
    Label4: TLabel;
    editIdentificacao: TEdit;
    sdsVerExiste: TSQLClientDataSet;
    sdsVerExisteQTDE: TIntegerField;
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMalaDiretaNova: TfrmMalaDiretaNova;
  oldvalue:string;

implementation

uses UFuncoes, UDMConexao;

{$R *.dfm}

procedure TfrmMalaDiretaNova.BtnOKClick(Sender: TObject);
begin
  inherited;

  If (editIdentificacao.text='') or
     (memoDescricao.Lines.Text = '') or
     (editAssunto.text='') or
     (memoCorpo.Lines.text='') then
  begin
      Aviso('Todos os campos são obrigatórios. ' );
      ModalResult := mrnone;
  end
  else
  begin
      sdsVerExiste.close;
      sdsVerExiste.Params.ParamByName('nome').value := UpperCase(editIdentificacao.text);
      sdsVerExiste.Open;
      If  (sdsVerExisteQTDE.value > 0) and ( oldvalue <> editIdentificacao.text) then
      begin
        Aviso('Já existe uma Mala Direta com este nome. ' );
        editIdentificacao.setfocus;
        ModalResult := mrnone;
      end;

  end;
end;

end.
