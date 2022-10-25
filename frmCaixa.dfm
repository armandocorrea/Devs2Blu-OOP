object FormCaixa: TFormCaixa
  Left = 0
  Top = 0
  Caption = 'Caixa +Devs2Blu'
  ClientHeight = 407
  ClientWidth = 418
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
  object labelResultado: TLabel
    Left = 40
    Top = 184
    Width = 31
    Height = 13
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 24
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object btnExecutarOperacao: TButton
    Left = 272
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Executar Opera'#231#227'o'
    TabOrder = 0
    OnClick = btnExecutarOperacaoClick
  end
  object btnListarOperacoes: TButton
    Left = 272
    Top = 96
    Width = 121
    Height = 25
    Caption = 'Listar Opera'#231#245'es'
    Enabled = False
    TabOrder = 1
    OnClick = btnListarOperacoesClick
  end
  object btnSair: TButton
    Left = 272
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object rgOpcoes: TRadioGroup
    Left = 32
    Top = 56
    Width = 185
    Height = 105
    Caption = 'Op'#231#245'es'
    Items.Strings = (
      'Abrir Caixa'
      'Suprimento'
      'Sangria'
      'Saldo Atual'
      'Fechar Caixa')
    TabOrder = 3
  end
  object edtValorEntrada: TEdit
    Left = 96
    Top = 21
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object memoResultado: TMemo
    Left = 32
    Top = 216
    Width = 361
    Height = 169
    ReadOnly = True
    TabOrder = 5
  end
end
