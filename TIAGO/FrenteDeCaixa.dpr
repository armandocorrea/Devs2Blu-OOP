program FrenteDeCaixa;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmCaixaMercado},
  uCaixa in 'uCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCaixaMercado, FrmCaixaMercado);
  Application.Run;
end.
