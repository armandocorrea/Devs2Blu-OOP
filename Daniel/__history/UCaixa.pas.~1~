unit UCaixa;

interface

uses
System.SysUtils;

type

TCaixa = class
  private
    fSaldoInicial: Double;
    fSaldoAtual: Double;
    fCaixaAberto: boolean;
    function getCaixaAberto: boolean;
    function getSaldoAtual: double;
    function getSaldoInicial: double;
  public
    property SaldoInicial: double read getSaldoInicial;
    property SaldoAtual: double read getSaldoAtual;
    property CaixaAberto: boolean read getCaixaAberto;
    procedure ChecaCaixaAberto;
    procedure ChecaCaixaFechado;
    procedure ChecaValor(pValorVerificado: double);
    procedure AbreCaixa(pValorInicial: double);
    procedure RetiraValor(pValorRetirado: double);
    procedure AdicionaValor(pValorAdicionado: double);
    procedure FechaCaixa;
end;

implementation

{ TCaixa }

procedure TCaixa.AbreCaixa(pValorInicial: double);
begin
  ChecaCaixaAberto;
  ChecaValor(pValorInicial);
  fCaixaAberto := true;
  fSaldoInicial := pValorInicial;
  fSaldoAtual := fSaldoInicial;
end;

procedure TCaixa.AdicionaValor(pValorAdicionado: double);
begin
  ChecaCaixaFechado;
  ChecaValor(pValorAdicionado);
  fSaldoAtual := fSaldoAtual + pValorAdicionado;
end;

procedure TCaixa.ChecaCaixaAberto;
begin
  if fCaixaAberto = true then
    raise Exception.Create('Erro. O caixa já está aberto.');
end;

procedure TCaixa.ChecaCaixaFechado;
begin
  if fCaixaAberto = false then
    raise Exception.Create('Erro. O caixa está fechado.');
end;

procedure TCaixa.ChecaValor(pValorVerificado: double);
begin
  if pValorVerificado <= 0 then
    raise Exception.Create('Erro. Valor inválido');
end;

procedure TCaixa.FechaCaixa;
begin
  ChecaCaixaFechado;
  fCaixaAberto := false;
end;

function TCaixa.getCaixaAberto: boolean;
begin
  Result := fCaixaAberto;
end;

function TCaixa.getSaldoAtual: double;
begin
  Result := fSaldoAtual;
end;

function TCaixa.getSaldoInicial: double;
begin
  Result := fSaldoInicial;
end;

procedure TCaixa.RetiraValor(pValorRetirado: double);
var
  xSaldoAtual: double;
begin
  ChecaCaixaFechado;
  ChecaValor(pValorRetirado);

  xSaldoAtual := fSaldoAtual - pValorRetirado;

  if xSaldoAtual < 0 then
    raise Exception.Create('Erro. Saldo indisponível.');
  fSaldoAtual := xSaldoAtual;
end;

end.
