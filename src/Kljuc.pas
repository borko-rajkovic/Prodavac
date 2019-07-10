unit Kljuc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CurvyControls, Vcl.StdCtrls,
  AdvSmoothLabel;

type
  TfrmKeygen = class(TForm)
    lblSerijski: TAdvSmoothLabel;
    btnGenerisi: TButton;
    edtSerijski: TCurvyEdit;
    edtRegistracija: TCurvyEdit;
    lblRegistracija: TAdvSmoothLabel;
    procedure FormShow(Sender: TObject);
    procedure btnGenerisiClick(Sender: TObject);
    procedure edtSerijskiKeyPress(Sender: TObject; var Key: Char);
    procedure edtRegistracijaKeyPress(Sender: TObject; var Key: Char);
  private

  public

  end;

var
  frmKeygen: TfrmKeygen;

  function GetVolumeID(): String;

implementation

{$R *.dfm}

procedure TfrmKeygen.btnGenerisiClick(Sender: TObject);
begin
  edtRegistracija.Text := FloatToStr((strtofloat(trim(edtSerijski.Text)))*2+4*1103988250012);
end;

procedure TfrmKeygen.edtRegistracijaKeyPress(Sender: TObject; var Key: Char);
begin
  key :=#0;
end;

procedure TfrmKeygen.edtSerijskiKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key, ['0'..'9',#8,#13]) then key :=#0;
end;

procedure TfrmKeygen.FormShow(Sender: TObject);
begin
  edtSerijski.Text := GetVolumeID();
  edtSerijski.SetFocus;
end;

function GetVolumeID(): String;
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

end.
