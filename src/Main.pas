unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inifiles, Vcl.StdCtrls, AdvToolBar,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvToolBarStylers,
  AdvPreviewMenu, AdvPreviewMenuStylers, AdvShapeButton, AdvGlowButton,
  AdvOfficePager, AdvOfficePagerStylers, frxClass,cxGridPopupMenuConsts, cxGridStrs, cxClasses;

type
  TfrmMain = class(TForm)
    tabMain: TAdvToolBarPager;
    pgKupci: TAdvPage;
    pgAdministracija: TAdvPage;
    advTabManuIcon: TAdvShapeButton;
    AdvPreviewMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler: TAdvPreviewMenuOfficeStyler;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvOfficeStatusBarOfficeStyler: TAdvOfficeStatusBarOfficeStyler;
    statusbar: TAdvOfficeStatusBar;
    lblKorisnik: TLabel;
    btnKupci: TAdvGlowButton;
    pgIzvjestaji: TAdvPage;
    btnConfiguration: TAdvGlowButton;
    frReport: TfrxReport;
    btnArtikli: TAdvGlowButton;
    btnProdaja: TAdvGlowButton;
    btnIzvjestaji: TAdvGlowButton;
    {$Region 'Dodatne funkcije'}
      function windir: string;
      procedure logujse;
      procedure zapisiuini(imefajla, putanja, prvi, drugi,  treci: string);
      procedure podacizaserver(server, korisnik, sifra, baza,port: string);
      function IspravnaLozinka(serijski, registracija: string): Boolean;
      function citaj(podatak1, podatak2: string): string;
      function GetVolumeID(): String;
      function _koristiIni(): boolean;
    {$EndRegion}
    procedure prevedi;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvPreviewMenuMenuItems0Click(Sender: TObject);
    procedure AdvPreviewMenuMenuItems1Click(Sender: TObject);
    procedure btnConfigurationClick(Sender: TObject);
    procedure btnKupciClick(Sender: TObject);
    procedure AdvPreviewMenuMenuItems2Click(Sender: TObject);
    procedure btnArtikliClick(Sender: TObject);
    procedure btnProdajaClick(Sender: TObject);
    procedure btnIzvjestajiClick(Sender: TObject);
  private

  public
    username,filePath: string;
    indConfig, indKupci, indArtikli, indProdaja, indIzvjestaji: integer;
    indAdministrator: integer;
    karticaIdKupca : integer;
  end;

var
  frmMain: TfrmMain;

implementation

uses DataModule, Enkripcija, Registrovanje, Login, PasswordChange, Configuration, Kupci, About, Artikli,
  Prodaja, Reports, uRegistry;

var frmKupci : TfrmKupci;
    frmConfiguration : TfrmConfiguration;
    frmArtikli : TfrmArtikli;
    frmProdaja: TfrmProdaja;
    frmIzvjestaji: TfrmIzvjestaji;

{$R *.dfm}

procedure TfrmMain.AdvPreviewMenuMenuItems0Click(Sender: TObject);
var frmPasswordChange : TfrmPasswordChange;
begin
  frmPasswordChange := TfrmPasswordChange.create(nil);
  try
    frmPasswordChange.ShowModal;
  finally
    frmPasswordChange.FreeOnRelease;
  end;
end;

procedure TfrmMain.prevedi;
begin

{$Region 'Prevod grida i charta'}
  cxSetResourceString(@cxSGridSortColumnAsc, 'Sortiraj po opadajucem nizu');
  cxSetResourceString(@cxSGridSortColumnDesc, 'Sortiraj po rastucem nizu');
  cxSetResourceString(@cxSGridClearSorting, 'Ponisti sortiranje');
  cxSetResourceString(@cxSGridGroupByThisField, 'Grupisi po ovom polju');
  cxSetResourceString(@cxSGridGroupByBox, 'Grupisi po nazivima');


  cxSetResourceString(@cxSGridShowFooter, 'Zaglavlje');
  cxSetResourceString(@cxSGridShowGroupFooter, 'Grupisi zaglavlja');
  cxSetResourceString(@cxSGridRemoveColumn, 'Skloni ovu kolonu');

  cxSetResourceString(@cxSGridFieldChooser, 'Izaberi polja');
  cxSetResourceString(@cxSGridBestFit, 'Najbolja popunjavanje');
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Najbolja popunjavanje (sve kolone)');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Prevuci naslov kolone ovdje, da biste ih grupisali po toj koloni');
{$EndRegion}

end;


procedure TfrmMain.AdvPreviewMenuMenuItems1Click(Sender: TObject);
var frmAbout : TfrmAbout;
begin
  frmAbout := TfrmAbout.create(nil);
  try
    frmAbout.ShowModal;
  finally
    frmAbout.FreeOnRelease;
  end;
end;

procedure TfrmMain.AdvPreviewMenuMenuItems2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnArtikliClick(Sender: TObject);
begin
  if indArtikli = 0 then
  begin
    indArtikli := 1;
    frmArtikli := TfrmArtikli.Create(nil);
    frmArtikli.Show;
  end
  else
     frmArtikli.Show;
end;

procedure TfrmMain.btnConfigurationClick(Sender: TObject);
begin
  if indConfig = 0 then
  begin
    indConfig := 1;
    frmConfiguration := TfrmConfiguration.Create(nil);
    frmConfiguration.Show;
  end
  else
    frmConfiguration.Show;
end;

procedure TfrmMain.btnIzvjestajiClick(Sender: TObject);
begin
  if indIzvjestaji = 0 then
  begin
    indIzvjestaji := 1;
    frmIzvjestaji := TfrmIzvjestaji.Create(nil);
    frmIzvjestaji.Show;
  end
  else
     frmIzvjestaji.Show;
end;

procedure TfrmMain.btnKupciClick(Sender: TObject);
begin
  if indKupci = 0 then
  begin
    indKupci := 1;
    frmKupci := TfrmKupci.Create(nil);
    frmKupci.Show;
  end
  else
     frmKupci.Show;
end;

procedure TfrmMain.btnProdajaClick(Sender: TObject);
begin
  if indProdaja = 0 then
  begin
    indProdaja := 1;
    frmProdaja := TfrmProdaja.Create(nil);
    frmProdaja.Show;
  end
  else
    frmProdaja.Show;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Vcl.dialogs.MessageDlg('Želite li da izadete iz programa?',mtInformation,[mbYes,mbNo],0,mbNo)=mrNo then
      abort;

{$Region 'Oslobadjanje prozora'}
  if indArtikli = 1 then
    frmArtikli.Free;
  if indConfig =1 then
    frmConfiguration.Free;
  if indKupci =1 then
    frmKupci.Free;
  if indProdaja =1 then
    frmProdaja.Free;
  if indIzvjestaji =1 then
    frmIzvjestaji.Free;
{$EndRegion}

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

{$Region 'Provjera konekcije sa bazom'}

if _koristiIni then
  begin
    if not fileexists (windir+'server.ini') then
          frmMain.logujse;
  end
else
  begin
    if RegistryCheckKey = False then
      frmMain.logujse;
  end;

{$EndRegion}

end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  ini: TIniFile;
  putanja,korisnik,sifra,baza,port:string;
  frmLogin : TfrmLogin;
  frmRegistracija: TfRegistracija;
  registracija_uspjesno, login_uspjesno: boolean;
begin

  {$Region 'provjera baze i konekcije'}

  if _koristiIni then
    begin
      if not fileexists (windir+'server.ini') then
         abort;

      Ini := TIniFile.Create(ChangeFileExt(windir+'server','.ini'));
      putanja := ini.ReadString('mysql', 'putanja', '');
      korisnik := ini.ReadString('mysql', 'korisnik', '');
      sifra:=Dekript(ini.ReadString('mysql', 'sifra', ''));
      baza:=ini.ReadString('mysql','baza','');
      port:=ini.ReadString('mysql','port','');

      podacizaserver(putanja,korisnik,sifra,baza,port);

      ini.Free;
    end
  else
    begin
      if RegistryCheckKey = False then
         abort;

      putanja := RegistryRead('mysql_path');
      korisnik := RegistryRead('mysql_username');
      sifra:=Dekript(RegistryRead('mysql_password'));
      baza:=RegistryRead('mysql_schema');
      port:=RegistryRead('mysql_port');

      podacizaserver(putanja,korisnik,sifra,baza,port);

    end;

  {$EndRegion}

  {$Region 'Provjera registracije aplikacije'}

  if IspravnaLozinka(GetVolumeID,citaj('broj','kljuc'))=False then
    begin
      frmRegistracija := TfRegistracija.Create(nil);
      try
        if frmRegistracija.ShowModal = mrCancel then
          registracija_uspjesno := False
        else
          registracija_uspjesno := True;
      finally
        frmRegistracija.FreeOnRelease;
      end;
      if registracija_uspjesno = False then
        Application.Terminate;
    end;

  {$EndRegion}

  {$Region 'Logovanje korisnika'}

  frmLogin := TfrmLogin.create(nil);
  try
    if frmLogin.ShowModal = mrCancel then
      login_uspjesno := False
    else
      login_uspjesno := True;
  finally
    frmLogin.FreeOnRelease;
  end;

  if login_uspjesno = False then
      Application.Terminate;

  {$EndRegion}

  {$Region 'Inicijalna podesavanja'}

  lblKorisnik.Caption := 'Korisnik: '+username;

  indConfig := 0;
  indKupci := 0;
  indProdaja := 0;
  indArtikli := 0;
  indIzvjestaji := 0;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select * from korisnici where username=:username and active=1';
  dm.Query.ParamByName('username').Value := username;
  dm.Query.Execute;

  if dm.Query.FieldByName('Grupa').Text = 'Admin' then indAdministrator := 1 else indAdministrator :=0;

  if indAdministrator = 0 then
  begin
    tabMain.RemoveAdvPage(pgAdministracija);
    tabMain.RemoveAdvPage(pgIzvjestaji);
  end;

  {$EndRegion}

end;

{$Region 'Dodatne funkcije'}

  function TfrmMain.windir: string;
  var
  ProgDir: String;
  begin
    ProgDir := ExtractFilePath(Application.ExeName);
    if Length(ProgDir) = 2 then
       ProgDir := ProgDir + '/';
    result := progdir;
  end;

  procedure TfrmMain.logujse;
  var
    ini: TIniFile;
    putanja,korisnik,sifra,baza,port:string;
  begin
    if dm.connDC.Execute = false then
    begin
      Application.Terminate;
      abort;
    end;

    if _koristiIni then
      begin
        frmMain.zapisiuini('server',frmMain.windir,'mysql','putanja',dm.connMySQL.Server);
        frmMain.zapisiuini('server',frmMain.windir,'mysql','korisnik',dm.connMySQL.Username);
        frmMain.zapisiuini('server',frmMain.windir,'mysql','sifra',Enkript(dm.connMySQL.Password));
        frmMain.zapisiuini('server',frmMain.windir,'mysql','baza',dm.connMySQL.Database);
        frmMain.zapisiuini('server',frmMain.windir,'mysql','port',inttostr(dm.connMySQL.Port));

        Ini := TIniFile.Create(ChangeFileExt(frmMain.windir+'server','.ini'));

        putanja := ini.ReadString('mysql', 'putanja', '');
        korisnik := ini.ReadString('mysql', 'korisnik', '');
        sifra:=Dekript(ini.ReadString('mysql', 'sifra', ''));
        baza :=ini.ReadString('mysql','baza','');
        port := ini.ReadString('mysql','port','');

        frmMain.podacizaserver(putanja,korisnik,sifra,baza,port);
        ini.Free;
      end
    else
      begin

        RegistryWrite('mysql_path',dm.connMySQL.Server);
        RegistryWrite('mysql_username',dm.connMySQL.Username);
        RegistryWrite('mysql_password',Enkript(dm.connMySQL.Password));
        RegistryWrite('mysql_schema',dm.connMySQL.Database);
        RegistryWrite('mysql_port',IntToStr(dm.connMySQL.Port));

        putanja := RegistryRead('mysql_path');
        korisnik := RegistryRead('mysql_username');
        sifra:=Dekript(RegistryRead('mysql_password'));
        baza :=RegistryRead('mysql_schema');
        port := RegistryRead('mysql_port');

        frmMain.podacizaserver(putanja,korisnik,sifra,baza,port);
      end;

  end;

  procedure TfrmMain.zapisiuini(imefajla, putanja, prvi, drugi,  treci: string);
  var
    iniforme : tinifile;
  begin
    IniForme := TIniFile.Create(ChangeFileExt(putanja+imefajla,'.ini'));
    Iniforme.Writestring(prvi,drugi,treci);
    IniForme.Free;
  end;

  procedure TfrmMain.podacizaserver(server, korisnik, sifra, baza, port: string);
  begin
    dm.connMySQL.close;
    dm.connMySQL.server :=server;
    dm.connMySQL.Username :=korisnik;
    dm.connMySQL.Password :=sifra;
    dm.connMySQL.Database :=baza;
    dm.connMySQL.Port := StrToInt(port);
  end;

  function TfrmMain._koristiIni(): boolean;
  begin
    Result := False;
  end;

  function TfrmMain.IspravnaLozinka(serijski, registracija: string): Boolean;
  begin
    if (2*StrToFloat(serijski)+4*1103988250012)=StrToFloat(registracija) then
      result := True
    else
      result := False;
  end;

  function TfrmMain.citaj(podatak1, podatak2: string): string;
  var
    Iniforma  : TIniFile;
    broj : String;
  begin

    if _koristiIni then
      begin
        Iniforma := TIniFile.Create(ChangeFileExt(GetCurrentDir+'/serijski','.ini'));

        broj := Iniforma.Readstring(podatak1,podatak2,'0');

        IniForma.Free;
        result :=broj;
      end
    else
      begin
        if RegistryCheckString('registration_no')=False then
          broj := '0'
        else
          broj := RegistryRead('registration_no');
        Result := broj;
      end;
  end;

  function TfrmMain.GetVolumeID(): String;
    var
     MaxFileNameLength, VolFlags, SerNum: DWord;
   begin
     if GetVolumeInformation(PChar('C:\'), nil, 0, @SerNum, MaxFileNameLength, VolFlags, nil, 0) then
     begin
       sernum :=sernum;
       Result := floattostr(SerNum);
     end
   else
     Result := '';
  end;

{$EndRegion}

end.
