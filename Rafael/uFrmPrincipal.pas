unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Caixa;

type
  TForm1 = class(TForm)
    edtValor: TEdit;
    Label1: TLabel;
    RgOpcoes: TRadioGroup;
    btnExecutar: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    mmHistorico: TMemo;
    Label2: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa : TCaixa;
    xCaixa: Boolean;
    procedure AbrirCaixa2;
    procedure RetirarValor2;
    procedure AdicionarValor2;
    procedure FecharCaixa2;
    procedure LimparCaixa;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.AbrirCaixa2;
begin
  FCaixa.AbrirCaixa(StrToFloat(edtValor.Text));
end;

procedure TForm1.AdicionarValor2;
begin
  FCaixa.AdicionarValor(StrToFloat(edtValor.Text));
end;

procedure TForm1.RetirarValor2;
begin
  FCaixa.RetirarValor(StrToFloat(edtValor.Text));
end;

procedure TForm1.FecharCaixa2;
begin
  FCaixa.FecharCaixa;
end;

procedure TForm1.btnExecutarClick(Sender: TObject);
var
  xEntrada: Double;
begin
  if xCaixa = False then
  begin
    FCaixa:= TCaixa.Create;
    xCaixa := True;
  end;

  case RgOpcoes.ItemIndex of
    0: //Abrir Caixa
    begin
      if not TryStrToFloat (edtValor.Text,xEntrada) then
        raise Exception.Create('Informe um valor válido.');
          begin
            FCaixa.AbrirCaixa(xEntrada);
            Label2.Caption:= 'Caixa aberto.';
            mmHistorico.Lines.Add('O caixa foi aberto.');
          end;
    end;
    1: //Adicionar
      begin
        if not TryStrToFloat (edtValor.Text,xEntrada) then
          raise Exception.Create('Informe um valor válido.');
        begin
          FCaixa.AdicionarValor(StrToFloat(edtValor.Text));
          Label2.Caption:= 'Valor adicionado.';
          mmHistorico.Lines.Add('Valor adicionado: ' + (edtValor.Text));
        end;
      end;

    2: //Retirar
      begin
        if not TryStrToFloat (edtValor.Text,xEntrada) then
          raise Exception.Create('Informe um valor válido.');
          begin
            FCaixa.RetirarValor(StrToFloat(edtValor.Text));
            Label2.Caption:= 'Valor retirado.';
            mmHistorico.Lines.Add('Valor retirado: ' + (edtValor.Text));
          end;
      end;

    3: // Saldo Atual
      begin
        Label2.Caption:= 'Saldo atual do caixa: ' + FloatToStr(FCaixa.EnviarSaldo);
        mmHistorico.Lines.Add('Saldo atual: ' + FloatToStr(FCaixa.FSaldoAtual));
      end;

    4: //Fechar Caixa
      begin
        FCaixa.FecharCaixa;
        xCaixa := False;
        Self.LimparCaixa;
      end;
  end;
end;

procedure TForm1.btnExibirClick(Sender: TObject);
begin
  if Not mmHistorico.Visible then
    mmHistorico.Visible := True
  else
    mmHistorico.Visible:= False;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  if Assigned(FCaixa) then
    FreeAndNil(FCaixa);
    Form1.Close
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FCaixa) then
    FreeAndNil(FCaixa);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

procedure TForm1.LimparCaixa;
begin
  FreeAndNil(FCaixa);
end;

end.
