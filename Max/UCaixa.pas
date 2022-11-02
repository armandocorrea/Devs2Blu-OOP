unit UCaixa;

interface

uses
  System.Classes;

type
  TCaixa = class
  private
    FSaldoInicial             : Double;
    FSaldoAtual               : Double;
    FCaixaAberto              : Boolean;
    FCaixaLog                 : TStringList;
    function getSaldoInicial  : Double;
    function getCaixaAberto   : Boolean;
    function getCaixaLog: TStringList;
  public
    constructor Create(const aSaldoInicial : Double = 0);
    destructor Destroy; override;
    
    function consultarLog : String;
    procedure abrirCaixa;
    procedure fecharCaixa;
    procedure retirarValor(const aValor: Double);
    procedure adicionarValor(const aValor: Double);
    
    property saldoInicial : Double read getSaldoInicial;
    property caixaAberto  : Boolean read getCaixaAberto;
    property caixaLog     : TStringList read getCaixaLog;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TCaixa }

procedure TCaixa.abrirCaixa;
begin
  if FCaixaAberto then
    raise Exception.Create('O caixa já está aberto.');
  FCaixaAberto := True;
  FCaixaLog.Add('Caixa aberto | ' + DateTimeToStr(Now));
end;

procedure TCaixa.adicionarValor(const aValor: Double);
begin
  if aValor <= 0 then
  begin
    raise Exception.Create('Digite um valor maior que zero');
  end;
  if not caixaAberto then
    raise Exception.Create('O caixa está fechado.');
  FSaldoAtual := FSaldoAtual + aValor;
  ShowMessage('R$ ' + FormatFloat('0.00', aValor) + ' adicionado com sucesso.');
  FCaixaLog.Add('Entrada: + R$ ' + FormatFloat('0.00',aValor) + ' | ' + DateTimeToStr(Now));
end;

function TCaixa.consultarLog: String;
var
  I : Integer;
  xInputSenha : String;
const 
  SENHA = 'MAX';  
begin
  Result := '';

  xInputSenha := inputBox('Informar senha','Senha: ','max').ToUpper;
  if xInputSenha <> SENHA then
  begin
    raise Exception.Create('Senha incorreta!');
  end;
  
  if FCaixaLog.Count = 0 then
  begin
    ShowMessage('Sem registros de movimentação!');
    Exit;
  end;
  for I := 0 to FCaixaLog.Count - 1 do
    Result := Result + sLineBreak + FCaixaLog[I];

  Result := Result + sLineBreak + sLineBreak + 'Saldo atual: ' + 
    FormatFloat('0.00', FSaldoAtual);
end;

constructor TCaixa.Create(const aSaldoInicial : Double = 0);
begin
  FSaldoInicial := aSaldoInicial;
  FSaldoAtual   := aSaldoInicial;
  FCaixaLog := TStringList.Create;
  FCaixaAberto := True;
  FCaixaLog.Add('Caixa criado' + ' | ' + DateTimeToStr(Now))
end;

destructor TCaixa.Destroy;
begin
  FreeAndNil(FCaixaLog);
  inherited;

end;

procedure TCaixa.fecharCaixa;
begin
  if not FCaixaAberto then
    raise Exception.Create('O caixa já está fechado.');
  FCaixaAberto := False;
  FCaixaLog.Add('Caixa fechado' + ' | ' + DateTimeToStr(Now));
end;

function TCaixa.getCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

function TCaixa.getCaixaLog: TStringList;
begin
  Result := FCaixaLog;
end;

function TCaixa.getSaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

procedure TCaixa.retirarValor(const aValor: Double);
begin
  if aValor <= 0 then
    raise Exception.Create('Digite um valor maior que zero');
  
  if not caixaAberto then
    raise Exception.Create('O caixa está fechado.');

  if aValor > FSaldoAtual then
    raise Exception.Create(Format('Não há saldo suficiente. Restam R$ %s no caixa',
      [FormatFloat('0.00',FSaldoAtual)]));
  FSaldoAtual := FSaldoAtual - aValor;
  ShowMessage('R$ ' + FormatFloat('0.00', aValor) + ' retirado com sucesso');
  FCaixaLog.Add('Saída: - R$ ' + FormatFloat('0.00',aValor) + ' | ' + DateTimeToStr(Now));
end;

end.
