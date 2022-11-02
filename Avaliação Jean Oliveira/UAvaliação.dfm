object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Caixa de supermercado - GoDev'
  ClientHeight = 510
  ClientWidth = 606
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
    Left = 13
    Top = 44
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
  object Image1: TImage
    Left = 224
    Top = 8
    Width = 361
    Height = 457
  end
  object lblresultado: TLabel
    Left = 8
    Top = 496
    Width = 3
    Height = 13
  end
  object edtValor: TEdit
    Left = 58
    Top = 43
    Width = 151
    Height = 21
    TabOrder = 0
  end
  object Rdgopcoes: TRadioGroup
    Left = 24
    Top = 112
    Width = 185
    Height = 153
    Caption = 'Op'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Abrir caixa'
      'Suprimento'
      'Samgria'
      'Saldo Atual'
      'Fechar Caixa')
    ParentFont = False
    TabOrder = 1
  end
  object btmexecutarop: TButton
    Left = 24
    Top = 288
    Width = 177
    Height = 25
    Caption = 'Executar Opera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btmexecutaropClick
  end
  object btmexibirop: TButton
    Left = 24
    Top = 327
    Width = 177
    Height = 25
    Caption = 'Exibir Opera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object btmsair: TButton
    Left = 24
    Top = 368
    Width = 177
    Height = 25
    Caption = 'Sair da Aplica'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btmsairClick
  end
end
