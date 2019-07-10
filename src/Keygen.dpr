program Keygen;

uses
  Vcl.Forms,
  Kljuc in 'Kljuc.pas' {frmKeygen},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Slate Classico');
  Application.CreateForm(TfrmKeygen, frmKeygen);
  Application.Run;
end.
