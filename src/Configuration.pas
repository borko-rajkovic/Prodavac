unit Configuration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxMaskEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxCheckBox, AdvOfficePager,
  AdvGlowButton, CurvyControls, AdvSmoothLabel;

type
  TfrmConfiguration = class(TForm)
    pagerConfiguration: TAdvOfficePager;
    pageKorisnici: TAdvOfficePage;
    pageKonfiguracija: TAdvOfficePage;
    pnlConfiguration: TCurvyPanel;
    lblSkeniranjePutanja: TLabel;
    lblKonfiguracija: TAdvSmoothLabel;
    edtFilesPath: TCurvyEdit;
    btnFilesPath: TAdvGlowButton;
    gvUsers: TcxGrid;
    gvUsersDBTableView: TcxGridDBTableView;
    gvUsersDBTableViewid: TcxGridDBColumn;
    gvUsersDBTableViewIme: TcxGridDBColumn;
    gvUsersDBTableViewPrezime: TcxGridDBColumn;
    gvUsersDBTableViewUsername: TcxGridDBColumn;
    gvUsersDBTableViewPassword: TcxGridDBColumn;
    gvUsersDBTableViewGrupa: TcxGridDBColumn;
    gvUsersLevel1: TcxGridLevel;
    lblAdministracijaKorisnika: TAdvSmoothLabel;
    pnlKorisnici: TCurvyPanel;
    lblGrupa: TLabel;
    lblIme: TLabel;
    lblPassword: TLabel;
    lblPrezime: TLabel;
    lblUsername: TLabel;
    cmbAdministrator: TComboBox;
    btnDodaj: TAdvGlowButton;
    btnObrisi: TAdvGlowButton;
    btnIzmijeni: TAdvGlowButton;
    edtIme: TCurvyEdit;
    edtPrezime: TCurvyEdit;
    edtUsername: TCurvyEdit;
    edtPassword: TCurvyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDodajClick(Sender: TObject);
    function ValidacijaPolja():bool;
    procedure btnIzmijeniClick(Sender: TObject);
    procedure btnObrisiClick(Sender: TObject);
    procedure gvUsersDBTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtFilesPathClick(Sender: TObject);
    procedure btnFilesPathClick(Sender: TObject);
  private

  public

  end;

var
  frmConfiguration: TfrmConfiguration;

implementation

uses DataModule, Main;

{$R *.dfm}

procedure TfrmConfiguration.btnDodajClick(Sender: TObject);
begin
  if  ValidacijaPolja = false then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select * from korisnici where username = :username and active=1';
  dm.Query.ParamByName('username').Value := edtUsername.Text;
  dm.Query.Execute;

  if dm.Query.RecordCount>0 then
  begin
    MessageDlg('Username '+edtUsername.text+' već postoji',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into korisnici(ime,prezime,username,password,grupa) values(:ime,:prezime,:username,:password,:grupa)';
  dm.Query.ParamByName('ime').Value := edtIme.Text;
  dm.Query.ParamByName('prezime').Value := edtPrezime.Text;
  dm.Query.ParamByName('username').Value := edtUsername.Text;
  dm.Query.ParamByName('password').Value := edtPassword.Text;
  dm.Query.ParamByName('grupa').Value := cmbAdministrator.Text;
  dm.Query.Execute;

  dm.QKorisnici.Execute;
end;

procedure TfrmConfiguration.btnFilesPathClick(Sender: TObject);
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update conf set filesPath=:filesPath';
  dm.Query.ParamByName('filesPath').Value := edtFilesPath.Text+'\';
  dm.Query.Execute;
end;

procedure TfrmConfiguration.btnIzmijeniClick(Sender: TObject);
begin
  if  ValidacijaPolja = false then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as admini from korisnici where grupa=:grupa and active=1';
  dm.Query.ParamByName('grupa').Value := 'Admin';
  dm.Query.Execute;

  if (dm.Query.FieldByName('admini').Value = 1) and (cmbAdministrator.Text = 'Operater') and (gvUsersDBTableViewGrupa.EditValue <> 'Operater') then
   begin
    MessageDlg('Ne možete ukloniti sve administratore',mtError,[mbOk],0);
    Abort;
  end;

  if dm.QKorisnici.Locate('username',edtUsername.text,[loCaseInsensitive])=false then
  begin
    MessageDlg('Username '+edtUsername.text+' ne postoji',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update korisnici set ime=:ime, prezime=:prezime,password=:password,grupa=:grupa where username=:username';
  dm.Query.ParamByName('ime').Value := edtIme.Text;
  dm.Query.ParamByName('prezime').Value := edtPrezime.Text;
  dm.Query.ParamByName('username').Value := edtUsername.Text;
  dm.Query.ParamByName('password').Value := edtPassword.Text;
  dm.Query.ParamByName('grupa').Value := cmbAdministrator.Text;
  dm.Query.Execute;

  dm.QKorisnici.Execute;
end;

procedure TfrmConfiguration.btnObrisiClick(Sender: TObject);
var username:string;
begin
  username := gvUsersDBTableViewUsername.EditValue;

  if username = frmMain.username then
  begin
    MessageDlg('Svoj nalog ne možete brisati',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as admini from korisnici where grupa=:grupa and active=1';
  dm.Query.ParamByName('grupa').Value := 'Admin';
  dm.Query.Execute;

  if (dm.Query.FieldByName('admini').Value = 1) and (gvUsersDBTableViewGrupa.EditValue <> 'Operater') then
   begin
    MessageDlg('Ne možete ukloniti sve administratore',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update korisnici set active = 0 where username=:username';
  dm.Query.ParamByName('username').Value := username;
  dm.Query.Execute;

  dm.QKorisnici.Execute;
end;

procedure TfrmConfiguration.edtFilesPathClick(Sender: TObject);
begin
{$WARNINGS OFF}
with TFileOpenDialog.Create(nil) do
  try
    Options := [fdoPickFolders];
    if Execute then
    edtFilesPath.Text := FileName;
  finally
    Free;
  end;
{$WARNINGS ON}
end;

procedure TfrmConfiguration.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.indConfig := 0;
  Self.Free;
end;

procedure TfrmConfiguration.FormShow(Sender: TObject);
begin
  dm.QKorisnici.Execute;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select * from conf';
  dm.Query.Execute;

  edtFilesPath.Text := dm.Query.FieldByName('filesPath').Value;

end;

procedure TfrmConfiguration.gvUsersDBTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    edtIme.Text := gvUsersDBTableViewIme.EditValue;
    edtPrezime.Text := gvUsersDBTableViewPrezime.EditValue;
    edtUsername.Text := gvUsersDBTableViewUsername.EditValue;
    edtPassword.Text := gvUsersDBTableViewPassword.EditValue;
    cmbAdministrator.ItemIndex := cmbAdministrator.Items.IndexOf(gvUsersDBTableViewGrupa.EditValue);
end;

function TfrmConfiguration.ValidacijaPolja():bool;
begin
  if (Trim(edtIme.Text)='')or(Trim(edtPrezime.Text)='')or(Trim(edtUsername.Text)='')or(Trim(edtPassword.Text)='') then
    result := false
  else
    result := true;
end;

end.
