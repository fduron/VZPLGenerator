///	<summary>
///	  Copyright Fabian Duron (C) 2024 OpenZPL Generator - Types and objects
///	  used in OpenZPL Generator
///	</summary>
unit U_ZPLObjects;

interface
  uses System.Classes, System.Types, System.UITypes, Vcl.ExtCtrls, Vcl.Graphics,
       Vcl.Controls, Winapi.Windows, U_ZPLTypes;

type
  tBeginSelect = procedure (Sender: TObject; Button: TMouseButton; Shift: TShiftState) of object;
  tMoveEvent = procedure (Sender: TObject; L, T: Integer; bFirstMovement : Boolean) of object;
  tFinishMove = procedure (Sender : TObject; bObjectMoved : Boolean) of object;

  TIDFile = Array[0..1] of Char;
  tUseVariableText = (use_variable, use_text);
  TRulerUnit = (ru_Centimeters, ru_Inches, ru_Pixels);
  TRulerOrientation = (ro_Horizontal, ro_Vertical);
  TLabelOrientation = (loPortrait, loLandscape); //ZPL Label Orientation
  TBarcodeType = ( bcAztec, bcCode11, bcCode39, bcCodeQR, bcCodeDM);
  TShapeType = ( shRectangle, shEllipse, shHorLine, shVertLine);
  tZPLObjectKind = ( okBarCode, okForm, okLabel );
  tZPLQRCodeCorrectionLevel = (CLUltraHigh, CLHighRel, CLStandard, CLHighDensity);

  ///	<summary>
  ///	  This structure maintains a list sDots with the 8 Handles to move and
  ///	  position of the selected object
  ///	</summary>
  THandles = class(TComponent)
    sDots : TList;
  private
    fSelectedObject: TObject;
    fMouseCoord: TPoint;
    bHandlesMoved : Boolean;
    fOriginalRect: TRect;
    FOnEditObject: TFinishMove;
    FHideHandles: boolean;
    fDotColor: TColor;
    fEnableDots, bHandlesFirstMove: Boolean;
    fOnMove: TMoveEvent;
    procedure setSelectedObject(const Value: TObject);
    procedure SetHideHandles(const Value: boolean);
    procedure SetEnableDots(const Value: Boolean);
  protected
    procedure DotMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DotMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DotMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure DrawDots;
    procedure ViewDots(isVisible : Boolean);
    property HandlesMouseCoord : TPoint read fMouseCoord write fMouseCoord;
    property OriginalRect : TRect read fOriginalRect write fOriginalRect;
  published
    constructor create(AOwner: TComponent);
    destructor destroy; override;
    procedure create8Dots(theOwner : TWinControl);
    procedure RedrawDots;
// ELIMINAR    property SelectedObject : TObject read fSelectedObject write setSelectedObject;
    property OnEditObject: TFinishMove read FOnEditObject write FOnEditObject;
    property OnMove : TMoveEvent read fOnMove write fOnMove;
    property HideHandles : boolean read fHideHandles write SetHideHandles default false;
    property DotColor : TColor read fDotColor write fDotColor;
    property EnableDots : Boolean read fEnableDots write SetEnableDots;
  end;

  ///	<summary>
  ///	  The inserted object, the parameter TheHandles
  ///	</summary>
  TZPLObject = class(TGraphicControl)
  private
    fMouseCoord: TPoint;
    bObjWasMoved, bFirstMove : Boolean;
    fTheHandles: THandles;
    BMPObject : vcl.Graphics.TBitmap;
    fBMPDimensions: TPoint;
    fScreenDPI: Integer;
    fSelected: Boolean;
    FOnSelect: TNotifyEvent;
    fOnMove: TMoveEvent;
    fOnFinishMove: TFinishMove;
    fOnBeginSelect: tBeginSelect;
    fObjectKind: TZPLObjectKind;
    fLocked: Boolean;
    fShowRect: Boolean;
    fOrientation: TLabelOrientation;
    fisVisible: Boolean;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    function getDPIDimensions: TRect; virtual;
    procedure SetSelected(const Value: Boolean);
    procedure SetLocked(const Value: Boolean);
    procedure SetShowRect(const Value: Boolean);
    procedure SetIsVisible(const Value: Boolean);
    property MouseCoord : TPoint read fMouseCoord write fMouseCoord;
    procedure onEditObjectHandles(Sender : TObject; bWasMoved : Boolean);
    procedure onMoveObjectHandles(Sender : TObject; L,T: Integer; bWasMoved : Boolean);
  published
    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
    procedure Assign(Source : TZPLObject); virtual;
    procedure SetObjectBounds;
    procedure SetParent(theParent : TWinControl);
    procedure RefreshBMP; virtual;
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
    property OnBeginSelect : tBeginSelect read fOnBeginSelect write fOnBeginSelect;
    property OnMove: TMoveEvent read fOnMove write fOnMove;
    property OnFinishMove : TFinishMove read fOnFinishMove write fOnFinishMove;
    property TheHandles : THandles read fTheHandles write fTheHandles;
    property BMPDimensions : TPoint read fBMPDimensions write fBMPDimensions;
    property DPIDimensions : TRect read getDPIDimensions;
    property ScreenDPI : Integer read fScreenDPI write fScreenDPI default 96;
    property Selected : Boolean read fSelected write SetSelected;
    property ObjectKind : TZPLObjectKind read fObjectKind;
    property Locked : Boolean read fLocked write SetLocked default false;
    property isVisible : Boolean read fisVisible write SetIsVisible default true;
    property ShowRect : Boolean read fShowRect write SetShowRect default true;
    property Orientation : TLabelOrientation read fOrientation write fOrientation default loPortrait;
  end;

  tZPLObjects = array of tZPLObject;

  TZPLTextObject = Class(TZPLObject) //(ObjectID = 'T')
  private
    FText: String;
    FFontCode: String;
    FVariable: String;
    procedure SetText(const Value: String);
    procedure SetVariable(const Value: String);
  published
    const ZPLCommand = FieldOrigin + FontCodeCode + FieldData + FieldSeparator; //Use the zero scalable font "A0"
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source : TZPLObject); override;
    procedure RefreshBMP; override;
    property Text : String read FText write SetText;
    property Variable : String read FVariable write SetVariable;
    property TheHandles;
    property BMPDimensions;
    property FontCode : String read FFontCode write FFontCode;
    property ObjectKind : TZPLObjectKind read fObjectKind;
  End;

  TZPLBarcodeObject = Class(TZPLObject) //(ObjectID = 'B')
  private
    fBarcodeType: TBarcodeType;
    FText: String;
    fShowText: Boolean;
    fMagnification: SmallInt;
    fVariable: String;
    FCorrectionLevel: tZPLQRCodeCorrectionLevel;
    procedure SetText(const Value: String);
    function GetZPLCommand: String;
    procedure SetVariable(const Value: String);
  published
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source : TZPLObject); override;
    property BarcodeType : TBarcodeType read fBarcodeType write fBarcodeType default bcAztec;
    procedure RefreshBMP; override;
    property Text : String read FText write SetText;
    property Variable : String read fVariable write SetVariable;
    property TheHandles;
    property BMPDimensions;
    property ZPLCommand : String read GetZPLCommand;
    property ShowText : Boolean read fShowText write fShowText default True;
    property Magnification : SmallInt read fMagnification write fMagnification;
    property CorrectionLevel: tZPLQRCodeCorrectionLevel read FCorrectionLevel write FCorrectionLevel;
  End;

  TZPLFormObject = Class(TZPLObject) //(ObjectID = 'F')
  private
    fShapeType: TShapeType;
    fThickness: integer;
    function GetZPLCommand: String;
    procedure setShapeType(const Value: TShapeType);
  published
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source : TZPLObject); override;
    property ShapeType : TShapeType read fShapeType write setShapeType default shRectangle;
    procedure RefreshBMP; override;
    property TheHandles;
    property BMPDimensions;
    property ZPLCommand : String read GetZPLCommand;
    property BorderThickness : integer read fThickness write fThickness default 2;
  End;

  TZPLDocument = Class(TComponent)
  private
    FStartCommand: String;
    FEndCommand: String;
    fDPI: Integer;
    fZPLObjects: TList;
    fOrientation: TLabelOrientation;
    iOldPrinterIndex : Integer;
    fPrinterName: String;
    fWidth: Integer;
    fHeight: Integer;
    fDocumentName: String;
    fFieldValues: TStringList;
    fOnMove: TMoveEvent;
    fOnFinishMove: TFinishMove;
    FOnSelect: TNotifyEvent;
    fOnBeginSelect: tBeginSelect;
    fParentPanel: TPanel;
    fUseVariableText: tUseVariableText;
    fTopShift: Integer;
    fLeftShift: Integer;

    iPageOrientation : TPrinterOrientation;

    procedure SelectPrinter;
    procedure ReturnPrinter;
    function GetSelCount : integer;

  published
    constructor Create(aParentPanel : TPanel); overload;
    destructor Destroy; override;
    procedure ShowHandles(bVisible : Boolean = True);
    procedure HideHandles;
    procedure UnselectObjects;
    procedure RedrawHandles;
    procedure MoveSelectedObjects(Sender : TObject; iLeft, iTop : Integer);
    function Print(iCopies : Integer = 1): String;
    function ZPLScript : String;
    function SaveToFile(FileName : String) : Boolean;
    property SelCount : integer read GetSelCount;

    function AddObject(Kind : tZPLObjectKind; AutoSelect : Boolean = False) : TZPLObject;

    ///	<summary>
    ///	  Loads a ZPL Label from file
    ///	</summary>
    ///	<param name="FileName">
    ///	  The file we are trying to open
    ///	</param>
    ///	<param name="xParent">
    ///	  if null it means we are opening a label just for print, not for
    ///	  edition, if not null places the new objects in the xParent object
    ///	</param>
    ///	<returns>
    ///	  True if success otherwise false
    ///	</returns>
    function LoadFromFile(FileName : String) : Boolean;
    function SelectedObjects : tZPLObjects;
    property StartCommand : String read FStartCommand write FStartCommand {default '^XA'};
    property EndCommand : String read FEndCommand write FEndCommand {default '^XZ'};
    property LeftShift : Integer read fLeftShift write fLeftShift default 0;
    property TopShift : Integer read fTopShift write fTopShift default 0;
    property DPI : Integer read fDPI write fDPI default 200;
    property Orientation : TLabelOrientation read fOrientation write fOrientation default loPortrait;
    property ZPLObjects : TList read fZPLObjects write fZPLObjects;
    function FindZPLObject(Name : String) : tZPLObject;
    procedure CleanDocument;
    property PrinterName : String read fPrinterName write fPrinterName;
    property DocumentName : String read fDocumentName write fDocumentName;
    property Width : Integer read fWidth write fWidth;
    property Height : Integer read fHeight write fHeight;
    property FieldValues : TStringList read fFieldValues write fFieldValues;
    //Global select and move events for child objects
    property GlobalOnSelect: TNotifyEvent read FOnSelect write FOnSelect;
    property GlobalOnBeginSelect : tBeginSelect read fOnBeginSelect write fOnBeginSelect;
    property GlobalOnMove: TMoveEvent read fOnMove write fOnMove;
    property GlobalOnFinishMove : TFinishMove read fOnFinishMove write fOnFinishMove;
    property UseVariableOrText : tUseVariableText read fUseVariableText write fUseVariableText default use_text;
  End;

  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}

  ///	<summary>
  ///	  This is a copy of the JvRuler object from the open source Project
  ///	  JEDI's JVCL
  ///	</summary>
  T_Ruler = class(TGraphicControl)
  private
    FUseUnit: TRulerUnit;
    FOrientation: TRulerOrientation;
    FPosition: Double;
    procedure SetPosition(const Value: Double);
    procedure SetOrientation(Value: TRulerOrientation);
    procedure SetUseUnit(Value: TRulerUnit);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Font;
    property Height default 25;
    property Width default 300;
    property Orientation: TRulerOrientation read FOrientation write SetOrientation  default ro_Horizontal;
    property Position: Double read FPosition write SetPosition;
    property UseUnit: TRulerUnit read FUseUnit write SetUseUnit default ru_Centimeters;
  end;

function InchesToPixels(DC: HDC; Value: Double; IsHorizontal: Boolean): Integer;
function CentimetersToPixels(DC: HDC; Value: Double; IsHorizontal: Boolean): Integer;

implementation

{$R bc_samples.res}

uses
  System.SysUtils, System.StrUtils, Printers, WinSpool{Winapi.WinSpool}
  ,U_ZPLFileHandling;

const
  LogPixels: array [Boolean] of Integer = (LOGPIXELSY, LOGPIXELSX);

var
  CF_ZPL: Word;


//function from https://engineertips.wordpress.com/2023/09/01/delphi-get-display-scaling-percentage/
function GetDisplayScalingPercentage: Double;
var
  DC: HDC;
  DPI_X: Integer;
begin
  DC := GetDC(0); // Get the device context of the screen
  try
    DPI_X := GetDeviceCaps(DC, LOGPIXELSX); // Get the DPI value for the x-axis
    // Calculate the scaling factor
    Result := DPI_X / 96 * 100; // Assuming 96 DPI as standard
  finally
    ReleaseDC(0, DC);  // Release the device context
  end;
end;

function InchesToPixels(DC: HDC; Value: Double; IsHorizontal: Boolean): Integer;
begin
  Result := Round(Value * GetDeviceCaps(DC, LogPixels[IsHorizontal]));
  Result := Round(Result * (100 / GetDisplayScalingPercentage)); //Use window scale
end;

function CentimetersToPixels(DC: HDC; Value: Double; IsHorizontal: Boolean): Integer;
begin
  Result := Round(Value * GetDeviceCaps(DC, LogPixels[IsHorizontal]) / 2.54);
  Result := Round(Result * (100 / GetDisplayScalingPercentage)); //Use window scale
end;

//=== { T_Ruler } ===========================================================

constructor T_Ruler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOrientation := ro_Horizontal;
  FUseUnit := ru_Centimeters;
  Height := 25;
  Width := 300;
end;

procedure T_Ruler.Paint;
const
  Offset: array [Boolean] of Integer = (8, 3);
var
  X, Y: Double;
  PX, PY, Pos: Integer;
  S: string;
  R: TRect;
begin
  Canvas.Font := Font;
  X := 0;
  Y := 0;
  repeat
    X := X + 0.5;
    Y := Y + 0.5;
    case FUseUnit of
      ru_Inches:
        begin
          PX := InchesToPixels(Canvas.Handle, X, True);
          PY := InchesToPixels(Canvas.Handle, Y, False);
          Pos := InchesToPixels(Canvas.Handle, Position, Orientation = ro_Horizontal);
        end;
      ru_Centimeters:
        begin
          PX := CentimetersToPixels(Canvas.Handle, X, True);
          PY := CentimetersToPixels(Canvas.Handle, Y, False);
          Pos := CentimetersToPixels(Canvas.Handle, Position, Orientation = ro_Horizontal);
        end;
    else // ruPixels
      PX := Round(X * 50);
      PY := Round(Y * 50);
      Pos := Round(Position);
    end;

    SetBkMode(Canvas.Handle, TRANSPARENT);
    if (PX < Width) or (PY < Height) then
      with Canvas do
        if Orientation = ro_Horizontal then
        begin
          if X = Trunc(X) then
          begin
            R := Rect(PX - 10, 0, PX + 10, Height);
            if UseUnit = ru_Pixels then
              S := IntToStr(PX)
            else
              S := IntToStr(Trunc(X));
            R := Rect(PX - TextWidth(S), 0, PX + TextWidth(S), Height);
            WinApi.Windows.DrawText(Handle, PChar(S), Length(S), R, DT_SINGLELINE or DT_CENTER);
          end;
          MoveTo(PX, Height - Offset[X = Trunc(X)]);
          LineTo(PX, Height);
        end
        else
        begin
          if Y = Trunc(Y) then
          begin
            if UseUnit = ru_Pixels then
              S := IntToStr(PY)
            else
              S := IntToStr(Trunc(Y));
            R := Rect(0, PY - TextHeight(S), Width, PY + TextHeight(S));
            WinApi.Windows.DrawText(Handle, PChar(S), Length(S), R, DT_SINGLELINE or DT_VCENTER);
          end;
          MoveTo(Width - Offset[Y = Trunc(Y)], PY);
          LineTo(Width, PY);
        end;
  until ((Orientation = ro_Horizontal) and (PX > Width)) or
    ((Orientation = ro_Vertical) and (PY > Height));

  if Position > 0.0 then
    with Canvas do
      if Orientation = ro_Horizontal then
      begin
        MoveTo(Pos - 2, Height - 4);
        LineTo(Pos + 2, Height - 4);
        LineTo(Pos, Height);
        LineTo(Pos - 2, Height - 4);
      end
      else
      begin
        MoveTo(Width - 4, Pos - 2);
        LineTo(Width - 4, Pos + 2);
        LineTo(Width, Pos);
        LineTo(Width - 4, Pos - 2);
      end;
end;

procedure T_Ruler.SetPosition(const Value: Double);
begin
  if FPosition <> Value then
  begin
    FPosition := Value;
    Invalidate;
  end;
end;

procedure T_Ruler.SetOrientation(Value: TRulerOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    if csDesigning in ComponentState then
      SetBounds(Left, Top, Height, Width);
    Invalidate;
  end;
end;

procedure T_Ruler.SetUseUnit(Value: TRulerUnit);
begin
  if FUseUnit <> Value then
  begin
    FUseUnit := Value;
    Invalidate;
  end;
end;

{ THandles }

constructor THandles.create(AOwner: TComponent);
begin
  inherited;
  bHandlesMoved := False;
  bHandlesFirstMove := False;
  fDotColor := RGB(0,163,255);
end;

procedure THandles.create8Dots(theOwner: TWinControl);
var
  I: Integer;
  sh : TShape;
begin
  sDots := TList.Create;
  for I := 0 to 7 do
  begin
    sh := TShape.Create(Self);
    sh.Parent := theOwner;
    sh.Brush.Color := fDotColor;
    {sh.Pen.Color := RGB(0, 215, 255);}
    {sh.Pen.Mode := pmMergePenNot;}
    {sh.Pen.Style := pmClear;}
    sh.Shape := stEllipse;
    sh.Tag := I;
    sh.SetBounds(0, 0, 7, 7);
    sh.visible := False;
    sh.OnMouseMove := DotMouseMove;
    sh.OnMouseDown := DotMouseDown;
    sh.OnMouseUp := DotMouseUp;
    case sh.Tag of //set cursor
      0,7 : sh.cursor := crSizeNWSE;
      1,6 : sh.cursor := crSizeNS;
      2,5 : sh.cursor := crSizeNESW;
      3,4 : sh.cursor := crSizeWE;
    end;
    sDots.Add(sh);
  end;
  fHideHandles := False;
end;

destructor THandles.destroy;
begin
  inherited;
end;

procedure THandles.DotMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FHideHandles then
    Exit;

  HandlesMouseCoord := Point(X, Y);
  OriginalRect := Rect(TWinControl(Owner).Left,
                       TWinControl(Owner).Top,
                       TWinControl(Owner).Width,
                       TWinControl(Owner).Height
                            );
  bHandlesFirstMove := True; //Prepare for first move
end;

procedure THandles.DotMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  WC : TWinControl;
begin
  if TZPLObject(Owner).Locked then
    Exit;

  if fHideHandles then
    Exit;

  if ssLeft in Shift then
  begin //if moving or resizing, hide the Handles
    bHandlesMoved := True;
    if Assigned(fOnMove) and bHandlesFirstMove then
    begin//Use -10000 to identify as handle movement
      fOnMove(Sender, -10000, -10000, bHandlesFirstMove);
      bHandlesFirstMove := False;
    end;

    ViewDots(False);
    WC := TWinControl(Owner); //Self is THandles
    case TShape(Sender).Tag of
      0 : begin
            WC.Top := (Y - HandlesMouseCoord.Y) + OriginalRect.Top;
            WC.Height := OriginalRect.Bottom + (OriginalRect.Top - WC.Top);
            WC.Left := (X - HandlesMouseCoord.X) + OriginalRect.Left;
            WC.Width := OriginalRect.Right + (OriginalRect.Left - WC.Left);
          end;
      1 : begin
            WC.Top := (Y - HandlesMouseCoord.Y) + OriginalRect.Top;
            WC.Height := OriginalRect.Bottom + (OriginalRect.Top - WC.Top);
          end;
      2 : begin
            WC.Top := (Y - HandlesMouseCoord.Y) + OriginalRect.Top;
            WC.Height := OriginalRect.Bottom + (OriginalRect.Top - WC.Top);
            WC.Width := OriginalRect.Right + (X - HandlesMouseCoord.X);
          end;
      3 : begin
            WC.Left := (X - HandlesMouseCoord.X) + OriginalRect.Left;
            WC.Width := OriginalRect.Right + (OriginalRect.Left - WC.Left);
          end;
      4 : begin
            WC.Width := OriginalRect.Right + (X - HandlesMouseCoord.X);
          end;
      5 : begin
            WC.Left := (X - HandlesMouseCoord.X) + OriginalRect.Left;
            WC.Height := OriginalRect.Bottom + (Y - HandlesMouseCoord.Y);
            WC.Width := OriginalRect.Right - (X - HandlesMouseCoord.X);
          end;
      6 : begin
            WC.Height := OriginalRect.Bottom + (Y - HandlesMouseCoord.Y);
          end;
      7 : begin
            WC.Height := OriginalRect.Bottom + (Y - HandlesMouseCoord.Y);
            WC.Width := OriginalRect.Right + (X - HandlesMouseCoord.X);
          end;

    end;
  end;
end;

procedure THandles.DotMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if fHideHandles then
    Exit;

  DrawDots;
  ViewDots(True);
  TZPLObject(Owner).RefreshBMP;//Recreate Bitmap
  TZPLObject(Owner).Refresh;

  if Assigned(FOnEditObject) then
    FOnEditObject(Self, bHandlesMoved);

  bHandlesMoved := False;
  bHandlesFirstMove := False; //Prepare for first move
end;

procedure THandles.DrawDots;

  procedure SetDot(aDot : TObject; L, T : Integer);
  begin
    with TWinControl(aDot) do
    begin
      //Parent := TWinControl(Owner).Parent;
      Top := T;
      Left := L;
      tShape(aDot).Brush.Color := fDotColor;
      tShape(aDot).Pen.Color := fDotColor;
    end;
  end;

var
  L, T, W, H : Integer;
begin
  L := TWinControl(Owner).Left;
  T := TWinControl(Owner).Top;
  W := TWinControl(Owner).Width;
  H := TWinControl(Owner).Height;

  //Set 8 Handles positions
  SetDot(sDots[0], L - 3             , T - 3);
  SetDot(sDots[1], L + (W div 2) - 3 , T - 3);
  SetDot(sDots[2], L + W - 3         , T - 3);

  SetDot(sDots[3], L - 3             , T + (H div 2) - 3);
  SetDot(sDots[4], L + W - 3         , T + (H div 2) - 3);

  SetDot(sDots[5], L - 3             , T + H - 3);
  SetDot(sDots[6], L + (W div 2) - 3 , T + H - 3);
  SetDot(sDots[7], L + W - 3         , T + H - 3);
end;

procedure THandles.RedrawDots;
begin
  DrawDots;
end;

procedure THandles.SetEnableDots(const Value: Boolean);
var
  I: Integer;
begin
  for I := 0 to 7 do
    TShape(sDots[I]).Enabled := Value;

  fEnableDots := Value;
end;

procedure THandles.SetHideHandles(const Value: boolean);
begin
  FHideHandles := Value;
  DrawDots;
  ViewDots(not Value);

{  if Assigned(FOnEditObject) then
    FOnEditObject(Self);}
end;

procedure THandles.ViewDots(isVisible : Boolean);
var
  I: Integer;
begin
  for I := 0 to 7 do
  begin
    TShape(sDots[I]).Visible := isVisible;
    if isVisible then
      TShape(sDots[I]).BringToFront;
  end;
end;

procedure THandles.setSelectedObject(const Value: TObject);
begin
{  if fHideHandles then
    Exit;

  fSelectedObject := Value;
  if Assigned(fSelectedObject) then
  begin
    DrawDots;
    ViewDots(True);
  end
  else
    ViewDots(False);

  if Assigned(FOnEditObject) then
    FOnEditObject(Self);}
end;

{ TZPLObject }

procedure TZPLObject.Assign(Source: TZPLObject);
begin
//  Name := Source.Name;
  Selected := Source.Selected;
  Left := Source.Left;
  Top := Source.Top;
  width := Source.width;
  height := Source.height;
end;

constructor TZPLObject.Create(AOwner: TComponent);
begin
  inherited;
  fScreenDPI := 96;
  bObjWasMoved := False;
  bFirstMove := False;
  fLocked := False;
  fIsVisible := True;
  fShowRect := True;
  if Assigned(AOWner) then
    BMPObject := vcl.Graphics.TBitmap.Create;
end;

destructor TZPLObject.Destroy;
begin
  if Assigned(BMPObject) then
    BMPObject.Free;
{  if Assigned(fTheHandles) then
    fTheHandles.Free;}
  inherited;
end;

function TZPLObject.getDPIDimensions: TRect;
var
  PrinterDPI, L, W, T, H : Integer;
  i : FixedInt;
begin
  L := Left;
  T := Top;
  W := Width;
  H := Height;

  if Self is TZPLFormObject then
  begin
    case TZPLFormObject(Self).ShapeType of
      shVertLine, shHorLine:
      begin
        L := L + 3;
        W := W - 6;
        T := T + 3;
        H := H - 6;
      end;
    end;
  end;

//  ScreenDPI := InchesToPixels(Canvas.Handle, 1, False);
  PrinterDPI := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  Result.Left := Round((printerDPI/ScreenDPI) * L);
  Result.Right := Round((printerDPI/ScreenDPI) * W);

//  ScreenDPI := InchesToPixels(Canvas.Handle, 1, True);
  PrinterDPI := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
  Result.Top := Round((printerDPI/ScreenDPI) * T);
  Result.Bottom := Round((printerDPI/ScreenDPI) * H);

  if orientation = loLandscape then //Invert coordinates
  begin
    i := Result.Left;
    Result.Left := Printer.PageWidth - Result.Top - Result.Bottom;
    Result.Top := i;

    i := Result.Right;
    Result.Right := Result.Bottom;
    Result.Bottom := i;
  end;
end;

procedure TZPLObject.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  L, T : Integer;
begin
  inherited;

  if Locked then
    Exit;

  if not Assigned(TheHandles) then //No handles, abort
    Abort;

  if ssLeft in Shift then
  begin
    bObjWasMoved := True;

    L := X - MouseCoord.X; //Pixels - X
    T := Y - MouseCoord.Y; //Pixels - Y

    if Assigned(OnMove) then
      OnMove(Self, L, T, bFirstMove);
    bFirstMove := False; //first move triggered, back to false

    Left := Left + L;
    Top := Top + T;
    //SetSelected(False);
    Update;
  end;
end;

procedure TZPLObject.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Assigned(OnBeginSelect) then
    OnBeginSelect(Self, Button, Shift);

  inherited;
  if Button = mbLeft then
  begin
    MouseCoord := Point(X,Y);
    SetSelected(True);
    bFirstMove := True; //Prepare for first move
  end;
end;

procedure TZPLObject.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    if assigned(OnFinishMove) then
      OnFinishMove(Self, bObjWasMoved);

    bObjWasMoved := False;
  end;
end;

procedure TZPLObject.onEditObjectHandles(Sender: TObject; bWasMoved: Boolean);
begin
  if assigned(OnFinishMove) then
    OnFinishMove(Self, bWasMoved);
end;

procedure TZPLObject.onMoveObjectHandles(Sender: TObject; L, T: Integer;
  bWasMoved: Boolean);
begin
  if assigned(Onmove ) then
    OnMove(Self, L, T, bWasMoved);
end;

procedure TZPLObject.Paint;
var
  R : TRect;
begin
  if not Assigned(Owner) then
    Exit;

  inherited;
  //Canvas.TextOut(0,0, Format('L:%d, T:%d, W:%d, H:%d', [Left, Top, Width, Height]));
  R := ClientRect;
  Canvas.StretchDraw(R, BMPObject);

  if ShowRect then
    Canvas.DrawFocusRect(ClientRect);

  if Locked then
  begin
    Canvas.Pen.Color := clRed;
    Canvas.Pen.Width := 2;
    Canvas.MoveTo(0,0);
    Canvas.LineTo(7,7);
    Canvas.MoveTo(0,7);
    Canvas.LineTo(7,0);
  end;
end;

procedure TZPLObject.RefreshBMP;
begin
  if not Assigned(BMPObject) then
    Exit;
 {}
end;

procedure TZPLObject.SetIsVisible(const Value: Boolean);
begin
  fisVisible := Value;
  Repaint;
end;

procedure TZPLObject.SetLocked(const Value: Boolean);
begin
  fLocked := Value;
  Repaint;
end;

procedure TZPLObject.SetObjectBounds;
begin
  Width := BMPDimensions.X;
  Height := BMPDimensions.Y;
  if Assigned(TheHandles) then
    TheHandles.HideHandles := False;
end;

procedure TZPLObject.SetParent(theParent: TWinControl);
begin
  Parent := theParent;
  fTheHandles := THandles.create(self);
  fTheHandles.Create8Dots(theParent);
  fTheHandles.OnEditObject := onEditObjectHandles;
  fTheHandles.OnMove := onMoveObjectHandles;
  Selected := True;
end;

procedure TZPLObject.SetSelected(const Value: Boolean);
begin
  fSelected := Value;
  if Assigned(TheHandles) then
    theHandles.HideHandles := not fSelected;
  if Assigned(OnSelect) then
    OnSelect(Self);
end;

procedure TZPLObject.SetShowRect(const Value: Boolean);
begin
  fShowRect := Value;
  Repaint;
end;

{ TZPLTextObject }

procedure TZPLTextObject.Assign(Source: TZPLObject);
begin
  inherited;
  Text := TZPLTextObject(Source).Text;
  FontCode := TZPLTextObject(Source).FontCode;
end;

constructor TZPLTextObject.Create(AOwner: TComponent);
begin
  inherited;
  FObjectKind := okLabel;
  FFontCode := 'A';
  SetText('Label'); //use SetText instead of fText in order to set background bitmap size
end;

procedure TZPLTextObject.RefreshBMP;
  procedure SetFontNoQuality(Font: TFont);
  var
    LogFont: TLogFont;
  begin
    if GetObject(Font.Handle, SizeOf(TLogFont), @LogFont) = 0 then
      RaiseLastOSError;
    LogFont.lfQuality := NONANTIALIASED_QUALITY;
    Font.Handle := CreateFontIndirect(LogFont);
  end;

var
  W, H : Integer;
  R : TRect;
  s : String;
begin
  inherited;
  if not Assigned(BMPObject) then
    Exit;

  with BMPObject.Canvas do
  begin
    if isVisible then
      Font.Color := clBlack
    else
      Font.Color := clSilver;

    if FontCode = '0' then
    begin
      Font.Name := 'Arial';
      Font.Style := [fsBold];
      Font.Size := 1;
      while TextHeight(Text) < Self.Height do
      begin
        Font.Size := Font.Size + 1;
        H := TextHeight(Text);
      end;
    end
    else
    begin
      Font.Name := 'System';
      Font.Style := [];
      Font.Size := 1;
      H := TextHeight(Text);
    end;

    SetFontNoQuality(Font);
    W := TextWidth(Text);
  end;

  s := Text;
  r := Rect(0,0, W, H);
  with BMPObject do
  begin
    Height := H;
    Width := W;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(r);
    Transparent := true;
    TransparentMode := tmFixed;
    TransparentColor := clWhite;
    Canvas.TextRect(r, s);
  end;
  fBMPDimensions := Point(W, H);
end;

procedure TZPLTextObject.SetText(const Value: String);
begin
  fText := Value;
  RefreshBMP;
  Refresh;
end;

procedure TZPLTextObject.SetVariable(const Value: String);
begin
  FVariable := Value;
end;

{ TZPLDocument }

function TZPLDocument.AddObject(Kind: tZPLObjectKind; AutoSelect : Boolean = False): TZPLObject;
  function UniqueName : String;
  var
    Index : Integer;
    Found : Boolean;
    NameProposition, sPrefix : String;
  begin
    case kind of
      okBarCode: sPrefix := 'BarCode';
      okForm: sPrefix := 'Form';
      okLabel: sPrefix := 'Label';
    end;

    Index := 0;

    Repeat
      Found := False;
      inc(Index);
      NameProposition := sPrefix + Index.ToString;
      for var aZPLObject in ZPLObjects do
      begin
        Found := TZPLObject(aZPLObject).name = NameProposition;
        if Found then
          Break;
      end;
    Until not Found;

    Result := NameProposition;
  end;

begin
  case Kind of
    okBarCode:
      begin
        Result := TZPLBarcodeObject.Create(fParentPanel);
        TZPLBarcodeObject(Result).Height := 20;
      end;
    okForm:
      begin
        Result := TZPLFormObject.Create(fParentPanel);
        with TZPLFormObject(Result) do
        begin
          Width := 20;
          Height := 20;
          RefreshBMP;
        end;
      end;
    okLabel:
      begin
        Result := TZPLTextObject.Create(fParentPanel);
        TZPLTextObject(Result).Height := 20;
        TZPLTextObject(Result).FontCode := '0';
      end;
  end;

  with Result do
  begin
    name := UniqueName;// use Kind varialble as prefix
    SetParent(fParentPanel); //on SetParent selected = True;
    OnBeginSelect := GlobalOnBeginSelect;
    OnSelect := GlobalOnSelect;
    OnMove := GlobalOnMove;
    OnFinishMove := GlobalOnFinishMove;
    SetObjectBounds;
  end;

  if not AutoSelect then
    UnselectObjects;

  ZPLObjects.Add(Result);
end;

procedure TZPLDocument.CleanDocument;
begin
  while ZPLObjects.Count > 0 do
  begin
    TZPLObject(ZPLObjects[0]).Free;
    ZPLObjects.Delete(0);
  end;
end;

constructor TZPLDocument.Create(aParentPanel : TPanel);
begin
  fParentPanel := aParentPanel;
  FStartCommand := '^XA';
  FEndCommand := '^XZ';
  fUseVariableText := use_Text;
  fDPI := 200;
  fFieldValues := TStringList.Create;
  fZPLObjects := TList.Create;
  fOrientation := loPortrait;
end;

destructor TZPLDocument.Destroy;
begin
  fFieldValues.Free;
  fZPLObjects.Free;
  inherited;
end;

function TZPLDocument.FindZPLObject(Name: String): tZPLObject;
begin
  Result := Nil;
  for var aObject in ZPLObjects do
  begin
    if tZPLObject(aObject).Name = Name then
    begin
      Result := TZplObject(aObject);
      Break;
    end;
  end;
end;

function TZPLDocument.LoadFromFile(FileName: String): Boolean;
var
  s : String;
begin

  CleanDocument;
  if U_ZPLFileHandling.LoadFromFile(Self, FileName, s) then
  begin
    if Assigned(fParentPanel) then
    begin //Si se cargo correctamente el archivo, ya se cuenta con los valores de Width y Height
      fParentPanel.Width := Self.Width;
      fParentPanel.Height := Self.Height;
    end;
  end
  else
    raise Exception.Create(s);

end;

procedure TZPLDocument.MoveSelectedObjects(Sender : TObject; iLeft, iTop: Integer);
begin
  if SelCount > 1 then
    for var A in fZPLObjects do
    with TZPLObject(A) do
      if Selected and (not locked) and (A <> Sender) then
      begin
        Left := Left + iLeft;
        Top := Top + iTop;
      end;
end;

function TZPLDocument.Print(iCopies : Integer = 1): String;
var
  lst: TextFile;

  oldi, i, iCp : Integer;
  s : String;
  LineTop, LineHeight : Integer;
  fZPL : TStringList;
  ARect : TRect;
begin
  if iCopies <= 0 then
    iCopies := 1;

  SelectPrinter;

  fZPL := TStringList.Create;
  try
    fZPL.Text := ZPLScript; //Asignar el ZLPScript hasta despues de asignar la impresora,
    //para que use los DPI de la impresora asignada, no de la predeterminada
    for I := 0 to fFieldValues.Count - 1 do
      fZPL.Text := ReplaceStr(fZPL.Text, '<' + fFieldValues.Names[I] + '>', fFieldValues.ValueFromIndex[I]);

    Printer.Title := fDocumentName;

    //****When using Windows Driver, Fit all ZPL code lines inside one single page **\\\
    //LineHeight := Printer.Canvas.TextHeight(fZPL[I]);
    LineHeight := Printer.PageHeight div (fZPL.Count + 2);

    for iCp := 1 to iCopies do
    begin
      Printer.BeginDoc;
      LineTop := 0;
      for I := 0 to fZPL.Count - 1 do
      begin
        {never create a new page, if so this cut the code apart}
        {if LineTop + LineHeight > Printer.PageHeight then
        begin
          LineTop := 0;
          Printer.NewPage;
        end;}
        ARect := Rect(0, LineTop, Printer.PageWidth, LineTop + LineHeight);
        Printer.Canvas.TextOut(ARect.Left, ARect.Top, fZPL[I]);
        LineTop := LineTop + LineHeight;
      end;
      Printer.EndDoc;
    end;
  finally
    ReturnPrinter;
  end;

end;

procedure TZPLDocument.RedrawHandles;
var
  I: Integer;
begin
  for I := 0 to fZPLObjects.Count - 1 do
  begin
    if SelCount > 1 then
    begin
      tZPLObject(fZPLObjects[I]).TheHandles.DotColor := clGray;
      tZPLObject(fZPLObjects[I]).TheHandles.EnableDots := False;
    end
    else
    begin
      tZPLObject(fZPLObjects[I]).TheHandles.DotColor := RGB(0,163,255);
      tZPLObject(fZPLObjects[I]).TheHandles.EnableDots := True;
    end;

    tZPLObject(fZPLObjects[I]).TheHandles.RedrawDots;
  end;
end;

procedure TZPLDocument.ReturnPrinter;
begin
  Printer.Orientation := iPageOrientation;
  Printer.PrinterIndex := iOldPrinterIndex;
end;

function TZPLDocument.SaveToFile(FileName: String): Boolean;
begin
  U_ZPLFileHandling.SaveToFile(Self, FileName);
  Exit;
end;

function TZPLDocument.SelectedObjects: tZPLObjects;
var
  I, iCount : Integer;
begin
  iCount := 0;
  for I := 0 to fZPLObjects.Count - 1 do
    if TZPLObject(fZPLObjects[I]).Selected then
    begin
      inc(iCount);
      setLength(Result, iCount );
      Result[iCount - 1] := TZPLObject(fZPLObjects[I]);
    end;
end;

procedure TZPLDocument.SelectPrinter;
var
  i : Integer;
begin
  iPageOrientation := Printer.Orientation;
  Printer.Orientation := poPortrait; //It must be always Portrait
  iOldPrinterIndex := Printer.PrinterIndex;
  i := Printer.Printers.IndexOf(PrinterName{'ZDesigner GK420t'});
  if i >= 0 then
    Printer.PrinterIndex := i;
end;

procedure TZPLDocument.ShowHandles(bVisible: Boolean);
var
  I : Integer;
begin
  for I := 0 to fZPLObjects.Count - 1 do
  begin
    if TZPLObject(fZPLObjects[I]).Selected then
      TZPLObject(fZPLObjects[I]).TheHandles.HideHandles := not bVisible;
  end;
end;

procedure TZPLDocument.UnselectObjects;
var
  I : Integer;
begin
  for I := 0 to fZPLObjects.Count - 1 do
    TZPLObject(fZPLObjects[I]).Selected := False;
end;

function TZPLDocument.GetSelCount : integer;
var
  i : Integer;
begin
  Result := 0;
  for i := 0 to ZPLObjects.Count - 1 do
    if TZPLObject(ZPLObjects[i]).Selected then
      inc(Result);
end;

procedure TZPLDocument.HideHandles;
begin
  ShowHandles(False);
end;

function TZPLDocument.ZPLScript: String;

  function LocalGetOrientationChar : Char;
  begin
    case orientation of
      loPortrait: Result := getOrientationChar(zoNormal);
      loLandscape: Result := getOrientationChar(zoRotated90);
    end;
  end;

  function LocalGetQROrientationChar : Char;
  begin
    case orientation of
      loPortrait: Result := getOrientationChar(zoNormal );
      loLandscape: Result := getOrientationChar(zoRotated90);
    end;
  end;

  function strFontCode(s : String; R: TRect; FontName, sText : String) : String;
  var
    W0, W1, H : Integer;
  begin
    if orientation = loPortrait then
    begin
      W0 := R.Right;
      H := R.Bottom;
    end
    else
    begin
      W0 := R.Bottom;
      H := R.Right;
    end;

    W0 := Round(W0 div (Length(sText)) * 2.54);
    W1 := Round(W0 / (Length(sText) + 2.2));

    if pos('0', FontName) > 0 then //Scalable font
      s := ReplaceStr(s, '<FONT_WIDTH>',  W0.ToString)
    else
      s := ReplaceStr(s, '<FONT_WIDTH>', W1.ToString);

    s := s.Replace('<FONT_CHAR_HEIGHT>', IntToStr(H));

    s := s.replace('<FONT_FIELD_ORIENTATION>', LocalgetOrientationChar);
    s := s.replace('<FONT_NAME>', FontName);

    Result := s;
  end;

  function StrWidthHeight(s : String; R : TRect) : String;
  begin
    {if Orientation = loPortrait then
    begin}
      s := ReplaceStr(s, '<WIDTH>', IntToStr(R.Right) );
      s := ReplaceStr(s, '<HEIGHT>', IntToStr(R.Bottom));
    {end
    else
    begin
      s := ReplaceStr(s, '<WIDTH>', IntToStr(R.Bottom));
      s := ReplaceStr(s, '<HEIGHT>', IntToStr(R.Right) );
    end;}

    Result := s;
  end;

  //1D Barcode Height
  function BC1d_StrHeight(s : String; R : TRect) : String;
  begin
    //For 1D barcode does not matter the page orientation, r.Bottom is always the height of the barcode
    s := ReplaceStr(s, '<HEIGHT>', IntToStr(R.Bottom) );
    s := ReplaceStr(s, '<BC_HEIGHT>', IntToStr(R.Bottom));

    Result := s;
  end;

  function StrPosition(s : String; R : TRect) : String;
  begin
    {if Orientation = loPortrait then
    begin}
      s := ReplaceStr(s, '<LEFT>', IntToStr(R.Left));
      s := ReplaceStr(s, '<TOP>', IntToStr(R.Top));
    {end
    else
    begin
      R.Top := Printer.PageWidth - R.Top - R.Bottom;
      s := ReplaceStr(s, '<TOP>', IntToStr(R.Left));
      s := ReplaceStr(s, '<LEFT>', IntToStr(R.Top));
    end;}
    Result := s;
  end;

  function YesNo(b : Boolean): String;
  begin
    if b then Result := 'Y' else Result := 'N';
  end;

var
  I: Integer;
  fZPLText : TStringList;
  s, aText: String;
  W, ii, ij: Integer;
  printer_DPI: Integer;
  R: TRect;
  BC: TZPLBarcodeObject;
  txO: TZPLTextObject;
  zpO: TZPLFormObject;
begin
  SelectPrinter;

  Printer_DPI := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  fZPLText := TStringList.Create;
  fZPLText.Add(Self.StartCommand); //Begin Script
  if Self.LeftShift <> 0 then
    fZPLText.Add('^LS' + Self.LeftShift.ToString);
  if Self.TopShift <> 0 then
    fZPLText.Add('^LT' + Self.TopShift.ToString);

  for I := 0 to fZPLObjects.count - 1 do
  begin
    s := '';
    if not TZPLObject(fZPLObjects[I]).isVisible then
      continue;

    if (TObject(fZPLObjects[I]) is TZPLTextObject) then
    begin
      txO := TZPLTextObject(fZPLObjects[I]);
      txO.Orientation := self.Orientation;
      R := txO.DPIDimensions;
      s := StrWidthHeight(txO.ZPLCommand, R);
      s := StrPosition(s, R);
      s := strFontCode(s, R, txO.FontCode, txO.Text);

//      s := ReplaceStr(s, '<ORIENTATION>', txO.FontCode + getOrientationChar(fc));
/////////////////////////////////////////////////////////////////////////////////////////
      if UseVariableOrText = use_Text then
        s := ReplaceStr(s, '<TEXT>', txO.Text)
      else
      begin
        if txO.Variable.Trim.IsEmpty then
          s := ReplaceStr(s, '<TEXT>', txO.Text)
        else
          s := ReplaceStr(s, '<TEXT>', txO.Variable);
      end;
    end
    else
    if (TObject(fZPLObjects[I]) is TZPLBarcodeObject) then
    begin
      BC := TZPLBarcodeObject(fZPLObjects[I]);
      BC.Orientation := self.Orientation;
      R := BC.DPIDimensions;
      s := StrPosition(BC.ZPLCommand, R);
      //s := strWidthHeight(s, R);
      s := BC1d_StrHeight(s, R);

      case BC.BarcodeType of
        bcAztec:  s := s.Replace('<ORIENTATION>', LocalGetOrientationChar); {TODO -oOwner -cGeneral : Por confirmar la rotacion}
        bcCodeQR: s := s.Replace('<ORIENTATION>', LocalGetQROrientationChar);
        bcCode39:
        begin
          //Get Module width accordint to the number of characters in text
          ii := (Length(BC.Text) + 3) * 10; //add 2 due to *TEXT* 5 black bars + 5 white bars = 10
          s := s.Replace('<ORIENTATION>', LocalGetOrientationChar); {TODO -oOwner -cGeneral : Por confirmar la rotacion}

          iJ := R.Right; //Does not matter the orientation always yse Right as the size of the BC

          ii := ij div ii;
          if ii > 10 then
            ii := 10;

          s := s.Replace('<MODULE_WIDTH>',  ii.ToString);
          s := s.Replace('<WIDTH_RATIO>', '2.0');
        end;
      end;

      s := Replacestr(s, '<MAGNIFICATION>', BC.Magnification.ToString);
      {case BarcodeType of
        bcAztec:  s := Replacestr(s, '<MAGNIFICATION>', inttoStr(ij div 50)); //default value for 200dpi printers is 2;
        bcCodeQR: s := Replacestr(s, '<MAGNIFICATION>', inttoStr(Round((ij / ((Length(Text) + 2) * (Printer_DPI / 15))    )) ) ); //default value for 200dpi printers is 2; 5Chars / Inch
        bcCode39: s := Replacestr(s, '<MAGNIFICATION>', inttoStr(Round((ij / ((Length(Text) + 2.3) * (Printer_DPI / 13) ) )) ) ); //13 bars per character plus 2 chars for begin and end
      end;}

      s := s.Replace('<EXTENDED_CHANNEL>', getExtendedChannelStr(zeNo));
      s := s.Replace('<ERROR_AND_SYMBOL_TYPE>', '0'); //view U_ZPLTypes for possible errors
      s := s.Replace('<MENU_INDICATOR>', getMenuIndicatorStr(zmNo));

      s := s.Replace('<SHOW_TEXT>', YesNo(BC.ShowText));
      s := s.Replace('<SHOW_TEXT_ABOVE>', 'N');

      if UseVariableOrText = use_text then
        aText := BC.Text
      else
        aText := BC.Variable;

      var CL: string := 'M'; //default
      case BC.CorrectionLevel of
        CLUltraHigh: CL := 'H';
        CLHighRel: CL := 'Q';
        CLStandard: CL := 'M';
        CLHighDensity: CL := 'L';
      end;

      if BC.BarCodeType = bcCodeQR then
        s := s.Replace('<TEXT>', CL + 'A,' + trim(aText) ) //Q=Error correction level A=Automatic correction mode for QRCode
      else
        s := s.Replace('<TEXT>', trim(aText) );

      //DEFAULT VALUES FOR QR BAR CODE
      s := s.Replace('<NUMBER_OF_SYMBOLS>' , '1');
      s := s.Replace('<STRUCTURED_APPEND>' , '' ); //Remove it by default is empty
      s := s.Replace('<MOD_43_CHECK_DIGIT>' , 'Y' ); //Remove it by default is empty

      s := s.Replace('<MODEL>', '2'); //1(Original) 2(Enhanced - default)
      s := s.Replace('<ERROR_CORRECTION>', 'M'); //H = ultra-high reliability level
                                                 //Q = high reliability level
                                                 //M = standard level
                                                 //L = high density level
      s := s.Replace('<MASK_VALUE>', '7'); //0-7 (Default 7)

    end
    else
    if (TObject(fZPLObjects[I]) is TZPLFormObject) then
    begin
      zpO := TZPLFormObject(fZPLObjects[I]);
      zpO.Orientation := self.Orientation;
      R := zpO.DPIDimensions;
      s := zpO.ZPLCommand;

      s := StrPosition(s, R);
      s := strWidthHeight(s, R);
      s := ReplaceStr(s, '<BORDERTHICK>', IntToStr(zpO.BorderThickness));
    end;

    fZPLText.Add(s);
  end;


  if Self.LeftShift <> 0 then //Restore LeftShift
    fZPLText.Add('^LS0');
  if Self.TopShift <> 0 then //Restore TopShift
    fZPLText.Add('^LT0');

  fZPLText.Add(Self.EndCommand); //End script
  Result := fZPLText.Text;
  fZPLText.Free;

  ReturnPrinter;
end;

{ TZPLBarcodeObject }

procedure TZPLBarcodeObject.Assign(Source: TZPLObject);
begin
  inherited;
  BarcodeType := TZPLBarcodeObject(Source).BarcodeType;
  Text := TZPLBarcodeObject(Source).Text;
  ShowText := TZPLBarcodeObject(Source).ShowText;
end;

constructor TZPLBarcodeObject.Create(AOwner: TComponent);
begin
  inherited;
  FObjectKind := okBarCode;
  fBarcodeType := bcAztec;
  Text := '123';
  fShowText := True;
end;

function TZPLBarcodeObject.GetZPLCommand: String;
var
  ZPLBarCode : String;
begin
  case fBarcodeType of
    bcAztec: ZPLBarCode := zplAztecBarCode;
    bcCode11: ZPLBarCode := zplCode11BarCode;
    bcCode39: ZPLBarCode := zplCode39BarCode;
    bcCodeQR : ZPLBarCode := zplCodeQRBarCode;
    bcCodeDM : ZPLBarCode := zplCodeDMBarCode;
  end;

  Result := FieldOrigin + ZPLBarCode + LineFeed + FieldData + FieldSeparator;

end;

procedure TZPLBarcodeObject.RefreshBMP;

  procedure ReplaceColor(OldColor, NewColor: TColor);
  var
    x, y: Integer;
  begin
    for y := 0 to BMPObject.Height - 1 do
    begin
      for x := 0 to BMPObject.Width - 1 do
        if BMPObject.Canvas.Pixels[x, y] = OldColor then
          BMPObject.Canvas.Pixels[x, y] := NewColor;
    end;
  end;


var
  W, H : Integer;
  R : TRect;
  s : String;
begin
  inherited;
  if not Assigned(BMPObject) then
    Exit;

  W := 100;
  H := 100;
  r := Rect(0,0, W, H);
  with BMPObject do
  begin
    Height := H;
    Width := W;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(r);
    Transparent := true;
    TransparentMode := tmFixed;
    TransparentColor := clWhite;
    case barcodeType of
      bcAztec: LoadFromResourceName(HInstance, 'BC_AZTEC');
      bcCode11: LoadFromResourceName(HInstance, 'BC_CODE11');
      bcCode39: LoadFromResourceName(HInstance, 'BC_CODE39');
      bcCodeQR: LoadFromResourceName(HInstance, 'BC_CODEQR');
      bcCodeDM: LoadFromResourceName(HInstance, 'BC_CODEDM');
    end;

    if not isVisible then
      ReplaceColor(clBlack, clSilver);

  end;
  fBMPDimensions := Point(W, H);
end;

procedure TZPLBarcodeObject.SetText(const Value: String);
begin
  FText := Value;
  RefreshBMP;
  Refresh;
end;

procedure TZPLBarcodeObject.SetVariable(const Value: String);
begin
  fVariable := Value;
end;

{ TZPLFormObject }

procedure TZPLFormObject.Assign(Source: TZPLObject);
begin
  inherited;
  ShapeType := TZPLFormObject(Source).ShapeType;
  BorderThickness := TZPLFormObject(Source).BorderThickness;
end;

constructor TZPLFormObject.Create(AOwner: TComponent);
begin
  inherited;
  FObjectKind := okForm;
  fShapeType := shRectangle;
  fThickness := 2;
end;

function TZPLFormObject.GetZPLCommand: String;
begin
  case ShapeType of
    shRectangle : Result := zplGraphicBox;
    shVertLine :
      if orientation = loPortrait then
        Result := zplVerticalLine
      else
        Result := zplHorizontalLine;
    shHorLine :
      if orientation = loPortrait then
        Result := zplHorizontalLine
      else
        Result := zplVerticalLine;

    shEllipse: Result := zplEllipse;
  end;

  Result := FieldOrigin + Result;
end;

procedure TZPLFormObject.RefreshBMP;
begin
  inherited;
  if not Assigned(BMPObject) then
    Exit;

  case ShapeType of //Add 3px per side in order to get more area for select the object
    shVertLine: Width := fThickness + 6;
    shHorLine: Height := fThickness + 6;
  end;

  with BMPObject do
  begin
    Width := Self.Width;
    Height := self.Height;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(ClientRect);
    Transparent := true;
    TransparentMode := tmFixed;
    TransparentColor := clWhite;

    if isVisible then
      Canvas.Pen.Color := clBlack
    else
      Canvas.Pen.Color := clSilver;

    Canvas.Pen.Width := fThickness;
    case ShapeType of
      shRectangle: Canvas.Rectangle(1,1, Width-1, Height-1);
      shVertLine:
      begin
        Canvas.MoveTo( Width div 2, 3);
        Canvas.LineTo( Width div 2, Height-3);
      end;
      shHorLine:
      begin
        Canvas.MoveTo( 3, Height div 2);
        Canvas.LineTo( Width - 3, Height div 2);
      end;

      shEllipse: Canvas.Ellipse(1,1, Width-1, Height-1);
    end;
  end;
  fBMPDimensions := Point(Width, Height);
end;

procedure TZPLFormObject.setShapeType(const Value: TShapeType);
begin
  if (ShapeType in [shVertLine, shHorLine]) //If it was a line
    and (ShapeType <> Value) then
  begin
    case Value of
      shRectangle, shEllipse:
      begin
        Width := 50;
        Height := 50;
      end;
      shHorLine: Width := Height;
      shVertLine: Height := Width;
    end;
  end;

  fShapeType := Value;
end;

initialization

end.
