unit Kupci;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvOfficePager, AdvOfficePagerStylers,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn, AdvSmoothLabel, CurvyControls, AdvGlowButton, Data.DB, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, AdvPicture,
  AdvCombo, Lucombo, dblucomb, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxImageComboBox, AdvSmoothEdit, AdvSmoothEditButton, AdvSmoothDatePicker,
  AdvOfficeButtons, cxCheckBox, AdvScrollBox, cxGridExportLink, Winapi.ShellAPI;

type
  TfrmKupci = class(TForm)
    pagerKupci: TAdvOfficePager;
    pgPregledKupaca: TAdvOfficePage;
    pgKreiranjeUgovora: TAdvOfficePage;
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    pnlDodavanjeKupca: TCurvyPanel;
    lblIme: TLabel;
    lblPrezime: TLabel;
    lblJMBG: TLabel;
    lblBrojLicne: TLabel;
    btnDodajKupca: TAdvGlowButton;
    edtIme: TCurvyEdit;
    edtPrezime: TCurvyEdit;
    edtJMBG: TCurvyEdit;
    edtBrojLicne: TCurvyEdit;
    lblDodavanjeKupca: TAdvSmoothLabel;
    edtKopijaLicne: TCurvyEdit;
    lblKopijaLicne: TLabel;
    btnSkener: TAdvGlowButton;
    gridKorisniciDBTableView1: TcxGridDBTableView;
    gridKorisniciLevel1: TcxGridLevel;
    gridKorisnici: TcxGrid;
    gridKorisniciDBTableView1id: TcxGridDBColumn;
    gridKorisniciDBTableView1Ime: TcxGridDBColumn;
    gridKorisniciDBTableView1Prezime: TcxGridDBColumn;
    gridKorisniciDBTableView1JMBG: TcxGridDBColumn;
    gridKorisniciDBTableView1BrojLicne: TcxGridDBColumn;
    gridKorisniciDBTableView1KopijaLicne: TcxGridDBColumn;
    btnIzmijeniKupca: TAdvGlowButton;
    btnObrisiKupca: TAdvGlowButton;
    pgRazduzivanjeRata: TAdvOfficePage;
    pnlSearch: TCurvyPanel;
    lblImeSearch: TLabel;
    lblPrezimeSearch: TLabel;
    lblJMBGSearch: TLabel;
    lblBrojLicneSearch: TLabel;
    edtImeSearch: TCurvyEdit;
    edtPrezimeSearch: TCurvyEdit;
    edtJMBGSearch: TCurvyEdit;
    edtBrojLicneSearch: TCurvyEdit;
    lblPretragaKupca: TAdvSmoothLabel;
    btnPretraziKupca: TAdvGlowButton;
    gridPretragaKupca: TcxGrid;
    cxGridPretragaKupcaDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridPretragaKupcaLevel1: TcxGridLevel;
    pnlProdaja: TCurvyPanel;
    lblCijena: TLabel;
    lblProizvod: TLabel;
    lblBrojRata: TLabel;
    edtCijena: TCurvyEdit;
    edtProizvod: TCurvyEdit;
    edtBrojRata: TCurvyEdit;
    btnUnesiProdaju: TAdvGlowButton;
    lblInformacijeOProdaji: TAdvSmoothLabel;
    gridProizvodi: TcxGrid;
    cxGridProizvodiDBTableView1: TcxGridDBTableView;
    cxGridProizvodiLevel1: TcxGridLevel;
    btnObrisiProdaju: TAdvGlowButton;
    btnZakljucajProdaju: TAdvGlowButton;
    cxGridProizvodiDBTableView1id: TcxGridDBColumn;
    cxGridProizvodiDBTableView1id_kupca: TcxGridDBColumn;
    cxGridProizvodiDBTableView1proizvod: TcxGridDBColumn;
    cxGridProizvodiDBTableView1cijena: TcxGridDBColumn;
    cxGridProizvodiDBTableView1broj_rata: TcxGridDBColumn;
    cxGridProizvodiDBTableView1odobreno: TcxGridDBColumn;
    cxGridProizvodiDBTableView1username: TcxGridDBColumn;
    cxGridProizvodiDBTableView1datum: TcxGridDBColumn;
    lblPretragaKupovina: TAdvSmoothLabel;
    pnlSearchKupovine: TCurvyPanel;
    lblImeSearchKupovina: TLabel;
    lblPrezimeSearchKupovina: TLabel;
    lblJMBGSearchKupovina: TLabel;
    lblBrojLicneSearchKupovina: TLabel;
    edtImeSearchKupovina: TCurvyEdit;
    edtPrezimeSearchKupovina: TCurvyEdit;
    edtJMBGSearchKupovina: TCurvyEdit;
    edtBrojLicneSearchKupovina: TCurvyEdit;
    btnSearchKupovine: TAdvGlowButton;
    gridKupovinaSearch: TcxGrid;
    gridKupovinaSearchDBTableView1: TcxGridDBTableView;
    gridKupovinaSearchLevel1: TcxGridLevel;
    edtProizvodSearchKupovina: TCurvyEdit;
    dateDatum: TAdvSmoothDatePicker;
    lblProizvodSearch: TLabel;
    lblInformacijeORazduzenju: TAdvSmoothLabel;
    pnlRazduzenje: TCurvyPanel;
    lblIznos: TLabel;
    edtIznosRate: TCurvyEdit;
    btnUnesiRatu: TAdvGlowButton;
    btnObrisiRatu: TAdvGlowButton;
    btnZakljucajRatu: TAdvGlowButton;
    gridRate: TcxGrid;
    gridRateDBTableView1: TcxGridDBTableView;
    gridRateLevel1: TcxGridLevel;
    gridKupovinaSearchDBTableView1id: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Ime: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Prezime: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1JMBG: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Brojlinekarte: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Proizvod: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Cijena: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Brojrata: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Prodao: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Zakljuano: TcxGridDBColumn;
    chkDatum: TcxCheckBox;
    gridRateDBTableView1id: TcxGridDBColumn;
    gridRateDBTableView1id_prodaje: TcxGridDBColumn;
    gridRateDBTableView1iznos: TcxGridDBColumn;
    gridRateDBTableView1odobreno: TcxGridDBColumn;
    gridRateDBTableView1username: TcxGridDBColumn;
    gridRateDBTableView1datum: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Datum: TcxGridDBColumn;
    btnUgovorStampa: TAdvGlowButton;
    btnPriznanica: TAdvGlowButton;
    lblKontaktTelefon: TLabel;
    edtKontaktTelefon: TCurvyEdit;
    lblNapomena: TLabel;
    edtNapomena: TCurvyEdit;
    gridKorisniciDBTableView1kontaktTelefon: TcxGridDBColumn;
    gridKorisniciDBTableView1Napomena: TcxGridDBColumn;
    gridKorisniciDBTableView1username: TcxGridDBColumn;
    gridKorisniciDBTableView1datum: TcxGridDBColumn;
    pgPregledKupacaScrollBox: TAdvScrollBox;
    pgGrupeKupaca: TAdvOfficePage;
    gridGrupe: TcxGrid;
    gridGrupeDBTableView1: TcxGridDBTableView;
    gridGrupeDBTableView1id: TcxGridDBColumn;
    gridGrupeDBTableView1Broj: TcxGridDBColumn;
    gridGrupeDBTableView1Naziv: TcxGridDBColumn;
    gridGrupeLevel1: TcxGridLevel;
    lblDodavanjeGrupe: TAdvSmoothLabel;
    pnlDodavanjeGrupe: TCurvyPanel;
    lblGrupaNaziv: TLabel;
    lblGrupaBroj: TLabel;
    btnDodajGrupu: TAdvGlowButton;
    edtGrupaNaziv: TCurvyEdit;
    btnIzmijeniGrupu: TAdvGlowButton;
    btnObrisiGrupu: TAdvGlowButton;
    edtGrupaBroj: TCurvyEdit;
    cmbGrupaKupca: TcxLookupComboBox;
    lblGrupaKupca: TLabel;
    gridKorisniciDBTableView1Column1: TcxGridDBColumn;
    gridKorisniciDBTableView1idKupciGrupe: TcxGridDBColumn;
    lblPretraga: TAdvSmoothLabel;
    pnlPretraga: TCurvyPanel;
    lblKupciIme: TLabel;
    lblKupciPrezime: TLabel;
    lblKupciJMBG: TLabel;
    lblKupciBrojLicne: TLabel;
    edtKupciIme: TCurvyEdit;
    edtKupciPrezime: TCurvyEdit;
    edtKupciJMBG: TCurvyEdit;
    edtKupciBrojLicne: TCurvyEdit;
    btnKupciTrazi: TAdvGlowButton;
    pgDodajKupca: TAdvOfficePage;
    pgDodajKupcaScrollBox: TAdvScrollBox;
    gridKupci: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    lblDodajKupca: TAdvSmoothLabel;
    pnlDodajKupca: TCurvyPanel;
    lblDodajKupcaIme: TLabel;
    lblDodajKupcaPrezime: TLabel;
    lblDodajKupcaJMBG: TLabel;
    lblDodajKupcaLicna: TLabel;
    lblDodajKupcaLicnaKarta: TLabel;
    lblDodajKupcaTelefon: TLabel;
    lblDodajKupcaNapomena: TLabel;
    lblDodajKupcaGrupa: TLabel;
    btnDodajKupca2: TAdvGlowButton;
    edtDodajKupcaIme: TCurvyEdit;
    edtDodajKupcaPrezime: TCurvyEdit;
    edtDodajKupcaJMBG: TCurvyEdit;
    edtDodajKupcaLicna: TCurvyEdit;
    edtDodajKupcaLicnaKarta: TCurvyEdit;
    btnLicna: TAdvGlowButton;
    edtDodajKupcaTelefon: TCurvyEdit;
    edtDodajKupcaNapomena: TCurvyEdit;
    cmbGrupaKupaca: TcxLookupComboBox;
    lblNapomena2: TLabel;
    lblDodajKupcaNapomena2: TLabel;
    edtNapomena2: TCurvyEdit;
    edtDodajKupcaNapomena2: TCurvyEdit;
    gridKorisniciDBTableView1Napomena2: TcxGridDBColumn;
    btnExcel: TAdvGlowButton;
    procedure btnDodajKupcaClick(Sender: TObject);
    function ValidacijaPolja():bool;
    function ValidacijaPolja2():bool;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSkenerClick(Sender: TObject);
    procedure gridKorisniciDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnIzmijeniKupcaClick(Sender: TObject);
    procedure btnObrisiKupcaClick(Sender: TObject);
    procedure pgKreiranjeUgovoraShow(Sender: TObject);
    procedure pagerKupciChange(Sender: TObject);
    procedure btnPretraziKupcaClick(Sender: TObject);
    procedure btnUnesiProdajuClick(Sender: TObject);
    procedure cxGridPretragaKupcaDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnObrisiProdajuClick(Sender: TObject);
    procedure btnZakljucajProdajuClick(Sender: TObject);
    procedure pgRazduzivanjeRataShow(Sender: TObject);
    procedure chkDatumClick(Sender: TObject);
    procedure gridKupovinaSearchDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSearchKupovineClick(Sender: TObject);
    procedure btnUnesiRatuClick(Sender: TObject);
    procedure btnObrisiRatuClick(Sender: TObject);
    procedure btnZakljucajRatuClick(Sender: TObject);
    procedure btnUgovorStampaClick(Sender: TObject);
    procedure btnPriznanicaClick(Sender: TObject);
    procedure btnDodajGrupuClick(Sender: TObject);
    procedure btnIzmijeniGrupuClick(Sender: TObject);
    procedure btnObrisiGrupuClick(Sender: TObject);
    procedure gridGrupeDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure pgGrupeKupacaShow(Sender: TObject);
    procedure btnKupciTraziClick(Sender: TObject);
    procedure btnLicnaClick(Sender: TObject);
    procedure btnDodajKupca2Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKupci: TfrmKupci;

implementation

  uses DataModule, Main, Skener;

{$R *.dfm}

procedure TfrmKupci.btnSearchKupovineClick(Sender: TObject);
begin
  dm.QProdajaPretraga.Params.Clear;
  dm.QProdajaPretraga.SQL.Text :='select  '+
                                'kp.id,k.Ime,k.Prezime,k.JMBG,k.BrojLicne as "Broj lične karte", '+
                                'kp.Proizvod,kp.Cijena,kp.broj_rata as "Broj rata",kp.username as "Prodao", '+
                                'kp.odobreno as "Zaključano",kp.datum as "Datum" '+
                                'from kupci k '+
                                'inner join kupljeni_proizvodi kp '+
                                'on k.id = kp.id_kupca '+
                                'where ime like :ime '+
                                'and prezime like :prezime and JMBG like :JMBG '+
                                'and BrojLicne like :BrojLicne and Proizvod like :Proizvod';

  dm.QProdajaPretraga.ParamByName('ime').Value := '%'+edtImeSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('prezime').Value := '%'+edtPrezimeSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('JMBG').Value := '%'+edtJMBGSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('BrojLicne').Value := '%'+edtBrojLicneSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('Proizvod').Value := '%'+edtProizvodSearchKupovina.Text+'%';

  if chkDatum.Checked then
  begin
    dm.QProdajaPretraga.SQL.Text := dm.QProdajaPretraga.SQL.Text + ' and date(kp.datum) = :datum';
    dm.QProdajaPretraga.ParamByName('datum').Value := FormatDateTime('yyyy-MM-dd', dateDatum.date);

  end;

  dm.QProdajaPretraga.Execute;
end;

procedure TfrmKupci.btnSkenerClick(Sender: TObject);
var frmSkener : TfrmSkener;
begin
  frmMain.filePath := edtKopijaLicne.Text;
  frmSkener := TfrmSkener.create(nil);
  try
    frmSkener.ShowModal;
  finally
    frmSkener.FreeOnRelease;
    edtKopijaLicne.Text := frmMain.filePath;
  end;
end;

procedure TfrmKupci.btnUgovorStampaClick(Sender: TObject);
begin
  if cxGridProizvodiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja',mtError,[mbOk],0);
    Abort;
  end;

  dm.QUgovorStampa.Params.Clear;
  dm.QUgovorStampa.SQL.Text :='select * '+
                                  'from kupci k '+
                                  'inner join kupljeni_proizvodi kp '+
                                  'on k.id = kp.id_kupca '+
                                  'where kp.id = :id_prodaje';
  dm.QUgovorStampa.ParamByName('id_prodaje').Value := cxGridProizvodiDBTableView1id.EditValue;
  dm.QUgovorStampa.Execute;

  frmMain.frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ugovor.fr3');
  frmMain.frReport.ShowReport();
end;

procedure TfrmKupci.btnUnesiProdajuClick(Sender: TObject);
var
cijena: double;
f: TFormatSettings;
begin
  if  (Trim(edtProizvod.Text) = '') OR (Trim(edtCijena.Text) = '') OR (Trim(edtBrojRata.Text) = '') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  f.DecimalSeparator := '.';

  if TryStrToFloat(edtCijena.text, cijena, f) = false then
  begin
    MessageDlg('Cijena mora biti decimalni broj',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into kupljeni_proizvodi(id_kupca,proizvod,'+
                      'cijena,broj_rata,username,datum) values(:id_kupca,:proizvod,'+
                      ':cijena,:broj_rata,:username,Now())';

  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn1.EditValue;
  dm.Query.ParamByName('proizvod').Value := edtProizvod.Text;
  dm.Query.ParamByName('cijena').Value := cijena;
  dm.Query.ParamByName('broj_rata').Value := StrToInt(edtBrojRata.Text);
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.Execute;

  dm.QProdaja.Execute;
end;

procedure TfrmKupci.btnUnesiRatuClick(Sender: TObject);
var
iznos: double;
f: TFormatSettings;
begin
  if  (Trim(edtIznosRate.Text) = '') then
  begin
    MessageDlg('Morate unijeti iznos rate',mtError,[mbOk],0);
    Abort;
  end;

  f.DecimalSeparator := '.';

  if TryStrToFloat(edtIznosRate.text, iznos, f) = false then
  begin
    MessageDlg('Iznos rate mora biti decimalni broj',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into uplacene_rate(id_prodaje,iznos,'+
                      'username,datum) values(:id_prodaje,:iznos,'+
                      ':username,Now())';

  dm.Query.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.Query.ParamByName('iznos').Value := iznos;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.Execute;

  dm.QRate.Params.Clear;
  dm.QRate.SQL.Text := 'select * from uplacene_rate where id_prodaje = :id_prodaje';
  dm.QRate.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.QRate.Execute;
end;

procedure TfrmKupci.btnZakljucajProdajuClick(Sender: TObject);
var
zakljucaj: integer;
begin
  if cxGridProizvodiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja',mtError,[mbOk],0);
    Abort;
  end;

  if cxGridProizvodiDBTableView1odobreno.EditValue = True then
    zakljucaj := 0
  else
    zakljucaj := 1;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update kupljeni_proizvodi set odobreno=:odobreno where id=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridProizvodiDBTableView1id.EditValue;
  dm.Query.ParamByName('odobreno').Value := zakljucaj;
  dm.Query.Execute;

  dm.QProdaja.Execute;

end;

procedure TfrmKupci.btnZakljucajRatuClick(Sender: TObject);
var
zakljucaj: integer;
begin
  if gridRateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana rata',mtError,[mbOk],0);
    Abort;
  end;

  if gridRateDBTableView1odobreno.EditValue = True then
    zakljucaj := 0
  else
    zakljucaj := 1;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update uplacene_rate set odobreno=:odobreno where id=:id_rate';
  dm.Query.ParamByName('id_rate').Value := gridRateDBTableView1id.EditValue;
  dm.Query.ParamByName('odobreno').Value := zakljucaj;
  dm.Query.Execute;

  dm.QRate.Execute;

end;

procedure TfrmKupci.chkDatumClick(Sender: TObject);
begin
  if chkDatum.Checked = true then
    dateDatum.Enabled := true
  else
    dateDatum.Enabled := false;
end;

procedure TfrmKupci.cxGridPretragaKupcaDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dm.QProdaja.Params.Clear;
  dm.QProdaja.SQL.Text := 'select * from kupljeni_proizvodi where id_kupca = :id_kupca';
  dm.QProdaja.ParamByName('id_kupca').Value := cxGridDBColumn1.EditValue;
  dm.QProdaja.Execute;
end;

procedure TfrmKupci.btnObrisiGrupuClick(Sender: TObject);
begin
  if gridGrupeDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana grupa za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as br_kupaca from kupci where id_kupcigrupe=:id_grupe';
  dm.Query.ParamByName('id_grupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('br_kupaca').Value > 0 then
  begin
    MessageDlg('Ova grupa pod sobom ima kupce i ne može se brisati',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from kupcigrupe where id=:id_grupe';
  dm.Query.ParamByName('id_grupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QKupciGrupe.Execute;
end;

procedure TfrmKupci.btnObrisiKupcaClick(Sender: TObject);
begin
  if gridKorisniciDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran kupac za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as kupovina from kupljeni_proizvodi where id_kupca=:id_kupca';
  dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('kupovina').Value > 0 then
  begin
    MessageDlg('Ovaj kupac ima kupljene proizvode i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  if MessageDlg('Da li želite da obrišete kupca?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from kupci where id=:id_kupca';
  dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into kupci_history(id_kupca,akcija,username,datum) values(:id_kupca,''delete'',:username,Now())';
  dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.Execute;

  dm.QKupci.Execute;
end;

procedure TfrmKupci.btnObrisiProdajuClick(Sender: TObject);
begin

  if cxGridProizvodiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  if cxGridProizvodiDBTableView1odobreno.EditValue = True then
  begin
    MessageDlg('Ova prodaja je zaključana i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as uplate from uplacene_rate where id_prodaje=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridProizvodiDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('uplate').Value > 0 then
  begin
    MessageDlg('Ova prodaja ima uplacene rate i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from kupljeni_proizvodi where id=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridProizvodiDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QProdaja.Execute;
end;

procedure TfrmKupci.btnObrisiRatuClick(Sender: TObject);
begin

  if gridRateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana rata za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  if gridRateDBTableView1odobreno.EditValue = True then
  begin
    MessageDlg('Ova rata je zaključana i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from uplacene_rate where id=:id_rate';
  dm.Query.ParamByName('id_rate').Value := gridRateDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QRate.Execute;
end;

procedure TfrmKupci.btnPretraziKupcaClick(Sender: TObject);
begin
  dm.QKupacPretraga.Params.Clear;
  dm.QKupacPretraga.SQL.Text := 'select * from kupci where ime like :ime '+
                        'and prezime like :prezime and JMBG like :JMBG '+
                        'and BrojLicne like :BrojLicne';
  dm.QKupacPretraga.ParamByName('ime').Value := '%'+edtImeSearch.Text+'%';
  dm.QKupacPretraga.ParamByName('prezime').Value := '%'+edtPrezimeSearch.Text+'%';
  dm.QKupacPretraga.ParamByName('JMBG').Value := '%'+edtJMBGSearch.Text+'%';
  dm.QKupacPretraga.ParamByName('BrojLicne').Value := '%'+edtBrojLicneSearch.Text+'%';
  dm.QKupacPretraga.Execute;
end;

procedure TfrmKupci.btnPriznanicaClick(Sender: TObject);
begin
  if gridRateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja',mtError,[mbOk],0);
    Abort;
  end;

  dm.QPriznanicaStampa.Params.Clear;
  dm.QPriznanicaStampa.SQL.Text :='select *  '+
                                  'from kupci k '+
                                  'inner join kupljeni_proizvodi kp '+
                                  'on k.id = kp.id_kupca '+
                                  'inner join uplacene_rate u '+
                                  'on kp.id = u.id_prodaje '+
                                  'where u.id = :id_rate';
  dm.QPriznanicaStampa.ParamByName('id_rate').Value := gridRateDBTableView1id.EditValue;
  dm.QPriznanicaStampa.Execute;

  frmMain.frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\priznanica.fr3');
  frmMain.frReport.ShowReport();
end;

procedure TfrmKupci.btnIzmijeniGrupuClick(Sender: TObject);
var id:integer;
begin
  if gridGrupeDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana grupa za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if (Trim(edtGrupaBroj.Text)='') or (Trim(edtGrupaNaziv.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridGrupeDBTableView1id.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update kupcigrupe set broj=:broj, naziv=:naziv where id=:id_grupe';
  dm.Query.ParamByName('broj').Value := edtGrupaBroj.Text;
  dm.Query.ParamByName('naziv').Value := edtGrupaNaziv.Text;
  dm.Query.ParamByName('id_grupe').Value := id;
  dm.Query.Execute;

  dm.QKupciGrupe.Execute;
  dm.QKupciGrupe.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmKupci.btnIzmijeniKupcaClick(Sender: TObject);
var id: integer;
begin

  if gridKorisniciDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran kupac za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if ValidacijaPolja = false then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridKorisniciDBTableView1id.EditValue;

  if (gridKorisniciDBTableView1JMBG.EditValue <> edtJMBG.Text) and (edtJMBG.Text <> '') then
    if dm.QKupci.Locate('jmbg',edtJMBG.text,[loCaseInsensitive]) then
    begin
      MessageDlg('JMBG '+edtJMBG.text+' već postoji',mtError,[mbOk],0);
      dm.QKupci.Locate('id',id,[loCaseInsensitive]);
      Abort;
    end;

   if (gridKorisniciDBTableView1BrojLicne.EditValue <> edtBrojLicne.Text) and (edtBrojLicne.Text <> '') then
    if dm.QKupci.Locate('BrojLicne',edtBrojLicne.text,[loCaseInsensitive]) then
    begin
      MessageDlg('Broj lične karte '+edtBrojLicne.text+' već postoji',mtError,[mbOk],0);
      dm.QKupci.Locate('id',id,[loCaseInsensitive]);
      Abort;
    end;

  if MessageDlg('Da li želite da odradite izmjenu?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update kupci set id_kupcigrupe=:id_kupcigrupe, username=:username, datum=Now(), ime=:ime,prezime=:prezime,JMBG=:jmbg,brojlicne=:BrojLicne,KopijaLicne=:kopijalicne, kontakttelefon=:kontakttelefon, napomena=:napomena, napomena2=:napomena2 where id=:id_kupca';
  dm.Query.ParamByName('ime').Value := edtIme.Text;
  dm.Query.ParamByName('prezime').Value := edtPrezime.Text;
  dm.Query.ParamByName('JMBG').Value := edtJMBG.Text;
  dm.Query.ParamByName('BrojLicne').Value := edtBrojLicne.Text;
  dm.Query.ParamByName('KopijaLicne').Value := edtKopijaLicne.Text;
  dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.ParamByName('kontakttelefon').Value := edtKontaktTelefon.Text;
  dm.Query.ParamByName('napomena').Value := edtNapomena.Text;
  dm.Query.ParamByName('napomena2').Value := edtNapomena2.Text;
  dm.Query.ParamByName('id_kupcigrupe').Value := dm.QKupciGrupe.FieldByName('id').value;
  dm.Query.Execute;

  dm.QKupci.Execute;
  dm.QKupci.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmKupci.btnKupciTraziClick(Sender: TObject);
begin
  dm.QKupci.Params.Clear;
  dm.QKupci.SQL.Text := 'select * from kupci '+
                        'inner join kupcigrupe '+
                        'on kupci.id_kupcigrupe=kupcigrupe.id '+
                        'where ime like :ime '+
                        'and prezime like :prezime and JMBG like :JMBG '+
                        'and BrojLicne like :BrojLicne';
  dm.QKupci.ParamByName('ime').Value := '%'+edtKupciIme.Text+'%';
  dm.QKupci.ParamByName('prezime').Value := '%'+edtKupciPrezime.Text+'%';
  dm.QKupci.ParamByName('JMBG').Value := '%'+edtKupciJMBG.Text+'%';
  dm.QKupci.ParamByName('BrojLicne').Value := '%'+edtKupciBrojLicne.Text+'%';
  dm.QKupci.Execute;
end;

procedure TfrmKupci.btnLicnaClick(Sender: TObject);
var frmSkener : TfrmSkener;
begin
  frmMain.filePath := edtDodajKupcaLicnaKarta.Text;
  frmSkener := TfrmSkener.create(nil);
  try
    frmSkener.ShowModal;
  finally
    frmSkener.FreeOnRelease;
    edtDodajKupcaLicnaKarta.Text := frmMain.filePath;
  end;
end;

procedure TfrmKupci.btnDodajGrupuClick(Sender: TObject);
begin
  if  (Trim(edtGrupaBroj.Text)='') or (Trim(edtGrupaNaziv.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into kupcigrupe(broj,naziv) values(:broj,:naziv)';
  dm.Query.ParamByName('broj').Value := edtGrupaBroj.Text;
  dm.Query.ParamByName('naziv').Value := edtGrupaNaziv.Text;
  dm.Query.Execute;

  dm.QKupciGrupe.Execute;
end;

procedure TfrmKupci.btnDodajKupca2Click(Sender: TObject);
begin
  if  ValidacijaPolja2 = false then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  if edtDodajKupcaJMBG.Text <> '' then
    if dm.QKupci.Locate('jmbg',edtDodajKupcaJMBG.text,[loCaseInsensitive]) then
    begin
      MessageDlg('JMBG '+edtDodajKupcaJMBG.text+' već postoji',mtError,[mbOk],0);
      Abort;
    end;

  if edtDodajKupcaLicna.Text <> '' then
    if dm.QKupci.Locate('BrojLicne',edtDodajKupcaLicna.text,[loCaseInsensitive]) then
    begin
      MessageDlg('Broj lične karte '+edtDodajKupcaLicna.text+' već postoji',mtError,[mbOk],0);
      Abort;
    end;

  if MessageDlg('Da li želite da unesete kupca?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into kupci(id_kupcigrupe,ime,prezime,JMBG,BrojLicne,KopijaLicne,username,datum, kontakttelefon, napomena, napomena2) values(:id_kupcigrupe,:ime,:prezime,:JMBG,:BrojLicne,:KopijaLicne,:username,Now(),:kontakttelefon, :napomena, :napomena2)';
  dm.Query.ParamByName('id_kupcigrupe').Value := dm.QKupciGrupe.FieldByName('id').value;
  dm.Query.ParamByName('ime').Value := edtDodajKupcaIme.Text;
  dm.Query.ParamByName('prezime').Value := edtDodajKupcaPrezime.Text;
  dm.Query.ParamByName('JMBG').Value := edtDodajKupcaJMBG.Text;
  dm.Query.ParamByName('BrojLicne').Value := edtDodajKupcaLicna.Text;
  dm.Query.ParamByName('KopijaLicne').Value := edtDodajKupcaLicnaKarta.Text;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.ParamByName('kontakttelefon').Value := edtDodajKupcaTelefon.Text;
  dm.Query.ParamByName('napomena').Value := edtDodajKupcaNapomena.Text;
  dm.Query.ParamByName('napomena2').Value := edtDodajKupcaNapomena2.Text;
  dm.Query.Execute;

  dm.QKupci.Execute;

  edtDodajKupcaIme.Text:='';
  edtDodajKupcaPrezime.Text:='';
  cmbGrupaKupaca.Text:='';
  edtDodajKupcaTelefon.Text:='';
  edtDodajKupcaNapomena.Text := '';
  edtDodajKupcaLicnaKarta.Text := '';
  edtDodajKupcaNapomena2.Text := '';
  edtDodajKupcaJMBG.Text := '';
  edtDodajKupcaLicna.Text := '';

end;

procedure TfrmKupci.btnDodajKupcaClick(Sender: TObject);
begin
  if  ValidacijaPolja = false then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  if edtJMBG.Text <> '' then
    if dm.QKupci.Locate('jmbg',edtJMBG.text,[loCaseInsensitive]) then
    begin
      MessageDlg('JMBG '+edtJMBG.text+' već postoji',mtError,[mbOk],0);
      Abort;
    end;

  if edtBrojLicne.Text <> '' then
    if dm.QKupci.Locate('BrojLicne',edtBrojLicne.text,[loCaseInsensitive]) then
    begin
      MessageDlg('Broj lične karte '+edtBrojLicne.text+' već postoji',mtError,[mbOk],0);
      Abort;
    end;

  if MessageDlg('Da li želite da unesete kupca?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into kupci(id_kupcigrupe,ime,prezime,JMBG,BrojLicne,KopijaLicne,username,datum, kontakttelefon, napomena, napomena2) values(:id_kupcigrupe,:ime,:prezime,:JMBG,:BrojLicne,:KopijaLicne,:username,Now(),:kontakttelefon, :napomena, :napomena2)';
  dm.Query.ParamByName('id_kupcigrupe').Value := dm.QKupciGrupe.FieldByName('id').value;
  dm.Query.ParamByName('ime').Value := edtIme.Text;
  dm.Query.ParamByName('prezime').Value := edtPrezime.Text;
  dm.Query.ParamByName('JMBG').Value := edtJMBG.Text;
  dm.Query.ParamByName('BrojLicne').Value := edtBrojLicne.Text;
  dm.Query.ParamByName('KopijaLicne').Value := edtKopijaLicne.Text;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.ParamByName('kontakttelefon').Value := edtKontaktTelefon.Text;
  dm.Query.ParamByName('napomena').Value := edtNapomena.Text;
  dm.Query.ParamByName('napomena2').Value := edtNapomena2.Text;
  dm.Query.Execute;

  dm.QKupci.Execute;

  edtIme.Text:='';
  edtPrezime.Text:='';
  cmbGrupaKupca.Text:='';
  edtKontaktTelefon.Text:='';

end;

procedure TfrmKupci.btnExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Podaci o korisnicima.xls',gridKorisnici,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Podaci o korisnicima.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmKupci.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.indKupci := 0;
  Self.Free;
end;

procedure TfrmKupci.FormShow(Sender: TObject);
begin
  dm.QKupci.Execute;
  dm.QKupciGrupe.Execute;
  pagerKupci.RemoveAdvPage(pgKreiranjeUgovora);
  pagerKupci.RemoveAdvPage(pgRazduzivanjeRata);
  if frmMain.indAdministrator = 0 then
  begin
    btnObrisiKupca.Enabled := False;
    edtNapomena.Enabled := False;
    edtDodajKupcaNapomena.Enabled := False;
    btnExcel.Visible := False;
  end;
end;

procedure TfrmKupci.gridGrupeDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtGrupaBroj.Text := gridGrupeDBTableView1Broj.EditValue;
  edtGrupaNaziv.Text := gridGrupeDBTableView1Naziv.EditValue;
end;

procedure TfrmKupci.gridKorisniciDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    edtIme.Text := gridKorisniciDBTableView1Ime.EditValue;
    edtPrezime.Text := gridKorisniciDBTableView1Prezime.EditValue;
    edtJMBG.Text := gridKorisniciDBTableView1JMBG.EditValue;
    edtBrojLicne.Text := gridKorisniciDBTableView1BrojLicne.EditValue;
    edtKopijaLicne.Text := gridKorisniciDBTableView1KopijaLicne.EditValue;
    edtKontaktTelefon.Text := gridKorisniciDBTableView1kontaktTelefon.EditValue;
    edtNapomena.Text := gridKorisniciDBTableView1Napomena.EditValue;
    edtNapomena2.Text := gridKorisniciDBTableView1Napomena2.EditValue;
    cmbGrupaKupca.Text := gridKorisniciDBTableView1Column1.EditValue;

    dm.QKupacProdaja.Params.Clear;
    dm.QKupacProdaja.SQL.Text := 'select '+
                                'kp.id_kupca, '+
                                'kp.Proizvod, '+
                                'kp.Cijena, '+
                                'kp.broj_rata as ''Broj rata'', '+
                                'kp.datum as ''Datum kupovine'', '+
                                'kp.username as ''Prodao'', '+
                                'sum(IF(ur.iznos IS NULL, 0, ur.iznos)) as ''Plaćeno'', '+
                                'if(kp.cijena - sum(IF(ur.iznos IS NULL, 0, ur.iznos))>0,1,0) as ''Balans'' '+
                                'from kupljeni_proizvodi kp '+
                                'left join uplacene_rate ur '+
                                'on kp.id = ur.id_prodaje '+
                                'where id_kupca = :id_kupca '+
                                'group by kp.id_kupca, proizvod, cijena, broj_rata, kp.datum, kp.username ';


    dm.QKupacProdaja.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
    dm.QKupacProdaja.Execute;

end;

procedure TfrmKupci.gridKupovinaSearchDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dm.QRate.Params.Clear;
  dm.QRate.SQL.Text := 'select * from uplacene_rate where id_prodaje = :id_prodaje';
  dm.QRate.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.QRate.Execute;
end;

procedure TfrmKupci.pagerKupciChange(Sender: TObject);
begin
  dm.QKupacPretraga.Execute;
  dm.QKupciGrupe.Execute;
end;

procedure TfrmKupci.pgGrupeKupacaShow(Sender: TObject);
begin
  dm.QKupciGrupe.Execute;
end;

procedure TfrmKupci.pgKreiranjeUgovoraShow(Sender: TObject);
begin
  if frmMain.indAdministrator = 0 then
    btnZakljucajProdaju.Enabled := false
  else
    btnZakljucajProdaju.Enabled := true;
  dm.QKupacPretraga.Execute;
end;

procedure TfrmKupci.pgRazduzivanjeRataShow(Sender: TObject);
begin
  if frmMain.indAdministrator = 0 then
    btnZakljucajRatu.Enabled := false
  else
    btnZakljucajRatu.Enabled := true;
  dm.QProdajaPretraga.Execute;
  dateDatum.Date := Now;
end;

function TfrmKupci.ValidacijaPolja():bool;
begin
//  if (Trim(edtIme.Text)='')or(Trim(edtPrezime.Text)='')or(Trim(edtJMBG.Text)='')or(Trim(edtBrojLicne.Text)='') then
  if (Trim(edtIme.Text)='')or(Trim(edtPrezime.Text)='')or(Trim(cmbGrupaKupca.Text)='') then
    result := false
  else
    result := true;
end;

function TfrmKupci.ValidacijaPolja2():bool;
begin
//  if (Trim(edtIme.Text)='')or(Trim(edtPrezime.Text)='')or(Trim(edtJMBG.Text)='')or(Trim(edtBrojLicne.Text)='') then
  if (Trim(edtDodajKupcaIme.Text)='')or(Trim(edtDodajKupcaPrezime.Text)='')or(Trim(cmbGrupaKupaca.Text)='') then
    result := false
  else
    result := true;
end;


end.
