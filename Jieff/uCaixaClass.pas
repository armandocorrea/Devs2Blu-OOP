unit uCaixaClass;

interface

type

  TCaixa = class

    private

      FSaldoInicial : double;
      FSaldoAtual : double;
      FCaixaAberto : boolean;

      function getCaixaAberto: boolean;
      function getSaldoAtual: double;
      function getSaldoInicial: double;

      procedure setCaixaAberto(const Value: boolean);
      procedure setSaldoAtual(const Value: double);
      procedure setSaldoInicial(const Value: double);

    public

      property saldoIncial : double read getSaldoInicial write setSaldoInicial;
      property saldoAtual : double read getSaldoAtual write setSaldoAtual;
      property caixaAberto : boolean read getCaixaAberto write setCaixaAberto;

      procedure abrirCaixa ( aAbrirCaixa : boolean);
      procedure adicionarDinheiro ( aAdicionarDinheiro : double);
      procedure retirarDinheiro ( aRetirarDinheiro : double);
      procedure exibirSaldoAtual ( aExibirSaldoAtual : double);
      procedure fecharCaixa (aFecharCaixa : boolean);

  end;

implementation

{ TCaixa }

procedure TCaixa.abrirCaixa(aAbrirCaixa: boolean);
begin
   FCaixaAberto := aAbrirCaixa;
end;

procedure TCaixa.adicionarDinheiro(aAdicionarDinheiro: double);
begin
    FSaldoAtual := FSaldoAtual + aAdicionarDinheiro;
end;

procedure TCaixa.exibirSaldoAtual(aExibirSaldoAtual: double);
begin
   FSaldoAtual := FSaldoAtual;
end;

procedure TCaixa.fecharCaixa(aFecharCaixa: boolean);
begin
   FCaixaAberto := aFecharCaixa;
end;

function TCaixa.getCaixaAberto: boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.getSaldoAtual: double;
begin
  Result := FSaldoAtual;
end;

function TCaixa.getSaldoInicial: double;
begin
  Result := FSaldoInicial;
end;

procedure TCaixa.retirarDinheiro(aRetirarDinheiro: double);
begin
   FSaldoAtual := FSaldoAtual - aRetirarDinheiro;
end;

procedure TCaixa.setCaixaAberto(const Value: boolean);
begin
  FCaixaaberto := Value;
end;

procedure TCaixa.setSaldoAtual(const Value: double);
begin
  FSaldoAtual := Value;
end;

procedure TCaixa.setSaldoInicial(const Value: double);
begin
  FSaldoInicial := Value;
end;

end.
