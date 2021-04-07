unit DBConnect;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  ZDataset, System.IniFiles, System.SysUtils;

type
  TDBConnectForm = class(TForm)
    DBNameLabeledEdit: TLabeledEdit;
    LoginLabeledEdit: TLabeledEdit;
    PasswordLabeledEdit: TLabeledEdit;
    PortLabeledEdit: TLabeledEdit;
    ClientLibraryLabeledEdit: TLabeledEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBConnectForm: TDBConnectForm;

implementation

{$R *.dfm}

uses
  main, DataModule;

procedure TDBConnectForm.FormCreate(Sender: TObject);
var
  Ini: Tinifile;
  i: integer;
begin
  DBNameLabeledEdit.Hint := '������� ��� ������������ �� Oracle Database.' +
    #13#10 + '�������� - "192.168.1.2:1521/XEPDB1" (������� �� �����),' + #13#10
    + '��� "192.168.1.2" - IP ������� ��, "1521" - ���� ����������� � �������,'
    + #13#10 + '"XEPDB1" - ��� ������������ ��.';
  ClientLibraryLabeledEdit.Hint :=
    '�������� ����� ������������ ���������� ���������� Oracle Database:' +
    #13#10 + '1) ��� ����������� ���������� ������������������ � ���������� PATH'
    + #13#10 +
    '��� ����������� � �������� ���������� ������������ ����� ���������' +
    #13#10 + '������� �� ������������, �������� - "oci.dll" (������� �� �����);'
    + #13#10 +
    '2) � ������� ���� ���������� �� ������������� �������� �� 1) ������� ������'
    + #13#10 +
    '���� �� ���������� ����������, �������� - "C:\oci.dll" (������� �� �����).';

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TToolBar then
      (Components[i] as TToolBar).Images := DataModuleForm.IconsImageList;
  end;
  {�������� ���������� ����������� � �� �� INI-����� �� ����� � ������ �� ���������}
  PortLabeledEdit.NumbersOnly := True;
  Ini := Tinifile.Create(extractfilepath(ParamStr(0)) + 'settings.ini');
  DBNameLabeledEdit.Text := Ini.ReadString('DB', 'DatabaseName', '');
  LoginLabeledEdit.Text := Ini.ReadString('DB', 'User', '');
  PasswordLabeledEdit.Text := Ini.ReadString('DB', 'Password', '');
  PortLabeledEdit.Text := Ini.ReadString('DB', 'Port', '');
  ClientLibraryLabeledEdit.Text := Ini.ReadString('DB', 'Library', '');
  Ini.Free;
end;

{���������� ���������� ����������� � �� � INI-�����}
procedure TDBConnectForm.ToolButton1Click(Sender: TObject);
var
  Ini: Tinifile;
begin
  Ini := Tinifile.Create(extractfilepath(ParamStr(0)) + 'settings.ini');
  Ini.WriteString('DB', 'DatabaseName', DBNameLabeledEdit.Text);
  Ini.WriteString('DB', 'User', LoginLabeledEdit.Text);
  Ini.WriteString('DB', 'Password', PasswordLabeledEdit.Text);
  Ini.WriteString('DB', 'Port', PortLabeledEdit.Text);
  Ini.WriteString('DB', 'Library', ClientLibraryLabeledEdit.Text);
  Ini.Free;
end;
{������� ���������� ����������� � �� � INI-�����}
procedure TDBConnectForm.ToolButton3Click(Sender: TObject);
var
  Ini: Tinifile;
  i: integer;
begin
  Ini := Tinifile.Create(extractfilepath(ParamStr(0)) + 'settings.ini');
  Ini.WriteString('DB', 'HostName', '');
  Ini.WriteString('DB', 'DatabaseName', '');
  Ini.WriteString('DB', 'User', '');
  Ini.WriteString('DB', 'Password', '');
  Ini.WriteString('DB', 'Port', '');
  Ini.WriteString('DB', 'Library', '');
  Ini.Free;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TLabeledEdit then
      (Components[i] as TLabeledEdit).Text := '';
end;
{��������������� � ��}
procedure TDBConnectForm.ToolButton5Click(Sender: TObject);
var
  Ini: Tinifile;
  i: integer;
  P: Pointer;
begin
  with DataModuleForm.Database_Connection do
  begin
    Connected := False;
    Ini := Tinifile.Create(extractfilepath(ParamStr(0)) + 'settings.ini');
    Database := Ini.ReadString('DB', 'DatabaseName', '');
    try
      Port := StrToInt(Ini.ReadString('DB', 'Port', ''));
    except
    end;
    User := Ini.ReadString('DB', 'User', '');
    Password := Ini.ReadString('DB', 'Password', '');
    LibraryLocation := Ini.ReadString('DB', 'Library', '');
    Ini.Free;
    try
      Connected := True;
      with DataModuleForm do
        for i := 0 to ComponentCount - 1 do
        begin
          if Components[i] is TZTable then
            (Components[i] as TZTable).Active := True;
          if Components[i] is TZQuery then
            (Components[i] as TZQuery).Open;
        end;
      if MessageBox(handle, PChar('����������� � �� ����������� ������.'),
        PChar('�����������'), MB_OK + MB_ICONINFORMATION) = mrOk then
        DBConnectForm.Close;
      if (not Assigned(Mainform)) then
      begin
        P := @Application.Mainform;
        Mainform := TMainForm.Create(Self);
        Pointer(P^) := Mainform;
        Mainform.Show;
      end;
    except
      MessageBox(handle,
        PChar('����������� � �� ����������� ��������. ���������� �������� ��������������� ��������� �����������.'),
        PChar('�����������'), MB_OK + MB_ICONSTOP);
    end;
  end;
end;

end.