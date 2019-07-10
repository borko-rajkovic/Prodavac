unit Reports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, AdvSmoothLabel, Vcl.StdCtrls,
  cxCheckBox, AdvGlowButton, AdvSmoothEdit, AdvSmoothEditButton,
  AdvSmoothDatePicker, CurvyControls, AdvScrollBox, AdvOfficePager,
  AdvOfficePagerStylers, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridExportLink,
  cxGridCustomView, cxGrid, cxGridPopupMenuConsts, cxGridStrs, cxGridChartView,
  cxGridDBChartView, cxPivotGridChartConnection, Vcl.ExtCtrls, AdvSplitter,
  cxCustomPivotGrid, cxPivotGrid, cxDBPivotGrid, cxPivotGridStrs,inifiles,
  AdvSmoothCalendar, cxCalendar, System.Types, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmIzvjestaji = class(TForm)
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    pagerReports: TAdvOfficePager;
    pgDnevniIzvjestaj: TAdvOfficePage;
    scrollboxDnevniIzvjestaj: TAdvScrollBox;
    pnlDnevniIzvjestaj: TCurvyPanel;
    btnGenerisiDnevniIzvjestaj: TAdvGlowButton;
    chkProdaje: TcxCheckBox;
    chkProdajeKes: TcxCheckBox;
    chkUplate: TcxCheckBox;
    lblDnevniIzvjestaj: TAdvSmoothLabel;
    gridDnevniIzvjestaj: TcxGrid;
    gridDnevniIzvjestajDBTableView1: TcxGridDBTableView;
    gridDnevniIzvjestajLevel1: TcxGridLevel;
    gridDnevniIzvjestajDBTableView1Prodavac: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Kupac: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Proizvod: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Cijena: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Brojkomada: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Velicina: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Popust: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Akcija: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Tip: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1Iznos: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1odobreno: TcxGridDBColumn;
    gridDnevniIzvjestajDBTableView1datum: TcxGridDBColumn;
    btnExcel: TAdvGlowButton;
    pgPregled: TAdvOfficePage;
    ChartConnection: TcxPivotGridChartConnection;
    pivotStatistika: TcxDBPivotGrid;
    pivotStatistikaGrupa: TcxDBPivotGridField;
    pivotStatistikaKupac: TcxDBPivotGridField;
    pivotStatistikadatum: TcxDBPivotGridField;
    pivotStatistikaDuguje: TcxDBPivotGridField;
    pivotStatistikaPotrazuje: TcxDBPivotGridField;
    pivotStatistikaSaldo: TcxDBPivotGridField;
    pivotStatistikaDan: TcxDBPivotGridField;
    pivotStatistikaMjesec: TcxDBPivotGridField;
    pivotStatistikaGodina: TcxDBPivotGridField;
    gridStatistikaChart: TcxGrid;
    gridStatistikaChartDBTableView1: TcxGridDBTableView;
    gridStatistikaChartChartView: TcxGridChartView;
    gridStatistikaChartLevel: TcxGridLevel;
    pgDugovanja: TAdvOfficePage;
    scrollboxDugovanja: TAdvScrollBox;
    splitterStatistika: TAdvSplitter;
    dateDatumDnevniIzvjestaj: TAdvSmoothCalendar;
    btnDugovanjaExcel: TAdvGlowButton;
    gridDugovanja: TcxGrid;
    gridDugovanjaDBTableView1: TcxGridDBTableView;
    gridDugovanjaLevel1: TcxGridLevel;
    btnZakljucajZapis: TAdvGlowButton;
    gridDnevniIzvjestajDBTableView1id_akcije: TcxGridDBColumn;
    pagePotrazivanja: TAdvOfficePage;
    pageProdaja: TAdvOfficePage;
    pagePrihodOdRata: TAdvOfficePage;
    scrollBoxProdaja: TAdvScrollBox;
    scrollBoxPrihodOdRata: TAdvScrollBox;
    scrollBoxPotrazivanja: TAdvScrollBox;
    pnlPotrazivanjaDatum: TCurvyPanel;
    chkPotrazivanjaDatum: TcxCheckBox;
    datePotrazivanjaOd: TAdvSmoothCalendar;
    datePotrazivanjaDo: TAdvSmoothCalendar;
    lblPotrazivanjaOd: TAdvSmoothLabel;
    lblPotrazivanjaDo: TAdvSmoothLabel;
    pnlUkupanDug: TCurvyPanel;
    lblUkupanDug: TAdvSmoothLabel;
    btnUkupanDug: TAdvGlowButton;
    edtUkupanDug: TCurvyEdit;
    pnlPotrazivanjePoGrupama: TCurvyPanel;
    btnPotrazivanjePoGrupama: TAdvGlowButton;
    gridPotrazivanjaPoGrupama: TcxGrid;
    gridPotrazivanjaPoGrupamaDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    lblPotrazivanjePoGrupama: TAdvSmoothLabel;
    gridPotrazivanjaPoGrupamaDBTableView1Grupa: TcxGridDBColumn;
    gridPotrazivanjaPoGrupamaDBTableView1Saldo: TcxGridDBColumn;
    pnlPotrazivanjePoLampicama: TCurvyPanel;
    btnPotrazivanjePoLampicama: TAdvGlowButton;
    gridPotrazivanjePoLampicama: TcxGrid;
    gridPotrazivanjePoLampicamaDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    lblPotrazivanjePoLampicama: TAdvSmoothLabel;
    gridPotrazivanjePoLampicamaDBTableView1Lampica: TcxGridDBColumn;
    gridPotrazivanjePoLampicamaDBTableView1Saldo: TcxGridDBColumn;
    lblProdajaPoGrupama: TAdvSmoothLabel;
    lblProdajaPoLampicama: TAdvSmoothLabel;
    lblUkupnaProdaja: TAdvSmoothLabel;
    pnlProdaja: TCurvyPanel;
    lblProdajaOd: TAdvSmoothLabel;
    lblProdajaDo: TAdvSmoothLabel;
    chkProdajaDatum: TcxCheckBox;
    dateProdajaOd: TAdvSmoothCalendar;
    dateProdajaDo: TAdvSmoothCalendar;
    pnlProdajaPoGrupama: TCurvyPanel;
    btnProdajaPoGrupama: TAdvGlowButton;
    gridProdajaPoGrupama: TcxGrid;
    gridProdajaPoGrupamaDBTableView1: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    pnlProdajaPoLampicama: TCurvyPanel;
    btnProdajaPoLampicama: TAdvGlowButton;
    gridProdajaPoLampicama: TcxGrid;
    gridProdajaPoLampicamaDBTableView1: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    pnlUkupnaProdaja: TCurvyPanel;
    btnUkupnaProdaja: TAdvGlowButton;
    edtUkupnaProdaja: TCurvyEdit;
    lblProdajaPoProdavacima: TAdvSmoothLabel;
    pnlProdajaPoProdavacima: TCurvyPanel;
    btnProdajaPoProdavacima: TAdvGlowButton;
    gridProdajaPoProdavacima: TcxGrid;
    gridProdajaPoProdavacimaDBTableView1: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    gridProdajaPoGrupamaDBTableView1Grupa: TcxGridDBColumn;
    gridProdajaPoGrupamaDBTableView1Saldo: TcxGridDBColumn;
    gridProdajaPoLampicamaDBTableView1Lampica: TcxGridDBColumn;
    gridProdajaPoLampicamaDBTableView1Saldo: TcxGridDBColumn;
    gridProdajaPoProdavacimaDBTableView1Username: TcxGridDBColumn;
    gridProdajaPoProdavacimaDBTableView1Saldo: TcxGridDBColumn;
    lblPrihodPoGrupama: TAdvSmoothLabel;
    lblPrihodPoLampicama: TAdvSmoothLabel;
    lblUkupanPrihod: TAdvSmoothLabel;
    pnlPrihodDatum: TCurvyPanel;
    lblPrihodDatumOd: TAdvSmoothLabel;
    lblPrihodDatumDo: TAdvSmoothLabel;
    chkPrihodDatum: TcxCheckBox;
    datePrihodOd: TAdvSmoothCalendar;
    datePrihodDo: TAdvSmoothCalendar;
    pnlPrihodPoGrupama: TCurvyPanel;
    btnPrihodPoGrupama: TAdvGlowButton;
    gridPrihodPoGrupama: TcxGrid;
    gridPrihodPoGrupamaDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    pnlPrihodPoLampicama: TCurvyPanel;
    btnPrihodPoLampicama: TAdvGlowButton;
    gridPrihodPoLampicama: TcxGrid;
    gridPrihodPoLampicamaDBTableView1: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    pnUkupanPrihod: TCurvyPanel;
    btnUkupanPrihod: TAdvGlowButton;
    edtUkupanPrihod: TCurvyEdit;
    gridPrihodPoGrupamaDBTableView1Grupa: TcxGridDBColumn;
    gridPrihodPoGrupamaDBTableView1Saldo: TcxGridDBColumn;
    gridPrihodPoLampicamaDBTableView1Lampica: TcxGridDBColumn;
    gridPrihodPoLampicamaDBTableView1Saldo: TcxGridDBColumn;
    pgKupciPoLampicama: TAdvOfficePage;
    pnlKupciPoLampicama: TCurvyPanel;
    btnKupciPoLampicama: TAdvGlowButton;
    gridKupciPoLampicama: TcxGrid;
    gridKupciPoLampicamadDBTableView: TcxGridDBTableView;
    cxGridLevel9: TcxGridLevel;
    lblKupciPoLampicama: TAdvSmoothLabel;
    gridKupciPoLampicamadDBTableViewLampica: TcxGridDBColumn;
    gridKupciPoLampicamadDBTableViewBroj: TcxGridDBColumn;
    gridDugovanjaDBTableView1Kupac: TcxGridDBColumn;
    gridDugovanjaDBTableView1Saldo: TcxGridDBColumn;
    pageProdajePoGrupamaKupaca: TAdvOfficePage;
    scrollProdajePoGrupamaKupaca: TAdvScrollBox;
    lblProdajePoGrupamaKupaca: TAdvSmoothLabel;
    pnlProdajePoGrupamaKupaca: TCurvyPanel;
    btnProdajePoGrupamaKupaca: TAdvGlowButton;
    cmbGrupaKupaca: TcxLookupComboBox;
    gridProdajePoGrupamaKupaca: TcxGrid;
    gridProdajePoGrupamaKupacaDBTableView1: TcxGridDBTableView;
    cxGridLevel8: TcxGridLevel;
    gridProdajePoGrupamaKupacaDBTableView1datum: TcxGridDBColumn;
    gridProdajePoGrupamaKupacaDBTableView1proizvod: TcxGridDBColumn;
    gridProdajePoGrupamaKupacaDBTableView1cijena: TcxGridDBColumn;
    pnlProdajePoGrupamaKupacaDatum: TCurvyPanel;
    lblProdajePoGrupamaKupacaOd: TAdvSmoothLabel;
    lblProdajePoGrupamaKupacaDo: TAdvSmoothLabel;
    chkProdajePoGrupamaKupacaDatum: TcxCheckBox;
    calProdajePoGrupamaKupacaOd: TAdvSmoothCalendar;
    calProdajePoGrupamaKupacaDo: TAdvSmoothCalendar;
    btnProdajePoGrupamaKupacaExcel: TAdvGlowButton;
    gridProdajePoGrupamaKupacaDBTableView1ime: TcxGridDBColumn;
    gridProdajePoGrupamaKupacaDBTableView1prezime: TcxGridDBColumn;
    gridKupciPoLampicamaDetalji: TcxGrid;
    gridKupciPoLampicamaDetaljiDBTableView1: TcxGridDBTableView;
    cxGridLevel10: TcxGridLevel;
    gridKupciPoLampicamaDetaljiDBTableView1Ime: TcxGridDBColumn;
    gridKupciPoLampicamaDetaljiDBTableView1Prezime: TcxGridDBColumn;
    gridKupciPoLampicamaDetaljiDBTableView1Grupa: TcxGridDBColumn;
    gridKupciPoLampicamaDetaljiDBTableView1Brojtelefona: TcxGridDBColumn;
    gridKupciPoLampicamaDetaljiDBTableView1saldo: TcxGridDBColumn;
    btnKupciPoLampicamaDetaljiExcel: TAdvGlowButton;
    gridProdajaPoProdavacimaAnaliza: TcxGrid;
    gridProdajaPoProdavacimaAnalizaDBTableView1: TcxGridDBTableView;
    cxGridLevel11: TcxGridLevel;
    gridProdajaPoProdavacimaAnalizaDBTableView1Kupac: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1Proizvod: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1Cijena: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1brojkomada: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1Velicina: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1Popust: TcxGridDBColumn;
    gridProdajaPoProdavacimaAnalizaDBTableView1Datum: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGenerisiDnevniIzvjestajClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure pgPregledShow(Sender: TObject);
    procedure MoveSplitter(Splitter: TSplitter; Location: Integer);
    procedure pgDugovanjaShow(Sender: TObject);
    procedure btnDugovanjaExcelClick(Sender: TObject);
    procedure gridDugovanjaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnZakljucajZapisClick(Sender: TObject);
    procedure pagePotrazivanjaShow(Sender: TObject);
    procedure btnUkupanDugClick(Sender: TObject);
    procedure btnPotrazivanjePoGrupamaClick(Sender: TObject);
    procedure btnPotrazivanjePoLampicamaClick(Sender: TObject);
    procedure btnUkupnaProdajaClick(Sender: TObject);
    procedure pageProdajaShow(Sender: TObject);
    procedure btnProdajaPoGrupamaClick(Sender: TObject);
    procedure btnProdajaPoLampicamaClick(Sender: TObject);
    procedure btnProdajaPoProdavacimaClick(Sender: TObject);
    procedure btnUkupanPrihodClick(Sender: TObject);
    procedure pagePrihodOdRataShow(Sender: TObject);
    procedure btnPrihodPoGrupamaClick(Sender: TObject);
    procedure btnPrihodPoLampicamaClick(Sender: TObject);
    procedure btnKupciPoLampicamaClick(Sender: TObject);
    procedure pageProdajePoGrupamaKupacaShow(Sender: TObject);
    procedure btnProdajePoGrupamaKupacaClick(Sender: TObject);
    procedure btnProdajePoGrupamaKupacaExcelClick(Sender: TObject);
    procedure gridKupciPoLampicamadDBTableViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnKupciPoLampicamaDetaljiExcelClick(Sender: TObject);
    procedure gridProdajaPoProdavacimaDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure prevedi_grid;

var
  frmIzvjestaji: TfrmIzvjestaji;

implementation

{$R *.dfm}

uses Main, DataModule, ShellAPI, uRegistry;

procedure TfrmIzvjestaji.btnDugovanjaExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Dugovanja.xls',gridDugovanja,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Dugovanja.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmIzvjestaji.btnExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Dnevni izvjestaj.xls',gridDnevniIzvjestaj,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Dnevni izvjestaj.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmIzvjestaji.btnGenerisiDnevniIzvjestajClick(Sender: TObject);
var
akcija,tip: string;
begin
  akcija := '';
  tip := '';

  if (chkProdaje.Checked = false) and (chkProdajeKes.Checked = false) and (chkUplate.Checked = false)  then
  begin
    MessageDlg('Morate odabrati bar jedan kriterijum',mtError,[mbOk],0);
    Abort;
  end;

  if chkProdaje.Checked = true then
  begin
    akcija := akcija + '''Kupovina'',';
    tip := tip + '''Rate'',';
  end;
  if chkProdajeKes.Checked = true then
  begin
    akcija := akcija + '''Kupovina'',';
    tip := tip + '''Gotovina'',';
  end;
  if chkUplate.Checked = true then
  begin
    akcija := akcija + '''Uplata'',';
    tip := tip + '''Rata'',';
  end;

  akcija := Copy(akcija,1,length(akcija)-1);
  tip := Copy(tip,1,length(tip)-1);

  dm.QDnevniIzvjestaj.Params.Clear;
  dm.QDnevniIzvjestaj.SQL.Text :=   'select * from  '+
                                    '(select   '+
                                    'kp.id as id_akcije,concat(kor.ime,'' '',kor.prezime) as Prodavac,  '+
                                    'case when k.id is null then '''' else concat(k.ime,'' '',k.prezime) end as Kupac,  '+
                                    'kp.proizvod as Proizvod,  '+
                                    'kp.cijena as Cijena,  '+
                                    'kp.brojkomada as ''Broj komada'',  '+
                                    'kp.velicina as Velicina,  '+
                                    'kp.popust as Popust,  '+
                                    '''Kupovina'' as Akcija,  '+
                                    'case when kp.broj_rata>0 then ''Rate'' else ''Gotovina'' end as Tip,  '+
                                    '(kp.cijena-kp.cijena*kp.popust/100)*kp.brojkomada as Iznos,  '+
                                    'kp.odobreno,  '+
                                    'kp.datum  '+
                                    'from kupljeni_proizvodi kp  '+
                                    'left join kupci k  '+
                                    'on k.id = kp.id_kupca  '+
                                    'inner join korisnici kor  '+
                                    'on kp.id_prodavca = kor.id  '+
                                    'union all  '+
                                    'select   '+
                                    'ur.id as id_akcije,concat(kor.ime,'' '',kor.prezime) as Prodavac,  '+
                                    'case when k.id is null then '''' else concat(k.ime,'' '',k.prezime) end as Kupac,  '+
                                    'kp.proizvod as Proizvod,  '+
                                    'kp.cijena as Cijena,  '+
                                    'kp.brojkomada as ''Broj komada'',  '+
                                    'kp.velicina as Velicina,  '+
                                    'kp.popust as Popust,  '+
                                    '''Uplata'' as Akcija,  '+
                                    '''Rata'' as Tip,  '+
                                    'ur.iznos as Iznos,  '+
                                    'ur.odobreno,  '+
                                    'u.datum  '+
                                    'from uplate u  '+
                                    'left join kupci k  '+
                                    'on k.id = u.id_kupca  '+
                                    'inner join uplacene_rate ur  '+
                                    'on u.id = ur.id_uplate  '+
                                    'inner join korisnici kor  '+
                                    'on u.id_prodavca = kor.id  '+
                                    'inner join kupljeni_proizvodi kp  '+
                                    'on kp.id = ur.id_prodaje  '+
                                    ') a  '+
                                    'where date(datum) = :datum  '+
                                    'and Akcija in ('+akcija+') and Tip in ('+tip+')  '+
                                    'order by datum';

  dm.QDnevniIzvjestaj.ParamByName('datum').Value := FormatDateTime('yyyy-MM-dd', dateDatumDnevniIzvjestaj.SelectedDate);
  dm.QDnevniIzvjestaj.Execute;

end;

procedure TfrmIzvjestaji.btnKupciPoLampicamaClick(Sender: TObject);
begin
  dm.QPodesiLampice.Execute;
  dm.QKupciPoLampicama.Execute;
end;

procedure TfrmIzvjestaji.btnKupciPoLampicamaDetaljiExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Kupci po lampicama - detalji.xls',gridKupciPoLampicamaDetalji,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Kupci po lampicama - detalji.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmIzvjestaji.btnPotrazivanjePoGrupamaClick(Sender: TObject);
begin
  dm.QPotrazivanjaPoGrupama.SQL.Text := 'select kg.Naziv as Grupa, sum(saldo) as Saldo '+
                                          'from '+
                                          '( '+
                                          'select id_kupca, '+
                                          '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                                          'date(datum) as datum, datum as dat '+
                                          'from kupljeni_proizvodi  '+
                                          'union all  '+
                                          'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                                          'from uplacene_rate ur '+
                                          'inner join kupljeni_proizvodi kp '+
                                          'on ur.id_prodaje = kp.id '+
                                          'order by dat '+
                                          ') a '+
                                          'inner join kupci k '+
                                          'on a.id_kupca = k.id '+
                                          'inner join kupcigrupe kg '+
                                          'on k.id_kupcigrupe = kg.id '+
                                          'where id_kupca != 0 ';
  if chkPotrazivanjaDatum.Checked then
    begin
      dm.QPotrazivanjaPoGrupama.SQL.Text := dm.QPotrazivanjaPoGrupama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QPotrazivanjaPoGrupama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaOd.SelectedDate);
      dm.QPotrazivanjaPoGrupama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaDo.SelectedDate);
      dm.QPotrazivanjaPoGrupama.SQL.Text := dm.QPotrazivanjaPoGrupama.SQL.Text + 'group by kg.id ';
    end
  else
    begin
      dm.QPotrazivanjaPoGrupama.SQL.Text := dm.QPotrazivanjaPoGrupama.SQL.Text + 'group by kg.id ';
    end;

  dm.QPotrazivanjaPoGrupama.Execute;

end;

procedure TfrmIzvjestaji.btnPotrazivanjePoLampicamaClick(Sender: TObject);
begin
  dm.QPodesiLampice.Execute;
  dm.QPotrazivanjaPoLampicama.SQL.Text := 'select  '+
                                        'case when k.Indikator = 0 THEN ''Zelena'' '+
                                        '	 when k.Indikator = 1 THEN ''Zuta'' '+
                                        '	 when k.Indikator = 2 THEN ''Crvena'' '+
                                        '	 when k.Indikator = 3 THEN ''Plava'' end '+
                                        ' as Lampica, sum(saldo) as Saldo '+
                                        'from '+
                                        '( '+
                                        'select id_kupca, '+
                                        '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                                        'date(datum) as datum, datum as dat '+
                                        'from kupljeni_proizvodi  '+
                                        'union all  '+
                                        'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                                        'from uplacene_rate ur '+
                                        'inner join kupljeni_proizvodi kp '+
                                        'on ur.id_prodaje = kp.id '+
                                        'order by dat '+
                                        ') a '+
                                        'inner join kupci k '+
                                        'on a.id_kupca = k.id '+
                                        'where id_kupca != 0 ';
  if chkPotrazivanjaDatum.Checked then
    begin
      dm.QPotrazivanjaPoLampicama.SQL.Text := dm.QPotrazivanjaPoLampicama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QPotrazivanjaPoLampicama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaOd.SelectedDate);
      dm.QPotrazivanjaPoLampicama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaDo.SelectedDate);
      dm.QPotrazivanjaPoLampicama.SQL.Text := dm.QPotrazivanjaPoLampicama.SQL.Text + 'group by k.indikator ';
    end
  else
    begin
      dm.QPotrazivanjaPoLampicama.SQL.Text := dm.QPotrazivanjaPoLampicama.SQL.Text + 'group by k.indikator ';
    end;

  dm.QPotrazivanjaPoLampicama.Execute;

end;

procedure TfrmIzvjestaji.btnPrihodPoGrupamaClick(Sender: TObject);
begin
  dm.QUplacenoPoGrupama.SQL.Text := 'select kg.Naziv as Grupa, sum(saldo) as Saldo '+
                                          'from '+
                                          '( '+
                                          'select id_kupca,iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                                          'from uplacene_rate ur '+
                                          'inner join kupljeni_proizvodi kp '+
                                          'on ur.id_prodaje = kp.id '+
                                          'order by dat '+
                                          ') a '+
                                          'inner join kupci k '+
                                          'on a.id_kupca = k.id '+
                                          'inner join kupcigrupe kg '+
                                          'on k.id_kupcigrupe = kg.id '+
                                          'where id_kupca != 0 ';
  if chkPrihodDatum.Checked then
    begin
      dm.QUplacenoPoGrupama.SQL.Text := dm.QUplacenoPoGrupama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QUplacenoPoGrupama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePrihodOd.SelectedDate);
      dm.QUplacenoPoGrupama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePrihodDo.SelectedDate);
      dm.QUplacenoPoGrupama.SQL.Text := dm.QUplacenoPoGrupama.SQL.Text + 'group by kg.id ';
    end
  else
    begin
      dm.QUplacenoPoGrupama.SQL.Text := dm.QUplacenoPoGrupama.SQL.Text + 'group by kg.id ';
    end;

  dm.QUplacenoPoGrupama.Execute;
end;

procedure TfrmIzvjestaji.btnPrihodPoLampicamaClick(Sender: TObject);
begin
  dm.QPodesiLampice.Execute;
  dm.QUplacenoPoLampicama.SQL.Text := 'select  '+
                                        'case when k.Indikator = 0 THEN ''Zelena'' '+
                                        '	 when k.Indikator = 1 THEN ''Zuta'' '+
                                        '	 when k.Indikator = 2 THEN ''Crvena'' '+
                                        '	 when k.Indikator = 3 THEN ''Plava'' end '+
                                        ' as Lampica, sum(saldo) as Saldo '+
                                        'from '+
                                        '( '+
                                        'select id_kupca,iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                                        'from uplacene_rate ur '+
                                        'inner join kupljeni_proizvodi kp '+
                                        'on ur.id_prodaje = kp.id '+
                                        'order by dat '+
                                        ') a '+
                                        'inner join kupci k '+
                                        'on a.id_kupca = k.id '+
                                        'where id_kupca != 0 ';
  if chkPrihodDatum.Checked then
    begin
      dm.QUplacenoPoLampicama.SQL.Text := dm.QUplacenoPoLampicama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QUplacenoPoLampicama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePrihodOd.SelectedDate);
      dm.QUplacenoPoLampicama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePrihodDo.SelectedDate);
      dm.QUplacenoPoLampicama.SQL.Text := dm.QUplacenoPoLampicama.SQL.Text + 'group by k.indikator ';
    end
  else
    begin
      dm.QUplacenoPoLampicama.SQL.Text := dm.QUplacenoPoLampicama.SQL.Text + 'group by k.indikator ';
    end;

  dm.QUplacenoPoLampicama.Execute;

end;

procedure TfrmIzvjestaji.btnProdajaPoGrupamaClick(Sender: TObject);
begin
  dm.QProdajaPoGrupama.SQL.Text := 'select kg.Naziv as Grupa, sum(saldo) as Saldo '+
                                          'from '+
                                          '( '+
                                          'select id_kupca, '+
                                          '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                                          'date(datum) as datum, datum as dat '+
                                          'from kupljeni_proizvodi  '+
                                          ') a '+
                                          'inner join kupci k '+
                                          'on a.id_kupca = k.id '+
                                          'inner join kupcigrupe kg '+
                                          'on k.id_kupcigrupe = kg.id '+
                                          'where id_kupca != 0 ';
  if chkProdajaDatum.Checked then
    begin
      dm.QProdajaPoGrupama.SQL.Text := dm.QProdajaPoGrupama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QProdajaPoGrupama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', dateProdajaOd.SelectedDate);
      dm.QProdajaPoGrupama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', dateProdajaDo.SelectedDate);
      dm.QProdajaPoGrupama.SQL.Text := dm.QProdajaPoGrupama.SQL.Text + 'group by kg.id ';
    end
  else
    begin
      dm.QProdajaPoGrupama.SQL.Text := dm.QProdajaPoGrupama.SQL.Text + 'group by kg.id ';
    end;

  dm.QProdajaPoGrupama.Execute;

end;

procedure TfrmIzvjestaji.btnProdajaPoLampicamaClick(Sender: TObject);
begin
  dm.QPodesiLampice.Execute;
  dm.QProdajaPoLampicama.SQL.Text := 'select  '+
                                        'case when k.Indikator = 0 THEN ''Zelena'' '+
                                        '	 when k.Indikator = 1 THEN ''Zuta'' '+
                                        '	 when k.Indikator = 2 THEN ''Crvena'' '+
                                        '	 when k.Indikator = 3 THEN ''Plava'' end '+
                                        ' as Lampica, sum(saldo) as Saldo '+
                                        'from '+
                                        '( '+
                                        'select id_kupca, '+
                                        '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                                        'date(datum) as datum, datum as dat '+
                                        'from kupljeni_proizvodi  '+
                                        ') a '+
                                        'inner join kupci k '+
                                        'on a.id_kupca = k.id '+
                                        'where id_kupca != 0 ';
  if chkProdajaDatum.Checked then
    begin
      dm.QProdajaPoLampicama.SQL.Text := dm.QProdajaPoLampicama.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QProdajaPoLampicama.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', dateProdajaOd.SelectedDate);
      dm.QProdajaPoLampicama.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', dateProdajaDo.SelectedDate);
      dm.QProdajaPoLampicama.SQL.Text := dm.QProdajaPoLampicama.SQL.Text + 'group by k.indikator ';
    end
  else
    begin
      dm.QProdajaPoLampicama.SQL.Text := dm.QProdajaPoLampicama.SQL.Text + 'group by k.indikator ';
    end;

  dm.QProdajaPoLampicama.Execute;

end;

procedure TfrmIzvjestaji.btnProdajaPoProdavacimaClick(Sender: TObject);
begin
  dm.QProdajaPoProdavacu.SQL.Text :=  'select kor.Username, sum(saldo) as Saldo '+
                                      'from '+
                                      '( '+
                                      'select id_kupca, '+
                                      '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                                      'date(datum) as datum, datum as dat, id_prodavca '+
                                      'from kupljeni_proizvodi  '+
                                      ') a '+
                                      'inner join korisnici kor '+
                                      'on a.id_prodavca = kor.id '+
                                      'where id_kupca != 0 ';

  if chkProdajaDatum.Checked then
    begin
      dm.QProdajaPoProdavacu.SQL.Text := dm.QProdajaPoProdavacu.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo ';
      dm.QProdajaPoProdavacu.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', dateProdajaOd.SelectedDate);
      dm.QProdajaPoProdavacu.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', dateProdajaDo.SelectedDate);
      dm.QProdajaPoProdavacu.SQL.Text := dm.QProdajaPoProdavacu.SQL.Text + 'group by kor.Username';
    end
  else
    begin
      dm.QProdajaPoProdavacu.SQL.Text := dm.QProdajaPoProdavacu.SQL.Text + 'group by kor.Username ';
    end;

  dm.QProdajaPoProdavacu.Execute;
  dm.QProdajaPoProdavacuAnaliza.Close;
end;

procedure TfrmIzvjestaji.btnProdajePoGrupamaKupacaClick(Sender: TObject);
begin
  if cmbGrupaKupaca.Text = '' then
  begin
    MessageDlg('Morate odabrati grupu kupaca',mtError,[mbOk],0);
    Abort;
  end;

  dm.QProdajePoGrupamaKupaca.SQL.Text := 'select k.Ime, k.Prezime, kp.datum, kp.proizvod, (cijena-cijena*popust/100)*brojkomada as cijena '+
                                          'from kupljeni_proizvodi kp '+
                                          'inner join kupci k '+
                                          'on kp.id_kupca = k.id '+
                                          'inner join kupcigrupe kg '+
                                          'on k.id_kupcigrupe = kg.id '+
                                          'where kg.id = :id_grupe ';


  dm.QProdajePoGrupamaKupaca.ParamByName('id_grupe').Value := dm.QKupciGrupe.FieldByName('id').Value;

  if chkProdajePoGrupamaKupacaDatum.Checked then
    begin
      dm.QProdajePoGrupamaKupaca.SQL.Text := dm.QProdajePoGrupamaKupaca.SQL.Text + ' and kp.datum >= :datumOd and kp.datum <= :datumDo ';
      dm.QProdajePoGrupamaKupaca.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', calProdajePoGrupamaKupacaOd.SelectedDate);
      dm.QProdajePoGrupamaKupaca.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', calProdajePoGrupamaKupacaDo.SelectedDate);
    end;

  dm.QProdajePoGrupamaKupaca.Execute;

end;

procedure TfrmIzvjestaji.btnProdajePoGrupamaKupacaExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Prodaje po grupama kupaca.xls',gridProdajePoGrupamaKupaca,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Prodaje po grupama kupaca.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmIzvjestaji.btnUkupanDugClick(Sender: TObject);
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text :=  'select ifnull(sum(saldo),0) as Saldo '+
                        'from '+
                        '( '+
                        'select id_kupca, '+
                        '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                        'date(datum) as datum, datum as dat '+
                        'from kupljeni_proizvodi  '+
                        'union all  '+
                        'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                        'from uplacene_rate ur '+
                        'inner join kupljeni_proizvodi kp '+
                        'on ur.id_prodaje = kp.id '+
                        'order by dat '+
                        ') a '+
                        'where id_kupca != 0 ';

  if chkPotrazivanjaDatum.Checked then
  begin
    dm.Query.SQL.Text := dm.Query.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo';
    dm.Query.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaOd.SelectedDate);
    dm.Query.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePotrazivanjaDo.SelectedDate);
  end;

  dm.Query.Execute;

  if dm.Query.RecordCount > 0 then
  begin
    edtUkupanDug.Text := dm.Query.FieldByName('saldo').Value;
  end;
end;

procedure TfrmIzvjestaji.btnUkupanPrihodClick(Sender: TObject);
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text :=  'select ifnull(sum(saldo),0) as Saldo '+
                        'from '+
                        '( '+
                        'select id_kupca,iznos as saldo, date(ur.datum) as datum, ur.datum as dat  '+
                        'from uplacene_rate ur '+
                        'inner join kupljeni_proizvodi kp '+
                        'on ur.id_prodaje = kp.id '+
                        'order by dat '+
                        ') a '+
                        'where id_kupca != 0 ';

  if chkPrihodDatum.Checked then
  begin
    dm.Query.SQL.Text := dm.Query.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo';
    dm.Query.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', datePrihodOd.SelectedDate);
    dm.Query.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', datePrihodDo.SelectedDate);
  end;

  dm.Query.Execute;

  if dm.Query.RecordCount > 0 then
  begin
    edtUkupanPrihod.Text := dm.Query.FieldByName('saldo').Value;
  end;

end;

procedure TfrmIzvjestaji.btnUkupnaProdajaClick(Sender: TObject);
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text :=  'select ifnull(sum(saldo),0) as Saldo '+
                        'from '+
                        '( '+
                        'select id_kupca, '+
                        '(cijena-cijena*popust/100)*brojkomada as saldo,  '+
                        'date(datum) as datum, datum as dat '+
                        'from kupljeni_proizvodi  '+
                        ') a '+
                        'where id_kupca != 0 ';

  if chkProdajaDatum.Checked then
  begin
    dm.Query.SQL.Text := dm.Query.SQL.Text + ' and a.datum >= :datumOd and a.datum <= :datumDo';
    dm.Query.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', dateProdajaOd.SelectedDate);
    dm.Query.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', dateProdajaDo.SelectedDate);
  end;

  dm.Query.Execute;

  if dm.Query.RecordCount > 0 then
  begin
    edtUkupnaProdaja.Text := dm.Query.FieldByName('saldo').Value;
  end;

end;

procedure TfrmIzvjestaji.btnZakljucajZapisClick(Sender: TObject);
var
zakljucaj: integer;
begin
  if gridDnevniIzvjestajDBTableView1Prodavac.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran zapis',mtError,[mbOk],0);
    Abort;
  end;

  if gridDnevniIzvjestajDBTableView1odobreno.EditValue = 1 then
    zakljucaj := 0
  else
    zakljucaj := 1;

  if gridDnevniIzvjestajDBTableView1Akcija.EditValue = 'Kupovina' then
    begin
      dm.Query.Params.Clear;
      dm.Query.SQL.Text := 'update kupljeni_proizvodi set odobreno=:odobreno where id=:id_prodaje';
      dm.Query.ParamByName('id_prodaje').Value := gridDnevniIzvjestajDBTableView1id_akcije.EditValue;
      dm.Query.ParamByName('odobreno').Value := zakljucaj;
      dm.Query.Execute;
    end
  else
    begin
      dm.Query.Params.Clear;
      dm.Query.SQL.Text := 'update uplacene_rate set odobreno=:odobreno where id=:id_rate';
      dm.Query.ParamByName('id_rate').Value := gridDnevniIzvjestajDBTableView1id_akcije.EditValue;
      dm.Query.ParamByName('odobreno').Value := zakljucaj;
      dm.Query.Execute;
    end;


  dm.QDnevniIzvjestaj.Execute;
end;

procedure TfrmIzvjestaji.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMain._koristiIni then
    frmMain.zapisiuini('pivot',frmMain.windir,'splitter','top',IntToStr(splitterStatistika.Top))
  else
    RegistryWrite('splitter',IntToStr(splitterStatistika.Top));
  frmMain.indIzvjestaji := 0;
  Self.Free;
end;

procedure TfrmIzvjestaji.FormShow(Sender: TObject);
var
  ini: TIniFile;
begin

  pagerReports.RemoveAdvPage(pgDugovanja);

  dateDatumDnevniIzvjestaj.SelectedDate := Now;
  prevedi_grid();

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

  if frmMain._koristiIni then
    begin
      if fileexists (frmMain.windir+'pivot.ini') then
      begin
        Ini := TIniFile.Create(ChangeFileExt(frmMain.windir+'pivot','.ini'));
        MoveSplitter(splitterStatistika, StrToInt(ini.ReadString('splitter', 'top', '')));
      end
    end
  else
    begin
      if RegistryCheckString('splitter') then
        MoveSplitter(splitterStatistika, StrToInt(RegistryRead('splitter')));
    end;

end;


procedure TfrmIzvjestaji.gridDugovanjaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, 12) = '1' then
  //    ACanvas.Brush.Color := $008181ff;
end;

procedure TfrmIzvjestaji.gridKupciPoLampicamadDBTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dm.QKupciPoLampicamaDetalji.Params.Clear;
  dm.QKupciPoLampicamaDetalji.SQL.Text := 'select k.Ime, k.Prezime, kg.Naziv as Grupa, k.kontaktTelefon as ''Broj telefona'',ifnull(tb_saldo.saldo,0) as saldo '+
                                          'from kupci k '+
                                          'inner join lampice l '+
                                          'on k.indikator = l.id '+
                                          'inner join kupcigrupe kg '+
                                          'on k.id_kupcigrupe = kg.id '+
                                          'left join ( '+
                                          'select sum(saldo) as saldo, id_kupca from  '+
                                          '( '+
                                          'select sum(-(cijena-cijena*popust/100)*brojkomada) as saldo, id_kupca '+
                                          'from kupljeni_proizvodi   '+
                                          'group by id_kupca '+
                                          'union all   '+
                                          'select SUM(iznos) as saldo, id_kupca '+
                                          'from uplacene_rate u '+
                                          'inner join kupljeni_proizvodi kp '+
                                          'on u.id_prodaje = kp.id '+
                                          'group by id_kupca '+
                                          ') tb_saldo '+
                                          'group by id_kupca '+
                                          ') tb_saldo '+
                                          'on k.id = tb_saldo.id_kupca '+
                                          'where l.naziv = :lampica ';
  dm.QKupciPoLampicamaDetalji.ParamByName('lampica').Value := gridKupciPoLampicamadDBTableViewLampica.EditValue;
  dm.QKupciPoLampicamaDetalji.Execute;
end;

procedure TfrmIzvjestaji.gridProdajaPoProdavacimaDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dm.QProdajaPoProdavacuAnaliza.Params.Clear;
  dm.QProdajaPoProdavacuAnaliza.SQL.Text := 'select concat(k.Ime,'' '',k.prezime) as Kupac, kp.Proizvod, '+
                                            'kp.cijena,kp.brojkomada,kp.velicina,kp.popust,kp.datum '+
                                            'from kupljeni_proizvodi kp '+
                                            'inner join korisnici kor '+
                                            'on kp.id_prodavca = kor.id '+
                                            'inner join kupci k '+
                                            'on k.id = kp.id_kupca '+
                                            'where kor.username = :username';
  dm.QProdajaPoProdavacuAnaliza.ParamByName('username').Value := gridProdajaPoProdavacimaDBTableView1Username.EditValue;
  if chkProdajaDatum.Checked then
    begin
      dm.QProdajaPoProdavacuAnaliza.SQL.Text := dm.QProdajaPoProdavacuAnaliza.SQL.Text + ' and kp.datum >= :datumOd and kp.datum <= :datumDo ';
      dm.QProdajaPoProdavacuAnaliza.ParamByName('datumOd').Value := FormatDateTime('yyyy-MM-dd', dateProdajaOd.SelectedDate);
      dm.QProdajaPoProdavacuAnaliza.ParamByName('datumDo').Value := FormatDateTime('yyyy-MM-dd', dateProdajaDo.SelectedDate);
    end;
  dm.QProdajaPoProdavacuAnaliza.Execute;
end;

function SplittersControl(S: TSplitter): TControl;
var
pt : TPoint;
i : integer;
r : TRect;
c : TControl;
begin
  result := nil;
  r := S.BoundsRect;
  case S.Align of
    alLeft : pt := Point(r.Left -1, r.Top);
    alRight : pt := Point(r.Right, r.Top);
    alTop : pt := Point(r.Left, r.Top -1);
    alBottom : pt := Point(r.Left, r.Bottom);
  else
    exit;
  end;

  i := 0;
  while (i < S.Parent.ControlCount) and (result = nil) do begin
    c := S.Parent.Controls[i];

    if c.Visible and c.Enabled then begin
    r := c.BoundsRect;

    if r.Right -r.Left = 0 then
    InflateRect(r, 1, 0);

    if r.Bottom -r.Top = 0 then
    InflateRect(r, 0, 1);

    if PtInRect(r, pt) then
    result := c;
    end;

    Inc(i);
  end;
end;

procedure TfrmIzvjestaji.MoveSplitter(Splitter: TSplitter; Location: Integer);
var Control: TControl;
begin
  // Determine the control to resize
  Control := SplittersControl(Splitter);
  // Determine the orientation of the splitter
  // if align is left, splitter is vertical, if
  // align is top, splitter is horizontal
  // then move the splitter by resizing the control
  If Control.Align = alTop then // splitter is horizontal
    // so increase hieght
    Control.Height := Location
  else if Control.Align = alLeft then
    Control.Width := Location;
end;

procedure TfrmIzvjestaji.pagePotrazivanjaShow(Sender: TObject);
begin
    datePotrazivanjaOd.SelectedDate := Now;
    datePotrazivanjaDo.SelectedDate := Now;
end;

procedure TfrmIzvjestaji.pagePrihodOdRataShow(Sender: TObject);
begin
    datePrihodOd.SelectedDate := Now;
    datePrihodDo.SelectedDate := Now;
end;

procedure TfrmIzvjestaji.pageProdajaShow(Sender: TObject);
begin
    dateProdajaOd.SelectedDate := Now;
    dateProdajaDo.SelectedDate := Now;
end;

procedure TfrmIzvjestaji.pageProdajePoGrupamaKupacaShow(Sender: TObject);
begin
  calProdajePoGrupamaKupacaOd.SelectedDate := Now;
  calProdajePoGrupamaKupacaDo.SelectedDate := Now;

  dm.QKupciGrupe.Execute;
end;

procedure TfrmIzvjestaji.pgDugovanjaShow(Sender: TObject);
begin
  dm.QDugovanja.Execute;
end;

procedure TfrmIzvjestaji.pgPregledShow(Sender: TObject);
begin
  dm.QStatistika.Execute;
  frmMain.prevedi;
end;

procedure prevedi_grid();
begin
  cxSetResourceString(@scxGridCustomizationFormCaption, 'Podešavanja');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Kolone');
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Redovi');
  cxSetResourceString(@scxGridChartValueHintFormat, '%s za %s je %s');
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption, 'Podesite grafik');
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText, 'Dijagram kolona');
  cxSetResourceString(@scxGridChartBarDiagramDisplayText, 'Dijagram stubaca');
  cxSetResourceString(@scxGridChartLineDiagramDisplayText, 'Dijagram linija');
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText, 'Površinski dijagram');
  cxSetResourceString(@scxGridChartPieDiagramDisplayText, 'Pita dijagram');
  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption, 'Redovi');
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries, 'Sortirati po:');
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries, '<prazno>');
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption, 'Grupa podataka');
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption, 'Opcije');
  cxSetResourceString(@scxGridChartLegend, 'Legenda');
  cxSetResourceString(@scxGridChartLegendKeyBorder, 'Ključ ivice');
  cxSetResourceString(@scxGridChartPosition, 'Pozicija');
  cxSetResourceString(@scxGridChartPositionDefault, 'Podrazumijevano');
  cxSetResourceString(@scxGridChartPositionNone, 'Ništa');
  cxSetResourceString(@scxGridChartPositionLeft, 'Lijevo');
  cxSetResourceString(@scxGridChartPositionTop, 'Gore');
  cxSetResourceString(@scxGridChartPositionRight, 'Desno');
  cxSetResourceString(@scxGridChartPositionBottom, 'Dolje');
  cxSetResourceString(@scxGridChartAlignment, 'Poravnanje');
  cxSetResourceString(@scxGridChartAlignmentDefault, 'Podrazumijevano');
  cxSetResourceString(@scxGridChartAlignmentCenter, 'Centar');
  cxSetResourceString(@scxGridChartAlignmentEnd, 'Kraj');
  cxSetResourceString(@scxGridChartOrientation, 'Orijentacija');
  cxSetResourceString(@scxGridChartOrientationDefault, 'Podrazumijevano');
  cxSetResourceString(@scxGridChartOrientationHorizontal, 'Horizontalno');
  cxSetResourceString(@scxGridChartOrientationVertical, 'Vertikalno');
  cxSetResourceString(@scxGridChartBorder, 'Ivica');
  cxSetResourceString(@scxGridChartTitle, 'Naslov');
  cxSetResourceString(@scxGridChartToolBox, 'Kutija sa alatkama');
  cxSetResourceString(@scxGridChartDiagramSelector, 'Selektor dijagrama');
  cxSetResourceString(@scxGridChartOther, 'Drugo');
  cxSetResourceString(@scxGridChartValueHints, 'Nagovještaji vrijednosti');
  cxSetResourceString(@scxHideCustomization, 'Sakrij listu polja');
  cxSetResourceString(@scxShowCustomization, 'Prikaži listu polja');
  cxSetResourceString(@scxShowPrefilterDialog, 'Prikaži dijalog filtera');
  cxSetResourceString(@scxDataField, 'Podaci');
  cxSetResourceString(@scxDropFilterFields, 'Spustite filter polja ovdje');
  cxSetResourceString(@scxDropDataItems, 'Spustite polja podataka ovdje');
  cxSetResourceString(@scxDropRowFields, 'Spustite polja redova ovdje');
  cxSetResourceString(@scxDropColumnFields, 'Spustite polja kolona ovdje');
  cxSetResourceString(@scxGrandTotal, 'Ukupni total');
  cxSetResourceString(@scxGroupCount, '% Broj');
  cxSetResourceString(@scxGroupSum, '% Suma');
  cxSetResourceString(@scxGroupMin, '% Minimum');
  cxSetResourceString(@scxGroupMax, '% Maksimum');
  cxSetResourceString(@scxGroupAverage, '% Prosjek');
  cxSetResourceString(@scxGroupStdDev, '% Standardna devijacija');
  cxSetResourceString(@scxGroupStdDevP, '% Standardna devijacija(p)');
  cxSetResourceString(@scxGroupVariance, '% Varijacija');
  cxSetResourceString(@scxGroupVarianceP, '% Varijacija(p)');
  cxSetResourceString(@scxGroupCustom, '% Proizvoljna');
  cxSetResourceString(@scxOthers, 'Drugo');
  cxSetResourceString(@scxPrefilterCustomizeButtonCaption, 'Prefilter...');
  cxSetResourceString(@scxNoDataToDisplay, '<prazno>');
  cxSetResourceString(@scxPrefilterIsEmpty, '<Prefilter je prazan>');
  cxSetResourceString(@scxQuarterFormat, 'Četvrtine %d');
  cxSetResourceString(@scxExpand, 'Raširi');
  cxSetResourceString(@scxCollapse, 'Skupi');
  cxSetResourceString(@scxExpandAll, 'Raširi sve');
  cxSetResourceString(@scxCollapseAll, 'Skupi sve');
  cxSetResourceString(@scxHide, 'Sakrij');
  cxSetResourceString(@scxOrder, 'Redosled');
  cxSetResourceString(@scxMoveToBeginning, 'Pomjeri na početak');
  cxSetResourceString(@scxMoveToEnd, 'Pomjeri na kraj');
  cxSetResourceString(@scxMoveToLeft, 'Pomjeri ulijevo');
  cxSetResourceString(@scxMoveToRight, 'Pomjeri udesno');
  cxSetResourceString(@scxPivotGridShowAll, '(Prikaži sve)');
  cxSetResourceString(@scxPivotGridOk, 'Ok');
  cxSetResourceString(@scxPivotGridCancel, 'Otkaži');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Prevucite vrh kolone ovdje kako bi filtrirali po toj koloni');
end;


end.
