unit Skener;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DelphiTwain, DelphiTwain_Vcl,
  AdvGlowButton, CurvyControls, Vcl.Imaging.jpeg, dxGDIPlusClasses, AdvPicture;

type
  TfrmSkener = class(TForm)
    LBSources: TListBox;
    pnlAkcije: TCurvyPanel;
    lblSkener: TLabel;
    BtnScanWithDialog: TAdvGlowButton;
    BtnScanWithoutDialog: TAdvGlowButton;
    btnSave: TAdvGlowButton;
    imgHolder: TAdvPicture;
    procedure FormCreate(Sender: TObject);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure BtnScanWithoutDialogClick(Sender: TObject);
    procedure BtnScanWithDialogClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlAkcijeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Twain: TDelphiTwain;

    procedure ReloadSources;
  public
    { Public declarations }
  end;

var
  frmSkener: TfrmSkener;

implementation

uses Kupci, DataModule, Main;

{$R *.dfm}

procedure TfrmSkener.btnSaveClick(Sender: TObject);
var putanja, fajl: string;
begin

  dm.Query.Params.Clear;
  dm.Query.SQL.Text := 'select * from conf';
  dm.Query.Execute;

  putanja := dm.Query.FieldByName('FilesPath').Value;
  fajl := FormatDateTime('dd_MM_yyyy_hhmmss',Now)+'.jpg';

  ImgHolder.Picture.SaveToFile(putanja+fajl);
  frmMain.filePath := putanja+fajl;
  close;
end;

procedure TfrmSkener.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSkener.BtnScanWithDialogClick(Sender: TObject);
begin
  Twain.SelectedSourceIndex := LBSources.ItemIndex;

  if Assigned(Twain.SelectedSource) then begin
    //Load source, select transference method and enable (display interface)}
    Twain.SelectedSource.Loaded := True;
    Twain.SelectedSource.ShowUI := True;//display interface
    Twain.SelectedSource.Enabled := True;
  end;
end;

procedure TfrmSkener.BtnScanWithoutDialogClick(Sender: TObject);
begin
  Twain.SelectedSourceIndex := LBSources.ItemIndex;

  if Assigned(Twain.SelectedSource) then begin
    //Load source, select transference method and enable (display interface)}
    Twain.SelectedSource.Loaded := True;
    Twain.SelectedSource.ShowUI := False;
    Twain.SelectedSource.Enabled := True;
  end;
end;

procedure TfrmSkener.FormCreate(Sender: TObject);
begin
  inherited;

  Twain := TDelphiTwain.Create;
  Twain.OnTwainAcquire := TwainTwainAcquire;

  if Twain.LoadLibrary then
  begin
    //Load source manager
    Twain.SourceManagerLoaded := TRUE;

    ReloadSources;
  end else begin
    ShowMessage('Twain is not installed.');
  end;
end;

procedure TfrmSkener.FormDestroy(Sender: TObject);
begin
  Twain.Free;//Don't forget to free Twain!

  inherited;
end;

procedure TfrmSkener.FormShow(Sender: TObject);
begin
  if FileExists(frmMain.filePath) then
    ImgHolder.Picture.LoadFromFile(frmMain.filePath);
end;

procedure TfrmSkener.pnlAkcijeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmSkener.ReloadSources;
var
  I: Integer;
begin
  LBSources.Items.Clear;
  for I := 0 to Twain.SourceCount-1 do
    LBSources.Items.Add(Twain.Source[I].ProductName);

  if LBSources.Items.Count > 0 then
    LBSources.ItemIndex := 0;
end;

procedure TfrmSkener.TwainTwainAcquire(Sender: TObject; const Index: Integer;
  Image: TBitmap; var Cancel: Boolean);
begin
  ImgHolder.Picture.Assign(Image);
  Cancel := True;//Only want one image
end;


end.
