unit UCaixa;

interface

uses
  Vcl.Dialogs, System.SysUtils;

type
  TCaixa = class
    private
      FSaldoInicial : Double;
      FSaldoAtual:    Double;
      FCaixaAberto :  Boolean;
      FTotalOperacoes: Integer;
      FListaOperacoes: array of String;

    function GetCaixaAberto: Boolean;
    function GetSaldoAtual: Double;
    function GetSaldoInicial: Double;
    function GetListaOperacoes: String;
    function GetTotalOperacoes: Integer;

    procedure SetCaixaAberto(const Value: Boolean);
    procedure SetSaldoAtual(const Value: Double);
    procedure SetSaldoInicial(const Value: Double);
    procedure SetListaOperacoes(const Value: String);
    procedure SetTotalOperacoes(const Value: Integer);

    public

      property SaldoInicial: Double  read GetSaldoInicial  write SetSaldoInicial;
      property SaldoAtual:   Double  read GetSaldoAtual    write SetSaldoAtual;
      property CaixaAberto:  Boolean read GetCaixaAberto   write SetCaixaAberto;
      property TotalOP:      Integer read GetTotalOperacoes write SetTotalOperacoes;
      property Lista:        String  read GetListaOperacoes write SetListaOperacoes;

      constructor AbrirCaixa (const pSaldo: Double);

      function FecharCaixa: Double;
      function VisualizarSaldoAtual: Double;
      function ExibirLista(const pValor: Integer) : string;
      procedure RetirarValor  (const pValor: Double);
      procedure AdicionarValor(const pValor: Double);

  end;

implementation

// Emcapsulamento { TCaixa }

function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.GetListaOperacoes: String;
begin
  Result:= FListaOperacoes[FTotalOperacoes];
end;

function TCaixa.GetSaldoAtual: Double;
begin
  Result:= FSaldoAtual;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  Result:= FSaldoInicial;
end;

function TCaixa.GetTotalOperacoes: Integer;
begin
  Result := FTotalOperacoes;
end;

procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto:= Value;
end;

procedure TCaixa.SetListaOperacoes(const Value: String);
begin
  FListaOperacoes[FTotalOperacoes]:= Value;
end;

procedure TCaixa.SetSaldoAtual(const Value: Double);
begin
  FSaldoAtual:= Value;
end;

procedure TCaixa.SetSaldoInicial(const Value: Double);
begin
  FSaldoInicial:= Value;
end;

procedure TCaixa.SetTotalOperacoes(const Value: Integer);
begin
  FTotalOperacoes:= Value;
end;

// Métodos da { TCaixa }

constructor TCaixa.AbrirCaixa(const pSaldo: Double);
begin
  if FCaixaAberto = false then
    begin
      FCaixaAberto:= True;
      FSaldoInicial:= pSaldo;
      FSaldoAtual:= FSaldoInicial;

      SetLength(FListaOperacoes, Length(FListaOperacoes)+1);
      FTotalOperacoes:= FTotalOperacoes + 1;
      FListaOperacoes[FTotalOperacoes - 1]:= 'Caixa Aberto!! Valor Inicial R$:' + FormatFloat('0.00', pSaldo);
    end
  else
    raise Exception.Create('Caixa Ja Aberto');
end;

procedure TCaixa.AdicionarValor(const pValor: Double);
begin
  if FCaixaAberto = true then
  begin
    FSaldoAtual:= FSaldoAtual + pValor;

    SetLength(FListaOperacoes, Length(FListaOperacoes)+1);
    FTotalOperacoes:= FTotalOperacoes + 1;
    FListaOperacoes[FTotalOperacoes - 1]:= 'Suprimento Adicionado!! Valor Adicionado R$: ' + FormatFloat('0.00', pValor);
  end
  else
    raise Exception.Create('Abra o caixa primeiro');
end;

procedure TCaixa.RetirarValor(const pValor: Double);
begin
  if FCaixaAberto = true then
  begin
    FSaldoAtual:= FSaldoAtual - pValor;

    SetLength(FListaOperacoes, Length(FListaOperacoes)+1);
    FTotalOperacoes:= FTotalOperacoes + 1;
    FListaOperacoes[FTotalOperacoes - 1]:= 'Sangria Retirada!! Valor Retirado R$:' + FormatFloat('0.00', pValor);
  end
  else
    raise Exception.Create('Abra o caixa primeiro');
end;

function TCaixa.VisualizarSaldoAtual: Double;
begin
  if FCaixaAberto = true then
  begin
    Result:= FSaldoAtual;

    SetLength(FListaOperacoes, Length(FListaOperacoes)+1);
    FTotalOperacoes:= FTotalOperacoes + 1;
    FListaOperacoes[FTotalOperacoes - 1]:= 'Visualização do Saldo';
  end
  else
    raise Exception.Create('Abra o caixa Primeiro');
end;

function TCaixa.ExibirLista(const pValor: Integer): string;
begin
  if FCaixaAberto = true then
    Result:= FListaOperacoes[pValor]
  else
    raise Exception.Create('Abra o caixa Primeiro');
end;

function TCaixa.FecharCaixa: Double;
begin
  if FCaixaAberto = True then
  begin
    FCaixaAberto := false;
    Result:= FSaldoAtual;
  end
  else
    raise Exception.Create('Caixa ja fechado');
end;

end.
