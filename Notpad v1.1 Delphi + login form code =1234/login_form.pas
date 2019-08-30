unit login_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Pan_global: TPanel;
    Image1: TImage;
    Edit_PassWrd: TEdit;
    But_entre: TButton;
    But_close: TButton;
    Panel1: TPanel;
    Lab_time: TLabel;
    Lab_date: TLabel;
    Timer1: TTimer;
    Image2: TImage;
    Image3: TImage;
    procedure But_entreClick(Sender: TObject);
    procedure But_closeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);








  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses forunit2, main_form;


procedure TForm3.But_closeClick(Sender: TObject);
begin
  Application.Terminate ;
end;

procedure TForm3.But_entreClick(Sender: TObject);
begin
    if     (Edit_PassWrd.Text='1234')   then
    begin
        Form1.Show;
        Form3.Hide;
    end
          else
         ShowMessage( ' ����� ����� ����� ' );
         Edit_PassWrd.clear ;

end;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  Lab_time.Caption := FormatDateTime('hh:mm:ss' ,Now) ;
  Lab_date.Caption := FormatDateTime ('dd-mm-yyyy',Now) ;
end;





end.


