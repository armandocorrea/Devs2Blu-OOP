unit uCaixa;

interface

type
  TCaixa = class
  private
    FSaldoInicial: Double;
    FSaldoAtual: Double;
    FCaixaAberto: Boolean;

    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;

    procedure SetCaixaAberto(const pValue: Boolean);
    procedure SetSaldoAtual(const pValue: Double);
    procedure SetSaldoInicial(const pValue: Double);
  public
    property SaldoInicial: Double read GetSaldoInicial write SetSaldoInicial;
    property SaldoAtual: Double read GetSaldoAtual write SetSaldoAtual;
    property CaixaAberto: Boolean read GetCaixaAberto write SetCaixaAberto;

    constructor create(const pValorIncial: Double);

    function AbrirCaixa(const pValorAbrir: Double): Double;
    function RetirarValor(Const pValorRetirar: Double): Double;
    function AdicionarValor(Const pValorAdicinar: Double): Double;
    function FecharCaixa: Boolean;

  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

function TCaixa.AbrirCaixa(const pValorAbrir: Double): Double;
begin
  if FCaixaAberto = True then
    raise Exception.create('O caixa já está aberto.');

  if pValorAbrir >= 0 then
  begin
    FSaldoInicial := pValorAbrir;
    FSaldoAtual := pValorAbrir;
    FCaixaAberto := True;
  end
  else
    raise Exception.create('Não é possível abrir o caixa com valor negativo.');

  if FCaixaAberto = False then
    raise Exception.create('O caixa está fechado.');
end;

function TCaixa.AdicionarValor(const pValorAdicinar: Double): Double;
begin
  if not FCaixaAberto then
    raise Exception.create('Primeiro abra o Caixa!!!');

  FSaldoAtual := FSaldoAtual + pValorAdicinar;
  Result := FSaldoInicial;
end;

constructor TCaixa.create(const pValorIncial: Double);
begin
  FSaldoInicial := pValorIncial;
end;

function TCaixa.RetirarValor(const pValorRetirar: Double): Double;
begin
  if not FCaixaAberto then
    raise Exception.create('Não é possível retirar nenhum valor. ' + #13#10 +
                           'Ultimo fechamento turno com data anterior a atual.' + #13#10 +
                           'Por favor abra um novo turno para ter fundos!!!');

  if FSaldoAtual < 0 then
    raise Exception.create('Não é possível retirar valor acima do total em caixa!!!');

  if pValorRetirar > FSaldoAtual then
    raise Exception.create('Saldo Insuficiente para Resgate.');

    FSaldoAtual := FSaldoAtual - pValorRetirar;
    Result := FSaldoAtual;
end;

function TCaixa.FecharCaixa: Boolean;
begin
  if FCaixaAberto = False then
    raise Exception.create('O caixa está com o turno Fechado, Por favor abra um novo turno.');

  FCaixaAberto := False;
  Result := True;
  FSaldoAtual  := FSaldoAtual;
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.GetSaldoAtual: Double;
begin
  Result := FSaldoAtual;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

procedure TCaixa.SetCaixaAberto(const pValue: Boolean);
begin
  FCaixaAberto := pValue;
end;

procedure TCaixa.SetSaldoAtual(const pValue: Double);
begin
  FSaldoAtual := pValue;
end;

procedure TCaixa.SetSaldoInicial(const pValue: Double);
begin
  FSaldoInicial := pValue;
end;

end.
