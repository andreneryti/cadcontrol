unit captura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Camera, StdCtrls, Buttons;

type
  TfrmCaptura = class(TForm)
    Camera1: TCamera;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TBitBtn;
    Button1: TButton;
    BitBtn3: TBitBtn;
    op: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaptura: TfrmCaptura;

implementation

uses Jpeg;

{$R *.dfm}


type
  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;


procedure SmoothResize(Src, Dst: TBitmap);
var
  x, y: Integer;
  xP, yP: Integer;
  xP2, yP2: Integer;
  SrcLine1, SrcLine2: pRGBArray;
  t3: Integer;
  z, z2, iz2: Integer;
  DstLine: pRGBArray;
  DstGap: Integer;
  w1, w2, w3, w4: Integer;
begin
  Src.PixelFormat := pf24Bit;
  Dst.PixelFormat := pf24Bit;

  if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
    Dst.Assign(Src)
  else
  begin
    DstLine := Dst.ScanLine[0];
    DstGap  := Integer(Dst.ScanLine[1]) - Integer(DstLine);

    xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
    yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
    yP  := 0;

    for y := 0 to pred(Dst.Height) do
    begin
      xP := 0;

      SrcLine1 := Src.ScanLine[yP shr 16];

      if (yP shr 16 < pred(Src.Height)) then
        SrcLine2 := Src.ScanLine[succ(yP shr 16)]
      else
        SrcLine2 := Src.ScanLine[yP shr 16];

      z2  := succ(yP and $FFFF);
      iz2 := succ((not yp) and $FFFF);
      for x := 0 to pred(Dst.Width) do
      begin
        t3 := xP shr 16;
        z  := xP and $FFFF;
        w2 := MulDiv(z, iz2, $10000);
        w1 := iz2 - w2;
        w4 := MulDiv(z, z2, $10000);
        w3 := z2 - w4;
        DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 +
          SrcLine1[t3 + 1].rgbtRed * w2 +
          SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
        DstLine[x].rgbtGreen :=
          (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 +

          SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
        DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 +
          SrcLine1[t3 + 1].rgbtBlue * w2 +
          SrcLine2[t3].rgbtBlue * w3 +
          SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
        Inc(xP, xP2);
      end; {for}
      Inc(yP, yP2);
      DstLine := pRGBArray(Integer(DstLine) + DstGap);
    end; {for}
  end; {if}
end; {SmoothResize}

procedure TfrmCaptura.Button1Click(Sender: TObject);
begin
  if Camera1.Actif then
    Camera1.Actif:=False
  else
    Camera1.Actif:=True;

  if Camera1.Actif then
    Button1.Caption := 'Desligar'
  else
    Button1.Caption := 'Ligar';
end;

procedure TfrmCaptura.Button2Click(Sender: TObject);
var
  Bitmap: TBitmap;
  MySOurce, MyDest: TRect;
begin
  MySource  := Rect(50,50,300,400);
  MyDest    := Rect(1,1  ,250,350);
  camera1.CaptureImageDisque;
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile(camera1.FichierImage);
//  Image1.Picture.LoadFromFile(camera1.FichierImage);
  Image1.Canvas.CopyRect(MyDest,Bitmap.Canvas,MySource);
  Bitmap.Free;
end;

procedure TfrmCaptura.FormCreate(Sender: TObject);
begin
  Try
    Camera1.FichierImage := ExtractFileDir(Paramstr(0)) + '\Imagen.bmp';
    if Not Camera1.Actif then
      Camera1.Actif:=True;
  Except
    ModalResult := mrCancel;
    Button2.Enabled := False;
    Raise;
  end;
end;

procedure TfrmCaptura.FormDestroy(Sender: TObject);
begin
  Camera1.Actif:=False;
end;

function ResizeImage(OldBitmap: TBitmap; MaxWidth : Integer) : TBitMap;
Var
  aWidth: Integer;
begin
  Result := TBitmap.Create;
  aWidth := OldBitmap.Width;
  if (OldBitmap.Width > MaxWidth) then
  begin
    aWidth    := MaxWidth;
    Result.Width  := MaxWidth;
    Result.Height := MulDiv(MaxWidth, OldBitmap.Height, OldBitmap.Width);
    SmoothResize(OldBitmap, Result);
  end {if}
  else
    Result.Assign(OldBitMap);
end;

procedure TfrmCaptura.BitBtn3Click(Sender: TObject);
Var
  Picture : TPicture;
  MySOurce, MyDest: TRect;
  Jpg : TJpegImage;
  bmp : TBitMap;
begin
  if op.Execute then
  Begin
    MySource  := Rect(1,1  ,250,350);
    MyDest    := Rect(1,1  ,250,350);
    Picture := TPicture.Create;
    try
      if LowerCase (ExtractFileExt(op.FileName)) = '.jpg' then
      Begin
        Jpg := TJPEGImage.Create;
        jpg.LoadFromFile(op.FileName);
        Picture.Bitmap.Assign(Jpg);
        Jpg.Free;
      end else
        Picture.LoadFromFile(op.FileName);
      Try
        Bmp := ResizeImage(Picture.Bitmap, Image1.Width);
        Image1.Canvas.FillRect(MyDest);
        Image1.Canvas.CopyRect(MyDest,bmp.Canvas,MySource);
      Except
        on E : Exception do
          Exception.Create('Erro ao Carregar foto '+ E.Message);
      end;
    Finally
      bmp.Free;
      Picture.Free;
    end;
  end;
end;

end.
