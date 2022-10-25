object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caixa'
  ClientHeight = 408
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 43
    Width = 39
    Height = 16
    Caption = 'Valor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 368
    Width = 3
    Height = 13
  end
  object edtValor: TEdit
    Left = 74
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object RgOpcoes: TRadioGroup
    Left = 24
    Top = 80
    Width = 171
    Height = 121
    Caption = 'Op'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Abrir Caixa'
      'Suprimento'
      'Sangria'
      'Saldo Atual'
      'Fechar Caixa')
    ParentFont = False
    TabOrder = 1
  end
  object btnExecutar: TButton
    Left = 24
    Top = 224
    Width = 171
    Height = 25
    Caption = 'Executar Opera'#231#227'o'
    TabOrder = 2
    OnClick = btnExecutarClick
  end
  object btnExibir: TButton
    Left = 24
    Top = 272
    Width = 171
    Height = 25
    Caption = 'Exibir Opera'#231#245'es'
    TabOrder = 3
    OnClick = btnExibirClick
  end
  object btnSair: TButton
    Left = 24
    Top = 318
    Width = 171
    Height = 25
    Caption = 'Sair da Aplica'#231#227'o'
    TabOrder = 4
    OnClick = btnSairClick
  end
  object mmHistorico: TMemo
    Left = 216
    Top = 40
    Width = 185
    Height = 303
    TabOrder = 5
    Visible = False
  end
end
