unit UCaixa;

interface

type
  TCaixa = class
    private
      FSaldoInicial : Double;
      FSaldoAtual   : Double;
      FCaixaAberto  : Boolean;
    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;
    procedure SetSaldo_Atual(const Value: Double);
    procedure SetSaldo_Inicial(const Value: Double);

    public
      property Saldo_Inicial : Double Read GetSaldoInicial write SetSaldo_Inicial;
      property Saldo_Atual : Double Read GetSaldoAtual write SetSaldo_Atual;
      property Caixa_Aberto : Boolean Read GetCaixaAberto;

      procedure AbrirCaixa;
      procedure FecharCaixa;
      procedure RetirarValor(aValorPassado : Double);
      procedure AdicionarValor(aValorPassado : Double);

  end;

implementation

{ TCaixa }

procedure TCaixa.AbrirCaixa;
begin
  FCaixaAberto := True;
end;

procedure TCaixa.AdicionarValor(aValorPassado: Double);
begin
  FSaldoAtual := FSaldoAtual + aValorPassado;
end;

procedure TCaixa.FecharCaixa;
begin
  FCaixaAberto := False;
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

procedure TCaixa.RetirarValor(aValorPassado: Double);
begin
  FSaldoAtual := FSaldoAtual - aValorPassado;
end;

procedure TCaixa.SetSaldo_Atual(const Value: Double);
begin
  FSaldoAtual := value;
end;

procedure TCaixa.SetSaldo_Inicial(const Value: Double);
begin
  FSaldoInicial := value;
end;

end.
