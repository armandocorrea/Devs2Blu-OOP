unit Ufrm_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox, UCaixa;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Executar: TButton;
    Exibir: TButton;
    Sair: TButton;
    Resultado: TLabel;
    NumberBox1: TNumberBox;
    Memo1: TMemo;
    procedure ExecutarClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExibirClick(Sender: TObject);
  private
    FCaixa : TCaixa;
    procedure ExecutarOperacao;
    procedure ExibirOp;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Lista : TStringList;


implementation

{$R *.dfm}

procedure TForm1.ExecutarClick(Sender: TObject);
begin
  Self.ExecutarOperacao;

end;

procedure TForm1.ExibirClick(Sender: TObject);
begin
  Self.ExibirOp
end;

procedure TForm1.SairClick(Sender: TObject);
begin
  FreeAndNil(FCaixa);
  Lista.Clear;
  Self.Close
end;


procedure TForm1.ExecutarOperacao;
var
  xValor : double;

begin
  if not assigned (FCaixa) then
    FCaixa := TCaixa.Create(StrToFloat(NumberBox1.Text),false);

  case TEnumOpcoes(RadioGroup1.ItemIndex) of
  stAbrir :
    begin
      xValor := StrToFloat(NumberBox1.Text);
      FCaixa.AbrirCaixa(xValor);

      Resultado.Caption := 'Caixa Aberto';

      Lista.Add('Caixa Aberto - Saldo Inicial R$ ' +
      FormatFloat('###,###,##0.00',xValor))

    end;

  stSuprimento :
    begin
      xValor := StrToFloat(NumberBox1.Text);
      FCaixa.AdicionarValor(xValor);

      Resultado.Caption := 'R$ ' + FormatFloat('###,###,##0.00',xValor)
      + ' adicionado ao caixa';

      Lista.Add('(+) Suprimento: R$ ' + FormatFloat('###,###,##0.00',xValor))
    end;

  stSangria :
    begin
      xValor := StrToFloat(NumberBox1.Text);
      FCaixa.RetirarValor(xValor);

      Resultado.Caption := 'R$ ' + FormatFloat('###,###,##0.00',xValor)
      + ' retirado do caixa';

      Lista.Add('(-) Sangria: R$ ' + FormatFloat('###,###,##0.00',xValor))
    end;

  stSaldo :
    begin
      FCaixa.Saldo;

      Resultado.Caption := 'Saldo atual em caixa de R$ ' +
      FormatFloat('###,###,##0.00',FCaixa.SaldoAtual);

      Lista.Add('= Saldo Atual: R$ ' +
      FormatFloat('###,###,##0.00',FCaixa.SaldoAtual))
    end;

  stFechar :
    begin
      FCaixa.FecharCaixa;
      Resultado.Caption := 'O caixa foi fechado! Saldo final RS ' +
      FormatFloat('###,###,##0.00',FCaixa.SaldoAtual);

      Lista.Add('Caixa fechado com saldo de: R$ ' +
      FormatFloat('###,###,##0.00',FCaixa.SaldoAtual));

      Self.ExibirOp;

      FreeAndNil(FCaixa)
    end;
  end;
end;

procedure TForm1.ExibirOp;
var
  i : integer;
begin
  for I := 0 to Lista.Count-1 do
    Memo1.Lines.Add(Lista.Strings[i])
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Lista := TStringList.Create
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  case TEnumOpcoes(RadioGroup1.ItemIndex) of
  stAbrir:
    begin
      NumberBox1.Enabled := true
    end;

  stSuprimento:
    begin
      NumberBox1.Enabled := true
    end;

  stSangria:
    begin
      NumberBox1.Enabled := true
    end;
  stSaldo:
    begin
      NumberBox1.Text    := '0,00';
      NumberBox1.Enabled := false
    end;

  stFechar:
    begin
      NumberBox1.Text    := '0,00';
      NumberBox1.Enabled := false
    end;
  end;
end;

end.
