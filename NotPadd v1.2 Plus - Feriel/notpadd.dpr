program notpadd;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Uni_about in 'Uni_about.pas' {frm_about},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrm_about, frm_about);
  Application.Run;
end.
