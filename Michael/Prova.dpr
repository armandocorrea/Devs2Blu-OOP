program Prova;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  uCaixa in 'uCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
