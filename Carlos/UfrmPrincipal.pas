unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, UCaixa;

type
  TEnumOpcoes = (opAbrirCaixa, opSuprimento, opSangria, opSaldoAtual,
    opFecharCaixa);

  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    rdgOpcoes: TRadioGroup;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    lblResultado: TLabel;
    mmHistorico: TMemo;
    Image1: TImage;
    Image2: TImage;
    procedure btnExecutarClick(Sender: TObject);
    procedure rdgOpcoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa: TCaixa;

    procedure Opcoes;
    procedure Abrir;
    procedure Suprimento;
    procedure Sangria;
    procedure Saldo;
    procedure Fechar;
    procedure ExibirHistorico;
    procedure EnableValor;

  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}
{ TfrmPrincipal }


//Eventos:

procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
begin
  Self.Opcoes;
end;

procedure TfrmPrincipal.btnExibirClick(Sender: TObject);
begin
  Self.ExibirHistorico;
end;

procedure TfrmPrincipal.rdgOpcoesClick(Sender: TObject);
begin
  Self.EnableValor;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;


//Procedures:

procedure TfrmPrincipal.Opcoes;
begin

  case TEnumOpcoes(rdgOpcoes.ItemIndex) of
    opAbrirCaixa:
      Self.Abrir;
    opSuprimento:
      Self.Suprimento;
    opSangria:
      Self.Sangria;
    opSaldoAtual:
      Self.Saldo;
    opFecharCaixa:
      Self.Fechar;
    else
      raise Exception.Create('Selecione uma opção!');
  end;

end;

procedure TfrmPrincipal.Abrir;
var
  xValorStr: String;
  xValor: Double;
begin
  xValorStr := edtValor.Text;
  mmHistorico.Visible := False;

  if not assigned(FCaixa) then
  begin
    FCaixa := TCaixa.Create;
  end;

  if FCaixa.CaixaAberto then
    raise Exception.Create('O Caixa já está aberto!')
  else
  begin
    if not TryStrToFloat(xValorStr, xValor) then
      raise Exception.Create('Valor inválido!')
    else
      lblResultado.Caption := 'O Caixa foi aberto e o saldo é: ' +
        FormatFloat('R$ #######0.00 ', FCaixa.AbrirCaixa(xValor));
  end;

end;

procedure TfrmPrincipal.Suprimento;
var
  xValorStr: String;
  xValor: Double;
begin
  xValorStr := edtValor.Text;

  if not assigned(FCaixa) or not FCaixa.CaixaAberto then
    raise Exception.Create('É necessário abrir o caixa primeiro!')
  else
  begin
    if not TryStrToFloat(xValorStr, xValor) then
      raise Exception.Create('Valor inválido!')
    else
      lblResultado.Caption := 'Foi adicionado ' + FormatFloat('R$ #######0.00',
        xValor) + '. O Saldo Atual é ' + FormatFloat('R$ #######0.00 ',
        FCaixa.AdicionarValor(xValor));
  end;

end;

procedure TfrmPrincipal.Sangria;
var
  xValorStr: String;
  xValor: Double;
begin
  xValorStr := edtValor.Text;

  if not assigned(FCaixa) or not FCaixa.CaixaAberto then
    raise Exception.Create('É necessário abrir o caixa primeiro!')
  else
  begin
    if not TryStrToFloat(xValorStr, xValor) then
      raise Exception.Create('Valor inválido!')
    else
      lblResultado.Caption := 'Foi retirado  ' + FormatFloat('R$ #######0.00',
        xValor) + '. O Saldo Atual é ' + FormatFloat('R$ #######0.00 ',
        FCaixa.RetirarValor(xValor));
  end;
end;

procedure TfrmPrincipal.Saldo;
begin
  if not assigned(FCaixa) or not FCaixa.CaixaAberto then
    raise Exception.Create('É necessário abrir o caixa primeiro!')
  else
    lblResultado.Caption := 'O Saldo atual é: ' + FormatFloat('R$ #######0.00 ',
      FCaixa.SaldoAtual);
end;

procedure TfrmPrincipal.Fechar;
begin
  if not assigned(FCaixa) or not FCaixa.CaixaAberto then
    raise Exception.Create('É necessário abrir o caixa primeiro!')
  else
    lblResultado.Caption := 'O Caixa foi fechado com saldo de: ' +
      FormatFloat('R$ #######0.00 ', FCaixa.FecharCaixa);
end;

procedure TfrmPrincipal.EnableValor;
begin
  if (TEnumOpcoes(rdgOpcoes.ItemIndex) = opSaldoAtual) or
    (TEnumOpcoes(rdgOpcoes.ItemIndex) = opFecharCaixa) then
  begin
    edtValor.Text := '';
    edtValor.Enabled := False;
  end
  else
    edtValor.Enabled := True;
end;

procedure TfrmPrincipal.ExibirHistorico;
begin
  mmHistorico.lines.Clear;
  mmHistorico.Visible := True;
  mmHistorico.lines.AddStrings(FCaixa.Historico);
end;


// Close:

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

end.
