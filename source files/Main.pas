unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons,
  Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  RxDBCtrl;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Windows: TMenuItem;
    Service: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    DBConnectionProperties: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    WindowTileItem2: TMenuItem;
    N2: TMenuItem;
    ChildOperator: TMenuItem;
    ChildStatist: TMenuItem;
    N3: TMenuItem;
    AlignmentWindows: TMenuItem;
    Exit: TMenuItem;
    procedure ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses DBConnect, DataModule;

procedure TMainForm.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainMenu.Images := DataModuleForm.IconsImageList;
  ChildOperator.Action := DataModuleForm.ChildOperatorAction;
  ChildStatist.Action := DataModuleForm.ChildStatistAction;
  WindowCascadeItem.Action := DataModuleForm.WindowsCascadeAction;
  WindowTileItem.Action := DataModuleForm.WindowsTileVerticalAction;
  WindowTileItem2.Action := DataModuleForm.WindowsTileHorizontalAction;
  WindowMinimizeItem.Action := DataModuleForm.WindowsMinimizeAction;
  DBConnectionProperties.Action := DataModuleForm.DBConnectionPropertiesAction;
end;

end.
