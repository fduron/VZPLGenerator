unit U_ZPLAlignment;

interface
uses U_ZPLObjects;

type
  TZPLObjectsAlignment = class
    private
    fDocument: TZPLDocument;
    protected
      function GetMinLeft : Integer;
      function GetMaxRight : Integer;
      function GetMaxBottom : Integer;
      function GetMinTop : Integer;
      function MaxHeight : Integer;
      function MaxWidth : Integer;
    public
    published
      constructor create(ZPLDocument: TZPLDocument); overload;
      destructor destroy;
      procedure AlignLeft;
      procedure AlignRight;
      procedure AlignBottom;
      procedure AlignTop;
      procedure AlignVerticalCenters;
      procedure AlignHorizontalCenters;
      procedure SameHeight;
      procedure SameWidth;
      procedure SameSize;
  end;

implementation

{ TZPLObjectsAlignment }

procedure TZPLObjectsAlignment.AlignBottom;
var
  z : TZPLObject;
  iMaxBottom : Integer;
begin
  iMaxBottom := GetMaxBottom;

  for z in fDocument.SelectedObjects do
    z.Top := iMaxBottom - z.Height;
end;

procedure TZPLObjectsAlignment.AlignHorizontalCenters;
var
  z : TZPLObject;
  iMinLeft,
  iMaxRight,
  iMiddle : Integer;

begin
  iMinLeft := GetMinLeft;
  iMaxRight := GetMaxRight;
  iMiddle := iMinLeft + ( (iMaxRight - iMinLeft) div 2 );

  for z in fDocument.SelectedObjects do
    z.Left := iMiddle - (z.Width div 2);

end;

procedure TZPLObjectsAlignment.AlignLeft;
var
  z : TZPLObject;
  iMinLeft : Integer;
begin
  iMinLeft := GetMinLeft;

  for z in fDocument.SelectedObjects do
    z.Left := iMinLeft;
end;

procedure TZPLObjectsAlignment.AlignRight;
var
  z : TZPLObject;
  iMaxRight : Integer;
begin
  iMaxRight := GetMaxRight;

  for z in fDocument.SelectedObjects do
    z.Left := iMaxRight - z.Width;
end;

procedure TZPLObjectsAlignment.AlignTop;
var
  z : TZPLObject;
  iMinTop : Integer;
begin
  iMinTop := GetMinTop;

  for z in fDocument.SelectedObjects do
    z.Top := iMinTop;
end;

procedure TZPLObjectsAlignment.AlignVerticalCenters;
var
  z : TZPLObject;
  iMinTop,
  iMaxBottom,
  iMiddle : Integer;

begin
  iMinTop := GetMinTop;
  iMaxBottom := GetMaxBottom;
  iMiddle := iMinTop + ( (iMaxBottom - iMinTop) div 2 );

  for z in fDocument.SelectedObjects do
    z.Top := iMiddle - (z.Height div 2);
end;

constructor TZPLObjectsAlignment.create(ZPLDocument: TZPLDocument);
begin
  fDocument := ZPLDocument;
end;

destructor TZPLObjectsAlignment.destroy;
begin

end;

function TZPLObjectsAlignment.getMaxBottom: Integer;
var
  z : TZPLObject;
begin
  Result := -100000;
  for z in fDocument.SelectedObjects do
    if (z.Top + z.Height) > Result then
      Result := (z.Top + z.Height);
end;

function TZPLObjectsAlignment.GetMaxRight: Integer;
var
  z : TZPLObject;
begin
  Result := -100000;
  for z in fDocument.SelectedObjects do
    if (z.Left + z.Width) > Result then
      Result := z.Left + z.Width;
end;

function TZPLObjectsAlignment.GetMinLeft: Integer;
var
  z : TZPLObject;
begin
  Result := 100000;
  for z in fDocument.SelectedObjects do
    if z.Left < Result then
      Result := z.Left;
end;

function TZPLObjectsAlignment.GetMinTop: Integer;
var
  z : TZPLObject;
begin
  Result := 100000;
  for z in fDocument.SelectedObjects do
    if z.Top < Result then
      Result := z.Top;
end;

function TZPLObjectsAlignment.MaxHeight: Integer;
var
  z : TZPLObject;
begin
  Result := -100000;
  for z in fDocument.SelectedObjects do
    if z.Height > Result then
      Result := z.Height;
end;

function TZPLObjectsAlignment.MaxWidth: Integer;
var
  z : TZPLObject;
begin
  Result := -100000;
  for z in fDocument.SelectedObjects do
    if z.Width > Result then
      Result := z.Width;
end;

procedure TZPLObjectsAlignment.SameHeight;
var
  z : TZPLObject;
  MH : Integer;
begin
  MH := MaxHeight;

  for z in fDocument.SelectedObjects do
    z.Height := MH;
end;

procedure TZPLObjectsAlignment.SameSize;
begin

end;

procedure TZPLObjectsAlignment.SameWidth;
var
  z : TZPLObject;
  MW : Integer;
begin
  MW := MaxWidth;

  for z in fDocument.SelectedObjects do
    z.Width := MW;
end;

end.
