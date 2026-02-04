program ThemeEditor;

uses
  System.StartUpCopy,
  FMX.Forms,
  ThemeEditorUnit in 'ThemeEditorUnit.pas' {MainForm},
  FMX.FormExtUnit in 'C:\Desktop\DevelopmentsCollection\FMX.FormExtUnit.pas',
  BorderFrameTypesUnit in 'C:\Desktop\DevelopmentsCollection\BorderFrame\BorderFrameTypesUnit.pas',
  BorderFrameUnit in 'C:\Desktop\DevelopmentsCollection\BorderFrame\BorderFrameUnit.pas' {BorderFrame: TFrame},
  FMX.TrayIcon.Win in 'C:\Desktop\DevelopmentsCollection\FMX.TrayIcon.Win.pas',
  ObjectRegistryUnit in 'C:\Desktop\DevelopmentsCollection\ObjectRegistryUnit.pas',
  ThreadFactoryRegistryUnit in 'C:\Desktop\DevelopmentsCollection\ThreadFactoryRegistryUnit.pas',
  ThreadFactoryUnit in 'C:\Desktop\DevelopmentsCollection\ThreadFactoryUnit.pas',
  ThreadRegistryUnit in 'C:\Desktop\DevelopmentsCollection\ThreadRegistryUnit.pas',
  FMX.ControlToolsUnit in 'C:\Desktop\DevelopmentsCollection\FMX.ControlToolsUnit.pas',
  FMX.ThemeUnit in 'C:\Desktop\DevelopmentsCollection\FMX.ThemeUnit.pas',
  ParamsExtFileUnit in 'C:\Desktop\DevelopmentsCollection\ParamsExt\ParamsExtFileUnit.pas',
  ParamsExtUnit in 'C:\Desktop\DevelopmentsCollection\ParamsExt\ParamsExtUnit.pas',
  FMX.ImageToolsUnit in 'C:\Desktop\DevelopmentsCollection\FMX.ImageToolsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
