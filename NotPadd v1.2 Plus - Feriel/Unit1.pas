unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.ExtDlgs, ClipBrd, ShellApi;

type
  TForm1 = class(TForm)
    Pan_all: TPanel;
    Pan_reght: TPanel;
    Pan_left: TPanel;
    Pane_top: TPanel;
    btn_fonts: TButton;
    btn_color: TButton;
    btn_about: TButton;
    RadioGroup1: TRadioGroup;
    Radiobtn_right: TRadioButton;
    Radiobtn_center: TRadioButton;
    Radiobtn_left: TRadioButton;
    RadioGroup2: TRadioGroup;
    btn_open: TButton;
    btn_save: TButton;
    btn_copy: TButton;
    btn_cut: TButton;
    Radiobtn_bold: TRadioButton;
    Radiobtn_italic: TRadioButton;
    Radiobtn_underline: TRadioButton;
    Label1: TLabel;
    Labe_date: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    img_facebook: TImage;
    img_twiter: TImage;
    img_youtube: TImage;
    img_calculatrice: TImage;
    Label2: TLabel;
    Labe_time: TLabel;
    RichEdit1: TRichEdit;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    btn_paste: TButton;
    btn_slectAll: TButton;
    btn_clear: TButton;

    procedure Timer1Timer(Sender: TObject);
    procedure img_calculatriceClick(Sender: TObject);
    procedure btn_colorClick(Sender: TObject);
    procedure btn_fontsClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_openClick(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);

    procedure btn_aboutClick(Sender: TObject);
    procedure btn_copyClick(Sender: TObject);
    procedure btn_pasteClick(Sender: TObject);
    procedure btn_slectAllClick(Sender: TObject);
    procedure btn_cutClick(Sender: TObject);
    procedure Radiobtn_boldClick(Sender: TObject);
    procedure Radiobtn_italicClick(Sender: TObject);
    procedure Radiobtn_underlineClick(Sender: TObject);
    procedure Radiobtn_rightClick(Sender: TObject);
    procedure Radiobtn_leftClick(Sender: TObject);
    procedure Radiobtn_centerClick(Sender: TObject);
    procedure img_facebookClick(Sender: TObject);
    procedure img_youtubeClick(Sender: TObject);
    procedure img_twiterClick(Sender: TObject);


  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Uni_about;







procedure TForm1.btn_aboutClick(Sender: TObject);
begin
  frm_about.ShowModal ;
end;

procedure TForm1.btn_clearClick(Sender: TObject);
begin
 RichEdit1.Lines.Clear ;
end;

procedure TForm1.btn_colorClick(Sender: TObject);
begin
 If ColorDialog1.Execute Then
   RichEdit1.SelAttributes.Color := ColorDialog1.Color;
end;



procedure TForm1.btn_copyClick(Sender: TObject);
begin
 // ClipBrd  ����  ���� ����� ��� ����� ����� ����
    RichEdit1.CopyToClipboard;
end;

procedure TForm1.btn_cutClick(Sender: TObject);
begin
 // ClipBrd  ����  ���� ����� ��� ����� ����� ����
  RichEdit1.CutToClipboard;
end;

procedure TForm1.btn_fontsClick(Sender: TObject);
begin
  If FontDialog1.Execute Then
    with RichEdit1 do
      begin
       SelAttributes.Name := FontDialog1.Font.Name ;
       SelAttributes.Color := FontDialog1.Font.Color ;
       SelAttributes.Style := FontDialog1.Font.Style ;
       SelAttributes.Size := FontDialog1.Font.Size ;
      end;
end;

procedure TForm1.btn_openClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
   if FileExists(OpenDialog1.FileName) then
     RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('����� ��� �����...');
end;

procedure TForm1.btn_pasteClick(Sender: TObject);
begin
 // ClipBrd  ����  ���� ����� ��� ����� ����� ����
 RichEdit1.PasteFromClipboard;
end;

procedure TForm1.btn_saveClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
   if FileExists(SaveDialog1.FileName) then
      raise Exception.Create('����� ����� ��� .. �� ������ ����� ����� ��� �����')
   else
      RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);

end;

procedure TForm1.btn_slectAllClick(Sender: TObject);
begin
 // ClipBrd  ����  ���� ����� ��� ����� ����� ����
    RichEdit1.SelectAll;
    RichEdit1.CopyToClipboard;
end;

procedure TForm1.img_calculatriceClick(Sender: TObject);
begin
  // ��� ������� ������ ������� ������ �������
  Winexec('calc.exe',sw_shownormal);
end;

procedure TForm1.img_facebookClick(Sender: TObject);
begin
 // ShellApi  ����  ���� ����� ��� ����� ����� ����
  ShellExecute(Handle,'open','https://www.facebook.com', nil, nil, SW_SHOW);
end;

procedure TForm1.img_twiterClick(Sender: TObject);
begin
 // ShellApi  ����  ���� ����� ��� ����� ����� ����
 ShellExecute(Handle,'open','https://twitter.com/?lang=fr', nil, nil, SW_SHOW);
end;

procedure TForm1.img_youtubeClick(Sender: TObject);
begin
 // ShellApi  ����  ���� ����� ��� ����� ����� ����
  ShellExecute(Handle,'open','https://www.youtube.com/', nil, nil, SW_SHOW);
end;

procedure TForm1.Radiobtn_boldClick(Sender: TObject);
begin
 if Radiobtn_bold.Checked then
   RichEdit1.SelAttributes.Style := [fsBold] ;
end;

procedure TForm1.Radiobtn_centerClick(Sender: TObject);
begin
if Radiobtn_center.Checked then
   RichEdit1.Paragraph.Alignment := taCenter ;
end;

procedure TForm1.Radiobtn_italicClick(Sender: TObject);
begin
 if Radiobtn_italic.Checked then
   RichEdit1.SelAttributes.Style := [fsItalic];
end;

procedure TForm1.Radiobtn_leftClick(Sender: TObject);
begin
 if Radiobtn_left.Checked then
   RichEdit1.Paragraph.Alignment := taLeftJustify ;
end;

procedure TForm1.Radiobtn_rightClick(Sender: TObject);
begin
if Radiobtn_right.Checked then
   RichEdit1.Paragraph.Alignment := taRightJustify ;
end;

procedure TForm1.Radiobtn_underlineClick(Sender: TObject);
begin
 if Radiobtn_underline.Checked then
   RichEdit1.SelAttributes.Style := [fsUnderline];

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Labe_time.Caption := FormatDateTime(' hh : mm : ss ' ,Now) ;
   Labe_date.Caption := FormatDateTime ('dd - mm - yyyy',Now) ;
end;

end.
