unit UOpenOffice;

interface
uses
    Classes, forms, windows,MaskUtils,SysUtils, Variants, ComObj;

    function OpenDocument(const aFileUrl:string): Variant;
    procedure Disconnect;
    function FileName2URL(FileName: string): string;
    function MakePropertyValue(PropName, PropValue:string):variant;
    procedure InsertText(const aText: String; Doc:Variant; Pula:Integer);

implementation
var
    StarOffice: Variant;
     Document: Variant;



function FileName2URL(FileName: string): string;
begin
  result:= '';
  if LowerCase(copy(FileName,1,8))<>'file:///' then
    result:= 'file:///';
  result:= result + StringReplace(FileName, '\', '/', [rfReplaceAll, rfIgnoreCase]);
end;

procedure Disconnect;
begin
   StarOffice := Unassigned;
end;

function MakePropertyValue(PropName, PropValue: string): variant;
var Struct: variant;
begin
    Struct := StarOffice.Bridge_GetStruct('com.sun.star.beans.PropertyValue');
    Struct.Name := PropName;
    Struct.Value := PropValue;
    Result := Struct;
end;

function OpenDocument(const aFileUrl: string): variant;
var
   StarDesktop: Variant;
   VariantArr: variant;
   oReplace: variant;
begin
  StarOffice := Unassigned;
  if VarIsEmpty(StarOffice) then
      StarOffice := CreateOleObject('com.sun.star.ServiceManager');
   Result := not (VarIsEmpty(StarOffice) or VarIsNull(StarOffice));
   StarDesktop := StarOffice.CreateInstance('com.sun.star.frame.Desktop');
   VariantArr := VarArrayCreate([0, 0], varVariant);
   VariantArr[0] := MakePropertyValue('FilterName', 'HTML (StarWriter)');
   Document := StarDesktop.LoadComponentFromURL(
                  aFileUrl, '_blank', 0,
                  VariantArr);
   Result := Document;
end;


procedure InsertText(const aText: String; Doc:Variant; Pula:Integer);
var
   oCursor: Variant;
   oText: Variant;
begin
   oCursor := Doc.CurrentController.getViewCursor;
   oCursor.goRight(pula, false);
   otext := oCursor.getText;
   oText.InsertString(oCursor, aText, false);

end;

end.
