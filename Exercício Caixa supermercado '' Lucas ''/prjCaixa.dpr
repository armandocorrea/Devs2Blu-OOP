program prjCaixa;

uses
  Vcl.Forms,
  ProjetoCaixaSupermercado in 'ProjetoCaixaSupermercado.pas' {Form1},
  Ucaixa in 'Ucaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
