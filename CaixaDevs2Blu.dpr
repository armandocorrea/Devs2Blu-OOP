program CaixaDevs2Blu;

uses
  Vcl.Forms,
  frmCaixa in 'frmCaixa.pas' {FormCaixa},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCaixa, FormCaixa);
  Application.Run;
end.
