unit UCaixa;

interface

uses
  System.Classes;


type

Tcaixa = Class

Private
fSaldoInicial, fSaldofinal : Double;
fCaixaAberto : Boolean;
fstring : tstringlist;

    function getCaixaAberto: Boolean;
    function getSaldoFinal: Double;
    function getSaldoInicial: Double;
    procedure setCaixaAberto(const Value: Boolean);
    procedure setSaldoFinal(const Value: Double);
    procedure setSaldoInicial(const Value: Double);
    function getstring: Tstringlist;
    procedure setstring(const Value: Tstringlist);


Public
constructor create;
destructor destroy;
Procedure Consultar;
Procedure abrirCaixa(Const value : double);
Procedure retirarValor(Const Value : Double);
Procedure adicionarValor(Const value : Double);
Procedure fecharCaixa;
Property SaldoInicial : Double read getSaldoInicial write setSaldoInicial;
Property SaldoFinal : Double read getSaldoFinal write setSaldoFinal;
Property CaixaAberto : Boolean read getCaixaAberto write setCaixaAberto;
Property Stringlist : Tstringlist read getstring write setstring;


End;

implementation

uses
  System.SysUtils;

{ Tcaixa }

procedure Tcaixa.abrirCaixa(const value: double);
  begin
    if (caixaAberto = true) then
      raise Exception.Create('O Caixa já está aberto')
    else if (value >=0) then
    begin
      caixaAberto := True;

      saldoFinal :=  value;
    end
    else
      raise Exception.Create('Valor inicial inserido incorretamente');
    Fstring.Add('Caixa Aberto');
  end;

procedure Tcaixa.adicionarValor(const value: Double);
  begin
     if (caixaAberto = false) then
      raise Exception.Create('O Caixa ainda não foi aberto')
     else if (value >0) then
          saldofinal := saldoFinal + Value
     else
      raise Exception.Create('Valor inserido incorretamente');
     Fstring.Add('Adicionado  ' + value.ToString + ' ao caixa');
  end;

procedure Tcaixa.Consultar;
begin
Fstring.Add('consultado Saldo');
end;

constructor Tcaixa.create;
  begin
    FSaldoInicial := 0;
    fCaixaAberto  := False;
    fstring := tstringlist.create;
  end;

destructor Tcaixa.destroy;
begin
freeandnil(fstring);
end;

procedure Tcaixa.fecharCaixa;
  begin
   if (caixaAberto = false) then
    raise Exception.Create('O caixa não está aberto')
   else
      caixaAberto :=False;
   Fstring.Add('Caixa fechado');
  end;

function Tcaixa.getCaixaAberto: Boolean;
begin
  Result :=  FCaixaAberto
end;

function Tcaixa.getSaldoFinal: Double;
begin
  Result := FSaldoFinal
end;

function Tcaixa.getSaldoInicial: Double;
begin
  Result := FSaldoInicial
end;

function Tcaixa.getstring: Tstringlist;
begin
  Result := Fstring;
end;

procedure Tcaixa.retirarValor(const Value: Double);
  begin
    if (caixaAberto = false) then
      raise Exception.Create('O caixa não está aberto')
    else if (value <= 0) then
      raise Exception.Create('Digite um valor a retirar válido')
    else if (saldofinal - value <0) then
      raise Exception.Create('Não há valor suficiente para a retirada')
    else
      saldofinal := saldoFinal - value;
    Fstring.Add('Retirado ' + Value.ToString + ' do caixa');
  end;

procedure Tcaixa.setCaixaAberto(const Value: Boolean);
begin
FCaixaAberto := value
end;

procedure Tcaixa.setSaldoFinal(const Value: Double);
begin
FSaldoFinal := Value
end;

procedure Tcaixa.setSaldoInicial(const Value: Double);
begin
FSaldoInicial := Value
end;

procedure Tcaixa.setstring(const Value: Tstringlist);
begin

end;

end.
