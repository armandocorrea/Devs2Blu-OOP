object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 321
  ClientWidth = 348
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
    Left = 39
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Valor :'
  end
  object Label2: TLabel
    Left = 8
    Top = 302
    Width = 75
    Height = 18
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 83
    Top = 24
    Width = 132
    Height = 21
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 39
    Top = 51
    Width = 176
    Height = 142
    Caption = 'Op'#231#245'es'
    TabOrder = 1
  end
  object Abrircaixa: TRadioButton
    Left = 46
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Abir Caixa'
    TabOrder = 2
  end
  object Suprimento: TRadioButton
    Left = 46
    Top = 95
    Width = 113
    Height = 17
    Caption = 'Suprimento'
    TabOrder = 3
  end
  object Sangria: TRadioButton
    Left = 46
    Top = 118
    Width = 113
    Height = 17
    Caption = 'Sangria'
    TabOrder = 4
  end
  object SaldoAtual: TRadioButton
    Left = 46
    Top = 141
    Width = 113
    Height = 17
    Caption = 'Saldo Atual'
    TabOrder = 5
  end
  object RadioButton5: TRadioButton
    Left = 46
    Top = 164
    Width = 113
    Height = 17
    Caption = 'Fechar Caixa'
    TabOrder = 6
  end
  object Button1: TButton
    Left = 39
    Top = 209
    Width = 176
    Height = 25
    Caption = 'Executar Opera'#231#227'o'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 39
    Top = 240
    Width = 176
    Height = 25
    Caption = 'Exibir Opera'#231#245'es'
    TabOrder = 8
  end
  object Button3: TButton
    Left = 39
    Top = 271
    Width = 176
    Height = 25
    Caption = 'Sair da Aplica'#231#227'o'
    TabOrder = 9
  end
end
