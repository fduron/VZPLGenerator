object frmMain: TfrmMain
  Left = 0
  Top = 0
  Action = accForm
  Caption = 'ZPL Label designer'
  ClientHeight = 611
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mnu1
  ShowHint = True
  OnClick = accFormExecute
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  TextHeight = 13
  object Edit1: TEdit
    Left = 464
    Top = 200
    Width = 89
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object pcMain: TPageControl
    Left = 0
    Top = 30
    Width = 974
    Height = 562
    ActivePage = tsDesign
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object tsDesign: TTabSheet
      Caption = 'Design'
      object Splitter1: TSplitter
        Left = 778
        Top = 0
        Height = 536
        Align = alRight
        ExplicitLeft = 583
        ExplicitTop = 3
        ExplicitHeight = 526
      end
      object pnlWorkingArea: TPanel
        Left = 33
        Top = 0
        Width = 719
        Height = 536
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object P_HRuler: TPanel
          Left = 0
          Top = 0
          Width = 719
          Height = 17
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object pnlUnits: TPanel
            Left = 0
            Top = 0
            Width = 16
            Height = 17
            Align = alLeft
            BevelOuter = bvLowered
            Caption = 'C'
            TabOrder = 0
            OnClick = pnlUnitsClick
          end
        end
        object P_Main: TPanel
          Left = 0
          Top = 17
          Width = 719
          Height = 484
          Align = alClient
          BevelOuter = bvNone
          Caption = 'P_Main'
          TabOrder = 1
          object ScrollBox_: TScrollBox
            Tag = 1
            Left = 17
            Top = 0
            Width = 702
            Height = 484
            Align = alClient
            Color = clAppWorkSpace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object pnlPage: TPanel
              Left = 3
              Top = 3
              Width = 398
              Height = 576
              BevelKind = bkFlat
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              PopupMenu = pop1
              TabOrder = 0
              OnClick = pnlPageClick
            end
          end
          object P_VRuler: TPanel
            Left = 0
            Top = 0
            Width = 17
            Height = 484
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 501
          Width = 719
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          ShowCaption = False
          TabOrder = 2
          object cbxShowRect: TCheckBox
            Left = 16
            Top = 8
            Width = 126
            Height = 17
            Caption = 'Show object rect'
            TabOrder = 0
            OnClick = cbxShowRectClick
          end
        end
      end
      object tbAlignment: TToolBar
        Left = 752
        Top = 0
        Width = 26
        Height = 536
        Align = alRight
        Caption = 'Alignment'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = il1
        TabOrder = 1
        object ToolButton20: TToolButton
          Left = 0
          Top = 0
          Action = algLeft
          Wrap = True
        end
        object ToolButton21: TToolButton
          Left = 0
          Top = 22
          Action = algRight
          Wrap = True
        end
        object ToolButton22: TToolButton
          Left = 0
          Top = 44
          Action = algBottom
          Wrap = True
        end
        object ToolButton23: TToolButton
          Left = 0
          Top = 66
          Action = algTop
        end
        object ToolButton30: TToolButton
          Left = 0
          Top = 66
          Width = 8
          Caption = 'ToolButton30'
          ImageIndex = 25
          Wrap = True
          Style = tbsSeparator
        end
        object ToolButton24: TToolButton
          Left = 0
          Top = 96
          Action = algVertical
          Wrap = True
        end
        object ToolButton25: TToolButton
          Left = 0
          Top = 118
          Action = algHorizontal
        end
        object ToolButton28: TToolButton
          Left = 0
          Top = 118
          Width = 8
          Caption = 'ToolButton28'
          ImageIndex = 24
          Wrap = True
          Style = tbsSeparator
        end
        object ToolButton26: TToolButton
          Left = 0
          Top = 148
          Action = algHeight
          Wrap = True
        end
        object ToolButton27: TToolButton
          Left = 0
          Top = 170
          Action = algWidth
        end
        object ToolButton29: TToolButton
          Left = 0
          Top = 170
          Width = 8
          Caption = 'ToolButton29'
          ImageIndex = 24
          Wrap = True
          Style = tbsSeparator
        end
        object ToolButton31: TToolButton
          Left = 0
          Top = 200
          Action = algSameSize
        end
      end
      object Panel2: TPanel
        Left = 781
        Top = 0
        Width = 185
        Height = 536
        Align = alRight
        TabOrder = 2
        object vlProperties: TValueListEditor
          Left = 1
          Top = 18
          Width = 183
          Height = 517
          Align = alClient
          DisplayOptions = [doAutoColResize, doKeyColFixed]
          FixedCols = 1
          KeyOptions = [keyUnique]
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goThumbTracking]
          Strings.Strings = (
            '')
          TabOrder = 0
          StyleName = 'Windows'
          OnSetEditText = vlPropertiesSetEditText
          ColWidths = (
            83
            94)
        end
        object hdrSelected: THeaderControl
          Left = 1
          Top = 1
          Width = 183
          Height = 17
          Sections = <
            item
              ImageIndex = -1
              Text = 'Nothing selected'
              Width = 500
            end>
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 33
        Height = 536
        Align = alLeft
        ButtonHeight = 23
        Caption = 'Objects'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = il1
        List = True
        TabOrder = 3
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = accLabel
          Wrap = True
        end
        object ToolButton2: TToolButton
          Left = 0
          Top = 23
          Action = accBarcode
        end
        object ToolButton3: TToolButton
          Left = 0
          Top = 23
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Wrap = True
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 0
          Top = 54
          Caption = 'Insert form'
          DropdownMenu = popForms
          ImageIndex = 2
          Wrap = True
          OnClick = ActionInsertZPLObject
        end
      end
    end
    object tsZPLScript: TTabSheet
      Caption = 'ZPL Code'
      ImageIndex = 1
      OnShow = tsZPLScriptShow
      object Panel3: TPanel
        Left = 0
        Top = 495
        Width = 966
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        object cbUseVariables: TCheckBox
          Left = 16
          Top = 8
          Width = 126
          Height = 17
          Caption = 'Use variables'
          TabOrder = 0
          OnClick = tsZPLScriptShow
        end
      end
      object reZPLCode: TRichEdit
        Left = 0
        Top = 0
        Width = 966
        Height = 495
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'reZPLCode')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  object stbMain: TStatusBar
    Left = 0
    Top = 592
    Width = 974
    Height = 19
    Panels = <
      item
        Text = 'M'
        Width = 20
      end
      item
        Text = 'Txt'
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 756
    Top = 379
    Width = 610
    Height = 269
    Caption = 'Panel1'
    TabOrder = 3
    Visible = False
    object mUndo: TMemo
      Left = 16
      Top = 26
      Width = 585
      Height = 119
      Lines.Strings = (
        'mUndo')
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object mRedo: TMemo
      Left = 16
      Top = 151
      Width = 585
      Height = 106
      Lines.Strings = (
        'mRedo')
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
    object Button1: TButton
      Left = 16
      Top = 0
      Width = 186
      Height = 20
      Caption = 'historial de deshacer'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 974
    Height = 30
    ButtonHeight = 25
    Caption = 'Standard'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = il1
    TabOrder = 4
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Action = FileOpen1
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 0
      Action = FileSave1
    end
    object ToolButton13: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 54
      Top = 0
      Action = accCopy
    end
    object ToolButton8: TToolButton
      Left = 77
      Top = 0
      Action = accCut
    end
    object ToolButton9: TToolButton
      Left = 100
      Top = 0
      Action = accPaste
    end
    object ToolButton10: TToolButton
      Left = 123
      Top = 0
      Action = accDelete
    end
    object ToolButton12: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 154
      Top = 0
      Action = EditUndoCommand
    end
    object ToolButton19: TToolButton
      Left = 177
      Top = 0
      Action = EditRedoCommand
    end
    object ToolButton14: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton15: TToolButton
      Left = 208
      Top = 0
      Action = accBringToFront
    end
    object ToolButton16: TToolButton
      Left = 231
      Top = 0
      Action = accSendToBack
    end
    object ToolButton18: TToolButton
      Left = 254
      Top = 0
      Width = 8
      Caption = 'ToolButton18'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ToolButton17: TToolButton
      Left = 262
      Top = 0
      Action = accPrint
    end
  end
  object al1: TActionList
    Images = il1
    Left = 48
    Top = 64
    object accForm: TAction
      Caption = 'ZPL Label designer'
      OnExecute = accFormExecute
    end
    object accLabel: TAction
      Caption = 'Insert label'
      ImageIndex = 0
      OnExecute = ActionInsertZPLObject
    end
    object accBarcode: TAction
      Caption = 'Insert barcode'
      ImageIndex = 1
      OnExecute = ActionInsertZPLObject
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndoCommand: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 6
      ShortCut = 16474
      OnExecute = EditUndoCommandExecute
    end
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Dialog.DefaultExt = '.vlb'
      Dialog.Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
      Dialog.Title = 'Open ZPL Label'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 8
      ShortCut = 16463
      OnAccept = FileOpen1Accept
      OnUpdate = FileOpen1Update
    end
    object FileSave1: TAction
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save|Saves the active file'
      ImageIndex = 9
      OnExecute = FileSave1Execute
    end
    object FileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.DefaultExt = '.zpl'
      Dialog.Filter = 'ZPL Label files (*.zlb)|*.zlb|All files|*.*'
      Dialog.Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
      Dialog.Title = 'Save label'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 9
      OnAccept = FileSaveAs1Accept
    end
    object FilePrintSetup1: TFilePrintSetup
      Category = 'File'
      Caption = 'Print Set&up...'
      Hint = 'Print Setup'
      OnAccept = FilePrintSetup1Accept
    end
    object FilePageSetup1: TFilePageSetup
      Category = 'File'
      Caption = 'Page Set&up...'
      Dialog.MinMarginLeft = 0
      Dialog.MinMarginTop = 0
      Dialog.MinMarginRight = 0
      Dialog.MinMarginBottom = 0
      Dialog.MarginLeft = 2500
      Dialog.MarginTop = 2500
      Dialog.MarginRight = 2500
      Dialog.MarginBottom = 2500
      Dialog.PageWidth = 21590
      Dialog.PageHeight = 27940
    end
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 10
    end
    object accBringToFront: TAction
      Category = 'Edit'
      Caption = 'Bring to front'
      Hint = 'Bring to front'
      ImageIndex = 12
      ShortCut = 16417
      OnExecute = accBringToFrontExecute
    end
    object accSendToBack: TAction
      Category = 'Edit'
      Caption = 'Send to back'
      Hint = 'Send to back'
      ImageIndex = 11
      ShortCut = 16418
      OnExecute = accSendToBackExecute
    end
    object accPrint: TAction
      Category = 'File'
      Caption = 'Print'
      Hint = 'Send ZPL Script to printer'
      ImageIndex = 13
      ShortCut = 16464
      OnExecute = accPrintExecute
    end
    object accCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut to clipboard|Cut selected objets to clipboard'
      ImageIndex = 3
      ShortCut = 16472
      OnExecute = accCutExecute
    end
    object accCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copy the selected objects to clipboard'
      ImageIndex = 4
      ShortCut = 16451
      OnExecute = accCopyExecute
    end
    object accPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Paste objects from clipboard'
      ImageIndex = 5
      ShortCut = 16470
      OnExecute = accPasteExecute
    end
    object accDelete: TAction
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Delete the selected objects'
      ImageIndex = 7
      ShortCut = 46
      OnExecute = accDeleteExecute
    end
    object EditRedoCommand: TAction
      Category = 'Edit'
      Caption = 'Redo'
      ImageIndex = 15
      OnExecute = EditRedoCommandExecute
    end
    object algLeft: TAction
      Category = 'Alignment'
      Caption = 'Align left'
      Hint = 'Align left edges'
      ImageIndex = 16
      OnExecute = algExecute
    end
    object algRight: TAction
      Category = 'Alignment'
      Caption = 'algRight'
      Hint = 'Align right edges'
      ImageIndex = 17
      OnExecute = algExecute
    end
    object algBottom: TAction
      Category = 'Alignment'
      Caption = 'algBottom'
      Hint = 'Align bottom edges'
      ImageIndex = 18
      OnExecute = algExecute
    end
    object algTop: TAction
      Category = 'Alignment'
      Caption = 'algTop'
      Hint = 'Align top edges'
      ImageIndex = 19
      OnExecute = algExecute
    end
    object algVertical: TAction
      Category = 'Alignment'
      Caption = 'algVertical'
      Hint = 'Align vertical centers'
      ImageIndex = 20
      OnExecute = algExecute
    end
    object algHorizontal: TAction
      Category = 'Alignment'
      Caption = 'algHorizontal'
      Hint = 'Align horizontal centers'
      ImageIndex = 21
      OnExecute = algExecute
    end
    object algHeight: TAction
      Category = 'Alignment'
      Caption = 'algHeight'
      Hint = 'Make same height'
      ImageIndex = 22
      OnExecute = algExecute
    end
    object algWidth: TAction
      Category = 'Alignment'
      Caption = 'algWidth'
      Hint = 'Make same width'
      ImageIndex = 23
      OnExecute = algExecute
    end
    object algSameSize: TAction
      Category = 'Alignment'
      Caption = 'algSameSize'
      Hint = 'Make same size'
      ImageIndex = 24
      OnExecute = algExecute
    end
    object FileNew1: TAction
      Category = 'File'
      Caption = 'New'
      ImageIndex = 14
      OnExecute = FileNew1Execute
    end
    object accLock: TAction
      Caption = 'Lock'
      ImageIndex = 25
      OnExecute = accLockExecute
    end
    object accUnlock: TAction
      Caption = 'Unlock'
      ImageIndex = 26
      OnExecute = accLockExecute
    end
    object accInsertRect: TAction
      Tag = 10
      Caption = 'Rectangle'
      ImageIndex = 27
      OnExecute = ActionInsertZPLObject
    end
    object accInsertVLine: TAction
      Tag = 10
      Caption = 'Vertical line'
      ImageIndex = 30
      OnExecute = ActionInsertZPLObject
    end
    object accInsertHLine: TAction
      Tag = 10
      Caption = 'Horizontal line'
      ImageIndex = 29
      OnExecute = ActionInsertZPLObject
    end
    object accInsertEllipse: TAction
      Tag = 10
      Caption = 'Ellipse'
      ImageIndex = 28
      OnExecute = ActionInsertZPLObject
    end
  end
  object mnu1: TMainMenu
    Images = il1
    Left = 88
    Top = 64
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Action = FileNew1
      end
      object Open1: TMenuItem
        Action = FileOpen1
      end
      object N5: TMenuItem
        Action = FileSave1
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object SaveAs1: TMenuItem
        Action = FileSaveAs1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PageSetup1: TMenuItem
        Action = FilePageSetup1
      end
      object PrintSetup1: TMenuItem
        Action = FilePrintSetup1
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = FileExit1
      end
    end
    object Edit4: TMenuItem
      Caption = 'Edit'
      object Copy1: TMenuItem
        Action = accCopy
      end
      object Cut1: TMenuItem
        Action = accCut
      end
      object Paste1: TMenuItem
        Action = accPaste
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Delete1: TMenuItem
        Action = accDelete
      end
      object SelectAll1: TMenuItem
        Action = EditSelectAll1
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Undo1: TMenuItem
        Action = EditUndoCommand
      end
    end
  end
  object pop1: TPopupMenu
    Images = il1
    Left = 217
    Top = 78
    object Lock1: TMenuItem
      Action = accBringToFront
    end
    object Sendtoback1: TMenuItem
      Action = accSendToBack
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Copy2: TMenuItem
      Action = accCopy
    end
    object Cut2: TMenuItem
      Action = accCut
    end
    object Paste2: TMenuItem
      Action = accPaste
    end
    object Delete2: TMenuItem
      Action = accDelete
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = accLock
    end
    object Unlock1: TMenuItem
      Action = accUnlock
    end
  end
  object il1: TImageList
    ColorDepth = cd32Bit
    Left = 152
    Top = 80
    Bitmap = {
      494C01011F002800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001500000083000000CF000000F2000000F2000000D0000000840000
      0017000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0054000000F2000000FF000000FF000000FF000000FF000000FF000000FF0000
      00F2000000550000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000540000
      00FE000000FF000000B3000000400000000C0000000C0000003F000000B30000
      00FF000000FE0000005500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000016000000F10000
      00FF0000007B0000000000000000000000000000000000000000000000000000
      007B000000FF000000F200000017000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000084000000FF0000
      00B2000000000000000000000000000000000000000000000000000000000000
      0000000000B3000000FF00000084000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000D0000000FF0000
      0041000000000000000000000000000000000000000000000000000000000000
      00000000003F000000FF000000D0000000000000000000000080000000800000
      0080000000800000008000000080000000800000008000000080000000800000
      0080000000800000008000000080000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000F2000000FF0000
      000E000000000000000000000000000000000000000000000000000000000000
      00000000000C000000FF000000F20000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000F2000000FF0000
      000E000000000000000000000000000000000000000000000000000000000000
      00000000000C000000FF000000F2000000000000000000000080000000800000
      0080000000800000008000000080000000800000008000000080000000800000
      0080000000800000008000000080000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000CF000000FF0000
      0042000000000000000000000000000000000000000000000000000000000000
      000000000040000000FF000000CF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000083000000FF0000
      00B3000000000000000000000000000000000000000000000000000000000000
      0000000000B4000000FF00000083000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000014000000F00000
      00FF0000007B0000000000000000000000000000000000000000000000000000
      007B000000FF000000F200000015000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000520000
      00FE000000FF000000B3000000420000000E0000000E00000042000000B30000
      00FF000000FE0000005400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0052000000F0000000FF000000FF000000FF000000FF000000FF000000FF0000
      00F1000000530000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001400000083000000CF000000F2000000F2000000D0000000840000
      0016000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000FF0000008000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B4B4B004B4B4B000000
      00007A7A7A005353530053535300535353005353530053535300535353005353
      5300535353005353530053535300787878000000000000000000000000000000
      0000000000001094CE001094CE001094CE001094CE001094CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001094CE001094CE001094CE001094CE001094CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005353530000000000000000000000000042AD
      BD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094CE001094
      CE000000000000000000000000000000000000000000000000000000000042AD
      BD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094CE001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0053535300000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADEFF0042CE
      EF001094CE00000000000000000000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADEFF0042CE
      EF001094CE0000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00535353000000000042ADBD0042CEEF009CE7
      FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADEFF005ADE
      FF0042CEEF001094CE0000000000000000000000000042ADBD0042CEEF009CE7
      FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADEFF005ADE
      FF0042CEEF001094CE00000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00535353000000000042ADBD00ADF7FF009CE7
      FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7FF005ADE
      FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7FF009CE7
      FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7FF005ADE
      FF005ADEFF001094CE00000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00535353000000000042ADBD00ADF7FF00ADF7
      FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7FF009CE7
      FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7FF00ADF7
      FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7FF009CE7
      FF005ADEFF001094CE00000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00535353000000000042ADBD00ADF7FF00ADF7
      FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7FF009CE7
      FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7FF00ADF7
      FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7FF009CE7
      FF005ADEFF001094CE00000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FDFDFD00535353000000000042ADBD0042CEEF00ADF7
      FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7
      FF0042CEEF001094CE0000000000000000000000000042ADBD0042CEEF00ADF7
      FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7
      FF0042CEEF001094CE00000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0053535300000000000000000042ADBD0042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD00000000000000000000000000000000000000000042ADBD0042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF005353530000000000000000000000000042AD
      BD009CE7FF001094CE0000000000000000000000000042ADBD009CE7FF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042ADBD009CE7FF001094
      CE000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005353530000000000000000000000000042AD
      BD009CE7FF001094CE0000000000000000000000000042ADBD009CE7FF001094
      CE00000000000000000000000000000000000000000000000000000000001094
      CE001094CE001094CE0000000000000000000000000042ADBD009CE7FF001094
      CE000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B00000000000000
      000053535300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005353530000000000000000000000000042AD
      BD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CEEF001094
      CE000000000000000000000000000000000000000000000000000000000042AD
      BD009CE7FF001094CE0000000000000000000000000042ADBD009CE7FF001094
      CE000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00000000000000004B4B4B004B4B4B000000
      00007A7A7A005353530053535300535353005353530053535300535353005353
      53005353530053535300535353007A7A7A000000000000000000000000000000
      000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094CE000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD009CE7FF001094CE0000000000000000000000000042ADBD009CE7FF001094
      CE000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE00000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CEEF001094
      CE000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      00004B4B4B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B
      4B004B4B4B004B4B4B004B4B4B004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003399CC0000669900006699000066
      9900006699000066990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      000000000000000000000000000000000000000000004B4B4B00000000004B4B
      4B004B4B4B00000000004B4B4B004B4B4B00000000007C7C7C00585858005858
      58005858580058585800585858007C7C7C000000000000000000000000000000
      0000000000007C7C7C00585858005858580058585800585858007C7C7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      000000000000000000000000000000000000000000000000000000000000277F
      FF00000000000000000000000000000000000000000058585800FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00585858004B4B4B000000000000000000277F
      FF000000000058585800FDFDFD00FDFDFD00FDFDFD00FDFDFD00585858000000
      0000277FFF0000000000000000004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000003399CC0000669900006699000066
      9900006699000066990000669900006699000066990000669900006699000066
      9900006699000066990000669900006699000000000000000000277FFF00277F
      FF00277FFF000000000000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858000000000000000000277FFF00277F
      FF000000000058585800FFFFFF00CC996600CC996600FFFFFF00585858000000
      0000277FFF00277FFF0000000000000000000000000000000000993300009933
      0000993300009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF000066990000000000277FFF00277FFF00277F
      FF00277FFF00277FFF0000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858004B4B4B00277FFF00277FFF00277F
      FF00277FFF0058585800FFFFFF00CC996600CC996600FFFFFF0058585800277F
      FF00277FFF00277FFF00277FFF004B4B4B00000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0000669900000000000000000000000000277F
      FF00000000000000000000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858004B4B4B0000000000277FFF00277F
      FF000000000058585800FFFFFF00CC996600CC996600FFFFFF00585858000000
      0000277FFF00277FFF00000000004B4B4B00000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00006699007C7C7C0058585800585858005858
      580058585800585858007C7C7C00000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD0058585800000000000000000000000000277F
      FF000000000058585800FDFDFD00FDFDFD00FDFDFD00FDFDFD00585858000000
      0000277FFF00000000000000000000000000000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF000066990058585800FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD0058585800000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858004B4B4B0000000000000000000000
      0000000000007C7C7C00585858005858580058585800585858007C7C7C000000
      00000000000000000000000000004B4B4B00181818001818180099330000CC99
      6600CC9966009933000018181800181818003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990018181800181818003399CC003399CC003399CC003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC003399CC003399CC003399CC003399CC0058585800FDFDFD00CC996600CC99
      6600CC996600FDFDFD0058585800000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858004B4B4B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004B4B4B00000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      00000000000000000000000000000000000058585800FDFDFD00CC996600CC99
      6600CC996600FDFDFD0058585800000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      00000000000000000000000000000000000058585800FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD0058585800000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD00585858007C7C7C0058585800585858005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580058585800585858007C7C7C00000000000000000099330000CC99
      6600CC9966009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000007C7C7C0058585800585858005858
      580058585800585858007C7C7C00000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD005858580058585800FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00585858000000000000000000993300009933
      0000993300009933000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      000099330000CC996600CC996600CC996600CC996600CC996600CC996600CC99
      660099330000000000000000000000000000000000000000000000000000277F
      FF00000000000000000000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD005858580058585800FFFFFF00577AB900577A
      B900577AB900577AB900577AB900577AB900577AB900577AB900577AB900577A
      B900577AB900577AB900FFFFFF00585858000000000000000000000000000000
      0000000000000000000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      000099330000CC996600CC996600CC996600CC996600CC996600CC996600CC99
      66009933000000000000000000000000000000000000277FFF00277FFF00277F
      FF00277FFF00277FFF0000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD005858580058585800FFFFFF00577AB900577A
      B900577AB900577AB900577AB900577AB900577AB900577AB900577AB900577A
      B900577AB900577AB900FFFFFF00585858000000000000000000000000000000
      0000000000000000000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000000000000000000000277FFF00277F
      FF00277FFF000000000000000000000000000000000058585800FDFDFD00577A
      B900577AB900577AB900FDFDFD005858580058585800FFFFFF00577AB900577A
      B900577AB900577AB900577AB900577AB900577AB900577AB900577AB900577A
      B900577AB900577AB900FFFFFF00585858000000000000000000000000000000
      0000000000000000000000000000000000003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF000066990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      000000000000000000000000000000000000000000000000000000000000277F
      FF00000000000000000000000000000000000000000058585800FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD005858580058585800FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00585858000000000000000000000000000000
      0000000000000000000000000000000000003399CC003399CC003399CC003399
      CC003399CC003399CC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180000000000000000000000
      000000000000000000000000000000000000000000004B4B4B00000000004B4B
      4B004B4B4B00000000004B4B4B004B4B4B00000000007C7C7C00585858005858
      58005858580058585800585858007C7C7C007C7C7C0058585800585858005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580058585800585858007C7C7C000000000000000000000000000000
      000000000000277FFF00277FFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000277FFF00277F
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000277FFF00277FFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000277F
      FF00277FFF000000000000000000000000001D1D1D001D1D1D001D1D1D001D1D
      1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D
      1D001D1D1D001D1D1D001D1D1D001D1D1D000000000000000000000000000000
      0000000000003399CC0000669900006699000066990000669900000000000000
      000000000000000000000000000000000000000000000000000000000000277F
      FF00277FFF00277FFF00277FFF00277FFF00277FFF00277FFF00277FFF00277F
      FF00277FFF000000000000000000000000000000000000000000000000000000
      0000277FFF00277FFF00277FFF00277FFF00277FFF00277FFF00277FFF00277F
      FF00277FFF00277FFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000277FFF00277FFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000277F
      FF00277FFF000000000000000000000000009933000099330000993300009933
      0000000000003399CC0000669900006699000066990000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000000000
      000000000000277FFF00277FFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000277FFF00277F
      FF000000000000000000000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      0000277FFF00277FFF00277FFF00000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF000066990000000000277F
      FF00277FFF00277FFF00277FFF00277FFF009933000099330000993300009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000003399
      CC00006699000066990000669900006699000066990000669900006699000066
      99000066990000669900006699000000000000000000000000003399CC000066
      9900006699000066990000669900006699000066990000669900006699000066
      99000066990000669900000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF000066990000000000277F
      FF0000000000277FFF0000000000277FFF0099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00006699000000000000000000000000003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0000669900000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF00000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00006699000000000000000000000000003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0000669900000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF00000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00006699000000000000000000000000003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0000669900000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF00000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF000066990000000000277F
      FF0000000000277FFF0000000000277FFF000000000000000000000000003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC003399CC003399CC003399CC000000000000000000000000003399CC003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC003399CC003399CC0000000000000000009933000099330000993300009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF00000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF000066990000000000277F
      FF00277FFF00277FFF00277FFF00277FFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF00000000000000000099330000CC996600CC9966009933
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      0000277FFF00277FFF00277FFF00000000000000000000000000000000009933
      0000993300009933000099330000993300009933000099330000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      000000000000277FFF0000000000000000009933000099330000993300009933
      0000000000003399CC003399CC003399CC003399CC003399CC00000000000000
      000000000000277FFF0000000000000000000000000000000000000000009933
      0000CC996600CC996600CC996600CC996600CC996600CC996600993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC996600CC996600CC996600CC996600CC99
      6600CC9966009933000000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF0099FFFF0099FFFF0000669900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC996600CC996600CC996600CC996600CC996600CC996600993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC996600CC996600CC996600CC996600CC99
      6600CC9966009933000000000000000000000000000000000000000000000000
      0000000000003399CC003399CC003399CC003399CC003399CC00000000000000
      0000000000000000000000000000000000001D1D1D001D1D1D001D1D1D001D1D
      1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D1D001D1D
      1D001D1D1D001D1D1D001D1D1D001D1D1D000000000000000000000000009933
      0000993300009933000099330000993300009933000099330000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600CC99660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000000000000000000000000000000000
      000000000000000000006C6C6C006C6C6C004D4D4D004D4D4D00000000000000
      0000000000000000000000000000000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC99660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000000000000000000000000000000000
      00006C6C6C006C6C6C00A3A3A300A3A3A3006C6C6C006C6C6C004D4D4D004D4D
      4D00000000000000000000000000000000000000000000000000CC996600FFFF
      FF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500FFFFFF00CC99660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003399
      CC00006699000066990000669900006699000066990000669900006699000066
      9900CC996600CC996600993300000000000000000000000000006C6C6C006C6C
      6C00A3A3A300A3A3A300C0C0C000C0C0C00080808000808080006C6C6C006C6C
      6C004D4D4D004D4D4D0000000000000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC99660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      9900CC996600CC996600993300000000000000000000BBBBBB00A3A3A300A3A3
      A300C0C0C000C0C0C000C0C0C000FDFDFD008080800080808000808080008080
      80006C6C6C006C6C6C004D4D4D00000000000000000000000000CC996600FFFF
      FF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500FFFFFF00CC99660000000000000000000000000000000000000000009933
      0000CC9966000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      9900CC996600CC996600993300000000000041414100DCDCDC00C0C0C000C0C0
      C000B7B7B700FDFDFD00FDFDFD00C0C0C000FDFDFD00C0C0C000808080008080
      8000808080006C6C6C004D4D4D00000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC99660000000000000000000000000000000000CC9966009933
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300009933000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      99009933000099330000993300000000000041414100DCDCDC00C0C0C000DCDC
      DC00DCDCDC00C0C0C000C0C0C0004848FF00C0C0C000C0C0C000C0C0C000C0C0
      C000808080006C6C6C004D4D4D00000000000000000000000000CC996600FFFF
      FF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500FFFFFF00CC99660000000000000000000000000000000000993300000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000000000000000000009933000099330000993300003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      9900000000000000000000000000000000005B5B5B00DCDCDC00DCDCDC00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000808080000000
      0000C0C0C000A3A3A3004D4D4D00000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC99660000000000000000000000000000000000993300000000
      0000000000000000000000000000000000000000000000000000000000009933
      00009933000099330000000000000000000099330000CC996600CC9966003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      990000000000000000000000000000000000000000005B5B5B005B5B5B00C0C0
      C000C0C0C000C0C0C000C0C0C0008080800080808000D8D8D800B7B7B7000000
      0000757575000000000000000000000000000000000000000000CC996600FFFF
      FF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500FFFFFF00CC99660000000000000000000000000000000000993300000000
      0000000000000000000000000000000000000000000000000000993300000000
      00009933000099330000000000000000000099330000CC996600CC9966003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      9900000000000000000000000000000000000000000000000000000000005B5B
      5B0041414100C0C0C00080808000D8D8D800D8D8D80000000000D8D8D800D8D8
      D800000000000000000000000000000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC99660000000000000000000000000000000000CC9966009933
      0000000000000000000000000000000000009933000099330000000000000000
      00000000000099330000000000000000000099330000CC996600CC9966003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF000066
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000004141410000000000D8D8D800000000000000000000000000D8D8
      D800D8D8D8000000000000000000000000000000000000000000CC996600FFFF
      FF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500FFFFFF00CC996600CC99
      6600CC996600CC9966000000000000000000000000000000000000000000CC99
      6600993300009933000099330000993300000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC9966003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D80000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC996600E5E5
      E500CC9966000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC996600CC99
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC9966000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EFF100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      000099330000993300009933000000000000000000000000000000000000E2EF
      F100E5E5E500CCCCCC00E5E5E500E2EFF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      000099330000993300009933000000000000000000003399CC00006699000066
      9900006699000066990000669900006699000066990000669900006699000066
      990066CCCC000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC660000993300000000000000000000E2EFF100E5E5E500B2B2
      B200CC9999009966660099666600B2B2B200CCCCCC00E5E5E500E2EFF1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000003399CC003399CC0099FFFF0066CC
      FF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF003399
      CC00006699000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC6600009933000000000000E5E5E500CC99990099666600CC99
      9900CC999900FFFFFF00996666009999990099999900B2B2B200E5E5E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000003399CC003399CC0066CCFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF00006699003399CC0000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC660000993300000000000099666600CC999900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600336699003366990033669900E2EFF1000000
      0000000000000000000000000000000000000000000000000000000000003399
      CC000066990000669900006699000066990099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000003399CC003399CC0066CCFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0066CCCC000066990000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC660000993300000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660066CCCC0066CCCC000099CC00FFFFFF00FFCC
      CC00000000000000000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0099FFFF00006699003399CC00000000000000000099330000CC660000CC66
      0000CC660000993300009933000099330000993300009933000099330000CC66
      0000CC660000CC660000993300000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660066CCCC0066CCFF003399CC00FFCCCC00CC66
      0000000000000000000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000003399CC0066CCFF0066CCCC0066CC
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0099FFFF0066CCCC0000669900000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC660000993300000000000099666600FFCC9900CC999900CC99
      6600FFCCCC00FFFFFF009966660099CCCC0099CCFF00B2B2B200FF660000CC66
      0000000000000000000000000000000000000000000000000000000000003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF009933000099330000993300009933
      0000993300009933000099330000000000003399CC0099FFFF0066CCFF003399
      CC00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF0099FF
      FF00CCFFFF00CCFFFF0000669900000000000000000099330000CC660000CC66
      0000993300009933000099330000993300009933000099330000993300009933
      0000CC660000CC660000993300000000000099666600FFCC990099666600FFFF
      FF00FFCCCC00FFFFFF009966660099CCCC00C0C0C000CC660000CC660000CC66
      0000CC660000CC660000CC660000000000009933000099330000993300009933
      000099330000993300009933000099FFFF0099FFFF0099FFFF0099FFFF000066
      9900000000000000000000000000000000003399CC0099FFFF0099FFFF0066CC
      FF003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC003399CC003399CC0066CCFF00000000000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC660000993300000000000099666600FFCC9900CC9999009966
      6600FFCCCC00FFFFFF009966660000000000CC660000CC660000CC660000CC66
      0000CC660000CC660000CC6600000000000099330000CC996600CC996600CC99
      6600CC996600CC9966009933000099FFFF0099FFFF0099FFFF0099FFFF000066
      9900000000000000000000000000000000003399CC00CCFFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF000066
      9900000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00993300009933000099330000993300009933000099330000FFFF
      FF0099330000CC660000993300000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660000000000CC999900CC660000CC660000CC66
      0000CC660000CC660000CC6600000000000099330000CC996600CC996600CC99
      6600CC996600CC9966009933000099FFFF0099FFFF0099FFFF0099FFFF000066
      990000000000000000000000000000000000000000003399CC00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF003399CC003399CC003399CC003399CC003399CC000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC660000993300000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600CCCCCC00E2EFF100CC999900FF660000CC66
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC9966009933000099FFFF0099FFFF0099FFFF0099FFFF000066
      99000000000000000000000000000000000000000000000000003399CC003399
      CC003399CC003399CC0000000000000000000000000000000000000000000000
      0000000000009933000099330000993300000000000099330000E5E5E5009933
      0000FFFFFF00993300009933000099330000993300009933000099330000FFFF
      FF009933000099330000993300000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660099CCCC000000000099CCCC00FFCC9900CC66
      00000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC996600993300003399CC003399CC003399CC003399CC003399
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC660000993300000000000099666600CC999900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600CCCCCC00000000003399CC0000000000FFCC
      99000000000000000000000000000000000099330000CC996600CC996600CC99
      6600CC996600CC99660099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000000000000000
      0000000000009933000000000000993300000000000099330000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      00009933000099330000993300000000000000000000C0C0C000CC996600CC99
      9900CCCC9900FFFFFF00996666000099CC000099CC000099CC00000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC00CC9999009966660099666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC00006699000066990000669900006699000066
      9900006699000066990000669900000000000000000000000000000000000000
      0000000000000000000000000000CC996600CC996600CC996600CC996600CC99
      6600CC996600CC996600CC996600CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000000000000000
      0000000000000000000000000000CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000006699000066
      9900006699000066990000669900CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003333CC000000
      FF00000099000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF000066990000000000000000003399CC0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003333CC003399
      FF000000FF000000990000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF000066990000000000000000003399CC00CCFFFF0099FF
      FF0099FFFF0099FFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      CC000066FF000000CC0000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000000000000CC996600CC996600CC99
      6600CC996600CC9966003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF000066990000000000000000003399CC0099FFFF00CCFF
      FF0099FFFF0099FFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      6600993300000000000000000000000000000000000000000000000000000000
      00000000CC000000FF0000009900000000000000000000000000000000000000
      FF000000990000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF000066990000000000000000003399CC00CCFFFF0099FF
      FF00CCFFFF0099FFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000993300009933
      0000993300009933000099330000000000000000000000000000000000000000
      000099330000CC99660000000000000000000000000000000000000000000000
      0000000000000000CC000000FF000000990000000000000000000000FF000000
      99000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC003399CC003399CC003399CC0000000000000000003399CC0099FFFF00CCFF
      FF0099FFFF00CCFFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC996600CC996600CC996600CC9966000000000000000000993300009933
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000009933000000000000000000000000000000000000000000000000
      000000000000000000000000CC000000FF00000099000000FF00000099000000
      00000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC00CCFFFF00006699000000000000000000000000003399CC00CCFFFF0099FF
      FF00CCFFFF0099FFFF00CCFFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC996600E5E5E500CC996600000000000000000000000000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000009933000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CC000000FF0000009900000000000000
      00000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC0000669900000000000000000000000000000000003399CC0099FFFF00CCFF
      FF0099FFFF00CCFFFF0099FFFF00CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CC996600CC99660000000000000000000000000000000000993300009933
      0000000000009933000000000000000000000000000000000000000000000000
      0000000000009933000000000000000000000000000000000000000000000000
      000000000000000000000000CC000000FF00000099000000CC00000099000000
      00000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC003399CC003399CC003399CC003399CC003399
      CC0000000000000000000000000000000000000000003399CC00CCFFFF0099FF
      FF00CCFFFF0099FFFF00CCFFFF00CC996600CC996600CC996600CC996600CC99
      6600CC9966000000000000000000000000000000000000000000993300000000
      0000000000000000000099330000993300000000000000000000000000000000
      000099330000CC99660000000000000000000000000000000000000000000000
      0000000000000000CC000000FF000000990000000000000000000000CC000000
      99000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC996600000000000000
      000000000000000000000000000000000000000000003399CC00CCFFFF00CCFF
      FF0099FFFF00CCFFFF0099FFFF00CCFFFF0099FFFF00CCFFFF0099FFFF0099FF
      FF00006699000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000CC9966000000000000000000000000000000000000000000000000000000
      CC000000FF000000FF0000009900000000000000000000000000000000000000
      CC000000990000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600CC996600CC996600CC996600000000000000
      000000000000000000000000000000000000000000003399CC00CCFFFF00CCFF
      FF00CC6600009933000099330000993300009933000099330000CCFFFF0099FF
      FF00006699000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CC003399
      FF000000FF000000990000000000000000000000000000000000000000000000
      00000000CC0000009900000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600E5E5E500CC99660000000000000000000000
      000000000000000000000000000000000000000000003399CC00CCFFFF00CCFF
      FF00CC660000FFFFFF00FF990000FF990000FF9900009933000099FFFF00CCFF
      FF00006699000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000666699000000
      CC00666699000000000000000000000000000000000000000000000000000000
      000000000000000000000000CC000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600CC9966000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003399CC003399
      CC003399CC00CC660000FFFFFF00FF990000993300003399CC003399CC003399
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC996600CC996600CC99
      6600CC996600CC996600CC996600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC660000CC6600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC660000993300009933
      0000CC660000000000000000000000000000000000000000000000000000CC66
      00009933000099330000CC660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000CC66000099330000000000000000
      000099330000CC66000000000000000000000000000000000000CC6600009933
      0000000000000000000099330000CC6600009933000099330000993300009933
      0000CC9966000000000000000000000000000000000099330000993300009933
      0000993300009933000099330000CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF00000000CC66000099330000000000000000
      0000000000009933000000000000000000000000000000000000993300000000
      0000000000000000000099330000CC660000CCCCCC00CC996600CC660000CC99
      6600000000000000000000000000000000000000000000000000CC660000CC66
      0000CC660000CC663300CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF0000000000000000CC660000993300000000
      00000000000099330000CC6600000000000000000000CC660000993300000000
      00000000000099330000CC6600000000000000000000E5E5E500CC660000CC66
      3300000000000000000000000000000000000000000000000000CC660000CC66
      0000CC660000FFCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000CC6600009933
      0000993300009933000099330000CC660000CC66000099330000993300009933
      000099330000CC66000000000000000000000000000000000000CC996600CC66
      0000CC663300CC663300CC663300CC663300CC66330099663300CC660000CC66
      0000CC6666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000993300009933000099330000993300009933000099330000993300009933
      0000000000000000000000000000000000000000000000000000E5E5E500CC66
      000099330000CC996600CC996600CC996600CC663300CC660000CC660000CC66
      0000FFCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0022000000680000007F00000068000000220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099999900FFFFFF00FFFFFF0099999900993300000000
      000000000000000000000000000000000000000000000000000000000000CC99
      6600CC660000CCCCCC000000000000000000CC663300CC660000CC660000CC66
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000007000000960000
      00E90000009D000000820000009D000000E90000009800000007000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      00000000000099999900FFFFFF006666660066666600FFFFFF00666666000000
      000000000000000000000000000000000000000000000000000000000000E5E5
      E500CC660000CC66330000000000CCCCCC00CC660000CC660000CC660000FFCC
      CC00000000000000000000000000000000000000000080000000000000008000
      0000000000008000000000000000000000000000000000000000000000000000
      00000000000080000000000000008000000000000000000000A3000000AE0000
      000E0000000000000000000000000000000E000000AD000000A5000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      000099999900FFFFFF00CCCCCC00CCCCCC00FFFFFF0066666600CCCCCC006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000CC996600CC660000CCCCCC00CC663300CC660000CC660000CC6666000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000080000000000000008000000000000000800000000000
      00008000000000000000000000000000000000000034000000DE000000080000
      00000000000000000000000000000000000000000008000000DE000000360000
      00000000000000000000000000FF000000000000000000000000000000009999
      9900FFFFFF00CCCCCC00CCCCCC006666660099999900FFFFFF00CCCCCC00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000E5E5E500CC66000099663300CC660000FF990000CC660000FFCCCC000000
      0000000000000000000000000000000000000000000080000000000000008000
      0000000000008000000000000000000000000000000000000000000000000000
      000000000000800000000000000080000000000000750000008D000000000000
      000000000000000000000000000000000000000000000000008D000000760000
      00000000000000000000000000FF00000000000000000000000099999900FFFF
      FF00CCCCCC00CCCCCC0066666600000000000000000099999900FFFFFF00CCCC
      CC00CCCCCC006666660000000000000000000000000000000000000000000000
      000000000000CC996600FF990000FF990000FF990000CC996600000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000080000000000000008000000000000000800000000000
      000080000000000000000000000000000000000000750000008D000000000000
      000000000000000000000000000000000000000000000000008D000000750000
      00000000000000000000000000FF000000000000000099999900FFFFFF00CCCC
      CC00CCCCCC00666666000000000000000000000000000000000099999900FFFF
      FF00CCCCCC00CCCCCC0066666600000000000000000000000000000000000000
      000000000000FFCCCC00CC660000FF993300CC660000FFCCCC00000000000000
      0000000000000000000000000000000000000000000080000000000000008000
      0000000000008000000000000000000000000000000000000000000000000000
      00000000000080000000000000008000000000000033000000DF000000090000
      00000000000000000000000000000000000000000008000000DF000000340000
      00000000000000000000000000FF0000000099999900FFFFFF00CCCCCC00CCCC
      CC00666666000000000000000000000000000000000000000000000000009999
      9900FFFFFF00CCCCCC00CCCCCC00666666000000000000000000000000000000
      00000000000000000000CC666600FF993300CC99660000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000080000000000000008000000000000000800000000000
      00008000000000000000000000000000000000000000000000A0000000B20000
      000F0000000000000000000000000000000F000000B1000000A2000000000000
      00000000000000000000000000FF0000000099999900FFFFFF00CCCCCC006666
      6600000000000000000000000000000000000000000000000000000000000000
      000099999900FFFFFF00CCCCCC00666666000000000000000000000000000000
      00000000000000000000FFCCCC00CC996600FFCCCC0000000000000000000000
      0000000000000000000000000000000000000000000080000000000000008000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000800000000000000000000006000000930000
      00EB0000009F000000820000009F000000EB0000009400000006000000000000
      00000000000000000000000000FF0000000099999900FFFFFF00666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900FFFFFF00666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000000000000000000080000000000000008000000000000000800000000000
      0000800000000000000000000000000000000000000000000000000000000000
      001F000000660000007E000000660000001F0000000000000000000000000000
      0000000000000000000000000000000000009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009999990099999900424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009000F83FF83F0000B000E00FE00F0000
      B000C007C0070000B000800380030000B000800380030000B000800380030000
      B000800380030000B000800380030000B000C007C0070000B000E38FFF8F0000
      B000E38FE38F0000B000E00FE38F00009000F01FE38F0000FFFFF83FE00F0000
      F7FEFFFFF01F0000F000FFFFF83F0000FF03FF7FA480F81FFF03FF7FEF806816
      FF030000C780C813C303000083800000C3030000EF804812C30300000180E817
      C30300000180781E0000000001807FFEC303FF7F0180FFFFC303FF7F01800000
      C303F00701800000C303F007EF800000FF03F00783800000FF03F007C7800000
      FF03FF7FEF800000FF03FF7FA4800000B9FFFFCEFFFFFFFFB3FFFFE60000F83F
      A007F002FFFFF83FB3FFFFE6083BF83BB9FFFFCE0831F83BBFFFFFFE0820083B
      A001C002082A083BA001C002083B083BA001C002083B083BA001C002083B082A
      A001C002083B0820BFFFFFFEF83B0831A01FFC02F83B083BA01FFC02F83FFFFF
      A01FFC02F83F0000A01FFC02FFFFFFFFFFFFFFFFFFFFFFFFFF01FC3FC003FFFF
      FF01F00FC003FFFFFF01C003C003FFFFE0010001C003FFFFE0010000C003E7FF
      E0010000C003CF83E0010000C003DFC3000F0000C003DFE3000F8001C003DFD3
      000FE047C003CF3B000FF8E1C003E0FF000FFE67C007FFFF01FFFF1FC00FFFFF
      01FFFFFFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFC001E0FFFF01
      80078001801FFF0100078001001FFF0100038001001FE00100038001000FE001
      00018001000FE00100018001000FE001000180010001000F000180010101000F
      000F80010101000F801F8001000F000FC3F88001008F000FFFFC800100AF01FF
      FFBA8001803F01FFFFC7FFFFE1FFFFFFFC01FE00FFFFFFFFFC01FE00FFFFEFFD
      FC01C000FFFFC7FFFC018000FFFFC3FBFC018000FFFFE3F780018000FFE7F1E7
      80018000C1F3F8CF80018000C3FBFC1F80038001C7FBFE3F80078003CBFBFC1F
      800F8007DCF3F8CF803F8007FF07E1E7803F8007FFFFC3F3807F8007FFFFC7FD
      80FFC00FFFFFFFFF81FFFCFFFFFFFFFFFFFFFFFF000087E1FFFFFFFF000033CC
      078099DD00003BDC0FC1EEAA000099998FC3D89D0000C003C007EBBA0000F00F
      C00798DD0000F81FE30FFFFF0000F81FE20F29520000F00FF01F29520000E007
      F01F29520000C183F83F2952000083C1F83F2952000007E0FC7F295200000FF0
      FC7F295200001FF8FFFF295200003FFC00000000000000000000000000000000
      000000000000}
  end
  object popForms: TPopupMenu
    Images = il1
    Left = 216
    Top = 136
    object Rectangle1: TMenuItem
      Action = accInsertRect
    end
    object Horizontalline1: TMenuItem
      Action = accInsertHLine
    end
    object Verticalline1: TMenuItem
      Action = accInsertVLine
    end
    object Ellipse1: TMenuItem
      Action = accInsertEllipse
    end
  end
end
