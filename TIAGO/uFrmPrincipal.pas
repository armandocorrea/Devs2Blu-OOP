unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uCaixa;

type
  TEnumOpcoesCaixa = (AbrirCaixa, Suprimento, Sangria, SaldoAtual, FecharCaixa);

  TFrmCaixaMercado = class(TForm)
    Panel1: TPanel;
    edtValor: TEdit;
    lblValor: TLabel;
    rdgFuncoesCaixa: TRadioGroup;
    btnExecutarOperacao: TButton;
    btnExibirOperacao: TButton;
    btnSairAplicacao: TButton;
    mmMovimentacao: TMemo;
    lblResultado: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarOperacaoClick(Sender: TObject);
    procedure btnSairAplicacaoClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnExibirOperacaoClick(Sender: TObject);
  private
    Procedure OpcoesCaixa;
    { Private declarations }
  public
    FFrenteCaixa: TCaixa;
    { Public declarations }
  end;

var
  FrmCaixaMercado: TFrmCaixaMercado;
  FMovimentosCaixa  : TStringlist;

implementation

{$R *.dfm}
{ TFrmCaixaMercado }

procedure TFrmCaixaMercado.btnExecutarOperacaoClick(Sender: TObject);
begin
  Self.OpcoesCaixa;
end;

procedure TFrmCaixaMercado.btnExibirOperacaoClick(Sender: TObject);
var
  i : Smallint;
begin
  if(Length(edtValor.Text) > 0)then
    //FMovimentosCaixa.Add(edtValor.Text);
    FMovimentosCaixa.Add(lblResultado.Caption);
    //FMovimentosCaixa.Add(FFrenteCaixa.SaldoInicial.ToString);
    //FMovimentosCaixa.Add(FFrenteCaixa.SaldoAtual.ToString);
    //FMovimentosCaixa.Add(FFrenteCaixa..ToString);

  for i := 0 to FMovimentosCaixa.Count -1 do
    mmMovimentacao.Lines.Add(FMovimentosCaixa.Strings[i]);
end;

procedure TFrmCaixaMercado.btnSairAplicacaoClick(Sender: TObject);
begin
  Self.close;
end;

procedure TFrmCaixaMercado.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',','.']) then
    key :=#0;
  if Key = #0 then
    ShowMessage('Informe um valor válido.');
end;

procedure TFrmCaixaMercado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FFrenteCaixa);
  FreeAndNil(FMovimentosCaixa);
end;

procedure TFrmCaixaMercado.FormCreate(Sender: TObject);
begin
  FFrenteCaixa := TCaixa.create(StrToFloatDef(edtValor.Text, 0));
  FMovimentosCaixa := TStringList.Create;
end;

procedure TFrmCaixaMercado.FormShow(Sender: TObject);
begin
  edtValor.ReadOnly := False;
end;

procedure TFrmCaixaMercado.OpcoesCaixa;
begin
  try
    case TEnumOpcoesCaixa(rdgFuncoesCaixa.ItemIndex) of
      AbrirCaixa:
        begin
          FFrenteCaixa.AbrirCaixa(StrToFloatDef(edtValor.Text, 0));
          lblResultado.Caption := ('Valor em caixa é de: ' + FFrenteCaixa.SaldoAtual.ToString);
          ShowMessage('Caixa Aberto.');
        end;
      Suprimento:
        begin
          FFrenteCaixa.AdicionarValor(StrToFloatDef(edtValor.Text, 0));
          lblResultado.Caption := ('Valor em caixa é de: ' + FFrenteCaixa.SaldoAtual.ToString);
        end;
      Sangria:
        begin
          FFrenteCaixa.RetirarValor(StrToFloatDef(edtValor.Text, 0));
          lblResultado.Caption := ('Valor em caixa é de: ' + FFrenteCaixa.SaldoAtual.ToString);
          ShowMessage('Valor retirado foi: ' + edtValor.Text);
        end;
      SaldoAtual:
        begin
          //FFrenteCaixa.SaldoAtual(StrToFloatDef(edtValor.Text, 0));
          if FFrenteCaixa.CaixaAberto = False then
            raise Exception.Create('O caixa não foi aberto ainda, por favor abra o caixa para continuar.');
            lblResultado.Caption := ('Saldo atual do caixa é de: ' + FFrenteCaixa.SaldoAtual.ToString);
        end;
      FecharCaixa:
        begin
          FFrenteCaixa.FecharCaixa;
          edtValor.ReadOnly := True;
          lblResultado.Caption := ('Fechamento do caixa Valor: ' + FFrenteCaixa.SaldoAtual.ToString);
        end;
    end;
  finally

  end;

end;

end.
