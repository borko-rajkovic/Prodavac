unit Artikli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvOfficePager, AdvOfficePagerStylers,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, CurvyControls, AdvGlowButton, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, AdvSmoothLabel, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  AdvScrollBox;

type
  TfrmArtikli = class(TForm)
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    pagerArtikli: TAdvOfficePager;
    pgModeli: TAdvOfficePage;
    pgGrupe: TAdvOfficePage;
    pgRasteri: TAdvOfficePage;
    pgPopusti: TAdvOfficePage;
    lblDodavanjeGrupe: TAdvSmoothLabel;
    gridGrupe: TcxGrid;
    gridGrupeDBTableView1: TcxGridDBTableView;
    gridGrupeLevel1: TcxGridLevel;
    pnlDodavanjeGrupe: TCurvyPanel;
    lblGrupaNaziv: TLabel;
    btnDodajGrupu: TAdvGlowButton;
    edtGrupaNaziv: TCurvyEdit;
    btnIzmijeniGrupu: TAdvGlowButton;
    btnObrisiGrupu: TAdvGlowButton;
    lblGrupaBroj: TLabel;
    edtGrupaBroj: TCurvyEdit;
    gridGrupeDBTableView1id: TcxGridDBColumn;
    gridGrupeDBTableView1Broj: TcxGridDBColumn;
    gridGrupeDBTableView1Naziv: TcxGridDBColumn;
    lblPopusti: TAdvSmoothLabel;
    gridPopusti: TcxGrid;
    gridPopustiDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnlPopusti: TCurvyPanel;
    lblPopustNaziv: TLabel;
    lblPopustIznos: TLabel;
    btnDodajPopust: TAdvGlowButton;
    edtPopustIznos: TCurvyEdit;
    btnIzmijeniPopust: TAdvGlowButton;
    btnObrisiPopust: TAdvGlowButton;
    edtPopustNaziv: TCurvyEdit;
    gridPopustiDBTableView1id: TcxGridDBColumn;
    gridPopustiDBTableView1Naziv: TcxGridDBColumn;
    gridPopustiDBTableView1Iznos: TcxGridDBColumn;
    lblRasteri: TAdvSmoothLabel;
    gridRasteri: TcxGrid;
    gridRasteriDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    pnlDodavanjeRastera: TCurvyPanel;
    lblRasterSifra: TLabel;
    lblRasterNaziv: TLabel;
    btnDodajRaster: TAdvGlowButton;
    edtRasterNaziv: TCurvyEdit;
    btnIzmijeniRaster: TAdvGlowButton;
    btnObrisiRaster: TAdvGlowButton;
    edtRasterSifra: TCurvyEdit;
    gridRasteriDBTableView1ID: TcxGridDBColumn;
    gridRasteriDBTableView1Sifra: TcxGridDBColumn;
    gridRasteriDBTableView1Naziv: TcxGridDBColumn;
    lblVelicineRastera: TAdvSmoothLabel;
    gridVelicinaRastera: TcxGrid;
    gridVelicinaRasteraDBTableView1: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    pnlVelicineRastera: TCurvyPanel;
    lblRasterVelicina: TLabel;
    btnDodajVelicinuRastera: TAdvGlowButton;
    btnIzmijeniVelicinuRastera: TAdvGlowButton;
    btnObrisiVelicinuRastera: TAdvGlowButton;
    edtRasterVelicina: TCurvyEdit;
    gridVelicinaRasteraDBTableView1id: TcxGridDBColumn;
    gridVelicinaRasteraDBTableView1Velicina: TcxGridDBColumn;
    gridVelicinaRasteraDBTableView1id_rastera: TcxGridDBColumn;
    lblModeli: TAdvSmoothLabel;
    gridModeli: TcxGrid;
    gridModeliDBTableView1: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    pnlDodavanjeModela: TCurvyPanel;
    lblModelNaziv: TLabel;
    lblModelGrupa: TLabel;
    btnDodajModel: TAdvGlowButton;
    edtModelCijena: TCurvyEdit;
    btnIzmijeniModel: TAdvGlowButton;
    btnObrisiModel: TAdvGlowButton;
    edtModelNaziv: TCurvyEdit;
    lblModelCijena: TLabel;
    lblModelRaster: TLabel;
    gridModeliDBTableView1id: TcxGridDBColumn;
    gridModeliDBTableView1id_grupe: TcxGridDBColumn;
    gridModeliDBTableView1model: TcxGridDBColumn;
    gridModeliDBTableView1cijena: TcxGridDBColumn;
    gridModeliDBTableView1id_rastera: TcxGridDBColumn;
    gridModeliDBTableView1Grupa: TcxGridDBColumn;
    gridModeliDBTableView1Raster: TcxGridDBColumn;
    cmbModelRaster: TcxLookupComboBox;
    cmbModelGrupa: TcxLookupComboBox;
    gridModeliDetalji: TcxGrid;
    gridModeliDetaljiDBTableView1: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    gridModeliDetaljiDBTableView1id: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1id_modela: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1velicina: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1brojkomada: TcxGridDBColumn;
    gridModeliDetaljiDBTableView1barkod: TcxGridDBColumn;
    pnlModelDetalji: TCurvyPanel;
    lblVelicina: TLabel;
    lblBrojKomada: TLabel;
    edtModelRasterBrojKomada: TCurvyEdit;
    btnIzmijeniModelDetalji: TAdvGlowButton;
    edtModelRasterVelicina: TCurvyEdit;
    lblModelDetalji: TAdvSmoothLabel;
    lblBarKod: TLabel;
    edtModelRasterBarKod: TCurvyEdit;
    gridModePopustMoguci: TcxGrid;
    gridModelPopustMoguciDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    gridModelPopustUnijeti: TcxGrid;
    gridModelPopustUnijetiDBTableView2: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    lblModelPopustUnijeti: TAdvSmoothLabel;
    lblModelPopustMoguci: TAdvSmoothLabel;
    btnToUnijetiPopusti: TAdvGlowButton;
    btnToMoguciPopusti: TAdvGlowButton;
    gridModelPopustMoguciDBTableView1id: TcxGridDBColumn;
    gridModelPopustMoguciDBTableView1id_modela: TcxGridDBColumn;
    gridModelPopustMoguciDBTableView1id_popusta: TcxGridDBColumn;
    gridModelPopustMoguciDBTableView1naziv: TcxGridDBColumn;
    gridModelPopustMoguciDBTableView1iznos: TcxGridDBColumn;
    gridModelPopustUnijetiDBTableView2id: TcxGridDBColumn;
    gridModelPopustUnijetiDBTableView2id_modela: TcxGridDBColumn;
    gridModelPopustUnijetiDBTableView2id_popusta: TcxGridDBColumn;
    gridModelPopustUnijetiDBTableView2naziv: TcxGridDBColumn;
    gridModelPopustUnijetiDBTableView2iznos: TcxGridDBColumn;
    lblUnijetiPopustiGrupe: TAdvSmoothLabel;
    lblMoguciPopustiGrupe: TAdvSmoothLabel;
    gridGrupePopustMoguci: TcxGrid;
    gridGrupePopustMoguciDBTableView1: TcxGridDBTableView;
    cxGridLevel8: TcxGridLevel;
    gridGrupePopustUnijeti: TcxGrid;
    gridGrupePopustUnijetiDBTableView2: TcxGridDBTableView;
    cxGridLevel9: TcxGridLevel;
    btnToUnijetiPopustiGrupe: TAdvGlowButton;
    btnToMoguciPopustiGrupe: TAdvGlowButton;
    gridGrupePopustUnijetiDBTableView2id: TcxGridDBColumn;
    gridGrupePopustUnijetiDBTableView2id_grupe: TcxGridDBColumn;
    gridGrupePopustUnijetiDBTableView2id_popusta: TcxGridDBColumn;
    gridGrupePopustUnijetiDBTableView2naziv: TcxGridDBColumn;
    gridGrupePopustUnijetiDBTableView2iznos: TcxGridDBColumn;
    gridGrupePopustMoguciDBTableView1id: TcxGridDBColumn;
    gridGrupePopustMoguciDBTableView1id_grupe: TcxGridDBColumn;
    gridGrupePopustMoguciDBTableView1id_popusta: TcxGridDBColumn;
    gridGrupePopustMoguciDBTableView1naziv: TcxGridDBColumn;
    gridGrupePopustMoguciDBTableView1iznos: TcxGridDBColumn;
    gridModeliDBTableView1Column1: TcxGridDBColumn;
    scrollboxModeli: TAdvScrollBox;
    pgModelPretraga: TAdvOfficePage;
    pnlPretragaModela: TCurvyPanel;
    lblPretragaModelaModel: TLabel;
    lblPretragaModelaGrupa: TLabel;
    lblPretragaModelaCijena: TLabel;
    edtPretragaModelaCijena: TCurvyEdit;
    cmbPretragaModelaGrupa: TcxLookupComboBox;
    lblPretragaModela: TAdvSmoothLabel;
    gridPretragaModela: TcxGrid;
    gridPretragaModelaDBTableView1: TcxGridDBTableView;
    cxGridLevel10: TcxGridLevel;
    gridPretragaModelaVelicine: TcxGrid;
    gridPretragaModelaVelicineDBTableView1: TcxGridDBTableView;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridLevel11: TcxGridLevel;
    btnPretragaModela: TAdvGlowButton;
    edtPretragaModelaBarKod: TCurvyEdit;
    lblPregragaModelaBarKod: TLabel;
    lblPretragaModelaPopusti: TAdvSmoothLabel;
    gridPretragaModelaPopusti: TcxGrid;
    gridPretragaModelaPopustiDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel12: TcxGridLevel;
    scrollboxPretragaModela: TAdvScrollBox;
    cmbPretragaModelaModel: TcxLookupComboBox;
    gridPretragaModelaDBTableView1id: TcxGridDBColumn;
    gridPretragaModelaDBTableView1id_grupe: TcxGridDBColumn;
    gridPretragaModelaDBTableView1model: TcxGridDBColumn;
    gridPretragaModelaDBTableView1cijena: TcxGridDBColumn;
    gridPretragaModelaDBTableView1id_rastera: TcxGridDBColumn;
    gridPretragaModelaDBTableView1Grupa: TcxGridDBColumn;
    gridPretragaModelaDBTableView1Raster: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDodajGrupuClick(Sender: TObject);
    procedure gridGrupeDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnIzmijeniGrupuClick(Sender: TObject);
    procedure btnObrisiGrupuClick(Sender: TObject);
    procedure pgGrupeShow(Sender: TObject);
    procedure pgPopustiShow(Sender: TObject);
    procedure gridPopustiDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnDodajPopustClick(Sender: TObject);
    procedure btnIzmijeniPopustClick(Sender: TObject);
    procedure btnObrisiPopustClick(Sender: TObject);
    procedure pgRasteriShow(Sender: TObject);
    procedure gridRasteriDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnDodajRasterClick(Sender: TObject);
    procedure btnIzmijeniRasterClick(Sender: TObject);
    procedure btnObrisiRasterClick(Sender: TObject);
    procedure gridVelicinaRasteraDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnDodajVelicinuRasteraClick(Sender: TObject);
    procedure btnIzmijeniVelicinuRasteraClick(Sender: TObject);
    procedure btnObrisiVelicinuRasteraClick(Sender: TObject);
    procedure pgModeliShow(Sender: TObject);
    procedure btnDodajModelClick(Sender: TObject);
    procedure btnIzmijeniModelClick(Sender: TObject);
    procedure btnObrisiModelClick(Sender: TObject);
    procedure gridModeliDetaljiDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnIzmijeniModelDetaljiClick(Sender: TObject);
    procedure gridModeliDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnToMoguciPopustiClick(Sender: TObject);
    procedure btnToUnijetiPopustiClick(Sender: TObject);
    procedure btnToUnijetiPopustiGrupeClick(Sender: TObject);
    procedure btnToMoguciPopustiGrupeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbPretragaModelaGrupaPropertiesChange(Sender: TObject);
    procedure cmbPretragaModelaModelPropertiesChange(Sender: TObject);
    procedure btnPretragaModelaClick(Sender: TObject);
    procedure gridPretragaModelaDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtikli: TfrmArtikli;

implementation

uses Main, DataModule;

{$R *.dfm}

{$Region 'Grupe'}

procedure TfrmArtikli.btnDodajGrupuClick(Sender: TObject);
begin
  if  (Trim(edtGrupaBroj.Text)='') or (Trim(edtGrupaNaziv.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artgrupe(broj,naziv) values(:broj,:naziv)';
  dm.Query.ParamByName('broj').Value := edtGrupaBroj.Text;
  dm.Query.ParamByName('naziv').Value := edtGrupaNaziv.Text;
  dm.Query.Execute;

  dm.QArtGrupe.Execute;
end;

procedure TfrmArtikli.btnIzmijeniGrupuClick(Sender: TObject);
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
  dm.Query.SQL.Text := 'update artgrupe set broj=:broj, naziv=:naziv where id=:id_grupe';
  dm.Query.ParamByName('broj').Value := edtGrupaBroj.Text;
  dm.Query.ParamByName('naziv').Value := edtGrupaNaziv.Text;
  dm.Query.ParamByName('id_grupe').Value := id;
  dm.Query.Execute;

  dm.QArtGrupe.Execute;
  dm.QArtGrupe.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.btnObrisiGrupuClick(Sender: TObject);
begin
  if gridGrupeDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana grupa za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as br_modela from artmodeli where id_grupe=:id_grupe';
  dm.Query.ParamByName('id_grupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('br_modela').Value > 0 then
  begin
    MessageDlg('Ova grupa pod sobom ima modele i ne može se brisati',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artpopustigrupe where id_grupe=:id_grupe;delete from artgrupe where id=:id_grupe';
  dm.Query.ParamByName('id_grupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QArtGrupe.Execute;
  dm.QArtGrupePopustMoguci.Close;
  dm.QArtGrupePopustUnijeti.Close;
end;

procedure TfrmArtikli.gridGrupeDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtGrupaBroj.Text := gridGrupeDBTableView1Broj.EditValue;
  edtGrupaNaziv.Text := gridGrupeDBTableView1Naziv.EditValue;

  dm.QArtGrupePopustMoguci.Params.Clear;
  dm.QArtGrupePopustMoguci.SQL.Text := 'select ag.id,ag.id_grupe,ap.id as id_popusta, ap.naziv, ap.iznos '+
                                        'from artpopusti ap '+
                                        'left join artpopustigrupe ag '+
                                        'on ag.id_popusta = ap.id and ag.id_grupe = :idgrupe '+
                                        'where ag.id is null ';
  dm.QArtGrupePopustMoguci.ParamByName('idgrupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.QArtGrupePopustMoguci.Execute;

  dm.QArtGrupePopustUnijeti.Params.Clear;
  dm.QArtGrupePopustUnijeti.SQL.Text := 'select ag.*, ap.naziv,ap.iznos from artpopustigrupe ag '+
                                          'inner join artpopusti ap '+
                                          'on ag.id_popusta = ap.id and ag.id_grupe = :idgrupe ';
  dm.QArtGrupePopustUnijeti.ParamByName('idgrupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.QArtGrupePopustUnijeti.Execute;
end;

procedure TfrmArtikli.btnToUnijetiPopustiGrupeClick(Sender: TObject);
begin
  if gridGrupePopustMoguciDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artpopustigrupe(id_grupe,id_popusta) values(:id_grupe,:id_popusta)';
  dm.Query.ParamByName('id_grupe').Value := gridGrupeDBTableView1id.EditValue;
  dm.Query.ParamByName('id_popusta').Value := gridGrupePopustMoguciDBTableView1id_popusta.EditValue;
  dm.Query.Execute;

  dm.QArtGrupePopustMoguci.Execute;
  dm.QArtGrupePopustUnijeti.Execute;
end;

procedure TfrmArtikli.cmbPretragaModelaGrupaPropertiesChange(Sender: TObject);
begin
  cmbPretragaModelaModel.Text := '';
  edtPretragaModelaCijena.Text := '';
  dm.QArtModeliPretraga.Params.Clear;
  dm.QArtModeliPretraga.SQL.Text := 'select * from artmodeli where id_grupe = :id_grupe';
  dm.QArtModeliPretraga.ParamByName('id_grupe').Value := dm.QArtGrupe.FieldByName('id').Value;
  dm.QArtModeliPretraga.Execute;
end;

procedure TfrmArtikli.cmbPretragaModelaModelPropertiesChange(Sender: TObject);
begin
  edtPretragaModelaCijena.Text := dm.QArtModeliPretraga.FieldByName('cijena').Text;
end;

procedure TfrmArtikli.btnToMoguciPopustiGrupeClick(Sender: TObject);
begin
  if gridGrupePopustUnijetiDBTableView2id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artpopustigrupe where id = :idmodelpopust';
  dm.Query.ParamByName('idmodelpopust').Value := gridGrupePopustUnijetiDBTableView2id.EditValue;
  dm.Query.Execute;

  dm.QArtGrupePopustMoguci.Execute;
  dm.QArtGrupePopustUnijeti.Execute;
end;

procedure TfrmArtikli.pgGrupeShow(Sender: TObject);
begin
  dm.QArtGrupe.Execute;
end;

{$EndRegion}

{$Region 'Popusti'}

procedure TfrmArtikli.btnDodajPopustClick(Sender: TObject);
begin
  if  (Trim(edtPopustIznos.Text)='') or (Trim(edtPopustNaziv.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artpopusti(iznos,naziv) values(:iznos,:naziv)';
  dm.Query.ParamByName('iznos').Value := edtPopustIznos.Text;
  dm.Query.ParamByName('naziv').Value := edtPopustNaziv.Text;
  dm.Query.Execute;

  dm.QArtPopusti.Execute;
end;

procedure TfrmArtikli.btnIzmijeniPopustClick(Sender: TObject);
var id: integer;
begin
  if gridPopustiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if (Trim(edtPopustNaziv.Text)='') or (Trim(edtPopustIznos.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridPopustiDBTableView1id.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artpopusti set iznos=:iznos, naziv=:naziv where id=:id_popusta';
  dm.Query.ParamByName('iznos').Value := edtPopustIznos.Text;
  dm.Query.ParamByName('naziv').Value := edtPopustNaziv.Text;
  dm.Query.ParamByName('id_popusta').Value := id;
  dm.Query.Execute;

  dm.QArtPopusti.Execute;
  dm.QArtPopusti.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.btnObrisiPopustClick(Sender: TObject);
begin
  if gridPopustiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select id_popusta, sum(broj_popusta) as broj_popusta from '+
                        '(select id_popusta,count(*) as broj_popusta '+
                        'from artpopustigrupe ag '+
                        'group by id_popusta '+
                        'union all '+
                        'select id_popusta,count(*) as broj_popusta '+
                        'from artpopustimodel am '+
                        'group by id_popusta) a '+
                        'where a.id_popusta = :id_popusta '+
                        'group by a.id_popusta ';
  dm.Query.ParamByName('id_popusta').Value := gridPopustiDBTableView1id.EditValue;
  dm.Query.Execute;

  if dm.Query.RecordCount > 0 then
  begin
    MessageDlg('Ovaj popust je vezan na grupu/model i ne može se brisati',mtError,[mbOk],0);
    Abort;
   end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artpopusti where id=:id_popusta';
  dm.Query.ParamByName('id_popusta').Value := gridPopustiDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QArtPopusti.Execute;
end;

procedure TfrmArtikli.gridPopustiDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtPopustIznos.Text := gridPopustiDBTableView1Iznos.EditValue;
  edtPopustNaziv.Text := gridPopustiDBTableView1Naziv.EditValue;
end;

procedure TfrmArtikli.gridPretragaModelaDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtModelNaziv.Text := gridPretragaModelaDBTableView1model.EditValue;
  edtModelCijena.Text := gridPretragaModelaDBTableView1cijena.EditValue;
  cmbModelGrupa.Text := gridPretragaModelaDBTableView1Grupa.EditValue;
  cmbModelRaster.Text := gridPretragaModelaDBTableView1Raster.EditValue;

  dm.QArtModeliPretragaDetalji.Params.Clear;
  dm.QArtModeliPretragaDetalji.SQL.Text := 'select * from artmodelidetalji where id_modela = :id_modela';
  dm.QArtModeliPretragaDetalji.ParamByName('id_modela').Value := gridPretragaModelaDBTableView1id.EditValue;
  dm.QArtModeliPretragaDetalji.Execute;

  dm.QArtModeliPretragaPopust.Params.Clear;
  dm.QArtModeliPretragaPopust.SQL.Text := 'select * '+
                                'from artpopusti p '+
                                'where p.id in '+
                                '(select id_popusta from artpopustimodel pm where pm.id_modela = :id_modela) '+
                                'or p.id in (select id_popusta from artpopustigrupe pg where '+
                                'pg.id_grupe in (select id_grupe from artmodeli where id=:id_modela))';

  dm.QArtModeliPretragaPopust.ParamByName('id_modela').Value := gridPretragaModelaDBTableView1id.EditValue;
  dm.QArtModeliPretragaPopust.Execute;
end;

procedure TfrmArtikli.pgPopustiShow(Sender: TObject);
begin
    dm.QArtPopusti.Execute;
end;

{$EndRegion}

{$Region 'Rasteri'}

procedure TfrmArtikli.btnDodajRasterClick(Sender: TObject);
begin
  if  (Trim(edtRasterNaziv.Text)='') or (Trim(edtRasterSifra.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artrasteri(sifra,naziv) values(:sifra,:naziv)';
  dm.Query.ParamByName('sifra').Value := edtRasterSifra.Text;
  dm.Query.ParamByName('naziv').Value := edtRasterNaziv.Text;
  dm.Query.Execute;

  dm.QArtRasteri.Execute;
end;

procedure TfrmArtikli.btnDodajVelicinuRasteraClick(Sender: TObject);
begin

  if gridRasteriDBTableView1ID.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran raster za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if  (Trim(edtRasterVelicina.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artrasterivelicina(id_rastera,velicina) values(:id_rastera,:velicina)';
  dm.Query.ParamByName('id_rastera').Value := gridRasteriDBTableView1ID.EditValue;
  dm.Query.ParamByName('velicina').Value := edtRasterVelicina.Text;
  dm.Query.Execute;

  dm.QArtVelicinaRastera.Execute;
end;

procedure TfrmArtikli.btnIzmijeniRasterClick(Sender: TObject);
var id: integer;
begin
  if gridRasteriDBTableView1ID.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran raster za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if (Trim(edtRasterNaziv.Text)='') or (Trim(edtRasterSifra.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridRasteriDBTableView1ID.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artrasteri set sifra=:sifra, naziv=:naziv where id=:id_rastera';
  dm.Query.ParamByName('sifra').Value := edtRasterSifra.Text;
  dm.Query.ParamByName('naziv').Value := edtRasterNaziv.Text;
  dm.Query.ParamByName('id_rastera').Value := id;
  dm.Query.Execute;

  dm.QArtRasteri.Execute;
  dm.QArtRasteri.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.btnIzmijeniVelicinuRasteraClick(Sender: TObject);
var id: integer;
begin
  if gridRasteriDBTableView1ID.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran raster za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if gridVelicinaRasteraDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana veličina rastera za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if (Trim(edtRasterVelicina.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridVelicinaRasteraDBTableView1id.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artrasterivelicina set velicina=:velicina where id=:id_velicina';
  dm.Query.ParamByName('velicina').Value := edtRasterVelicina.Text;
  dm.Query.ParamByName('id_velicina').Value := id;
  dm.Query.Execute;

  dm.QArtVelicinaRastera.Execute;
  dm.QArtVelicinaRastera.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.btnObrisiRasterClick(Sender: TObject);
begin
  if gridRasteriDBTableView1ID.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran raster za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select count(*) as br_rastera from artmodeli where id_rastera=:id_rastera';
  dm.Query.ParamByName('id_rastera').Value := gridRasteriDBTableView1ID.EditValue;
  dm.Query.Execute;

  if dm.Query.FieldByName('br_rastera').Value > 0 then
  begin
    MessageDlg('Ovaj raster pod sobom ima modele i ne može se brisati',mtError,[mbOk],0);
    Abort;
 end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artrasterivelicina where id_rastera=:id_rastera;delete from artrasteri where id=:id_rastera';
  dm.Query.ParamByName('id_rastera').Value := gridRasteriDBTableView1ID.EditValue;
  dm.Query.Execute;

  dm.QArtRasteri.Execute;
  dm.QArtVelicinaRastera.Close;
end;

procedure TfrmArtikli.btnObrisiVelicinuRasteraClick(Sender: TObject);
begin
  if gridVelicinaRasteraDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana veličina rastera za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artrasterivelicina where id=:id_velicine';
  dm.Query.ParamByName('id_velicine').Value := gridVelicinaRasteraDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QArtVelicinaRastera.Execute;
end;

procedure TfrmArtikli.btnPretragaModelaClick(Sender: TObject);
begin
  dm.QArtModeliPretragaGrid.Params.Clear;
  dm.QArtModeliPretragaGrid.SQL.Text := 'select am.*, ag.Naziv as Grupa, ar.Naziv as Raster '+
                                        'from artmodeli am '+
                                        'inner join artgrupe ag '+
                                        'on am.id_grupe = ag.id '+
                                        'inner join artrasteri ar '+
                                        'on ar.id = am.id_rastera '+
                                        'where 1=1  ';

  if cmbPretragaModelaGrupa.Text <> '' then
    begin
      dm.QArtModeliPretragaGrid.SQL.Text := dm.QArtModeliPretragaGrid.SQL.Text + 'and ag.id=:id_grupe ';
      dm.QArtModeliPretragaGrid.ParamByName('id_grupe').Value := dm.QArtGrupe.FieldByName('id').Value;
    end;
  if cmbPretragaModelaModel.Text <> '' then
    begin
      dm.QArtModeliPretragaGrid.SQL.Text := dm.QArtModeliPretragaGrid.SQL.Text + 'and am.id=:id_modela ';
      dm.QArtModeliPretragaGrid.ParamByName('id_modela').Value := dm.QArtModeliPretraga.FieldByName('id').Value;
    end;
  if edtPretragaModelaBarKod.Text <> '' then
    begin
      dm.QArtModeliPretragaGrid.SQL.Text := dm.QArtModeliPretragaGrid.SQL.Text + 'and am.id in (select id_modela from artmodelidetalji where barkod like :barkod) ';
      dm.QArtModeliPretragaGrid.ParamByName('barkod').Value := '%'+edtPretragaModelaBarKod.Text+'%';
    end;

  dm.QArtModeliPretragaGrid.Execute;
end;

procedure TfrmArtikli.gridRasteriDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    edtRasterNaziv.Text := gridRasteriDBTableView1Naziv.EditValue;
    edtRasterSifra.Text := gridRasteriDBTableView1Sifra.EditValue;

    dm.QArtVelicinaRastera.Params.Clear;
    dm.QArtVelicinaRastera.SQL.Text := 'select * from artrasterivelicina where id_rastera = :id_rastera';
    dm.QArtVelicinaRastera.ParamByName('id_rastera').Value := gridRasteriDBTableView1ID.EditValue;
    dm.QArtVelicinaRastera.Execute;
end;

procedure TfrmArtikli.gridVelicinaRasteraDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtRasterVelicina.Text := gridVelicinaRasteraDBTableView1Velicina.EditValue;
end;

procedure TfrmArtikli.pgRasteriShow(Sender: TObject);
begin
   dm.QArtRasteri.Execute;
end;

{$EndRegion}

{$Region 'Modeli'}

procedure TfrmArtikli.btnDodajModelClick(Sender: TObject);
var
id_modela: integer;
begin
  if  (Trim(edtModelNaziv.Text)='') or (Trim(edtModelCijena.Text)='') or (Trim(cmbModelGrupa.Text)='') or (Trim(cmbModelRaster.Text)='') then
  begin
    MessageDlg('Morate unijeti sva neophodna polja za unos',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artmodeli(id_grupe,model,cijena,id_rastera) values(:id_grupe,:model,:cijena,:id_rastera); select last_insert_id() as id_modela;';
  dm.Query.ParamByName('id_grupe').Value := dm.QArtGrupe.FieldByName('id').value;
  dm.Query.ParamByName('model').Value := edtModelNaziv.Text;
  dm.Query.ParamByName('cijena').Value :=  StrToFloat(edtModelCijena.Text);
  dm.Query.ParamByName('id_rastera').Value := dm.QArtRasteri.FieldByName('id').value;
  dm.Query.Execute;

  id_modela := dm.Query.FieldByName('id_modela').Value;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'INSERT INTO  '+
                        '  artmodelidetalji '+
                        '( '+
                        '  id_modela, '+
                        '  velicina, '+
                        '  brojkomada, '+
                        '  barkod '+
                        ')  '+
                        'select :id_modela,a.velicina,0,'''' from artrasterivelicina a '+
                        'where a.id_rastera = :raster_id ';
  dm.Query.ParamByName('id_modela').Value := id_modela;
  dm.Query.ParamByName('raster_id').Value := dm.QArtRasteri.FieldByName('id').value;
  dm.Query.Execute;

  dm.QArtModeli.Execute;
end;

procedure TfrmArtikli.btnObrisiModelClick(Sender: TObject);
begin
  if gridModeliDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran model za brisanje',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artmodelidetalji where id_modela=:id_modela;delete from artpopustimodel where id_modela=:id_modela;delete from artmodeli where id=:id_modela';
  dm.Query.ParamByName('id_modela').Value := gridModeliDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artmodelidetalji where id_modela=:id_modela';
  dm.Query.ParamByName('id_modela').Value := gridModeliDBTableView1id.EditValue;
  dm.Query.Execute;

  dm.QArtModeli.Execute;
  dm.QArtModeliPopustMoguci.Close;
  dm.QArtModeliPopustUnijeti.Close;
  dm.QArtModeliDetalji.Close;
end;

procedure TfrmArtikli.btnIzmijeniModelClick(Sender: TObject);
var id: integer;
begin
  if gridModeliDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran model za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if  (Trim(edtModelNaziv.Text)='') or (Trim(edtModelCijena.Text)='') or (Trim(cmbModelGrupa.Text)='') or (Trim(cmbModelRaster.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridModeliDBTableView1id.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artmodeli set id_grupe=:id_grupe, model=:model, cijena=:cijena, id_rastera=:id_rastera where id=:id_modela';
  dm.Query.ParamByName('id_grupe').Value := dm.QArtGrupe.FieldByName('id').value;
  dm.Query.ParamByName('model').Value := edtModelNaziv.Text;
  dm.Query.ParamByName('cijena').Value :=  StrToFloat(edtModelCijena.Text);
  dm.Query.ParamByName('id_rastera').Value := dm.QArtRasteri.FieldByName('id').value;
  dm.Query.ParamByName('id_modela').Value := id;
  dm.Query.Execute;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artmodelidetalji where id_modela=:id_modela; INSERT INTO  '+
                        '  artmodelidetalji '+
                        '( '+
                        '  id_modela, '+
                        '  velicina, '+
                        '  brojkomada, '+
                        '  barkod '+
                        ')  '+
                        'select :id_modela,a.velicina,0,'''' from artrasterivelicina a '+
                        'where a.id_rastera = :raster_id ';
  dm.Query.ParamByName('id_modela').Value := id;
  dm.Query.ParamByName('raster_id').Value := dm.QArtRasteri.FieldByName('id').value;
  dm.Query.Execute;

  dm.QArtModeli.Execute;
  dm.QArtModeli.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.btnIzmijeniModelDetaljiClick(Sender: TObject);
var id: integer;
begin
  if gridModeliDetaljiDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabrana veličina modela za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  if  (Trim(edtModelRasterBrojKomada.Text)='') then
  begin
    MessageDlg('Morate unijeti sva polja',mtError,[mbOk],0);
    Abort;
  end;

  id := gridModeliDetaljiDBTableView1id.EditValue;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update artmodelidetalji set brojkomada=:brojkomada, barkod=:barkod where id=:id_model_detalj';
  dm.Query.ParamByName('brojkomada').Value :=  StrToInt(edtModelRasterBrojKomada.Text);
  dm.Query.ParamByName('barkod').Value := edtModelRasterBarKod.Text;
  dm.Query.ParamByName('id_model_detalj').Value := id;
  dm.Query.Execute;

  dm.QArtModeliDetalji.Execute;
  dm.QArtModeliDetalji.Locate('id',id,[loCaseInsensitive]);
end;

procedure TfrmArtikli.gridModeliDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtModelNaziv.Text := gridModeliDBTableView1model.EditValue;
  edtModelCijena.Text := gridModeliDBTableView1cijena.EditValue;
  cmbModelGrupa.Text := gridModeliDBTableView1Grupa.EditValue;
  cmbModelRaster.Text := gridModeliDBTableView1Raster.EditValue;

  dm.QArtModeliDetalji.Params.Clear;
  dm.QArtModeliDetalji.SQL.Text := 'select * from artmodelidetalji where id_modela = :idmodela';
  dm.QArtModeliDetalji.ParamByName('idmodela').Value := gridModeliDBTableView1id.EditValue;
  dm.QArtModeliDetalji.Execute;

  dm.QArtModeliPopustMoguci.Params.Clear;
  dm.QArtModeliPopustMoguci.SQL.Text := 'select am.id,am.id_modela,ap.id as id_popusta, ap.naziv, ap.iznos '+
                                        'from artpopusti ap '+
                                        'left join artpopustimodel am '+
                                        'on ap.id = am.id_popusta and am.id_modela = :idmodela '+
                                        'where am.id is null ';
  dm.QArtModeliPopustMoguci.ParamByName('idmodela').Value := gridModeliDBTableView1id.EditValue;
  dm.QArtModeliPopustMoguci.Execute;

  dm.QArtModeliPopustUnijeti.Params.Clear;
  dm.QArtModeliPopustUnijeti.SQL.Text := 'select am.*, ap.naziv,ap.iznos from artpopustimodel am '+
                                          'inner join artpopusti ap '+
                                          'on am.id_popusta = ap.id and am.id_modela = :idmodela ';
  dm.QArtModeliPopustUnijeti.ParamByName('idmodela').Value := gridModeliDBTableView1id.EditValue;
  dm.QArtModeliPopustUnijeti.Execute;

end;

procedure TfrmArtikli.gridModeliDetaljiDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  edtModelRasterVelicina.Text := gridModeliDetaljiDBTableView1velicina.EditValue;
  edtModelRasterBrojKomada.Text := gridModeliDetaljiDBTableView1brojkomada.EditValue;
  edtModelRasterBarKod.Text := gridModeliDetaljiDBTableView1barkod.EditValue;
end;

procedure TfrmArtikli.btnToMoguciPopustiClick(Sender: TObject);
begin
  if gridModelPopustUnijetiDBTableView2id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'delete from artpopustimodel where id = :idmodelpopust';
  dm.Query.ParamByName('idmodelpopust').Value := gridModelPopustUnijetiDBTableView2id.EditValue;
  dm.Query.Execute;

  dm.QArtModeliPopustMoguci.Execute;
  dm.QArtModeliPopustUnijeti.Execute;

end;

procedure TfrmArtikli.btnToUnijetiPopustiClick(Sender: TObject);
begin
  if gridModelPopustMoguciDBTableView1id.EditValue = Unassigned then
  begin
    MessageDlg('Nije odabran popust za izmjenu',mtError,[mbOk],0);
    Abort;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'insert into artpopustimodel(id_modela,id_popusta) values(:id_modela,:id_popusta)';
  dm.Query.ParamByName('id_modela').Value := gridModeliDBTableView1id.EditValue;
  dm.Query.ParamByName('id_popusta').Value := gridModelPopustMoguciDBTableView1id_popusta.EditValue;
  dm.Query.Execute;

  dm.QArtModeliPopustMoguci.Execute;
  dm.QArtModeliPopustUnijeti.Execute;


end;

procedure TfrmArtikli.pgModeliShow(Sender: TObject);
begin
  dm.QArtModeli.Execute;
  dm.QArtGrupe.Execute;
  dm.QArtRasteri.Execute;
end;

{$Region 'Raster za model'}

{$EndRegion}

{$EndRegion}

procedure TfrmArtikli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.indArtikli := 0;
  Self.Free;
end;

procedure TfrmArtikli.FormShow(Sender: TObject);
begin
  dm.QArtGrupe.Execute;
  dm.QArtModeliPretraga.Execute;
  if frmMain.indAdministrator = 0 then
  begin
    pagerArtikli.RemoveAdvPage(pgModeli);
    pagerArtikli.RemoveAdvPage(pgGrupe);
    pagerArtikli.RemoveAdvPage(pgPopusti);
    pagerArtikli.RemoveAdvPage(pgRasteri);
  end;

end;

end.
