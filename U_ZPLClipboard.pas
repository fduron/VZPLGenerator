///	<summary>
///	  Copyright Fabian Duron (C) 2024 OpenZPL Generator - Clipboard management
///	  used in OpenZPL Generator
///	</summary>

unit U_ZPLClipboard;

interface

uses System.Classes, System.Generics.Collections, U_ZPLObjects, vcl.ExtCtrls, U_ZPLUndo;

type
  TZPLClipBoardEngine = class
    private
      fDocument: TZPLDocument;
      fUndoEngine: TZPLUndoEngine;
      ListClipBd : TList<TZPLObject>;
    protected
    public
    published
      constructor create(ZPLDocument: TZPLDocument; zplUndoEngine: TZPLUndoEngine); overload;
      destructor destroy;
      procedure ClearClipBd;
      procedure CopyToClipBoard;
      procedure PasteFromClipboard(ShowObjectRect : Boolean);
      function HasData : Boolean;
  end;

implementation
{ TZPLUndoEngine }

procedure TZPLClipBoardEngine.ClearClipBd;
var
  z: TZPLObject;
begin
  if Assigned(ListClipBd) then
    while ListClipBd.Count > 0 do
    begin
      z := ListClipBd.Items[0];
      z.Free;
      ListClipBd.Delete(0);
    end;
end;

function TZPLClipBoardEngine.HasData: Boolean;
begin
  Result := ListClipBd.Count > 0;
end;

procedure TZPLClipBoardEngine.CopyToClipBoard;
var
  z : TZPLObject;
begin
  ClearClipBd;

  for z in fDocument.ZPLObjects do
  begin
    if z.Selected then
    begin
      case z.ObjectKind of
        okBarCode: ListClipBd.Add(tZPLBarcodeObject.Create(nil));
        okForm: ListClipBd.Add(tZPLFormObject.Create(nil));
        okLabel: ListClipBd.Add(tZPLTextObject.Create(nil));
      end;
      TZPLObject(ListClipBd.Last).Assign(z);
    end;
  end;
end;

constructor TZPLClipBoardEngine.create(ZPLDocument: TZPLDocument; zplUndoEngine: TZPLUndoEngine);
begin
  fDocument := ZPLDocument;
  fUndoEngine := zplUndoEngine;
  ListClipBd := TList<TZPLObject>.Create;
end;

destructor TZPLClipBoardEngine.destroy;
begin
  ListClipBd.Free;
end;

procedure TZPLClipBoardEngine.PasteFromClipboard(ShowObjectRect : Boolean);
var
  z, z1: TZPLObject;
begin
  fDocument.UnselectObjects;
  for z in listClipBd do
  begin
    z1 := fDocument.AddObject(z.ObjectKind);

    z1.Assign(z); //Get object from listClipBd
    z1.ShowRect := ShowObjectRect;

    z1.Left := z1.Left + 10;
    z1.Top := z1.Top + 10;

    z1.Selected := True;
  end;

  fUndoEngine.AddUndoCommand(mInsert, fDocument.SelectedObjects, mUnique);
end;

end.
