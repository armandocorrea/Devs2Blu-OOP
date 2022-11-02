unit frmCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UCaixa;

type
  TExecutar = (tpAbrirCaixa, tpSuprimento, tpSangria,
               tpSaldoAtual, tpFecharCaixa);
  TFormCaixa = class(TForm)
    btnExecutarOperacao: TButton;
    btnListarOperacoes: TButton;
    btnSair: TButton;
    rgOpcoes: TRadioGroup;
    edtValorEntrada: TEdit;
    memoResultado: TMemo;
    labelResultado: TLabel;
    Label2: TLabel;
    procedure btnExecutarOperacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnListarOperacoesClick(Sender: TObject);
  private
  FCaixa : TCaixa;
  procedure Executar;
  procedure AdicionarValor;
  procedure RetirarValor;
  procedure CaixaAberto;
  procedure CaixaFechado;
  procedure SaldoAtual;
  procedure CorValoresEntrada;
  procedure CorValoresSaida;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCaixa: TFormCaixa;
  listas  : TStringlist;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFormCaixa.AdicionarValor;
var
  xValorAdicionado :Double;
begin
  if not FCaixa.CaixaAberto then
    raise Exception.Create('Caixa está Fechado');

  edtValorEntrada.text := StringReplace(edtValorEntrada.text,
                                        '.', ',',[rfReplaceAll]);

  if not TryStrToFloat(edtValorEntrada.text, xValorAdicionado) then
    raise Exception.Create('Valor Inválido');


  FCaixa.AdicionarValor(xValorAdicionado);

  labelResultado.Visible     := True;
  labelResultado.Caption     := 'Foi Adicionado R$' + FormatFloat('0.00' , xValorAdicionado);
  CorValoresEntrada;
  if(Length(labelResultado.Caption) > 0)then
    listas.Add(labelResultado.Caption)
end;


procedure TFormCaixa.btnExecutarOperacaoClick(Sender: TObject);
begin
  Executar;
end;

procedure TFormCaixa.btnListarOperacoesClick(Sender: TObject);
var i : Smallint;
begin
  memoResultado.Clear;
  for i := 0 to listas.Count-1 do
    memoResultado.Lines.Add(listas.Strings[i]);
end;

procedure TFormCaixa.btnSairClick(Sender: TObject);
begin
  FormCaixa.Close;
end;


procedure TFormCaixa.CaixaAberto;
begin
  FCaixa.AbrirCaixa;
  CorValoresEntrada;
  edtValorEntrada.Enabled    := True;
  labelResultado.Visible     := True;
  labelResultado.Caption     := 'Caixa Aberto';
  btnListarOperacoes.Enabled := True;
end;


procedure TFormCaixa.CaixaFechado;
begin
   FCaixa.FecharCaixa;
   labelResultado.Visible        := True;
   edtValorEntrada.Enabled       := False;
   btnListarOperacoes.Enabled    := False;
   labelResultado.Caption        := 'Caixa Fechado';
   CorValoresSaida;
   CorValoresEntrada;
end;


procedure TFormCaixa.CorValoresEntrada;
begin
  labelResultado.Font.Color  := clGreen;
end;

procedure TFormCaixa.CorValoresSaida;
begin
  labelResultado.Font.Color := clRed;
end;

procedure TFormCaixa.SaldoAtual;
begin
  if not FCaixa.CaixaAberto then
    raise Exception.Create('Caixa está fechado');

  labelResultado.Visible     := True;
  btnListarOperacoes.Enabled := True;
  labelResultado.Font.Color  := clBlack;
  labelResultado.Caption     := 'O saldo atual é de R$' +
                                FloatToStr(FCaixa.SaldoFinal);

end;


procedure TFormCaixa.RetirarValor;
var
  xValorRetirado : Double;
begin
  if not FCaixa.CaixaAberto then
    raise Exception.Create('Caixa está fechado');

  edtValorEntrada.text := StringReplace(edtValorEntrada.text,
                                       '.', ',',[rfReplaceAll]);

  if not TryStrToFLoat(edtValorEntrada.Text,xValorRetirado) then
    raise Exception.Create('Valor Inválido');

   FCaixa.RetirarValor(xValorRetirado);
   CorValoresSaida;
   btnListarOperacoes.Enabled := True;
   labelResultado.Visible     := True;
   labelResultado.Caption     := 'Foi removido R$'
                                + FormatFloat('0.00', xValorRetirado);

   if(Length(labelResultado.Caption)>0)then
      listas.Add(labelResultado.Caption);
end;


procedure TFormCaixa.Executar;
begin

  case TExecutar(rgOpcoes.ItemIndex) of
    tpAbrirCaixa:
    begin
      CaixaAberto;
    end;

    tpSuprimento:
    begin
      AdicionarValor;
    end;

    tpSangria:
    begin
      RetirarValor;
    end;

    tpSaldoAtual:
    begin
      SaldoAtual;
    end;

    tpFecharCaixa:
    begin
      CaixaFechado;
    end;
  end;
end;


procedure TFormCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  listas.Free;
  FreeAndNil(FCaixa);
end;


procedure TFormCaixa.FormCreate(Sender: TObject);
begin
  listas := TStringList.Create;

  if FCaixa = nil then
    FCaixa := TCaixa.Create(False, 0);
end;

end.
