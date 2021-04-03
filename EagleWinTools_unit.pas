unit EagleWinTools_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Registry, ShellAPI;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    PageControl: TPageControl;
    Windows: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel6: TPanel;
    Panel9: TPanel;
    Label3: TLabel;
    spInternetExplorer: TSpeedButton;
    Label1: TLabel;
    CheckBox17: TCheckBox;
    Panel7: TPanel;
    Label2: TLabel;
    spMicrosoftEdge: TSpeedButton;
    Label6: TLabel;
    Edge_TempFile_CheckBox: TCheckBox;
    Panel8: TPanel;
    Label4: TLabel;
    spNavegadorVivaldi: TSpeedButton;
    Label8: TLabel;
    CheckBox25: TCheckBox;
    Panel10: TPanel;
    Label5: TLabel;
    spMozillaFirefox: TSpeedButton;
    Label7: TLabel;
    CheckBox33: TCheckBox;
    Aplicativos: TTabSheet;
    ScrollBox2: TScrollBox;
    Panel5: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    SpeedButton4: TSpeedButton;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    Panel14: TPanel;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    Label14: TLabel;
    CheckBox2: TCheckBox;
    TabSheet1: TTabSheet;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    MemoLogs: TMemo;
    Label15: TLabel;
    Timer1: TTimer;
    Label16: TLabel;
    procedure spMicrosoftEdgeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spMozillaFirefoxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure spNavegadorVivaldiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    R: TSearchRec;
    Pasta: TSHFileOpStruct;

    // Strings
    UserName, WinDir, WinVer, Path, caminho, relacionado, app, cmd0, cmd1, cmd2,
      cmd3, cmd4, cmd5, cmd6, cmd7, cmd8, cmd9, cmd10, cmdResult, cmd: string;

    sl: TStringList;
    i, sli: integer;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure GetSubDirectories(const directory: string; list: TStrings);
var
  sr: TSearchRec;
begin
  try
    if FindFirst(IncludeTrailingPathDelimiter(directory) + '*.*', faDirectory,
      sr) < 0 then
      Exit
    else
      repeat
        if ((sr.Attr and faDirectory <> 0) AND (sr.Name <> '.') AND
          (sr.Name <> '..')) then
          list.Add(IncludeTrailingPathDelimiter(directory) + sr.Name);
      until FindNext(sr) <> 0;
  finally
    System.SysUtils.FindClose(sr);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  vNome, vVersao, vDisplay, vProcess, vCurrentBuild, vFabMainboard,
    vMainboardModel, vBiosDate, vBiosVendor, vBiosVersion: String;
  Reg: TRegistry;

begin
  try
    UserName := GetEnvironmentVariable('USERNAME');
    WinDir := GetEnvironmentVariable('WinDir');

    Reg := TRegistry.Create;
    Reg.Access := KEY_QUERY_VALUE;
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    // Placa mãe
    if Reg.OpenKeyReadOnly('\HARDWARE\DESCRIPTION\System\BIOS') then
    begin
      // Obtendo os Parâmetros desejados
      vFabMainboard := Reg.ReadString('BaseBoardManufacturer');
      vMainboardModel := Reg.ReadString('BaseBoardProduct');
      vBiosDate := Reg.ReadString('BIOSReleaseDate');
      vBiosVendor := Reg.ReadString('BIOSVendor');
      vBiosVersion := Reg.ReadString('BIOSVersion');
    end;

    Label15.Caption := vFabMainboard + ' | ' + vMainboardModel + ' | ' +
      vBiosDate + ' | ' + vBiosVendor + ' | ' + vBiosVersion;
    // Abrindo a chave desejada
    if Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\')
    then
    begin
      // Obtendo os Parâmetros desejados
      vNome := Reg.ReadString('ProductName');
      vVersao := Reg.ReadString('CurrentVersion');
      vCurrentBuild := Reg.ReadString('CurrentBuild');
      vDisplay := Reg.ReadString('DisplayVersion');
    end;

    if Reg.OpenKeyReadOnly('\HARDWARE\DESCRIPTION\System\CentralProcessor\0')
    then
    begin
      vProcess := Reg.ReadString('ProcessorNameString');
    end;

    // Montando uma String com a versão e detalhes
    WinVer := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild + '(' +
      vDisplay + ')';
    Label9.Caption := 'Microsoft' + WinVer;
    Label10.Caption := vProcess;

  finally

  end;

end;

procedure TForm1.spMozillaFirefoxClick(Sender: TObject);
var
  ProgramHandle: THandle;

begin

  Timer1.Enabled := True;

  i := 0;
  caminho := PChar('C:\Users\' + UserName +
    '\AppData\local\Mozilla\Firefox\Profiles\');

  sl := TStringList.Create;

  try
    MemoLogs.Lines.Clear;
    GetSubDirectories(caminho, sl);

    app := PChar('C:\Windows\System32\cmd.exe');

    sli := sl.Count;

    MemoLogs.Lines.Add('Apagando informações do Mozilla Firefox: aguarde...');

    while i < sli do

    begin

      cmdResult := PChar('cmd' + IntToStr(i));

      cmd0 := PChar('del ' + sl[i] + '\cache2\entries\*.');
      cmd1 := PChar('del ' + sl[i] + '\startupCache\*.bin');
      cmd2 := PChar('del ' + sl[i] + '\startupCache\*.lz*');
      cmd3 := PChar('del ' + sl[i] + '\cache2\index*.*');
      cmd4 := PChar('del ' + sl[i] + '\startupCache\*.little');
      cmd5 := PChar('del ' + sl[i] + '\cache2\*.log /s /q');

      ProgramHandle := ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd0),
        nil, SW_HIDE);
      if ProgramHandle < 32 then
      begin
        MessageDlg('Error starting ' + app, mtInformation, [mbOK], 0);
        Exit;
      end;
      {

        ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd1), nil, SW_HIDE);
        ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd2), nil, SW_HIDE);
        ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd3), nil, SW_HIDE);
        ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd4), nil, SW_HIDE);
        ShellExecute(handle, nil, PChar(app), PChar('/c' + cmd5), nil, SW_HIDE);

      }

      Inc(i);
    end;

  finally
    FreeAndNil(sl);
    // Sleep(5000);
    MemoLogs.Lines.Add('Apagando informações do Mozilla Firefox: Finalizado!');

    Timer1.Enabled := False;
    if Label16.Visible = True then
    begin
      Label16.Visible := False;
    end;

  end;
end;

procedure TForm1.spNavegadorVivaldiClick(Sender: TObject);
begin
    ShowMessage('teste');
end;

procedure TForm1.spMicrosoftEdgeClick(Sender: TObject);
begin
  try

    // PERFIL DEFAULT
    MemoLogs.Clear;
    MemoLogs.Lines.Add(':: LIMPANDO INFORMAÇÕES DO MICROSOFT EDGE ::');
    MemoLogs.Lines.Add('');
    MemoLogs.Lines.Add('DEFAULT');
    MemoLogs.Lines.Add('');

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Default\Cache\';
    if FindFirst(Path + '*data*', faAnyFile, R) = 0 then

      try
        MemoLogs.Lines.Add('Apagando arquivos temporários: aguarde...');

        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos temporários: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Default\Cache\';
    if FindFirst(Path + 'f_*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('Apagando arquivos de dados: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos de dados: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Default\Cache\';
    if FindFirst(Path + 'index*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('Apagando arquivo index.dat: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivo index.dat: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Default\Service Worker\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Default: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Default: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\GrShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\ShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Storage: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Default\Storage\ext\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Storage: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\Cache\';
    if FindFirst(Path + '*data*', faAnyFile, R) = 0 then

      try
        MemoLogs.Lines.Add('Profile 1');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos temporários: aguarde...');

        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos temporários: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    // PERFIL 01
    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\Cache\';
    if FindFirst(Path + 'f_*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('PERFIL 1');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos de dados: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos de dados: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\Cache\';
    if FindFirst(Path + 'index*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('Apagando arquivo index.dat: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivo index.dat: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\Service Worker\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Default: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Default: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 1\GrShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 1\ShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Storage: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 1\Default\Storage\ext\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Storage: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    // PERFIL 02
    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Profile 2\Default\Cache\';
    if FindFirst(Path + 'f_*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('PERFIL 2');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos de dados: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivos de dados: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    Path := 'C:\Users\' + UserName +
      '\AppData\Local\Microsoft\Edge\User Data\Profile 2\Default\Cache\';
    if FindFirst(Path + 'index*', faAnyFile, R) = 0 then
      try
        MemoLogs.Lines.Add('Apagando arquivo index.dat: aguarde...');
        repeat
          if R.Attr and faDirectory = 0 then

            DeleteFile(Path + R.Name);
        until FindNext(R) <> 0;
      finally
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add('Apagando arquivo index.dat: pronto!');
        MemoLogs.Lines.Add('');
        MemoLogs.Lines.Add
          ('------------------------------------------------------------');
        MemoLogs.Lines.Add('');
        FindClose(R);
      end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 2\Default\Service Worker\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Service Worker: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Default: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 2\Default\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Default: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 2\GrShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos GrShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 2\ShaderCache\GPUCache\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos ShaderCache: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    begin
      MemoLogs.Lines.Add('Apagando arquivos Storage: aguarde!');
      Pasta.Wnd := Self.handle;
      Pasta.wFunc := FO_DELETE;
      Pasta.pFrom := PChar('C:\Users\' + UserName +
        '\AppData\Local\Microsoft\Edge\User Data\Profile 2\Default\Storage\ext\'#0);
      Pasta.pTo := nil;
      Pasta.fFlags := FOF_NOCONFIRMATION;
      SHFileOperation(Pasta);

      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Apagando arquivos Storage: pronto!');
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add
        ('------------------------------------------------------------');
      MemoLogs.Lines.Add('');
    end;

    // no Memo
    if MemoLogs.Text <> '' then
    begin
      MemoLogs.Lines.Add('');
      MemoLogs.Lines.Add('Finalizado com sucesso!');
    end
    else
    begin
      MemoLogs.Lines.Add('Tudo certo!');
    end;

  finally
    Timer1.Enabled := False;
    if Label16.Visible = True then
    begin
      Label16.Visible := False;
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Label16.Visible = False then
  begin
    Label16.Visible := True;
  end
  else
    Label16.Visible := False;
end;

END.
