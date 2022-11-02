unit UCaixa;

interface

uses
  System.Classes;

Type
  TCaixa = class
    private
      FSaldoInicial: Double;
      FSaldoAtual  : Double;
      FCaixaAberto : Boolean;
      FHistorico   : TStringList;

      function GetCaixaAberto: Boolean;
      function GetSaldoAtual: String;
      function GetSaldoInicial: Double;

      Function Replace(const aValor: String): String;

    public
      property SaldoInicial: Double  read GetSaldoInicial;
      property SaldoAtual  : String  read GetSaldoAtual;
      property CaixaAberto : Boolean read GetCaixaAberto;

      Constructor Create;
      Destructor  Destroy; override;

      Function AbrirCaixa(const aValor: String)    : String;
      Function FecharCaixa                         : String;
      Function AdicionarValor(const aValor: String): String;
      Function RetirarValor(const aValor: String)  : String;
      Function ExibirExtrato                       : TStringList;
  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

Function TCaixa.AbrirCaixa(const aValor: String): String;
  var
    xValor: Double;
  begin
    if FCaixaAberto then // Verifica se já está aberto
      raise Exception.Create('Caixa já aberto! Operação cancalada.');

    if not TryStrToFloat(Replace(aValor), xValor) or (xValor <= 0) then  // Valida para número e conteúdo
      raise Exception.Create('Erro de Inserção de valores ao abrir o caixa.');

    FCaixaAberto  := True;
    FSaldoInicial := xValor;
    FSaldoAtual   := xValor;

    Result := 'Abriu o caixa com R$' + FormatFloat('0.##', xValor);
    FHistorico.Add(Result);
  end;

function TCaixa.AdicionarValor(const aValor: String): String;
  var
    xValor: Double;
  begin
    if not FCaixaAberto then
      raise Exception.Create('Caixa Fechado! Operação cancalada.');

    if not (TryStrToFloat(Replace(aValor), xValor)) or (xValor <= 0) then
      raise Exception.Create('Erro de Inserção de valores ao adicionar saldo.');

    FSaldoAtual := FSaldoAtual + xValor;

    Result := 'Adicionou R$' + FormatFloat('0.##', xValor) + ' no Caixa.';
    FHistorico.Add(Result);
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

function TCaixa.Replace(const aValor: String): String;
  begin
    Result := aValor.Replace('.', ',')
  end;

function TCaixa.RetirarValor(const aValor: String): String;
  var
    xValor: Double;
  begin
    if not FCaixaAberto then
      raise Exception.Create('Caixa Fechado! Operação cancalada.');

    if not TryStrToFloat(Replace(aValor), xValor) or (xValor <= 0) then
      raise Exception.Create('Erro de Inserção de valores ao retirar saldo. Operação cancalada.');

    if xValor > FSaldoAtual then
      raise Exception.Create('Valor do Saque maior que o Saldo! Operação cancalada.');

    FSaldoAtual := FSaldoAtual - xValor;

    Result := 'Retirou R$' + FormatFloat('0.##', xValor) + ' do Caixa.';
    FHistorico.Add(Result)
  end;

function TCaixa.ExibirExtrato: TStringList;
  begin
     if not FCaixaAberto then
      raise Exception.Create('Caixa Fechado! Operação cancalada.');
    Result := FHistorico;
  end;

Function TCaixa.FecharCaixa: String;
  begin
    if not FCaixaAberto then
      raise Exception.Create('Caixa já Fechado! Operação cancalada.');

    FCaixaAberto := False;
   Result := 'Fechou o caixa com R$' + FormatFloat('0.##', FSaldoAtual);
  end;

function TCaixa.GetCaixaAberto: Boolean;
  begin
    Result := FCaixaAberto;
  end;

function TCaixa.GetSaldoAtual: String;
  begin
    Result := 'Saldo atual de R$' + FormatFloat('0.##', FSaldoAtual) + '.';
  end;

function TCaixa.GetSaldoInicial: Double;
  begin
    Result := FSaldoInicial;
  end;

end.
