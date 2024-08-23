unit U_ZPLTypes;
////// https://www.zebra.com/content/dam/zebra/manuals/printers/common/programming/zpl-zbi2-pm-en.pdf
///
interface
 const
   FieldOrigin = '^FO<LEFT>,<TOP>';
   FieldData = '^FD<TEXT>';
   FieldSeparator = '^FS';

   FontCodeCode = '^A<FONT_NAME><FONT_FIELD_ORIENTATION>,<FONT_CHAR_HEIGHT>,<FONT_WIDTH>';
   // <FONT_NAME> = A through Z, and 0 to 9 Any font in the printer
   // <CHAR_HEIGHT> = in dots 10 - 32000
   //  <WIDTH> = in dots 10 - 32000

  //GB parameters: Width, Height, Border thickness, line color Black, Corner rounding degree
  zplGraphicBox = '^GB<WIDTH>,<HEIGHT>,<BORDERTHICK>,B,0^FS';
  zplHorizontalLine = '^GB<WIDTH>,0,<BORDERTHICK>,B,0^FS';
  zplVerticalLine = '^GB0,<HEIGHT>,<BORDERTHICK>,B,0^FS';

  zplEllipse = '^GE<WIDTH>,<HEIGHT>,<BORDERTHICK>,B^FS';

  zplAztecBarCode = '^B0<ORIENTATION>,<MAGNIFICATION>,<EXTENDED_CHANNEL>,<ERROR_AND_SYMBOL_TYPE>,<MENU_INDICATOR>,<NUMBER_OF_SYMBOLS>,<STRUCTURED_APPEND>';
  zplCode11BarCode = '^B1<ORIENTATION>,<CHECK_DIGIT>,<HEIGHT>,<SHOW_TEXT>,<SHOW_TEXT_ABOVE>';
  zplCode25BarCode = '^B2<ORIENTATION>,<HEIGHT>,<SHOW_TEXT>,<SHOW_TEXT_ABOVE>,<MOD_10_CHECK_DIGIT>';
  zplCode39BarCode = '^BY<MODULE_WIDTH>,<WIDTH_RATIO>,<BC_HEIGHT>^B3<ORIENTATION>,<MOD_43_CHECK_DIGIT>,<HEIGHT>,<SHOW_TEXT>,<SHOW_TEXT_ABOVE>';
  zplCodeQRBarCode = '^BQ<ORIENTATION>,<MODEL>,<MAGNIFICATION>,<ERROR_CORRECTION>,<MASK_VALUE>';
  zplCodeDMBarCode = '^BX<ORIENTATION>,<INDIVIDUAL_HEIGHT>,<QUALITY_LEVEL>,<COLUMNS_TO_ENCODE>,<ROWS_TO_ENCODE>,<FORMAT>,<ESC_SEQ>,<ASPECT_RATIO>';

type
  zplOrientation = (zoNormal, zoRotated90, zoInverted180, zoBottomUp); //Default Normal
  zplMagnification = (zmFactor1, zmFactor2, zmFactor3, zmFactor4, zmFactor5, zmFactor6, zmFactor7, zmFactor8, zmFactor9, zmFactor10);
  zplExtendedChannel = (zeYes, zeNo);
  //zplErrorAndSymbolType : 0 = default error correction level
  //                        l01 to 99 = error correction percentage (minimum)
  //                        101 to 104 = 1 to 4-layer compact symbol
  //                        201 to 232 = 1 to 32-layer full-range symbol
  //                        300 = a simple Aztec “Rune”
  zplMenuIndicator = (zmYes, zmNo);
  //zplNumSymbols =  1 .. 26
  zplModel = (zmOriginal, zmEnhaced); //Default zmEnhaced
  zplErrCorr = (zeUltraHigh, zeHighReliability, zeStandard, zeHighDensity);
  zplMaskValue = (zmValue1, zmValue2, zmValue3, zmValue4, zmValue5, zmValue6, zmValue7);

  function GetOrientationChar(zOrientation : zplOrientation) : Char;
  function GetModelChar(zModel : zplModel) : Char;
  function GetMagnificationStr(zMagnification : zplMagnification) : String;
  function getErrCorrChar(zErrCorr : zplErrCorr) : Char;
  function getMaskValueChar(zMaskValue : zplMaskValue) : Char;
  function getExtendedChannelStr(zExtChannel : zplExtendedChannel) : Char;
  function getMenuIndicatorStr(zMenuIndicator : zplMenuIndicator) : Char;

implementation

function GetOrientationChar(zOrientation : zplOrientation) : Char;
begin
  case zOrientation of
    zoNormal: Result:= 'N';
    zoRotated90: Result:= 'R';
    zoInverted180: Result:= 'I';
    zoBottomUp: Result:= 'B';
  end;
end;

function GetModelChar(zModel : zplModel) : Char;
begin
  case zModel of
    zmOriginal: Result := '1';
    zmEnhaced: Result := '2';
  end;
end;

function GetMagnificationStr(zMagnification : zplMagnification) : String;
begin
  case zMagnification of
    zmFactor1: Result := '1';
    zmFactor2: Result := '2';
    zmFactor3: Result := '3';
    zmFactor4: Result := '4';
    zmFactor5: Result := '5';
    zmFactor6: Result := '6';
    zmFactor7: Result := '7';
    zmFactor8: Result := '8';
    zmFactor9: Result := '9';
    zmFactor10: Result := '10';
  end;
end;

function getErrCorrChar(zErrCorr : zplErrCorr) : Char;
begin
  case zErrCorr of
    zeUltraHigh: Result := 'H';
    zeHighReliability: Result := 'Q';
    zeStandard: Result := 'M';
    zeHighDensity: Result := 'L';
  end;
end;

function getMaskValueChar(zMaskValue : zplMaskValue) : Char;
begin
  case zMaskValue of
    zmValue1: Result := '1';
    zmValue2: Result := '2';
    zmValue3: Result := '3';
    zmValue4: Result := '4';
    zmValue5: Result := '5';
    zmValue6: Result := '6';
    zmValue7: Result := '7';
  end;
end;

function getExtendedChannelStr(zExtChannel : zplExtendedChannel) : Char;
begin
  case zExtChannel of
    zeYes: result := 'Y';
    zeNo: result := 'N';
  end;
end;

function getMenuIndicatorStr(zMenuIndicator : zplMenuIndicator) : Char;
begin
  case zMenuIndicator of
    zmYes: result := 'Y';
    zmNo: result := 'N';
  end;
end;

end.
