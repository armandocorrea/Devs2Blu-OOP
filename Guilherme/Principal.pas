unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UCaixa,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  Topcoes = (AbrirCaixa, Suprimento, Sangria, Saldo_Atual, FecharCaixa);
  TForm1 = class(TForm)
    Valor: TEdit;
    Label1: TLabel;
    Opcoes: TRadioGroup;
    ExecutarOperacoes: TButton;
    Exibir: TButton;
    Sair: TButton;
    ListaOperacoes: TMemo;
    Shape1: TShape;
    OperacaoFeita: TLabel;
    Image1: TImage;
    procedure ExecutarOperacoesClick(Sender: TObject);
    procedure ExibirClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCaixa: TCaixa;
    xCriar: Integer; // Para Criar a classe apenas uma vez
    procedure Processar;
    procedure CaixaAberto;
    procedure AddSuprimento;
    procedure RemoveSangria;
    procedure VerSaldoAtual;
    procedure Fechar;
    procedure ExibirLista;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ExecutarOperacoesClick(Sender: TObject);
begin
  if xCriar = 0 then //Para Criar o objeto apenas uma vez
  begin
      FCaixa:= TCaixa.Create;
      xCriar:= 1;
  end;
  Processar;
end;

procedure TForm1.Processar;
begin
    case Topcoes(Opcoes.ItemIndex) of
      AbrirCaixa:
      begin
        CaixaAberto;
        Opcoes.ItemIndex:= -1;
      end;

      Suprimento:
      begin
        AddSuprimento;
        Opcoes.ItemIndex:= -1;
      end;

      Sangria:
      begin
        RemoveSangria;
        Opcoes.ItemIndex:= -1;
      end;

      Saldo_Atual:
      begin
        VerSaldoAtual;
        Opcoes.ItemIndex:= -1;
      end;

      FecharCaixa:
      begin
        Fechar;
        Opcoes.ItemIndex:= -1;
      end

      else
        raise Exception.Create('Clique em uma operação');
    end;
end;

procedure TForm1.ExibirClick(Sender: TObject);
begin
  ExibirLista;
end;

procedure TForm1.CaixaAberto;
var
  xValor: Double;
begin
  try
    if not TryStrToFloat(Valor.Text, xValor) or (xValor <= 0)then
      raise Exception.Create('Digite um valor valido acima de 0');
        begin
          FCaixa.AbrirCaixa(xValor);
          OperacaoFeita.Caption:= 'Caixa aberto!! Saldo Inicial: R$:' + FormatFloat('0.00',FCaixa.SaldoInicial);
          Valor.Text:= '';
        end;
  except
    On E: Exception do
      raise Exception.Create('Erro ao abrir caixa! ' + E.Message);
  end;
end;

procedure TForm1.AddSuprimento;
var
  xValor: Double;
begin
  try
    if not TryStrToFloat(Valor.Text, xValor) or (xValor <= 0) then
      raise Exception.Create('Digite um valor valido acima de 0');
        begin
          FCaixa.AdicionarValor(xValor);
          OperacaoFeita.Caption:= 'Suprimento Adicionado!! Valor Adicionado: R$:' + Valor.Text;
          Valor.Text:= '';
        end;
  except
    On E: Exception do
      raise Exception.Create('Erro ao Adicionar! ' + E.Message);
  end;
end;

procedure TForm1.RemoveSangria;
var
  xValor: Double;
begin
  try
    if not TryStrToFloat(Valor.Text, xValor) or (xValor <= 0) then
      raise Exception.Create('Digite um valor valido acima de 0');
        begin
          FCaixa.RetirarValor(xValor);
          OperacaoFeita.Caption:= 'Sangria Retirado!! Valor Retirado R$:' + Valor.Text;
          Valor.Text:= '';
        end;
  except
    On E: Exception do
      raise Exception.Create('Erro ao Remover! ' + E.Message);
  end;
end;

procedure TForm1.VerSaldoAtual;
begin
  Valor.Text:= '';
  OperacaoFeita.Caption:= 'Saldo Atual: R$:' + FormatFloat('0.00', FCaixa.VisualizarSaldoAtual);
end;

procedure TForm1.Fechar;
begin
  try

  if FCaixa.SaldoInicial < FCaixa.SaldoAtual then
    OperacaoFeita.Caption:= 'Caixa Fechado!! Deu lucro!! Saldo ficou R$:' +
    FormatFloat('0.00', FCaixa.FecharCaixa) + ' / Saldo Inicial R$:' + FormatFloat('0.00', FCaixa.SaldoInicial)
  else
     OperacaoFeita.Caption:= 'Caixa Fechado!! Deu prejuizo!! Saldo ficou R$:' +
     FormatFloat('0.00', FCaixa.FecharCaixa) + ' / Saldo Inicial R$:' + FormatFloat('0.00', FCaixa.SaldoInicial);

    FreeAndNil(FCaixa);

    xCriar := 0;
    Image1.Visible:= True;
    ListaOperacoes.Visible:= False;

  except
    on E: exception do
      raise Exception.Create('Erro ao fechar caixa!! ' + E.Message);
  end;
end;

procedure TForm1.ExibirLista;
var
  I: Integer;
begin
  try
    if not ListaOperacoes.Visible then
    begin

      if xCriar = 0 then // Caso o objeto n for criado ainda, para n dar
        begin            // Acess Violetion
            FCaixa:= TCaixa.Create;
            xCriar:= 1;
        end;

      ListaOperacoes.Lines.Clear;

      for I := 0 to (FCaixa.TotalOP-1) do
        begin
          ListaOperacoes.Lines.Add(FCaixa.ExibirLista(I));
        end;

        Image1.Visible:= False;
        ListaOperacoes.Visible:= True;
    end

    else
    begin
      Image1.Visible:= true;
      ListaOperacoes.Visible:= false;
    end;
  except
    on E: exception do
      raise Exception.Create('Erro ao mostrar lista!! ' + E.Message);
  end;

end;

procedure TForm1.SairClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FCaixa) then
    FreeAndNil(FCaixa);
end;

end.
