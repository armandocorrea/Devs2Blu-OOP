program CaixadeSupermercado;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  Caixa in 'Caixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
