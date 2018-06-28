unit UDemonstrativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloComum, StdCtrls, Buttons, WinSkinData, ExtCtrls,
  Grids, DBGrids, JvEdit, JvTypedEdit, ComCtrls, ShellApi;

type
  TfrmDemonstrativo = class(TModeloComum)
    BitBtn1: TBitBtn;
    edNome: TEdit;
    Label1: TLabel;
    cbRepres: TCheckBox;
    cbTipo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edRegSocial: TDateTimePicker;
    Label4: TLabel;
    edCapSocial: TJvCurrencyEdit;
    Bevel1: TBevel;
    btCalcular: TBitBtn;
    btImprimir: TBitBtn;
    DBGrid1: TDBGrid;
    Bevel2: TBevel;
    Label5: TLabel;
    labtotal: TLabel;
    checOutSind: TCheckBox;
    Label7: TLabel;
    cbtipoContrib: TComboBox;
    cbLocalidade: TComboBox;
    Label8: TLabel;
    btNovo: TBitBtn;
    btEnviarEmail: TBitBtn;
    procedure edCapSocialEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbTipoSelect(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btEnviarEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemonstrativo: TfrmDemonstrativo;

implementation

uses UDMAssociado, UFuncoes, UDMConexao, UQRExtratoRecepcao,
  UExtratoEnvioEmail, UDmFinancas;

{$R *.dfm}

procedure TfrmDemonstrativo.edCapSocialEnter(Sender: TObject);
begin
  inherited;
  edCapSocial.SelectAll;
end;

procedure TfrmDemonstrativo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmDemonstrativo.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmDemonstrativo.cbTipoSelect(Sender: TObject);
begin
  inherited;
  If cbTipo.ItemIndex = 0 then
  begin
     edCapSocial.Enabled := true;
     edRegSocial.Enabled := true;
     cbRepres.Enabled := true;
  end
  else
  If cbTipo.ItemIndex = 1 then
  begin
     edCapSocial.Enabled := false;
     edRegSocial.Enabled := false;
     cbRepres.Enabled := false;
  end

end;

procedure TfrmDemonstrativo.btCalcularClick(Sender: TObject);
var
  i:integer;
begin
  inherited;

  DMAssociado.cdsExtratoNovo.EnableControls;
  DMAssociado.cdsExtratoNovo.close;
  For i := 0 to 7 do
     DMAssociado.cdsExtratoNovo.Params[i].Clear;


  DMAssociado.cdsExtratoNovo.Params.ParamByName('TPPESSOA').value :=  cbTipo.ItemIndex + 1;

  if cbTipo.ItemIndex = 0 then
  begin
     DMAssociado.cdsExtratoNovo.Params.ParamByName('CAPSOCIAL').value := edCapSocial.value;
     DMAssociado.cdsExtratoNovo.Params.ParamByName('REGSOCIAL').value := UltimoDia(edRegSocial.Date);
     If cbRepres.Checked = true then
        DMAssociado.cdsExtratoNovo.Params.ParamByName('REPRESENT').value := 1
     else
        DMAssociado.cdsExtratoNovo.Params.ParamByName('REPRESENT').value := 0;
  end
  else
  begin
     DMAssociado.cdsExtratoNovo.Params.ParamByName('CAPSOCIAL').value := 0;
     DMAssociado.cdsExtratoNovo.Params.ParamByName('REGSOCIAL').value := Dataatual;
     DMAssociado.cdsExtratoNovo.Params.ParamByName('REPRESENT').value := 1;
  end;

  if  checOutSind.checked = true then
     DMAssociado.cdsExtratoNovo.Params.ParamByName('OUTSINDIC').value :=1
  else
     DMAssociado.cdsExtratoNovo.Params.ParamByName('OUTSINDIC').value :=0;


  DMAssociado.cdsExtratoNovo.Params.ParamByName('TIPOCONTRIB').value := cbtipoContrib.ItemIndex +1;

  DMAssociado.cdsExtratoNovo.Params.ParamByName('DATAATUAL').value := Dataatual;

  DMAssociado.cdsExtratoNovo.Params.ParamByName('EMP_ID').value := cbLocalidade.ItemIndex + 1;

  DMAssociado.cdsExtratoNovo.Open;

  if DMAssociado.cdsExtratoNovo.RecordCount > 0 then
  begin
     btImprimir.Enabled:=true;
     If copy(DMConexao.sdsConfigNOMEEMP.value,1,1)<>'F' then
         btEnviarEmail.Enabled:=true;

     DMAssociado.cdsExtratoNovo.last;

     DMAssociado.cdsExtratoNovo.IndexFieldNames :=  'TOTALGERAL';
     DMAssociado.cdsExtratoNovo.last;
     labtotal.caption:= formatfloat(',0.00', DMAssociado.cdsExtratoNovoTOTALGERAL.AsFloat);
     DMAssociado.cdsExtratoNovo.IndexFieldNames :=  'VENCIMENTO';
     DMAssociado.cdsExtratoNovo.first;
  end;

end;

procedure TfrmDemonstrativo.btNovoClick(Sender: TObject);
begin
  inherited;
  DMAssociado.cdsExtratoNovo.close;
  edNome.Clear;
  cbLocalidade.ItemIndex := 0;
  cbtipoContrib.ItemIndex := 0;
  cbTipo.ItemIndex := 0;
  edCapSocial.Value := 1;
  edRegSocial.date := dataatual;
  cbRepres.Checked:=true;
  checOutSind.Checked := false;
  btImprimir.Enabled:=false;
  btEnviarEmail.Enabled:=false;
  labtotal.caption := '0,00';
end;

procedure TfrmDemonstrativo.btImprimirClick(Sender: TObject);
var
  validade:TDateTime;
  total, totsind, totconf:Real;
begin
  inherited;
  If DMAssociado.dsExtratoNovo.dataset.active = true then
     If DMAssociado.dsExtratoNovo.dataset.RecordCount > 0 then
     begin
         Try
            Application.createform(TQRExtratoRecepcao,QRExtratoRecepcao);
            QRExtratoRecepcao.labtitulo.caption := cbtipoContrib.Text + ' - ' + QRExtratoRecepcao.labtitulo.caption;
            QRExtratoRecepcao.labNome.Caption := ednome.Text;
            QRExtratoRecepcao.labLocalidade.caption := cbLocalidade.text;
            QRExtratoRecepcao.labTpPessoa.Caption:= cbTipo.Text;
            If cbTipo.ItemIndex = 0 then
            begin
                QRExtratoRecepcao.labRegSocial.caption:= datetostr(edRegSocial.date);
                QRExtratoRecepcao.labCapSocial.caption:= 'R$ ' + Formatfloat(',0.00',edCapSocial.Value);
                If cbRepres.Checked = true then
                   QRExtratoRecepcao.labRepres.caption:= 'Sim'
                else
                   QRExtratoRecepcao.labRepres.caption:= 'Não';
            end
            else
            begin
                QRExtratoRecepcao.labRegSocial.caption:= '----------';
                QRExtratoRecepcao.labCapSocial.caption:= '----------';
               QRExtratoRecepcao.labRepres.caption:='----------';
            end;

            If checOutSind.Checked = true then
               QRExtratoRecepcao.labOutSind.caption:= 'Sim'
            else
               QRExtratoRecepcao.labOutSind.caption:= 'Não';

            DMAssociado.sdsEmpresa.close;
            DMAssociado.sdsEmpresa.ParamByName('emp_id').value := cbLocalidade.ItemIndex +1;
            DMAssociado.sdsEmpresa.Open;

            QRExtratoRecepcao.labEmpresa.caption := DMAssociado.sdsEmpresaNOMEEMP.value;
           // validade := EncodeDate(ExtractYear(DataAtual),ExtractMonth(DataAtual),extractday(UltimoDia(DataAtual)));
           validade := DataAtual;
            QRExtratoRecepcao.labValidade.caption := Datetostr(validade)+'.';

            total :=0;
            totsind :=0;
            totconf:=0;
            DMAssociado.cdsExtratoNovo.DisableControls;
            DMAssociado.cdsExtratoNovo.first;
            while not DMAssociado.cdsExtratoNovo.eof do
            begin
                 total := total + DMAssociado.cdsExtratoNovoTOTAL.asfloat;
                 If Pos('Sindical',DMAssociado.cdsExtratoNovoDESCRICAO.Value) > 0 then
                    totsind := totsind + DMAssociado.cdsExtratoNovoTOTAL.AsFloat
                 else
                 If Pos('Confederativa',DMAssociado.cdsExtratoNovoDESCRICAO.Value) > 0 then
                    totconf := totconf + DMAssociado.cdsExtratoNovoTOTAL.AsFloat;
                 DMAssociado.cdsExtratoNovo.Next;
            end;


            DMAssociado.cdsExtratoNovo.EnableConstraints;
            DMAssociado.cdsExtratoNovo.First;


            QRExtratoRecepcao.labtotal.Caption := 'R$ ' + FormatFloat(',0.00', total);
            QRExtratoRecepcao.labtotalSind.Caption := 'R$ ' + FormatFloat(',0.00', totsind);
            QRExtratoRecepcao.labtotalConf.Caption := 'R$ ' + FormatFloat(',0.00', totconf);

            if Confirma('Imprimir apenas os totais?') then
            begin
                QRExtratoRecepcao.labValorTitulo.Caption :='';
                QRExtratoRecepcao.labJurosTitulo.Caption :='';
                QRExtratoRecepcao.labMultaTitulo.Caption :='';
                QRExtratoRecepcao.labCorrecaoTitulo.Caption :='';
                QRExtratoRecepcao.labvalor.DataField:='';
                QRExtratoRecepcao.labjuros.DataField:='';
                QRExtratoRecepcao.labcorrecao.DataField:='';
                QRExtratoRecepcao.labMulta.DataField:='';
            end;

            QRExtratoRecepcao.preview;
         finally
            QRExtratoRecepcao.free;
         end;

     end;
end;

procedure TfrmDemonstrativo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMAssociado.cdsExtratoNovo.close;
end;

procedure TfrmDemonstrativo.FormShow(Sender: TObject);
begin
  inherited;
  edRegSocial.date := dataatual;
  btImprimir.Enabled:=false;
  btEnviarEmail.Enabled:=false;
end;

procedure TfrmDemonstrativo.btEnviarEmailClick(Sender: TObject);
var
  validade:TDateTime;
  olObjeto: OleVariant;
  caminho :string;
  pasta :string;
  novoarquivo:String;
begin
  inherited;
  If DMAssociado.dsExtratoNovo.dataset.active = true then
     If DMAssociado.dsExtratoNovo.dataset.RecordCount > 0 then
     begin
         try application.createform(TfrmExtratoEnviarEmail,frmExtratoEnviarEmail);
         frmExtratoEnviarEmail.Memomsg.clear;
         frmExtratoEnviarEmail.Memomsg.lines.add('Aos cuidados de ' + ednome.text+'.');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Prezado Senhor(a),');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Como solicitado, segue abaixo a relação de documentos necessários para cadastro');
         frmExtratoEnviarEmail.Memomsg.lines.add('inicial e em anexo a simulação de valores.');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Pessoa Física / Responsável Técnico:');
         frmExtratoEnviarEmail.Memomsg.lines.add('- RG');
         frmExtratoEnviarEmail.Memomsg.lines.add('- CPF');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Comprovante de Residência');
         frmExtratoEnviarEmail.Memomsg.lines.add('- 2 telefones');
         frmExtratoEnviarEmail.Memomsg.lines.add('- E-mail');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Estado civil');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Pessoa Jurídica:');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Contrato Social + Alterações (se houver)');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Requerimento de Empresário Individual');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Cartão CNPJ');
         frmExtratoEnviarEmail.Memomsg.lines.add('- Alvará (se tiver)');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('* Atenção à data de validade dos valores contida no documento anexo.');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Atenciosamente,');
         frmExtratoEnviarEmail.Memomsg.lines.add('');
         frmExtratoEnviarEmail.Memomsg.lines.add('Sindicato do Representantes Comerciais do Rio de Janeiro');
         frmExtratoEnviarEmail.Memomsg.lines.add('Site: www.sircomrj.com.br');
         frmExtratoEnviarEmail.Memomsg.lines.add('E-mail: sindicato@sircomrj.com.br');
         frmExtratoEnviarEmail.Memomsg.lines.add('Endereço: Av. Graça Aranha, 416, sl. 425, Castelo - Rio de Janeiro,');
         frmExtratoEnviarEmail.Memomsg.lines.add('CEP 24.020-320, Tel: (21) 2524-2859 / (21) 2210-1838');

         if frmExtratoEnviarEmail.showmodal = mrok then
         begin
             Try
                Application.createform(TQRExtratoRecepcao,QRExtratoRecepcao);
                QRExtratoRecepcao.labtitulo.caption := cbtipoContrib.Text + ' - ' + QRExtratoRecepcao.labtitulo.caption;
                QRExtratoRecepcao.labNome.Caption := ednome.Text;
                QRExtratoRecepcao.labLocalidade.caption := cbLocalidade.text;
                QRExtratoRecepcao.labTpPessoa.Caption:= cbTipo.Text;
                If cbTipo.ItemIndex = 0 then
                begin
                    QRExtratoRecepcao.labRegSocial.caption:= datetostr(edRegSocial.date);
                    QRExtratoRecepcao.labCapSocial.caption:= 'R$ ' + Formatfloat(',0.00',edCapSocial.Value);
                    If cbRepres.Checked = true then
                       QRExtratoRecepcao.labRepres.caption:= 'Sim'
                    else
                       QRExtratoRecepcao.labRepres.caption:= 'Não';
                end
                else
                begin
                    QRExtratoRecepcao.labRegSocial.caption:= '----------';
                    QRExtratoRecepcao.labCapSocial.caption:= '----------';
                   QRExtratoRecepcao.labRepres.caption:='----------';
                end;

                If checOutSind.Checked = true then
                   QRExtratoRecepcao.labOutSind.caption:= 'Sim'
                else
                   QRExtratoRecepcao.labOutSind.caption:= 'Não';

                DMAssociado.sdsEmpresa.close;
                DMAssociado.sdsEmpresa.ParamByName('emp_id').value := cbLocalidade.ItemIndex +1;
                DMAssociado.sdsEmpresa.Open;

                QRExtratoRecepcao.labEmpresa.caption := DMAssociado.sdsEmpresaNOMEEMP.value;
               // validade := EncodeDate(ExtractYear(DataAtual),ExtractMonth(DataAtual),extractday(UltimoDia(DataAtual)));
               validade := DataAtual;
                QRExtratoRecepcao.labValidade.caption := Datetostr(validade)+'.';

                QRExtratoRecepcao.labtotal.Caption :='Total: R$ '+ labtotal.caption;

                if Confirma('Extrato apenas com os totais?') then
                begin
                    QRExtratoRecepcao.labValorTitulo.Caption :='';
                    QRExtratoRecepcao.labJurosTitulo.Caption :='';
                    QRExtratoRecepcao.labMultaTitulo.Caption :='';
                    QRExtratoRecepcao.labCorrecaoTitulo.Caption :='';
                    QRExtratoRecepcao.labvalor.DataField:='';
                    QRExtratoRecepcao.labjuros.DataField:='';
                    QRExtratoRecepcao.labcorrecao.DataField:='';
                    QRExtratoRecepcao.labMulta.DataField:='';
                end;


                caminho := ExtractFilePath(Application.ExeName) +'email';

                DMAssociado.sdsNovoGenEmail.open;
                pasta := DMAssociado.sdsNovoGenEmailNOVO.value ;
                DMAssociado.sdsNovoGenEmail.close;

                try
                  CreateDir(caminho+'\'+pasta);
                except
                  Aviso('Usuário sem permissão de acesso ao disco. ');
                  exit;
                end;

                DMAssociado.sdsNovoGenArquivo.open;

                novoarquivo :=  inttostr(ExtractYear(DataAtual))+'_'+DMAssociado.sdsNovoGenArquivoNOVO.value;
                DMAssociado.sdsNovoGenArquivo.close;

                ExibeAguarde('Preparando e-mail. Por favor aguarde...');

                try
                if gerarPDF(QRExtratoRecepcao,caminho+'\'+pasta,'Extrato_'+novoarquivo+ '.pdf') = 0 then
                begin
                    Aviso('Erro ao gerar arquivo PDF a ser enviado. ');
                    Exit;
                end;
                except
                   Aviso('Erro ao gerar PDF. ');
                   exit;
                end;

                Sleep(3000);
                try

                EscondeAguarde;


                ExibeAguarde('Enviando e-mail. Por favor aguarde...');
                if EnviarEmail(frmExtratoEnviarEmail.edPARA.text,frmExtratoEnviarEmail.edAssunto.text,RICH_HTML(frmExtratoEnviarEmail.Memomsg),ArquivosDIr(caminho+'\'+pasta)) = 1 then
                begin
                   EscondeAguarde;

                   Aviso('E-mail enviado com sucesso.');

                end;
                except
                   EscondeAguarde;

                   Aviso('Erro ao enviar e-mail. ');
                   exit;
                end;

             finally
                QRExtratoRecepcao.free;
             end;

         end;
         finally
         frmExtratoEnviarEmail.free;
         end;

     end;
end;

end.
