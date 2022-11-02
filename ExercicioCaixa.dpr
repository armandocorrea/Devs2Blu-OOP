program ExercicioCaixa;

uses
  Vcl.Forms,
  ExercicioFinal in 'ExercicioFinal.pas' {Form1},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
