unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.RegularExpressions;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edtUserName: TEdit;
    edtPassword: TEdit;
    LoginButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    ButtonLoginWithStrings: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    SpeedButton1: TSpeedButton;
    Memo6: TMemo;
    ButtonLoginQuoted: TButton;
    FDQuery1: TFDQuery;
    ButtonLoginWithParams: TButton;
    ButtonLoginRegExp: TButton;
    Memo7: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
    procedure ButtonLoginWithStringsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ButtonLoginQuotedClick(Sender: TObject);
    procedure ButtonLoginWithParamsClick(Sender: TObject);
    procedure ButtonLoginRegExpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonLoginWithStringsClick(Sender: TObject);
var
  Query :string;
begin
  Query := 'SELECT FULL_NAME FROM USERS WHERE USER_NAME = ''' + edtUserName.Text + ''' AND PASSWORD = ''' + edtPassword.Text + ''' ';
  Memo1.Text := VarToStr(FDConnection1.ExecSQLScalar(Query));
end;

procedure TForm1.LoginButtonClick(Sender: TObject);
const
  QueryTpl = 'SELECT FULL_NAME FROM USERS WHERE USER_NAME = ''%s'' AND PASSWORD = ''%s'' ';
begin
  Memo1.Text := VarToStr(FDConnection1.ExecSQLScalar(Format(QueryTpl, [edtUserName.Text, edtPassword.Text])));
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if ActiveControl is TMemo then
    edtPassword.Text := StringReplace(StringReplace(TMemo(ActiveControl).Text, #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll]);
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

////////////////////////////









////////////////////////////

procedure TForm1.ButtonLoginQuotedClick(Sender: TObject);
const
  QueryTpl = 'SELECT FULL_NAME FROM USERS WHERE USER_NAME = %s AND PASSWORD = %s ';
begin
  Memo1.Text := VarToStr(FDConnection1.ExecSQLScalar(Format(QueryTpl, [QuotedStr(edtUserName.Text), QuotedStr(edtPassword.Text)])));
end;


procedure TForm1.ButtonLoginWithParamsClick(Sender: TObject);
begin
  FDQuery1.ParamByName('USER_NAME').AsString := edtUserName.Text;
  FDQuery1.ParamByName('PASSWORD').AsString := edtPassword.Text;
  FDQuery1.Open;
  if not FDQuery1.IsEmpty then
    Memo1.Text := FDQuery1.FieldByName('FULL_NAME').AsString
  else
    Memo1.Text := '';
  FDQuery1.Close;
end;

procedure TForm1.ButtonLoginRegExpClick(Sender: TObject);
const
  QueryTpl = 'SELECT FULL_NAME FROM USERS WHERE USER_NAME = %s AND PASSWORD = %s ';
var
  UserPattern :TRegEx;
begin
  UserPattern := TRegEx.Create('^[0-9A-Z_-]+$');

  if not UserPattern.Match(edtUserName.Text).Success then
    raise Exception.Create('Invalid user name');

  if not UserPattern.Match(edtPassword.Text).Success then
    raise Exception.Create('Invalid password');

  Memo1.Text := VarToStr(FDConnection1.ExecSQLScalar(Format(QueryTpl, [QuotedStr(edtUserName.Text), QuotedStr(edtPassword.Text)])));
end;

end.
