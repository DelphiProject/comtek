unit FrmFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrameFind = class(TFrame)
    GroupBox1: TGroupBox;
    FilterSpeedButton: TSpeedButton;
    FilterEdit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
 DataModule;
end.
