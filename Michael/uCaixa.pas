unit uCaixa;

interface

uses
  System.Classes;
  Type
    TCaixa = class
    private

      FSaldoInicial : currency;
      FSaldoAtual   : currency;
      FCaixaAberto  : Boolean;
      FHistorico : TStringList;

      function GetCaixaAberto: Boolean;
      function GetSaldoAtual: currency;
      function GetSaldoInicial: currency;

      procedure SetCaixaAberto(const Value: Boolean);
      procedure SetSaldoAtual(const Value: currency);
      procedure SetSaldoInicial(const Value: currency);
      function GetHitorisco: TStringList;
      procedure SetHistorico(const Value: TStringList);

    public

      property SaldoInicial : currency read GetSaldoInicial write SetSaldoInicial;
      property SaldoAtual   : currency read GetSaldoAtual write SetSaldoAtual;
      property CaixaAberto  : Boolean read GetCaixaAberto write SetCaixaAberto;
      property Historico    : TStringList read GetHitorisco write SetHistorico;

      procedure AbrirCaixa(const aValor : currency);
      procedure RetirarValor(const aValor : currency);
      procedure AdicionarValor(const aValor : currency);
      procedure FecharCaixa ;

      constructor Create;
      destructor Destroy; override;

    end;

implementation
uses
   Sysutils;

procedure TCaixa.AbrirCaixa(const aValor : currency);
begin
  if CaixaAberto = true then
    raise Exception.Create(' O Caixa já está aberto !! ');

  if aValor < 0  = true then
    raise Exception.Create(' Voce Precisa Iniciar com Valor positivo ');


  SaldoInicial := aValor;
  SaldoAtual := aValor;
  CaixaAberto := true;
  FHistorico.Add( 'Caixa aberto com : ' +CurrToStr(SaldoInicial));

end;


procedure TCaixa.AdicionarValor(const aValor: currency);
begin
  if FCaixaAberto = False then
    raise Exception.Create(' O Caixa não foi Aberto! ');

  SaldoAtual := SaldoAtual + aValor;
  FHistorico.Add( 'Foi Adicionado : ' +CurrToStr(aValor));
end;


constructor TCaixa.Create;
begin
  FHistorico := TStringList.Create;
end;

destructor TCaixa.Destroy;
begin
  FreeAndNil(FHistorico);
  inherited;
end;

procedure TCaixa.FecharCaixa;
begin
  if CaixaAberto = false then
    raise Exception.Create(' O Caixa não foi aberto !! ');

  CaixaAberto := false;
  FHistorico.Add( 'Caixa Fechado com : ' +CurrToStr(SaldoAtual));
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
 Result := FCaixaAberto;
end;

function TCaixa.GetHitorisco: TStringList;
begin
  Result := FHistorico;
end;

function TCaixa.GetSaldoAtual: currency;
begin
  if FCaixaAberto = False then
    raise Exception.Create(' O Caixa não foi Aberto! ');

  Result := FSaldoAtual;
end;

function TCaixa.GetSaldoInicial: currency;
begin
  Result := FSaldoInicial;
end;

procedure TCaixa.RetirarValor(const aValor: currency);
begin
  if FCaixaAberto = False then
    raise Exception.Create(' O Caixa não foi Aberto! ');

  if SaldoAtual - aValor < 0 then
    raise Exception.Create(' Você não tem esse valor em caixa! Caixa Atual : '
                            +CurrToStr(SaldoAtual));

  SaldoAtual := SaldoAtual - aValor;
  FHistorico.Add( 'Foi Retirado : ' +CurrToStr(aValor));
end;

procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetHistorico(const Value: TStringList);
begin
  FHistorico := Value;
end;

procedure TCaixa.SetSaldoAtual(const Value: currency);
begin
  FSaldoAtual := Value;
end;

procedure TCaixa.SetSaldoInicial(const Value: currency);
begin
  FSaldoInicial := Value;
end;

end.
