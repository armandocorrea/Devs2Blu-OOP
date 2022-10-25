unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uCaixa;

type
  TopcaoCaixa = (tpAbrirCaixa, tpSuprimento, tpSangria, tpSaldo, tpFecharCaixa);
  TForm1 = class(TForm)
    rdAcao: TRadioGroup;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    edtValor: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    lbAbilitar: TLabel;
    Label2: TLabel;
    lbResultado: TLabel;
    Label3: TLabel;
    mmHistorico: TMemo;
    Label1: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExibirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    FCaixa : TCaixa;
    procedure CaixaMerdado;
    procedure confirmacao;
    procedure limpaEdt;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExecutarClick(Sender: TObject);
begin
  CaixaMerdado;
  limpaEdt;
end;

procedure TForm1.btnExibirClick(Sender: TObject);
begin
  mmHistorico.Lines := FCaixa.Historico;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TForm1.CaixaMerdado;
begin
  try
    if not Assigned(Fcaixa) then
      FCaixa := Tcaixa.Create;

  case TopcaoCaixa(rdAcao.ItemIndex) of

    tpAbrirCaixa:
      begin
        FCaixa.AbrirCaixa(StrToFloat(edtValor.text));
        lbResultado.caption := ('Caixa Aberto');
        self.confirmacao;
      end;

    tpSuprimento:
      begin
        FCaixa.AdicionarValor(StrToFloat(edtValor.text));
        lbResultado.caption := ('Valor Adicionado : '+edtValor.text);
        self.confirmacao;
      end;

    tpSangria:
      begin
        FCaixa.RetirarValor(StrToFloat(edtValor.Text));
        lbResultado.caption := ('Valor Removido : '+edtValor.text);
        self.confirmacao
      end;

    tpSaldo:
      begin
        lbResultado.caption := (' Saldo : ' +CurrToStr(FCaixa.SaldoAtual));
        self.confirmacao;edtValor.Enabled := True;;
        edtValor.Enabled := false;
      end;

    tpFecharCaixa:
      begin
        FCaixa.FecharCaixa;
        self.confirmacao;
        edtValor.Enabled := false;
      end;
  end;

  Except
    on E:Exception do
    raise Exception.Create(E.Message);

  end;

end;


procedure TForm1.confirmacao;
begin
  ShowMessage('Operação Realizada.');
end;

procedure TForm1.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',', '.', #8])  then
   Key:= #0;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Fcaixa);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

procedure TForm1.Label1Click(Sender: TObject);
var
  xConfirmar : integer;
begin
  if edtValor.Enabled = false then
    xconfirmar := MessageDlg('Abilitar?',mtError, mbOKCancel, 0);
      if xconfirmar = mrOK then
        edtValor.Enabled := true;
      if xconfirmar = mrCancel then
        edtValor.Enabled := false;
end;

procedure TForm1.limpaEdt;
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TEdit) then
      (Self.Components[i] as TEdit).Clear;
end;

end.
