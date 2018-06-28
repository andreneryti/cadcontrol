unit UFormParcelaAlterDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvEdit, JvTypedEdit, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFormParcelaAlterDados = class(TForm)
    Panel1: TPanel;
    BtnOK: TBitBtn;
    BitBtn3: TBitBtn;
    editdescricao: TEdit;
    EditContribuicao: TEdit;
    EditVencimento: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditAno: TEdit;
    Label5: TLabel;
    editValor: TJvCurrencyEdit;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParcelaAlterDados: TFormParcelaAlterDados;
  Anuid_id:integer;

implementation

{$R *.dfm}

end.
