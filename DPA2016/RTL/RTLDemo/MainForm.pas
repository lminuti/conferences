unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.SyncObjs,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Character,
  Vcl.ComCtrls, System.RegularExpressions, System.IOUtils, System.Types,
  System.NetEncoding, System.Hash, System.Net.Mime, System.DateUtils,
  System.TimeSpan, System.Diagnostics, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Xml.xmldom,
  Xml.XMLIntf, Xml.omnixmldom, Xml.XMLDoc, System.JSON, System.JSON.BSON,
  System.JSON.Readers, System.JSON.Types, System.JSON.Writers, System.Zip,
  System.Messaging, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Edit4: TEdit;
    Button3: TButton;
    Edit5: TEdit;
    Button4: TButton;
    Memo2: TMemo;
    Button5: TButton;
    Memo3: TMemo;
    Edit6: TEdit;
    Edit7: TEdit;
    TabSheet3: TTabSheet;
    Button6: TButton;
    Memo4: TMemo;
    TabSheet4: TTabSheet;
    Memo5: TMemo;
    Memo7: TMemo;
    Button7: TButton;
    TabSheet5: TTabSheet;
    Button8: TButton;
    Button9: TButton;
    NetHTTPClientAsync: TNetHTTPClient;
    TabSheet6: TTabSheet;
    Button10: TButton;
    Memo6: TMemo;
    Edit8: TEdit;
    Button11: TButton;
    TabSheet7: TTabSheet;
    Memo8: TMemo;
    Button12: TButton;
    Edit9: TEdit;
    Button13: TButton;
    CheckBox1: TCheckBox;
    TabSheet8: TTabSheet;
    Button14: TButton;
    Thread: TTabSheet;
    Button15: TButton;
    Memo9: TMemo;
    Button16: TButton;
    Timer1: TTimer;
    TabSheet9: TTabSheet;
    Memo10: TMemo;
    Init: TButton;
    Add: TButton;
    Edit10: TEdit;
    Memo11: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure NetHTTPClientAsyncRequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
    procedure NetHTTPClientAsyncRequestError(const Sender: TObject;
      const AError: string);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure InitClick(Sender: TObject);
  private
    FLista: TStringList;
    FSubCount :Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TDateMessage = class(TMessage<TDateTime>)
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  FMessageManager: TMessageManager;

function MessageManager: TMessageManager;
begin
  if not Assigned(FMessageManager) then
    FMessageManager := TMessageManager.Create;
  Result := FMessageManager;

end;

procedure TForm1.AddClick(Sender: TObject);
begin
  MessageManager.SendMessage(Self, TDateMessage.Create(Now));
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  Http: THTTPClient;
  Response: IHTTPResponse;
begin
  Http := THTTPClient.Create;
  try
    Response := Http.Get(Edit8.Text);
    Memo6.Text := Response.ContentAsString;
  finally
    Http.Free;
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  NetHTTPClientAsync.Get(Edit8.Text);
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  JSON: TJSONValue;
begin
  JSON := TJSONObject.ParseJSONValue(Memo8.Text);
  try
    Edit9.Text := JSON.GetValue<string>('nome');
  finally
    JSON.Free;
  end;
end;

{
function Bytes2String(const ABytes: TBytes): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(ABytes) to High(ABytes) do
  if I = 0 then
    Result := IntToHex(ABytes[I], 2)
  else
    Result := Result + '-' + IntToHex(ABytes[I], 2);
end;

function Json2Bson(const AJson: string; AOptions: TConverterOptions): TBytes;
var
  JsonReader: TJsonReader;
  BsonWriter: TBsonWriter;
  Stream: TBytesStream;
begin
  Stream := TBytesStream.Create;
  BsonWriter := TBsonWriter.Create(Stream);
//  JsonReader := TJsonReader.Create(AJson);
  try
    BsonWriter.WriteToken(JsonReader);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.Read(Result, Stream.Size);
  finally
    JsonReader.Free;
    BsonWriter.Free;
    Stream.Free;
  end;
end;

function Json2BsonString(const AJson: string; AOptions: TConverterOptions): string;
begin
  Result := Bytes2String(Json2Bson(AJson, AOptions));
end;
}

procedure TForm1.Button13Click(Sender: TObject);
var
  JSON: TJSONObject;
begin
  JSON := TJSONObject.Create;
  try
    JSON
      .AddPair('nome', 'paolo')
      .AddPair('cognome', 'Rossi');

    Memo8.Text := JSON.ToString;
  finally
    JSON.Free;
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  Zip: TZipFile;
  AFile: string;
begin
  Zip := TZipFile.Create;
  try
    Zip.Open(Edit10.Text, zmWrite);
    for AFile in Memo11.Lines do
      Zip.Add(AFile);
  finally
    Zip.Free;
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  MainThread, BackgroundThread :TThread;
begin
  MainThread := TThread.Current;

  Memo9.Lines.Add('Before');
  BackgroundThread := TThread.CreateAnonymousThread(procedure
  begin

    // Queue() se il thread corrente può continuare
    // Synchronize() se è necessario attendere
    TThread.Synchronize(MainThread, procedure
    begin
      Memo9.Lines.Add('Before thread');
    end);

    // Un po' di codice
    TThread.Sleep(1000);

    TThread.Synchronize(MainThread, procedure
    begin
      Memo9.Lines.Add('After thread');
    end);
  end);
  BackgroundThread.Start;
  Memo9.Lines.Add('After');
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  TThread.CreateAnonymousThread(procedure
  var
    Value :string;
  begin
    Value := StringOfChar('x', Random(40));
    Sleep(500);
    System.TMonitor.Enter(FLista);
    try
      FLista.Add(Value);
    finally
      System.TMonitor.Exit(FLista);
    end;
  end).Start;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  NameList: TArray<string>;
  Value, AName :string;
begin
  Value := Edit1.Text;
  NameList := Value.Split([',']);
  for AName in NameList do
    Memo1.Lines.Add(AName);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  C :Char;
begin
  Edit3.Text := '';
  for C in Edit2.Text do
    if C.IsLetter then
      Edit3.Text := Edit3.Text + C;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ByteCount: Integer;
  CharCount: Integer;
begin
  ByteCount := TEncoding.UTF8.GetByteCount(Edit4.Text);
  CharCount := Length(Edit4.Text);
  Edit5.Text := 'ByteCount: ' + ByteCount.ToString + ' - CharCount: ' + IntToStr(CharCount);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL
      .AddPair('Nome', 'Luca')
      .AddPair('Cognome', 'Minuti')
      .AddPair('E-Mail', 'luca.minuti@gmail.com')
      .SaveToFile('test.txt');
  finally
    SL.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo3.Text := TRegEx.Replace(Memo2.Text, Edit6.Text, Edit7.Text, [roMultiLine]);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Files: TStringDynArray;
  AFile: string;
begin
  Memo4.Text := '';
  Files := TDirectory.GetFiles(TDirectory.GetCurrentDirectory);
  for AFile in Files do
    Memo4.Lines.Add(AFile);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Mime: TMultipartFormData;
  MimeStream: TStringStream;
begin
  MimeStream := TStringStream.Create(Memo5.Text);
  Mime := TMultipartFormData.Create;
  try
    // Crea il file di test
    MimeStream.SaveToFile('test.txt');
    MimeStream.Clear;

    // Crea il file mime
    Mime.AddFile('afile', 'test.txt');
    Mime.AddField('nome', 'luca');
    Mime.Stream.Position := 0;
    MimeStream.CopyFrom(Mime.Stream, Mime.Stream.Size);
    Memo7.Text := MimeStream.DataString;
  finally
    Mime.Free;
    MimeStream.Free;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  TS :TTimeSpan;
  D1, D2 :TDateTime;
begin
  D1 := Now;
  Sleep(1234);
  D2 := Now;

  TS := TTimeSpan.Subtract(D2, D1);
  ShowMessage(FloatToStr(TS.TotalMilliseconds));
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  StopWatch :TStopwatch;
begin
  // TStopwatch is not a class but still requires explicit initialization
  StopWatch := TStopwatch.Create;
  StopWatch.Start;
  Sleep(1234);
  StopWatch.Stop;
  ShowMessage(FloatToStr(StopWatch.ElapsedMilliseconds));
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  FLista := TStringList.Create;
  FSubCount := 0;
end;

destructor TForm1.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TForm1.InitClick(Sender: TObject);
var
  ID: Integer;
begin
  Inc(FSubCount);
  ID := FSubCount;

  MessageManager.SubscribeToMessage(TDateMessage, procedure(const Sender: TObject; const AMessage: TMessage)
  begin
    Memo10.Lines.Add(IntToStr(ID) + ' - ' + DateTimeToStr(TDateMessage(AMessage).Value));
  end);
end;

procedure TForm1.NetHTTPClientAsyncRequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  Memo6.Text := AResponse.ContentAsString;
end;

procedure TForm1.NetHTTPClientAsyncRequestError(const Sender: TObject;
  const AError: string);
begin
  ShowMessage('*Errore*: ' + AError);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Value: string;
begin
  System.TMonitor.Enter(FLista);
  try
    Value := FLista.Text;
  finally
    System.TMonitor.Exit(FLista);
  end;
  if Value <> Memo9.Text then
    Memo9.Text := Value;
end;

initialization

finalization
  FMessageManager.Free;

end.
