object frmGerar_NFSe_txt: TfrmGerar_NFSe_txt
  Left = 217
  Top = 45
  Width = 928
  Height = 634
  Caption = 'frmGerar_NFSe_txt'
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 105
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 65
      Top = 59
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#234's/Ano Ref:'
    end
    object Label4: TLabel
      Left = 107
      Top = 34
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
    end
    object lbDiretorio: TLabel
      Left = 13
      Top = 15
      Width = 116
      Height = 13
      Alignment = taRightJustify
      Caption = 'Arquivo de Extrato (csv):'
    end
    object Label2: TLabel
      Left = 736
      Top = 15
      Width = 77
      Height = 13
      Caption = 'Qtd.Digitos C'#243'd:'
    end
    object ceAno: TCurrencyEdit
      Left = 248
      Top = 51
      Width = 58
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
    object btnConsultar: TNxButton
      Left = 132
      Top = 73
      Width = 175
      Height = 30
      Caption = 'Montar Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080
        8080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF606060808080808080000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080
        8080000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6060608080808080808080808080800000000000000000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60606080808080808080808080808080
        8080000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF202020
        4040404040404040406060608080808080800000000000000000000000000000
        00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
        8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
        8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404080808080
        8080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040808080808080000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080B0
        B0B0303030000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040B0B0B0C0C0C0C0C0C0303030000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060C0C0C0C0
        C0C0C0C0C0C0C0C0303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 5
      Transparent = True
      OnClick = btnConsultarClick
    end
    object ComboBox3: TComboBox
      Left = 132
      Top = 51
      Width = 114
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'JANEIRO'
        'FEVEREIRO'
        'MAR'#199'O'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO')
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 132
      Top = 29
      Width = 267
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMCadOS.dsFilial
      TabOrder = 1
    end
    object ckRecibo: TCheckBox
      Left = 314
      Top = 53
      Width = 112
      Height = 17
      Caption = 'Verificar no Recibo'
      TabOrder = 4
    end
    object ceQtdDigitos: TCurrencyEdit
      Left = 815
      Top = 7
      Width = 81
      Height = 21
      TabStop = False
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 6
    end
    object RzGroupBox1: TRzGroupBox
      Left = 673
      Top = 31
      Width = 224
      Height = 72
      BorderColor = clMaroon
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = ' Totais '
      Color = clSilver
      Ctl3D = True
      FlatColor = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210816
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      VisualStyle = vsGradient
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 91
        Height = 13
        Caption = 'Qtde. de Notas:'
      end
      object Label5: TLabel
        Left = 50
        Top = 56
        Width = 57
        Height = 13
        Caption = 'Vlr. Total:'
      end
      object Label6: TLabel
        Left = 17
        Top = 36
        Width = 90
        Height = 13
        Caption = 'Q. N'#227'o Gerada:'
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 110
        Top = 8
        Width = 107
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 0
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 110
        Top = 48
        Width = 107
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 110
        Top = 28
        Width = 107
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object File_Extrato: TFilenameEdit
      Left = 132
      Top = 7
      Width = 477
      Height = 21
      NumGlyphs = 1
      TabOrder = 0
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 105
    Width = 912
    Height = 491
    ActivePage = TabSheet1
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = ' Dados '
      object RzGroupBox2: TRzGroupBox
        Left = 0
        Top = 0
        Width = 908
        Height = 296
        Align = alClient
        BorderColor = clBlue
        BorderInner = fsButtonUp
        BorderOuter = fsBump
        Caption = ' Extrato '
        Color = clSilver
        Ctl3D = True
        FlatColor = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        VisualStyle = vsGradient
        object SMDBGrid1: TSMDBGrid
          Left = 38
          Top = 18
          Width = 865
          Height = 273
          Align = alClient
          Ctl3D = False
          DataSource = DMCadOS.dsmExtrato
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Flat = True
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clWindow
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoCheckBoxSelect, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 27
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 12
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Cod_Alfa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Cliente'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Num_Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Contrato'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Nome Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Servico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Servi'#231'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Valor Total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Perc_ISS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '% ISS'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Perc_INSS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '% INSS'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Perc_IR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '% IR'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Retem_INSS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Ret'#233'm INSS'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Retem_ISS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Ret'#233'm ISS'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Retem_IR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Ret'#233'm IR'
              Width = 40
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 5
          Top = 18
          Width = 33
          Height = 273
          Align = alLeft
          Color = clSilver
          TabOrder = 1
          object btnExcluir: TNxButton
            Left = 1
            Top = 3
            Width = 31
            Height = 30
            Hint = 'Excluir o contrato selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDF4A5A19F5955581F1C260000070000
              0C1B2021595C59A7A8A3FEFEF5FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1BEB93E3B4C00000B00004100008D
              010AB20C16BB0710B40002A1000073000033000006414247C9C7BEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4EE827F7B00003300007903
              18BA0717C6040FBB0008B10203AE0202AC0406A50004AD0306A7000096000052
              040325858782F4F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EB716F6B0000
              440014B5031CCB0011BB0003B50000BC0000BD0001BB0000BF0101BB0001BA00
              00B80102A702029F000079000023707376F3F4F1FFFFFFFFFFFFFFFFFFFCFBF7
              76757400004A0323D4011BD10007BB0000B90000BC0000BA0100BB0300BE0300
              C00100C10001BA0000BD0201BC0102AC0201A402009500002878797AFCFCFAFF
              FFFFFFFFFFB2ACA900013E0025CA021DD70008BF0000BB0000BF0000BF0000BE
              0100BF0200BF0200C10000C10001BD0000BE0000BD0101C00000B70200A30000
              80000024B3B3AFFFFFFFFFFFFC20213900169F022CE3010CCB0000C10000C500
              00C50000C50000C50000C70000C60000C50000C20102BF0100C40100C70000C7
              0001CA0002AF0202990000631E1F34FFFFFED8DACE0000340834F00420D80000
              C70000CE0000D20000D30000D40000D40000D50000D50000D40000D50000D000
              00D40000D60000D40100D30101C90002A103029C00000FDCDCD685858000028E
              0A36F60312D10000CC0000C90000B50000B10000B10000B10000B10000B10000
              B20000B50000B40000B50000B20000B50000C70000DA0100BA0107A00000488B
              8687403A3A002CDE032FE80006D80000C54947BA9694CF9797D19393CF9494CF
              9494CF9494CF9493CF9195D09594D19792D29696D28F94CF4948B80201CD0201
              C70006A10000873D393B0D0C121444FF0029E80000D53738CFDBDDEBFFFFFFFF
              FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFEFFFEFFFFFEFFFEFEFFFFFEFFFFFF
              DEDCEA3938D70000CF0005A30509B009061300020E0F4EFF002BEA0000D45B5A
              DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
              FFFFFFFFFFFFFFFFFFFFFC5A5EE00000D70007A10711B5000015000209144EFF
              002FEB0005E20806D49496DFFFFFFFF3F1FAF3F2FCF3F2FCF3F2FCF3F2FCF3F2
              FCF2F2FCF2F2FCF2F3FBF3F3FBFFFFFF9D93DA0D06D40000D20007A90B14BE00
              001209070C0C3FFF0537FB071BEE0000E20000DB0000D90706DA0405D80403D8
              0403D80403D80403D80304D80302DE0504D80708D70000D70000DA0000EC0107
              CA000BAF000FB40D0A0D373533001EC90543FF042CF20001E70000EF0000EE00
              00EB0000EA0000EA0000EA0000EA0000EA0000E60000EB0000EA0000E50000E8
              0000F20001EB000DB70015AF0000933C3B3E84838000006B1045FF033AF4061C
              EE0000EC0000F10000F10000F10000F10000F10000F00000F10100F10000F300
              00F00200EF0200F20000F7000BD40014B00417BE000051888588DEDAD300000C
              0B30EB0342FF0434F50413F10000F00000F20000F40000F30000F30000F20000
              F50100F80000F50000F70100F90300F8000ADF0017BA0018BD070FBA000009DC
              DCD4FFFFFE211B270005820A3AFE0341FA0532F70317F20104F30000F60000F8
              0000FB0000F80100F90000F80000F70000FC0003F4000EE0001AC4001DBD0317
              C8000071211D2EFFFFFEFFFFFFB4B3A80000210215B2083FFF0444FB0235F502
              24F10413F50307F80001F80000F80100F90001F70004F6000CED0018D9001FCA
              0023C7041DCE0006A3000024B3B2ABFFFFFFFDFFFFFCFCFA7A767100002D0214
              C10D39FA0743FF003CF50234F1022AEE0324EB031CEF001AEC001EE40222E101
              26D70028D00427D1051CD60007B700002F767670FBFCF9FFFEFFF9FCFFFFFFFF
              F5F4EE73726C00002E0004A80822EE0A39FB013EF7003BF3053BE90135E20037
              DF0231DD002EDB002DDB0225DD0815D40001A200003571716AF3F3ECFFFFFFFE
              FDFDFDFBFFFEFDFCFFFFFFF7F7F284838100002D000072070BCF081DF40428F7
              0429F70529EE0528EE0525EB051DEE0618EA0208C7000073000031848383F7F7
              F1FFFFFFFFFCFFFEFEFBFFFBFAFBFDFEFAFFFDFFFFFFFFFFFDC4C2BA3E3F4D00
              00160000590000B90000FF0D10FF0C0CFF0000FF0000BA00005F000014403E49
              C2C2BBFFFFFEFEFFFFFAFDFDFEFDFDFFFFFCFBFFFBFFFFFEFFFBFFFBFDFCFCFF
              FFFFFFFFFFFFFDF9F9EAA8A59F5C5A5D1C1E250000100000111F1D22585B539F
              A29CF5F6EEFFFFFDFFFFFFFEFFFFFDFEFCFCFBFEFFFEFCFBFFFF}
            GlyphSpacing = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Transparent = True
            OnClick = btnExcluirClick
          end
        end
      end
      object gbxConta_Orcamento: TRzGroupBox
        Left = 0
        Top = 296
        Width = 908
        Height = 131
        Align = alBottom
        Caption = ' Servi'#231'o do contrato '
        FlatColor = clBlack
        TabOrder = 1
        object SMDBGrid2: TSMDBGrid
          Left = 34
          Top = 14
          Width = 873
          Height = 116
          Align = alClient
          Ctl3D = False
          DataSource = DMCadOS.dsmExtrato_Itens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Flat = True
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clWindow
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 15
          DefaultRowHeight = 16
          ScrollBars = ssHorizontal
          ColCount = 8
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Item'
              Title.Alignment = taCenter
              Title.Color = 16777166
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_Servico'
              Title.Alignment = taCenter
              Title.Caption = 'ID Servi'#231'o'
              Title.Color = 16777166
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Servico'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Servi'#231'o'
              Title.Color = 16777166
              Width = 376
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Qtd'
              Title.Alignment = taCenter
              Title.Color = 16777166
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Unitario'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Unit'#225'rio'
              Title.Color = 16777166
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Total'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Total'
              Title.Color = 16777166
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_Servico_Int'
              Title.Alignment = taCenter
              Title.Caption = 'ID Serv. Int.'
              Title.Color = 16777166
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 1
          Top = 14
          Width = 33
          Height = 116
          Align = alLeft
          Color = clSilver
          TabOrder = 1
          object btExcluir_Itens: TNxButton
            Left = 1
            Top = 3
            Width = 31
            Height = 30
            Hint = 'Excluir o servi'#231'o selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDF4A5A19F5955581F1C260000070000
              0C1B2021595C59A7A8A3FEFEF5FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1BEB93E3B4C00000B00004100008D
              010AB20C16BB0710B40002A1000073000033000006414247C9C7BEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4EE827F7B00003300007903
              18BA0717C6040FBB0008B10203AE0202AC0406A50004AD0306A7000096000052
              040325858782F4F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EB716F6B0000
              440014B5031CCB0011BB0003B50000BC0000BD0001BB0000BF0101BB0001BA00
              00B80102A702029F000079000023707376F3F4F1FFFFFFFFFFFFFFFFFFFCFBF7
              76757400004A0323D4011BD10007BB0000B90000BC0000BA0100BB0300BE0300
              C00100C10001BA0000BD0201BC0102AC0201A402009500002878797AFCFCFAFF
              FFFFFFFFFFB2ACA900013E0025CA021DD70008BF0000BB0000BF0000BF0000BE
              0100BF0200BF0200C10000C10001BD0000BE0000BD0101C00000B70200A30000
              80000024B3B3AFFFFFFFFFFFFC20213900169F022CE3010CCB0000C10000C500
              00C50000C50000C50000C70000C60000C50000C20102BF0100C40100C70000C7
              0001CA0002AF0202990000631E1F34FFFFFED8DACE0000340834F00420D80000
              C70000CE0000D20000D30000D40000D40000D50000D50000D40000D50000D000
              00D40000D60000D40100D30101C90002A103029C00000FDCDCD685858000028E
              0A36F60312D10000CC0000C90000B50000B10000B10000B10000B10000B10000
              B20000B50000B40000B50000B20000B50000C70000DA0100BA0107A00000488B
              8687403A3A002CDE032FE80006D80000C54947BA9694CF9797D19393CF9494CF
              9494CF9494CF9493CF9195D09594D19792D29696D28F94CF4948B80201CD0201
              C70006A10000873D393B0D0C121444FF0029E80000D53738CFDBDDEBFFFFFFFF
              FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFEFFFEFFFFFEFFFEFEFFFFFEFFFFFF
              DEDCEA3938D70000CF0005A30509B009061300020E0F4EFF002BEA0000D45B5A
              DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
              FFFFFFFFFFFFFFFFFFFFFC5A5EE00000D70007A10711B5000015000209144EFF
              002FEB0005E20806D49496DFFFFFFFF3F1FAF3F2FCF3F2FCF3F2FCF3F2FCF3F2
              FCF2F2FCF2F2FCF2F3FBF3F3FBFFFFFF9D93DA0D06D40000D20007A90B14BE00
              001209070C0C3FFF0537FB071BEE0000E20000DB0000D90706DA0405D80403D8
              0403D80403D80403D80304D80302DE0504D80708D70000D70000DA0000EC0107
              CA000BAF000FB40D0A0D373533001EC90543FF042CF20001E70000EF0000EE00
              00EB0000EA0000EA0000EA0000EA0000EA0000E60000EB0000EA0000E50000E8
              0000F20001EB000DB70015AF0000933C3B3E84838000006B1045FF033AF4061C
              EE0000EC0000F10000F10000F10000F10000F10000F00000F10100F10000F300
              00F00200EF0200F20000F7000BD40014B00417BE000051888588DEDAD300000C
              0B30EB0342FF0434F50413F10000F00000F20000F40000F30000F30000F20000
              F50100F80000F50000F70100F90300F8000ADF0017BA0018BD070FBA000009DC
              DCD4FFFFFE211B270005820A3AFE0341FA0532F70317F20104F30000F60000F8
              0000FB0000F80100F90000F80000F70000FC0003F4000EE0001AC4001DBD0317
              C8000071211D2EFFFFFEFFFFFFB4B3A80000210215B2083FFF0444FB0235F502
              24F10413F50307F80001F80000F80100F90001F70004F6000CED0018D9001FCA
              0023C7041DCE0006A3000024B3B2ABFFFFFFFDFFFFFCFCFA7A767100002D0214
              C10D39FA0743FF003CF50234F1022AEE0324EB031CEF001AEC001EE40222E101
              26D70028D00427D1051CD60007B700002F767670FBFCF9FFFEFFF9FCFFFFFFFF
              F5F4EE73726C00002E0004A80822EE0A39FB013EF7003BF3053BE90135E20037
              DF0231DD002EDB002DDB0225DD0815D40001A200003571716AF3F3ECFFFFFFFE
              FDFDFDFBFFFEFDFCFFFFFFF7F7F284838100002D000072070BCF081DF40428F7
              0429F70529EE0528EE0525EB051DEE0618EA0208C7000073000031848383F7F7
              F1FFFFFFFFFCFFFEFEFBFFFBFAFBFDFEFAFFFDFFFFFFFFFFFDC4C2BA3E3F4D00
              00160000590000B90000FF0D10FF0C0CFF0000FF0000BA00005F000014403E49
              C2C2BBFFFFFEFEFFFFFAFDFDFEFDFDFFFFFCFBFFFBFFFFFEFFFBFFFBFDFCFCFF
              FFFFFFFFFFFFFDF9F9EAA8A59F5C5A5D1C1E250000100000111F1D22585B539F
              A29CF5F6EEFFFFFDFFFFFFFEFFFFFDFEFCFCFBFEFFFEFCFBFFFF}
            GlyphSpacing = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Transparent = True
            OnClick = btExcluir_ItensClick
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 427
        Width = 908
        Height = 41
        Align = alBottom
        Color = 16769217
        TabOrder = 2
        DesignSize = (
          908
          41)
        object btnConfBaixa: TNxButton
          Left = 5
          Top = 7
          Width = 430
          Height = 30
          Cursor = crHandPoint
          Caption = 'Gerar NOTA DE SERVI'#199'O dos registros selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnConfBaixaClick
        end
        object btnGerar_Recibo: TNxButton
          Left = 487
          Top = 7
          Width = 419
          Height = 30
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Gerar RECIBO dos registros selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 1
          Transparent = True
          OnClick = btnGerar_ReciboClick
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = ' N'#227'o Gerados '
      object SMDBGrid3: TSMDBGrid
        Left = 0
        Top = 0
        Width = 908
        Height = 468
        Align = alClient
        Ctl3D = False
        DataSource = DMCadOS.dsmExtrato_Nao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 13
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 3
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cod_Alfa'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo Cliente'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Motivo'
            Title.Alignment = taCenter
            Width = 610
            Visible = True
          end>
      end
    end
  end
end
