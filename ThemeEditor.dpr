program ThemeEditor;

uses
  System.StartUpCopy,
  FMX.Forms,
  ThemeEditorUnit in 'ThemeEditorUnit.pas' {MainForm},
  FMX.FormExtUnit in 'FMX.FormExtUnit.pas',
  BorderFrameUnit in 'FMX.BorderFrame\BorderFrameUnit.pas' {BorderFrame: TFrame},
  FMX.TrayIcon.Win in '..\DevelopmentsCollection\FMX.TrayIcon.Win.pas',
  ObjectRegistryUnit in '..\DevelopmentsCollection\ObjectRegistryUnit.pas',
  ThreadFactoryRegistryUnit in '..\DevelopmentsCollection\ThreadFactoryRegistryUnit.pas',
  ThreadFactoryUnit in '..\DevelopmentsCollection\ThreadFactoryUnit.pas',
  ThreadRegistryUnit in '..\DevelopmentsCollection\ThreadRegistryUnit.pas',
  FMX.ControlToolsUnit in '..\DevelopmentsCollection\FMX.ControlToolsUnit.pas',
  FMX.Theme in '..\DevelopmentsCollection\FMX.Theme\FMX.Theme.pas',
  FMX.Theme.Types in '..\DevelopmentsCollection\FMX.Theme\FMX.Theme.Types.pas',
  ParamsExtUnit in '..\DevelopmentsCollection\ParamsExt\ParamsExtUnit.pas',
  FMX.ImageToolsUnit in '..\DevelopmentsCollection\FMX.ImageToolsUnit.pas',
  BinFileTypes in '..\DevelopmentsCollection\Types\BinFileTypes.pas',
  StreamHandler in '..\DevelopmentsCollection\Stream\StreamHandler.pas',
  FMX.ButtonDecorator in '..\DevelopmentsCollection\FMX.Theme\FMX.ButtonDecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
