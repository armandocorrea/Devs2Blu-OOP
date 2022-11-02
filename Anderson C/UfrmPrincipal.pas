unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCaixa, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFuncao = (tpAbrirCaixa, tpSuplemento, tpSangria, tpSaldoAtual, tpFecharCaixa);
  TfrmPrincipal = class(TForm)
    mmExtrato: TMemo;
    edtValor: TEdit;
    btdExecurar: TButton;
    lblValor: TLabel;
    rdgOperacoes: TRadioGroup;
    btnExtrato: TButton;
    btnSair: TButton;
    Shape1: TShape;
    Image: TImage;
    lblAcao: TLabel;
    procedure btdExecurarClick(Sender: TObject);
    procedure btnExtratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgOperacoesClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    xCaixa: TCaixa;

  public

      { Public declarations }
    end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

//Separar os Métodos por Case
procedure TfrmPrincipal.btdExecurarClick(Sender: TObject);
  begin
    case TFuncao(rdgOperacoes.ItemIndex) of
      tpAbrirCaixa:
        begin
          lblAcao.Caption := xCaixa.AbrirCaixa(edtValor.Text);
          edtValor.Enabled := True;
        end;

      tpSuplemento:
        begin
          lblAcao.Caption := xCaixa.AdicionarValor(edtValor.Text);
        end;

      tpSangria:
        begin
          lblAcao.Caption := xCaixa.RetirarValor(edtValor.Text);
        end;

      tpSaldoAtual:
        begin
          lblAcao.Caption := xCaixa.SaldoAtual;
          edtValor.Enabled := False;
        end;

      tpFecharCaixa:
        begin
          lblAcao.Caption := xCaixa.FecharCaixa;
          edtValor.Enabled := False;
        end;

      else  // Evita que o usuário não seleciona nenhuma opção
        raise Exception.Create('Erro de Seleção de Operação');
    end;
    if not lblAcao.Visible then lblAcao.Visible := True;
  end;

procedure TfrmPrincipal.btnExtratoClick(Sender: TObject);
  begin
    mmExtrato.Lines := xCaixa.ExibirExtrato;
    if not mmExtrato.visible then mmExtrato.visible := True else mmExtrato.visible := False;
    //Para ficar alternando entre Aberto e fechado
  end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
  begin
    Application.Terminate;
  end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(xCaixa);
  end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
  begin
    xCaixa := Tcaixa.Create;
  end;

procedure TfrmPrincipal.rdgOperacoesClick(Sender: TObject);
  begin
    edtValor.Enabled := True; // Reabilita o edtit do Valor
  end;

end.
