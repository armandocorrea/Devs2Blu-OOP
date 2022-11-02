unit Ucaixa;

interface
type
 Tcaixa = class

private
  Fsaldoinicial : Double;
  FsaldoAtual   : Double;
  FcaixaAberto  : Boolean;

  //Functions
  function GetFsaldoInicial   : Double;
  function GetFAbrirCaixa     : Double;
  function GetFSaldoatual     : Double;
  function GetFCaixaAberto    : Boolean;
  function GetFAdicionarValor : Double;
  function GetFReitirarValor  : Double;
  function GetFecharCaixa     : Double;

  //procedures
  procedure SetsaldoInicial(const Value : Double);
  procedure SetSaldoatual  (const Value : Double);
  procedure SetCaixaAberto (const Value : Boolean);
  procedure SetAbrircaixa(const Value: Double);
  procedure SetAdicionarValor(const Value: Double);
  procedure SetFecharCaixa(const Value: Double);
  procedure SetRetirarValor(const Value: Double);

public
  //Property
  property saldoInicial   : Double  read GetFsaldoInicial   write SetsaldoInicial;
  property Saldoatual     : Double  read GetFSaldoatual     write SetSaldoatual;
  property CaixaAberto    : Boolean read GetFCaixaAberto    write SetCaixaAberto;
  property AbrirCaixa     : Double  read GetFAbrirCaixa     write SetAbrircaixa;
  property AdicionarValor : Double  read GetFAdicionarValor Write SetAdicionarValor;
  property RetirarValor   : Double  read GetFReitirarValor  Write SetRetirarValor;
  property FecharCaixa    : Double  read GetFecharCaixa     Write SetFecharCaixa ;



 end;

implementation
uses
sysutils, Vcl.Dialogs;

{ Tcaixa }

function Tcaixa.GetFAbrirCaixa: Double;
begin
  if AbrirCaixa > Fsaldoinicial  then
  raise Exception.Create('Valor não identificado');
end;

function Tcaixa.GetFAdicionarValor: Double;
begin
  AdicionarValor :=  Fsaldoinicial + AdicionarValor;
end;

function Tcaixa.GetFCaixaAberto: Boolean;
begin
  result := FCaixaAberto;
end;

function Tcaixa.GetFecharCaixa: Double;
begin
  if FcaixaAberto = False then
  showmessage('Caixa Está Fechado');
end;

function Tcaixa.GetFReitirarValor: Double;
begin
  RetirarValor := FsaldoAtual - RetirarValor;
end;

function Tcaixa.GetFSaldoatual: Double;
begin
  Result := FsaldoAtual;
end;

function Tcaixa.GetFsaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

procedure Tcaixa.SetAbrircaixa(const Value: Double);
begin
  Abrircaixa := Value;
end;

procedure Tcaixa.SetAdicionarValor(const Value: Double);
begin
  AdicionarValor := Value;
end;

procedure Tcaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure Tcaixa.SetFecharCaixa(const Value: Double);
begin
  FecharCaixa := Value;
end;

procedure Tcaixa.SetRetirarValor(const Value: Double);
begin
  RetirarValor := Value;
end;

procedure Tcaixa.SetSaldoatual(const Value: Double);
begin
  FSaldoatual := Value;
end;

procedure Tcaixa.SetsaldoInicial(const Value: Double);
begin
  FsaldoInicial := Value;
end;

end.
