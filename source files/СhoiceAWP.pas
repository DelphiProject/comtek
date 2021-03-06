unit ?hoiceAWP;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  T?hoiceAWPForm = class(TForm)
    OperatorBitBtn: TBitBtn;
    StatistBitBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure OperatorBitBtnClick(Sender: TObject);
    procedure StatistBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CreateMainForm;
  public
    { Public declarations }

  end;

var
  ?hoiceAWPForm: T?hoiceAWPForm;

implementation

{$R *.dfm}

uses
  main, DataModule;

{???????? ??????? ?????}
procedure T?hoiceAWPForm.CreateMainForm;
var
  P: Pointer;
begin
  P := @Application.Mainform;
  if (not Assigned(Mainform)) then
    Mainform := TMainForm.Create(Self);
  Pointer(P^) := Mainform;
  Mainform.Show;
end;

procedure T?hoiceAWPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CreateMainForm;
end;

procedure T?hoiceAWPForm.FormCreate(Sender: TObject);
begin
  with DataModuleForm.IconsImageList do
  begin
    GetBitmap(0, OperatorBitBtn.Glyph);
    GetBitmap(1, StatistBitBtn.Glyph);
  end;
end;

procedure T?hoiceAWPForm.OperatorBitBtnClick(Sender: TObject);
begin
  CreateMainForm;
  DataModuleForm.CreateOperatorMDIChild('??? ?????????(???? ?' +
    IntToStr(Mainform.MDIChildCount + 1)+')');
end;

procedure T?hoiceAWPForm.StatistBitBtnClick(Sender: TObject);
begin
  CreateMainForm;
  DataModuleForm.CreateStatistMDIChild('??? ????????(???? ?' +
    IntToStr(Mainform.MDIChildCount + 1)+')');
end;

end.
