program Proji;

uses
  Vcl.Forms,
  main_form in 'main_form.pas' {Form1},
  forunit2 in 'forunit2.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
