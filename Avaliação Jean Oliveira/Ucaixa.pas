unit Ucaixa;

interface

Type

  Tcaixa = class

  private

    fSaldoInicial, fSaldoAtual: double;
    fCaixaAberto: boolean;

    procedure Setsaldoinicial(const Value: double);
    function getsaldoinicial: double;
    procedure SetSaldoatual(const Value: double);
    function getSaldoatual: double;
    procedure Setcaixaaberto(const Value: boolean);
    function getcaixaaberto: boolean;

  public

    property saldoinicial: double read getsaldoinicial write Setsaldoinicial;
    property Saldoatual: double read getSaldoatual write SetSaldoatual;
    property caixaaberto: boolean read getcaixaaberto write Setcaixaaberto;
    function abrircaixa(const abrircaixa: double): double;
    function fecharCaixa: double;
    function retirarvalor(const retirarvalor: double): double;
    function adicionarvalor(const adicionarvalor: double): double;
  end;

implementation

{ Tcaixa }

function Tcaixa.abrircaixa(const abrircaixa: double): double;

begin
  saldoinicial := abrircaixa;
  Saldoatual := abrircaixa;
  fCaixaAberto := true ;
  result := saldoatual;
end;

function Tcaixa.retirarvalor(const retirarvalor: double): double;
begin
  saldoatual := saldoatual - retirarvalor ;
  result  := saldoatual;

end;

function Tcaixa.adicionarvalor(const adicionarvalor: double): double;
begin
  saldoatual := saldoatual  + adicionarvalor ;
  result  := saldoatual;

end;

function Tcaixa.fecharCaixa: double;
begin
  fcaixaaberto := false ;
  result := saldoatual;

end;

function Tcaixa.getcaixaaberto: boolean;
begin
  result := fcaixaaberto;
end;

function Tcaixa.getSaldoatual: double;
begin
  result := fSaldoatual;
end;

function Tcaixa.getsaldoinicial: double;
begin
  result := fsaldoinicial;
end;

procedure Tcaixa.Setcaixaaberto(const Value: boolean);
begin
  fCaixaAberto := Value;
end;

procedure Tcaixa.SetSaldoatual(const Value: double);
begin
  fSaldoAtual := Value;
end;

procedure Tcaixa.Setsaldoinicial(const Value: double);
begin
  fSaldoInicial := Value;
end;

end.
