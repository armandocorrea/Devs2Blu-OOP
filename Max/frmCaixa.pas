unit frmCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, UCaixa, Vcl.Mask;

type
  TfrmFormCaixa = class(TForm)
    pnlResult: TPanel;
    lbMiniResult: TLabel;
    edtValor: TEdit;
    lbValor: TLabel;
    Image1: TImage;
    lbTittle: TLabel;
    btnCreate: TButton;
    btnLogs: TButton;
    btnAdicionarValor: TButton;
    btnRetirar: TButton;
    memResultLog: TMemo;
    shpStatusCaixa: TShape;
    lbStatus: TLabel;
    lbStatusValue: TLabel;
    procedure btnCreateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure shpStatusCaixaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAdicionarValorClick(Sender: TObject);
    procedure btnLogsClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
  private
    FCaixa : TCaixa;
    procedure iniciarCaixa;
    procedure atualizarMiniLabel(aResult : String);
    procedure FreeAndNilCaixa;
    procedure toggleCaixa;
    procedure adicionarValor;
    procedure retirarValor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormCaixa: TfrmFormCaixa;

implementation

{$R *.dfm}

procedure TfrmFormCaixa.adicionarValor;
var
  xValor : Double;
begin
  xValor := StrToFloatDef(edtValor.Text,0);
  FCaixa.adicionarValor(xValor);

  lbMiniResult.Caption := Format('Entrada de R$ %s',[FormatFloat('0.00',xValor)]);
end;

procedure TfrmFormCaixa.atualizarMiniLabel(aResult: String);
begin
  lbMiniResult.Caption := aResult;
end;

procedure TfrmFormCaixa.btnAdicionarValorClick(Sender: TObject);
begin
  if not Assigned(FCaixa) then
  begin
    ShowMessage('Caixa não iniciado.');
    Exit;
  end;
  adicionarValor;
end;

procedure TfrmFormCaixa.btnCreateClick(Sender: TObject);
begin
  if Assigned(FCaixa) then
  begin
    ShowMessage('O caixa já foi iniciado.');
    Exit;
  end;
  iniciarCaixa;
  atualizarMiniLabel('Caixa aberto.');
end;

procedure TfrmFormCaixa.btnLogsClick(Sender: TObject);
var
  xLog : String;
begin
  if not Assigned(FCaixa) then
  begin
    ShowMessage('Caixa não iniciado.');
    Exit;
  end;
  xLog := FCaixa.consultarLog;
  memResultLog.Clear;
  memResultLog.Lines.Add(xLog);
end;

procedure TfrmFormCaixa.btnRetirarClick(Sender: TObject);
begin
  if not Assigned(FCaixa) then
  begin
    ShowMessage('Caixa não iniciado.');
    Exit;
  end;
  retirarValor;
end;

procedure TfrmFormCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FCaixa) then
    FreeAndNilCaixa;
end;

procedure TfrmFormCaixa.FreeAndNilCaixa;
begin
  FreeAndNil(FCaixa);
end;

procedure TfrmFormCaixa.iniciarCaixa;
begin
  if Assigned(FCaixa) then
    FreeAndNilCaixa;

  FCaixa := TCaixa.Create();
  shpStatusCaixa.Brush.Color := clGreen;
  lbStatusValue.Caption := 'Caixa aberto'
end;

procedure TfrmFormCaixa.retirarValor;
var
  xValorRetirada : Double;
begin
  xValorRetirada := StrToFloatDef(edtValor.Text,0);
  FCaixa.retirarValor(xValorRetirada);
  lbMiniResult.Caption := Format('Retirada de R$ %s',[FormatFloat('0.00',xValorRetirada)]);
end;

procedure TfrmFormCaixa.shpStatusCaixaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  toggleCaixa;
end;

procedure TfrmFormCaixa.toggleCaixa;
begin
  if not Assigned(FCaixa) then
    Exit;

  if FCaixa.caixaAberto then
  begin
    shpStatusCaixa.Brush.Color := clMaroon;
    FCaixa.fecharCaixa;
    atualizarMiniLabel('Caixa fechado.');
    lbStatusValue.Caption := 'Caixa fechado';
  end
  else
  begin
    shpStatusCaixa.Brush.Color := clGreen;
    FCaixa.abrirCaixa;
    atualizarMiniLabel('Caixa aberto.');
    lbStatusValue.Caption := 'Caixa aberto';
  end;
end;

end.
