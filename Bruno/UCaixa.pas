unit UCaixa;



interface

uses
  SysUtils;

type
  TEnumOpcoes = (stAbrir, stSuprimento, stSangria, stSaldo, stFechar);

  TCaixa = class
    private
      FSaldoInicial : double;
      FSaldoAtual   : double;
      FCaixaAberto  : boolean;

      function GetCaixaAberto: boolean;
      function GetSaldoAtual: double;
      function GetSaldoInicial: double;

      procedure SetCaixaAberto(const Value: boolean);
      procedure SetSaldoAtual(const Value: double);
      procedure SetSaldoInicial(const Value: double);

    public
      property SaldoInicial : double read GetSaldoInicial write SetSaldoInicial;
      property SaldoAtual   : double read GetSaldoAtual write SetSaldoAtual;
      property CaixaAberto  : boolean read GetCaixaAberto write SetCaixaAberto;

      procedure AbrirCaixa(aValorInicial : double);
      procedure RetirarValor(aValor : double);
      procedure AdicionarValor(aValor : double);
      procedure FecharCaixa;
      procedure Saldo;

      constructor Create(const aSaldoInicial: double; aCaixaAberto : boolean);
  end;

implementation

{ TCaixa }

function TCaixa.GetCaixaAberto: boolean;
begin
  Result := FCaixaAberto
end;

function TCaixa.GetSaldoAtual: double;
begin
  Result := FSaldoAtual
end;

function TCaixa.GetSaldoInicial: double;
begin
  Result := FSaldoInicial
end;

procedure TCaixa.SetCaixaAberto(const Value: boolean);
begin
  FCaixaAberto := Value
end;

procedure TCaixa.SetSaldoAtual(const Value: double);
begin
  FSaldoAtual := Value
end;

procedure TCaixa.SetSaldoInicial(const Value: double);
begin
  FSaldoInicial := Value
end;

procedure TCaixa.AbrirCaixa(aValorInicial: double);
begin
  if FCaixaAberto = true then
    raise Exception.Create('O caixa já está aberto!')
  else
    begin
      FCaixaAberto  := true;
      FSaldoInicial := aValorInicial;
      FSaldoAtual   := FSaldoInicial
    end;
end;

procedure TCaixa.RetirarValor(aValor: double);
begin
  if FCaixaAberto = false then
    raise Exception.Create('O caixa ainda não foi aberto')
  else if aValor > FSaldoAtual then
    raise Exception.Create('Valor de retirada maior que o saldo em caixa!')
      else
        FSaldoAtual := FSaldoAtual - aValor
end;

procedure TCaixa.AdicionarValor(aValor: double);
begin
  if FCaixaAberto = false then
    raise Exception.Create('O caixa ainda não foi aberto')
  else
    FSaldoAtual := FSaldoAtual + aValor
end;

procedure TCaixa.Saldo;
begin
  if FCaixaAberto = false then
    raise Exception.Create('O caixa ainda não foi aberto')
end;

procedure TCaixa.FecharCaixa;
begin
  if FCaixaAberto = false then
    raise Exception.Create('O caixa ainda não foi aberto')
  else FCaixaAberto := False
end;

constructor TCaixa.Create(const aSaldoInicial: double;
  aCaixaAberto: boolean);
begin
  FSaldoInicial := aSaldoInicial;
  FCaixaAberto  := aCaixaAberto;
  FSaldoAtual   := FSaldoInicial;
end;

end.
