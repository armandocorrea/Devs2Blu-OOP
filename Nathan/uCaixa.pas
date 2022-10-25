unit uCaixa;

interface

uses
  System.Classes;

type

  TCaixa = class
  private
    FSaldoInicial, FSaldoAtual: Double;
    FCaixaAberto: Boolean;
    FListar: TStringList; //BONUS

    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;

    procedure SetCaixaAberto(const Value: Boolean);
    procedure SetSaldoAtual(const Value: Double);
    procedure SetSaldoInicial(const Value: Double);
    function GetListar: TStringList;
    procedure SetListar(const Value: TStringList);

  public
    constructor Create; //Setar valores iniciais
    destructor Destroy; //Destruir o listar(Bonus)
    function AbrirCaixa(const aValor: Double): string; //Método para abrir o caixa
    function RetirarValor(const aValor: Double): string; //Método para retirar valor do caixa
    function AdicionarValor(const aValor: Double): string; //Método para adicionar valor do caixa
    function FecharCaixa: Boolean; //Método para Fechar o caixa
    function metodoListar: TStringList;
    property SaldoInicial: Double read GetSaldoInicial write SetSaldoInicial;
    property SaldoAtual: Double read GetSaldoAtual write SetSaldoAtual;
    property CaixaAberto: Boolean read GetCaixaAberto write SetCaixaAberto;
    property Listar: TStringList read GetListar write SetListar;

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
  FListar := TStringList.Create;
end;

// Destruindo o objeto listar
destructor TCaixa.Destroy;
begin
  FreeAndNil(FListar);

  inherited;
end;

//Método para abrir o caixa
function TCaixa.AbrirCaixa(const aValor: Double): STRING;
begin
  FCaixaAberto := True;
  SaldoInicial := aValor + SaldoInicial;
  SaldoAtual := SaldoInicial;

  Result := 'O caixa abriu com: R$' + FloatToStr(SaldoInicial);
  FListar.Add(result);
end;

//Método para adicionar valor ao caixa
function TCaixa.AdicionarValor(const aValor: Double): STRING;
begin
  SaldoAtual := aValor + SaldoAtual;

  Result := 'Adicionado ao caixa R$: '+  FloatToStr(aValor);
  FListar.Add(result);
end;

//Método para retirar valor ao caixa
function TCaixa.RetirarValor(const aValor: Double): STRING;
begin
  SaldoAtual := SaldoAtual - aValor;

  Result := 'Adicionado ao caixa R$: '+  FloatToStr(aValor);
  FListar.Add(result);
end;

//Método para Fechar o caixa
function TCaixa.FecharCaixa: boolean;
begin
  FCaixaAberto := False;

  Result := FCaixaAberto;
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.GetListar: TStringList;
begin
  Result := FListar;
end;

function TCaixa.GetSaldoAtual: Double;
begin
  Result := FSaldoAtual;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

function TCaixa.metodoListar: TStringList;
begin
  Result := FListar;
end;

procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetListar(const Value: TStringList);
begin
  FListar := Value;
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
