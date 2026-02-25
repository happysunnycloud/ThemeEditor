unit ThemeEditorUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.FormExtUnit,
  FMX.Colors, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.Theme, FMX.Edit, FMX.ListBox, FMX.Menus;

//const
//  DEFAUL_FONT_FAMILY = '(Default)';

type
  TMainForm = class(TFormExt)
    ColorPicker: TColorPicker;
    ColorQuad: TColorQuad;
    ColorBox: TColorBox;
    BorderFrameRadioButton: TRadioButton;
    ItemLabelTextRadioButton: TRadioButton;
    ItemNormalLabel: TLabel;
    SettingsLayout: TLayout;
    ItemNormalBackgroundRadioButton: TRadioButton;
    ItemNormalPanel: TPanel;
    ItemNormalBackgroundRectangle: TRectangle;
    ItemFocusedBackgroundRadioButton: TRadioButton;
    ItemFocusedPanel: TPanel;
    ItemFocusedBackgroundRectangle: TRectangle;
    ItemFocusedLabel: TLabel;
    ItemFocusFrameRadioButton: TRadioButton;
    NavigateLayout: TLayout;
    SaveButton: TButton;
    LoadButton: TButton;
    HEXLabel: TLabel;
    HEXEdit: TEdit;
    ApplyColorButton: TButton;
    FontSizeComboBox: TComboBox;
    PopupMenuItemsLayout: TLayout;
    PopupMenuBackgroundPanel: TPanel;
    PopupMenuItem0Rectangle: TRectangle;
    PopupMenuItem1Rectangle: TRectangle;
    PopupMenuItem2Rectangle: TRectangle;
    PopupMenuItem3Rectangle: TRectangle;
    PopupMenuItem0Label: TLabel;
    PopupMenuItem1Label: TLabel;
    PopupMenuItem2Label: TLabel;
    PopupMenuItem3Label: TLabel;
    PopupMenuBackgroundRectangle: TRectangle;
    PopupMenuBackgroundRadioButton: TRadioButton;
    FormGroupBox: TGroupBox;
    PopupMenuItemMouseOverBackgroundRadioButton: TRadioButton;
    PopupMenuGroupBox: TGroupBox;
    PopupMenuItemTextColorRadioButton: TRadioButton;
    VisualListGroupBox: TGroupBox;
    VisualListLeftLayout: TLayout;
    Layout2: TLayout;
    PopupMenuItemBackgroundRadioButton: TRadioButton;
    PopupmenuLeftLayout: TLayout;
    Layout4: TLayout;
    FontFamilyComboBox: TComboBox;
    FormBackgroundRadioButton: TRadioButton;
    MenuBar1: TMenuBar;
    ContentLayout: TLayout;
    SaveMenuItem0: TMenuItem;
    LoadMenuItem0: TMenuItem;
    HintGroupBox: TGroupBox;
    Layout1: TLayout;
    HintLabelTextRadioButton: TRadioButton;
    HintBackgroundRadioButton: TRadioButton;
    Layout3: TLayout;
    Panel1: TPanel;
    HintBackgroundRectangle: TRectangle;
    HintLabel: TLabel;
    FormCaptionRadioButton: TRadioButton;
    ColorSettingsLayout: TLayout;
    FontSettingsLayout: TLayout;
    Layout5: TLayout;
    BoldCheckBox: TCheckBox;
    ItalicCheckBox: TCheckBox;
    UnderlineCheckBox: TCheckBox;
    StrikeOutCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    Layout6: TLayout;
    CommonTextSettingsRadioButton: TRadioButton;
    Layout7: TLayout;
    Panel2: TPanel;
    Rectangle1: TRectangle;
    CommontTextSettingsLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ColorQuadChange(Sender: TObject);
    procedure BorderFrameRadioButtonClick(Sender: TObject);
    procedure ItemLabelTextRadioButtonClick(Sender: TObject);
    procedure ItemNormalBackgroundRadioButtonClick(Sender: TObject);
    procedure ItemFocusedBackgroundRadioButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ApplyColorButtonClick(Sender: TObject);
    procedure ItemFocusFrameRadioButtonClick(Sender: TObject);
    procedure PopupMenuItem0RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem0RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuItem1RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem1RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuItem2RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem2RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuBackgroundRadioButtonClick(Sender: TObject);
    procedure PopupMenuItemMouseOverBackgroundRadioButtonClick(Sender: TObject);
    procedure PopupMenuItemTextColorRadioButtonClick(Sender: TObject);
    procedure PopupMenuItemBackgroundRadioButtonClick(Sender: TObject);
    procedure FontSizeComboBoxChange(Sender: TObject);
    procedure FontFamilyComboBoxChange(Sender: TObject);
    procedure FormBackgroundRadioButtonClick(Sender: TObject);
    procedure SaveMenuItem0Click(Sender: TObject);
    procedure LoadMenuItem0Click(Sender: TObject);
    procedure HintBackgroundRadioButtonClick(Sender: TObject);
    procedure HintLabelTextRadioButtonClick(Sender: TObject);
    procedure FormGroupBoxClick(Sender: TObject);
    procedure FormCaptionRadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BoldCheckBoxChange(Sender: TObject);
    procedure ItalicCheckBoxChange(Sender: TObject);
    procedure UnderlineCheckBoxChange(Sender: TObject);
    procedure StrikeOutCheckBoxChange(Sender: TObject);
    procedure CommonTextSettingsRadioButtonClick(Sender: TObject);
  private
    FTheme: TTheme;

    procedure ThemeApply;

    procedure SetColor(const AColor: TAlphaColor);
    procedure SetTextSettings(const ACustomTextSettings: TCustomTextSettings);

    procedure Save(const AFileName: String);
    procedure Load(const AFileName: String);

    procedure ProcessTextStyleCheckBoxes;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
    System.UIConsts
  , ParamsExtUnit
  , FMX.ImageToolsUnit
  , FMX.ControlToolsUnit
//  , BorderFrameUnit
  ;

procedure TMainForm.ThemeApply;
begin
  Self.Fill.Color := FTheme.FormSettings.BackgroundColor;
  BorderFrame.Color := FTheme.FormSettings.BorderFrameColor;
  BorderFrame.CaptionColor := FTheme.FormSettings.CustomTextSettings.FontColor;

  FTheme.FormSettings.CustomTextSettings.ApplyTo(BorderFrame.CaptionText);

  FTheme.CommonSettings.CustomTextSettings.ApplyTo(CommontTextSettingsLabel);

  ItemNormalLabel.TextSettings.FontColor := FTheme.ItemSettings.CustomTextSettings.FontColor;
  ItemFocusedLabel.TextSettings.FontColor := FTheme.ItemSettings.CustomTextSettings.FontColor;

  FTheme.ItemSettings.CustomTextSettings.ApplyTo(ItemNormalLabel);
  FTheme.ItemSettings.CustomTextSettings.ApplyTo(ItemFocusedLabel);

  ItemNormalBackgroundRectangle.Fill.Color := FTheme.ItemSettings.NormalBackgroundColor;
  ItemFocusedBackgroundRectangle.Fill.Color := FTheme.ItemSettings.FocusedBackgroundColor;
  ItemFocusedBackgroundRectangle.Stroke.Color := FTheme.ItemSettings.FocusFrameColor;
  ItemNormalBackgroundRectangle.Stroke.Color := ItemFocusedBackgroundRectangle.Stroke.Color;

  PopupMenuBackgroundRectangle.Fill.Color := FTheme.PopUpMenuSettings.BackgroundColor;
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
  PopupMenuItem3Rectangle.Fill.Color := FTheme.PopUpMenuSettings.MouseOverColor;

  FTheme.PopUpMenuSettings.CustomTextSettings.ApplyTo(PopupMenuItem0Label);
  FTheme.PopUpMenuSettings.CustomTextSettings.ApplyTo(PopupMenuItem1Label);
  FTheme.PopUpMenuSettings.CustomTextSettings.ApplyTo(PopupMenuItem2Label);
  FTheme.PopUpMenuSettings.CustomTextSettings.ApplyTo(PopupMenuItem3Label);

  HintBackgroundRectangle.Fill.Color := FTheme.HintSettings.BackgroundColor;
  FTheme.HintSettings.CustomTextSettings.ApplyTo(HintLabel);
end;

procedure TMainForm.UnderlineCheckBoxChange(Sender: TObject);
begin
  ProcessTextStyleCheckBoxes;
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
  Save('theme.bin');
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
  Load('theme.bin');
end;

procedure TMainForm.LoadMenuItem0Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  LoadFileName: String;
begin
  LoadFileName := '';

  OpenDialog := TOpenDialog.Create(self);
  OpenDialog.InitialDir := ParamStr(0);
  OpenDialog.Filter := 'Theme files|*.thm';
  OpenDialog.FilterIndex := 2;

  if OpenDialog.Execute then
    LoadFileName := OpenDialog.FileName;

  OpenDialog.Free;

  if LoadFileName.Length = 0 then
    Exit;

  Load(LoadFileName);
end;

procedure TMainForm.SaveMenuItem0Click(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  SaveFileName: String;
  Ext: String;
begin
  SaveDialog := TSaveDialog.Create(self);
  try
    SaveDialog.InitialDir := ParamStr(0);
    SaveDialog.Filter := 'Theme files|*.thm';
    SaveDialog.FilterIndex := 2;

    SaveFileName := '';
    if SaveDialog.Execute then
    begin
      SaveFileName := SaveDialog.FileName;
      Ext := ExtractFileExt(SaveFileName);
      if Ext.Length = 0 then
        SaveFileName := SaveDialog.FileName + '.thm';
    end;
  finally
    SaveDialog.Free;
  end;

  if SaveFileName.Length = 0 then
    Exit;

  if FileExists(SaveFileName) then
    if not DeleteFile(SaveFileName) then
      raise Exception.CreateFmt('Can not delete file "%s"', [SaveFileName]);

  Save(SaveFileName);

  ShowMessage('Done');
end;

procedure TMainForm.SetColor(const AColor: TAlphaColor);
var
  NotifyEvent: TNotifyEvent;
  Lum, Sat, Hue: Single;
begin
  HEXEdit.Text := TImageTools.ColorToHex(AColor);

  NotifyEvent := ColorQuad.OnChange;
  ColorQuad.OnChange := nil;

  RGBtoHSL(AColor, Hue, Sat, Lum);

  ColorPicker.Hue := Hue;

  ColorQuad.Lum := Lum;
  ColorQuad.Sat := Sat;
  ColorQuad.Hue := Hue;

  ColorQuad.OnChange := NotifyEvent;
end;

procedure TMainForm.SetTextSettings(const ACustomTextSettings: TCustomTextSettings);
begin
  FontSizeComboBox.ItemIndex :=
    FontSizeComboBox.Items.IndexOf(ACustomTextSettings.FontSize.ToString);
  FontFamilyComboBox.ItemIndex :=
    FontFamilyComboBox.Items.IndexOf(ACustomTextSettings.FontFamily);

  BoldCheckBox.SilentIsCheckChange(ACustomTextSettings.Bold);
  ItalicCheckBox.SilentIsCheckChange(ACustomTextSettings.Italic);
  UnderlineCheckBox.SilentIsCheckChange(ACustomTextSettings.Underline);
  StrikeOutCheckBox.SilentIsCheckChange(ACustomTextSettings.StrikeOut);
end;

procedure TMainForm.StrikeOutCheckBoxChange(Sender: TObject);
begin
  ProcessTextStyleCheckBoxes;
end;

procedure TMainForm.ColorQuadChange(Sender: TObject);
var
  Color: TAlphaColor;
begin
  Color := ColorQuad.ColorBox.Color;
  HEXEdit.Text := TImageTools.ColorToHex(Color);

  if BorderFrameRadioButton.IsChecked then
  begin
    FTheme.FormSettings.BorderFrameColor := Color;
  end
  else
  if FormBackgroundRadioButton.IsChecked then
  begin
    FTheme.FormSettings.BackgroundColor := Color;
  end
  else
  if FormCaptionRadioButton.IsChecked then
  begin
    FTheme.FormSettings.CustomTextSettings.FontColor := Color;
  end
  else
  if CommonTextSettingsRadioButton.IsChecked then
  begin
    FTheme.CommonSettings.CustomTextSettings.FontColor := Color;
  end
  else
  if ItemLabelTextRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.CustomTextSettings.FontColor := Color;
  end
  else
  if ItemNormalBackgroundRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.NormalBackgroundColor := Color;
  end
  else
  if ItemFocusedBackgroundRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.FocusedBackgroundColor := Color;
  end
  else
  if ItemFocusFrameRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.FocusFrameColor := Color;
  end
  else
  if PopupMenuBackgroundRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.BackgroundColor := Color;
  end
  else
  if PopupMenuItemBackgroundRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.NormalBackgroundColor := Color;
  end
  else
  if PopupMenuItemMouseOverBackgroundRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.MouseOverColor := Color;
  end
  else
  if PopupMenuItemTextColorRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.CustomTextSettings.FontColor := Color;
  end
  else
  if HintBackgroundRadioButton.IsChecked then
  begin
    FTheme.HintSettings.BackgroundColor := Color;
  end
  else
  if HintLabelTextRadioButton.IsChecked then
  begin
    FTheme.HintSettings.CustomTextSettings.FontColor := Color;
  end;

  ThemeApply;
end;

procedure TMainForm.CommonTextSettingsRadioButtonClick(Sender: TObject);
begin
  CommonTextSettingsRadioButton.IsChecked := true;

  SetTextSettings(FTheme.CommonSettings.CustomTextSettings);

  SetColor(FTheme.CommonSettings.CustomTextSettings.FontColor);
end;

procedure TMainForm.FormBackgroundRadioButtonClick(Sender: TObject);
begin
  FormBackgroundRadioButton.IsChecked := true;
  SetColor(FTheme.FormSettings.BackgroundColor);
end;

procedure TMainForm.FormCaptionRadioButtonClick(Sender: TObject);
begin
  FormCaptionRadioButton.IsChecked := true;

  SetTextSettings(FTheme.FormSettings.CustomTextSettings);

  SetColor(FTheme.FormSettings.CustomTextSettings.FontColor);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  ReportMemoryLeaksOnShutdown := true;

  FTheme := TTheme.Create;
  FTheme.FormSettings.BackgroundColor := TAlphaColorRec.Black;
  BorderFrame.Kind := TBorderFrameKind.bfkNormal;

  Self.Fill.Color := FTheme.FormSettings.BackgroundColor;
  BorderFrame.Color := FTheme.FormSettings.BorderFrameColor;
  BorderFrame.CaptionColor := FTheme.FormSettings.CustomTextSettings.FontColor;
  BorderFrame.CaptionText.TextSettings.Font.Size := FTheme.FormSettings.CustomTextSettings.FontSize;

  BorderFrameRadioButton.IsChecked := true;

  for i := 8 to 28 do
  begin
    FontSizeComboBox.Items.Add(i.ToString);
  end;

  FontSizeComboBox.SilentIndexChange(FontSizeComboBox.Items.IndexOf('12'));

  // ------------ //

  FontFamilyComboBox.Items.Add(DEFAUL_FONT_FAMILY);
  FontFamilyComboBox.Items.Add('Segoe UI');
  FontFamilyComboBox.Items.Add('Tahoma');
  FontFamilyComboBox.Items.Add('Arial');
  FontFamilyComboBox.Items.Add('Times New Roman');
  FontFamilyComboBox.Items.Add('Courier New');

  FontFamilyComboBox.SilentIndexChange(
    FontFamilyComboBox.Items.IndexOf('Segoe UI'));

//  FTheme.HintSettings.CustomTextSettings.FontFamily := 'Segoe UI';

//  TThread.CreateAnonymousThread(
//    procedure
//    begin
//      Sleep(3000);
//
//      TThread.ForceQueue(nil,
//        procedure
//        begin
//          FTheme.FormSettings.Apply;
//        end);
//    end).Start;

  ThemeApply;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FTheme.Free;
end;

procedure TMainForm.FormGroupBoxClick(Sender: TObject);
begin
begin
  SetColor(Self.Fill.Color);
  FormCaptionRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
//  TThread.CreateAnonymousThread(
//    procedure
//    begin
//      Sleep(1000);
//
//      TThread.ForceQueue(nil,
//        procedure
//        begin
//          ThemeApply;
//        end);
//    end).Start;
end;

procedure TMainForm.HintBackgroundRadioButtonClick(Sender: TObject);
begin
  HintBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.HintSettings.BackgroundColor);
end;

procedure TMainForm.HintLabelTextRadioButtonClick(Sender: TObject);
begin
  HintLabelTextRadioButton.IsChecked := true;

  SetTextSettings(FTheme.HintSettings.CustomTextSettings);

  SetColor(FTheme.HintSettings.CustomTextSettings.FontColor);
end;

procedure TMainForm.PopupMenuItemBackgroundRadioButtonClick(Sender: TObject);
begin
  PopupMenuItemBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.PopUpMenuSettings.MouseOverColor);
end;

procedure TMainForm.PopupMenuItemMouseOverBackgroundRadioButtonClick(Sender: TObject);
begin
  PopupMenuItemMouseOverBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.PopUpMenuSettings.MouseOverColor);
end;

procedure TMainForm.PopupMenuItemTextColorRadioButtonClick(Sender: TObject);
begin
  PopupMenuItemTextColorRadioButton.IsChecked := true;

  SetTextSettings(FTheme.PopUpMenuSettings.CustomTextSettings);

  SetColor(FTheme.PopUpMenuSettings.CustomTextSettings.FontColor);
end;

procedure TMainForm.ApplyColorButtonClick(Sender: TObject);
var
  Color: TAlphaColor;
begin
  if HEXEdit.Text.Length = 0 then
    Exit;

  Color := TImageTools.HexToAlphaColor(HEXEdit.Text);
  SetColor(Color);
  ColorQuadChange(nil);
end;

procedure TMainForm.BoldCheckBoxChange(Sender: TObject);
begin
  ProcessTextStyleCheckBoxes;
end;

procedure TMainForm.BorderFrameRadioButtonClick(Sender: TObject);
begin
  BorderFrameRadioButton.IsChecked := true;

  SetColor(FTheme.FormSettings.BorderFrameColor);
end;

procedure TMainForm.ItemLabelTextRadioButtonClick(Sender: TObject);
begin
  ItemLabelTextRadioButton.IsChecked := true;

  SetTextSettings(FTheme.ItemSettings.CustomTextSettings);

  SetColor(FTheme.ItemSettings.CustomTextSettings.FontColor);
end;

procedure TMainForm.ItemNormalBackgroundRadioButtonClick(Sender: TObject);
begin
  ItemNormalBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.ItemSettings.NormalBackgroundColor);
end;

procedure TMainForm.PopupMenuItem0RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.MouseOverColor;
end;

procedure TMainForm.PopupMenuItem0RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
end;

procedure TMainForm.PopupMenuItem1RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.MouseOverColor;
end;

procedure TMainForm.PopupMenuItem1RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
end;

procedure TMainForm.PopupMenuItem2RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.MouseOverColor;
end;

procedure TMainForm.PopupMenuItem2RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.NormalBackgroundColor;
end;

procedure TMainForm.PopupMenuBackgroundRadioButtonClick(Sender: TObject);
begin
  PopupMenuBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.PopUpMenuSettings.BackgroundColor);
end;

procedure TMainForm.ProcessTextStyleCheckBoxes;
begin
  if FormCaptionRadioButton.IsChecked then
  begin
    FTheme.FormSettings.CustomTextSettings.Bold := BoldCheckBox.IsChecked;
    FTheme.FormSettings.CustomTextSettings.Italic := ItalicCheckBox.IsChecked;
    FTheme.FormSettings.CustomTextSettings.Underline := UnderlineCheckBox.IsChecked;
    FTheme.FormSettings.CustomTextSettings.StrikeOut := StrikeOutCheckBox.IsChecked;
  end
  else
  if CommonTextSettingsRadioButton.IsChecked then
  begin
    FTheme.CommonSettings.CustomTextSettings.Bold := BoldCheckBox.IsChecked;
    FTheme.CommonSettings.CustomTextSettings.Italic := ItalicCheckBox.IsChecked;
    FTheme.CommonSettings.CustomTextSettings.Underline := UnderlineCheckBox.IsChecked;
    FTheme.CommonSettings.CustomTextSettings.StrikeOut := StrikeOutCheckBox.IsChecked;
  end
  else
  if ItemLabelTextRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.CustomTextSettings.Bold := BoldCheckBox.IsChecked;
    FTheme.ItemSettings.CustomTextSettings.Italic := ItalicCheckBox.IsChecked;
    FTheme.ItemSettings.CustomTextSettings.Underline := UnderlineCheckBox.IsChecked;
    FTheme.ItemSettings.CustomTextSettings.StrikeOut := StrikeOutCheckBox.IsChecked;
  end
  else
  if HintLabelTextRadioButton.IsChecked then
  begin
    FTheme.HintSettings.CustomTextSettings.Bold := BoldCheckBox.IsChecked;
    FTheme.HintSettings.CustomTextSettings.Italic := ItalicCheckBox.IsChecked;
    FTheme.HintSettings.CustomTextSettings.Underline := UnderlineCheckBox.IsChecked;
    FTheme.HintSettings.CustomTextSettings.StrikeOut := StrikeOutCheckBox.IsChecked;
  end
  else
  if PopupMenuItemTextColorRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.CustomTextSettings.Bold := BoldCheckBox.IsChecked;
    FTheme.PopUpMenuSettings.CustomTextSettings.Italic := ItalicCheckBox.IsChecked;
    FTheme.PopUpMenuSettings.CustomTextSettings.Underline := UnderlineCheckBox.IsChecked;
    FTheme.PopUpMenuSettings.CustomTextSettings.StrikeOut := StrikeOutCheckBox.IsChecked;
  end;

  ThemeApply;
end;

procedure TMainForm.ItalicCheckBoxChange(Sender: TObject);
begin
  ProcessTextStyleCheckBoxes;
end;

procedure TMainForm.ItemFocusedBackgroundRadioButtonClick(Sender: TObject);
begin
  ItemFocusedBackgroundRadioButton.IsChecked := true;

  SetColor(FTheme.ItemSettings.FocusedBackgroundColor);
end;

procedure TMainForm.ItemFocusFrameRadioButtonClick(Sender: TObject);
begin
  ItemFocusFrameRadioButton.IsChecked := true;

  SetColor(FTheme.ItemSettings.FocusFrameColor);
end;

procedure TMainForm.FontFamilyComboBoxChange(Sender: TObject);
var
  FontFamily: String;
begin
  FontFamily := FontFamilyComboBox.Items[FontFamilyComboBox.ItemIndex];
  if FontFamily = DEFAUL_FONT_FAMILY then
    FontFamily := '';

  if FormCaptionRadioButton.IsChecked then
  begin
    FTheme.FormSettings.CustomTextSettings.FontFamily := FontFamily;
  end
  else
  if CommonTextSettingsRadioButton.IsChecked then
  begin
    FTheme.CommonSettings.CustomTextSettings.FontFamily := FontFamily;
  end;
  if ItemLabelTextRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.CustomTextSettings.FontFamily := FontFamily;
  end
  else
  if HintLabelTextRadioButton.IsChecked then
  begin
    FTheme.HintSettings.CustomTextSettings.FontFamily := FontFamily;
  end
  else
  if PopupMenuItemTextColorRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.CustomTextSettings.FontFamily := FontFamily;
  end;

  ThemeApply;
end;

procedure TMainForm.FontSizeComboBoxChange(Sender: TObject);
var
  FontSizeStr: String;
  FontSize: Single;
begin
  FontSizeStr := FontSizeComboBox.Items[FontSizeComboBox.ItemIndex];
  FontSize := FontSizeStr.ToExtended;

  if FormCaptionRadioButton.IsChecked then
  begin
    FTheme.FormSettings.CustomTextSettings.FontSize := FontSize;
  end
  else
  if CommonTextSettingsRadioButton.IsChecked then
  begin
    FTheme.CommonSettings.CustomTextSettings.FontSize := FontSize;
  end
  else
  if ItemLabelTextRadioButton.IsChecked then
  begin
    FTheme.ItemSettings.CustomTextSettings.FontSize := FontSize;
  end
  else
  if HintLabelTextRadioButton.IsChecked then
  begin
    FTheme.HintSettings.CustomTextSettings.FontSize := FontSize;
  end
  else
  if PopupMenuItemTextColorRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.CustomTextSettings.FontSize := FontSize;
  end;

  ThemeApply;
end;

procedure TMainForm.Save(const AFileName: String);
begin
  FTheme.SaveToFile(AFileName);
end;

procedure TMainForm.Load(const AFileName: String);
var
  FontFamily: String;
  Index: Integer;
begin
  if not FileExists(AFileName) then
    raise Exception.CreateFmt('File "%s" not exists', [AFileName]);

  FTheme.LoadFromFile(AFileName);

  ThemeApply;

  Index :=
    FontSizeComboBox.Items.
      IndexOf(FTheme.ItemSettings.CustomTextSettings.FontSize.ToString);
  FontSizeComboBox.ItemIndex := Index;

  FontFamily := FTheme.ItemSettings.CustomTextSettings.FontFamily;
  if FontFamily.Length = 0 then
    FontFamily := DEFAUL_FONT_FAMILY;
  Index := FontFamilyComboBox.Items.IndexOf(FontFamily);
  FontFamilyComboBox.ItemIndex := Index;
end;

end.
