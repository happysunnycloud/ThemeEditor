unit ThemeEditorUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.FormExtUnit,
  FMX.Colors, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.ThemeUnit, FMX.Edit, FMX.ListBox;

type
  TMainForm = class(TFormExt)
    ColorPicker: TColorPicker;
    ColorQuad: TColorQuad;
    ColorBox: TColorBox;
    BorderFrameRadioButton: TRadioButton;
    LabelTextRadioButton: TRadioButton;
    NormalLabel: TLabel;
    SelectColorLayout: TLayout;
    NormalBackgroundRadioButton: TRadioButton;
    NormalPanel: TPanel;
    NormalBackgroundRectangle: TRectangle;
    FocusedBackgroundRadioButton: TRadioButton;
    FocusedPanel: TPanel;
    FocusedBackgroundRectangle: TRectangle;
    FocusedLabel: TLabel;
    FocusFrameRadioButton: TRadioButton;
    NavigateLayout: TLayout;
    SaveButton: TButton;
    LoadButton: TButton;
    HEXLabel: TLabel;
    HEXEdit: TEdit;
    ApplyColorButton: TButton;
    ComboBox1: TComboBox;
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
    CommontGroupBox: TGroupBox;
    ItemMouseOverBackgroundRadioButton: TRadioButton;
    PopupMenuGroupBox: TGroupBox;
    ItemTextColorRadioButton: TRadioButton;
    VisualListGroupBox: TGroupBox;
    Layout1: TLayout;
    Layout2: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure ColorQuadChange(Sender: TObject);
    procedure BorderFrameRadioButtonClick(Sender: TObject);
    procedure LabelTextRadioButtonClick(Sender: TObject);
    procedure NormalBackgroundRadioButtonClick(Sender: TObject);
    procedure FocusedBackgroundRadioButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ApplyColorButtonClick(Sender: TObject);
    procedure FocusFrameRadioButtonClick(Sender: TObject);
    procedure PopupMenuItem0RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem0RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuItem1RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem1RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuItem2RectangleMouseEnter(Sender: TObject);
    procedure PopupMenuItem2RectangleMouseLeave(Sender: TObject);
    procedure PopupMenuBackgroundRadioButtonClick(Sender: TObject);
    procedure ItemMouseOverBackgroundRadioButtonClick(Sender: TObject);
    procedure ItemTextColorRadioButtonClick(Sender: TObject);
  private
    FTheme: TTheme;

    procedure ThemeApply;

    procedure SetColor(const AColor: TAlphaColor);
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
  ;

procedure TMainForm.ThemeApply;
begin
  BorderFrame.BorderColor := FTheme.BorderFrameColor;
  NormalLabel.FontColor := FTheme.TextSettings.FontColor;
  FocusedLabel.FontColor := FTheme.TextSettings.FontColor;
  NormalBackgroundRectangle.Fill.Color := FTheme.VisualListSettings.ItemBackgroundColor;
  FocusedBackgroundRectangle.Fill.Color := FTheme.VisualListSettings.FocusedItemBackgroundColor;
  FocusedBackgroundRectangle.Stroke.Color := FTheme.VisualListSettings.FocusFrameColor;
  NormalBackgroundRectangle.Stroke.Color := FocusedBackgroundRectangle.Stroke.Color;

  PopupMenuBackgroundRectangle.Fill.Color := FTheme.PopUpMenuSettings.BackgroundColor;
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
  PopupMenuItem3Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemMouseOverColor;

  PopupMenuItem0Label.StyledSettings := [];
  PopupMenuItem1Label.StyledSettings := [];
  PopupMenuItem2Label.StyledSettings := [];
  PopupMenuItem3Label.StyledSettings := [];

  PopupMenuItem0Label.TextSettings.FontColor := FTheme.PopUpMenuSettings.CustomTextSettings.FontColor;
  PopupMenuItem1Label.TextSettings.FontColor := FTheme.PopUpMenuSettings.CustomTextSettings.FontColor;
  PopupMenuItem2Label.TextSettings.FontColor := FTheme.PopUpMenuSettings.CustomTextSettings.FontColor;
  PopupMenuItem3Label.TextSettings.FontColor := FTheme.PopUpMenuSettings.CustomTextSettings.FontColor;
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
var
  Params: TParamsExt;
begin
  Params := TParamsExt.Create;
  try
    Params.Add(FTheme.BorderFrameColor, 'BorderFrameColor');
//    Params.Add(FTheme.NormalBackgroundColor, 'NormalBackgroundColor');
//    Params.Add(FTheme.FocusedBackgroundColor, 'FocusedBackgroundColor');
    Params.Add(FTheme.TextSettings.FontColor, 'TextSettingsFontColor');

    Params.ObjectToParams(FTheme.VisualListSettings);
    Params.ObjectToParams(FTheme.PopUpMenuSettings);

    Params.SaveToFile('theme.bin');
  finally
    Params.Free;
  end;
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);
var
  Params: TParamsExt;
begin
  Params := TParamsExt.Create;
  try
    Params.LoadFromFile('theme.bin');

    FTheme.BorderFrameColor := Params.AsCardinalByIdent['BorderFrameColor'];
//    FTheme.NormalBackgroundColor := Params.AsCardinalByIdent['NormalBackgroundColor'];
//    FTheme.FocusedBackgroundColor := Params.AsCardinalByIdent['FocusedBackgroundColor'];
    FTheme.TextSettings.FontColor := Params.AsCardinalByIdent['TextSettingsFontColor'];

    Params.ParamsToObject(FTheme.VisualListSettings);
    Params.ParamsToObject(FTheme.PopUpMenuSettings);
  finally
    Params.Free;
  end;

  ThemeApply;

  SetColor(FTheme.BorderFrameColor);
end;

procedure TMainForm.SetColor(const AColor: TAlphaColor);
var
  NotifyEvent: TNotifyEvent;
  Lum, Sat, Hue: Single;
begin
//  HEXEdit.Text := TImageTools.ColorToHex(AColor);

  NotifyEvent := ColorQuad.OnChange;
  ColorQuad.OnChange := nil;

  RGBtoHSL(AColor, Hue, Sat, Lum);

  ColorPicker.Hue := Hue;

  ColorQuad.Lum := Lum;
  ColorQuad.Sat := Sat;
  ColorQuad.Hue := Hue;

  ColorQuad.OnChange := NotifyEvent;
end;

procedure TMainForm.ColorQuadChange(Sender: TObject);
var
  Color: TAlphaColor;
begin
  Color := ColorQuad.ColorBox.Color;
  HEXEdit.Text := TImageTools.ColorToHex(Color);
//  SetColor(Color);

  if BorderFrameRadioButton.IsChecked then
  begin
    FTheme.BorderFrameColor := Color;
    BorderFrame.BorderColor := Color;
  end
  else
  if LabelTextRadioButton.IsChecked then
  begin
    FTheme.TextSettings.FontColor := Color;
    NormalLabel.FontColor := Color;
    FocusedLabel.FontColor := Color;
  end
  else
  if NormalBackgroundRadioButton.IsChecked then
  begin
    FTheme.VisualListSettings.ItemBackgroundColor := Color;
    NormalBackgroundRectangle.Fill.Color := Color;
  end
  else
  if FocusedBackgroundRadioButton.IsChecked then
  begin
    FTheme.VisualListSettings.FocusedItemBackgroundColor := Color;
    FocusedBackgroundRectangle.Fill.Color := Color;
  end
  else
  if FocusFrameRadioButton.IsChecked then
  begin
    FTheme.VisualListSettings.FocusFrameColor := Color;
    NormalBackgroundRectangle.Stroke.Color := Color;
    FocusedBackgroundRectangle.Stroke.Color := Color;
  end
  else
  if PopupMenuBackgroundRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.BackgroundColor := Color;
    PopupMenuBackgroundRectangle.Fill.Color := Color;
  end
  else
  if ItemMouseOverBackgroundRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.ItemMouseOverColor := Color;
    PopupMenuItem3Rectangle.Fill.Color := Color;
  end
  else
  if ItemTextColorRadioButton.IsChecked then
  begin
    FTheme.PopUpMenuSettings.CustomTextSettings.FontColor := Color;
    PopupMenuItem0Label.TextSettings.FontColor := Color;
    PopupMenuItem1Label.TextSettings.FontColor := Color;
    PopupMenuItem2Label.TextSettings.FontColor := Color;
    PopupMenuItem3Label.TextSettings.FontColor := Color;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  ReportMemoryLeaksOnShutdown := true;

  FTheme := TTheme.Create;

  BorderFrame.BorderFrameKind := TBorderFrameKind.bfkNormal;

  BorderFrameRadioButton.IsChecked := true;

  for i := 8 to 28 do
  begin
    ComboBox1.Items.Add(i.ToString);
  end;

  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf('12');

  ThemeApply;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FTheme.Free;
end;

procedure TMainForm.ItemMouseOverBackgroundRadioButtonClick(Sender: TObject);
begin
  SetColor(FTheme.PopUpMenuSettings.ItemMouseOverColor);
  ItemMouseOverBackgroundRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.ItemTextColorRadioButtonClick(Sender: TObject);
begin
  SetColor(FTheme.PopUpMenuSettings.CustomTextSettings.FontColor);
  ItemTextColorRadioButton.IsChecked := true;
  ColorQuadChange(nil);
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

procedure TMainForm.BorderFrameRadioButtonClick(Sender: TObject);
begin
  SetColor(BorderFrame.BorderColor);
  BorderFrameRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.LabelTextRadioButtonClick(Sender: TObject);
begin
  SetColor(NormalLabel.FontColor);
  LabelTextRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.NormalBackgroundRadioButtonClick(Sender: TObject);
begin
  SetColor(NormalBackgroundRectangle.Fill.Color);
  NormalBackgroundRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.PopupMenuItem0RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemMouseOverColor;
end;

procedure TMainForm.PopupMenuItem0RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem0Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
end;

procedure TMainForm.PopupMenuItem1RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemMouseOverColor;
end;

procedure TMainForm.PopupMenuItem1RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem1Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
end;

procedure TMainForm.PopupMenuItem2RectangleMouseEnter(Sender: TObject);
begin
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemMouseOverColor;
end;

procedure TMainForm.PopupMenuItem2RectangleMouseLeave(Sender: TObject);
begin
  PopupMenuItem2Rectangle.Fill.Color := FTheme.PopUpMenuSettings.ItemBackgroundColor;
end;

procedure TMainForm.PopupMenuBackgroundRadioButtonClick(Sender: TObject);
begin
  SetColor(FTheme.PopUpMenuSettings.BackgroundColor);
//  SetColor(PopupMenuBackgroundRectangle.Fill.Color);
  PopupMenuBackgroundRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.FocusedBackgroundRadioButtonClick(Sender: TObject);
begin
  SetColor(FocusedBackgroundRectangle.Fill.Color);
  FocusedBackgroundRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

procedure TMainForm.FocusFrameRadioButtonClick(Sender: TObject);
begin
  SetColor(FocusedBackgroundRectangle.Stroke.Color);
  FocusFrameRadioButton.IsChecked := true;
  ColorQuadChange(nil);
end;

end.
