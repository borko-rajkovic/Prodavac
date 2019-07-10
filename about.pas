unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, AdvPicture, dxGDIPlusClasses, AdvGlowButton,
  Vcl.StdCtrls, ShellApi, AdvSmoothLabel;

type
  TfrmAbout = class(TForm)
    imgAbout: TImage;
    btnPotvrdi: TAdvGlowButton;
    lblAutor: TAdvSmoothLabel;
    lblTelefon: TAdvSmoothLabel;
    lblEmail: TAdvSmoothLabel;
    btnEmail: TAdvSmoothLabel;
    imgProdavac: TImage;
    procedure btnPotvrdiClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.btnEmailClick(Sender: TObject);
begin
   ShellAPI.ShellExecute(0, 'Open', PChar('mailto:rajkovicborko@gmail.com'), PChar(''), nil, SW_SHOWNORMAL);
end;

procedure TfrmAbout.btnPotvrdiClick(Sender: TObject);
begin
  Close;
end;

end.
