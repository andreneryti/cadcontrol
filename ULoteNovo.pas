unit ULoteNovo;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, UnitModeloComum, ExtCtrls, StdCtrls, Buttons, WinSkinData,
    Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS;

type
    TfrmLoteNovo = class(TModeloComum)
        BtnOK: TBitBtn;
        BitBtn3: TBitBtn;
        Label1: TLabel;
        editNomeLote: TEdit;
        Bevel1: TBevel;
        sdsVerExisteLote: TSQLClientDataSet;
        sdsVerExisteLoteQTDE: TIntegerField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    editDescr: TEdit;
        procedure BtnOKClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmLoteNovo: TfrmLoteNovo;

implementation

uses UDmlotes, UDMConexao, UFuncoes;

{$R *.dfm}

procedure TfrmLoteNovo.BtnOKClick(Sender: TObject);
begin
    inherited;
    if editNomeLote.Text <> '' then
    begin
        sdsVerExisteLote.close;
        sdsVerExisteLote.Params.ParamByName('lote').value := editNomeLote.text;
        sdsVerExisteLote.open;
        if sdsVerExisteLoteQTDE.value > 0 then
        begin
            Aviso('Nome de Lote ja existente. ');
            editNomeLote.SetFocus;
            ModalResult := mrnone;
            exit;
        end;
    end
    else
    begin
         Aviso('Nome de Lote n�o pode ser vazio. ');
         editNomeLote.SetFocus;
         ModalResult := mrnone;
         exit;
    end;

end;

procedure TfrmLoteNovo.RadioButton1Click(Sender: TObject);
begin
  inherited;
  editNomeLote.text := Dmlotes.NovoNumLote('C');
  editDescr.Text :='Lote de Contribui��o';
end;

procedure TfrmLoteNovo.RadioButton2Click(Sender: TObject);
begin
  inherited;
editNomeLote.text := Dmlotes.NovoNumLote('P');
editDescr.Text :='Lote de Parcelamento';
end;

procedure TfrmLoteNovo.FormShow(Sender: TObject);
begin
  inherited;
  RadioButton1Click(sender);
end;

end.

