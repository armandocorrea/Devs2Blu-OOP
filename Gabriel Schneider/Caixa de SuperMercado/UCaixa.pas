unit UCaixa;

interface

type
  TCaixa = class //TObject
    private
      FSaldoInicial : Double;
      FSaldoAtual   : Double;
      FCaixaAberto  : Boolean;
      FRegistros    : String;

      function GetCaixaAberto : Boolean;
      function GetSaldoAtual  : Double;
      function GetSaldoInicial: Double;
      function GetRegistros: String;

      procedure SetCaixaAberto(const Value: Boolean);
      procedure SetSaldoAtual(const Value: Double);
      procedure SetSaldoInicial(const Value: Double);
      procedure SetRegistros(const Value: String);
    public
      function AbrirCaixa(SaldoInicial : Double): String;
      function RetirarValor(Valor : Double)     : String;
      function AdicionarValor(Valor : Double)   : String;
      function MostrarSaldoAtual                : String;
      function FecharCaixa                      : String;

      property SaldoInicial : Double read GetSaldoInicial write SetSaldoInicial;
      property SaldoAtual   : Double read GetSaldoAtual write SetSaldoAtual;
      property CaixaAberto  : Boolean read GetCaixaAberto write SetCaixaAberto;
      property Registros    : String read GetRegistros write SetRegistros;
  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

{Abrir Caixa}
function TCaixa.AbrirCaixa(SaldoInicial : Double): String;
begin
  if FCaixaAberto = True then
    Raise exception.Create('O Caixa ja foi Aberto')

  else if SaldoInicial < 0 then
    Raise exception.Create('Adicione um saldo Inicial válido')

  else if FCaixaAberto = False then
  begin
    FCaixaAberto := True;
    FSaldoAtual := SaldoInicial;
    Result := 'O Caixa foi aberto';
    FRegistros := 'O Caixa foi aberto';
  end

  else
    Raise exception.Create('Erro ao abrir o caixa');
end;

{Adicionar Valor}
function TCaixa.AdicionarValor(Valor : Double): String;
begin
  if Valor <= 0 then
    Raise exception.Create('Valor invalido')

  else if FCaixaAberto = False then
    Raise exception.Create('O Caixa não está aberto')

  else
    begin
      FSaldoAtual := FSaldoAtual + Valor;
      Result := 'Foram adicionados R$: ' + FormatCurr('0.00', Valor) + ' ao caixa';
      FRegistros := FRegistros + #13#10 + 'Foram adicionados R$: ' + FormatCurr('0.00', Valor) + ' ao caixa';
    end;
end;

{Retirar Valor}
function TCaixa.RetirarValor(Valor : Double): String;
begin
  if Valor <= 0 then
    Raise exception.Create('Valor invalido')

  else if FCaixaAberto = False then
    Raise exception.Create('O Caixa não está aberto')

  else if (FSaldoAtual = 0) or (FSaldoAtual < Valor) then
    Raise exception.Create('O Caixa não tem valor suficiente para ser retirado')

  else
  begin
    FSaldoAtual := FSaldoAtual - Valor;
    Result := 'Foram retirados R$: ' + FormatCurr('0.00', Valor) + ' do caixa';
    FRegistros := FRegistros + #13#10 + 'Foram retirados R$: ' + FormatCurr('0.00', Valor) + ' do caixa';
  end;

end;

{Mostrar Saldo}
function TCaixa.MostrarSaldoAtual: String;
begin
  if FCaixaAberto = False then
    Raise exception.Create('O Caixa não está aberto')

  else
  begin
    Result := 'O Saldo atual é de R$: ' + FormatCurr('0.00', FSaldoAtual);
    FRegistros := FRegistros + #13#10 + 'O Saldo atual é de R$: ' + FormatCurr('0.00', FSaldoAtual);
  end;
end;

{Fechar o Caixa}
function TCaixa.FecharCaixa: String;
begin
  if FCaixaAberto = False then
    Raise exception.Create('O Caixa não está aberto')

  else
  begin
    FCaixaAberto := False;
    Result := 'O caixa foi fechado, tinham R$: ' + FormatCurr('0.00', FSaldoAtual) +
              ' restantes em caixa';
    FRegistros := ''; {Quando o caixa é fechado os registros são 'apagados'}
  end;
end;

{Gets}
function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.GetRegistros: String;
begin
  Result := FRegistros;
end;

function TCaixa.GetSaldoAtual: Double;
begin
  Result := FSaldoAtual;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

{Sets}
procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetRegistros(const Value: String);
begin
  FRegistros := Value;
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
