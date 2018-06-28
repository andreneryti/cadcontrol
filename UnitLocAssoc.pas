unit UnitLocAssoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloLoc, WinSkinData, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, ComCtrls, ToolWin, ActnList, UCDefine, Provider, SqlExpr,
  DB, DBClient, DBLocal, DBLocalS;

type
  TfrmLocAssoc = class(TModeloLocalizar)
    Label1: TLabel;
    edcpfcnpj: TEdit;
    Label2: TLabel;
    edNome: TEdit;
    Label3: TLabel;
    edRegistro: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    acInserir: TAction;
    SpeedButton1: TSpeedButton;
    labtotal: TLabel;
    acEditar: TAction;
    acExcluir: TAction;
    spAlterar: TSpeedButton;
    spExcluir: TSpeedButton;
    SpeedButton2: TSpeedButton;
    acAlterEspecial: TAction;
    sdsLocEmail: TSQLClientDataSet;
    sdsLocEmailNOME: TStringField;
    StatusBar1: TStatusBar;
    labBarras: TLabel;
    editBarrasParte1: TMaskEdit;
    editguia: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure edcpfcnpjKeyPress(Sender: TObject; var Key: Char);
    procedure acInserirExecute(Sender: TObject);
    procedure EditarAssoc(ass_id:integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure edRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acEditarExecute(Sender: TObject);
    procedure acEditarUpdate(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acAlterEspecialExecute(Sender: TObject);
    procedure gridLocalizarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure acAlterEspecialUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcpfcnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridLocalizarTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocAssoc: TfrmLocAssoc;
  email:string;

implementation

uses UDMConexao, UDMAssociado, UNovoAssocInicial, UNovoAssoc, UFuncoes,
  UAlterDadosBasicos, UNovoAssoc2;

{$R *.dfm}

procedure TfrmLocAssoc.edcpfcnpjKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((key <#47) or (key>#58)) and (key<>#8) then
     key := #0;
end;

procedure TfrmLocAssoc.acInserirExecute(Sender: TObject);
var novo,i:integer;
    reg:string;
begin
  inherited;
  novo:=0;
  Try Application.createform(TfrmNovoAssocInicial,frmNovoAssocInicial);
  DMAssociado.sdsNovoRegistro.close;
  DMAssociado.sdsNovoRegistro.open;
  DMAssociado.cdsAssoc.close;
  DMAssociado.cdsAssoc.params.ParamByName('ass_id').value :=0;
  DMAssociado.cdsAssoc.OPen;
  DMAssociado.cdsAssoc.Append;
  DMAssociado.cdsAssoc.Edit;
  DMAssociado.cdsAssocDT_REGISTRO.value := DataAtual;
  DMAssociado.cdsAssocNACIONALIDADE.value :='Brasileira';
  DMAssociado.cdsAssocPGTO_OUTSIND.value :='N';
  DMAssociado.cdsAssocREGISTRO.value := trim(DMAssociado.sdsNovoRegistroNOVOREGISTRO.value) + inttostr(extractyear(DataAtual));
  DMAssociado.cdsAssocREPRESENTACAO.value:='S';
  DMAssociado.cdsAssocTP_STATUS_ID.value :=1;
  DMAssociado.cdsAssocTP_ASSOC_ID.value :=1;
  DMAssociado.cdsAssocEMP_ID.value:=1;
  DMAssociado.cdsAssocESTCIVIL_ID.value:=1;
  if frmNovoAssocInicial.showmodal = mrok  then
  begin
      novo := DMConexao.GeraAutoNumber('GEN_ASS_ID',1);
      DMAssociado.cdsAssocASS_ID.value := novo;

      for i := 0 to DMAssociado.PROC_ASSOC_IU.Params.count - 1 do
      begin
          if Assigned(DMAssociado.cdsAssoc.FindField(DMAssociado.PROC_ASSOC_IU.Params[i].Name)) then
            DMAssociado.PROC_ASSOC_IU.ParamByName(DMAssociado.PROC_ASSOC_IU.Params[i].Name).value := DMAssociado.cdsAssoc.FindField(DMAssociado.PROC_ASSOC_IU.Params[i].Name).value;
      end;
      DMAssociado.PROC_ASSOC_IU.ParamByName('oper').value:='I';
      DMConexao.GeraAutoNumber('GEN_REGISTRO',1);
      DMAssociado.PROC_ASSOC_IU.ExecProc;

      DMConexao.Log('Inclusão do Filiado ' + DMAssociado.cdsAssocREGISTRO.value+'-'+ DMAssociado.cdsAssocNOME.value+ '.', 'I', novo);

      //Foto
      DMAssociado.PROC_FOTO_UI.close;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('ASS_ID').value := novo;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMAGEM').clear;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('DATA_INCLUSAO').value :=  DataAtual;
      DMAssociado.PROC_FOTO_UI.Params.ParamByName('IMG_ID').value := 0;
      DMAssociado.PROC_FOTO_UI.ExecProc;

  end;
  finally
  frmNovoAssocInicial.free;
  end;

  If novo <>0 then
  begin
      EditarAssoc(novo);
  end;

end;

procedure TfrmLocAssoc.EditarAssoc(ass_id: integer);
begin
  Try Application.CreateForm(TfrmNovoAssoc2,frmNovoAssoc2);
  frmNovoAssoc2.RefreshAll(ass_id);
 // frmNovoAssoc.Caption:='Dados de ' +DMAssociado.cdsAssocNOME.value;
  frmNovoAssoc2.showmodal;
  finally
  frmNovoAssoc2.free;
  end;
end;

procedure TfrmLocAssoc.BitBtn2Click(Sender: TObject);
var
  i: integer;
begin
   gridLocalizar.DataSource.DataSet.close;
   for i := 0 to Dmassociado.cdsLocAssoc.Params.Count -1 do
      Dmassociado.cdsLocAssoc.params[i].clear;

   if edRegistro.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('registro').value:= edRegistro.Text;

   if edNome.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('nome').value:= edNome.Text;

   if edcpfcnpj.text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('CPFCNPJ').value:= edcpfcnpj.Text;

   if editguia.Text<>'' then
      Dmassociado.cdsLocAssoc.params.ParamByName('guia').value:= '14'+Copy(editguia.Text,3,3)  + Copy(editguia.Text,7,3) +  Copy(editguia.Text,12,5 )+ Copy(editguia.Text,17,4);

   if email <>'' then
       Dmassociado.cdsLocAssoc.params.ParamByName('email').value:= email;

   Dmassociado.cdsLocAssoc.open;

   labtotal.caption := 'Total: ' + inttostr(Dmassociado.cdsLocAssoc.recordcount);
end;

procedure TfrmLocAssoc.edRegistroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  I: Integer;
begin
  inherited;
  if Key = VK_DIVIDE then
  begin
    I    := Pos('/', edRegistro.EditMask) - 1;
    edRegistro.Text := Char_Left(Trim(Copy(edRegistro.Text, 1, i)), i, '0') + Copy(edRegistro.Text, 8, 4)
  end;

  if Key = 13 then
     btLocalizar.Click;
end;

procedure TfrmLocAssoc.acEditarExecute(Sender: TObject);
begin
  inherited;
  If gridLocalizar.DataSource.DataSet.Active = true then
  if gridLocalizar.DataSource.DataSet.RecordCount > 0 then
     EditarAssoc(gridLocalizar.DataSource.DataSet.fieldbyname('ass_id').value);

end;

procedure TfrmLocAssoc.acEditarUpdate(Sender: TObject);
begin
  inherited;
{  If gridLocalizar.DataSource.DataSet.Active = true then
     Taction(sender).Enabled :=  gridLocalizar.DataSource.DataSet.RecordCount > 0
  else
     Taction(sender).Enabled := false;}
end;

procedure TfrmLocAssoc.acExcluirExecute(Sender: TObject);
begin
  inherited;
  If gridLocalizar.DataSource.DataSet.Active = true then
    if gridLocalizar.DataSource.DataSet.RecordCount > 0 then
    begin
       If Confirma('Confirma exclusão do filiado "' + gridLocalizar.DataSource.DataSet.fieldbyname('NOMEASSOC').value +'"?') then
       begin
            DMAssociado.cdsAssocDel.Close;
            DMAssociado.cdsAssocDel.Params.ParamByName('ass_id').value := gridLocalizar.DataSource.DataSet.fieldbyname('ass_id').value;
            DMAssociado.cdsAssocDel.Open;
            If DMAssociado.cdsAssocDelQTDEPAGS.Value = 1 then
               Aviso('Não é possível excluir este filiado pois existe um ou mais pagamentos realizados. ')
            else
            If DMAssociado.cdsAssocDelQTDEPAGS.Value = 2 then
               Aviso('Não é possível excluir este filiado pois existe um ou mais dados relacionados. ')
            else
            begin
               DMConexao.Log('Exclusão do Filiado ' + gridLocalizar.DataSource.DataSet.fieldbyname('regassoc').value+'-'+ gridLocalizar.DataSource.DataSet.fieldbyname('nomeassoc').value+ '.', 'E', gridLocalizar.DataSource.DataSet.fieldbyname('ass_id').value);
               gridLocalizar.DataSource.DataSet.Refresh;
            end;
        end;
    end;

end;

procedure TfrmLocAssoc.acAlterEspecialExecute(Sender: TObject);
begin
  inherited;
  If gridLocalizar.DataSource.DataSet.Active = true then
  if gridLocalizar.DataSource.DataSet.RecordCount > 0 then
  begin
     try Application.CreateForm(TfrmAlterDadosBasicos,frmAlterDadosBasicos);
     frmAlterDadosBasicos.edRegistro.Text:=StringReplace(DMAssociado.cdsLocAssocREGASSOC.value,'/','',[rfreplaceall]);
     frmAlterDadosBasicos.edNome.Text:=DMAssociado.cdsLocAssocNOMEASSOC.value;
     frmAlterDadosBasicos.edcpfcnpj.Text:=StringReplace(StringReplace(StringReplace(DMAssociado.cdsLocAssocCPFCNPJASSOC.value,'/','',[rfreplaceall]),'.','',[rfreplaceall]),'-','',[rfreplaceall]);

     frmAlterDadosBasicos.cdsEmp_regiao.Open;
     frmAlterDadosBasicos.cdsEmp_regiao.Locate('REGIAO', DMAssociado.cdsLocAssocREGIAO.value,[]);
     frmAlterDadosBasicos.edlocalidade.text:=DMAssociado.cdsLocAssocREGIAO.value;

     frmAlterDadosBasicos.cdsTp_Pessoa.Open;
     frmAlterDadosBasicos.cdsTp_Pessoa.Locate('TP_ASSOC_DESC',DMAssociado.cdsLocAssocTP_PESSOA.value,[]);
     frmAlterDadosBasicos.edTpPessoa.text:=DMAssociado.cdsLocAssocTP_PESSOA.value;

     frmAlterDadosBasicos.cdsTp_Status.Open;
     frmAlterDadosBasicos.cdsTp_Status.Locate('TP_STATUS_DESCR',DMAssociado.cdsLocAssocSTATUS.value,[]);
     frmAlterDadosBasicos.dbStatus.text:=frmAlterDadosBasicos.cdsTp_StatusTP_STATUS_DESCR.value;

     If DMAssociado.cdsLocAssocTP_PESSOA.value ='Pessoa Física' then
     begin
       frmAlterDadosBasicos.edcpfcnpj.EditMask:='999.999.999-99;0;_';
     end
     else
     If DMAssociado.cdsLocAssocTP_PESSOA.value='Pessoa Jurídica' then
     begin
       frmAlterDadosBasicos.edcpfcnpj.EditMask:='99.999.999/9999-99;0;_';
     end;

     If frmAlterDadosBasicos.showmodal = mrok then
     begin
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.close;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('ASS_ID').value := DMAssociado.cdsLocAssocASS_ID.value;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('REGISTRO').value := frmAlterDadosBasicos.edRegistro.text;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('NOME').value := frmAlterDadosBasicos.edNome.text;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('CPFCNPJ').value := frmAlterDadosBasicos.edcpfcnpj.text;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('EMP_ID').value := frmAlterDadosBasicos.cdsEmp_regiaoEMP_ID.value;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('TP_ASSOC').value := frmAlterDadosBasicos.cdsTp_PessoaTP_ASSOC_ID.value;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ParamByName('status').value := frmAlterDadosBasicos.cdsTp_StatusTP_STATUS_ID.value;
       DMAssociado.PROC_ASSOC_DADOSBASICOS_UPD.ExecProc;
       DMConexao.Log('Alteração de Dados Básicos: ' + frmAlterDadosBasicos.edRegistro.text+'/'+ frmAlterDadosBasicos.edNome.text+'/'+frmAlterDadosBasicos.edcpfcnpj.text+'/'+ inttostr(frmAlterDadosBasicos.cdsEmp_regiaoEMP_ID.value)+'/'+inttostr(frmAlterDadosBasicos.cdsTp_PessoaTP_ASSOC_ID.value)+'/'+ inttostr(frmAlterDadosBasicos.cdsTp_StatusTP_STATUS_ID.value)+'.', 'A',DMAssociado.cdsLocAssocASS_ID.value );
       btLocalizar.Click;
     end;

     finally
     frmAlterDadosBasicos.free;
     end;

  end;

end;

procedure TfrmLocAssoc.gridLocalizarDrawColumnCell(Sender: TObject;
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

  if (DMAssociado.cdsLocAssocSTATUS.value = 'Cancelado') then
  begin
    Tdbgrid(Sender).Canvas.Font.Color := clred;
    Tdbgrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;



end;

procedure TfrmLocAssoc.acAlterEspecialUpdate(Sender: TObject);
begin
  inherited;
{  If gridLocalizar.DataSource.DataSet.Active = true then
     Taction(sender).Enabled :=  gridLocalizar.DataSource.DataSet.RecordCount > 0
  else
     Taction(sender).Enabled := false;}
end;

procedure TfrmLocAssoc.FormCreate(Sender: TObject);
begin
  inherited;
  gridLocalizar.DataSource:= DMAssociado.dsLocAssoc;
  if copy(DMConexao.sdsConfigNOMEEMP.Value,1,1)='F' then
  begin
        labBarras.Visible:=false;
        editBarrasParte1.Visible:=false;
        editguia.Visible:=false;
        RadioButton2.Visible:=false;
        RadioButton1.Visible:=false;
  end;
end;

procedure TfrmLocAssoc.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
     btLocalizar.Click;
end;

procedure TfrmLocAssoc.edcpfcnpjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
     btLocalizar.Click;
end;

procedure TfrmLocAssoc.gridLocalizarTitleClick(Column: TColumn);
begin
  inherited;
  DmAssociado.cdsLocAssoc.IndexFieldNames :=  Column.FieldName;
end;

procedure TfrmLocAssoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  label volta;
  var
    emailproc:string;
begin
  inherited;
   if Key = VK_F7 then
    begin
        volta:
        if not (InputQuery('E-mail', 'E-mail a localizar: ', emailproc)) then
            exit;

        sdsLocEmail.close;
        sdsLocEmail.Params.ParamByName('email').value := emailproc;
        sdsLocEmail.open;
        if sdsLocEmail.RecordCount = 0 then
        begin
            Aviso('E-mail não localizado na base de dados. ');
            email := '';
            goto volta;
        end
        else
        begin
            email := emailproc;
            btLocalizar.Click;
            email := '';
        end;
    end
end;

procedure TfrmLocAssoc.RadioButton1Click(Sender: TObject);
begin
  inherited;
   editBarrasParte1.text:='10491.03912';
end;

procedure TfrmLocAssoc.RadioButton2Click(Sender: TObject);
begin
  inherited;
   editBarrasParte1.text:='10492.40623';
end;

end.
