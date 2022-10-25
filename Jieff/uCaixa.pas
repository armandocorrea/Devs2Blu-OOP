unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uCaixaClass, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.Classes;

type
  TEnumCaixa =(stAbrirCaixa, stSuprimento, stSangria, stSaldoAtual, stFecharCaixa);
  TfrmCaixa = class(TForm)
    edtValor: TEdit;
    Label1: TLabel;
    rgOpcoes: TRadioGroup;
    btnExe: TButton;
    btnExibir: TButton;
    btnSair: TButton;
    Panel1: TPanel;
    lblResultado: TLabel;
    memo: TMemo;
    Image1: TImage;
    procedure btnExeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xCaixa : TCaixa;
    xHistorico : TStringList;
  end;

var
  frmCaixa: TfrmCaixa;

implementation



{$R *.dfm}

procedure TfrmCaixa.btnExeClick(Sender: TObject);
var
  xValor: double;
begin

  xValor := StrToFloat(edtValor.Text);

  try
    case TEnumCaixa(rgOpcoes.ItemIndex) of
      stAbrirCaixa:
      begin
        xCaixa.abrirCaixa(true);
        lblResultado.Caption := ('Caixa Aberto com: R$ '+ FloatToStr(xValor));
        xCaixa.saldoIncial := xValor;
        xCaixa.saldoAtual := xCaixa.saldoIncial;
        xHistorico.Add(lblResultado.Caption);

      end;
        stSuprimento:
      begin
        xCaixa.adicionarDinheiro(xValor);
        lblResultado.Caption := ('Saldo adicionado, atualizado R$: ' + FloatToStr(xCaixa.saldoAtual));
        xHistorico.add(lblResultado.Caption);

      end;
      stSangria:
      begin
        xCaixa.retirarDinheiro(xValor);
        lblResultado.Caption := ('Saldo retirado, atualizado R$: ' + FloatToStr(xCaixa.saldoAtual));
        xHistorico.add(lblResultado.Caption);

      end;
      stSaldoAtual:
      begin
        xCaixa.exibirSaldoAtual(xValor);
        lblResultado.Caption := ('Saldo atual R$: ' + FloatToStr(xCaixa.saldoAtual));
        xHistorico.add(lblResultado.Caption);

      end;
      stFecharCaixa:
      begin
        xCaixa.fecharCaixa(false);
        lblResultado.Caption := ('Caixa Fechado');
        xHistorico.add(lblResultado.Caption);

      end;

    end;

  finally


  end;

end;


procedure TfrmCaixa.btnExibirClick(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to xHistorico.Count -1 do
    memo.Lines.add(xHistorico[i]);

end;

procedure TfrmCaixa.btnSairClick(Sender: TObject);
begin
close;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FreeAndNil(xCaixa);
 FreeAndNil(xHistorico);

end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  xCaixa:= TCaixa.Create;
  xHistorico := TStringList.Create;
end;




end.
