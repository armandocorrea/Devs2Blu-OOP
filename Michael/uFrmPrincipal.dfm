object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 543
  ClientWidth = 686
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
  object Panel2: TPanel
    Left = 8
    Top = 60
    Width = 617
    Height = 393
    TabOrder = 6
    object lbAbilitar: TLabel
      Left = 72
      Top = 56
      Width = 87
      Height = 16
      Caption = 'Reabilitar Edt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label1Click
    end
    object Label2: TLabel
      Left = 129
      Top = 16
      Width = 338
      Height = 25
      Caption = 'Caixa do Supermercado - GoDev'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 85
      Width = 43
      Height = 16
      Caption = 'Valor :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 357
      Top = 58
      Width = 116
      Height = 16
      Caption = 'Historico Do Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mmHistorico: TMemo
      Left = 248
      Top = 80
      Width = 345
      Height = 289
      TabOrder = 0
    end
  end
  object rdAcao: TRadioGroup
    Left = 16
    Top = 168
    Width = 201
    Height = 169
    Caption = 'rdAcao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Abrir Caixa'
      'Suprimento'
      'Sangria'
      'Saldo Atual'
      'Fechar Caixa')
    ParentFont = False
    TabOrder = 0
  end
  object btnExecutar: TButton
    Left = 16
    Top = 343
    Width = 201
    Height = 26
    Caption = 'Executar opera'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnExecutarClick
  end
  object btnExibir: TButton
    Left = 16
    Top = 375
    Width = 201
    Height = 26
    Caption = 'Exibir Opera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnExibirClick
  end
  object btnSair: TButton
    Left = 16
    Top = 407
    Width = 201
    Height = 26
    Caption = 'Sair do Aplica'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSairClick
  end
  object edtValor: TEdit
    Left = 62
    Top = 138
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumbersOnly = True
    ParentFont = False
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 8
    Top = 455
    Width = 617
    Height = 26
    TabOrder = 5
    object lbResultado: TLabel
      Left = 28
      Top = 4
      Width = 157
      Height = 16
      Caption = 'Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
