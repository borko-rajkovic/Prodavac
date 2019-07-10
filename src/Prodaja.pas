unit Prodaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, AdvOfficePager,
  AdvOfficePagerStylers, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, AdvGlowButton,
  CurvyControls, Vcl.StdCtrls, AdvSmoothLabel, AdvScrollBox, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, AdvMetroScrollBox, cxCheckBox, AdvSmoothEdit,
  AdvSmoothEditButton, AdvSmoothDatePicker, cxButtonEdit, cxCalendar;

type
  TfrmProdaja = class(TForm)
    pagerProdaja: TAdvOfficePager;
    pgProdajaNaRate: TAdvOfficePage;
    lblPretragaKupca: TAdvSmoothLabel;
    lblInformacijeOProdaji: TAdvSmoothLabel;
    pnlProdaja: TCurvyPanel;
    lblCijena: TLabel;
    lblProizvod: TLabel;
    lblBrojRata: TLabel;
    edtCijena: TCurvyEdit;
    edtBrojRata: TCurvyEdit;
    btnUnesiProdaju: TAdvGlowButton;
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    pgProdajaZaGotovinu: TAdvOfficePage;
    gridKorisnici: TcxGrid;
    gridKorisniciDBTableView1: TcxGridDBTableView;
    gridKorisniciDBTableView1id: TcxGridDBColumn;
    gridKorisniciDBTableView1Prezime: TcxGridDBColumn;
    gridKorisniciDBTableView1Ime: TcxGridDBColumn;
    gridKorisniciDBTableView1JMBG: TcxGridDBColumn;
    gridKorisniciDBTableView1BrojLicne: TcxGridDBColumn;
    gridKorisniciDBTableView1KopijaLicne: TcxGridDBColumn;
    gridKorisniciDBTableView1kontaktTelefon: TcxGridDBColumn;
    gridKorisniciDBTableView1Napomena: TcxGridDBColumn;
    gridKorisniciDBTableView1username: TcxGridDBColumn;
    gridKorisniciDBTableView1datum: TcxGridDBColumn;
    gridKorisniciDBTableView1Column1: TcxGridDBColumn;
    gridKorisniciDBTableView1idKupciGrupe: TcxGridDBColumn;
    gridKorisniciLevel1: TcxGridLevel;
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
    scrollboxProdajaNaRate: TAdvScrollBox;
    gridModeliDetalji: TcxGrid;
    gridModeliDetaljiDBTableView1: TcxGridDBTableView;
    gridModeliDetaljiDBTableView1id: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1id_modela: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1velicina: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1brojkomada: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1barkod: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Label1: TLabel;
    cmbProdajaProizvod: TcxLookupComboBox;
    cmbProdajaProdavac: TcxLookupComboBox;
    Label2: TLabel;
    cmbProdajaPopust: TcxLookupComboBox;
    lblPregledProdaja: TAdvSmoothLabel;
    pnlPregledProdaja: TCurvyPanel;
    gridProizvodi: TcxGrid;
    cxGridProizvodiDBTableView1: TcxGridDBTableView;
    cxGridProizvodiDBTableView1id: TcxGridDBColumn;
    cxGridProizvodiDBTableView1id_kupca: TcxGridDBColumn;
    cxGridProizvodiDBTableView1proizvod: TcxGridDBColumn;
    cxGridProizvodiDBTableView1cijena: TcxGridDBColumn;
    cxGridProizvodiDBTableView1broj_rata: TcxGridDBColumn;
    cxGridProizvodiDBTableView1username: TcxGridDBColumn;
    cxGridProizvodiDBTableView1datum: TcxGridDBColumn;
    cxGridProizvodiDBTableView1odobreno: TcxGridDBColumn;
    cxGridProizvodiLevel1: TcxGridLevel;
    btnObrisiProdaju: TAdvGlowButton;
    btnZakljucajProdaju: TAdvGlowButton;
    cxGridProizvodiDBTableView1Velicina: TcxGridDBColumn;
    cxGridProizvodiDBTableView1popust: TcxGridDBColumn;
    cxGridProizvodiDBTableView1id_velicine: TcxGridDBColumn;
    lblUnosProdajeKes: TAdvSmoothLabel;
    pnlProdajaKes: TCurvyPanel;
    lblCijenaKes: TLabel;
    lblProizvodKes: TLabel;
    lblProdavacKes: TLabel;
    lblPopustKes: TLabel;
    edtCijenaKes: TCurvyEdit;
    btnUnesiKes: TAdvGlowButton;
    gridModeliDetaljiKes: TcxGrid;
    gridModeliDetaljiKesDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cmbProizvodKes: TcxLookupComboBox;
    cmbProdavacKes: TcxLookupComboBox;
    cmbPopustKes: TcxLookupComboBox;
    lblPregledProdajeKes: TAdvSmoothLabel;
    pnlPregledProdajaKes: TCurvyPanel;
    gridProizvodiKes: TcxGrid;
    gridProizvodiKesDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
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
    cxGridLevel2: TcxGridLevel;
    btnObrisiKes: TAdvGlowButton;
    btnZakljucajKes: TAdvGlowButton;
    scrollboxProdajaZaKes: TAdvScrollBox;
    pgRazduzivanjeRata: TAdvOfficePage;
    lblPretragaKupovina: TAdvSmoothLabel;
    lblInformacijeORazduzenju: TAdvSmoothLabel;
    pnlSearchKupovine: TCurvyPanel;
    lblImeSearchKupovina: TLabel;
    lblPrezimeSearchKupovina: TLabel;
    lblJMBGSearchKupovina: TLabel;
    lblBrojLicneSearchKupovina: TLabel;
    lblProizvodSearch: TLabel;
    edtImeSearchKupovina: TCurvyEdit;
    edtPrezimeSearchKupovina: TCurvyEdit;
    edtJMBGSearchKupovina: TCurvyEdit;
    edtBrojLicneSearchKupovina: TCurvyEdit;
    btnSearchKupovine: TAdvGlowButton;
    dateDatum: TAdvSmoothDatePicker;
    gridKupovinaSearch: TcxGrid;
    gridKupovinaSearchDBTableView1: TcxGridDBTableView;
    gridKupovinaSearchDBTableView1id: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Prezime: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Ime: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1JMBG: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Brojlinekarte: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Proizvod: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Cijena: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1CijenaSaPopustom: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Prodao: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Datum: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Zakljuano: TcxGridDBColumn;
    gridKupovinaSearchLevel1: TcxGridLevel;
    pnlRazduzenje: TCurvyPanel;
    lblIznos: TLabel;
    edtIznosRate: TCurvyEdit;
    btnUnesiRatu: TAdvGlowButton;
    btnObrisiRatu: TAdvGlowButton;
    btnZakljucajRatu: TAdvGlowButton;
    gridRate: TcxGrid;
    gridRateDBTableView1: TcxGridDBTableView;
    gridRateDBTableView1id: TcxGridDBColumn;
    gridRateDBTableView1id_prodaje: TcxGridDBColumn;
    gridRateDBTableView1iznos: TcxGridDBColumn;
    gridRateDBTableView1username: TcxGridDBColumn;
    gridRateDBTableView1datum: TcxGridDBColumn;
    gridRateDBTableView1odobreno: TcxGridDBColumn;
    gridRateLevel1: TcxGridLevel;
    chkDatum: TcxCheckBox;
    scrollboxRazduzivanjeRata: TAdvScrollBox;
    cmbProizvodRazdruzivanjeRata: TcxLookupComboBox;
    pgUplate: TAdvOfficePage;
    lblUplatePretragaKupca: TAdvSmoothLabel;
    gridUplateKupci: TcxGrid;
    gridUplateKupciDBTableView1: TcxGridDBTableView;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    pnlUplateKupac: TCurvyPanel;
    lblUplateIme: TLabel;
    lblUplatePrezime: TLabel;
    lblUplateJMBG: TLabel;
    lblUplateBrojLicne: TLabel;
    edtUplateIme: TCurvyEdit;
    edtUplatePrezime: TCurvyEdit;
    edtUplateJMBG: TCurvyEdit;
    edtUplateBrojLicne: TCurvyEdit;
    btnUplatePretrazi: TAdvGlowButton;
    lblUplate: TAdvSmoothLabel;
    gridUplate: TcxGrid;
    gridUplateDBTableView1: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    pnlUplate: TCurvyPanel;
    lblUplataIznos: TLabel;
    edtUplata: TCurvyEdit;
    btnUplataUnesi: TAdvGlowButton;
    scrollboxUplate: TAdvScrollBox;
    gridUplateRate: TcxGrid;
    gridUplateRateDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    gridUplateRateDBTableView1id: TcxGridDBColumn;
    gridUplateRateDBTableView1id_uplate: TcxGridDBColumn;
    gridUplateRateDBTableView1id_prodaje: TcxGridDBColumn;
    gridUplateRateDBTableView1iznos: TcxGridDBColumn;
    gridUplateRateDBTableView1odobreno: TcxGridDBColumn;
    gridUplateRateDBTableView1username: TcxGridDBColumn;
    gridUplateRateDBTableView1datum: TcxGridDBColumn;
    gridUplateRateDBTableView1proizvod: TcxGridDBColumn;
    gridUplateDBTableView1id: TcxGridDBColumn;
    gridUplateDBTableView1id_kupca: TcxGridDBColumn;
    gridUplateDBTableView1iznos: TcxGridDBColumn;
    gridUplateDBTableView1username: TcxGridDBColumn;
    gridUplateDBTableView1datum: TcxGridDBColumn;
    CurvyPanel1: TCurvyPanel;
    btnUplataObrisi: TAdvGlowButton;
    btnUplataZakljucaj: TAdvGlowButton;
    gridKorisniciDBTableView1Kartica: TcxGridDBColumn;
    cxGridProizvodiDBTableView1Stampa: TcxGridDBColumn;
    gridRateDBTableView1Stampa: TcxGridDBColumn;
    gridUplateKupciDBTableView1Kartica: TcxGridDBColumn;
    gridUplateDBTableView1Stampa: TcxGridDBColumn;
    lblBrojKomada: TLabel;
    edtBrojKomada: TCurvyEdit;
    lblBrojKomadaKes: TLabel;
    edtBrojKomadaKes: TCurvyEdit;
    cxGridProizvodiDBTableView1brojkomada: TcxGridDBColumn;
    gridProizvodiKesDBTableView2brojkomada: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Brojrata: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1Popust: TcxGridDBColumn;
    gridKupovinaSearchDBTableView1BrojKomada: TcxGridDBColumn;
    cmbRataProdavac: TcxLookupComboBox;
    lblRataProdavac: TLabel;
    lblUplataProdavac: TLabel;
    cmbUplataProdavac: TcxLookupComboBox;
    pnlInformacijeOKupcu: TCurvyPanel;
    lblIme: TLabel;
    lblPrezime: TLabel;
    lblJMBG: TLabel;
    lblBrojLicne: TLabel;
    lblKontaktTelefon: TLabel;
    lblGrupaKupca: TLabel;
    edtIme: TCurvyEdit;
    edtPrezime: TCurvyEdit;
    edtJMBG: TCurvyEdit;
    edtBrojLicne: TCurvyEdit;
    edtKontaktTelefon: TCurvyEdit;
    edtGrupaKupca: TCurvyEdit;
    lblInformacijeOKupcu: TAdvSmoothLabel;
    gridUplateRate2: TcxGrid;
    gridUplateRate2DBTableView1: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    gridUplateRate2DBTableView1saldo: TcxGridDBColumn;
    gridUplateRate2DBTableView1preostali: TcxGridDBColumn;
    gridUplateRate2DBTableView1uvaluti: TcxGridDBColumn;
    procedure btnKupciTraziClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridKorisniciDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cmbProdajaProizvodPropertiesCloseUp(Sender: TObject);
    procedure btnUnesiProdajuClick(Sender: TObject);
    procedure btnObrisiProdajuClick(Sender: TObject);
    procedure btnZakljucajProdajuClick(Sender: TObject);
    procedure pgProdajaZaGotovinuShow(Sender: TObject);
    procedure btnUnesiKesClick(Sender: TObject);
    procedure btnObrisiKesClick(Sender: TObject);
    procedure btnZakljucajKesClick(Sender: TObject);
    procedure pgProdajaNaRateShow(Sender: TObject);
    procedure btnSearchKupovineClick(Sender: TObject);
    procedure chkDatumClick(Sender: TObject);
    procedure pgRazduzivanjeRataShow(Sender: TObject);
    procedure gridKupovinaSearchDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnUnesiRatuClick(Sender: TObject);
    procedure btnObrisiRatuClick(Sender: TObject);
    procedure btnZakljucajRatuClick(Sender: TObject);
    procedure btnUplatePretraziClick(Sender: TObject);
    procedure btnUplataZakljucajClick(Sender: TObject);
    procedure btnUplataObrisiClick(Sender: TObject);
    procedure gridUplateKupciDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gridUplateDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnUplataUnesiClick(Sender: TObject);
    procedure gridKorisniciDBTableView1KarticaPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGridProizvodiDBTableView1StampaPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure gridRateDBTableView1StampaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure gridUplateKupciDBTableView1KarticaPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure gridUplateDBTableView1StampaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridProizvodiDBTableView1ZakljucajPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure gridKorisniciClick();
    procedure gridUplateKupciClick();
    procedure gridUplateClick();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdaja: TfrmProdaja;



implementation

{$R *.dfm}

uses DataModule, Main, KarticaKupca;

procedure TfrmProdaja.btnKupciTraziClick(Sender: TObject);
begin
  if (Trim(edtKupciIme.Text)='') AND (Trim(edtKupciPrezime.Text)='') AND (Trim(edtKupciJMBG.Text)='') AND (Trim(edtKupciBrojLicne.Text)='') then
    begin
      dm.QKupci.Close;
    end
  else
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
end;

procedure TfrmProdaja.btnObrisiKesClick(Sender: TObject);
var
vraceno: integer;
begin
  if cxGridDBColumn6.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  if cxGridDBColumn15.EditValue = True then
  begin
    MessageDlg('Ova prodaja je zaključana i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as uplate from uplacene_rate where id_prodaje=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridDBColumn6.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('uplate').Value > 0 then
  begin
    MessageDlg('Ova prodaja ima uplacene rate i ne može se brisati',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da obrišete prodaju?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from kupljeni_proizvodi where id=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridDBColumn6.EditValue;
  dm.Query.Execute;

  vraceno := gridProizvodiKesDBTableView2brojkomada.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artmodelidetalji set brojkomada = brojkomada+:vraceno where id = :id_artmodelidetalji';
  dm.Query.ParamByName('id_artmodelidetalji').Value := cxGridDBColumn16.EditValue;
  dm.Query.ParamByName('vraceno').Value := vraceno;
  dm.Query.Execute;

  dm.QProdajaPregledKes.Execute;
  dm.QProdajaProizvodDetalji.Execute;
end;

procedure TfrmProdaja.btnObrisiProdajuClick(Sender: TObject);
var
vraceno: integer;
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

  if MessageDlg('Da li želite da obrišete prodaju?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from kupljeni_proizvodi where id=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridProizvodiDBTableView1id.EditValue;
  dm.Query.Execute;

  vraceno := cxGridProizvodiDBTableView1brojkomada.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artmodelidetalji set brojkomada = brojkomada+:vraceno where id = :id_artmodelidetalji';
  dm.Query.ParamByName('id_artmodelidetalji').Value := cxGridProizvodiDBTableView1id_velicine.EditValue;
  dm.Query.ParamByName('vraceno').Value := vraceno;
  dm.Query.Execute;

  dm.QProdajaPregled.Execute;
  dm.QProdajaProizvodDetalji.Execute;
end;

procedure TfrmProdaja.btnObrisiRatuClick(Sender: TObject);
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

  if MessageDlg('Da li želite da obrišete ratu?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from uplacene_rate where id=:id_rate';
  dm.Query.ParamByName('id_rate').Value := gridRateDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QRate.Execute;
end;

procedure TfrmProdaja.btnSearchKupovineClick(Sender: TObject);
begin
  dm.QProdajaPretraga.Params.Clear;
  dm.QProdajaPretraga.SQL.Text :='select  '+
                                'kp.id,k.Ime,k.Prezime,k.JMBG,k.BrojLicne as "Broj lične karte", '+
                                'kp.Proizvod,kp.Cijena,kp.brojkomada,kp.broj_rata as "Broj rata",kor.username as "Prodao",kp.popust as "Popust", '+
                                'kp.odobreno as "Zaključano",kp.datum as "Datum",kp.cijena - kp.popust/100*kp.cijena as "Cijena sa popustom" '+
                                'from kupci k '+
                                'inner join kupljeni_proizvodi kp '+
                                'on k.id = kp.id_kupca '+
                                'inner join korisnici kor '+
                                'on kp.id_prodavca = kor.id '+
                                'where kp.broj_rata>0 and k.ime like :ime '+
                                'and k.prezime like :prezime and JMBG like :JMBG '+
                                'and k.BrojLicne like :BrojLicne and Proizvod like :Proizvod';

  dm.QProdajaPretraga.ParamByName('ime').Value := '%'+edtImeSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('prezime').Value := '%'+edtPrezimeSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('JMBG').Value := '%'+edtJMBGSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('BrojLicne').Value := '%'+edtBrojLicneSearchKupovina.Text+'%';
  dm.QProdajaPretraga.ParamByName('Proizvod').Value := '%'+cmbProizvodRazdruzivanjeRata.Text+'%';

  if chkDatum.Checked then
  begin
    dm.QProdajaPretraga.SQL.Text := dm.QProdajaPretraga.SQL.Text + ' and date(kp.datum) = :datum';
    dm.QProdajaPretraga.ParamByName('datum').Value := FormatDateTime('yyyy-MM-dd', dateDatum.date);

  end;

  dm.QProdajaPretraga.Execute;
end;

procedure TfrmProdaja.btnUnesiKesClick(Sender: TObject);
var
cijena, popust: double;
f: TFormatSettings;
raspolozivokomada,brojkomada: integer;
begin

  raspolozivokomada := 0;

  if  (Trim(cmbProizvodKes.Text) = '') OR (Trim(cmbProdavacKes.Text) = '') OR (Trim(edtCijenaKes.Text) = '') OR (Trim(edtBrojKomadaKes.Text) = '') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  if cxGridDBColumn1.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana veličina proizvoda',mtError,[mbOk],0);
    Abort;
  end;

  brojkomada := StrToInt(edtBrojKomadaKes.Text);

  if (cxGridDBColumn4.EditValue - brojkomada < 0) OR (StrToInt(edtBrojKomadaKes.Text)=0) then
  begin
    MessageDlg('Ispravite broj komada',mtError,[mbOk],0);
    Abort;
  end;

  f.DecimalSeparator := '.';

  if TryStrToFloat(StringReplace(edtCijenaKes.text,',','.',[rfReplaceAll, rfIgnoreCase]), cijena, f) = false then
  begin
    MessageDlg('Cijena mora biti decimalni broj',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da unesete prodaju?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;


  if cmbPopustKes.Text = '' then
    begin
      popust := 0;
    end
  else
    begin
      popust := dm.QProdajaPopustIznos.Value;
    end;

  if not dm.connMySQL.InTransaction then
    dm.connMySQL.StartTransaction;
  try
    dm.Query.Params.Clear;
    dm.Query.SQL.Text := 'select brojkomada from artmodelidetalji where id = :id_artmodelidetalji';
    dm.Query.ParamByName('id_artmodelidetalji').Value := cxGridDBColumn1.EditValue;
    dm.Query.Execute;

    raspolozivokomada := dm.Query.FieldByName('brojkomada').Value;

    if raspolozivokomada-brojkomada>=0 then
    begin
        dm.Query.Params.Clear;
        dm.Query.SQL.Text := 'insert into kupljeni_proizvodi(id_kupca,proizvod,'+
                            'cijena,broj_rata,id_velicine,velicina,popust,username,datum,brojkomada,id_prodavca) values(:id_kupca,:proizvod,'+
                            ':cijena,:broj_rata,:id_velicine,:velicina,:popust,:username,Now(),:brojkomada,:id_prodavca)';

        dm.Query.ParamByName('id_kupca').Value := 0;
        dm.Query.ParamByName('proizvod').Value := cmbProizvodKes.Text;
        dm.Query.ParamByName('cijena').Value := cijena;
        dm.Query.ParamByName('broj_rata').Value := 0;
        dm.Query.ParamByName('id_velicine').Value := cxGridDBColumn1.EditValue;
        dm.Query.ParamByName('velicina').Value := cxGridDBColumn3.EditValue;
        dm.Query.ParamByName('popust').Value := popust;
        dm.Query.ParamByName('username').Value := frmMain.username;
        dm.Query.ParamByName('brojkomada').Value := brojkomada;
        dm.Query.ParamByName('id_prodavca').Value := dm.QProdajaProdavac.FieldByName('id').Value;
        dm.Query.Execute;

        dm.Query.Params.Clear;
        dm.Query.SQL.Text := 'update artmodelidetalji set brojkomada = brojkomada-:brojkomada where id = :id_artmodelidetalji';
        dm.Query.ParamByName('id_artmodelidetalji').Value := cxGridDBColumn1.EditValue;
        dm.Query.ParamByName('brojkomada').Value := brojkomada;
        dm.Query.Execute;
    end;

      dm.connMySQL.Commit;
  except
    dm.connMySQL.Rollback;
  end;

  dm.QProdajaProizvodDetalji.Execute;
  dm.QProdajaPregledKes.Execute;

  if raspolozivokomada-brojkomada < 0 then
    begin
      MessageDlg('Ispravite broj komada',mtError,[mbOk],0);
      Abort;
    end
  else
    begin
      cmbProizvodKes.Text := '';
      cmbProdavacKes.Text := '';
      edtCijenaKes.Text := '';
      edtBrojKomadaKes.Text := '1';
      cmbPopustKes.Text := '';
      dm.QProdajaProizvodDetalji.Close;
    end;
end;

procedure TfrmProdaja.btnUnesiProdajuClick(Sender: TObject);
var
cijena, popust: double;
f: TFormatSettings;
brojkomada, raspolozivokomada: integer;
begin

  brojkomada := -1;
  raspolozivokomada := 0;

  if gridKorisniciDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran kupac',mtError,[mbOk],0);
    Abort;
  end;

  if  (Trim(cmbProdajaProdavac.Text) = '') OR (Trim(cmbProdajaProizvod.Text) = '') OR (Trim(edtCijena.Text) = '') OR (Trim(edtBrojRata.Text) = '') OR (Trim(edtBrojKomada.Text) = '') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  if gridModeliDetaljiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana veličina proizvoda',mtError,[mbOk],0);
    Abort;
  end;

  if (gridModeliDetaljiDBTableView1brojkomada.EditValue - StrToInt(edtBrojKomada.Text) < 0) OR (StrToInt(edtBrojKomada.Text)=0) then
  begin
    MessageDlg('Ispravite broj komada',mtError,[mbOk],0);
    Abort;
  end;

  f.DecimalSeparator := '.';

  if TryStrToFloat(StringReplace(edtCijena.text,',','.',[rfReplaceAll, rfIgnoreCase]), cijena, f) = false then
  begin
    MessageDlg('Cijena mora biti decimalni broj',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da unesete prodaju?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  if cmbProdajaPopust.Text = '' then
    begin
      popust := 0;
    end
  else
    begin
      popust := dm.QProdajaPopustIznos.Value;
    end;

  if not dm.connMySQL.InTransaction then
    dm.connMySQL.StartTransaction;
  try
    dm.Query.Params.Clear;
    dm.Query.SQL.Text := 'select brojkomada from artmodelidetalji where id = :id_artmodelidetalji';
    dm.Query.ParamByName('id_artmodelidetalji').Value := gridModeliDetaljiDBTableView1id.EditValue;
    dm.Query.Execute;

    raspolozivokomada := dm.Query.FieldByName('brojkomada').Value;
    brojkomada := StrToInt(edtBrojKomada.Text);

    if raspolozivokomada-brojkomada>=0 then
    begin
        dm.Query.Params.Clear;
        dm.Query.SQL.Text := 'insert into kupljeni_proizvodi(id_kupca,proizvod,'+
                            'cijena,broj_rata,id_velicine,velicina,popust,username,datum,brojkomada,id_prodavca) values(:id_kupca,:proizvod,'+
                            ':cijena,:broj_rata,:id_velicine,:velicina,:popust,:username,Now(),:brojkomada,:id_prodavca)';

        dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
        dm.Query.ParamByName('proizvod').Value := cmbProdajaProizvod.Text;
        dm.Query.ParamByName('cijena').Value := cijena;
        dm.Query.ParamByName('broj_rata').Value := StrToInt(edtBrojRata.Text);
        dm.Query.ParamByName('id_velicine').Value := gridModeliDetaljiDBTableView1id.EditValue;
        dm.Query.ParamByName('velicina').Value := gridModeliDetaljiDBTableView1velicina.EditValue;
        dm.Query.ParamByName('popust').Value := popust;
        dm.Query.ParamByName('username').Value := frmMain.username;
        dm.Query.ParamByName('brojkomada').Value := brojkomada;
        dm.Query.ParamByName('id_prodavca').Value := dm.QProdajaProdavac.FieldByName('id').Value;
        dm.Query.Execute;

        dm.Query.Params.Clear;
        dm.Query.SQL.Text := 'update artmodelidetalji set brojkomada = brojkomada-:brojkomada where id = :id_artmodelidetalji';
        dm.Query.ParamByName('id_artmodelidetalji').Value := gridModeliDetaljiDBTableView1id.EditValue;
        dm.Query.ParamByName('brojkomada').Value := brojkomada;
        dm.Query.Execute;
    end;

      dm.connMySQL.Commit;
  except
    dm.connMySQL.Rollback;
  end;

  dm.QProdajaProizvodDetalji.Execute;
  dm.QProdajaPregled.Execute;

  if raspolozivokomada-brojkomada < 0 then
    begin
      MessageDlg('Ispravite broj komada',mtError,[mbOk],0);
      Abort;
    end
  else
    begin
      cmbProdajaProizvod.Text := '';
      cmbProdajaProdavac.Text := '';
      edtCijena.Text := '';
      edtBrojKomada.Text := '1';
      cmbProdajaPopust.Text := '';
      dm.QProdajaProizvodDetalji.Close;
    end;
end;

procedure TfrmProdaja.btnUnesiRatuClick(Sender: TObject);
var
iznos, uplaceno: double;
f: TFormatSettings;
id_uplate: integer;
begin

  if  (Trim(cmbRataProdavac.Text) = '') then
  begin
    MessageDlg('Morate odabrati prodavca',mtError,[mbOk],0);
    Abort;
  end;

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
  dm.Query.SQL.Text := 'select sum(iznos) as uplaceno from uplacene_rate where id_prodaje = :id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.Query.Execute;

  if (dm.Query.RecordCount = 0) Or (dm.Query.FieldByName('uplaceno').Value=Null) then
    uplaceno := 0
  else
    uplaceno := dm.Query.FieldByName('uplaceno').Value;

  if (iznos+uplaceno)>gridKupovinaSearchDBTableView1CijenaSaPopustom.EditValue*gridKupovinaSearchDBTableView1BrojKomada.EditValue then
  begin
    MessageDlg('Iznos rate je prevelik. Ostalo je neuplaceno: '+string(gridKupovinaSearchDBTableView1CijenaSaPopustom.EditValue*gridKupovinaSearchDBTableView1BrojKomada.EditValue-uplaceno)+' eura',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da unesete ratu?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into uplate(id_kupca,iznos,'+
                      'username,datum,id_prodavca) values(:id_kupca,:iznos,'+
                      ':username,Now(),:id_prodavca);SELECT LAST_INSERT_ID() as id;';

  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.Query.ParamByName('iznos').Value := iznos;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.ParamByName('id_prodavca').Value := dm.QProdajaProdavac.FieldByName('id').Value;
  dm.Query.Execute;

  id_uplate := dm.Query.FieldByName('id').Value;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into uplacene_rate(id_prodaje,iznos,'+
                      'username,datum,id_uplate) values(:id_prodaje,:iznos,'+
                      ':username,Now(),:id_uplate)';

  dm.Query.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.Query.ParamByName('iznos').Value := iznos;
  dm.Query.ParamByName('username').Value := cmbProdajaProdavac.Text;
  dm.Query.ParamByName('id_uplate').Value := id_uplate;
  dm.Query.Execute;

  dm.QRate.Params.Clear;
  dm.QRate.SQL.Text := 'select * from uplacene_rate where id_prodaje = :id_prodaje';
  dm.QRate.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.QRate.Execute;

  edtIznosRate.Text := '';
  cmbRataProdavac.Text := '';
end;

procedure TfrmProdaja.btnUplataObrisiClick(Sender: TObject);
begin
  if gridUplateRateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana uplata za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  if gridUplateRateDBTableView1odobreno.EditValue = True then
  begin
    MessageDlg('Ova uplata je zaključana i ne može se brisati',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da obrišete ratu?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from uplacene_rate where id=:id_rate';
  dm.Query.ParamByName('id_rate').Value := gridUplateRateDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QUplateRate.Execute;
  dm.QUplate.Execute;
end;

procedure TfrmProdaja.btnUplataUnesiClick(Sender: TObject);
var
iznos, uplaceno, duguje, rata: double;
f: TFormatSettings;
id_uplate: integer;
begin

  if  (Trim(cmbUplataProdavac.Text) = '') then
  begin
    MessageDlg('Morate odabrati prodavca',mtError,[mbOk],0);
    Abort;
  end;


  if  (Trim(edtUplata.Text) = '') then
  begin
    MessageDlg('Morate unijeti iznos uplate',mtError,[mbOk],0);
    Abort;
  end;

  edtUplata.Text := StringReplace(edtUplata.Text,',','.',[]);

  f.DecimalSeparator := '.';

  if TryStrToFloat(edtUplata.text, iznos, f) = false then
  begin
    MessageDlg('Iznos uplate mora biti decimalni broj',mtError,[mbOk],0);
    Abort;
  end;

  if iznos <= 0 then
  begin
    MessageDlg('Iznos uplate mora biti veći od 0',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select sum(iznos) as uplaceno from uplacene_rate '+
                       'where id_prodaje in (select id from kupljeni_proizvodi where id_kupca = :id_kupca)';
  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.Query.Execute;

  if (dm.Query.RecordCount = 0) Or (dm.Query.FieldByName('uplaceno').Value=Null) then
    uplaceno := 0
  else
    uplaceno := dm.Query.FieldByName('uplaceno').Value;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select sum((cijena-cijena*popust/100)*brojkomada) as duguje from kupljeni_proizvodi where id_kupca = :id_kupca;';
  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.Query.Execute;

  if (dm.Query.RecordCount = 0) Or (dm.Query.FieldByName('duguje').Value=Null) then
    duguje := 0
  else
    duguje := dm.Query.FieldByName('duguje').Value;


  if (iznos+uplaceno)>duguje then
  begin
    MessageDlg('Iznos rate je prevelik. Ostalo je neuplaceno: '+FloatToStr(duguje-uplaceno)+' eura',mtError,[mbOk],0);
    Abort;
  end;

  if MessageDlg('Da li želite da unesete ratu?',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrNo then
  begin
    Abort;
  end;


  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into uplate(id_kupca,iznos,'+
                      'username,datum,id_prodavca) values(:id_kupca,:iznos,'+
                      ':username,Now(),:id_prodavca);SELECT LAST_INSERT_ID() as id;';

  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.Query.ParamByName('iznos').Value := iznos;
  dm.Query.ParamByName('username').Value := frmMain.username;
  dm.Query.ParamByName('id_prodavca').Value := dm.QProdajaProdavac.FieldByName('id').Value;
  dm.Query.Execute;

  id_uplate := dm.Query.FieldByName('id').Value;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text :=  'select  '+
                        'k.id as id_kupca, '+
                        'kp.id as id_prodaje, '+
                        '(kp.cijena - kp.cijena*kp.popust/100)*brojkomada as cijena, '+
                        '(sum(IFNULL(ur.iznos,0))) as uplaceno '+
                        'from kupci k '+
                        'inner join kupljeni_proizvodi kp '+
                        'on k.id = kp.id_kupca '+
                        'left join uplacene_rate ur '+
                        'on ur.id_prodaje = kp.id '+
                        'where k.id = :id_kupca '+
                        'group by kp.id, ((kp.cijena - kp.cijena*kp.popust/100)*brojkomada) '+
                        'order by kp.datum ';
  dm.Query.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.Query.Execute;

  while iznos>0 do
  begin
      if iznos>dm.Query.FieldByName('cijena').Value-dm.Query.FieldByName('uplaceno').Value then
        rata := dm.Query.FieldByName('cijena').Value-dm.Query.FieldByName('uplaceno').Value
      else
        rata := iznos;

      if rata>0 then
      begin
          dm.Query2.Params.Clear;
          dm.Query2.SQL.Text :=  'insert into uplacene_rate(id_prodaje,iznos,'+
                                 'username,datum,id_uplate) values(:id_prodaje,:iznos,'+
                                 ':username,Now(),:id_uplate)';

          dm.Query2.ParamByName('id_prodaje').Value := dm.Query.FieldByName('id_prodaje').Value;
          dm.Query2.ParamByName('iznos').Value := rata;
          dm.Query2.ParamByName('id_uplate').Value := id_uplate;
          dm.Query2.ParamByName('username').Value := frmMain.username;
          dm.Query2.Execute;
      end;

      iznos := iznos - rata;

      dm.Query.Next;
  end;

  dm.QUplate.Execute;
  dm.QUplateRate.Close;

  edtUplata.Text := '';
  cmbUplataProdavac.Text := '';
end;

procedure TfrmProdaja.btnUplataZakljucajClick(Sender: TObject);
var
zakljucaj: integer;
begin
  if gridUplateRateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana uplata',mtError,[mbOk],0);
    Abort;
  end;

  if gridUplateRateDBTableView1odobreno.EditValue = True then
    zakljucaj := 0
  else
    zakljucaj := 1;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update uplacene_rate set odobreno=:odobreno where id=:id_rate';
  dm.Query.ParamByName('id_rate').Value := gridUplateRateDBTableView1id.EditValue;
  dm.Query.ParamByName('odobreno').Value := zakljucaj;
  dm.Query.Execute;

  dm.QUplateRate.Execute;

end;

procedure TfrmProdaja.btnUplatePretraziClick(Sender: TObject);
begin
  if (Trim(edtUplateIme.Text)='') AND (Trim(edtUplatePrezime.Text)='') AND (Trim(edtUplateJMBG.Text)='') AND (Trim(edtUplateBrojLicne.Text)='') then
    begin
      dm.QKupci.Close;
    end
  else
    begin
      dm.QKupci.Params.Clear;
      dm.QKupci.SQL.Text := 'select * from kupci '+
                            'inner join kupcigrupe '+
                            'on kupci.id_kupcigrupe=kupcigrupe.id '+
                            'where ime like :ime '+
                            'and prezime like :prezime and JMBG like :JMBG '+
                            'and BrojLicne like :BrojLicne';
      dm.QKupci.ParamByName('ime').Value := '%'+edtUplateIme.Text+'%';
      dm.QKupci.ParamByName('prezime').Value := '%'+edtUplatePrezime.Text+'%';
      dm.QKupci.ParamByName('JMBG').Value := '%'+edtUplateJMBG.Text+'%';
      dm.QKupci.ParamByName('BrojLicne').Value := '%'+edtUplateBrojLicne.Text+'%';
      dm.QKupci.Execute;
    end;
end;

procedure TfrmProdaja.btnZakljucajKesClick(Sender: TObject);
var
zakljucaj: integer;
begin
  if cxGridDBColumn6.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana prodaja',mtError,[mbOk],0);
    Abort;
  end;

  if cxGridDBColumn15.EditValue = True then
    zakljucaj := 0
  else
    zakljucaj := 1;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update kupljeni_proizvodi set odobreno=:odobreno where id=:id_prodaje';
  dm.Query.ParamByName('id_prodaje').Value := cxGridDBColumn6.EditValue;
  dm.Query.ParamByName('odobreno').Value := zakljucaj;
  dm.Query.Execute;

  dm.QProdajaPregledKes.Execute;

end;

procedure TfrmProdaja.btnZakljucajProdajuClick(Sender: TObject);
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

  dm.QProdajaPregled.Execute;

end;

procedure TfrmProdaja.btnZakljucajRatuClick(Sender: TObject);
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

procedure TfrmProdaja.chkDatumClick(Sender: TObject);
begin
  if chkDatum.Checked = true then
    dateDatum.Enabled := true
  else
    dateDatum.Enabled := false;
end;

procedure TfrmProdaja.cmbProdajaProizvodPropertiesCloseUp(Sender: TObject);
begin
  edtCijena.Text := dm.QProdajaProizvodi.FieldByName('cijena').Value;
  edtCijenaKes.Text := dm.QProdajaProizvodi.FieldByName('cijena').Value;
  cmbProdajaPopust.Text := '';

  dm.QProdajaPopust.Params.Clear;
  dm.QProdajaPopust.SQL.Text := 'select * '+
                                'from artpopusti p '+
                                'where p.id in '+
                                '(select id_popusta from artpopustimodel pm where pm.id_modela = :id_modela) '+
                                'or p.id in (select id_popusta from artpopustigrupe pg where '+
                                'pg.id_grupe in (select id_grupe from artmodeli where id=:id_modela))';

  dm.QProdajaPopust.ParamByName('id_modela').Value := dm.QProdajaProizvodi.FieldByName('id').Value;
  dm.QProdajaPopust.Execute;

  dm.QProdajaProizvodDetalji.Params.Clear;
  dm.QProdajaProizvodDetalji.SQL.Text := 'select * from artmodelidetalji where id_modela = :idmodela';
  dm.QProdajaProizvodDetalji.ParamByName('idmodela').Value := dm.QProdajaProizvodiid.value;
  dm.QProdajaProizvodDetalji.Execute;
end;

procedure TfrmProdaja.cxGridProizvodiDBTableView1StampaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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

procedure TfrmProdaja.cxGridProizvodiDBTableView1ZakljucajPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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

  dm.QProdajaPregled.Execute;

end;

procedure TfrmProdaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.indProdaja := 0;
  dm.QKupci.Close;
  Self.Free;
end;

procedure TfrmProdaja.FormShow(Sender: TObject);
begin
  //dm.QKupci.Execute;
  dm.QKupci.Close;
  dm.QProdajaProizvodi.Execute;
  dm.QProdajaProdavac.Execute;
  if frmMain.indAdministrator = 0 then
    btnZakljucajProdaju.Enabled := false
  else
    btnZakljucajProdaju.Enabled := true;
end;

procedure TfrmProdaja.gridKorisniciDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    gridKorisniciClick();
end;

procedure TfrmProdaja.gridKorisniciClick();
begin
  dm.QProdajaPregled.Params.Clear;
  dm.QProdajaPregled.SQL.Text := 'select k.id,k.id_kupca,k.id_prodavca,k.proizvod,k.cijena,k.brojkomada,k.broj_rata, '+
                                  'k.id_velicine,k.velicina,k.popust,k.odobreno,kor.username as username,k.datum '+
                                  'from kupljeni_proizvodi k '+
                                  'inner join korisnici kor '+
                                  'on k.id_prodavca = kor.id '+
                                  'where id_kupca=:id_kupca and k.datum >= curdate() '+
                                  'order by k.datum desc limit 1 ';

//  if frmMain.indAdministrator = 0 then
//  begin
//    dm.QProdajaPregled.SQL.Text := dm.QProdajaPregled.SQL.Text + ' and odobreno = 0';
//  end;

  dm.QProdajaPregled.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.QProdajaPregled.Execute;

  dm.Query.Params.Clear;

  dm.Query.SQL.Text :=  'select kg.naziv as Grupa, k.Prezime, k.Ime, k.JMBG, k.BrojLicne, k.KontaktTelefon, k.Napomena, k.Napomena2, k.KopijaLicne  '+
                        'from kupci k '+
                        'inner join kupcigrupe kg '+
                        'on k.id_kupcigrupe = kg.id '+
                        'where k.id = :id_kupca ';

  dm.Query.ParamByName('id_kupca').Value := gridKorisniciDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.RecordCount > 0 then
  begin
    edtGrupaKupca.Text := dm.Query.FieldByName('Grupa').Value;
    edtPrezime.Text := dm.Query.FieldByName('Prezime').Value;
    edtIme.Text := dm.Query.FieldByName('Ime').Value;
    edtJMBG.Text := dm.Query.FieldByName('JMBG').Value;
    edtBrojLicne.Text := dm.Query.FieldByName('BrojLicne').Value;
    edtKontaktTelefon.Text := dm.Query.FieldByName('KontaktTelefon').Value;
  end;

end;


procedure TfrmProdaja.gridKorisniciDBTableView1KarticaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin

  gridKorisniciClick();

  frmMain.karticaIdKupca := gridKorisniciDBTableView1id.EditValue;

  frmKartica := TfrmKartica.create(nil);
  try
    frmKartica.ShowModal;
  finally
    frmKartica.FreeOnRelease;
  end;
end;

procedure TfrmProdaja.gridKupovinaSearchDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dm.QRate.Params.Clear;
  dm.QRate.SQL.Text := 'select  ur.id,  ur.id_uplate,  ur.id_prodaje,  ur.iznos,  ur.odobreno,  kor.username, ur.datum '+
                        'from uplacene_rate ur  '+
                        'inner join uplate u '+
                        'on u.id = ur.id_uplate '+
                        'inner join korisnici kor '+
                        'on kor.id = u.id_prodavca '+
                        'where id_prodaje = :id_prodaje ';
  dm.QRate.ParamByName('id_prodaje').Value := gridKupovinaSearchDBTableView1id.EditValue;
  dm.QRate.Execute;
end;

procedure TfrmProdaja.gridRateDBTableView1StampaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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

procedure TfrmProdaja.gridUplateDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  gridUplateClick;
end;

procedure TfrmProdaja.gridUplateClick();
begin

  dm.QUplateRate2.Params.Clear;
  dm.QUplateRate2.SQL.Text :=  'select sum(saldo) as saldo, sum(preostalidug) as preostali, sum(duguvaluti) as uvaluti from '+
                            '( '+
                            'select proizvod,(cijena-cijena*popust/100)*brojkomada as duguje, 0 as  potrazuje,-(cijena-cijena*popust/100)*brojkomada as saldo, date(datum) as datum, datum as dat,  '+
                            'case when ifnull(datediff(curdate(),datum),0) > 165 then  -(cijena-cijena*popust/100)*brojkomada else 0 end as preostalidug,  '+
                            'case when ifnull(datediff(curdate(),datum),0) <= 165 then  -(cijena-cijena*popust/100)*brojkomada else 0 end as duguvaluti  '+
                            'from kupljeni_proizvodi   '+
                            'where id_kupca=:id_kupca '+
                            'union all   '+
                            'select '''',0 as duguje,iznos as potrazuje, iznos as saldo, date(datum) as datum, datum as dat,  '+
                            'case when id_prodaje in (select id from kupljeni_proizvodi where  ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 end as preostalidug,  '+
                            'case when id_prodaje not in (select id from kupljeni_proizvodi where  ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 end as duguvaluti  '+
                            'from uplacene_rate   '+
                            'where id_prodaje in (select id from kupljeni_proizvodi where id_kupca=:id_kupca)   '+
                            'order by dat  '+
                            ') '+
                            'a ';
  dm.QUplateRate2.ParamByName('id_kupca').Value := gridUplateDBTableView1id_kupca.EditValue;
  dm.QUplateRate2.Execute;


//  dm.QUplateRate.Params.Clear;
//  dm.QUplateRate.SQL.Text :=  'select  ur.id,  ur.id_uplate,  ur.id_prodaje,  ur.iznos,  ur.odobreno,  kor.username, ur.datum,k.proizvod  '+
//                              'from uplacene_rate ur '+
//                              'inner join kupljeni_proizvodi k '+
//                              'on ur.id_prodaje = k.id '+
//                              'inner join uplate u '+
//                              'on u.id = ur.id_uplate '+
//                              'inner join korisnici kor '+
//                              'on kor.id = u.id_prodavca '+
//                              'where id_uplate = :id_uplate';
//  if frmMain.indAdministrator = 0 then
//  begin
//    dm.QUplateRate.SQL.Text := dm.QUplateRate.SQL.Text + ' and ur.odobreno = 0';
//  end;
//
//  dm.QUplateRate.ParamByName('id_uplate').Value := gridUplateDBTableView1id.EditValue;
//  dm.QUplateRate.Execute;
end;

procedure TfrmProdaja.gridUplateDBTableView1StampaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  gridUplateClick;

  if gridUplateDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana uplata',mtError,[mbOk],0);
    Abort;
  end;

  dm.QPriznanicaStampa2.Params.Clear;
  dm.QPriznanicaStampa2.SQL.Text :='select *  '+
                                  'from kupci k '+
                                  'inner join kupljeni_proizvodi kp '+
                                  'on k.id = kp.id_kupca '+
                                  'inner join uplacene_rate u '+
                                  'on kp.id = u.id_prodaje '+
                                  'where u.id_uplate = :id_uplate';
  dm.QPriznanicaStampa2.ParamByName('id_uplate').Value := gridUplateDBTableView1id.EditValue;
  dm.QPriznanicaStampa2.Execute;

  frmMain.frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\priznanica2.fr3');
  frmMain.frReport.ShowReport();
end;

procedure TfrmProdaja.gridUplateKupciDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   gridUplateKupciClick;
end;

procedure TfrmProdaja.gridUplateKupciClick();
begin
  dm.QUplate.Params.Clear;
//  dm.QUplate.SQL.Text :=  'select '+
//                          'u.id, '+
//                          'u.id_prodavca, '+
//                          'u.id_kupca, '+
//                          'u.iznos, '+
//                          'kor.username, '+
//                          'u.datum '+
//                          'from uplate u '+
//                          'inner join korisnici kor '+
//                          'on u.id_prodavca = kor.id '+
//                          'where id_kupca = :id_kupca';
//
//  if frmMain.indAdministrator = 0 then
//  begin
//  dm.QUplate.SQL.Text :=  'select distinct  u.id,  '+
//                          'u.id_prodavca,  '+
//                          'u.id_kupca,  '+
//                          'sum(ur.iznos) as iznos,  '+
//                          'kor.username,  '+
//                          'u.datum  '+
//                          'from uplate u  '+
//                          'inner join korisnici kor  '+
//                          'on u.id_prodavca = kor.id  '+
//                          'inner join uplacene_rate ur '+
//                          'on u.id = ur.id_uplate '+
//                          'where id_kupca = :id_kupca and odobreno = 0';
//  end;

  dm.QUplate.SQL.Text := 'select  '+
                          'u.id,  '+
                          'u.id_prodavca,  '+
                          'u.id_kupca,  '+
                          'u.iznos,  '+
                          'kor.username,  '+
                          'u.datum  '+
                          'from uplate u  '+
                          'inner join korisnici kor  '+
                          'on u.id_prodavca = kor.id  '+
                          'where id_kupca = :id_kupca and u.datum >= curdate() '+
                          'order by u.datum desc limit 1 ';

  dm.QUplate.ParamByName('id_kupca').Value := cxGridDBColumn17.EditValue;
  dm.QUplate.Execute;

  dm.QUplateRate.Close;

  gridUplateClick;
end;

procedure TfrmProdaja.gridUplateKupciDBTableView1KarticaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  gridUplateKupciClick;

  frmMain.karticaIdKupca := cxGridDBColumn17.EditValue;

  frmKartica := TfrmKartica.create(nil);
  try
    frmKartica.ShowModal;
  finally
    frmKartica.FreeOnRelease;
  end;

end;

procedure TfrmProdaja.pgProdajaNaRateShow(Sender: TObject);
begin
  dm.QProdajaPregled.Close;
end;

procedure TfrmProdaja.pgProdajaZaGotovinuShow(Sender: TObject);
begin
  if frmMain.indAdministrator = 0 then
    btnZakljucajKes.Enabled := false
  else
    btnZakljucajKes.Enabled := true;
  dm.QProdajaPregledKes.Params.Clear;
  dm.QProdajaPregledKes.SQL.Text := 'select k.id,k.id_kupca,k.id_prodavca,k.proizvod,k.cijena,k.brojkomada,k.broj_rata, '+
                                    'k.id_velicine,k.velicina,k.popust,k.odobreno,kor.username as username,k.datum '+
                                    'from kupljeni_proizvodi k '+
                                    'inner join korisnici kor '+
                                    'on k.id_prodavca = kor.id '+
                                    'where broj_rata = 0 and k.odobreno = 0';
  dm.QProdajaPregledKes.Execute;
end;

procedure TfrmProdaja.pgRazduzivanjeRataShow(Sender: TObject);
begin
  if frmMain.indAdministrator = 0 then
    btnZakljucajRatu.Enabled := false
  else
    btnZakljucajRatu.Enabled := true;
  dm.QProdajaPretraga.Close;
  dateDatum.Date := Now;
end;

end.
