object DMFilial_Certificado: TDMFilial_Certificado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 325
  Top = 198
  Height = 328
  Width = 507
  object sdsFilial_Certificado: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM FILIAL_CERTIFICADOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 40
    Top = 24
    object sdsFilial_CertificadoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsFilial_CertificadoCHAVE_ACESSO: TMemoField
      FieldName = 'CHAVE_ACESSO'
      BlobType = ftMemo
      Size = 1
    end
    object sdsFilial_CertificadoCNPJ_TITULAR: TStringField
      FieldName = 'CNPJ_TITULAR'
    end
    object sdsFilial_CertificadoEMISSOR: TStringField
      FieldName = 'EMISSOR'
      Size = 60
    end
    object sdsFilial_CertificadoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 100
    end
    object sdsFilial_CertificadoNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 100
    end
    object sdsFilial_CertificadoUTILIZA_NFE: TIntegerField
      FieldName = 'UTILIZA_NFE'
    end
    object sdsFilial_CertificadoUTILIZA_NFSE: TIntegerField
      FieldName = 'UTILIZA_NFSE'
    end
    object sdsFilial_CertificadoVALIDADE_INICIO: TSQLTimeStampField
      FieldName = 'VALIDADE_INICIO'
    end
    object sdsFilial_CertificadoVALIDADE_FIM: TSQLTimeStampField
      FieldName = 'VALIDADE_FIM'
    end
    object sdsFilial_CertificadoUTILIZA_MDFE: TIntegerField
      FieldName = 'UTILIZA_MDFE'
    end
    object sdsFilial_CertificadoUSUARIO_WEB: TStringField
      FieldName = 'USUARIO_WEB'
      Size = 100
    end
    object sdsFilial_CertificadoSENHA_WEB: TStringField
      FieldName = 'SENHA_WEB'
      Size = 30
    end
    object sdsFilial_CertificadoAGUARDARCONSULTARETORNO: TIntegerField
      FieldName = 'AGUARDARCONSULTARETORNO'
    end
    object sdsFilial_CertificadoCONSULTARLOTEAPOSENVIO: TStringField
      FieldName = 'CONSULTARLOTEAPOSENVIO'
      Size = 1
    end
    object sdsFilial_CertificadoINTERVALOTENTATIVAS: TIntegerField
      FieldName = 'INTERVALOTENTATIVAS'
    end
  end
  object dspFilial_Certificado: TDataSetProvider
    DataSet = sdsFilial_Certificado
    Left = 72
    Top = 24
  end
  object cdsFilial_Certificado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial_Certificado'
    Left = 104
    Top = 24
    object cdsFilial_CertificadoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFilial_CertificadoCHAVE_ACESSO: TMemoField
      FieldName = 'CHAVE_ACESSO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFilial_CertificadoCNPJ_TITULAR: TStringField
      FieldName = 'CNPJ_TITULAR'
    end
    object cdsFilial_CertificadoEMISSOR: TStringField
      FieldName = 'EMISSOR'
      Size = 60
    end
    object cdsFilial_CertificadoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 100
    end
    object cdsFilial_CertificadoNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 100
    end
    object cdsFilial_CertificadoUTILIZA_NFE: TIntegerField
      FieldName = 'UTILIZA_NFE'
    end
    object cdsFilial_CertificadoUTILIZA_NFSE: TIntegerField
      FieldName = 'UTILIZA_NFSE'
    end
    object cdsFilial_CertificadoVALIDADE_INICIO: TSQLTimeStampField
      FieldName = 'VALIDADE_INICIO'
    end
    object cdsFilial_CertificadoVALIDADE_FIM: TSQLTimeStampField
      FieldName = 'VALIDADE_FIM'
    end
    object cdsFilial_CertificadoUTILIZA_MDFE: TIntegerField
      FieldName = 'UTILIZA_MDFE'
    end
    object cdsFilial_CertificadoUSUARIO_WEB: TStringField
      FieldName = 'USUARIO_WEB'
      Size = 100
    end
    object cdsFilial_CertificadoSENHA_WEB: TStringField
      FieldName = 'SENHA_WEB'
      Size = 30
    end
    object cdsFilial_CertificadoAGUARDARCONSULTARETORNO: TIntegerField
      FieldName = 'AGUARDARCONSULTARETORNO'
    end
    object cdsFilial_CertificadoCONSULTARLOTEAPOSENVIO: TStringField
      FieldName = 'CONSULTARLOTEAPOSENVIO'
      Size = 1
    end
    object cdsFilial_CertificadoINTERVALOTENTATIVAS: TIntegerField
      FieldName = 'INTERVALOTENTATIVAS'
    end
  end
  object dsFilial_Certificado: TDataSource
    DataSet = cdsFilial_Certificado
    Left = 136
    Top = 24
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME FROM FILIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 24
    object sdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 328
    Top = 24
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 360
    Top = 24
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 392
    Top = 24
  end
end
