object dmNFSe: TdmNFSe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 349
  Top = 207
  Height = 419
  Width = 619
  object ACBrNFSe1: TACBrNFSe
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpWinINet
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.CodigoMunicipio = 0
    Configuracoes.Geral.ConsultaLoteAposEnvio = True
    Configuracoes.Geral.Emitente.DadosSenhaParams = <>
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.EmissaoPathNFSe = True
    Configuracoes.WebServices.Visualizar = True
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.Ambiente = taProducao
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.Salvar = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFSE = ACBrNFSeDANFSeRL1
    Left = 96
    Top = 12
  end
  object ACBrNFSeDANFSeRL1: TACBrNFSeDANFSeRL
    PathPDF = '.\'
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFSe = ACBrNFSe1
    Cancelada = False
    Provedor = proNenhum
    TamanhoFonte = 6
    FormatarNumeroDocumentoNFSe = True
    PrintDialog = True
    Left = 128
    Top = 12
  end
  object sqlNOTASERVICO_COMUNICACAO: TRxQuery
    AutoCalcFields = False
    BeforePost = sqlNOTASERVICO_COMUNICACAOBeforePost
    DatabaseName = 'DB'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM NOTASERVICO_COMUNICACAO'
      'WHERE ID_NOTASERVICO = :ID_NOTASERVICO')
    Macros = <>
    Left = 92
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NOTASERVICO'
        ParamType = ptInput
      end>
    object sqlNOTASERVICO_COMUNICACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNOTASERVICO_COMUNICACAOID_NOTASERVICO: TIntegerField
      FieldName = 'ID_NOTASERVICO'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.ID_NOTASERVICO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNOTASERVICO_COMUNICACAODATA_HORA: TDateTimeField
      FieldName = 'DATA_HORA'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.DATA_HORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNOTASERVICO_COMUNICACAOTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sqlNOTASERVICO_COMUNICACAOPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.PROTOCOLO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlNOTASERVICO_COMUNICACAOOBS: TStringField
      FieldName = 'OBS'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlNOTASERVICO_COMUNICACAOXML: TBlobField
      FieldName = 'XML'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.XML'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlNOTASERVICO_COMUNICACAOCODIGOVERIFICACAO: TStringField
      FieldName = 'CODIGOVERIFICACAO'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.CODIGOVERIFICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNOTASERVICO_COMUNICACAONFSE_NUMERO: TStringField
      FieldName = 'NFSE_NUMERO'
      Origin = 'DB.NOTASERVICO_COMUNICACAO.NFSE_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    ReadingConfirmation = True
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 166
    Top = 12
  end
  object qFilial_Certificados: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT FC.numero_serie, FC.intervalotentativas, FC.consultarlote' +
        'aposenvio,'
      
        'FC.aguardarconsultaretorno, FC.usuario_web, FC.senha_web, CID.no' +
        'me, CID.id_provedor,'
      'CID.codmunicipio, FC.SENHA'
      'FROM FILIAL F'
      'LEFT JOIN FILIAL_CERTIFICADOS FC'
      'ON F.ID = FC.ID'
      'INNER JOIN CIDADE CID'
      'ON F.id_cidade = CID.ID'
      'WHERE F.ID = :ID'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 288
    Top = 112
    object qFilial_CertificadosNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 100
    end
    object qFilial_CertificadosINTERVALOTENTATIVAS: TIntegerField
      FieldName = 'INTERVALOTENTATIVAS'
    end
    object qFilial_CertificadosCONSULTARLOTEAPOSENVIO: TStringField
      FieldName = 'CONSULTARLOTEAPOSENVIO'
      Size = 1
    end
    object qFilial_CertificadosAGUARDARCONSULTARETORNO: TIntegerField
      FieldName = 'AGUARDARCONSULTARETORNO'
    end
    object qFilial_CertificadosUSUARIO_WEB: TStringField
      FieldName = 'USUARIO_WEB'
      Size = 100
    end
    object qFilial_CertificadosSENHA_WEB: TStringField
      FieldName = 'SENHA_WEB'
      Size = 30
    end
    object qFilial_CertificadosNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object qFilial_CertificadosID_PROVEDOR: TIntegerField
      FieldName = 'ID_PROVEDOR'
    end
    object qFilial_CertificadosCODMUNICIPIO: TStringField
      FieldName = 'CODMUNICIPIO'
      Size = 7
    end
    object qFilial_CertificadosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 30
    end
  end
  object qNotaServico_Comunicacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NOTASERVICO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select n.*'
      'from notaservico_comunicacao n'
      'where n.id_notaservico = :ID_NOTASERVICO')
    SQLConnection = dmDatabase.scoDados
    Left = 400
    Top = 40
    object qNotaServico_ComunicacaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qNotaServico_ComunicacaoID_NOTASERVICO: TIntegerField
      FieldName = 'ID_NOTASERVICO'
      Required = True
    end
    object qNotaServico_ComunicacaoDATA_HORA: TDateField
      FieldName = 'DATA_HORA'
    end
    object qNotaServico_ComunicacaoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qNotaServico_ComunicacaoPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 100
    end
    object qNotaServico_ComunicacaoOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object qNotaServico_ComunicacaoXML: TBlobField
      FieldName = 'XML'
      Size = 1
    end
    object qNotaServico_ComunicacaoCODIGOVERIFICACAO: TStringField
      FieldName = 'CODIGOVERIFICACAO'
    end
    object qNotaServico_ComunicacaoNFSE_NUMERO: TStringField
      FieldName = 'NFSE_NUMERO'
    end
  end
end
