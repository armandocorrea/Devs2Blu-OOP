program Project2;

uses
  Vcl.Forms,
  UAvaliação in 'UAvaliação.pas' {Form2},
  Ucaixa in 'Ucaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
