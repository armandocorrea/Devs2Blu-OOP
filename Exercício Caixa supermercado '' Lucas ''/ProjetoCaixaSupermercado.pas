unit ProjetoCaixaSupermercado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Ucaixa;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Abrircaixa: TRadioButton;
    Suprimento: TRadioButton;
    Sangria: TRadioButton;
    SaldoAtual: TRadioButton;
    RadioButton5: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCaixa : TCaixa;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
 try
  if RadioGroup1.itemIndex = 0 then
  //AbrirCaixa
  begin
    Fcaixa.AbrirCaixa;
    label2.caption := ('Caixa Aberto');
  end;

  //Suprimento
  if RadioGroup1.itemIndex = 1 then
  begin
    Fcaixa.AdicionarValor;
    Label2.Caption :=(' Adicionou ' +Edit1.text);
  end;

  //Sangria
  if RadioGroup1.itemIndex = 2 then
  begin
    Fcaixa.RetirarValor;
  end;

  //Saldo Atual
  if RadioGroup1.itemIndex = 3 then
  begin
    Fcaixa.Saldoatual;
  end;

  //Fechar Caixa
  if RadioGroup1.itemIndex = 4 then
  begin
    Fcaixa.FecharCaixa;
  end;
 finally
   Fcaixa.free;
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

end.
