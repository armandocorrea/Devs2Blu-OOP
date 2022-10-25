unit ExercicioFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCaixa, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    rgOpcoes: TRadioGroup;
    btnExecutarOP: TButton;
    btnExibirOP: TButton;
    btnSair: TButton;
    lblResult: TLabel;
    mmDisplay: TMemo;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarOPClick(Sender: TObject);
    procedure btnExibirOPClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa: TCaixa;
    FLog: TStringList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExecutarOPClick(Sender: TObject);
begin
  case TOpcoes(rgOpcoes.ItemIndex) of

    stAbrirCaixa:
      begin
        var
          xResult: String;

        xResult := edtValor.Text;

        if not Assigned(FCaixa) then
        begin
          FCaixa := TCaixa.Create;
        end;

        xResult := FCaixa.AbrirCaixa(xResult);

        lblResult.Caption := xResult;
        lblResult.Visible := True;
        FLog.Add(xResult);
        edtValor.Clear;
        lblResult.Enabled := True;
        edtValor.Enabled := True;
        mmDisplay.Visible := False;
      end;

    stSuprimento:
      begin
        var
          xResult: String;

        xResult := edtValor.Text;

        xResult := FCaixa.AdicionarValor(xResult);

        lblResult.Caption := xResult;
        lblResult.Visible := True;
        FLog.Add(xResult);
        edtValor.Clear;
      end;

    stSangria:
      begin
        var
          xResult: String;

        xResult := edtValor.Text;

        xResult := FCaixa.RetirarValor(xResult);

        lblResult.Caption := xResult;
        lblResult.Visible := True;
        FLog.Add(xResult);
        edtValor.Clear;
      end;

    stSaldoAtual:
      begin
        var
          xResult: String;

        xResult := FCaixa.SaldoAtual;

        lblResult.Caption := xResult;
        lblResult.Visible := True;
        edtValor.Clear;
      end;

    stFecharCaixa:
      begin
        var
          xResult: String;

        xResult := FCaixa.FecharCaixa;

        lblResult.Caption := xResult;
        lblResult.Visible := True;
        edtValor.Clear;

        lblResult.Enabled := False;
        edtValor.Enabled := False;
      end;

  end;
end;

procedure TForm1.btnExibirOPClick(Sender: TObject);
var
  I: integer;
begin
   for I := 0 to FLog.Count - 1 do
   begin
     mmDisplay.Lines.add(Flog[I]);
   end;

   mmDisplay.Visible := True;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
  FreeAndNil(FLog);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
  FLog := TStringList.Create;
 end;

end.
