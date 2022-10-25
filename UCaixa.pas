unit UCaixa;

interface

type

  TOpcoes = (stAbrirCaixa, stSuprimento, stSangria, stSaldoAtual,
    stFecharCaixa);

  TCaixa = class
  private
    FSaldoInicial: Double;
    FSaldoAtual: Double;
    FCaixaAberto: Boolean;

  public
    function AbrirCaixa(aValor: String): String;
    function RetirarValor(aValor: String): String;
    function AdicionarValor(aValor: String): String;
    function SaldoAtual: String;
    function FecharCaixa: String;

  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TCaixa }

function TCaixa.AbrirCaixa(aValor: String): String;

begin
  if FCaixaAberto = True then
  begin
    raise Exception.Create('O Caixa já está Aberto.');
  end;

  if not TryStrToFloat(aValor, FSaldoAtual) then
  begin
    raise Exception.Create('Informe um Valor Válido para abrir o Caixa.');
  end;

  FCaixaAberto := True;

  Result := 'O caixa foi aberto com o valor de R$:' +
    FormatFloat('0.00', FSaldoAtual);

end;

function TCaixa.AdicionarValor(aValor: String): String;
var
  xValor: Double;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa não foi Aberto.');
  end;

  if not TryStrToFloat(aValor, xValor) then
  begin
    raise Exception.Create('Informe um valor válido.');
  end;

  FSaldoAtual := FSaldoAtual + xValor;
  Result := 'Foi adicionado ao Caixa: R$' + FormatFloat('0.00', xValor);
end;

function TCaixa.RetirarValor(aValor: String): String;
var
  xValor: Double;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa não foi Aberto.');
  end;

  if not TryStrToFloat(aValor, xValor) then
  begin
    raise Exception.Create('Informe um valor válido para Retirada.');
  end;

  FSaldoAtual := FSaldoAtual - xValor;
  Result := 'Foi Retirado do Caixa: R$' + FormatFloat('0.00', xValor);
end;

function TCaixa.SaldoAtual: String;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa não foi Aberto.');
  end;

  Result := 'O Saldo atual é de R$' + FormatFloat('0.00', FSaldoAtual);
end;

function TCaixa.FecharCaixa: String;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa não está Aberto.');
  end;

  Result := 'O Valor final do caixa é de: R$' + FormatFloat('0.00',
    FSaldoAtual);

    FCaixaAberto := False;
end;

end.
