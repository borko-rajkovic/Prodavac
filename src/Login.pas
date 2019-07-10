unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, inifiles, AdvGlowButton, CurvyControls,
  dxGDIPlusClasses, AdvShapeButton;

type
  TfrmLogin = class(TForm)
    imgBackground: TImage;
    edtPassword: TCurvyEdit;
    btnPotvrdi: TAdvGlowButton;
    cmbUsername: TcxLookupComboBox;
    imgProdavac: TImage;
    procedure usernamePropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPotvrdiClick(Sender: TObject);
    procedure cmbUsernameCloseUp(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure imgBackgroundMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  frmLogin: TfrmLogin;

implementation

uses Main, DataModule, uRegistry, Enkripcija;

{$R *.dfm}

procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnPotvrdiClick(Sender: TObject);
begin
  if edtPassword.Text = '' then
    begin
      MessageDlg('Unesite ispravnu lozinku!',mtError,[mbOK],0);
      Exit;
    end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select * from korisnici where username=:username and active=1';
  dm.Query.ParamByName('username').Value := cmbUsername.Text;
  dm.Query.Execute;

  if dm.Query.FieldByName('password').Text <> edtPassword.Text then
    begin
      MessageDlg('Unesite ispravnu lozinku!',mtError,[mbOK],0);
      Exit;
    end;

  if frmMain._koristiIni then
    begin
      frmMain.zapisiuini('login',frmMain.windir,'user','poslednji',cmbUsername.Text);
    end
  else
    begin
      RegistryWrite('last_login',cmbUsername.Text);
    end;

  ////////////////////////////////////////////////////////////////////
  ///                                                              ///
  ///       Za ispravljanje brojeva iz float u decimal             ///
  ///                                                              ///
  ////////////////////////////////////////////////////////////////////


  if (RegistryRead('db_set')='1') then
  begin
    dm.Query.Params.Clear;
    dm.Query.SQL.Text :=  'ALTER TABLE artmodeli CHANGE cijena cijena DECIMAL (10,2); '+
                          'ALTER TABLE artpopusti CHANGE iznos iznos DECIMAL (10,2); '+
                          'ALTER TABLE kupljeni_proizvodi CHANGE cijena cijena DECIMAL (10,2); '+
                          'ALTER TABLE kupljeni_proizvodi CHANGE popust popust DECIMAL (10,2); '+
                          'ALTER TABLE uplacene_rate CHANGE iznos iznos DECIMAL (10,2); '+
                          'ALTER TABLE uplate CHANGE iznos iznos DECIMAL (10,2); ';
    dm.Query.Execute;
    RegistryWrite('db_set','2');
  end;

  frmMain.username := cmbUsername.Text;

  ModalResult := mrOk;

    ////////////////////////////////////////////////////////////////////
  ///                                                              ///
  ///       Za ispravljanje brojeva iz float u decimal             ///
  ///                                                              ///
  ////////////////////////////////////////////////////////////////////


  if (RegistryRead('db_set')='2') then
  begin
    dm.Import_artikala.Execute;
    RegistryWrite('db_set','3');
  end;

  frmMain.username := cmbUsername.Text;

  ModalResult := mrOk;


end;

procedure TfrmLogin.cmbUsernameCloseUp(Sender: TObject);
begin
    edtPassword.SetFocus;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
ini:TIniFile;
begin
edtPassword.SetFocus;
dm.QKorisnici.Execute;

if frmMain._koristiIni then
  begin
    if fileexists('login.ini') then
    begin
        Ini := TIniFile.Create(ChangeFileExt(frmMain.windir+'login','.ini'));
        cmbUsername.Text := ini.ReadString('user','poslednji','');

        ini.Free;
    end;
  end
else
  begin
    if RegistryCheckString('last_login') then
      cmbUsername.Text := RegistryRead('last_login')
  end;
end;

procedure TfrmLogin.imgBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmLogin.usernamePropertiesCloseUp(Sender: TObject);
begin
  edtPassword.SetFocus;
end;

end.
