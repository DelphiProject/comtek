unit DataModule;

interface

uses
  Winapi.Windows, Vcl.Forms, System.SysUtils, System.Classes,
  ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  System.ImageList, Vcl.ImgList, Vcl.Controls, Vcl.Dialogs, System.IniFiles,
  Vcl.StdActns, System.Actions, Vcl.ActnList, ZSqlUpdate;

type
  TDataModuleForm = class(TDataModule)
    Database_Connection: TZConnection;
    IconsImageList: TImageList;
    ActionList: TActionList;
    WindowsCascadeAction: TWindowCascade;
    WindowsTileHorizontalAction: TWindowTileHorizontal;
    WindowsTileVerticalAction: TWindowTileVertical;
    WindowsMinimizeAction: TWindowMinimizeAll;
    ChildOperatorAction: TAction;
    ChildStatistAction: TAction;
    DBConnectionPropertiesAction: TAction;
    procedure DataModuleCreate(Sender: TObject);
    procedure ChildOperatorActionExecute(Sender: TObject);
    procedure ChildStatistActionExecute(Sender: TObject);
    procedure DBConnectionPropertiesActionExecute(Sender: TObject);
  private
    { Private declarations }
  var
    Guid: TGUID;
  public
    { Public declarations }
    procedure CreateOperatorMDIChild(const Cap: string);
    procedure CreateStatistMDIChild(const Name: string);
  end;

var
  DataModuleForm: TDataModuleForm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  main, ?hoiceAWP, DBConnect, ChildOperator, ChildStatist;

{ ???????? ???????? ????? MDI?hild ?????????, ??????? ???????????? ? ???? ????????? }
procedure TDataModuleForm.ChildOperatorActionExecute(Sender: TObject);
begin
  CreateOperatorMDIChild('??? ?????????(???? ?' +
    IntToStr(MainForm.MDIChildCount + 1) + ')');
end;

{ ???????? ???????? ????? MDI?hild ????????, ??????? ???????????? ? ???? ????????? }
procedure TDataModuleForm.ChildStatistActionExecute(Sender: TObject);
begin
  CreateStatistMDIChild('??? ????????(???? ?' + IntToStr(MainForm.MDIChildCount
    + 1) + ')');
end;

{ ???????? ?????? MDI?hild ???? ????????? }
procedure TDataModuleForm.CreateOperatorMDIChild(const Cap: string);
var
  Child: TFrmOperator;
  s: string;
begin
  Child := TFrmOperator.Create(Application);
  Child.Caption := Cap;
  CreateGUID(Guid);
  s := GUIDToString(Guid);
  s := Copy(s, 2, Length(s) - 2);
  s := StringReplace(s, '-', '', [rfReplaceAll, rfIgnoreCase]);
  Child.Name := 'OP_' + s;
end;

{ ???????? ?????? MDI?hild ???? ???????? }
procedure TDataModuleForm.CreateStatistMDIChild(const Name: string);
var
  Child: TFrmStatist;
  Guid: TGUID;
  s: string;
begin
  Child := TFrmStatist.Create(Application);
  Child.Caption := Name;
  CreateGUID(Guid);
  s := GUIDToString(Guid);
  s := Copy(s, 2, Length(s) - 2);
  s := 'S_' + s;
  Child.Name := StringReplace(s, '-', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TDataModuleForm.DataModuleCreate(Sender: TObject);
var
  Ini: Tinifile;
  i: integer;
begin
  { ????????? ??????? ? ?? ??? ?????? ?? }
  with Database_Connection do
  begin
    Connected := False;
    Ini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'settings.ini');
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
          begin
            (Components[i] as TZQuery).Close;
            (Components[i] as TZQuery).Open;
          end;
        end;
      if (not Assigned(?hoiceAWPForm)) then
        ?hoiceAWPForm := T?hoiceAWPForm.Create(Self);
      ?hoiceAWPForm.ShowModal;
    except
      if Application.MessageBox
        (PChar('??????????? ? ?? ??????????? ????????. ??????? ?? ????? ?????????????? ?????????? ????????????'),
        PChar('???????????'), MB_OKCANCEL + MB_ICONINFORMATION) = mrOk then
      begin
        if (not Assigned(DBConnectForm)) then
          DBConnectForm := TDBConnectForm.Create(Self);
        DBConnectForm.ShowModal;
      end;
    end;
  end;
end;

{ ???????? ???????? ????? ??????????? ? ??, ??????? ???????????? ? ???? ????????? }
procedure TDataModuleForm.DBConnectionPropertiesActionExecute(Sender: TObject);
begin
  if (not Assigned(DBConnectForm)) then
    DBConnectForm := TDBConnectForm.Create(Self);
  DBConnectForm.ShowModal;
end;

end.
