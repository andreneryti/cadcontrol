unit ULoteRepasseDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmLoteRepasseDados = class(TForm)
    pnl1: TPanel;
    btnBtnOK: TBitBtn;
    btn1: TBitBtn;
    Label1: TLabel;
    editDtRepasse: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    labTotItens: TLabel;
    labTotValor: TLabel;
    labTotRepasse: TLabel;
    SkinData1: TSkinData;
    bvl1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnBtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoteRepasseDados: TfrmLoteRepasseDados;

implementation

uses UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmLoteRepasseDados.FormShow(Sender: TObject);
begin
   editDtRepasse.Text:= DateToStr(dataatual);
end;

procedure TfrmLoteRepasseDados.btnBtnOKClick(Sender: TObject);
begin
   try
   StrToDate(editDtRepasse.text);
   except
     aviso('Data inválida. ');
     editDtRepasse.setfocus;
     Exit;
   end;



end;

end.
