program Caixa;

uses
  Vcl.Forms,
  uCaixa in 'uCaixa.pas' {frmCaixa},
  uCaixaClass in 'uCaixaClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCaixa, frmCaixa);
  Application.Run;
end.
