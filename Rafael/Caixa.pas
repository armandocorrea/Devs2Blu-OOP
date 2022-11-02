unit Caixa;

interface

uses
System.SysUtils;

type

  TCaixa = class
    FSaldoInicial: Double;
    FSaldoAtual:   Double;
    FCaixaAberto:  Boolean;

    private

      function GetCaixaAberto:  Boolean;
      function GetSaldoAtual:   Double;
      function GetSaldoInicial: Double;

      procedure SetCaixaAberto  (const Value: Boolean);
      procedure SetSaldoAtual   (const Value: Double);
      procedure SetSaldoInicial (const Value: Double);

    public

      procedure AbrirCaixa     (aAbrir: Double);
      procedure RetirarValor   (aRetirar: Double);
      procedure AdicionarValor (aAdicionar: Double);
      procedure FecharCaixa;

      function EnviarSaldo: Double;

      property SaldoInicial: Double  read GetSaldoInicial write SetSaldoInicial;
      property SaldoAtual:   Double  read GetSaldoAtual   write SetSaldoAtual;
      property CaixaAberto:  Boolean read GetCaixaAberto  write SetCaixaAberto;

  end;

implementation

{ TCaixa }


procedure TCaixa.AbrirCaixa(aAbrir: Double);
begin
  if FCaixaAberto then
    raise Exception.Create('Caixa já está aberto.')
  else
    begin
      FCaixaAberto := True;
      FSaldoAtual:= FSaldoAtual + aAbrir;
      FSaldoInicial:= aAbrir;
    end;

end;

procedure TCaixa.AdicionarValor(aAdicionar: Double);
begin
  if Not FCaixaAberto then
    raise Exception.Create('Abra o caixa primeiro.')
  else
    FSaldoAtual:= FSaldoAtual + aAdicionar;
end;

function TCaixa.EnviarSaldo: Double;
begin
  if Not FCaixaAberto then
    raise Exception.Create('Abra o caixa primeiro.')
  else
    Result := FSaldoAtual;
end;

procedure TCaixa.FecharCaixa;
begin
  if Not FCaixaAberto then
    raise Exception.Create('Abra o caixa primeiro.')
  else
    FCaixaAberto := False;
end;

procedure TCaixa.RetirarValor(aRetirar: Double);
begin
  if Not FCaixaAberto then
    raise Exception.Create('Abra o caixa primeiro.')
  else
  FSaldoAtual := FSaldoAtual - aRetirar;
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

procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetSaldoAtual(const Value: Double);
begin
  FSaldoAtual := Value;
end;

procedure TCaixa.SetSaldoInicial(const Value: Double);
begin
  FSaldoInicial := Value;
end;

end.
