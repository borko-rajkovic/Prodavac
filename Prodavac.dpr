program Prodavac;

uses
  JclAppInst,
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  Vcl.Consts in 'Vcl.Consts.pas',
  Enkripcija in 'Enkripcija.pas',
  Vcl.Themes,
  Vcl.Styles,
  Registrovanje in 'Registrovanje.pas' {fRegistracija},
  Login in 'Login.pas' {frmLogin},
  PasswordChange in 'PasswordChange.pas' {frmPasswordChange},
  Configuration in 'Configuration.pas' {frmConfiguration},
  Kupci in 'Kupci.pas' {frmKupci},
  Skener in 'Skener.pas' {frmSkener},
  about in 'about.pas' {frmAbout},
  Artikli in 'Artikli.pas' {frmArtikli},
  Prodaja in 'Prodaja.pas' {frmProdaja},
  KarticaKupca in 'KarticaKupca.pas' {frmKartica},
  Reports in 'Reports.pas' {frmIzvjestaji},
  uRegistry in 'uRegistry.pas';

{$R *.res}

begin
  JclAppInstances.CheckSingleInstance;
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
