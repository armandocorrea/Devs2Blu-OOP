program Caixa_de_SuperMercado;

uses
  Vcl.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FormPrincipal},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
