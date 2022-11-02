object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caixa de Supermercado - SuperDelphi'
  ClientHeight = 357
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 28
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Resultado: TLabel
    Left = 24
    Top = 312
    Width = 82
    Height = 19
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 65
    Width = 185
    Height = 105
    Caption = 'Op'#231#245'es'
    ItemIndex = 0
    Items.Strings = (
      'Abrir Caixa'
      'Suprimento'
      'Sangria'
      'Saldo Atual'
      'Fechar Caixa')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object Executar: TButton
    Left = 32
    Top = 193
    Width = 177
    Height = 25
    Caption = 'Executar Operac'#227'o'
    TabOrder = 2
    OnClick = ExecutarClick
  end
  object Exibir: TButton
    Left = 32
    Top = 224
    Width = 177
    Height = 25
    Caption = 'Exibir Opera'#231#245'es'
    TabOrder = 3
    OnClick = ExibirClick
  end
  object Sair: TButton
    Left = 32
    Top = 255
    Width = 177
    Height = 25
    Caption = 'Sair da aplica'#231#227'o'
    TabOrder = 4
    OnClick = SairClick
  end
  object Memo1: TMemo
    Left = 240
    Top = 25
    Width = 345
    Height = 255
    Lines.Strings = (
      'Opera'#231#245'es:')
    TabOrder = 5
  end
  object NumberBox1: TNumberBox
    Left = 80
    Top = 25
    Width = 129
    Height = 21
    Mode = nbmFloat
    TabOrder = 0
  end
end
