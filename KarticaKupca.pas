unit KarticaKupca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CurvyControls, Vcl.StdCtrls,
  AdvSmoothLabel, Vcl.ExtCtrls, AdvPanel, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGridExportLink,cxGrid, cxGridServerModeTableView, cxCalendar, AdvCombo,
  ImagePicker, Vcl.Mask, AdvDropDown, AdvImagePickerDropDown, AdvOfficeImage,
  AdvSmoothEdit, AdvSmoothEditButton, AdvSmoothImageListBoxPicker, AdvGlowButton, ShellAPI;

type
  TfrmKartica = class(TForm)
    lblInformacijeOKupcu: TAdvSmoothLabel;
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
    lblProdaje: TAdvSmoothLabel;
    AdvPanelStyler: TAdvPanelStyler;
    pnlKartica: TAdvPanel;
    gridKartica: TcxGrid;
    gridKarticaProdajeDBTableView1: TcxGridDBTableView;
    gridKarticaLevel1: TcxGridLevel;
    gridKarticaLevel3: TcxGridLevel;
    gridKarticaTableView1: TcxGridTableView;
    gridKarticaUplateDBTableView2: TcxGridDBTableView;
    gridKarticaServerModeTableView1: TcxGridServerModeTableView;
    gridKarticaProdajeDBTableView1id: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1id_kupca: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1proizvod: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1cijena: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1broj_rata: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1id_velicine: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1velicina: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1popust: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1odobreno: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1username: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1datum: TcxGridDBColumn;
    gridKarticaUplateDBTableView2id: TcxGridDBColumn;
    gridKarticaUplateDBTableView2id_prodaje: TcxGridDBColumn;
    gridKarticaUplateDBTableView2iznos: TcxGridDBColumn;
    gridKarticaUplateDBTableView2odobreno: TcxGridDBColumn;
    gridKarticaUplateDBTableView2username: TcxGridDBColumn;
    gridKarticaUplateDBTableView2datum: TcxGridDBColumn;
    lblKartica: TAdvSmoothLabel;
    gridKarticaDugovnaPotrazna: TcxGrid;
    gridKarticaDugovnaPotraznaDBTableView1: TcxGridDBTableView;
    gridKarticaDugovnaPotraznaLevel1: TcxGridLevel;
    gridKarticaDugovnaPotraznaDBTableView1duguje: TcxGridDBColumn;
    gridKarticaDugovnaPotraznaDBTableView1potrazuje: TcxGridDBColumn;
    gridKarticaDugovnaPotraznaDBTableView1datum: TcxGridDBColumn;
    gridKarticaProdajeDBTableView1brojkomada: TcxGridDBColumn;
    lblNapomena: TLabel;
    edtNapomena: TCurvyEdit;
    gridKarticaDugovnaPotraznaDBTableView1saldo: TcxGridDBColumn;
    gridKarticaDugovnaPotraznaDBTableView1dat: TcxGridDBColumn;
    imgBlue: TAdvOfficeImage;
    cmbIndikator: TAdvImagePickerDropDown;
    imgRed: TAdvOfficeImage;
    imgGreen: TAdvOfficeImage;
    imgYellow: TAdvOfficeImage;
    lblKopijaLicne: TLabel;
    edtKopijaLicne: TCurvyEdit;
    btnSkener: TAdvGlowButton;
    lblNapomena2: TLabel;
    edtNapomena2: TCurvyEdit;
    btnIzmijeniNapomenu: TAdvGlowButton;
    gridKarticaDugovnaPotraznaDBTableView1preostalidug: TcxGridDBColumn;
    gridKarticaDugovnaPotraznaDBTableView1duguvaluti: TcxGridDBColumn;
    btnExcel: TAdvGlowButton;
    gridKarticaDugovnaPotraznaDBTableView1proizvod: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cmbIndikatorChange(Sender: TObject);
    procedure imgBlueClick(Sender: TObject);
    procedure btnSkenerClick(Sender: TObject);
    procedure gridKarticaDugovnaPotraznaDBTableView1dugujeCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure gridKarticaDugovnaPotraznaDBTableView1potrazujeCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure gridKarticaDugovnaPotraznaDBTableView1saldoCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure PodesiIndikator();
    procedure btnIzmijeniNapomenuClick(Sender: TObject);
    procedure gridKarticaDugovnaPotraznaDBTableView1preostalidugCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure gridKarticaDugovnaPotraznaDBTableView1duguvalutiCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKartica: TfrmKartica;

implementation

uses DataModule, Main, Skener;

{$R *.dfm}

procedure TfrmKartica.btnExcelClick(Sender: TObject);
begin
     exportgridtoexcel('Kartica.xls',gridKarticaDugovnaPotrazna,true,true);
     ShellExecute(Application.Handle,
                 PChar('open'),
                 PChar('Kartica.xls'),
                 PChar(0),
                 nil,
                 SW_NORMAL);
end;

procedure TfrmKartica.btnIzmijeniNapomenuClick(Sender: TObject);
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update kupci set napomena2=:napomena2 where id=:id_kupca';
  dm.Query.ParamByName('napomena2').Value := edtNapomena2.Text;
  dm.Query.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
  dm.Query.Execute;

  MessageDlg('Izmjena uspješna',mtInformation,[mbOK],0,mbOK);

end;

procedure TfrmKartica.btnSkenerClick(Sender: TObject);
var frmSkener : TfrmSkener;
begin
  frmMain.filePath := edtKopijaLicne.Text;
  frmSkener := TfrmSkener.create(nil);
  try
    frmSkener.ShowModal;
  finally
    frmSkener.FreeOnRelease;
    edtKopijaLicne.Text := frmMain.filePath;
    dm.Query.Params.Clear;
    dm.Query.SQL.Text := 'update kupci set KopijaLicne = :KopijaLicne where id = :id_kupca';
    dm.Query.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
    dm.Query.ParamByName('KopijaLicne').Value := edtKopijaLicne.Text;
    dm.Query.Execute;
  end;
end;

procedure TfrmKartica.cmbIndikatorChange(Sender: TObject);
begin
  case cmbIndikator.ItemIndex of
    0: begin
      imgGreen.Visible := True;
      imgYellow.Visible := False;
      imgRed.Visible := False;
      imgBlue.Visible := False;
    end;
    1: begin
      imgGreen.Visible := False;
      imgYellow.Visible := True;
      imgRed.Visible := False;
      imgBlue.Visible := False;
    end;
    2: begin
      imgGreen.Visible := False;
      imgYellow.Visible := False;
      imgRed.Visible := True;
      imgBlue.Visible := False;
    end;
    3: begin
      imgGreen.Visible := False;
      imgYellow.Visible := False;
      imgRed.Visible := False;
      imgBlue.Visible := True;
    end;
  end;

  dm.Query.Params.Clear;
  dm.Query.SQL.Text :=  'update kupci set indikator = :indikator where id = :id_kupca ';
  dm.Query.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
  dm.Query.ParamByName('indikator').Value := cmbIndikator.ItemIndex;
  dm.Query.Execute;

  cmbIndikator.Visible := False;
end;

procedure TfrmKartica.FormShow(Sender: TObject);
begin

dm.QPodesiLampice.Execute;
//PodesiIndikator();

dm.Query.Params.Clear;
dm.Query.SQL.Text :=  'select indikator from kupci where id = :id_kupca ';
dm.Query.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
dm.Query.Execute;

cmbIndikator.Visible := False;

case dm.Query.FieldByName('indikator').Value of
  0: begin
    cmbIndikator.ItemIndex := 0;
    imgGreen.Visible := True;
    imgYellow.Visible := False;
    imgRed.Visible := False;
    imgBlue.Visible := False;
  end;
  1: begin
    cmbIndikator.ItemIndex := 1;
    imgGreen.Visible := False;
    imgYellow.Visible := True;
    imgRed.Visible := False;
    imgBlue.Visible := False;
  end;
  2: begin
    cmbIndikator.ItemIndex := 2;
    imgGreen.Visible := False;
    imgYellow.Visible := False;
    imgRed.Visible := True;
    imgBlue.Visible := False;
  end;
  3: begin
    cmbIndikator.ItemIndex := 3;
    imgGreen.Visible := False;
    imgYellow.Visible := False;
    imgRed.Visible := False;
    imgBlue.Visible := True;
  end;
end;


  /////////////////////////////////////////////////////////
  ///                                                   ///
  ///               Podaci o kupcu                      ///
  ///                                                   ///
  /////////////////////////////////////////////////////////


dm.Query.Params.Clear;
dm.Query.SQL.Text :=  'select kg.naziv as Grupa, k.Prezime, k.Ime, k.JMBG, k.BrojLicne, k.KontaktTelefon, k.Napomena, k.Napomena2, k.KopijaLicne  '+
                      'from kupci k '+
                      'inner join kupcigrupe kg '+
                      'on k.id_kupcigrupe = kg.id '+
                      'where k.id = :id_kupca ';

dm.Query.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
dm.Query.Execute;

if dm.Query.RecordCount > 0 then
begin
  edtGrupaKupca.Text := dm.Query.FieldByName('Grupa').Value;
  edtPrezime.Text := dm.Query.FieldByName('Prezime').Value;
  edtIme.Text := dm.Query.FieldByName('Ime').Value;
  edtJMBG.Text := dm.Query.FieldByName('JMBG').Value;
  edtBrojLicne.Text := dm.Query.FieldByName('BrojLicne').Value;
  edtKontaktTelefon.Text := dm.Query.FieldByName('KontaktTelefon').Value;
  edtNapomena.Text := dm.Query.FieldByName('Napomena').Value;
  edtNapomena2.Text := dm.Query.FieldByName('Napomena2').Value;
  edtKopijaLicne.Text := dm.Query.FieldByName('KopijaLicne').Value;
end;

  /////////////////////////////////////////////////////////
  ///                                                   ///
  ///               Kartica kupca                       ///
  ///                                                   ///
  /////////////////////////////////////////////////////////


dm.QKarticaProdaje.Params.Clear;
dm.QKarticaProdaje.SQL.Text :=  'SELECT   id,  id_kupca,  id_prodavca,  proizvod,  cijena, '+
                                'brojkomada,  broj_rata,  id_velicine,  velicina,  popust,  odobreno, '+
                                'username,  datum, cijena-cijena*popust/100 as prodajna_cijena '+
                                'FROM kupljeni_proizvodi '+
                                'where id_kupca=:id_kupca';
dm.QKarticaProdaje.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
dm.QKarticaProdaje.Execute;

dm.QKarticaUplate.Execute;

dm.QKarticaKartica.Params.Clear;
dm.QKarticaKartica.SQL.Text :=  'select proizvod,(cijena-cijena*popust/100)*brojkomada as duguje, 0 as '+ 'potrazuje,-(cijena-cijena*popust/100)*brojkomada as saldo, date(datum) as datum, datum as dat, '+
                                'case when ifnull(datediff(curdate(),datum),0) > 165 then '+ '-(cijena-cijena*popust/100)*brojkomada else 0 end as preostalidug, '+
                                'case when ifnull(datediff(curdate(),datum),0) <= 165 then '+ '-(cijena-cijena*popust/100)*brojkomada else 0 end as duguvaluti '+
                                'from kupljeni_proizvodi  '+
                                'where id_kupca=:id_kupca '+
                                'union all  '+
                                'select ''Rata'',0 as duguje,iznos as potrazuje, iznos as saldo, date(datum) as datum, datum as dat, '+
                                'case when id_prodaje in (select id from kupljeni_proizvodi where '+ 'ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 end as preostalidug, '+
                                'case when id_prodaje not in (select id from kupljeni_proizvodi where '+ 'ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 end as duguvaluti '+
                                'from uplacene_rate  '+
                                'where id_prodaje in (select id from kupljeni_proizvodi where id_kupca=:id_kupca)  '+
                                'order by dat ';

dm.QKarticaKartica.ParamByName('id_kupca').Value := frmMain.karticaIdKupca;
dm.QKarticaKartica.Execute;

gridKarticaProdajeDBTableView1.ViewData.Collapse(True);

end;

procedure TfrmKartica.gridKarticaDugovnaPotraznaDBTableView1dugujeCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TfrmKartica.gridKarticaDugovnaPotraznaDBTableView1duguvalutiCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrmKartica.gridKarticaDugovnaPotraznaDBTableView1potrazujeCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TfrmKartica.gridKarticaDugovnaPotraznaDBTableView1preostalidugCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrmKartica.gridKarticaDugovnaPotraznaDBTableView1saldoCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := clRed;
end;

procedure TfrmKartica.imgBlueClick(Sender: TObject);
begin
//if frmmain.indAdministrator = 1 then
//  cmbIndikator.Visible := True;
end;

procedure TfrmKartica.PodesiIndikator();
begin
  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'update  '+
                        'kupci k '+
                        'inner join '+
                        '( '+
                        'select  '+
                        '	id_kupca, '+
                        '	ifnull(sum(-saldo),0) as dug,  '+
                        '	ifnull(datediff(curdate(),max(datum)),0) as brojDana  '+
                        'from  '+
                        '(select   '+
                        '	-(cijena-cijena*popust/100)*brojkomada as saldo, '+
                        '	date(datum) as datum, datum as dat, id_kupca '+
                        '	from kupljeni_proizvodi   '+
                        '	union all   '+
                        '	select ur.iznos as saldo, date(ur.datum) as datum, ur.datum as dat, kp.id_kupca '+
                        '	from uplacene_rate ur '+
                        '	inner join kupljeni_proizvodi kp '+
                        '	on ur.id_prodaje = kp.id) kupovine_i_uplate '+
                        'group by id_kupca '+
                        ') d '+
                        'on k.id = d.id_kupca '+
                        'set k.indikator =   case  '+
                        '					when d.dug<=0 then 3 '+
                        '                    when d.brojDana<=50 then 0 '+
                        '                    when d.brojDana >50 and d.brojDana <75 then 1 '+
                        '                    else 2 '+
                        '                    end; ';
  dm.Query.Execute;

end;

end.
