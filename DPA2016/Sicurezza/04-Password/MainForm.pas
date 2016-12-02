unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.RegularExpressions,
  System.Hash, IdHashMessageDigest;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edtUserName: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    FDQuery1: TFDQuery;
    ButtonLoginWithParams: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonLoginWithParamsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function EncUser(const UserName: string): string;
begin
  Result := UpperCase(UserName);
end;

(*
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
*)

function EncPassword(const UserName, Password: string): string;
const
  PasswordSalt = 'df\gjjh45è89p6b&%/%6dfklgjdbèòò34@@523rsdef';
begin
  Result := UpperCase(THashMD5.GetHashString(PasswordSalt + ':' + UpperCase(UserName) + ':' + Password));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if edtPassword.PasswordChar = #0 then
    edtPassword.PasswordChar := '*'
  else
    edtPassword.PasswordChar := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  FDConnection1.Connected := True;
end;

procedure TForm1.ButtonLoginWithParamsClick(Sender: TObject);
begin
  // LUCA/password1
  FDQuery1.ParamByName('USER_NAME').AsString := EncUser(edtUserName.Text);
  FDQuery1.ParamByName('PASSWORD').AsString := EncPassword(edtUserName.Text, edtPassword.Text);
  FDQuery1.Open;
  if not FDQuery1.IsEmpty then
    Memo1.Text := FDQuery1.FieldByName('FULL_NAME').AsString
  else
    Memo1.Text := '';
  FDQuery1.Close;
end;

end.
