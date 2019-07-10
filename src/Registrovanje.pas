unit Registrovanje;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.ExtCtrls,
  CurvyControls, dxGDIPlusClasses, inifiles, AdvEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, advlued, Vcl.Mask,
  AdvSpin, cxTextEdit, AdvSmoothLabel, AdvShapeButton;

type
  TfRegistracija = class(TForm)
    imgtrue: TImage;
    imgfalse: TImage;
    imgBackground: TImage;
    edtRegistracija: TCurvyEdit;
    lblRegistracioni: TAdvSmoothLabel;
    lblSerial: TAdvSmoothLabel;
    function citaj(podatak1, podatak2: string): string;
    procedure FormShow(Sender: TObject);
    function GetVolumeID(): String;
    function IspravnaLozinka(serijski, registracija: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtRegistracijaKeyPress(Sender: TObject; var Key: Char);
    procedure edtRegistracijaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblSerialMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  fRegistracija: TfRegistracija;

implementation

uses Main, uRegistry;

{$R *.dfm}

function Tfregistracija.GetVolumeID(): String;
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

function Tfregistracija.citaj(podatak1, podatak2: string): string;
var
  Iniforma  : TIniFile;
  broj : String;
begin

  if frmMain._koristiIni then
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

procedure TfRegistracija.edtRegistracijaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
   begin
   if trim(edtRegistracija.text)=''then
      edtRegistracija.text:='0';
   if IspravnaLozinka(GetVolumeID,edtRegistracija.Text) then
      Begin
        imgtrue.visible :=true;
        imgfalse.visible :=false;
        if frmMain._koristiIni then
          frmMain.zapisiuini('serijski',getCurrentDir+'/','broj','kljuc',edtRegistracija.text)
        else
          RegistryWrite('registration_no',edtRegistracija.Text);
      End
      else
      Begin
        imgtrue.visible :=false;
        imgfalse.visible :=true;
        if frmMain._koristiIni then
          frmMain.zapisiuini('serijski',getCurrentDir+'/','broj','kljuc','0')
        else
          RegistryWrite('registration_no','0');
      End;
   end;
end;

procedure TfRegistracija.edtRegistracijaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(key, ['0'..'9',#8,#13]) then key :=#0;
end;

procedure TfRegistracija.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (imgtrue.Visible=false) then
   begin
     MessageDlg('Žao nam je ali nemate prava da koristite ovaj program!',mtInformation,[mbOk],0);
     frmMain.Enabled :=true;
     ModalResult := mrCancel;
   end
 else
 begin
    frmMain.Enabled :=true;
    ModalResult := mrOk;
 end;

end;

procedure TfRegistracija.FormShow(Sender: TObject);
begin
frmMain.Enabled := false;
lblSerial.caption.Text := lblSerial.caption.Text + ' - ' + getvolumeid();
edtRegistracija.Text := citaj('broj','kljuc');
if edtRegistracija.Text = '0' then edtRegistracija.Text := '';

if trim(edtRegistracija.text)<>'' then
      if IspravnaLozinka(GetVolumeID(),edtRegistracija.Text) then
      Begin
        imgtrue.visible :=true;
        imgfalse.visible :=false;
      End
      else
      Begin
        imgtrue.visible :=false;
        imgfalse.visible :=true;
      End;
end;

function TfRegistracija.IspravnaLozinka(serijski, registracija: string): Boolean;
begin
  if (2*StrToFloat(serijski)+4*1103988250012)=StrToFloat(registracija) then
    result := True
  else
    result := False;
end;

procedure TfRegistracija.lblSerialMouseDown(Sender: TObject;
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
