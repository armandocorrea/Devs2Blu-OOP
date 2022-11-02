object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caixa do Supermercado - GoDev'
  ClientHeight = 365
  ClientWidth = 558
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
    Left = 16
    Top = 43
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object lb_resultados: TLabel
    Left = 16
    Top = 332
    Width = 3
    Height = 13
  end
  object edt_valor: TEdit
    Left = 50
    Top = 40
    Width = 151
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = edt_valorChange
  end
  object rdg_opcoes: TRadioGroup
    Left = 16
    Top = 80
    Width = 185
    Height = 137
    Caption = 'Op'#231#245'es'
    Items.Strings = (
      'Abrir Caixa'
      'Suprimento'
      'Sangria'
      'Saldo Atual'
      'Fechar Caixa')
    TabOrder = 1
  end
  object btn_executarOperacao: TButton
    Left = 16
    Top = 232
    Width = 185
    Height = 25
    Caption = 'Executar Opera'#231#227'o'
    TabOrder = 2
    OnClick = btn_executarOperacaoClick
  end
  object btn_exibirOperacoes: TButton
    Left = 16
    Top = 264
    Width = 185
    Height = 25
    Caption = 'Exibir Opera'#231#245'es'
    TabOrder = 3
  end
  object btn_sairAplicacao: TButton
    Left = 16
    Top = 295
    Width = 185
    Height = 25
    Caption = 'Sair da Aplica'#231#227'o'
    TabOrder = 4
  end
  object mm_apresentacaoInformacoes: TMemo
    Left = 216
    Top = 16
    Width = 334
    Height = 305
    TabOrder = 5
  end
end
