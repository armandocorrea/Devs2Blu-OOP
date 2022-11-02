program Project_Caixa;

uses
  Vcl.Forms,
  Ufrm_principal in 'Ufrm_principal.pas' {Form1},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
