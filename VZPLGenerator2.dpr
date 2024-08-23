program VZPLGenerator2;

uses
  Vcl.Forms,
  frm_Main in 'frm_Main.pas' {frmMain},
  U_ZPLAlignment in 'U_ZPLAlignment.pas',
  U_ZPLClipboard in 'U_ZPLClipboard.pas',
  U_ZPLFileHandling in 'U_ZPLFileHandling.pas',
  U_ZPLObjects in 'U_ZPLObjects.pas',
  U_ZPLTypes in 'U_ZPLTypes.pas',
  U_ZPLUndo in 'U_ZPLUndo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Visual ZPL Generator';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
