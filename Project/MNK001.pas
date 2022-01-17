unit MNK001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMNK001Frm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  MNK001Frm: TMNK001Frm;

implementation

{$R *.dfm}

uses F0001;

procedure TMNK001Frm.Button1Click(Sender: TObject);
var
  frm:TForm;
begin
    //’S“–ÒÆ‰ï‰æ–Ê‚ğ‘ã“ü
    frm := TF0001Frm.Create(Application);
    //‰æ–Ê“WŠJ
    frm.ShowModal;
end;

end.
