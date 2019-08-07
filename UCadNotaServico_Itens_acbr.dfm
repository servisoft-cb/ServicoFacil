object frmCadNotaServico_Itens: TfrmCadNotaServico_Itens
  Left = 248
  Top = 295
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadNotaServico_Itens'
  ClientHeight = 200
  ClientWidth = 767
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 41
    Top = 59
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade:'
  end
  object Label3: TLabel
    Left = 42
    Top = 81
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr. Unit'#225'rio:'
  end
  object Label4: TLabel
    Left = 54
    Top = 101
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr. Total:'
  end
  object Label5: TLabel
    Left = 215
    Top = 59
    Width = 108
    Height = 13
    Alignment = taRightJustify
    Caption = 'Somar/Diminuir (Total):'
  end
  object Label6: TLabel
    Left = 254
    Top = 79
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Calcular INSS:'
  end
  object Label7: TLabel
    Left = 246
    Top = 99
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = 'Calcular ISSQN:'
  end
  object Label8: TLabel
    Left = 502
    Top = 77
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tributo Federal %:'
  end
  object Label9: TLabel
    Left = 651
    Top = 77
    Width = 15
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr:'
  end
  object Label10: TLabel
    Left = 496
    Top = 97
    Width = 91
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tributo Estadual %:'
  end
  object Label11: TLabel
    Left = 651
    Top = 97
    Width = 15
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr:'
  end
  object Label12: TLabel
    Left = 492
    Top = 117
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tributo Municipal %:'
  end
  object Label13: TLabel
    Left = 651
    Top = 117
    Width = 15
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr:'
  end
  object Label14: TLabel
    Left = 218
    Top = 119
    Width = 105
    Height = 13
    Alignment = taRightJustify
    Caption = 'Calcular PIS/COFINS:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 159
    Width = 767
    Height = 41
    Align = alBottom
    Color = 8404992
    TabOrder = 7
    object BitBtn1: TBitBtn
      Left = 256
      Top = 8
      Width = 102
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 358
      Top = 8
      Width = 102
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object DBEdit2: TDBEdit
    Left = 101
    Top = 53
    Width = 81
    Height = 21
    AutoSize = False
    Ctl3D = False
    DataField = 'QTD'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    TabOrder = 1
    OnExit = DBEdit2Exit
  end
  object DBEdit3: TDBEdit
    Left = 101
    Top = 73
    Width = 81
    Height = 21
    AutoSize = False
    Ctl3D = False
    DataField = 'VLR_UNITARIO'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    TabOrder = 2
    OnExit = DBEdit3Exit
  end
  object DBEdit4: TDBEdit
    Left = 101
    Top = 93
    Width = 81
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'VLR_TOTAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 6
  end
  object RzDBComboBox1: TRzDBComboBox
    Left = 325
    Top = 52
    Width = 145
    Height = 21
    DataField = 'SOMAR_DIMINUIR'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    Style = csDropDownList
    Ctl3D = False
    FrameColor = -1
    FrameHotColor = clBlack
    FrameHotTrack = True
    FrameHotStyle = fsStatus
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 3
    Items.Strings = (
      'Somar'
      'Diminuir')
    Values.Strings = (
      'S'
      'D')
  end
  object RzDBComboBox2: TRzDBComboBox
    Left = 325
    Top = 72
    Width = 145
    Height = 21
    DataField = 'CALCULAR_INSS'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    Style = csDropDownList
    Ctl3D = False
    FrameColor = -1
    FrameHotColor = clBlack
    FrameHotTrack = True
    FrameHotStyle = fsStatus
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 4
    Items.Strings = (
      'Sim'
      'N'#227'o')
    Values.Strings = (
      'S'
      'N')
  end
  object RzDBComboBox3: TRzDBComboBox
    Left = 325
    Top = 92
    Width = 145
    Height = 21
    DataField = 'CALCULAR_ISSQN'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    Style = csDropDownList
    Ctl3D = False
    FrameColor = -1
    FrameHotColor = clBlack
    FrameHotTrack = True
    FrameHotStyle = fsStatus
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 5
    Items.Strings = (
      'Sim'
      'N'#227'o')
    Values.Strings = (
      'S'
      'N')
  end
  object DBEdit6: TDBEdit
    Left = 589
    Top = 69
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'PERC_TRIBUTO_FEDERAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 8
    OnExit = DBEdit3Exit
  end
  object DBEdit7: TDBEdit
    Left = 668
    Top = 69
    Width = 81
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'VLR_TRIBUTO_FEDERAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 9
    OnExit = DBEdit3Exit
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 0
    OnExit = Panel2Exit
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Servi'#231'o Interno:'
    end
    object SpeedButton1: TSpeedButton
      Left = 674
      Top = 13
      Width = 23
      Height = 22
      Hint = 'Atualiza tabela de cliente'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
        F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
        F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
        CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
        E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
        B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
        F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
        9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
        FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
        53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
        F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
        FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
        BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
        F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
        BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
        92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
        997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
        CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
        FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
        FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
        FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
        FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
        C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
        BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
        E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
        78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
        C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
        FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
        EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
        F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
        FFFEFEFFFFFFFFFFFFFF}
      Margin = 0
      OnClick = SpeedButton1Click
    end
    object DBEdit1: TDBEdit
      Left = 101
      Top = 14
      Width = 81
      Height = 21
      AutoSize = False
      Ctl3D = False
      DataField = 'ID_SERVICO_INT'
      DataSource = DMCadNotaServico.dsNotaServico_Itens
      ParentCtl3D = False
      TabOrder = 0
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 181
      Top = 14
      Width = 493
      Height = 21
      DropDownCount = 15
      Ctl3D = False
      DataField = 'ID_SERVICO_INT'
      DataSource = DMCadNotaServico.dsNotaServico_Itens
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMCadNotaServico.dsServico_Int
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
    object DBEdit5: TDBEdit
      Left = 181
      Top = 34
      Width = 493
      Height = 19
      Ctl3D = False
      DataField = 'NOME_SERVICO_INT'
      DataSource = DMCadNotaServico.dsNotaServico_Itens
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  object DBEdit8: TDBEdit
    Left = 589
    Top = 89
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'PERC_TRIBUTO_ESTADUAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 10
    OnExit = DBEdit3Exit
  end
  object DBEdit9: TDBEdit
    Left = 668
    Top = 89
    Width = 81
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'VLR_TRIBUTO_ESTADUAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 11
    OnExit = DBEdit3Exit
  end
  object DBEdit10: TDBEdit
    Left = 589
    Top = 109
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'PERC_TRIBUTO_MUNICIPAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 12
    OnExit = DBEdit3Exit
  end
  object DBEdit11: TDBEdit
    Left = 668
    Top = 109
    Width = 81
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DataField = 'VLR_TRIBUTO_MUNICIPAL'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 13
    OnExit = DBEdit3Exit
  end
  object RzDBComboBox4: TRzDBComboBox
    Left = 325
    Top = 112
    Width = 145
    Height = 21
    DataField = 'CALCULAR_PISCOFINS'
    DataSource = DMCadNotaServico.dsNotaServico_Itens
    Style = csDropDownList
    Ctl3D = False
    FrameColor = -1
    FrameHotColor = clBlack
    FrameHotTrack = True
    FrameHotStyle = fsStatus
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 14
    Items.Strings = (
      'Sim'
      'N'#227'o')
    Values.Strings = (
      'S'
      'N')
  end
end
