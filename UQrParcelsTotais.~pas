unit UQrParcelsTotais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls, FMTBcd, DB,
  DBClient, Provider, SqlExpr, TeEngine, Series, TeeProcs, Chart, DbChart,
  QRTEE;

type
  TQrParcelamentosTotais = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    labTipo: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    sdsParcsTotais: TSQLDataSet;
    dspParcsTotais: TDataSetProvider;
    cdsParcsTotais: TClientDataSet;
    cdsParcsTotaisTOTAL_PARCS_FIRMADOS: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_ATIVOS: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_DESATIVADOS: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_QUITADOS: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_ABERTO: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_EMDIA: TIntegerField;
    cdsParcsTotaisTOTAL_PARCS_EMATRASO: TIntegerField;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    Series3: TBarSeries;
    Series1: TBarSeries;
    Series2: TBarSeries;
    QRChart2: TQRChart;
    QRDBChart2: TQRDBChart;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    QRChart3: TQRChart;
    QRDBChart3: TQRDBChart;
    BarSeries1: TBarSeries;
    BarSeries4: TBarSeries;
    labtitulo: TQRLabel;
    procedure QRSysData2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrParcelamentosTotais: TQrParcelamentosTotais;

implementation

uses UDMConexao;

{$R *.dfm}

procedure TQrParcelamentosTotais.QRSysData2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value :='';
  PageFooterBand1.Frame.DrawTop :=false;
end;

end.
