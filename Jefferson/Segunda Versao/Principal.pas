unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, UCaixa;

type
  TenumOper = (StAbrir, stSuprir, stSacar, stSaldo, stfechar);

  TForm2 = class(TForm)
    LB_Valor: TLabel;
    EDT_Valor: TEdit;
    RDGroup: TRadioGroup;
    BT_Executar: TButton;
    BT_Exibir: TButton;
    BT_Sair: TButton;
    LB_Resultado: TLabel;
    Image1: TImage;
    MMBox: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ExecutarClick(Sender: TObject);
    procedure BT_ExibirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCaixa : TCaixa;


  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BT_ExecutarClick(Sender: TObject);
  begin
   case TenumOper(RDGroup.ItemIndex)  of
    stAbrir:
      begin
      Fcaixa.abrirCaixa(strTofloatdef(EDT_Valor.text,0));
      LB_Resultado.Caption := ('Saldo de caixa R$ ' + Fcaixa.SaldoFinal.ToString);
      end;
    stSuprir:
      begin
      Fcaixa.adicionarValor(strTofloatdef(EDT_Valor.text, 0));
      LB_Resultado.Caption := ('Saldo de caixa R$ ' + Fcaixa.SaldoFinal.ToString);
      end;
    stsacar:
      begin
      fcaixa.retirarValor((strTofloatdef(EDT_Valor.text,0)));
      LB_Resultado.Caption := ('Saldo de caixa R$ ' + Fcaixa.SaldoFinal.ToString);
      end;
    stSaldo:
      begin
      showMessage('Saldo atual R$  ' + fcaixa.SaldoFinal.ToString);
      LB_Resultado.Caption := ('Saldo de caixa R$ ' + Fcaixa.SaldoFinal.ToString);
      EDT_Valor.Enabled := False;
      fcaixa.Consultar;

      end;
    stfechar:
      begin
      fcaixa.fecharCaixa;
      showMessage('Caixa fechado com saldo final de  ' + Fcaixa.SaldoFinal.tostring);
      LB_Resultado.Caption := ('Caixa fechado');
      EDT_Valor.Enabled := False;
      end;
   end;
  end;

procedure TForm2.BT_ExibirClick(Sender: TObject);
  begin
   if (MMBox.Visible = true) then
    MMBox.Visible := false
   else
    MMBox.Visible := true;
    mmbox.Lines := FCaixa.Stringlist;
  end;

procedure TForm2.BT_SairClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(Fcaixa);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   Fcaixa := Tcaixa.create;
end;

end.
