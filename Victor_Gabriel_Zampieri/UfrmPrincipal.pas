unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UCaixa,
  Vcl.Imaging.pngimage;

type
  TEnumOpcoesCaixa = (opAbrirCaixa, opSuprimento, opSangria, opSaldoAtual, opFecharCaixa);
  TfrmPrincipal = class(TForm)
    rgOpcoes: TRadioGroup;
    lblValor: TLabel;
    edtValor: TEdit;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    lblResultado: TLabel;
    mmOperacoes: TMemo;
    Image1: TImage;
    lblCaixa: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure rgOpcoesClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa : TCaixa;
    FHistoricosOprecoes : TStringList;

    procedure CriarCaixa(aSaldoInicial : Double);
    procedure ExecutarOpcoes;
    procedure ExibirHistoricoOperecoes;
    procedure Liberar;
    procedure Sair;

    ////////////////////// Procedure referentes as opcões do enum, Para Fazer as Validações
    procedure AbrirCaixaOp;
    procedure SuprimentoOp;
    procedure SangriaOp;
    procedure SaldoAtualOp;
    procedure FecharCaixaOp;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.AbrirCaixaOp;
var
  xSaldoInicialPassado : Double;
begin

  if (FCaixa = nil) then
  begin

    if not (TryStrToFloat(edtValor.Text, xSaldoInicialPassado)) then
     raise Exception.Create('O Valor Para abrir o Caixa é inválido');

     if (xSaldoInicialPassado < 0) then
    raise Exception.Create('Número Inválido');

     Self.CriarCaixa(xSaldoInicialPassado);
     FHistoricosOprecoes := TStringList.Create;
  end

  else

  if (FCaixa.Caixa_Aberto) then
    raise Exception.Create('O Caixa Já está Aberto');


    FCaixa.AbrirCaixa;
    lblResultado.Caption := 'Caixa Aberto Com '+FormatFloat('0.00',FCaixa.Saldo_Inicial)+'R$';
    
    FHistoricosOprecoes.Add('O Caixa Foi Aberto Com '+FormatFloat('0.00',FCaixa.Saldo_Inicial)+'R$');

   lblCaixa.Caption := '+'+FormatFloat('0.00',xSaldoInicialPassado)+'R$';
end;



procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
begin
  Self.ExecutarOpcoes;
end;

procedure TfrmPrincipal.btnExibirClick(Sender: TObject);
begin
  Self.ExibirHistoricoOperecoes;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Self.Sair;
end;

procedure TfrmPrincipal.CriarCaixa(aSaldoInicial : Double);
begin
  FCaixa := TCaixa.Create;
  FCaixa.Saldo_Inicial := aSaldoInicial;
  FCaixa.Saldo_Atual := aSaldoInicial;
  FCaixa.AbrirCaixa;
end;

procedure TfrmPrincipal.ExecutarOpcoes; ////////////////////////////
begin
    case TEnumOpcoesCaixa(rgOpcoes.ItemIndex) of
      opAbrirCaixa :
        Self.AbrirCaixaOp;

      opSuprimento :
        Self.SuprimentoOp;

      opSangria :
        Self.SangriaOp;

      opSaldoAtual :
        Self.SaldoAtualOp;

      opFecharCaixa :
        Self.FecharCaixaOp;

      else
        raise Exception.Create('Opção Inválida!');
  end;

end;

procedure TfrmPrincipal.ExibirHistoricoOperecoes;
var
  I : Integer;
begin
  if (FCaixa = nil) then
    raise Exception.Create('Caixa Não Iniciado');

    mmOperacoes.Visible := True;
    Image1.Visible      := False;
  for I := 0 to FHistoricosOprecoes.Count-1 do
   mmOperacoes.Lines.Add(FHistoricosOprecoes[I]);
end;

procedure TfrmPrincipal.FecharCaixaOp;
begin

  if (FCaixa = nil) then
    raise Exception.Create('O Caixa Não Iniciado!');

  if not (FCaixa.Caixa_Aberto) then
    raise Exception.Create('O Caixa Já está Fechado!');

  FCaixa.FecharCaixa;
  lblValor.Enabled := False;
  edtValor.Enabled := False;
  FHistoricosOprecoes.Add('O Caixa Foi Fechado Com '+FormatFloat('0.00',FCaixa.Saldo_Atual)+' R$');
  lblResultado.Caption := 'O Caixa Foi Fechado!';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
  FreeAndNil(FHistoricosOprecoes);
end;

procedure TfrmPrincipal.Liberar;
begin
  lblValor.Enabled := True;
  edtValor.Enabled := True;
  btnExecutar.Caption := 'Executar Operação';
end;


procedure TfrmPrincipal.rgOpcoesClick(Sender: TObject);
begin
  mmOperacoes.Visible := False;
  Image1.Visible      := True;
  if (lblValor.Enabled = False) then
    Self.Liberar;
end;

procedure TfrmPrincipal.Sair;
begin
  Close;
end;

procedure TfrmPrincipal.SaldoAtualOp;
begin
  if (FCaixa = nil) then
    raise Exception.Create('O Caixa Não Iniciado!');

  if not (FCaixa.Caixa_Aberto) then
    raise Exception.Create('O Caixa Não está Aberto Para essa Operação!');

  lblValor.Enabled := False;
  edtValor.Enabled := False;
  FHistoricosOprecoes.Add('Foi Exibido o Saldo Atual do Caixa');
  lblResultado.Caption := 'O Saldo Atual Do Caixa é '+  FormatFloat('0.00',FCaixa.Saldo_Atual)+' R$';
end;

procedure TfrmPrincipal.SangriaOp;
var
  xValorSangria : Double;
begin
  if (FCaixa = nil) then
    raise Exception.Create('O Caixa Não Iniciado!');

  if not (FCaixa.Caixa_Aberto) then
    raise Exception.Create('O Caixa Não está Aberto Para essa Operação!');

  if not (TryStrToFloat(edtValor.Text,xValorSangria)) then
    raise Exception.Create('O Valor Informado é Inválido!');

  if (xValorSangria < 0) then
    raise Exception.Create('O Valor Informado é Inválido!');

  if not (xValorSangria <= FCaixa.Saldo_Atual) then
    raise Exception.Create('O Valor Informado é Maior Que o Saldo Atual Do Caixa Para Retirar!');


   FCaixa.RetirarValor(xValorSangria);
   FHistoricosOprecoes.Add('Retirado '+ FormatFloat('0.00',xValorSangria) + ' R$ do Caixa!');
   lblResultado.Caption := 'Foi Retirado '+ FormatFloat('0.00',xValorSangria) + ' de Suprimentos do Caixa!';

   lblCaixa.Caption := '- '+FormatFloat('0.00',xValorSangria)+'R$';
end;

procedure TfrmPrincipal.SuprimentoOp;
var
  xValor : Double;
begin
  if (FCaixa = nil) then
    raise Exception.Create('O Caixa Não Iniciado!');

  if not (FCaixa.Caixa_Aberto) then
    raise Exception.Create('O Caixa Não está Aberto Para essa Operação!');

  if not (TryStrToFloat(edtValor.Text,xValor)) then
    raise Exception.Create('O Valor Informado é Inválido');

  if not (xValor > 0) then
    raise Exception.Create('O Valor Informado é Menor Que o Saldo Atual Do Caixa!');

  FCaixa.AdicionarValor(xValor);
  FHistoricosOprecoes.Add('Adicionado '+ FormatFloat('0.00', xValor)+'R$ ao Caixa!');
  lblResultado.Caption := 'Foi Adicionado '+ FormatFloat('0.00',xValor) + ' de Suprimentos ao Caixa!';
 lblCaixa.Caption := '+ '+FormatFloat('0.00',xValor)+'R$';
end;

end.
