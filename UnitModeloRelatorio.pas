unit UnitModeloRelatorio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,JclFileUtils;

type
  TModeloRelatorio = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QrSysData1Print(sender: TObject; var Value: String);
  private
    FileInfo: TJclFileVersionInfo;
  public

  end;

var
  ModeloRelatorio: TModeloRelatorio;

implementation

uses UFuncoes, UDMConexao;

{$R *.DFM}

procedure TModeloRelatorio.QRLabel1Print(sender: TObject;
  var Value: String);
begin
   VALUE := Application.Title+ ' ' + versaoexe;
end;


procedure TModeloRelatorio.QrSysData1Print(sender: TObject;
  var Value: String);
begin
 //value := Datetostr(date);
end;

end.
