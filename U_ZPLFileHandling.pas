///	<summary>
///	  Copyright Fabian Duron (C) 2024 OpenZPL Generator - File handling
///	  used in OpenZPL Generator
///	</summary>
unit U_ZPLFileHandling;

interface

uses U_ZPLObjects, U_ZPLTypes, vcl.Controls;

function SaveToFile(zplDocument : TZPLDocument; FileName: String): Boolean;
function LoadFromFile(zplDocument : TZPLDocument; FileName: String ; var sMSG : String): Boolean;

implementation

uses  xml.XMLDoc, XML.XMLIntf ;

function SaveToFile(zplDocument : TZPLDocument; FileName: String): Boolean;
  function boolToStr(b : Boolean) : String;
  begin
    if b then
      Result := 'True'
    else
      Result := 'False';
  end;
var
  RootNode: IXMLNode;
  i: Integer;
  XMLDocument1 : TXMLDocument ;
  anObject : TZPLObject;
begin
  XMLDocument1 := TXMLDocument.Create(nil);
  XMLDocument1.Active := True;
  XMLDocument1.Options := [doNodeAutoIndent];
  try
    XMLDocument1.Version := '1.0';

    RootNode := XMLDocument1.AddChild('vZPLDocument');
    with RootNode do
    begin
      Attributes['version'] := '1.2';
      Attributes['start'] := zplDocument.StartCommand;
      Attributes['end'] := zplDocument.EndCommand;
      Attributes['DPI'] := zplDocument.DPI;
      Attributes['printer_name'] := zplDocument.PrinterName;
      Attributes['document_name'] := zplDocument.DocumentName;
      Attributes['width'] := zplDocument.Width;
      Attributes['height'] := zplDocument.Height;
      Attributes['page_orientation'] := zplDocument.Orientation;
      Attributes['LeftShift'] := zplDocument.LeftShift;
      Attributes['TopShift'] := zplDocument.TopShift;
    end;

    with RootNode.AddChild('objects'), zplDocument do
      for anObject in ZPLObjects do
      begin
        with AddChild('object') do //Adding an object to the XML list
        begin
          case anObject.ObjectKind of
            okBarCode:
              begin
                Attributes['kind'] := 'B';
                with anObject as TZPLBarcodeObject do
                begin
                  Attributes['text'] := Text;
                  Attributes['variable'] := Variable;
                  Attributes['show_text'] := ShowText;
                  Attributes['type'] := BarcodeType;
                  Attributes['magnification'] := Magnification;
                end;
              end;
            okForm:
              begin
                Attributes['kind'] := 'F';
                with anObject as TZPLFormObject do
                begin
                  Attributes['type'] := ShapeType;
                  Attributes['border'] := BorderThickness;
                end;
              end;
            okLabel:
              begin
                Attributes['kind'] := 'T';
                with anObject as TZPLTextObject do
                begin
                  Attributes['font_code'] := FontCode; //Store just one character
                  Attributes['text'] := Text;
                  Attributes['variable'] := Variable;
                end;
              end;
          end;

          Attributes['left'] := anObject.Left;
          Attributes['top'] := anObject.Top;
          Attributes['width'] := anObject.Width;
          Attributes['height'] := anObject.Height;
          Attributes['scr_dpi'] := anObject.ScreenDPI;
          Attributes['name'] := anObject.Name;
          Attributes['locked'] := boolToStr(anObject.Locked) ;
          Attributes['visible'] := boolToStr(anObject.isVisible) ;
        end; //Adding an object to the XML list

    end;

    XMLDocument1.SaveToFile(FileName);
  finally
    XMLDocument1.Active := False;
  end;
end;

function LoadFromFile(zplDocument : TZPLDocument; FileName: String; var sMSG : String): Boolean;
var
  K : tZPLObjectKind;
  RootNode, ObjectNode, CarPrice: IXMLNode;
  XMLDocument1 : IXMLDocument ; //Use an Interface
  XMLObjects, XMLObject : IXMLNode; //
  anObject : TZPLObject;
  knd : Char;
begin
  Result := False;
  XMLDocument1 := TXMLDocument.Create(nil);
  XMLDocument1.LoadFromFile(FileName); //Load and activate
  try
    //Check header
    RootNode := XMLDocument1.ChildNodes.FindNode('vZPLDocument');
    if Assigned(RootNode) then //There is a vZPLDocument Child Node
    begin
      if RootNode.Attributes['version'] = '1.2' then
      begin
        with RootNode, zplDocument do
        begin
          StartCommand := Attributes['start'];
          EndCommand   := Attributes['end'];
          DPI          := Attributes['DPI'];
          PrinterName  := Attributes['printer_name'];
          DocumentName := Attributes['document_name'];
          Width        := Attributes['width'];
          Height       := Attributes['height'];
          Orientation  := Attributes['page_orientation'];
          LeftShift    := Attributes['LeftShift'];
          TopShift     := Attributes['TopShift'];
        end;

        XMLObjects := RootNode.ChildNodes.FindNode('objects');
        if Assigned(XMLObjects) then
        begin
          XMLObject := XMLObjects.ChildNodes.First;
          while Assigned(XMLObject) do
          with XMLObject do
          begin
            if NodeName = 'object' then
            begin
                //<object kind="T" font_code="0" text="Label" left="5" top="12" width="36" height="16" scr_dpi="96"/>
              knd := string(Attributes['kind'])[1];
              case knd of
                'T' : k := okLabel;
                'B' : k := okBarCode;
                'F' : k := okForm;
              end;

              anObject := zplDocument.AddObject(k, False); //Agregar el objeto leído a la lista
              anObject.Selected := False;

              with anObject do
              begin
                Left      := Attributes['left'];
                top       := Attributes['top'];
                width     := Attributes['width'];
                height    := Attributes['height'];
                ScreenDPI := Attributes['scr_dpi'];
                Name      := Attributes['name'];
                Locked    := Attributes['locked'] = 'True';
                isVisible := Attributes['visible'] = 'True';
              end;

              case anObject.ObjectKind of
                okBarCode:
                  with anObject as TZPLBarcodeObject do
                  begin
                    Text := Attributes['text'];
                    Variable := Attributes['variable'];
                    ShowText := Attributes['show_text'];
                    BarcodeType := Attributes['type'];
                    Magnification := Attributes['magnification'];
                  end;
                okForm:
                  with anObject as tZPLFormObject do
                  begin
                    ShapeType := Attributes['type'];
                    BorderThickness := Attributes['border'];
                  end;
                okLabel:
                  with anObject as TZPLTextObject do
                  begin
                    FontCode := Attributes['font_code'];
                    Text := Attributes['text'];
                    Variable := Attributes['variable'];
                  end;
              end;

            end;

            XMLObject := XMLObject.NextSibling;
          end;

          zplDocument.UnselectObjects;
          zplDocument.RedrawHandles;

          Result := True;
        end
      end
      else
        sMSG := 'The file is not a valid vZPL Label version';
    end
    else
      sMSG := 'The file is not a valid vZPL label';

  finally
    XMLDocument1.Active := False;
  end;

end;


end.
