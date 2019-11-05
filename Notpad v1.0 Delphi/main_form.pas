unit main_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnMenus, Vcl.StdActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.WinXPickers, Vcl.ExtCtrls, vcl.themes, vcl.styles;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    FileNew1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    FileOpen1: TFileOpen;
    FileExit1: TFileExit;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);



  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses forunit2;





procedure TForm1.FileNew1Execute(Sender: TObject);
begin
  Application.CreateForm(TForm2 ,Form2 );
  Form2.Caption := 'Sans Titre.txt' ;
end;

procedure TForm1.FileOpen1Accept(Sender: TObject);
begin
 Application.CreateForm(TForm2 , Form2);
   with  Form2   do
    begin
       Caption := FileOpen1.Dialog.FileName ;
       RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
       RichEdit1.Modified := false ;
    end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
 FileNew1Execute(self);
end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Label2.Caption := FormatDateTime('hh:mm:ss' ,Now) ;
   Label1.Caption := FormatDateTime ('dd - mm - yyyy',Now) ;
end;

end.
