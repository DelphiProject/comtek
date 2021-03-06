unit ChildStatist;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, FrmFind, Vcl.Buttons, Data.DB, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, System.Sysutils, Jpeg,
  StrUtils, ZDataset, ZSqlUpdate, Vcl.Dialogs, System.IniFiles;

type
  TFrmStatist = class(TForm)
    GroupBox1: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    HumansGrid: TDBGrid;
    GroupBox2: TGroupBox;
    Splitter2: TSplitter;
    Panel1: TPanel;
    CertificatesGrid: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    Panel2: TPanel;
    PhotoDBImage: TDBImage;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    GroupBox3: TGroupBox;
    EndDateTimePicker: TDateTimePicker;
    StartDateTimePicker: TDateTimePicker;
    FrameFind1: TFrameFind;
    RecordingSpeedButton: TSpeedButton;
    BirthdaySpeedButton: TSpeedButton;
    Splitter1: TSplitter;
    OpenDialog: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FrameFind1FilterSpeedButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure RecordingSpeedButtonClick(Sender: TObject);
    procedure BirthdaySpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataChange(Sender: TObject; Field: TField);

  var
    Guid: TGUID;
    H_T: TZTable;
    H_T_DS: TDataSource;
    C_Q: TZQuery;
    C_Q_DS: TDataSource;
    s: string;
  end;

implementation

{$R *.dfm}

uses DataModule, AdjustGrid;

procedure TFrmStatist.DataChange(Sender: TObject; Field: TField);
begin
  { ??????????? ??????????? ???????? ????????? HID ??????? ??
    ?????????? ??????? ??? ???????? ?? ?????? ???????? }
  if Assigned(C_Q) and Assigned(H_T) then
  begin
    C_Q.Close;
    C_Q.ParamByName('HID').AsInteger := H_T.FieldByName('humans_id').AsInteger;
    C_Q.Open;
  end;
end;

procedure TFrmStatist.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  { ???????? ??????????? ????????? ????????? ?? GUID ? ????? }
  with DataModuleForm do
    for i := 0 downto ComponentCount - 1 do
    begin
      if ContainsText(Components[i].Name, s) then
        Components[i].Free;
    end;
  { ? MDIChild-???? ??? ??????? ?? ?????? ???????? ????? ??
    ????????? ????? caMinimize }
  Action := caFree;
end;

procedure TFrmStatist.FormCreate(Sender: TObject);
var
  i: Integer;
  ini: tinifile;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TToolBar then
      (Components[i] as TToolBar).Images := DataModuleForm.IconsImageList;
  end;
  CreateGUID(Guid);
  s := GUIDToString(Guid);
  s := Copy(s, 2, Length(s) - 2);
  s := StringReplace(s, '-', '', [rfReplaceAll, rfIgnoreCase]);
  { ???????????? ???????? ??????? ? ?????? }
  H_T := TZTable.Create(DataModuleForm);
  H_T.Name := 'HT_' + s;
  Ini := Tinifile.Create(extractfilepath(ParamStr(0)) + 'settings.ini');
  H_T.TableName := Ini.ReadString('DB', 'User', '')+'.HUMANS';
  Ini.Free;
  H_T.Connection := DataModuleForm.Database_Connection;
  H_T.AutoCalcFields := true;
  if DataModuleForm.Database_Connection.Connected then
    H_T.Active := true;
  { ???????? ?????????????? ??????? ? ????????? }
  C_Q := TZQuery.Create(DataModuleForm);
  C_Q.ParamCheck := true;
  C_Q.Name := 'CQ_' + s;
  C_Q.SQL.Text := 'SELECT * FROM certificates WHERE humans_id=:HID';
  C_Q.Connection := DataModuleForm.Database_Connection;
  { ???????? DataSource ??? ????? ????????? ???????? }
  H_T_DS := TDataSource.Create(DataModuleForm);
  C_Q.MasterSource := H_T_DS;
  C_Q.MasterFields := 'HUMANS_ID';
  C_Q.LinkedFields := 'HUMANS_ID';
  H_T_DS.Name := 'HTDS_' + s;
  H_T_DS.DataSet := H_T;
  H_T_DS.OnDataChange := DataChange;
  C_Q_DS := TDataSource.Create(DataModuleForm);
  C_Q_DS.Name := 'CQDS_' + s;
  C_Q_DS.DataSet := C_Q;
  { ??????????? DataSource ? DBGrid ?  ?????????????? ?????????? ????? Grid
    ?? ??????????? }
  HumansGrid.DataSource := H_T_DS;
  CertificatesGrid.DataSource := C_Q_DS;
  PhotoDBImage.DataSource := C_Q_DS;
  PhotoDBImage.DataField := 'CERTIFICATES_SCAN';
  AutoSizeColDBGrid(HumansGrid);
  AutoSizeColDBGrid(CertificatesGrid);
  StartDateTimePicker.Date := Date - 10;
  EndDateTimePicker.Date := Date;
end;

{ ?????? ?? ??????? }
procedure TFrmStatist.FrameFind1FilterSpeedButtonClick(Sender: TObject);
begin
  with FrameFind1 do
    if FilterSpeedButton.Down = true then
      with H_T do
      begin
        if FilterEdit.Text <> '' then
        begin
          Filter := 'FULLNAME LIKE ' + #39 + '*' + FilterEdit.Text + '*' + #39;
          BirthdaySpeedButton.Down := False;
          RecordingSpeedButton.Down := False;
          Filtered := true;
        end
        else if FilterEdit.Text = '' then
        begin
          MessageBox(handle, PChar('???? ?????????? ?? ?????? ???? ??????'),
            PChar('???????????'), MB_OK + MB_ICONSTOP);
          FilterSpeedButton.Down := False;
        end;
      end
    else
    begin
      H_T.Filtered := False;
      FilterEdit.Text := '';
    end;
end;

{ ?????? ?? ???? ???????? }
procedure TFrmStatist.BirthdaySpeedButtonClick(Sender: TObject);
begin
  with FrameFind1 do
    if BirthdaySpeedButton.Down = true then
      with H_T do
      begin
        if StartDateTimePicker.Date <= EndDateTimePicker.Date then
        begin
          Filter := 'BORN_DATE >=' +
            QuotedStr(DateToStr(StartDateTimePicker.Date) + ' 00:00:00') +
            'and BORN_DATE <=' + QuotedStr(DateToStr(EndDateTimePicker.Date) +
            ' 23:59:59');
          FilterSpeedButton.Down := False;
          RecordingSpeedButton.Down := False;
          Filtered := true;
        end
        else
        begin
          MessageBox(handle,
            PChar('???? ?????? ??????? ?? ?????? ???? ?????? ???? ?????'),
            PChar('???????????'), MB_OK + MB_ICONSTOP);
          BirthdaySpeedButton.Down := False;
        end;
      end
    else
    begin
      H_T.Filtered := False;
      FilterEdit.Text := '';
    end;
end;

{ ?????? ?? ???? ?????????? ? ?? }
procedure TFrmStatist.RecordingSpeedButtonClick(Sender: TObject);
begin
  with FrameFind1 do
    if RecordingSpeedButton.Down = true then
      with H_T do
      begin
        if StartDateTimePicker.Date <= EndDateTimePicker.Date then
        begin
          Filter := 'RECORDING_DATE >=' +
            QuotedStr(DateToStr(StartDateTimePicker.Date) + ' 00:00:00') +
            'and RECORDING_DATE <=' +
            QuotedStr(DateToStr(EndDateTimePicker.Date) + ' 23:59:59');
          FilterSpeedButton.Down := False;
          BirthdaySpeedButton.Down := False;
          Filtered := true;
        end
        else
        begin
          MessageBox(handle,
            PChar('???? ?????? ??????? ?? ?????? ???? ?????? ???? ?????'),
            PChar('???????????'), MB_OK + MB_ICONSTOP);
          RecordingSpeedButton.Down := False;
        end;
      end
    else
    begin
      H_T.Filtered := False;
      FilterEdit.Text := '';
    end;
end;

procedure TFrmStatist.ToolButton11Click(Sender: TObject);
begin
  H_T.Refresh;
  AutoSizeColDBGrid(HumansGrid);
end;

procedure TFrmStatist.ToolButton14Click(Sender: TObject);
begin
  C_Q.Edit;
end;

procedure TFrmStatist.ToolButton16Click(Sender: TObject);
begin
  with C_Q do
    if (State in [dsEdit, dsInsert]) then
    begin
      Post;
      Refresh;
      AutoSizeColDBGrid(CertificatesGrid);
    end
    else
      Refresh;
end;

procedure TFrmStatist.ToolButton18Click(Sender: TObject);
begin
  C_Q.Delete;
  AutoSizeColDBGrid(CertificatesGrid);
end;

procedure TFrmStatist.ToolButton1Click(Sender: TObject);
begin
  H_T.Insert;
end;

procedure TFrmStatist.ToolButton20Click(Sender: TObject);
begin
  C_Q.Refresh;
  AutoSizeColDBGrid(CertificatesGrid);
end;

procedure TFrmStatist.ToolButton23Click(Sender: TObject);
begin
  with C_Q do
  begin
    Edit;
    FieldByName('CERTIFICATES_SCAN').Clear;
    Post;
  end;
end;

procedure TFrmStatist.ToolButton2Click(Sender: TObject);
begin
  C_Q.Insert;
end;

procedure TFrmStatist.ToolButton3Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    try
      with C_Q do
      begin
        Edit;
        FieldByName('CERTIFICATES_SCAN').Clear;
        TBlobField(FieldByName('CERTIFICATES_SCAN'))
          .LoadFromFile(OpenDialog.FileName);
        Post;
      end;
    finally

    end;
end;

procedure TFrmStatist.ToolButton5Click(Sender: TObject);
begin
  H_T.Edit;
end;

procedure TFrmStatist.ToolButton7Click(Sender: TObject);
begin
  with H_T do
    if (State in [dsEdit, dsInsert]) then
    begin
      Post;
      Refresh;
      AutoSizeColDBGrid(HumansGrid);
    end
    else
      Refresh;
end;

procedure TFrmStatist.ToolButton9Click(Sender: TObject);
begin
  H_T.Delete;
  AutoSizeColDBGrid(HumansGrid);
end;

end.
