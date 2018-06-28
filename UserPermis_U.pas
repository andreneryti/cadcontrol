unit UserPermis_U;

interface

uses
{$IFDEF Ver150}
  ActnMan, ActnMenus, Variants,
{$ENDIF}
{$IFDEF Ver140}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, Menus, ImgList, DB,
  ActnList;

type
  PTreeMenu = ^TTreeMenu;
  TTreeMenu = record
    Selecionado : Integer;
    MenuName : String;
end;

type
  PTreeAction = ^TTreeAction;
  TTreeAction = record
    Grupo : Boolean;
    Selecionado : Integer;
    MenuName : String;
end;

type
  PTreeControl = ^TTreeControl;
  TTreeControl = record
    Grupo : Boolean;
    Selecionado : Integer;
    CompName, FormName  : String;
end;

type
  TUserPermis = class(TForm)
    Panel1: TPanel;
    LbDescricao: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    BtLibera: TSpeedButton;
    BtBloqueia: TSpeedButton;
    BtGrava: TSpeedButton;
    lbUser: TLabel;
    ImageList1: TImageList;
    BtCancel: TSpeedButton;
    PC: TPageControl;
    PageMenu: TTabSheet;
    PageAction: TTabSheet;
    TreeMenu: TTreeView;
    TreeAction: TTreeView;
    PageControls: TTabSheet;
    TreeControls: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtGravaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeMenuClick(Sender: TObject);
    procedure BtCancelClick(Sender: TObject);
    procedure BtLiberaClick(Sender: TObject);
    procedure BtBloqueiaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeActionClick(Sender: TObject);
    procedure TreeControlsClick(Sender: TObject);
  private
    FMenu : TMenu;
    FActions : TObject;
    {$IFDEF VER150}
    FActMenuBar : TActionMainMenuBar;
    procedure TrataItem( IT : TActionClientItem; node : TTreeNode);overload;
    {$ENDIF}
    procedure TrataItem(IT: TMenuItem; node: TTreeNode);overload;
    procedure TreeMenuItem(marca: Boolean);
    procedure Atualiza(Selec: Boolean);
    procedure TreeActionItem(marca: Boolean);
    procedure IncPermiss(idUser: Integer; Modulo, ObjName: String);
    procedure UnCheckChild(node: TTreeNode);
    procedure TreeControlItem(marca: Boolean);
    procedure IncPermissEX(idUser: Integer; Modulo, FormName,
      ObjName: String);
//    function PesqPerm(objname: String): Boolean;
  public
    TempIdUser : Integer;
    DSPermiss, DSPermissEX, DSCmd, DSPerfil, DSPerfilEX : TDataset;
    FParam : TParams;
  end;

var
  UserPermis: TUserPermis;

implementation
uses UCDefine;
{$R *.dfm}

procedure TUserPermis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;


procedure TUserPermis.IncPermiss( idUser : Integer; Modulo, ObjName : String);
begin
  IProviderSupport(DSCmd).PSExecuteStatement('INSERT INTO '+ TUCDefine(Owner).TableRights +
                       '( IdUser, Modulo, ObjName) Values ( '+
                       IntToStr(IdUser) + ', '+
                       QuotedStr(Modulo) + ', '+
                       QuotedStr(ObjName)  +')',FParam);
end;

procedure TUserPermis.IncPermissEX( idUser : Integer; Modulo, FormName, ObjName : String);
begin
  IProviderSupport(DSCmd).PSExecuteStatement('INSERT INTO '+ TUCDefine(Owner).TableRights +
                       'EX( IdUser, Modulo, FormName, ObjName) Values ( '+
                       IntToStr(IdUser) + ', '+
                       QuotedStr(Modulo) + ', '+
                       QuotedStr(FormName) + ', '+
                       QuotedStr(ObjName)  +')',FParam);
end;


procedure TUserPermis.BtGravaClick(Sender: TObject);
var
  Contador : Integer;
begin
  {$IFDEF VER130}
  try
  {$ENDIF}
  IProviderSupport(DSCmd).PSExecuteStatement('Delete from '+ TUCDefine(Owner).TableRights + ' Where IdUser = '+ IntToStr(TempIdUser)+ ' and Modulo = '+ QuotedStr(TUCDefine(owner).ApplicationID), FParam);
  IProviderSupport(DSCmd).PSExecuteStatement('Delete from '+ TUCDefine(Owner).TableRights + 'EX Where IdUser = '+ IntToStr(TempIdUser)+ ' and Modulo = '+ QuotedStr(TUCDefine(owner).ApplicationID), FParam);
  {$IFDEF VER130}
  except
      //eaccessviolation in module IDAPI32.DLL no Delphi5 + BDE
  end;
  {$ENDIF}
  For Contador := 0 to TreeMenu.Items.Count -1 do
    if PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado = 1 then
      IncPermiss(TempIdUser, TUCDefine(owner).ApplicationID, PTreeMenu(TreeMenu.Items[Contador].Data).MenuName);

  For Contador := 0 to TreeAction.Items.Count -1 do
    if PTreeAction(TreeAction.Items[Contador].Data).Selecionado = 1 then
      IncPermiss( TempIdUser, TUCDefine(owner).ApplicationID, PTreeAction(TreeAction.Items[Contador].Data).MenuName);

  //Extra Rights
  For Contador := 0 to Pred(TreeControls.Items.Count) do
    if PTreeControl(TreeControls.Items[Contador].Data).Selecionado = 1 then
      IncPermissEX( TempIdUser, TUCDefine(owner).ApplicationID, PTreeControl(TreeControls.Items[Contador].Data).FormName, PTreeControl(TreeControls.Items[Contador].Data).CompName);

  Close;
end;

procedure TUserPermis.TrataItem( IT : TMenuItem; node : TTreeNode);
var
  contador : integer;
  TempNode : TTreeNode;
  TempPointer : PTreeMenu;
begin
  for contador := 0 to IT.Count -1 do
    if IT.Items[Contador].Caption <> '-' then
      if IT.Items[Contador].Count > 0 then
      begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := IT.Items[Contador].Name;
       TempNode := TreeMenu.Items.AddChildObject(node, StringReplace(IT.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
        TrataItem(IT.Items[Contador],TempNode);
      end else begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := IT.Items[Contador].Name;
        TreeMenu.Items.AddChildObject(node,StringReplace(IT.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
      end;
end;

{$IFDEF VER150}
procedure TUserPermis.TrataItem( IT : TActionClientItem; node : TTreeNode);
var
  contador : integer;
  TempNode : TTreeNode;
  TempPointer : PTreeMenu;
begin
  for contador := 0 to IT.Items.Count -1 do
    if IT.Items[Contador].Caption <> '-' then
      if IT.Items[Contador].Items.Count > 0 then
      begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := #1+'G'+IT.Items[Contador].Caption;
       TempNode := TreeMenu.Items.AddChildObject(node, StringReplace(IT.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
        TrataItem(IT.Items[Contador],TempNode);
      end else begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := IT.Items[Contador].Action.Name;
        TreeMenu.Items.AddChildObject(node,StringReplace(IT.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
      end;
end;
{$ENDIF}

procedure TUserPermis.FormCreate(Sender: TObject);
var
  Contador : Integer;
  TempNode : TTreeNode;
  TempPointer : PTreeMenu;
  TempAPointer : PTreeAction;
  TempCPointer : PTreeControl;
  TempLista : TStringList;
  Temp, Temp2, Desc : String;
  FExtraRights : TUCCollection;
begin
  PC.ActivePage := PageMenu;
  FMenu := Application.MainForm.Menu;
  FParam := TParams.Create;
  if (not Assigned(FMenu) ) and (not Assigned(TUCDefine(Owner).Actions.ActionList) )
    {$IFDEF Ver150} and (not Assigned(TUCDefine(Owner).Actions.ActionManager) )
    and (not Assigned(TUCDefine(Owner).Actions.ActionMainMenuBar) ) {$ENDIF} then
  begin
    MessageDlg('Aplica��o n�o possui menu no Form principal e n�o foi atribuido um Actionlist/ActionManager/ActionMainManuBar !', mtError, [mbOK], 0);
    Exit;
  end;
  if (Assigned(Fmenu)) {$IFDEF Ver150} and (not Assigned(TUCDefine(Owner).Actions.ActionMainMenuBar)) {$ENDIF} then
  begin
    TreeMenu.Items.Clear;
    for Contador := 0 to FMenu.Items.Count-1 do
      if FMenu.Items[Contador].Count > 0 then
      begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := FMenu.Items[Contador].Name;
        TempNode := TreeMenu.Items.AddObject(nil, StringReplace(FMenu.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
        TrataItem(FMenu.Items[Contador],TempNode);
      end else begin
          New(TempPointer);
          TempPointer.Selecionado := 0;
         TempPointer.MenuName := FMenu.Items[Contador].Name;
          TreeMenu.Items.AddObject(nil,StringReplace(FMenu.Items[Contador].Caption,'&','',[rfReplaceAll]), TempPointer);
      end;
      TreeMenu.FullExpand;
      TreeMenu.Perform(WM_VSCROLL, SB_TOP, 0);
{$IFDEF VER150}
  end
  else if Assigned(TUCDefine(Owner).Actions.ActionMainMenuBar) then
  begin
    FActMenuBar := TUCDefine(Owner).Actions.ActionMainMenuBar;
    TreeMenu.Items.Clear;
    for Contador := 0 to FActMenuBar.ActionClient.Items.Count-1 do
    begin
      Temp := IntToStr(Contador);
      if FActMenuBar.ActionClient.Items[StrToInt(Temp)].Items.Count > 0 then
      begin
        New(TempPointer);
        TempPointer.Selecionado := 0;
        TempPointer.MenuName := #1+'G'+ FActMenuBar.ActionClient.Items[StrToInt(Temp)].Caption;
        TempNode := TreeMenu.Items.AddObject(nil, StringReplace(FActMenuBar.ActionClient.Items[StrToInt(Temp)].Caption,'&','',[rfReplaceAll]), TempPointer);
        TrataItem(FActMenuBar.ActionClient.Items[StrToInt(Temp)],TempNode);
      end else begin
          New(TempPointer);
          TempPointer.Selecionado := 0;
         TempPointer.MenuName := FActMenuBar.ActionClient.Items[StrToInt(Temp)].Action.Name;
          TreeMenu.Items.AddObject(nil,StringReplace(FActMenuBar.ActionClient.Items[StrToInt(Temp)].Action.Name,'&','',[rfReplaceAll]), TempPointer);
      end;
      TreeMenu.FullExpand;
      TreeMenu.Perform(WM_VSCROLL, SB_TOP, 0);
    end;

{$ENDIF}
  end else PageMenu.TabVisible := False;

  TempNode := nil;
  if (Assigned(TUCDefine(Owner).Actions.ActionList)) {$IFDEF Ver150} or(Assigned(TUCDefine(Owner).Actions.ActionManager)) {$ENDIF} then
  begin
    if Assigned(TUCDefine(Owner).Actions.ActionList) then FActions := TUCDefine(Owner).Actions.ActionList {$IFDEF Ver150} else FActions := TUCDefine(Owner).Actions.ActionManager {$ENDIF};
    TreeAction.Items.Clear;
    TempLista := TStringList.Create;
    for Contador := 0 to TActionList(FActions).ActionCount -1 do
      TempLista.Append(TAction(TActionList(FActions).Actions[contador]).Category + #1+TAction(TActionList(FActions).Actions[contador]).Name+ #2 + TAction(TActionList(FActions).Actions[contador]).Caption );
    TempLista.Sort;
    Temp := #1;
    for Contador := 0 to TempLista.Count -1 do
    begin
      if Temp <> Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1) then
      begin
        New(TempAPointer);
        TempAPointer.Grupo := True;
        TempAPointer.Selecionado := 0;
        TempAPointer.MenuName := 'Grupo';
        TempNode := TreeAction.Items.AddObject(nil, StringReplace(Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1),'&','',[rfReplaceAll]), TempAPointer);
        TempNode.ImageIndex := 2;
        TempNode.SelectedIndex := 2;
        Temp := Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1);
      end;
      Temp2 := TempLista[Contador];
      Delete(Temp2,1,pos(#1,Temp2));
      New(TempAPointer);
      TempAPointer.Grupo := False;
      TempAPointer.Selecionado := 0;
      TempAPointer.MenuName := Copy(Temp2,1,Pos(#2,Temp2)-1);
      Delete(Temp2,1,pos(#2,Temp2));
      TreeAction.Items.AddChildObject(TempNode, StringReplace(Temp2,'&','',[rfReplaceAll]), TempAPointer);
    end;
    TreeAction.FullExpand;
    TreeAction.Perform(WM_VSCROLL, SB_TOP, 0);
  end else PageAction.TabVisible := False;

  //ExtraRights
  TempNode := nil;
  if TUCDefine(Owner).ExtraRight.Count > 0 then
  begin
    FExtraRights := TUCDefine(Owner).ExtraRight;
    TreeControls.Items.Clear;
    TempLista := TStringList.Create;
    for Contador := 0 to Pred(FExtraRights.Count) do
      TempLista.Append(FExtraRights[Contador].GroupName + #1+FExtraRights[Contador].Caption+ #2 + FExtraRights[Contador].FormName +#3+FExtraRights[Contador].CompName);
    TempLista.Sort;
    Temp := #1;
    for Contador := 0 to Pred(TempLista.Count) do
    begin
      if Temp <> Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1) then
      begin
        New(TempCPointer);
        TempCPointer.Grupo := True;
        TempCPointer.Selecionado := 0;
        TempCPointer.FormName := 'Grupo';
        TempCPointer.CompName := 'Grupo';
        TempNode := TreeControls.Items.AddObject(nil, Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1), TempCPointer);
        TempNode.ImageIndex := 2;
        TempNode.SelectedIndex := 2;
        Temp := Copy(TempLista[Contador],1,Pos(#1,TempLista[Contador])-1);
      end;
      Temp2 := TempLista[Contador];
      Delete(Temp2,1,pos(#1,Temp2));
      New(TempCPointer);
      TempCPointer.Grupo := False;
      TempCPointer.Selecionado := 0;
      Desc := Copy(Temp2,1,Pos(#2,Temp2)-1); // descricao do objeto
      Delete(Temp2,1,pos(#2,Temp2));

      TempCPointer.FormName := Copy(Temp2,1,Pos(#3,Temp2)-1);
      Delete(Temp2,1,pos(#3,Temp2));
      TempCPointer.CompName := Temp2;
      TreeControls.Items.AddChildObject(TempNode, Desc, TempCPointer);
    end;
    TreeControls.FullExpand;
    TreeControls.Perform(WM_VSCROLL, SB_TOP, 0);
  end else PageControls.TabVisible := False;


end;

procedure TUserPermis.UnCheckChild(node : TTreeNode);
var
  child : TTreeNode;
begin
  PTreemenu(node.data).Selecionado := 0;
  node.ImageIndex := 0;
  node.SelectedIndex := 0;
  child := node.getFirstChild;
  repeat
    if child.HasChildren then
      UnCheckChild(child)
    else begin
      PTreemenu(child.data).Selecionado := 0;
      child.ImageIndex := 0;
      child.SelectedIndex := 0;
    end;
    child := node.GetNextChild(child);
  until child = nil;
end;

procedure TUserPermis.TreeMenuItem( Marca : Boolean);
var
  AbsIdx : Integer;
begin
 if Marca then
    if PTreemenu(TreeMenu.Selected.data).Selecionado < 2 then
    begin
      if PTreemenu(TreeMenu.Selected.data).Selecionado = 0 then //marcar
      begin
        AbsIdx := TreeMenu.Selected.AbsoluteIndex;
        while AbsIdx > -1 do
        begin
          PTreemenu(TreeMenu.Items.Item[AbsIdx].data).Selecionado := 1;
          TreeMenu.Items.Item[AbsIdx].ImageIndex := 1;
          TreeMenu.Items.Item[AbsIdx].SelectedIndex := 1;
          if TreeMenu.Items.Item[AbsIdx].Parent <> nil then
            AbsIdx := TreeMenu.Items.Item[AbsIdx].Parent.AbsoluteIndex
          else
            AbsIdx := -1;
        end;
      end else begin //desmarcar
        if TreeMenu.Selected.HasChildren then  UnCheckChild(TreeMenu.Selected)
        else begin
          PTreemenu(TreeMenu.Selected.data).Selecionado := 0;
          TreeMenu.Selected.ImageIndex := 0;
          TreeMenu.Selected.SelectedIndex := 0;
        end;

      end;
      TreeMenu.Repaint;
    end;


{ if Marca then
  begin
    if PTreemenu(TreeMenu.Selected.data).Selecionado < 2 then
    begin
      if PTreemenu(TreeMenu.Selected.data).Selecionado = 0 then PTreemenu(TreeMenu.Selected.data).Selecionado := 1
      else PTreemenu(TreeMenu.Selected.data).Selecionado := 0;
    end;
    TreeMenu.Selected.ImageIndex := PTreemenu(TreeMenu.Selected.data).Selecionado;
    TreeMenu.Selected.SelectedIndex := PTreemenu(TreeMenu.Selected.data).Selecionado;

    TreeMenu.Items.Item


  end;
  TreeMenu.Repaint;}
end;

procedure TUserPermis.TreeActionItem( marca : Boolean);
begin
  if not assigned(FActions) then exit;
  if PTreeAction(TreeAction.Selected.data).Grupo then exit;
  if Marca then begin
    if PTreeAction(TreeAction.Selected.data).Selecionado < 2 then
    begin
      if PTreeAction(TreeAction.Selected.data).Selecionado = 0 then PTreeAction(TreeAction.Selected.data).Selecionado := 1
      else PTreeAction(TreeAction.Selected.data).Selecionado := 0;
    end;
    TreeAction.Selected.ImageIndex := PTreeAction(TreeAction.Selected.data).Selecionado;
    TreeAction.Selected.SelectedIndex := PTreeAction(TreeAction.Selected.data).Selecionado;
  end;
  TreeAction.Repaint;
end;

procedure TUserPermis.TreeControlItem( marca : Boolean);
begin
  if PTreeControl(TreeControls.Selected.data).Grupo then exit;
  if Marca then begin
    if PTreeControl(TreeControls.Selected.data).Selecionado < 2 then
    begin
      if PTreeControl(TreeControls.Selected.data).Selecionado = 0 then PTreeControl(TreeControls.Selected.data).Selecionado := 1
      else PTreeControl(TreeControls.Selected.data).Selecionado := 0;
    end;
    TreeControls.Selected.ImageIndex := PTreeControl(TreeControls.Selected.data).Selecionado;
    TreeControls.Selected.SelectedIndex := PTreeAction(TreeControls.Selected.data).Selecionado;
  end;
  TreeControls.Repaint;
end;

procedure TUserPermis.TreeMenuClick(Sender: TObject);
begin
  TreeMenuItem(True);
end;

procedure TUserPermis.BtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TUserPermis.BtLiberaClick(Sender: TObject);
begin
  Atualiza(True);
end;

procedure TUserPermis.Atualiza( Selec : Boolean);
var
  Contador, Temp : Integer;
begin
  if Selec then Temp := 1 else Temp := 0;
  if PC.ActivePage = PageMenu then
  begin
    for Contador := 0 to TreeMenu.Items.Count -1 do
      if PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado < 2 then
      begin
        PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado := Temp;
        TreeMenu.Items[Contador].ImageIndex := Temp;
        TreeMenu.Items[Contador].SelectedIndex := Temp;
      end;
    TreeMenu.Repaint;
  end else if PC.ActivePage = PageAction then
  begin
    for Contador := 0 to TreeAction.Items.Count -1 do
      if not PTreeAction(TreeAction.Items[Contador].Data).Grupo then
        if PTreeAction(TreeAction.Items[Contador].Data).Selecionado < 2 then
        begin
          PTreeAction(TreeAction.Items[Contador].Data).Selecionado := Temp;
          TreeAction.Items[Contador].ImageIndex := Temp;
          TreeAction.Items[Contador].SelectedIndex := Temp;
        end;
    TreeAction.Repaint;
  end else begin // tabContols
    for Contador := 0 to TreeControls.Items.Count -1 do
      if not PTreeControl(TreeControls.Items[Contador].Data).Grupo then
        if PTreeControl(TreeControls.Items[Contador].Data).Selecionado < 2 then
        begin
          PTreeControl(TreeControls.Items[Contador].Data).Selecionado := Temp;
          TreeControls.Items[Contador].ImageIndex := Temp;
          TreeControls.Items[Contador].SelectedIndex := Temp;
        end;
    TreeControls.Repaint;
  end;
end;


procedure TUserPermis.BtBloqueiaClick(Sender: TObject);
begin
  Atualiza(False);
end;

{
Function TUserPermis.PesqPerm(objname : String) : Boolean;
begin
  // funcao desabilitada DBX ->Mysql error
  // DBX -> MSSQL OK | locate apresenta problemas ao buscar novamente o mesmo conteudo.
  CdsCMD.Close;
  CdsCMD.CommandText := 'Select IdUser from ' + TUCDefine(owner).TabelaPermissao +
                        ' Where IDUser = '+ CdsPermiss.FieldByName('IdUser').asString +
                        ' And Modulo = ' + QuotedStr(TUCDefine(owner).ApplicationID) +
                        ' And ObjName = '+ QuotedStr(Objname);
  CdsCMD.Open;
  Result := ( CdsCMD.FieldByName('IDUser').asInteger > 0);
  CdsCMD.Close;
end;}

procedure TUserPermis.FormShow(Sender: TObject);
var
  Contador, Selec : Integer;
begin
 // Exibe Permissoes do Usuario
  For Contador := 0 to TreeAction.Items.Count -1 do
  begin
    DSPermiss.First;
    if DSPermiss.Locate('ObjName',PTreeAction(TreeAction.Items[Contador].Data).MenuName,[]) then Selec := 1 else Selec := 0;

    PTreeAction(TreeAction.Items[Contador].Data).Selecionado := Selec;
    if not PTreeAction(TreeAction.Items[Contador].Data).Grupo then
    begin
      TreeAction.Items[Contador].ImageIndex := Selec;
      TreeAction.Items[Contador].SelectedIndex := Selec;
    end;
  end;


  For Contador := 0 to TreeMenu.Items.Count -1 do
  begin
    DSPermiss.First;
    if DSPermiss.Locate('ObjName',PTreeMenu(TreeMenu.Items[Contador].Data).MenuName,[]) then Selec := 1 else Selec := 0;

    PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado := Selec;
    TreeMenu.Items[Contador].ImageIndex := Selec;
    TreeMenu.Items[Contador].SelectedIndex := Selec;
  end;


  //Extra Rights
  For Contador := 0 to Pred(TreeControls.Items.Count) do
  begin
    DSPermissEX.First;
    if DSPermissEX.Locate('FormName;ObjName',VarArrayOf([PTreeControl(TreeControls.Items[Contador].Data).FormName, PTreeControl(TreeControls.Items[Contador].Data).CompName]),[]) then Selec := 1 else Selec := 0;

    PTreeControl(TreeControls.Items[Contador].Data).Selecionado := Selec;
    if not PTreeControl(TreeControls.Items[Contador].Data).Grupo then
    begin
      TreeControls.Items[Contador].ImageIndex := Selec;
      TreeControls.Items[Contador].SelectedIndex := Selec;
    end;
  end;



  // Exibe Permissoes do Perfil
  if DSPerfil.Active then
  begin
    For Contador := 0 to TreeAction.Items.Count -1 do begin
      DSPerfil.First;
      if DSPerfil.Locate('ObjName',PTreeAction(TreeAction.Items[Contador].Data).MenuName,[]) then
      begin
        Selec := 2;
        PTreeAction(TreeAction.Items[Contador].Data).Selecionado := Selec;
        if not PTreeAction(TreeAction.Items[Contador].Data).Grupo then
        begin
          TreeAction.Items[Contador].ImageIndex := Selec;
          TreeAction.Items[Contador].SelectedIndex := Selec;
        end;
      end;
    end;


    For Contador := 0 to TreeMenu.Items.Count -1 do
    begin
      DSPerfil.First;
      if DSPerfil.Locate('ObjName',PTreeMenu(TreeMenu.Items[Contador].Data).MenuName,[]) then
      begin
        Selec := 2;
        PTreeMenu(TreeMenu.Items[Contador].Data).Selecionado := Selec;
        TreeMenu.Items[Contador].ImageIndex := Selec;
        TreeMenu.Items[Contador].SelectedIndex := Selec;
      end;
    end;

    //Extra Rights

    For Contador := 0 to Pred(TreeControls.Items.Count) do
    begin
      DSPerfilEX.First;
      if DSPerfilEX.Locate('FormName;ObjName',VarArrayOf([PTreeControl(TreeControls.Items[Contador].Data).FormName, PTreeControl(TreeControls.Items[Contador].Data).CompName]),[]) then 
      begin
        Selec := 2;
        PTreeControl(TreeControls.Items[Contador].Data).Selecionado := Selec;
        if not PTreeControl(TreeControls.Items[Contador].Data).Grupo then
        begin
          TreeControls.Items[Contador].ImageIndex := Selec;
          TreeControls.Items[Contador].SelectedIndex := Selec;
        end;
      end;
    end;
  end;
  TreeAction.Repaint;
  TreeMenu.Repaint;
end;

procedure TUserPermis.TreeActionClick(Sender: TObject);
begin
  TreeActionItem(True);
end;

procedure TUserPermis.TreeControlsClick(Sender: TObject);
begin
  TreeControlItem(True);
end;

end.
