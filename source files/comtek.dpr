program comtek;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  ChildOperator in 'ChildOperator.pas' {FrmOperator},
  ChildStatist in 'ChildStatist.pas' {FrmStatist},
  DBConnect in 'DBConnect.pas' {DBConnectForm},
  DataModule in 'DataModule.pas' {DataModuleForm: TDataModule},
  ?hoiceAWP in '?hoiceAWP.pas' {?hoiceAWPForm: TDataModule},
  FrmFind in 'FrmFind.pas' {FrameFind: TFrame},
  AdjustGrid in 'AdjustGrid.pas',
  Vcl.Themes,
  Vcl.Styles;


{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDataModuleForm, DataModuleForm);
  Application.Run;
end.
