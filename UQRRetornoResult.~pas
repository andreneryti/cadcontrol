unit UQRRetornoResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitModeloRelatorio, QRCtrls, QuickRpt, ExtCtrls, DB, DBClient,
  Provider;

type
  TQRRetornoResult = class(TModeloRelatorio)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    LabEmpresa: TQRLabel;
    labtitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    cdsResultado: TClientDataSet;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField3: TDateField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    cdsResultadoStatusResultado: TStringField;
    DataSetProvider1: TDataSetProvider;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRRetornoResult: TQRRetornoResult;

implementation

uses URetorno, UDMConexao;

{$R *.dfm}

procedure TQRRetornoResult.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
   if Value ='30/12/1899' then Value :='';
end;

end.
