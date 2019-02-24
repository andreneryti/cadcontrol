unit UNovoRelacionamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloInserir, WinSkinData, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfrmNovoRelacionamento = class(TModeloInserir)
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    edNome: TDBEdit;
    Label9: TLabel;
    edCpfCnpj: TDBEdit;
    Label1: TLabel;
    edRegistro: TMaskEdit;
    sbLocAssoc: TSpeedButton;
    cbTipoRel: TDBLookupComboBox;
    cbSituacao: TDBLookupComboBox;
    sdsTipoRel: TSQLDataSet;
    dspTipoRel: TDataSetProvider;
    cdsTipoRel: TClientDataSet;
    dsTipoRel: TDataSource;
    cdsTipoRelTP_REL_ID: TIntegerField;
    cdsTipoRelTP_REL_DESCRICAO: TStringField;
    dspSituacao: TDataSetProvider;
    cdsSituacao: TClientDataSet;
    dsSituacao: TDataSource;
    sdsSituacao: TSQLDataSet;
    cdsSituacaoTP_STATUS_ID: TIntegerField;
    cdsSituacaoTP_STATUS_DESCR: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    sdsPegaRergistro: TSQLDataSet;
    sdsPegaRergistroREGISTRO: TStringField;
    procedure sbLocAssocClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCpfCnpjExit(Sender: TObject);
    procedure edRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoRelacionamento: TfrmNovoRelacionamento;

implementation

uses UDMAssociado, UDMConexao, UFuncoes, UBuscaAssoc;

{$R *.dfm}

procedure TfrmNovoRelacionamento.sbLocAssocClick(Sender: TObject);
begin
  Try Application.createform(TfrmBuscaAssoc,frmBuscaAssoc);
  if frmBuscaAssoc.showmodal = mrok then
  begin
     DMAssociado.dsRelac.dataset.edit;
     if DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
        DMAssociado.cdsRelacASS_IDFILHO.value := DMAssociado.cdsLocAssocASS_ID.value
     else
     if DMAssociado.cdsAssocTP_ASSOC_ID.value = 2 then
        DMAssociado.cdsRelacASS_IDPAI.value := DMAssociado.cdsLocAssocASS_ID.value;

     DMAssociado.cdsRelacCPFSOCIO.value := StringReplace(StringReplace(StringReplace(DMAssociado.cdsLocAssocCPFCNPJASSOC.value,'.','',[rfreplaceall]),'/','',[rfreplaceall]),'-','',[rfreplaceall]);
     edCpfCnpjExit(sender);
     DMAssociado.cdsRelacNOMESOCIO.value :=DMAssociado.cdsLocAssocNOMEASSOC.value;
     edRegistro.Text:= StringReplace(DMAssociado.cdsLocAssocREGASSOC.value,'/','',[rfreplaceall]);
  end;
  finally
  frmBuscaAssoc.free;
  end;
end;

procedure TfrmNovoRelacionamento.btGravarClick(Sender: TObject);
begin
  inherited;
  If (DMAssociado.cdsRelacTP_REL_ID.value = 0) or (DMAssociado.cdsRelacTP_REL_ID.value = null)then
  begin
      erro('Defina o tipo de relacionamento. ');
      cbTipoRel.setfocus;
      Modalresult := mrnone;
      abort;

  end;

  If DMAssociado.cdsRelacTP_REL_ID.value = 1 then
  begin
     If edRegistro.text='' then
     begin
        erro('Defina o filiado com vínculo de Responsável Técnico. ');
        Modalresult := mrnone;
        abort;
     end;
  end;

  If DMAssociado.cdsRelacNOMESOCIO.value='' then
  begin
     erro('Digite o nome do relacionado. ');
     edNome.Setfocus;
     Modalresult := mrnone;
  end;
end;

procedure TfrmNovoRelacionamento.FormShow(Sender: TObject);
begin
  inherited;
  cdsTipoRel.Open;
  cdsSituacao.Open;
end;

procedure TfrmNovoRelacionamento.edCpfCnpjExit(Sender: TObject);
begin
  inherited;
  edCpfCnpj.text := MaskCPFCGC(edCpfCnpj.text);
end;

procedure TfrmNovoRelacionamento.edRegistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   i:integer;
begin
  inherited;
  if Key = VK_DIVIDE then
  begin
    I    := Pos('/', edRegistro.EditMask) - 1;
    edRegistro.Text := Char_Left(Trim(Copy(edRegistro.Text, 1, i)), i, '0') + Copy(edRegistro.Text, 8, 4)
  end;

  if Key = 13 then
  begin
      I    := Pos('/', edRegistro.EditMask) - 1;
      edRegistro.Text := Char_Left(Trim(Copy(edRegistro.Text, 1, i)), i, '0') + Copy(edRegistro.Text, 8, 4);


      Try Application.createform(TfrmBuscaAssoc,frmBuscaAssoc);
          frmBuscaAssoc.edRegistro.Text := edRegistro.Text;
          frmBuscaAssoc.btLocalizarClick(sender);
          if DMAssociado.dsLocAssoc.dataset.RecordCount >0 then
          begin
             DMAssociado.dsRelac.dataset.edit;
             if DMAssociado.cdsAssocTP_ASSOC_ID.value = 1 then
                DMAssociado.cdsRelacASS_IDFILHO.value := DMAssociado.cdsLocAssocASS_ID.value
             else
             if DMAssociado.cdsAssocTP_ASSOC_ID.value = 2 then
                DMAssociado.cdsRelacASS_IDPAI.value := DMAssociado.cdsLocAssocASS_ID.value;

             DMAssociado.cdsRelacCPFSOCIO.value := StringReplace(StringReplace(StringReplace(DMAssociado.cdsLocAssocCPFCNPJASSOC.value,'.','',[rfreplaceall]),'/','',[rfreplaceall]),'-','',[rfreplaceall]);
             edCpfCnpjExit(sender);
             DMAssociado.cdsRelacNOMESOCIO.value :=DMAssociado.cdsLocAssocNOMEASSOC.value;
             edRegistro.Text:= StringReplace(DMAssociado.cdsLocAssocREGASSOC.value,'/','',[rfreplaceall]);
          end;
      finally
          frmBuscaAssoc.free;
      end;
  end;

end;

end.
