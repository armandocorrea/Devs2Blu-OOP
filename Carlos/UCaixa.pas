unit UCaixa;

interface

uses
  System.Classes;

type
  TCaixa = class
  private
    FSaldoInicial: Double;
    FSaldoAtual: Double;
    FCaixaAberto: Boolean;
    FHistorico: TStringList;

    procedure SetSaldoInicial(const Value: Double);
    procedure SetCaixaAberto(const Value: Boolean);
    procedure SetSaldoAtual(const Value: Double);
    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;
    procedure SetHistorico(const Value: TStringList);
    function GetHistorico: TStringList;

  public
    property SaldoInicial: Double read GetSaldoInicial write SetSaldoInicial;
    property SaldoAtual: Double read GetSaldoAtual write SetSaldoAtual;
    property CaixaAberto: Boolean read GetCaixaAberto write SetCaixaAberto;
    property Historico : TStringList read GetHistorico write SetHistorico;

    constructor Create;
    destructor Destroy; override;

    function AbrirCaixa(const aValor: Double): Double;
    function RetirarValor(const aValor: Double): Double;
    function AdicionarValor(const aValor: Double): Double;
    function FecharCaixa: Double;

  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

function TCaixa.AbrirCaixa(const aValor: Double): Double;
begin
    FHistorico.Clear;
    CaixaAberto := True;
    SaldoInicial := aValor;
    SaldoAtual := aValor;
    Result := SaldoAtual;
    FHistorico.Add('O Caixa foi aberto e o saldo é: ' +
                    FormatFloat('R$ #######0.00 ', SaldoAtual))

end;

function TCaixa.AdicionarValor(const aValor: Double): Double;
begin
    SaldoAtual := SaldoAtual + aValor;
    Result := SaldoAtual;
    FHistorico.Add('Foi adicionado ' + FormatFloat('R$ #######0.00', aValor) +
     '. O Saldo Atual é ' + FormatFloat('R$ #######0.00 ', SaldoAtual));
end;


function TCaixa.RetirarValor(const aValor: Double): Double;
begin
    SaldoAtual := SaldoAtual - aValor;
    Result := SaldoAtual;
    FHistorico.Add('Foi retirado ' + FormatFloat('R$ #######0.00', aValor) +
     '. O Saldo Atual é ' + FormatFloat('R$ #######0.00 ', SaldoAtual));
end;

function TCaixa.FecharCaixa: Double;
begin
    Result := SaldoAtual;
    CaixaAberto := False;
    FHistorico.Add('O Caixa foi fechado com saldo de: ' +
                   FormatFloat('R$ #######0.00 ', SaldoAtual));
end;


//Constructor e Destructor FHistorico:
constructor TCaixa.Create;
begin
  FHistorico := TStringList.Create;
end;

destructor TCaixa.Destroy;
begin
  FreeAndNil(FHistorico);

  inherited;
end;


// Gets e Sets:
function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.GetHistorico: TStringList;
begin
  Result := FHistorico;
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

procedure TCaixa.SetHistorico(const Value: TStringList);
begin
  FHistorico := Value;
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
