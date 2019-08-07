object frmCadNotaServico_Canc: TfrmCadNotaServico_Canc
  Left = 285
  Top = 197
  Width = 825
  Height = 190
  Caption = 'frmCadNotaServico_Canc'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 66
    Top = 24
    Width = 41
    Height = 13
    Caption = 'N'#186' Nota:'
  end
  object Label2: TLabel
    Left = 11
    Top = 44
    Width = 96
    Height = 13
    Caption = 'C'#243'd. Cancelamento:'
  end
  object Label3: TLabel
    Left = 72
    Top = 64
    Width = 35
    Height = 13
    Caption = 'Motivo:'
  end
  object Label4: TLabel
    Left = 19
    Top = 88
    Width = 88
    Height = 13
    Caption = 'Dt. Cancelamento:'
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 109
    Top = 16
    Width = 99
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 111
    Width = 809
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 4
    object btnConfirmar: TRzBitBtn
      Left = 292
      Top = 8
      Width = 100
      Height = 27
      Caption = 'Confirmar'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333377FF333333333000033334224333333333333
        337777FF333333330000333422224333333333333777777FF333333300003342
        2222243333333333777777777F333333000034222A22224333333337777F7777
        7F33333300003222A3A222433333333777F3F7777FF3333300003A2A333A2224
        333333377F333F7777FF3333000033A33333A22243333333F33333F7777FF333
        0000333333333A22243333333333333F7777FF3300003333333333A222433333
        33333333F7777F33000033333333333A22243333333333333F7777F300003333
        33333333A22243333333333333F7777F00003333333333333A22433333333333
        333F7773000033333333333333A22333333333333333F7730000333333333333
        333A33333333333333333F330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelar: TRzBitBtn
      Left = 392
      Top = 8
      Width = 100
      Height = 27
      Caption = 'Cancelar'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033337733333333333333333F333333333333
        0000333911733333973333333377F333333F3333000033391117333911733333
        37F37F333F77F33300003339111173911117333337F337F3F7337F3300003333
        911117111117333337F3337F733337F3000033333911111111733333337F3337
        3333F7330000333333911111173333333337F333333F73330000333333311111
        7333333333337F3333373333000033333339111173333333333337F333733333
        00003333339111117333333333333733337F3333000033333911171117333333
        33337333337F333300003333911173911173333333373337F337F33300003333
        9117333911173333337F33737F337F33000033333913333391113333337FF733
        37F337F300003333333333333919333333377333337FFF730000333333333333
        3333333333333333333777330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Edit1: TEdit
    Left = 109
    Top = 60
    Width = 668
    Height = 19
    Ctl3D = False
    MaxLength = 100
    ParentCtl3D = False
    TabOrder = 2
  end
  object RzComboBox1: TRzComboBox
    Left = 109
    Top = 38
    Width = 180
    Height = 21
    Ctl3D = False
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 1
    Items.Strings = (
      'N'#227'o cancelar'
      '1 - Erro na emiss'#227'o'
      '2 - Servi'#231'o n'#227'o prestado'
      '3 - Erro de assinatura'
      '4 - Duplicidade da nota'
      '5 - Erro de processamento')
  end
  object DateEdit1: TDateEdit
    Left = 109
    Top = 80
    Width = 121
    Height = 21
    Ctl3D = False
    NumGlyphs = 2
    ParentCtl3D = False
    TabOrder = 3
  end
end
