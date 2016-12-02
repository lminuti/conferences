unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Hash, IdHashMessageDigest;

type
  TForm1 = class(TForm)
    btnIndyMD5: TButton;
    memInput: TMemo;
    memOutput: TMemo;
    btnDM5: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure btnIndyMD5Click(Sender: TObject);
    procedure btnDM5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function IndyMD5Str(const Value: string): string;
var
  MD5 : TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStringAsHex(Value);
  finally
    MD5.Free;
  end;
end;

procedure TForm1.btnDM5Click(Sender: TObject);
begin
  memOutput.Text := THashMD5.GetHashString(memInput.Text);
end;

procedure TForm1.btnIndyMD5Click(Sender: TObject);
begin
  memOutput.Text := IndyMD5Str(memInput.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memOutput.Text := THashSHA1.GetHashString(memInput.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memOutput.Text := THashSHA2.GetHashString(memInput.Text);
end;

end.
