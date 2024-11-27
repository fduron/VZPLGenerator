unit U_ZPLUndo;

interface

uses System.Generics.Collections, U_ZPLObjects, Vcl.ExtCtrls;

type
  tUndoZPLMethods = (mInsert, mModified, mDelete, mZOrderBack, mZOrderFront);
  tUndoZPLOldNew = (mOld, mNew, mUnique);

  tCommand = Record
    UndoGroup : integer;
    kind : TZPLObjectKind;
    method : tUndoZPLMethods;
    OldNew : tUndoZPLOldNew;
    ObjectName,
    Parameters : String;
  end;
  tArrayOfCommands = array of tCommand;

  TZPLUndoEngine = class
  private
    fZPLDocument: tZPLDocument;
    procedure ExecUndoCommand(aCommand : TCommand; Redo : boolean = False);
    procedure DeleteObject(anObject : TZPLObject);
  protected

  public
    listRedo, listUndo : TList<tCommand>;
    destructor Destroy;
  published
    constructor Create(ZPLDocument : TZPLDocument); overload;
    procedure AddUndoCommand(method: tUndoZPLMethods; zplObjects : tZPLObjects; OldNew : tUndoZPLOldNew{ = mUnique});
    procedure RedoCommand;
    procedure UndoCommand;
    procedure Clear;
  end;

implementation
uses sysutils, system.Classes, vcl.Controls;

function getComponentAsText(Component: TComponent): String;
var
  BinStream:TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(Component);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result := StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end;

procedure SetComponentFromText(text : string; Component: TComponent);
var
  StrStream : TStringStream;
  BinStream : TMemoryStream;
  aLocalComponent : TComponent;
begin
  aLocalComponent := TComponent.Create(Nil);
  try

    StrStream := TStringStream.Create(text);
    try
      BinStream := TMemoryStream.Create;
      try
        ObjectTextToBinary(StrStream, BinStream);
        BinStream.Seek(0, soFromBeginning);
        aLocalComponent := BinStream.ReadComponent(nil);
      finally
        BinStream.Free;
      end;
    finally
      StrStream.Free;
    end;

    TZPLObject(Component).Locked := TZPLObject(aLocalComponent).Locked;
    TZPLObject(Component).isVisible := TZPLObject(aLocalComponent).isVisible;
    TZPLObject(Component).BoundsRect := TZPLObject(aLocalComponent).BoundsRect;

    if Component is TZPLTextObject then
    with aLocalComponent as TZPLTextObject do
    begin
      TZPLTextObject(Component).Text       := Text;
      TZPLTextObject(Component).FontCode   := FontCode;
    end
    else
    if Component is TZPLFormObject then
    with aLocalComponent as TZPLFormObject do
    begin
      TZPLFormObject(Component).BorderThickness  := BorderThickness;
      TZPLFormObject(Component).ShapeType   := ShapeType;
    end
    else
    if Component is TZPLBarcodeObject then
    with aLocalComponent as TZPLBarcodeObject do
    begin
      TZPLBarcodeObject(Component).BarcodeType := BarcodeType;
      TZPLBarcodeObject(Component).Text        := Text;
      TZPLBarcodeObject(Component).ShowText    := ShowText;
    end;

  finally
    aLocalComponent.Free;
  end;
end;

procedure TZPLUndoEngine.DeleteObject(anObject : TZPLObject);
begin
  fZPLDocument.ZPLObjects.Delete( fZPLDocument.ZPLObjects.IndexOf(anObject));
  TComponent(anObject).Free;
end;

procedure TZPLUndoEngine.ExecUndoCommand(aCommand : TCommand; Redo : boolean = False);
var
  z : tZPLObject;
begin
  //in both cases undo and redo, the method mModify is the same
  if aCommand.method = mModified then
  begin
    z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
    SetComponentFromText(aCommand.Parameters, z);
  end
  else
  if Redo then  //REDO COMMAND
  case aCommand.method of
    mInsert: begin
      z := fZPLDocument.AddObject(aCommand.kind);
      SetComponentFromText(aCommand.Parameters, z);
    end;
    mDelete: begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      DeleteObject(z);
      z := Nil;
    end;
    mZOrderFront : begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      z.BringToFront;
      z := nil;
    end;
    mZOrderBack : begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      z.SendToBack;
      z := nil;
    end;
  end
  else //UNDO COMMAND
  case aCommand.method of
    mInsert: begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      DeleteObject(z);
      z := Nil;
    end;
    mDelete: begin
      z := fZPLDocument.AddObject(aCommand.kind);
      SetComponentFromText(aCommand.Parameters, z);
    end;
    mZOrderFront : begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      z.SendToBack;
      z := nil;
    end;
    mZOrderBack : begin
      z := fZPLDocument.FindZPLObject(aCommand.ObjectName);
      z.BringToFront;
      z := nil;
    end;
  end;

  if Assigned(z) then
    z.RefreshBMP;
end;

procedure TZPLUndoEngine.AddUndoCommand(method: tUndoZPLMethods; zplObjects : tZPLObjects; OldNew : tUndoZPLOldNew {= mUnique});
var
  aCommand : tCommand;
begin
  ListRedo.Clear; //Once an undo Command is added, all Redo commands must be deleted

  var UndoGroup := listUndo.Count;
  for var aZPLObject in zplObjects do
  begin
    aCommand.ObjectName := aZPLObject.Name;
    aCommand.method     := method;
    aCommand.UndoGroup  := UndoGroup;
    aCommand.kind       := aZPLObject.ObjectKind;
    aCommand.OldNew     := OldNew;
    aCommand.Parameters := getComponentAsText(aZPLObject);
    listUndo.add(aCommand);
  end;

end;

procedure TZPLUndoEngine.Clear;
begin
  listRedo.Clear;
  listUndo.Clear;
end;

constructor TZPLUndoEngine.Create(ZPLDocument : TZPLDocument);
begin
  fZPLDocument := ZPLDocument;

  listRedo := TList<tCommand>.Create;
  listUndo := TList<tCommand>.Create;
end;

destructor TZPLUndoEngine.Destroy;
begin
  listRedo.Free;
  listUndo.Free;
  inherited;
end;

procedure TZPLUndoEngine.RedoCommand;
  function CanExecCommandFromList(DoExec : Boolean = False) : Boolean;
  var
    lastGroup, CurrentGroup: Integer;
    aCommand : TCommand;
  begin
    lastGroup := listRedo[listRedo.Count - 1].UndoGroup;
    currentGroup := lastGroup;
    Result := listRedo[listRedo.Count - 1 ].OldNew = mUnique;
    //Get Last command method

    while lastGroup = CurrentGroup do //Get all commands of the same group
    begin
      aCommand := listRedo[listRedo.Count - 1 ]; //Get last command of the stack
      listUndo.Add( aCommand ); //Add the command to the redo list
      listRedo.Delete(listRedo.Count - 1);
      if Result or DoExec then //If is an only once command, execute it, otherwise ignore it
        ExecUndoCommand(aCommand, True);

      if listRedo.Count > 0 then
        currentGroup := listRedo[listRedo.Count - 1 ].UndoGroup
      else
        currentGroup := -1; //There are no more commands in the undo list
    end;

    Result := Result or (currentGroup = -1); //Only once command or no more commands in the list
  end;

begin
  {Redo list is as follows:
    NewCommand
    OldCommand
    pseudo: move OldCommand to redo-list
      if is a only once command, execute it and exit of the method
      if is not a only once command, execute OldCommand and move it to redo-list}

  if not CanExecCommandFromList then //Check for first time if it is possible to exec commands
    CanExecCommandFromList(True) //if not possible, execute the next element on the undo list
end;

procedure TZPLUndoEngine.UndoCommand;
  function CanExecCommandFromList(DoExec : Boolean = False) : Boolean;
  var
    lastGroup, CurrentGroup: Integer;
    aCommand : TCommand;
  begin
    lastGroup := listUndo[listUndo.Count - 1].UndoGroup;
    currentGroup := lastGroup;
    Result := listUndo[listUndo.Count - 1 ].OldNew = mUnique;
    //Get Last command method

    while lastGroup = CurrentGroup do //Get all commands of the same group
    begin
      aCommand := listUndo[listUndo.Count - 1 ]; //Get last command of the stack
      listRedo.Add( aCommand ); //Add the command to the redo list
      listUndo.Delete(listUndo.Count - 1);
      if Result or DoExec then //If is an only once command, execute it, otherwise ignore it
        ExecUndoCommand(aCommand);

      if listUndo.Count > 0 then
        currentGroup := listUndo[listUndo.Count - 1 ].UndoGroup
      else
        currentGroup := -1; //There are no more commands in the undo list
    end;

    Result := Result or (currentGroup = -1); //Only once command or no more commands in the list
  end;

begin
  {Undo list is as follows:
    OldCommand
    NewCommand
    pseudo: move NewCommand to redo-list
      if is a only once command, execute it and exit of the method
      if is not a only once command, execute OldCommand and move it to redo-list}

  if not CanExecCommandFromList then //Check for first time if it is possible to exec commands
    CanExecCommandFromList(True) //if not possible, execute the next element on the undo list
end;

initialization
  RegisterClasses([tZPLTextObject, TZPLBarcodeObject, TZPLFormObject]);

finalization
  UnRegisterClasses([tZPLTextObject, TZPLBarcodeObject, TZPLFormObject]);

end.
