unit PasswordChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, AdvGlowButton, CurvyControls, AdvSmoothLabel;

type
  TfrmPasswordChange = class(TForm)
    imgfalse: TImage;
    imgtrue: TImage;
    edtStaraLozinka: TCurvyEdit;
    edtNovaLozinka: TCurvyEdit;
    edtNovaLozinka2: TCurvyEdit;
    btnSubmit: TAdvGlowButton;
    imgPozadina: TImage;
    lblStatus: TAdvSmoothLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure imgPozadinaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  frmPasswordChange: TfrmPasswordChange;

implementation

uses DataModule, Main;

{$R *.dfm}

procedure TfrmPasswordChange.btnSubmitClick(Sender: TObject);
begin


  {$Region 'Provjera stare lozinke'}

    dm.Query.Params.Clear;
    dm.Query.SQL.Text := 'select * from korisnici where username=:username and password=:password';
    dm.Query.ParamByName('username').Value := frmMain.username;
    dm.Query.ParamByName('password').Value := edtStaraLozinka.Text;
    dm.Query.Execute;

    if dm.Query.RecNo =0 then
    begin
      imgfalse.Visible := true;
      lblStatus.Caption.Text := 'Pogrešna stara lozinka';
      Abort;
    end;

  {$EndRegion}

  {$Region 'Provjera novih lozinki'}

    if edtNovaLozinka.Text <> edtNovaLozinka2.Text then
    begin
        lblStatus.Caption.Text := 'Nova lozinka se ne poklapa';
        imgfalse.Visible := true;
        Abort;
    end;

    if Length(edtNovaLozinka.Text) < 1 then
    begin
        lblStatus.Caption.Text := 'Nova lozinka je prazna';
        imgfalse.Visible := true;
        Abort;
    end;

  {$EndRegion}

  {$Region 'Promjena lozinke u bazi'}
    dm.Query.Params.Clear;
    dm.Query.SQL.Text := 'update korisnici set password = :password where username=:username';
    dm.Query.ParamByName('username').Value := frmMain.username;
    dm.Query.ParamByName('password').Value := edtNovaLozinka.Text;
    dm.Query.Execute;

    lblStatus.Caption.Text := 'Uspješno izmijenjena lozinka';
    imgtrue.Visible := true;
    btnSubmit.Enabled := false;
    edtStaraLozinka.Enabled := false;
    edtNovaLozinka.Enabled := false;
    edtNovaLozinka2.Enabled := false;
  {$EndRegion}

end;

procedure TfrmPasswordChange.FormShow(Sender: TObject);
begin
  edtStaraLozinka.SetFocus;
end;

procedure TfrmPasswordChange.imgPozadinaMouseDown(Sender: TObject;
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

end.
