program projCaixa;

uses
  Vcl.Forms,
  frmCaixa in 'frmCaixa.pas' {frmFormCaixa},
  UCaixa in 'UCaixa.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFormCaixa, frmFormCaixa);
  Application.Run;
end.
