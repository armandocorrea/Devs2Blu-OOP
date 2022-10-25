program Project3;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form2},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
