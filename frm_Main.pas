///	<summary>
///	  Copyright Fabian Duron (C) 2024 vZPL Generator - GUI
///	  used in OpenZPL Generator
///	</summary>
unit frm_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvComponentBase, JvgReport,
  Vcl.StdCtrls, JvExControls, U_ZPLObjects, Vcl.ActnList, JvPrint, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ImgList, Vcl.Samples.Spin, Vcl.StdActns, Vcl.Menus,
  Vcl.Grids, Vcl.ValEdit, System.ImageList, System.Actions, U_ZPLUndo, U_ZPLClipboard, U_ZPLAlignment;

type
  TfrmMain = class(TForm)
    Edit1: TEdit;
    al1: TActionList;
    accForm: TAction;
    pcMain: TPageControl;
    tsDesign: TTabSheet;
    pnlWorkingArea: TPanel;
    P_HRuler: TPanel;
    pnlUnits: TPanel;
    P_Main: TPanel;
    ScrollBox_: TScrollBox;
    pnlPage: TPanel;
    P_VRuler: TPanel;
    tsZPLScript: TTabSheet;
    accLabel: TAction;
    accBarcode: TAction;
    accInsertRect: TAction;
    EditSelectAll1: TEditSelectAll;
    EditUndoCommand: TEditUndo;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FilePrintSetup1: TFilePrintSetup;
    FilePageSetup1: TFilePageSetup;
    FileExit1: TFileExit;
    mnu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    PageSetup1: TMenuItem;
    PrintSetup1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Edit4: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    N3: TMenuItem;
    Delete1: TMenuItem;
    SelectAll1: TMenuItem;
    N4: TMenuItem;
    Undo1: TMenuItem;
    accBringToFront: TAction;
    accSendToBack: TAction;
    accPrint: TAction;
    stbMain: TStatusBar;
    accCut: TAction;
    accCopy: TAction;
    accPaste: TAction;
    accDelete: TAction;
    EditRedoCommand: TAction;
    Panel1: TPanel;
    mUndo: TMemo;
    mRedo: TMemo;
    Button1: TButton;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton13: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton11: TToolButton;
    ToolButton19: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    ToolButton17: TToolButton;
    algLeft: TAction;
    algRight: TAction;
    algBottom: TAction;
    algTop: TAction;
    algVertical: TAction;
    algHorizontal: TAction;
    algHeight: TAction;
    algWidth: TAction;
    algSameSize: TAction;
    FileNew1: TAction;
    New1: TMenuItem;
    FileSave1: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel3: TPanel;
    cbUseVariables: TCheckBox;
    tbAlignment: TToolBar;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton30: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton28: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton29: TToolButton;
    ToolButton31: TToolButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    vlProperties: TValueListEditor;
    hdrSelected: THeaderControl;
    pop1: TPopupMenu;
    Lock1: TMenuItem;
    Sendtoback1: TMenuItem;
    N7: TMenuItem;
    Copy2: TMenuItem;
    Cut2: TMenuItem;
    Paste2: TMenuItem;
    Delete2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    accLock: TAction;
    accUnlock: TAction;
    Unlock1: TMenuItem;
    Panel4: TPanel;
    cbxShowRect: TCheckBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    il1: TImageList;
    accInsertVLine: TAction;
    accInsertHLine: TAction;
    accInsertEllipse: TAction;
    popForms: TPopupMenu;
    Rectangle1: TMenuItem;
    Horizontalline1: TMenuItem;
    Verticalline1: TMenuItem;
    Ellipse1: TMenuItem;
    reZPLCode: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure accFormExecute(Sender: TObject);
    procedure pnlUnitsClick(Sender: TObject);
    procedure pnlPageClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbtPortraitClick(Sender: TObject);
    procedure ActionInsertZPLObject(Sender: TObject);
    procedure tsZPLScriptShow(Sender: TObject);
    procedure accPrintExecute(Sender: TObject);
    procedure FileOpen1Update(Sender: TObject);
    procedure FilePrintSetup1Accept(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure accBringToFrontExecute(Sender: TObject);
    procedure accSendToBackExecute(Sender: TObject);
    procedure accCopyExecute(Sender: TObject);
    procedure accPasteExecute(Sender: TObject);
    procedure accCutExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vlPropertiesSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure accDeleteExecute(Sender: TObject);
    procedure EditUndoCommandExecute(Sender: TObject);
    procedure EditRedoCommandExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure algExecute(Sender: TObject);
    procedure FileNew1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure accLockExecute(Sender: TObject);
    procedure cbxShowRectClick(Sender: TObject);
  private
    { Private declarations }
    VRuler: T_Ruler;
    HRuler: T_Ruler;

    ZPLDocument : TZPLDocument;
    ZPLUndoEngine : TZPLUndoEngine;
    ZPLClipboard : TZPLClipBoardEngine;
    ZPLAlignment : TZPLObjectsAlignment;
    LoadingValues : Boolean;
    fShowObjectRect: Boolean;
    procedure AppHint(Sender : TObject);
    procedure ViewObjectDimensions(Sender : TObject);
    procedure SetObjectDimensions;
    procedure ViewZPLObjectProperties(Sender : TObject);
    procedure ViweDocProperties;
    procedure SetProperties;
    procedure SetPageOptions;

    procedure DeleteSelected;
    function InsertZPLObject(Kind : TZPLObjectKind) : TZPLObject;
    procedure OnSelectObject(Sender : TObject);
    procedure OnMoveObject(Sender: TObject; L, T: Integer; bFirstMovement : Boolean);
    procedure OnFinishMoveObject(Sender : TObject; bWasMoved : Boolean);
    procedure OnBeginSelectObject(Sender: TObject; Button: TMouseButton; Shift: TShiftState);

    procedure RefreshSelectedObjectsBMP;
    procedure setShowObjectRect(const Value: Boolean);
  public
    { Public declarations }
    CurrentFileModified : Boolean;
    CurrentFileName : String;
    function CanSaveCurrentFile : Boolean;
    property ShowObjectRect : Boolean read fShowObjectRect write setShowObjectRect default false;
  end;

var
  frmMain: TfrmMain;

implementation
uses Printers, vcl.Graphics;
{$R *.dfm}

const
  sRectangle = 'Rectangle';
  sEllipse = 'Ellipse';
  sHorLine = 'Horizontal line';
  sVertLine = 'Vertical line';

  ccAztec = 'Aztec';
  cc11 = 'Code 11';
  cc39 = 'Code 39';
  ccQR = 'Code QR';
  ccDM = 'Code Datamatrix';

  clUH = 'Ultra-High';
  clHR = 'High reliability';
  clST = 'Standard';
  clHD = 'High density';

procedure SetStyle(RE : TRichEdit; const Identifier : String; aColor : TColor; FS : TFontStyles);
var
  StartPos, FindLength: Integer;
  Options: TSearchTypes;
begin
  StartPos := 0;

  // Opciones de búsqueda (puedes combinar varias opciones)
  Options := [];//[stMatchCase, stWholeWord];

  // Realiza la búsqueda
  StartPos := RE.FindText(Identifier, StartPos, Length(RE.Text), Options);

  // Si se encuentra el texto, seleccionarlo
  while StartPos <> -1 do
  begin
    RE.SelStart := StartPos;
    RE.SelLength := Length(Identifier);
    RE.SelAttributes.Color := aColor; // Puedes usar cualquier color disponible en Delphi
    RE.SelAttributes.Style := FS;
    StartPos := RE.FindText(Identifier, StartPos + 1, Length(RE.Text), Options);
  end;
end;

procedure SetTextStyle(RE : TRichEdit; const StartId, EndId : String; aColor : TColor; FS : TFontStyles);
var
  StartPos, FindLength, P: Integer;
  Options: TSearchTypes;
begin
  StartPos := 0;

  // Opciones de búsqueda (puedes combinar varias opciones)
  Options := [];//[stMatchCase, stWholeWord];

  // Realiza la búsqueda
  StartPos := RE.FindText(StartID, StartPos, Length(RE.Text), Options);

  // Si se encuentra el texto, seleccionarlo
  while StartPos <> -1 do
  begin
    RE.SelStart := StartPos + Length(StartId);
    P := RE.FindText(EndID, RE.SelStart, Length(RE.Text), Options);
    if P <> -1 then
    begin
      RE.SelLength := P - RE.SelStart;
      RE.SelAttributes.Color := aColor; // Puedes usar cualquier color disponible en Delphi
      RE.SelAttributes.Style := FS;
    end;
    StartPos := RE.FindText(StartID, StartPos + 1, Length(RE.Text), Options);
  end;
end;

procedure Highlighting(RE : TRichEdit);
begin
  RE.SelStart := 0;
  RE.SelLength := Length(RE.Text);
  RE.SelAttributes.Color := clBlack; // Puedes usar cualquier color disponible en Delphi
  RE.SelAttributes.Style := [];

  SetStyle(RE, '${', clRed, []);
  SetStyle(RE, '}$', clRed, []);

  SetStyle(RE, '^XA', clBlack, [fsBold]);
  SetStyle(RE, '^XZ', clBlack, [fsBold]);

  SetStyle(RE, '^FO', clNavy, [fsBold]);

  SetStyle(RE, '^FD', clPurple, [fsBold]);
  SetStyle(RE, '^FS', clPurple, [fsBold]);

  SetStyle(RE, '^GB', clGreen, [fsBold, fsUnderline]);
  SetStyle(RE, '^BQ', clGreen, [fsBold, fsUnderline]);
  SetStyle(RE, '^A', clTeal, [fsBold, fsUnderline]);

  SetTextStyle(RE, '^FD', '^FS', clBlue, []);

  RE.SelStart := 1;
  RE.SelLength := 0;
end;

function TfrmMain.InsertZPLObject(Kind: TZPLObjectKind) : TZPLObject;
begin
  Result := ZPLDocument.AddObject(kind);

  ViewZPLObjectProperties(Result);
  ZPLUndoEngine.AddUndoCommand(mInsert, [Result], mUnique);
end;

procedure TfrmMain.ActionInsertZPLObject(Sender: TObject);

  procedure UpdateFormShape(z: TZPLObject);
  begin
    if (sender = accInsertRect) then
      TZPLFormObject(Z).ShapeType := shRectangle
    else
    if (sender = accInsertVLine) then
      TZPLFormObject(Z).ShapeType := shVertLine
    else
    if (sender = accInsertHLine) then
      TZPLFormObject(Z).ShapeType := shHorLine
    else
    if (sender = accInsertEllipse) then
      TZPLFormObject(Z).ShapeType := shEllipse;

    TZPLFormObject(Z).RefreshBMP;
  end;

var
  k : TZPLObjectKind;
  Z : TZPLObject;
begin
  pnlPage.SetFocus;
  ZPLDocument.UnselectObjects;

  if sender = accBarCode then
    k := okBarCode
  else
  if TAction(Sender).tag = 10 then
    k := okForm
  else
  if sender = accLabel then
    k := okLabel;

  z := InsertZPLObject(k);

  if TAction(Sender).tag = 10 then
    UpdateFormShape(z);

  z.ShowRect := ShowObjectRect;

  CurrentFileModified := True;
end;

procedure TfrmMain.algExecute(Sender: TObject);
begin
  ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mOld);
  with ZPLAlignment do
    if Sender = algLeft then
      AlignLeft
    else
    if Sender = algRight then
      AlignRight
    else
    if Sender = algBottom then
      AlignBottom
    else
    if Sender = algTop then
      AlignTop
    else
    if Sender = algVertical then
      AlignVerticalCenters
    else
    if Sender = algHorizontal then
      AlignHorizontalCenters
    else
    if sender =algHeight then
      SameHeight
    else
    if Sender = algWidth then
      SameWidth
    else
    if Sender = algSameSize then
    begin
      SameHeight;
      SameWidth;
    end;

  ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mNew);

  ZPLDocument.RedrawHandles;
  RefreshSelectedObjectsBMP;
end;

procedure TfrmMain.accBringToFrontExecute(Sender: TObject);
var
  z: TZPLObject;
begin
  ZPLUndoEngine.AddUndoCommand(mZOrderFront, ZPLDocument.SelectedObjects, mUnique);
  for z in ZPLDocument.SelectedObjects do
    TZPLObject(z).BringToFront;
end;

procedure TfrmMain.accCopyExecute(Sender: TObject);
begin
  ZPLClipboard.CopyToClipBoard
end;

procedure TfrmMain.accCutExecute(Sender: TObject);
begin
  ZPLClipboard.CopyToClipBoard;
  DeleteSelected;
end;

procedure TfrmMain.accDeleteExecute(Sender: TObject);
begin
  DeleteSelected
end;

procedure TfrmMain.accPasteExecute(Sender: TObject);
begin
  if not pnlPage.Focused then
    pnlPage.SetFocus;

  ZPLClipboard.PasteFromClipboard(ShowObjectRect);
  RefreshSelectedObjectsBMP;
end;

procedure TfrmMain.accFormExecute(Sender: TObject);
begin
  {}
end;

procedure TfrmMain.accLockExecute(Sender: TObject);
begin
  for var A in ZPLDocument.SelectedObjects do
    TZPLObject(A).Locked := Sender = accLock;
end;

procedure TfrmMain.accPrintExecute(Sender: TObject);
var
  s : String;
  x : DWORD;
begin
  if ZPLDocument.PrinterName = '' then
  begin
    FilePrintSetup1.Execute;
  end;

  s := ZPLDocument.Print;
  if s <> '' then
    ShowMessage(s);
end;

procedure TfrmMain.accSendToBackExecute(Sender: TObject);
var
  z: TZPLObject;
begin
  ZPLUndoEngine.AddUndoCommand(mZOrderBack, ZPLDocument.SelectedObjects, mUnique);
  for z in ZPLDocument.SelectedObjects do
    TZPLObject(z).SendToBack;
end;

procedure TfrmMain.AppHint(Sender: TObject);
begin
  stbMain.Panels[1].Text := Application.Hint;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
  function a(m : tUndoZPLMethods) : String;
  begin
    case m of
      mInsert: Result := 'Ins - ';
      mModified: Result := 'Upd - ';
      mDelete: Result := 'Del - ';
      mZOrderBack : Result := 'bak - ';
      mZOrderFront : Result := 'front - ';
    end;
  end;
var
  I: Integer;
begin
  mUndo.Clear;
  mRedo.Clear;

  for var aCommand in ZPLUndoEngine.listUndo do
    mUndo.Lines.Add(a(aCommand.method) +  aCommand.Parameters.Replace(#13#10, ';' ) );

  for var aCommand in ZPLUndoEngine.listReDo do
    mRedo.Lines.Add(a(aCommand.method) + aCommand.Parameters.Replace(#13#10, ';' ) );

end;

function TfrmMain.CanSaveCurrentFile: Boolean;
var
  FN : String;
  I : Integer;
begin
  Result := not CurrentFileModified;
  if CurrentFileModified then
  begin
    I := MessageBox(Handle, PChar(Format('Save label %s?', [ExtractFileName(CurrentFileName)])),
      'Confirm', MB_ICONQUESTION + MB_YESNOCANCEL);
    Result := I <> ID_CANCEL;
    if I = ID_YES then
    begin
      if CurrentFileName.IsEmpty  then
      begin
        if FileSaveAs1.Execute then
          FN := FileSaveAs1.Dialog.FileName;
      end
      else
         FN := CurrentFileName;
      ZPLDocument.SaveToFile(FN);

      CurrentFileModified := False;
    end;
  end;

end;

procedure TfrmMain.cbxShowRectClick(Sender: TObject);
begin
  ShowObjectRect := cbxShowRect.Checked;
end;

procedure TfrmMain.DeleteSelected;
var
  i : Integer;
begin
  ZPLUndoEngine.AddUndoCommand(mDelete, ZPLDocument.SelectedObjects, mUnique);
  I := 0;
  while I <= ZPLDocument.ZPLObjects.Count -1 do
  begin
    if TZPLObject(ZPLDocument.ZPLObjects[I]).Selected then
    begin
      TWincontrol(ZPLDocument.ZPLObjects[I]).Free;
      ZPLDocument.ZPLObjects.Delete(I);
      dec(I);
    end;
    inc(I);
  end;
end;

procedure TfrmMain.EditRedoCommandExecute(Sender: TObject);
begin
  ZPLDocument.UnselectObjects;
  ZPLUndoEngine.RedoCommand;
  pnlPageClick(pnlPage); //Select main panel
  //DEBUG:
  //Button1.Click;
end;

procedure TfrmMain.EditUndoCommandExecute(Sender: TObject);
begin
  ZPLDocument.UnselectObjects;
  ZPLUndoEngine.UndoCommand;
  pnlPageClick(pnlPage); //Select main panel
  //DEBUG:
  //Button1.Click;
end;

procedure TfrmMain.FileNew1Execute(Sender: TObject);
begin
  if CanSaveCurrentFile then
  begin
    ZPLDocument.CleanDocument;
    ZPLUndoEngine.Clear;
    CurrentFileModified := False;
    CurrentFileName := '';
  end;
end;

procedure TfrmMain.FileOpen1Accept(Sender: TObject);
var
  I: Integer;
  Z : TZPLObject;
begin
  try
    if CanSaveCurrentFile then
    try
      ZPLUndoEngine.Clear;
      ZPLDocument.CleanDocument;

      Application.ProcessMessages; //It is neccesary to process messages here in order to process all mouse
                                   //messages before start creating new objects
      ZPLDocument.LoadFromFile(FileOpen1.Dialog.FileName);
      for z in ZPLDocument.ZPLObjects do
      begin
        z.ShowRect := ShowObjectRect;
        z.ScreenDPI := InchesToPixels(Canvas.Handle, 1, False);
        z.RefreshBMP;
        z.Repaint;
      end;

      Application.ProcessMessages;
      pnlPageClick(pnlPage); //Show page properties
      ZPLDocument.HideHandles;
      CurrentFileName := FileOpen1.Dialog.FileName;
    except
      Raise;
    end;
  finally
    //
  end;
end;

procedure TfrmMain.FileOpen1Update(Sender: TObject);
var
 OnDesign, ObjectIsSelected : Boolean;

begin
  OnDesign := pcMain.ActivePageIndex = 0;

  VRuler.Top := pnlPage.Top;
  HRuler.Left := pnlPage.Left + P_VRuler.Width;
  case VRuler.UseUnit of
    ru_Centimeters: pnlUnits.Caption := 'C';
    ru_Inches: pnlUnits.Caption := 'I';
    ru_Pixels: pnlUnits.Caption := 'P';
  end;
  FileSave1.Enabled := not CurrentFileName.IsEmpty and CurrentFileModified;
  ObjectIsSelected := ZPLDocument.SelCount > 0;
  accDelete.Enabled := ObjectIsSelected and pnlPage.Focused;
  accCut.Enabled := ObjectIsSelected and pnlPage.Focused;
  accCopy.Enabled := ObjectIsSelected and pnlPage.Focused;
  accPaste.Enabled := ZPLClipboard.HasData and pnlPage.Focused;
  EditSelectAll1.Enabled := False;
  EditUndoCommand.Enabled := ZPLUndoEngine.listUndo.count > 0;
  EditRedoCommand.Enabled := ZPLUndoEngine.listRedo.Count > 0;
  accBringToFront.Enabled := ObjectIsSelected and OnDesign;
  accSendToBack.Enabled := ObjectIsSelected and OnDesign;

  if CurrentFileModified then
    stbMain.Panels[0].Text := 'M'
  else
    stbMain.Panels[0].Text := '';

  if CurrentFileName = '' then
    Caption := Application.Title
  else
    Caption := Application.Title + ' (' + ExtractFileName(CurrentFileName) + ')';

  ObjectIsSelected := ZPLDocument.SelCount > 1;
  algLeft.enabled := ObjectIsSelected;
  algRight.enabled := ObjectIsSelected;
  algBottom.enabled := ObjectIsSelected;
  algTop.enabled := ObjectIsSelected;
  algVertical.enabled := ObjectIsSelected;
  algHorizontal.enabled := ObjectIsSelected;
  algHeight.enabled := ObjectIsSelected;
  algWidth.enabled := ObjectIsSelected;
  algSameSize.enabled := ObjectIsSelected;

end;

procedure TfrmMain.FilePrintSetup1Accept(Sender: TObject);
begin
  ZPLDocument.PrinterName := Printer.Printers[printer.PrinterIndex];
  SetPageoptions;
  case Printer.Orientation of
    poLandscape : ZPLDocument.Orientation := loLandscape;
    poPortrait : ZPLDocument.Orientation := loPortrait;
  end;

end;

procedure TfrmMain.FileSave1Execute(Sender: TObject);
begin
  if CurrentFileName.IsEmpty then
    FileSaveAs1.Execute
  else
  begin
    ZPLDocument.SaveToFile(CurrentFileName);
    CurrentFileModified := False;
  end;
end;

procedure TfrmMain.FileSaveAs1Accept(Sender: TObject);
begin
  ZPLDocument.SaveToFile(FileSaveAs1.Dialog.FileName);
  CurrentFileName := FileSaveAs1.Dialog.FileName;
  CurrentFileModified := False;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CurrentFileModified then
     CanClose := CanSaveCurrentFile;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  fShowObjectRect := False;
  pcMain.ActivePage := tsDesign;
  CurrentFileModified := False;
  stbMain.Panels[0].Text := '';
  stbMain.Panels[1].Text := '';
  CurrentFileName := '';

  Application.OnHint := AppHint;
  LoadingValues := False;

  ZPLDocument := TZPLDocument.Create(pnlPage);
  ZPLDocument.StartCommand := '${' + ZPLDocument.StartCommand;
  ZPLDocument.EndCommand := ZPLDocument.EndCommand + '}$';
  ZPLDocument.GlobalOnSelect := OnSelectObject;
  ZPLDocument.GlobalOnMove := OnMoveObject;
  ZPLDocument.GlobalOnFinishMove := OnFinishMoveObject;
  ZPLDocument.GlobalOnBeginSelect := OnBeginSelectObject;

  ZPLUndoEngine := TZPLUndoEngine.Create(ZPLDocument);
  ZPLClipboard  := TZPLClipBoardEngine.Create(ZPLDocument, ZPLUndoEngine);
  ZPLAlignment := TZPLObjectsAlignment.Create(ZPLDocument);
  SetPageOptions;

  VRuler := T_Ruler.Create(Self);
  HRuler := T_Ruler.Create(Self);
  with HRuler do
  begin
   Parent := P_HRuler;
   Orientation := ro_Horizontal;
   Left := 17;
    //Top := Panel1.Top;
    Width := 800;
    Height := 16;
  end;

  with VRuler do
  begin
   Parent := P_VRuler;
    //Left := Panel1.Left;
    Top := 0;
    Width := 15;
    Height := 800;
    Orientation := ro_Vertical;
  end;

end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  ZPLUndoEngine.Free;
  ZPLClipboard.Free;
  ZPLAlignment.Free;
  ZPLDocument.Free;
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
  z : TZPLObject;
begin
  if (ZPLDocument.SelCount = 0) or (not pnlPage.Focused) then
    Exit;

  if (ssCtrl in Shift) then
  begin
    CurrentFileModified := True;
    //ZPLDocument.HideHandles;
    for z in ZPLDocument.SelectedObjects  do
    with z do
      case Key of
        VK_LEFT  : Left := Left - 1;
        VK_RIGHT : Left := Left + 1;
        VK_DOWN  : Top := Top + 1;
        VK_UP    : Top := Top - 1;
      end;
  end
  else
  if (ssShift in Shift) then
  begin
    CurrentFileModified := True;
    //ZPLDocument.HideHandles;
    for z in ZPLDocument.SelectedObjects  do
    with z do
      case Key of
        VK_LEFT  : Width := Width - 1;
        VK_RIGHT : Width := Width + 1;
        VK_DOWN  : Height := Height + 1;
        VK_UP    : Height := Height - 1;
      end;
  end
  else
    Exit;

  if Key = VK_ESCAPE then
    pnlPageClick(pnlPage)
  else
  begin
    ZPLDocument.RedrawHandles;
    ViewZPLObjectProperties(z);
  end;
end;

procedure TfrmMain.OnBeginSelectObject(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState);
begin
  pnlPage.SetFocus;
  if (not TZPLObject(Sender).Selected) and (not(ssShift in Shift)) then
    ZPLDocument.UnselectObjects;
end;

procedure TfrmMain.OnFinishMoveObject(Sender: TObject; bWasMoved : Boolean);
begin
  pnlPage.SetFocus;
  ZPLDocument.ShowHandles;
  ViewZPLObjectProperties(Sender);

  ClipCursor(Nil);

  if bWasMoved then
  begin
    ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mNew);
    CurrentFileModified := True;
  end;
end;

procedure TfrmMain.OnMoveObject(Sender: TObject; L, T: Integer; bFirstMovement : Boolean);
var
  Rect : TRect;
begin
  Rect := pnlPage.ClientToScreen( pnlPage.ClientRect );
  ClipCursor(@Rect);

  if bFirstMovement then //Add to Undo list the original posicion of objects
  begin
    ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mOld);
    Application.ProcessMessages;
    //DEBUG
    //Button1.Click;
  end;

  if (L <> -10000) and (T <> -10000) then //when L and T = -10000 is a handles move, do not hide them
    ZPLDocument.HideHandles;

  ZPLDocument.MoveSelectedObjects(Sender, L, T);
end;

procedure TfrmMain.OnSelectObject(Sender: TObject);
begin
  ZPLDocument.RedrawHandles;
end;

procedure TfrmMain.pnlPageClick(Sender: TObject);
begin
  LoadingValues := True;
  pnlPage.SetFocus;
  ZPLDocument.UnselectObjects;
  ViweDocProperties;
end;

procedure TfrmMain.pnlUnitsClick(Sender: TObject);
begin
  case VRuler.UseUnit of
    ru_Centimeters: begin
        VRuler.UseUnit := ru_Inches;
        HRuler.UseUnit := ru_Inches;
    end;
    ru_Inches: begin
        VRuler.UseUnit := ru_Pixels;
        HRuler.UseUnit := ru_Pixels;
    end;
    ru_Pixels: begin
        VRuler.UseUnit := ru_Centimeters;
        HRuler.UseUnit := ru_Centimeters;
    end;
  end;
end;

procedure TfrmMain.rbtPortraitClick(Sender: TObject);
{var
  i : Integer;}
begin
{  i := pnlLabel.Width;
  pnlLabel.Width := pnlLabel.Height;
  pnlLabel.Height := i;

  if Sender = rbtPortrait then
    ZPLDocument.Orientation := loPortrait
  else
    ZPLDocument.Orientation := loLandscape;}
end;

procedure TfrmMain.RefreshSelectedObjectsBMP;
var
  z : TZPLObject;
begin
  for z in ZPLDocument.SelectedObjects do
  begin
    z.RefreshBMP;
    z.Repaint;
  end;
end;

procedure TfrmMain.SetObjectDimensions;
var
  z : TZPLObject;
  sL, sT, sW, sH : String;
begin
  //If there are multiple objects, Values can be empty that's why I use individual string variables
  sL := trim(vlProperties.Values['Left']);
  sT := trim(vlProperties.Values['Top']);
  sW := trim(vlProperties.Values['Width']);
  sH := trim(vlProperties.Values['Height']);

  for z in ZPLDocument.SelectedObjects do
    with z do
    begin
      if not sL.IsEmpty then Left := sL.ToInteger;
      if not sT.IsEmpty then Top := sT.ToInteger;
      if not sW.IsEmpty then Width := sW.ToInteger;
      if not sH.IsEmpty then Height := sH.ToInteger;
    end;
end;

procedure TfrmMain.SetPageOptions;
var
  ScreenDPI ,
  PrinterDPI : Integer;
begin
  ScreenDPI := InchesToPixels(Canvas.Handle, 1, False);
  PrinterDPI := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  pnlPage.Width := Round((Printer.PageWidth/printerDPI) * ScreenDPI) ;

  ScreenDPI := InchesToPixels(Canvas.Handle, 1, True);
  PrinterDPI := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
  pnlPage.Height := Round((Printer.PageHeight/printerDPI) * ScreenDPI);

  ZPLDocument.Width := pnlPage.Width;
  ZPLDocument.Height := pnlPage.Height;
end;

procedure TfrmMain.SetProperties;
var
  OneObject, z : TZPLObject;
  s : String;
  I : Integer;
begin
  ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mOld);

  if ZPLDocument.SelCount = 0 then
  with ZPLDocument do
  begin //Set Document properties
{    Width := strToInt(vlProperties.Values['Width']);
    Height := strToInt(vlProperties.Values['Height']);}
    LeftShift := strToInt('0' + trim(vlProperties.Values['LeftShift']));
    TopShift := strToInt('0' + trim(vlProperties.Values['TopShift']));

    DocumentName := vlProperties.Values['DocumentName'];
    PrinterName := vlProperties.Values['PrinterName'];
    StartCommand := vlProperties.Values['StartCommand'];
    EndCommand := vlProperties.Values['EndCommand'];
    exit;
  end;

  try
    SetObjectDimensions;

    if ZPLDocument.SelCount > 1 then
      Exit;

    for z in ZPLDocument.SelectedObjects do
    begin
      z.isVisible := vlProperties.Values['Visible'] = BoolToStr(True, True);

      case z.ObjectKind of
        okBarCode:
          with z as TZPLBarcodeObject do
          begin
            Text := vlProperties.Values['Text'];
            Variable := vlProperties.Values['Variable'];
            ShowText := vlProperties.Values['ShowText'] = 'Yes';
            Magnification := vlProperties.Values['Magnification'].ToInteger;
            s := vlProperties.Values['BarcodeType'];
            if s = ccAztec then
              BarcodeType := bcAztec
            else
            if s = cc11 then
              BarcodeType := bcCode11
            else
            if s = cc39 then
              BarcodeType := bcCode39
            else
            if s = ccQR then
              BarcodeType := bcCodeQR
            else
            if s = ccDM then
              BarcodeType := bcCodeDM;

            s := vlProperties.Values['CorrectionLevel'];
            if s = clUH then
              CorrectionLevel := CLUltraHigh
            else
            if s = clHR then
              CorrectionLevel := CLHighRel
            else
            if s = clST then
              CorrectionLevel := CLStandard
            else
            if s = clHD then
              CorrectionLevel := CLHighDensity;
          end;
        okForm:
          with z as TZPLFormObject do
          begin
            BorderThickness := strToInt('0' + trim(vlProperties.Values['Border']));
            {s := vlProperties.Values['ShapeType'];
            if s = sRectangle then
              ShapeType := shRectangle
            else
            if s = sEllipse then
              ShapeType := shEllipse
            else
            if s = sHorLine  then
              ShapeType := shHorLine
            else
            if s = sVertLine then
              ShapeType := shVertLine;}
          end;
        okLabel:
          with z as TZPLTextObject do
          begin
            Text := vlProperties.Values['Text'];
            Variable := vlProperties.Values['Variable'];
            if vlProperties.Values['Font'] = 'Regular' then
              FontCode := 'A'
            else
              FontCode := '0';
          end;
      end;

      (z as TZPLObject).RefreshBMP;
    end;
  finally
    ZPLDocument.RedrawHandles;
  end;

  ZPLUndoEngine.AddUndoCommand(mModified, ZPLDocument.SelectedObjects, mNew);

end;

procedure TfrmMain.setShowObjectRect(const Value: Boolean);
var
  Z : TZPLObject;
begin
  fShowObjectRect := Value;
  for Z in ZPLDocument.ZPLObjects do
    Z.ShowRect := Value;
end;


procedure TfrmMain.tsZPLScriptShow(Sender: TObject);
begin
  if cbUseVariables.Checked then
    ZPLDocument.UseVariableOrText := use_variable
  else
    ZPLDocument.UseVariableOrText := use_Text;

  reZPLCode.Lines.Text := ZPLDocument.ZPLScript;
  Highlighting(reZPLCode);
end;

procedure TfrmMain.ViewObjectDimensions(Sender : TObject);
begin
  with vlProperties do
  begin
    if ZPLDocument.SelCount > 1 then
    begin
      hdrSelected.Sections[0].Text := Format('%d objects selected', [ZPLDocument.SelCount]);
      Values['Left'] := '';
      Values['Top'] := '';
      Values['Width'] := '';
      Values['Height'] := '';
      Values['Visible'] := '';
    end
    else
    with TZPLObject(Sender) do
    begin
      Values['Left'] := IntToStr(Left);
      Values['Top'] := IntToStr(Top);
      Values['Width'] := IntToStr(Width);
      Values['Height'] := IntToStr(Height);
      Values['Visible'] := BoolToStr(isVisible, True);
    end;
    ItemProps['Left'].EditMask := '!99999;0; ';
    ItemProps['Top'].EditMask := '!99999;0; ';
    ItemProps['Width'].EditMask := '!99999;0; ';
    ItemProps['Height'].EditMask := '!99999;0; ';

    with ItemProps['Visible'] do
    begin
      EditStyle := esPickList;
      PickList.Add(BoolToStr(True, True) );
      PickList.Add(BoolToStr(False, True));
      ReadOnly := True;
    end;

  end;
end;

procedure TfrmMain.ViewZPLObjectProperties(Sender : TObject);
  function IsSmooth(sFontCode : String) : String;
  begin
    if sFontCode = '0' then
      Result := 'Smooth'
    else
      Result := 'Regular';
  end;

  function bcCoLevel(value: tZPLQRCodeCorrectionLevel): String;
  begin
    case Value of
      CLUltraHigh: result := clUH;
      CLHighRel: result := clHR;
      CLStandard: result := clST;
      CLHighDensity: result := clHD;
    end;
  end;

  function bcType(value : TBarcodeType) : String;
  begin
    case value of
      bcAztec: Result := ccAztec;
      bcCode11: Result := cc11;
      bcCode39: Result := cc39;
      bcCodeQR: Result := ccQR;
      bcCodeDM : Result := ccDM;
    end;
  end;

  function bcShowText(value : Boolean) : String;
  begin
    if value then
      Result := 'Yes'
    else
      Result := 'No';
  end;

  function getShapeType(st : TShapeType) : String;
  begin
    case st of
      shRectangle: Exit(sRectangle);
      shEllipse: Exit(sEllipse);
      shHorLine: Exit(sHorLine);
      shVertLine: Exit(sVertLine);
    end;
  end;

  procedure ShowTxtObjectProperies;
  begin
    with Sender as tZPLTextObject do
    begin
      hdrSelected.Sections[0].Text := Format('Text (%s)', [Text]);
      with vlProperties do
      begin
        Values['Text'] := Text;
        Values['Variable'] := Variable;
        Values['Font'] := IsSmooth(FontCode);
        with ItemProps['Font'] do
        begin
          EditStyle := esPickList;
          PickList.Add('Smooth');
          PickList.Add('Regular');
          ReadOnly := True;
        end;
      end;
    end
  end;

  procedure ShowBarCodeObjectProperties;
  begin
    with Sender as tZPLBarcodeObject do
    begin
      hdrSelected.Sections[0].Text := Format('BarCode (%s)', [Text]);
      with vlProperties do
      begin
        Values['Text'] := Text;
        Values['Variable'] := Variable;
        Values['BarcodeType'] := bcType(BarcodeType);
        Values['CorrectionLevel'] := bcCoLevel(CorrectionLevel);
        Values['ShowText'] := bcShowText(ShowText);
        Values['Magnification'] := intToStr(Magnification);

        with ItemProps['BarcodeType'] do
        begin
          EditStyle := esPickList;
          PickList.Add(ccAztec);
          PickList.Add(cc11);
          PickList.Add(cc39);
          PickList.Add(ccQR);
          PickList.Add(ccDM);
          ReadOnly := True;
        end;

        with ItemProps['CorrectionLevel'] do
        begin
          EditStyle := esPickList;
          PickList.Add(clUH);
          PickList.Add(clHR);
          PickList.Add(clST);
          PickList.Add(clHD);
          ReadOnly := True;
        end;

        with ItemProps['ShowText'] do
        begin
          EditStyle := esPickList;
          PickList.Add('Yes');
          PickList.Add('No');
          ReadOnly := True;
        end;

        with ItemProps['Magnification'] do
        begin
          EditStyle := esPickList;
          for var i := 1 to 10 do
            PickList.Add(i.ToString);
          ReadOnly := True;
        end;
      end;
    end
  end;

  procedure ShowFormObjectProperties;
  begin
    with Sender as tZPLFormObject do
    begin
      hdrSelected.Sections[0].Text := Format('Form (%s)', [getShapeType(ShapeType)]);
      with vlProperties do
      begin
        Values['Border'] := IntToStr(BorderThickness);
        ItemProps['Border'].EditMask := '!99999;0; ';
        {Values['ShapeType'] := getShapeType(ShapeType);
        with ItemProps['ShapeType'] do
        begin
          EditStyle := esPickList;
          PickList.Add(sRectangle);
          PickList.Add(sHorLine);
          PickList.Add(sVertLine);
          PickList.Add(sEllipse);
          ReadOnly := True;
        end;}
      end;
    end;
  end;

begin
  LoadingValues := True;
  vlProperties.Strings.Clear;
  ViewObjectDimensions(Sender);
  if ZPLDocument.SelCount > 1 then //Just show dimensions no more properties
    Exit;

  if Sender is tZPLTextObject then
    ShowTxtObjectProperies
  else
  if Sender is tZPLBarCodeObject then
    ShowBarCodeObjectProperties
  else
  if sender is tZPLFormObject then
    ShowFormObjectProperties;

  LoadingValues := False;
end;

procedure TfrmMain.ViweDocProperties;
begin
  LoadingValues := True;
  hdrSelected.Sections[0].Text := 'Document';
  vlProperties.Strings.Clear;
  with vlProperties do
  begin
    Values['Width'] := ZPLDocument.Width.ToString;
    Values['Height'] := ZPLDocument.Height.ToString;
    ItemProps['Width'].ReadOnly := True;
    ItemProps['Height'].ReadOnly := True;

    Values['LeftShift'] := ZPLDocument.LeftShift.ToString;
    Values['TopShift']   := ZPLDocument.TopShift.ToString;
    ItemProps['LeftShift'].EditMask := '!999;0; ';
    ItemProps['TopShift'].EditMask := '!999;0; ';

    Values['DocumentName'] := ZPLDocument.DocumentName;
    Values['PrinterName'] := ZPLDocument.PrinterName;
    Values['StartCommand'] := ZPLDocument.StartCommand;
    Values['EndCommand'] := ZPLDocument.EndCommand;
//  ItemProps['Orientation'].PickList.Add('Regular');
  end;
  LoadingValues := False;
end;

procedure TfrmMain.vlPropertiesSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if not vlProperties.EditorMode then
  begin
    SetProperties;
    RefreshSelectedObjectsBMP;
    CurrentFileModified := True;
  end;
end;

end.

{DONE -oFabian -cGeneral : Modo de seleccion de varios objetos con SHIFT 11Mar13}
{DONE -oFabian -cGeneral : Modificar la lista de propiedades para que muestre valores en blanco cuando se seleccionen varios objetos a la vez.}
{DONE -oFabian -cGeneral : Metodos de copiar, cortar y pegar}
{DONE -oFabian -cGeneral : Barra de herramientas de alineacion}
