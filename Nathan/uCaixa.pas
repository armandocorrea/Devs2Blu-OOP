unit uCaixa;

interface

type

  TCaixa = class
  private
    FSaldoInicial, FSaldoAtual: Double;
    FCaixaAberto: Boolean;

    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;

    procedure SetCaixaAberto(const Value: Boolean);
    procedure SetSaldoAtual(const Value: Double);
    procedure SetSaldoInicial(const Value: Double);

  public
    constructor Create; //Setar valores iniciais
    function AbrirCaixa(const aValor: Double): Boolean; //Método para abrir o caixa
    function RetirarValor(const aValor: Double): Double; //Método para retirar valor do caixa
    function AdicionarValor(const aValor: Double): Double; //Método para adicionar valor do caixa
    procedure FecharCaixa; //Método para Fechar o caixa

    property SaldoInicial: Double read GetSaldoInicial write SetSaldoInicial;
    property SaldoAtual: Double read GetSaldoAtual write SetSaldoAtual;
    property CaixaAberto: Boolean read GetCaixaAberto write SetCaixaAberto;

  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

//Inicializar sempre com o caixa fechado e 0 de saldo
constructor TCaixa.Create;
begin
  FSaldoInicial := 0;
  FSaldoAtual := 0;
  FCaixaAberto := False;
end;

//Método para abrir o caixa
function TCaixa.AbrirCaixa(const aValor: Double): Boolean;
begin
  FCaixaAberto := True;
  SaldoInicial := aValor + SaldoInicial;
  SaldoAtual := SaldoInicial;
  Result := FCaixaAberto;
end;

//Método para adicionar valor do caixa
function TCaixa.AdicionarValor(const aValor: Double): Double;
begin
  SaldoAtual := aValor + SaldoAtual;

  Result := SaldoAtual;
end;

//Método para retirar valor do caixa
function TCaixa.RetirarValor(const aValor: Double): Double;
begin
  SaldoAtual := SaldoAtual - aValor;

  Result := SaldoAtual;
end;

//Método para Fechar o caixa
procedure TCaixa.FecharCaixa;
begin

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
  FsaldoInicial := Value;
end;

end.
