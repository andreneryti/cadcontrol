unit UnitModeloLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,
  UCDefine;

type
  TModeloLocalizar = class(TForm)
    SkinData1: TSkinData;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    gridLocalizar: TDBGrid;
    Panel1: TPanel;
    btLocalizar: TBitBtn;
    UCControls1: TUCControls;
    procedure BitBtn1Click(Sender: TObject);
    procedure gridLocalizarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModeloLocalizar: TModeloLocalizar;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TModeloLocalizar.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TModeloLocalizar.gridLocalizarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
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

end.
