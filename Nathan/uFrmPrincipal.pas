unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uCaixa,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TOpcoes = (tpAbrirCaixa, tpSuprimento, tpSangria, tpSaldoAtual, tpFecharCaixa);
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    rgOpcoes: TRadioGroup;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    mmHistorico: TMemo;
    lblCaixa: TLabel;
    Image1: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    FCaixa: TCaixa;
    procedure ExecutarOpcao;
    procedure Fechar;
    procedure Lista;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

//Botao Executar
procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
begin
  ExecutarOpcao;
end;

//Botao StringList
procedure TfrmPrincipal.btnExibirClick(Sender: TObject);
begin
  Lista;
end;

//Botao Fechar
procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Fechar;
end;

//Procedure para as opções escolhidas no RadioGroup
procedure TfrmPrincipal.ExecutarOpcao;
var
  xValor: Double;
begin
  //Validar se é número
  if not TryStrToFloat(edtValor.Text, xValor) then
    raise Exception.Create('Valor Inválido');

  case TOpcoes(rgOpcoes.ItemIndex) of
    tpAbrirCaixa://Caso escolha por abrir o caixa
    begin
      if FCaixa.CaixaAberto = true then
        lblCaixa.Caption := 'O Caixa já está aberto!'

      else
        begin
          FCaixa.AbrirCaixa(StrToInt(edtValor.Text));

          lblCaixa.Caption := 'Caixa Aberto! Saldo Inicial: R$' + FloatToStr(FCaixa.SaldoInicial);
        end;
    end;

    tpSuprimento://Caso escolha por adicionar dinheiro
    begin
       if FCaixa.CaixaAberto = false then
        lblCaixa.Caption := 'O Caixa está fechado!'

       else
         begin
          FCaixa.AdicionarValor(StrToFloat(edtValor.Text));
          lblCaixa.Caption := 'Adicionado! Saldo Atual: R$' + FloatToStr(FCaixa.SaldoAtual);
         end;
    end;

    tpSangria://Caso escolha por tirar dinheiro
    begin
       if FCaixa.CaixaAberto = false then
        lblCaixa.Caption := 'O Caixa está fechado!'

       else
         begin
          FCaixa.RetirarValor(StrToFloat(edtValor.Text));
          lblCaixa.Caption := 'Retirado! Saldo Atual: R$' + FloatToStr(FCaixa.SaldoAtual);
         end;
    end;

    tpSaldoAtual://Caso escolha por mostrar o saldo atual
    begin
      if FCaixa.CaixaAberto = false then
        lblCaixa.Caption := 'O Caixa está fechado!'

      else
        begin
          label1.Enabled := False;
          edtValor.Enabled := False;

          lblCaixa.Caption := 'Saldo Atual R$:' + FloatToStr(FCaixa.SaldoAtual);
        end;
    end;

    tpFecharCaixa: //Caso escolha por fechar o caixa
    begin
      if FCaixa.CaixaAberto = false then
        lblCaixa.Caption := 'O Caixa está fechado!'

      else
        begin
          label1.Enabled := False;  //Trancar usabilidade
          edtValor.Enabled := False; //Trancar usabilidade

          FCaixa.FecharCaixa;

          lblCaixa.Caption := 'Você fechou o caixa com um saldo de R$:' + FloatToStr(FCaixa.SaldoAtual);
        end;
    end;
  end;
end;

//procedure para listar (bonus)
procedure TfrmPrincipal.Lista;
begin
  mmhistorico.Visible := true;
  mmHistorico.Lines := FCaixa.metodoListar;
end;

//procedure para fechar aplicação
procedure TfrmPrincipal.Fechar;
begin
  Application.Terminate;
end;

//Criar objeto
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

//Destruir objeto
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

end.
