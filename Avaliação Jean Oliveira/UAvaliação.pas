unit UAvaliação;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Ucaixa;

type
  TForm2 = class(TForm)
    edtValor: TEdit;
    Label1: TLabel;
    btmexecutarop: TButton;
    btmexibirop: TButton;
    btmsair: TButton;
    Image1: TImage;
    lblresultado: TLabel;
    Rdgopcoes: Tradiogroup;
    procedure btmexecutaropClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btmsairClick(Sender: TObject);
  private
    Fcaixamercado: tcaixa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btmexecutaropClick(Sender: TObject);

begin

  case Rdgopcoes.itemindex of

    0:
      begin
        lblresultado.Caption :=
          floattostr(Fcaixamercado.abrircaixa(strtofloat(edtValor.Text)));

      end;
    1:
      lblresultado.Caption :=
        floattostr(Fcaixamercado.adicionarvalor(strtofloat(edtValor.Text)));

    2:
      lblresultado.Caption :=
        floattostr(Fcaixamercado.retirarvalor(strtofloat(edtValor.Text)));

    3:
      lblresultado.Caption := floattostr(Fcaixamercado.Saldoatual);

    4:
      Fcaixamercado.fecharcaixa;

  end;

end;

procedure TForm2.btmsairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeandnil(Fcaixamercado);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Fcaixamercado := tcaixa.Create;
end;

end.
