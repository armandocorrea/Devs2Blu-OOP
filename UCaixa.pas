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
=======
TCaixa = class
private
   FCaixaAberto  : Boolean;
   FSaldoInicial : Double;
   FSaldoFinal   : Double;
    function GetCaixaAberto: Boolean;
    function GetSaldoFInal: Double;
    function GetSaldoInicial: Double;
    procedure SetSaldoFinal(const Value: Double);
    procedure SetValorInicial(const Value: Double);
    procedure SetCaixaAberto(const Value: Boolean);
public
  procedure AbrirCaixa;
  procedure FecharCaixa;
  function RetirarValor(aValorRetirada : Double) : Double;
  function AdicionarValor(aValorAdicionado : Double) : Double;


  property CaixaAberto  : Boolean read GetCaixaAberto  write SetCaixaAberto;
  property SaldoInicial : Double  read GetSaldoInicial write SetValorInicial;
  property SaldoFinal   : Double  read GetSaldoFInal   write SetSaldoFinal;

  constructor Create (const CaixaAberto : Boolean = False;
                      const SaldoInicial: Double  = 0);
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
=======
  System.SysUtils;

{ TCaixa }

procedure TCaixa.AbrirCaixa;
begin
  if CaixaAberto then
    raise Exception.Create('Caixa já está aberto');

  FCaixaAberto := True;
end;

function TCaixa.AdicionarValor(aValorAdicionado: Double): Double;
begin
  if aValorAdicionado < 0 then
    raise Exception.Create('Digite um valor maior que 0');

  SaldoFinal := (SaldoFinal + aValorAdicionado);
  result     := SaldoFinal;
end;

constructor TCaixa.Create(const CaixaAberto : Boolean = False;
                      const SaldoInicial: Double  = 0);
begin
   FCaixaAberto  := CaixaAberto;
   FSaldoInicial := SaldoInicial;
   FSaldoFinal   := SaldoFinal;
end;

procedure TCaixa.FecharCaixa;
begin
  if not CaixaAberto then
    raise Exception.Create('Caixa já está fechado');

  FCaixaAberto := False;
end;


function TCaixa.RetirarValor(aValorRetirada: Double): Double;
begin
  if aValorRetirada > SaldoFinal then
    raise Exception.Create('Não é possível retirar mais do que há no caixa');

  SaldoFinal := SaldoFinal - aValorRetirada;
  result     := SaldoFinal;
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
  result := FCaixaAberto;
end;

function TCaixa.GetSaldoFInal: Double;
begin
  result := FSaldoFinal;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  result := FSaldoInicial
end;


procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetSaldoFinal(const Value: Double);
begin
  FSaldoFinal := Value;
end;

procedure TCaixa.SetValorInicial(const Value: Double);
begin
  FSaldoInicial := Value;
end;

end.
