unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UCaixa,
  Vcl.Imaging.jpeg;

type
   TEnumOpcoes = ( opAbrirCaixa , opSuprimento, opSangria, opSaldoAtual, opFecharCaixa);
  TFormPrincipal = class(TForm)
    rgOpcoes: TRadioGroup;
    lblValor: TLabel;
    edtValor: TEdit;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    lblResultado: TLabel;
    mmRegistro: TMemo;
    imgCaixa: TImage;
    lblRegistros: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure rgOpcoesClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa : TCaixa;
    procedure ExecutarOperacao;
    procedure ExibirRegistro;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

{Criando a Classe para ser usada no formulario}
procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

{Bloqueando o edit e o label de Input de valor quando necessario}
procedure TFormPrincipal.rgOpcoesClick(Sender: TObject);
begin
  if  (rgOpcoes.ItemIndex = 3) or (rgOpcoes.ItemIndex = 4) then
  begin
     lblValor.Enabled := False;
     edtValor.Enabled := False;
  end
  else
  begin
    lblValor.Enabled := True;
    edtValor.Enabled := True;
  end;
end;

{Função Executar Operação}
procedure TFormPrincipal.ExecutarOperacao;
var
  xOpcao : Integer;
  xValor : Double;
begin
  xOpcao := rgOpcoes.ItemIndex;
  xValor := StrToFloatDef(edtValor.Text, 0);

case TEnumOpcoes(xOpcao) of
    opAbrirCaixa:
    begin
      lblResultado.Caption := FCaixa.AbrirCaixa(xValor);
    end;

    opSuprimento:
    begin
      lblResultado.Caption := FCaixa.AdicionarValor(xValor);
    end;

    opSangria:
    begin
      lblResultado.Caption := FCaixa.RetirarValor(xValor);
    end;

    opSaldoAtual:
    begin
      lblResultado.Caption := FCaixa.MostrarSaldoAtual;
    end;

    opFecharCaixa:
    begin
      lblResultado.Caption := FCaixa.FecharCaixa;
    end

    else
      Raise exception.Create('Erro ao operar o caixa, escolha uma opção')
  end;

end;

{Funçao exibir registro}
procedure TFormPrincipal.ExibirRegistro;
begin
  if imgCaixa.Visible = True then
  begin
    imgCaixa.Visible   := False;
    mmRegistro.Visible := True;
    mmRegistro.Lines.Add(FCaixa.Registros);
  end
  else
  begin
    imgCaixa.Visible   := True;
    mmRegistro.Visible := False;
    mmRegistro.Clear;
  end;
end;

{Botão Executar Operação = Chama a função Executar operacao}
procedure TFormPrincipal.btnExecutarClick(Sender: TObject);
begin
  ExecutarOperacao;
end;

{Botao exibir registro = Chama a função Exibir Registro}
procedure TFormPrincipal.btnExibirClick(Sender: TObject);
begin
  ExibirRegistro;
end;

{Botão Sair da Aplicação = Fechando a Aplicação}
procedure TFormPrincipal.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

{Limpando a memoria ao fechar o Formulario}
procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

end.
