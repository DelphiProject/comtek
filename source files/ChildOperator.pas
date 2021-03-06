unit ChildOperator;

interface

uses Winapi.Windows, Vcl.Themes, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FrmFind, Vcl.DBCGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Dialogs, System.Sysutils, Jpeg, StrUtils, ZDataset, ZSqlUpdate;

type
  TFrmOperator = class(TForm)
    GroupBox1: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    HumansGrid: TDBGrid;
    Panel1: TPanel;
    CertificatesGrid: TDBGrid;
    Splitter2: TSplitter;
    Panel2: TPanel;
    PhotoDBImage: TDBImage;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
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
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    OpenDialog: TOpenDialog;
    FrameFind1: TFrameFind;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure FrameFind1FilterSpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure DataChange(Sender: TObject; Field: TField);

  var
    Guid: TGUID;
    H10_Q: TZQuery;
    H10_Q_DS: TDataSource;
    C_Q: TZQuery;
    C_Q_DS: TDataSource;
    s: string;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  main, DataModule, AdjustGrid;

procedure TFrmOperator.DataChange(Sender: TObject; Field: TField);
begin
  { ??????????? ??????????? ???????? ????????? HID ??????? ??
    ?????????? ??????? ??? ???????? ?? ?????? ???????? }
  if Assigned(C_Q) and Assigned(H10_Q) then
  begin
    C_Q.Close;
    C_Q.ParamByName('HID').AsInteger := H10_Q.FieldByName('humans_id')
      .AsInteger;
    C_Q.Open;
  end;
end;

procedure TFrmOperator.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
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

procedure TFrmOperator.FormCreate(Sender: TObject);
var
  i: integer;
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
  { ???????????? ???????? ?????????????? ??????? ? ???????? 10 ?????????
    ??????????? ????? }
  H10_Q := TZQuery.Create(DataModuleForm);
  H10_Q.Name := 'HQ10_' + s;
  H10_Q.SQL.Text :=
    'SELECT * FROM humans WHERE ROWNUM <=10 ORDER BY humans_id DESC';
  H10_Q.Connection := DataModuleForm.Database_Connection;
  if DataModuleForm.Database_Connection.Connected then
    H10_Q.Open;
  { ???????? ?????????????? ??????? ? ????????? }
  C_Q := TZQuery.Create(DataModuleForm);
  C_Q.ParamCheck := True;
  C_Q.Name := 'CQ_' + s;
  C_Q.SQL.Text := 'SELECT * FROM certificates WHERE humans_id=:HID';
  C_Q.Connection := DataModuleForm.Database_Connection;
  { ???????? DataSource ??? ????? ????????? ???????? }
  H10_Q_DS := TDataSource.Create(DataModuleForm);
  C_Q.MasterSource := H10_Q_DS;
  C_Q.MasterFields := 'HUMANS_ID';
  C_Q.LinkedFields := 'HUMANS_ID';
  H10_Q_DS.Name := 'HQ10DS_' + s;
  H10_Q_DS.DataSet := H10_Q;
  H10_Q_DS.OnDataChange := DataChange;
  C_Q_DS := TDataSource.Create(DataModuleForm);
  C_Q_DS.Name := 'CQDS_' + s;
  C_Q_DS.DataSet := C_Q;
  { ??????????? DataSource ? DBGrid ?  ?????????????? ?????????? ????? Grid
    ?? ??????????? }
  HumansGrid.DataSource := H10_Q_DS;
  CertificatesGrid.DataSource := C_Q_DS;
  PhotoDBImage.DataSource := C_Q_DS;
  PhotoDBImage.DataField := 'CERTIFICATES_SCAN';
  AutoSizeColDBGrid(HumansGrid);
  AutoSizeColDBGrid(CertificatesGrid);
end;

{ ?????? ?? ??????? }
procedure TFrmOperator.FrameFind1FilterSpeedButtonClick(Sender: TObject);
begin
  with FrameFind1 do
    if FilterSpeedButton.Down = True then
      with H10_Q do
      begin
        if FilterEdit.Text <> '' then
        begin
          Filter := 'FULLNAME LIKE ' + #39 + '*' + FilterEdit.Text + '*' + #39;
          Filtered := True;
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
      H10_Q.Filtered := False;
      FilterEdit.Text := '';
    end;
end;

procedure TFrmOperator.ToolButton11Click(Sender: TObject);
begin
  H10_Q.Close;
  H10_Q.Open;
  AutoSizeColDBGrid(HumansGrid);
end;

procedure TFrmOperator.ToolButton14Click(Sender: TObject);
begin
  C_Q.Edit;
end;

procedure TFrmOperator.ToolButton16Click(Sender: TObject);
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

procedure TFrmOperator.ToolButton18Click(Sender: TObject);
begin
  C_Q.Delete;
  AutoSizeColDBGrid(CertificatesGrid);
end;

procedure TFrmOperator.ToolButton1Click(Sender: TObject);
begin
  H10_Q.Insert;
end;

procedure TFrmOperator.ToolButton20Click(Sender: TObject);
begin
  C_Q.Close;
  C_Q.Open;
  AutoSizeColDBGrid(CertificatesGrid);
end;

procedure TFrmOperator.ToolButton23Click(Sender: TObject);
begin
  with C_Q do
  begin
    Edit;
    FieldByName('CERTIFICATES_SCAN').Clear;
    Post;
  end;
end;

procedure TFrmOperator.ToolButton2Click(Sender: TObject);
begin
  C_Q.Insert;
end;

procedure TFrmOperator.ToolButton3Click(Sender: TObject);
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

procedure TFrmOperator.ToolButton5Click(Sender: TObject);
begin
  H10_Q.Edit;
end;

procedure TFrmOperator.ToolButton7Click(Sender: TObject);
begin
  with H10_Q do
    if (State in [dsEdit, dsInsert]) then
    begin
      Post;
      Refresh;
      AutoSizeColDBGrid(HumansGrid);
    end
    else
      Refresh;
end;

procedure TFrmOperator.ToolButton9Click(Sender: TObject);
begin
  H10_Q.Delete;
  AutoSizeColDBGrid(HumansGrid);
end;

end.
