object FrmCaixaMercado: TFrmCaixaMercado
  Left = 0
  Top = 0
  Caption = 'Mercado Tigo'
  ClientHeight = 452
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 452
    Align = alClient
    TabOrder = 0
    object lblValor: TLabel
      Left = 21
      Top = 15
      Width = 43
      Height = 19
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 221
      Top = 15
      Width = 131
      Height = 19
      Caption = 'Movimenta'#231#245'es '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtValor: TEdit
      Left = 70
      Top = 12
      Width = 120
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TextHint = 'Valor'
      OnKeyPress = edtValorKeyPress
    end
    object rdgFuncoesCaixa: TRadioGroup
      Left = 21
      Top = 73
      Width = 169
      Height = 185
      Caption = 'Op'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Abrir Caixa'
        'Suprimento'
        'Sangria'
        'Saldo Atual'
        'Fechar Caixa')
      ParentFont = False
      TabOrder = 1
    end
    object btnExecutarOperacao: TButton
      Left = 21
      Top = 281
      Width = 169
      Height = 25
      Caption = 'Executar Opera'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnExecutarOperacaoClick
    end
    object btnExibirOperacao: TButton
      Left = 21
      Top = 329
      Width = 169
      Height = 25
      Caption = 'Exibir Opera'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnExibirOperacaoClick
    end
    object btnSairAplicacao: TButton
      Left = 21
      Top = 377
      Width = 169
      Height = 25
      Caption = 'Sair Aplica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnSairAplicacaoClick
    end
    object mmMovimentacao: TMemo
      Left = 221
      Top = 41
      Width = 313
      Height = 361
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object Panel2: TPanel
      Left = 1
      Top = 416
      Width = 554
      Height = 35
      Align = alBottom
      TabOrder = 6
      object lblResultado: TLabel
        Left = 6
        Top = 8
        Width = 82
        Height = 19
        Caption = 'Resultado'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
end
