unit udmNFSe;

interface

uses
  SysUtils, Classes, ACBrNFSeDANFSeClass, ACBrNFSeDANFSeRLClass, ACBrBase,
  ACBrDFe, ACBrNFSe, DBTables, pcnConversao, Forms, DB, RxQuery, pnfsConversao, DateUtils, dialogs,
  ACBrIntegrador, ACBrMail, ACBrDFeReport, FMTBcd, SqlExpr, UDMCadNotaServico;

type
  TdmNFSe = class(TDataModule)
    ACBrNFSe1: TACBrNFSe;
    ACBrNFSeDANFSeRL1: TACBrNFSeDANFSeRL;
    sqlNOTASERVICO_COMUNICACAO: TRxQuery;
    sqlNOTASERVICO_COMUNICACAOID: TIntegerField;
    sqlNOTASERVICO_COMUNICACAOID_NOTASERVICO: TIntegerField;
    sqlNOTASERVICO_COMUNICACAODATA_HORA: TDateTimeField;
    sqlNOTASERVICO_COMUNICACAOTIPO: TStringField;
    sqlNOTASERVICO_COMUNICACAOPROTOCOLO: TStringField;
    sqlNOTASERVICO_COMUNICACAOOBS: TStringField;
    sqlNOTASERVICO_COMUNICACAOXML: TBlobField;
    sqlNOTASERVICO_COMUNICACAOCODIGOVERIFICACAO: TStringField;
    sqlNOTASERVICO_COMUNICACAONFSE_NUMERO: TStringField;
    ACBrMail1: TACBrMail;
    qFilial_Certificados: TSQLQuery;
    qNotaServico_Comunicacao: TSQLQuery;
    qNotaServico_ComunicacaoID: TIntegerField;
    qNotaServico_ComunicacaoID_NOTASERVICO: TIntegerField;
    qNotaServico_ComunicacaoDATA_HORA: TDateField;
    qNotaServico_ComunicacaoTIPO: TStringField;
    qNotaServico_ComunicacaoPROTOCOLO: TStringField;
    qNotaServico_ComunicacaoOBS: TStringField;
    qNotaServico_ComunicacaoXML: TBlobField;
    qNotaServico_ComunicacaoCODIGOVERIFICACAO: TStringField;
    qNotaServico_ComunicacaoNFSE_NUMERO: TStringField;
    qFilial_CertificadosNUMERO_SERIE: TStringField;
    qFilial_CertificadosINTERVALOTENTATIVAS: TIntegerField;
    qFilial_CertificadosCONSULTARLOTEAPOSENVIO: TStringField;
    qFilial_CertificadosAGUARDARCONSULTARETORNO: TIntegerField;
    qFilial_CertificadosUSUARIO_WEB: TStringField;
    qFilial_CertificadosSENHA_WEB: TStringField;
    qFilial_CertificadosNOME: TStringField;
    qFilial_CertificadosID_PROVEDOR: TIntegerField;
    qFilial_CertificadosCODMUNICIPIO: TStringField;
    qFilial_CertificadosSENHA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlNOTASERVICO_COMUNICACAOBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fNumeroLote, fID_NOTA: Integer;
    DataEmissaoRet : TDateTime;
    //Isql_Tomador, isql_Emitente, isqlParametro, IsqlDadosNota: TQuery;
    NumNFSe:String;
    OffLine:Boolean;
    function GetAliquotaCad_Servico: Currency;
    function GetCodigoMunicipio(Estado, Cidade: string): string;
    procedure AbrirDadosNota;
    function Caracter_XML_Invalido(Dados: string): string;
    function GetMontaDescricaoImpressao: string;
    function GetNotaCancelada: Boolean;
    procedure ImprimirNfse;

    procedure SetID_NOTA(Value: Integer);
    procedure GravarCancelamento;
    function GetNFSE_NUMERO_Enviada: String;
    function GetNotaEnviada: Boolean;
    procedure prc_Gravar_Retorno(Caminho : String);
  public
    { Public declarations }
    fDMCadNotaServico: TDMCadNotaServico;
    vNumeroLote : Integer;
    vCont : Integer;

    procedure AlimentaComponente;
    procedure Enviar;
    procedure Enviar_Nfse;
    procedure ConsultaNfse;

    procedure EnviarEmailNfse;
    procedure prc_Abrir_NotaServico_Comunicacao(ID : Integer);
    function fnc_monta_discriminacao : String;
    procedure ConfigurarComponente;
    procedure Cancelar_Nfse;

    procedure TestarCertificado;
    class procedure Gerar(pID_NOTA: Integer);
    class procedure Cancelar(pID_NOTA: Integer);
    class procedure Consultar(pID_NOTA: Integer);
    class procedure GerarOffline(pID_NOTA: Integer);
    class procedure EnviarEmail(pID_NOTA: Integer);
  end;

var
  dmNFSe: TdmNFSe;

implementation

//uses UnitLibrary, DataModulo, pnfsNFSe;

uses pnfsNFSe, DmdDatabase, uUtilPadrao, ACBrNFSeWebServices;

{$R *.dfm}

function TdmNFSe.GetNFSE_NUMERO_Enviada: String;
begin
  //sqlNOTASERVICO_COMUNICACAO.Locate('TIPO', '1', []);
  //result := sqlNOTASERVICO_COMUNICACAONFSE_NUMERO.AsString;
end;


procedure TdmNFSe.ImprimirNfse;
begin
  ACBrNFSe1.NotasFiscais.Imprimir;
  ACBrNFSe1.NotasFiscais.ImprimirPDF;
  EnviarEmailNfse;
end;

function TdmNFSe.GetNotaCancelada: Boolean;
begin
  result := false;
end;

function TdmNFSe.GetNotaEnviada: Boolean;
begin
  Result := SQLLocate('NOTASERVICO','ID','COD_AUTENCIDADE_RET',fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString) <> '';
end;

procedure TdmNFSe.ConfigurarComponente;
var
  Ok: Boolean;
begin
   qFilial_Certificados.Close;
   qFilial_Certificados.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsFilialID.AsInteger;
   qFilial_Certificados.Open;

   {$IFDEF ACBrNFSeOpenSSL}

    ACBrNFSe1.Configuracoes.Certificados.Certificado := qFilial_CertificadosNUMERO_SERIE.AsString;
    ACBrNFSe1.Configuracoes.Certificados.Senha       := qFilial_CertificadosSENHA;
   {$ELSE}
    ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := qFilial_CertificadosNUMERO_SERIE.AsString;
   {$ENDIF}

    ACBrNFSe1.DANFSe.Prefeitura := 'PREFEITURA MUNICIPAL ' + fDMCadNotaServico.cdsFilialCIDADE.AsString;
    ACBrNFSe1.DANFSe.PrestLogo := fDMCadNotaServico.cdsFilialENDLOGO_NFSE.AsString;
    if fDMCadNotaServico.cdsFilialNFSE_HOMOLOGACAO.AsString = 'S' then
      ACBrNFSe1.Configuracoes.WebServices.Ambiente := taHomologacao
    else
      ACBrNFSe1.Configuracoes.WebServices.Ambiente := taProducao;
    ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio := fDMCadNotaServico.cdsFilialCODMUNICIPIO.AsInteger;

    ACBrNFSe1.Configuracoes.Geral.SenhaWeb := qFilial_CertificadosSENHA_WEB.AsString;
    ACBrNFSe1.Configuracoes.Geral.UserWeb  := qFilial_CertificadosUSUARIO_WEB.AsString;

    ACBrNFSe1.Configuracoes.WebServices.ProxyHost := '';

    if qFilial_CertificadosAGUARDARCONSULTARETORNO.AsInteger > 0 then
      ACBrNFSe1.Configuracoes.WebServices.AguardarConsultaRet := qFilial_CertificadosAGUARDARCONSULTARETORNO.AsInteger;

    if qFilial_CertificadosCONSULTARLOTEAPOSENVIO.AsString = 'S' then
      ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio := True
    else
      ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio := False;

    if qFilial_CertificadosINTERVALOTENTATIVAS.AsInteger > 0 then
      ACBrNFSe1.Configuracoes.WebServices.IntervaloTentativas := qFilial_CertificadosINTERVALOTENTATIVAS.AsInteger;

  ACBrNFSe1.Configuracoes.Arquivos.PathSalvar := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString;
  ACBrNFSe1.Configuracoes.Arquivos.PathSchemas := ExtractFilePath(Application.ExeName) + 'Schemas';
  ACBrNFSe1.Configuracoes.Arquivos.PathNFSe := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString;
  ACBrNFSe1.Configuracoes.Arquivos.PathCan := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar;
  ACBrNFSe1.Configuracoes.Arquivos.PathRPS := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar;
  ACBrNFSe1.Configuracoes.Arquivos.PathGer := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar;
  ACBrNFSeDANFSeRL1.PathPDF := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString;

  ACBrNFSe1.Configuracoes.Arquivos.AdicionarLiteral := True;
  ACBrNFSe1.Configuracoes.Arquivos.EmissaoPathNFSe := True;
  ACBrNFSe1.Configuracoes.Arquivos.PathCan := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar;
  ACBrNFSe1.Configuracoes.Arquivos.PathNFSe := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar;
  ACBrNFSe1.Configuracoes.Arquivos.Salvar := True;
  ACBrNFSe1.Configuracoes.Geral.Salvar := true;
end;

class procedure TdmNFSe.Consultar(pID_NOTA: Integer);
begin
  if not Assigned(dmNFSe) then
    dmNFSe:= TdmNFSe.Create(nil);

//  dmNFSe.SetID_NOTA(pID_NOTA);
  dmNFSe.ConsultaNfse;
end;

function TdmNFSe.GetAliquotaCad_Servico: Currency;
begin
  result := 0;
end;

procedure TdmNFSe.AlimentaComponente;
var
  ValorISS, BaseCalculo: Currency;
  OK: Boolean;
  EXIGIBILIDADEISS, NATUREZA_PADRAO, CIDADE_TOMADOR, UF_TOMADOR, xDiscriminacao: string;
  i: Integer;
  vDate : TDateTime;
  vDiscriminacao: WideString;
begin
  AbrirDadosNota;

  with ACBrNFSe1 do
  begin
    NotasFiscais.NumeroLote := IntToStr(fDMCadNotaServico.cdsNotaServico_ImpNUMRPS.AsInteger);

    with NotasFiscais.Add.NFSe do
    begin
      if fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger > 0 then
      begin
        Competencia := fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsString + '/' + fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsString; 
      end
      else
        Competencia := FormatDateTime('yyyy/mm',fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);

      Numero := fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsString;
      IdentificacaoRps.Tipo   := trRPS;
      IdentificacaoRps.Numero := fDMCadNotaServico.cdsNotaServico_ImpNUMRPS.AsString;
      IdentificacaoRps.Serie  := fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString;

      DataEmissao     := fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO.AsDateTime;
      vDate           := fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO.AsDateTime;
      NATUREZA_PADRAO := fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString;
      NaturezaOperacao := StrToNaturezaOperacao(OK, trim(NATUREZA_PADRAO));

      if not OK then
        NaturezaOperacao := no0;

      if fDMCadNotaServico.cdsNotaServico_ImpCODREGIME_TRIBUTACAO.AsString <> '' then
        RegimeEspecialTributacao := StrToRegimeEspecialTributacao(OK, fDMCadNotaServico.cdsNotaServico_ImpCODREGIME_TRIBUTACAO.AsString)
      else
        RegimeEspecialTributacao := StrToRegimeEspecialTributacao(OK, fDMCadNotaServico.cdsNotaServico_ImpCODREGIME_TRIBUTACAO.AsString);

      if fDMCadNotaServico.cdsFilialSIMPLES.AsString = 'S' then
        OptanteSimplesNacional := snSim
      else
        OptanteSimplesNacional := snNao; 

      if fDMCadNotaServico.cdsFilialINCENTIVO_CULTURAL.AsString = 'S' then
        IncentivadorCultural := snSim
      else
        IncentivadorCultural := snNao;

      if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taProducao then
        Producao := snSim
      else
        Producao := snNao;

     // TnfseStatusRPS = ( srNormal, srCancelado );
      Status := srNormal;
      Servico.Valores.ValorServicos          := fDMCadNotaServico.cdsNotaServico_ImpVLR_SERVICOS.AsFloat;
      Servico.Valores.DescontoIncondicionado := fDMCadNotaServico.cdsNotaServico_ImpVLR_DESCONTO_INC.AsFloat;
      Servico.Valores.ValorPis               := fDMCadNotaServico.cdsNotaServico_ImpVLR_PIS.AsFloat;
      Servico.Valores.ValorCofins            := fDMCadNotaServico.cdsNotaServico_ImpVLR_COFINS.AsFloat;
      Servico.Valores.ValorInss              := fDMCadNotaServico.cdsNotaServico_ImpVLR_INSS.AsFloat;
      Servico.Valores.ValorIr                := fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat;
      Servico.Valores.ValorCsll              := fDMCadNotaServico.cdsNotaServico_ImpVLR_CSLL.AsFloat;
      Servico.Valores.ValorDeducoes          := fDMCadNotaServico.cdsNotaServico_ImpVLR_DEDUCOES.AsFloat;

      if fDMCadNotaServico.cdsNotaServico_ImpISS_RETIDO.AsString = '1' then
        Servico.Valores.IssRetido := stRetencao
      else
        Servico.Valores.IssRetido := stNormal;

      Servico.Valores.OutrasRetencoes      := 0.00;
      Servico.Valores.DescontoCondicionado := fDMCadNotaServico.cdsNotaServico_ImpVLR_DESCONTO_COND.AsFloat;

      BaseCalculo := fDMCadNotaServico.cdsNotaServico_ImpBASE_CALCULO.AsFloat;

      ValorISS := fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS.AsFloat + fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat;
      if StrToFloat(FormatFloat('0.00',ValorISS)) > 0 then
      begin
        Servico.Valores.BaseCalculo := fDMCadNotaServico.cdsNotaServico_ImpBASE_CALCULO.AsFloat;
        Servico.Valores.Aliquota    := fDMCadNotaServico.cdsNotaServico_ImpPERC_ALIQUOTA.AsFloat;
        if Servico.Valores.IssRetido = stNormal then
        begin
          Servico.Valores.ValorIss       := fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS.AsFloat;
          Servico.Valores.ValorIssRetido := 0.00;
        end
        else begin
          Servico.Valores.ValorIss       := fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat;
          Servico.Valores.ValorIssRetido := fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat;
        end;
      end
      else begin
        Servico.Valores.BaseCalculo    := BaseCalculo;
        Servico.Valores.Aliquota       := GetAliquotaCad_Servico;
        Servico.Valores.ValorIss       := 0;
        Servico.Valores.ValorIssRetido := 0;
      end;

      Servico.Valores.ValorLiquidoNfse := fDMCadNotaServico.cdsNotaServico_ImpVLR_LIQUIDO_NFSE.AsFloat;

      Servico.ItemListaServico  := fDMCadNotaServico.cdsNotaServico_ImpCOD_SERVICO.AsString;
      Servico.xItemListaServico := fDMCadNotaServico.cdsNotaServico_ImpNOME_SERVICO.AsString;

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'

      Servico.CodigoCnae := fDMCadNotaServico.cdsFilialCNAE_NFSE.AsString;

      if ACBrNFSe1.Configuracoes.WebServices.Ambiente <> taProducao  then
        Servico.CodigoCnae := '6511102';

      if Trim(fDMCadNotaServico.cdsNotaServico_ImpCOD_ATIVIDADE_CID.AsString) <> '' then
        Servico.CodigoTributacaoMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCOD_ATIVIDADE_CID.AsString
      else
        Servico.CodigoTributacaoMunicipio := fDMCadNotaServico.cdsFilialCOD_TRIBUTACAO_MUNICIPIO.AsString;

      if NaturezaOperacao = no2 then /// FORA DO MUNICIPIO
        servico.CodigoMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_CLI.AsString;

      if Servico.CodigoMunicipio = '' then
        Servico.CodigoMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_FIL.AsString;

      //Muda campos quando for homologação
//      if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taHomologacao then
//      begin
//        Servico.CodigoMunicipio := '999';
//        IdentificacaoRps.Serie := '8';
//      end;

     // Informar para Saatri
      Servico.CodigoPais    := StrToInt(Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCODPAIS_CLI.AsString,0));
      Servico.Discriminacao := fnc_monta_discriminacao;

      fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
      fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
      fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
      fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;
      while not fDMCadNotaServico.cdsNotaServico_Imp_Itens.Eof do
      begin
        if trim(vDiscriminacao) <> '' then
          vDiscriminacao := vDiscriminacao + ' (' + fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString
        else
          vDiscriminacao := '(' + fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString;
        if (fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsInteger > 0) and (fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger > 0) and
           (fDMCadNotaServico.cdsParametrosIMP_MESANO_REF_NOITEM_NFSE.AsString = 'S') then
          vDiscriminacao := vDiscriminacao + ' Ref.: ' + FormatFloat('00',fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger) + '/' +
                            fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsString;

        with Servico.ItemServico.Add do
        begin
          Descricao := vDiscriminacao;
          Quantidade := 1;
          ValorUnitario := fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_UNITARIO.AsFloat;
          ValorServicos := fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_TOTAL.AsFloat;
          if SQLLocate('NFSE_NATUREZA','ID','RETER_ISSQN',fDMCadNotaServico.cdsNotaServico_ImpID_NATUREZA.AsString) = 'S' then
            ValorIss      := fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat;
        end;

        fDMCadNotaServico.cdsNotaServico_Imp_Itens.Next;
      end;
      xDiscriminacao := Servico.Discriminacao;
      Servico.Discriminacao := Caracter_XML_Invalido(xDiscriminacao);

      if Trim(fDMCadNotaServico.cdsNotaServico_ImpMOTIVO_CANCELAMENTO.AsString) <> '' then
        OutrasInformacoes := Trim(fDMCadNotaServico.cdsNotaServico_ImpMOTIVO_CANCELAMENTO.AsString)
      else
       OutrasInformacoes := fDMCadNotaServico.vMotivoCancelamento;

      PrestadorServico.IdentificacaoPrestador.Cnpj := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_FIL.AsString);
      PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := fDMCadNotaServico.cdsNotaServico_ImpINSCMUNICIPAL_FIL.AsString;
      PrestadorServico.IdentificacaoPrestador.Senha := qFilial_CertificadosSENHA.AsString;
      PrestadorServico.IdentificacaoPrestador.cUF := StrToInt(Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCODUF_FIL.AsString,2));
      PrestadorServico.RazaoSocial := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpNOME_FIL.AsString );
      PrestadorServico.NomeFantasia := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpFANTASIA_FIL.AsString);
      PrestadorServico.Endereco.TipoLogradouro := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpENDERECO_FIL.AsString );
      PrestadorServico.Endereco.Endereco := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpENDERECO_FIL.AsString );
      PrestadorServico.Endereco.Numero := fDMCadNotaServico.cdsNotaServico_ImpNUM_END_FIL.AsString;
      PrestadorServico.Endereco.Complemento := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END_FIL.AsString );
      PrestadorServico.Endereco.Bairro := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpBAIRRO_FIL.AsString);
      PrestadorServico.Endereco.CodigoMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_FIL.AsString;
      PrestadorServico.Endereco.UF := fDMCadNotaServico.cdsNotaServico_ImpUF_FIL.AsString;
      PrestadorServico.Endereco.CEP := fDMCadNotaServico.cdsNotaServico_ImpCEP_FIL.AsString;
      PrestadorServico.Endereco.xMunicipio := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpCIDADE_FIL.AsString );
      PrestadorServico.Endereco.CodigoPais := 1058;
      PrestadorServico.Contato.Telefone    := fDMCadNotaServico.cdsNotaServico_ImpDDD_FIL.AsString + fDMCadNotaServico.cdsNotaServico_ImpFONE_FIL.AsString;
      PrestadorServico.Contato.Email       := fDMCadNotaServico.cdsNotaServico_ImpEMAIL_FIL.AsString;

      ACBrNFSe1.Configuracoes.Geral.Emitente.InscMun := fDMCadNotaServico.cdsNotaServico_ImpINSCMUNICIPAL_FIL.AsString;
      ACBrNFSe1.Configuracoes.Geral.Emitente.CNPJ    := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_FIL.AsString,0);
      ACBrNFSe1.Configuracoes.Geral.Emitente.RazSocial := PrestadorServico.RazaoSocial;

      Prestador.Cnpj               := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_FIL.AsString);
      Prestador.InscricaoMunicipal := fDMCadNotaServico.cdsNotaServico_ImpINSCMUNICIPAL_FIL.AsString;
      Prestador.cUF                := StrToInt(Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCODUF_FIL.AsString,2));

      if Trim(qFilial_CertificadosSENHA.AsString) <> '' then
        Prestador.Senha := qFilial_CertificadosSENHA.AsString;

      Tomador.Endereco.CodigoMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_CLI.AsString;

      Tomador.IdentificacaoTomador.CpfCnpj := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,0);

      Tomador.RazaoSocial := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpNOME_CLIENTE.AsString);
      Tomador.Endereco.Endereco := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpENDERECO_CLI.AsString);
      Tomador.Endereco.Numero := fDMCadNotaServico.cdsNotaServico_ImpNUM_END_CLI.AsString;
      Tomador.Endereco.Complemento := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END.AsString);
      Tomador.Endereco.Bairro := Caracter_XML_Invalido(fDMCadNotaServico.cdsNotaServico_ImpBAIRRO_CLI.AsString);
      Tomador.Endereco.UF := fDMCadNotaServico.cdsNotaServico_ImpUF_CLI.AsString;
      Tomador.Endereco.CEP := fDMCadNotaServico.cdsNotaServico_ImpCEP_CLI.AsString;
      Tomador.Endereco.xMunicipio := fDMCadNotaServico.cdsNotaServico_ImpCIDADE_CLI.AsString;

      Tomador.Contato.Telefone := fDMCadNotaServico.cdsNotaServico_ImpDDD_CLI.AsString + fDMCadNotaServico.cdsNotaServico_ImpFONE_CLI.AsString;
      Tomador.Contato.Email    := fDMCadNotaServico.cdsNotaServico_ImpEMAIL_CLI.AsString;
    end;
  end;
end;

function TdmNFSe.Caracter_XML_Invalido(Dados: string): string;
begin
  Result := StringReplace(Dados, '&', 'E', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '>', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '<', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '=', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '"', ' ', [rfReplaceAll, rfIgnoreCase]);
end;

function TdmNFSe.GetMontaDescricaoImpressao: string;
begin
end;

function TdmNFSe.GetCodigoMunicipio(Estado,
  Cidade: string): string;
begin
  Result := '';

  if (Cidade = '') or (Estado = '') then exit;

end;


procedure TdmNFSe.Enviar;
begin

end;

procedure TdmNFSe.TestarCertificado;
begin

end;

procedure TdmNFSe.DataModuleCreate(Sender: TObject);
begin
//  ConfigurarComponente;
end;

procedure TdmNFSe.AbrirDadosNota;
begin
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;

  NumNFSe := fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
end;

procedure TdmNFSe.Enviar_Nfse;
var
  CaminhoNfse, vAux, vNumLote, Caminho, xCodigoVerificacao, xProtocolo: string;
  i: Integer;
begin
  inherited;

  Caminho := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString + '\Nfs.xml';
  vNumLote := IntToStr(fID_NOTA);
//  GerarNFSe;

  if (OffLine) or (GetNotaEnviada) then
  begin
    if OffLine then
    begin
      ACBrNFSe1.NotasFiscais.GerarNFSe;
      ACBrNFSe1.NotasFiscais.GravarXML(fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString + '\NfsOffline.xml');
    end;

    if (GetNotaEnviada) and (not OffLine) then
    begin
      if Application.MessageBox('Nota já foi enviada deseja imprimir? ', 'Atenção', 36) <> 6 then
        Abort;
    end;

    if ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Numero = '' then
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Numero := fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;

    ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao := fDMCadNotaServico.cdsNotaServico_ImpCOD_AUTENCIDADE_RET.AsString;

    if OffLine then
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Producao := snNao;

    if ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Numero = '' then
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Numero := '0';

    if ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao = '' then
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao := '0';

    if GetNotaCancelada then
    begin
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Cancelada := snSim;
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.NfseCancelamento.DataHora := fDMCadNotaServico.cdsNotaServico_ImpDTRECEBIMENTO_RET.AsDateTime;
    end;

    ImprimirNfse;
  end
  else begin
    //TestarNotaPodeEnviar;
//    try
      (ACBrNFSe1.Enviar(vNumeroLote, False));
      for i := 0 to vCont - 1 do
      begin
        if ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao <> '' then
        begin
          DataEmissaoRet := Now;
          ACBrNFSe1.NotasFiscais.GravarXML(Caminho);
          prc_Gravar_Retorno(caminho);
        end;
      end;
      Sleep(1000);
      ConsultaNfse;
//    except
//      on E: Exception do
//        raise Exception.Create(e.message);
//    end;
  end;

  ACBrNFSe1.NotasFiscais.Clear;
end;

procedure TdmNFSe.ConsultaNfse;
var
  vAux, vProtocolo, Caminho, vCodigoVerificacao: string;
begin
  ConfigurarComponente;
  Caminho := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString + '\Nfs.xml';
  vProtocolo := '';
  vCodigoVerificacao := '';

  ACBrNFSe1.NotasFiscais.Clear;
  AlimentaComponente;

  if ACBrNFSe1.ConsultarNFSeporRps(ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.IdentificacaoRps.Numero,
    ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.IdentificacaoRps.Serie,
    TipoRPSToStr(ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.IdentificacaoRps.Tipo)) then
  begin
    vCodigoVerificacao :=
      ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[vCont].Nfse.CodigoVerificacao;

    if vCodigoVerificacao <> '' then
    begin
      DataEmissaoRet := Now;
      ACBrNFSe1.NotasFiscais.Clear;
      AlimentaComponente;
      ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao := vCodigoVerificacao;
      ACBrNFSe1.NotasFiscais.Items[vCont].GravarXML(ExtractFileName(Caminho), ExtractFilePath(Caminho));
      GetNotaEnviada;
      prc_Gravar_Retorno(Caminho);
    end;
    
    ImprimirNfse;
  end
  else
    ShowMessage('Nfse não encontrada!');
end;


class procedure TdmNFSe.Gerar(pID_NOTA: Integer);
begin
  if not Assigned(dmNFSe) then
    dmNFSe:= TdmNFSe.Create(nil);

  dmNFSe.OffLine := False;
  dmNFSe.SetID_NOTA(pID_NOTA);
  dmNFSe.Enviar_Nfse;
end;

procedure TdmNFSe.SetID_NOTA(Value: Integer);
begin
  fID_NOTA := Value;

  sqlNOTASERVICO_COMUNICACAO.Close;
  sqlNOTASERVICO_COMUNICACAO.ParamByName('ID_NOTASERVICO').Value := Value;
  sqlNOTASERVICO_COMUNICACAO.Open;   
end;

class procedure TdmNFSe.Cancelar(pID_NOTA: Integer);
begin
  if not Assigned(dmNFSe) then
    dmNFSe:= TdmNFSe.Create(nil);

  dmNFSe.SetID_NOTA(pID_NOTA);
  dmNFSe.Cancelar_Nfse;
end;

procedure TdmNFSe.GravarCancelamento;
var
  COD_CADSERVICO: integer;
  NFSE_NUMERO, Caminho: string;
begin
  Caminho := ExtractFilePath(Application.ExeName) + 'Xml-Nfs\Nfs.xml';
  ACBrNFSe1.NotasFiscais.Items[vCont].GravarXML(ExtractFileName(Caminho), ExtractFilePath(Caminho));
  fDMCadNotaServico.prc_Localizar(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
  if not (fDMCadNotaServico.cdsNotaServico.IsEmpty) then
  begin
    fDMCadNotaServico.cdsNotaServico.Edit;
    fDMCadNotaServico.cdsNotaServicoSTATUS_RPS.AsString := '2';
    fDMCadNotaServico.cdsNotaServicoDTCANCELAMENTO.AsDateTime := ACBrNFSe1.WebServices.CancNfse.DataHora;
    fDMCadNotaServico.cdsNotaServico.Post;
    fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
  end;
end;

procedure TdmNFSe.Cancelar_Nfse;
var
  Codigo, vAux: string;
begin
  if GetNotaCancelada then
  begin
    raise Exception.Create('Nota Fiscal ja foi cancelada!');
  end;

  if not GetNotaEnviada then
  begin
    raise Exception.Create('Nota Fiscal não foi enviada!');
  end;

  ACBrNFSe1.NotasFiscais.Clear;
  ConfigurarComponente;
  AlimentaComponente;

{  if not (InputQuery('Cancelar NFSe', 'Código de Cancelamento: '
    + #13 + '1 - Erro de Emissão'
    + #13 + '2 - Serviço não Concluido'
    + #13 + '3 - RPS Cancelado na Emissão', Codigo)) then exit;}
  Codigo := '2';

  try
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero := NumNFSe;
    try
      if ACBrNFSe1.CancelarNFSe(Codigo) then
      begin
        GravarCancelamento;
        MessageDlg('Nfs-e Cancelada com sucesso!', mtInformation, [mbOK], 0);
      end
      else begin

        if ACBrNFSe1.WebServices.CancNfse <> nil then
          if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe <> nil then
          begin
            if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Count > 0 then
            begin
              if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[0].Codigo = 'E79' then
              begin
                GravarCancelamento;
                exit;
              end;
            end;
          end;

        try
          ACBrNFSe1.CancelarNFSe(Codigo);
        finally

          if ACBrNFSe1.WebServices.CancNfse <> nil then
            if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe <> nil then
            begin
              if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Count > 0 then
              begin
                if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[0].Codigo = 'E79' then
                begin
                  GravarCancelamento;
                end;
              end;
            end;
        end;
      end;
    except

      if ACBrNFSe1.WebServices.CancNfse <> nil then
        if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe <> nil then
        begin
          if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Count > 0 then
          begin
            if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[0].Codigo = 'E79' then
            begin
              GravarCancelamento;
              exit;
            end;
          end;
        end;

      try
        ACBrNFSe1.CancelarNFSe(Codigo);
      finally

        if ACBrNFSe1.WebServices.CancNfse <> nil then
          if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe <> nil then
          begin
            if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Count > 0 then
            begin
              if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[0].Codigo = 'E79' then
              begin
                GravarCancelamento;
              end;
            end;
          end;
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.message);
    end;
  end;    

end;


procedure TdmNFSe.sqlNOTASERVICO_COMUNICACAOBeforePost(DataSet: TDataSet);
begin
  //if sqlNOTASERVICO_COMUNICACAOID.Value = 0 then
  //begin
  //  sqlNOTASERVICO_COMUNICACAOID.Value := ExecSql(' SELECT MAX(ID) AS ID FROM NOTASERVICO_COMUNICACAO ').FieldByName('ID').AsInteger + 1;
  //end;
end;

class procedure TdmNFSe.GerarOffLine(pID_NOTA: Integer);
begin
  if not Assigned(dmNFSe) then
    dmNFSe:= TdmNFSe.Create(nil);

  dmNFSe.OffLine := True;
  dmNFSe.SetID_NOTA(pID_NOTA);
  dmNFSe.Enviar_Nfse;
end;

class procedure TdmNFSe.EnviarEmail(pID_NOTA: Integer);
begin
  if not Assigned(dmNFSe) then
    dmNFSe:= TdmNFSe.Create(nil);

  dmNFSe.SetID_NOTA(pID_NOTA);
  dmNFSe.EnviarEmailNfse;
end;

procedure TdmNFSe.EnviarEmailNfse;
var
  PathPastaMensal, sXML, Danfe, Para, emailCopia, Titulo, Caminho: string;
  stl: TStringList;
  xSSL, xTSL: Boolean;
  CC: Tstrings;
begin
  ConfigurarComponente;
  Para := fDMCadNotaServico.cdsNotaServico_ImpEMAIL_CLI.AsString;
  // Isql_Tomador.fieldbyname('CLIEA60EMAIL').asstring;

  {Se nao tiver email para o Destinatario aborta}
  if Para = '' then
    exit;

  //emailCopia := isqlParametro.fieldbyname('EMPRA60EMAILCOPIA').Value;
  emailCopia := fDMCadNotaServico.cdsNotaServico_ImpEMAIL_FIL.AsString;

  Titulo := 'Nota Serviço Eletronica Emitida!';
  //Caminho := ExtractFilePath(Application.ExeName) + 'Xml-Nfs\Nfs.xml';
  Caminho := fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString + '\Nfs.xml';

  if GetNotaEnviada then
  begin
    sqlNOTASERVICO_COMUNICACAOXML.SaveToFile(Caminho);
  end
  else begin
    raise Exception.Create('Nota de Serviço não enviada!');
  end;

  sXML := Caminho;

  //PathPastaMensal := FormatDateTime('yyyymm', sqlTemplate.FieldByName('NOFIDEMIS').Value);

  //sXML := SQLEmpresaEMPRA100CAMINHOXML.Value + '\' + PathPastaMensal + '\' + SQLTemplateNOFIA44CHAVEACESSO.asstring + '-NFe.xml';
  //Danfe := SQLEmpresaEMPRA100CAMINHODANFES.Value + '\' + SQLTemplateNOFIA44CHAVEACESSO.asstring + '.pdf';

  if FileExists(sXML) then
  begin
    fDMCadNotaServico.qFilial_Email.Close;
    fDMCadNotaServico.qFilial_Email.ParamByName('ID').AsInteger :=  fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger;
    fDMCadNotaServico.qFilial_Email.Open;

    //if (Trim(isqlParametro.fieldbyname('EMPRA50EMAILHOST').Value) = EmptyStr)
    //  or (Trim(isqlParametro.fieldbyname('EMPRA75EMAILUSUARIO').Value) = EmptyStr)
    //    or (Trim(isqlParametro.fieldbyname('EMPRA50EMAILSENHA').Value) = EmptyStr) then
    //begin
    //    {Abortar envio de email}
    //  exit;
    //end;

    if (Trim(fDMCadNotaServico.qFilial_EmailREMETENTE_EMAIL.AsString) = EmptyStr) then
    begin
        {Abortar envio de email}
      exit;
    end;

    //if isqlParametro.fieldbyname('EMPRA1SSL').Value = 'S' then
    if fDMCadNotaServico.qFilial_EmailSMTP_REQUER_SSL.Value = 'S' then
      xSSL := True
    else
      xSSL := False;
    //if isqlParametro.fieldbyname('EMPRA1TSL').Value = 'S' then
    //if fDMCadNotaServico.qFilial_Email isqlParametro.fieldbyname('EMPRA1TSL').Value = 'S' then
    //  xTSL := True
    //else
      xTSL := False;

    try
        //Montando o corpo do email com dados ref. a nota fiscal.
      stl := TStringList.Create; //Instanciando objeto TStringList

        //Adiciona texto padrão de email Nf-e.
      stl.Add('Caro Cliente,');
      stl.Add('');
      stl.Add('Informamos que uma Nota Serviço Eletrônica foi emitida para seu CPF/CNPJ. Numero da NF.: ' + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString);
      stl.Add('');
      {stl.Add('Para consultar a nota diretamente no site da Receita Federal, escolha e clique nos enderecos eletronicos abaixo e informe a seguinte chave de acesso:');
      stl.Add(SQLTemplateNOFIA44CHAVEACESSO.AsString);
      stl.Add('');
      stl.Add('- Consulta em Ambiente Nacional');
      stl.Add('http://www.nfe.fazenda.gov.br/PORTAL/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
      stl.Add('');
      stl.Add('- Consulta em Ambiente Regional (' + UpperCase(SQLEmpresaEMPRA2UF.Value) + ')');
      stl.Add('https://www.sefaz.rs.gov.br/NFE/NFE-COM.aspx');
      stl.Add('');
      stl.Add('* A NF-e ficara disponivel para consulta por 180 dias, a partir da data de emissao. *'); }

        // Carrega parametros para enviar email
      ACBrMail1.Subject := Titulo; // assunto
      ACBrMail1.IsHTML := True; // define que a mensagem é html
      //ACBrMail1.From :=  isqlParametro.fieldbyname('EMPRA75EMAILUSUARIO').AsString;
      ACBrMail1.From :=  fDMCadNotaServico.qFilial_EmailSMTP_USUARIO.AsString;
      //ACBrMail1.FromName := isqlParametro.fieldbyname('EMPRA60NOMEFANT').AsString;
      ACBrMail1.FromName := fDMCadNotaServico.cdsNotaServico_ImpFANTASIA_FIL.AsString;
      //ACBrMail1.Host := isqlParametro.fieldbyname('EMPRA50EMAILHOST').AsString;
      ACBrMail1.Host := fDMCadNotaServico.qFilial_EmailSMTP_CLIENTE.AsString;
      //ACBrMail1.Username := isqlParametro.fieldbyname('EMPRA75EMAILUSUARIO').AsString;
      ACBrMail1.Username := fDMCadNotaServico.qFilial_EmailSMTP_USUARIO.AsString;
      //ACBrMail1.Password := isqlParametro.fieldbyname('EMPRA50EMAILSENHA').AsString;
      ACBrMail1.Password := fDMCadNotaServico.qFilial_EmailSMTP_SENHA.AsString;
      //ACBrMail1.Port := isqlParametro.fieldbyname('EMPRIEMAILPORTA').AsString;
      ACBrMail1.Port := fDMCadNotaServico.qFilial_EmailSMTP_PORTA.AsString;
      ACBrMail1.UseThread := False; //Aguarda Envio do Email(nÃ£o usa thread)
      ACBrMail1.AddAddress(Para, '');

      //CC:=TstringList.Create;
      if emailCopia <> '' then
       //CC.Add(emailCopia);
        ACBrMail1.AddCC(emailCopia);

        // mensagem principal do e-mail. pode ser html ou texto puro
      ACBrMail1.Body.Text := stl.Text;
      ACBrMail1.SetSSL := xSSL; // SSL - Conexão Segura
      ACBrMail1.SetTLS := xTSL; // TLS - Crypografia, para hotmail obrigatorio
      if FileExists(sXML) then
        ACBrMail1.AddAttachment(sXML, ''); // um_nome_opcional

      if FileExists(Danfe) then
        ACBrMail1.AddAttachment(Danfe, '') // um_nome_opcional
      else begin
        if ACBrNFSe1.NotasFiscais.Count > 0 then
        begin         
          //Danfe := ExtractFilePath(Application.ExeName) + 'Xml-Nfs\PDF\'+
          Danfe := fDMCadNotaServico.cdsParametrosENDPDFNFSE.AsString + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString +
                   fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString;
          //IsqlDadosNota.fieldbyname('NNOT').AsString + IsqlDadosNota.fieldbyname('SER').AsString+'-nfse.pdf';

          if FileExists(Danfe) then
            ACBrMail1.AddAttachment(Danfe, ''); // um_nome_opcional
        end;
      end;
      try
        ACBrMail1.Send;
        ShowMessage('E-mail enviado!');
      except
        on e : Exception do
        begin
          ShowMessage('Não foi possível enviar e-mail para o cliente!' + #13 + e.Message);
        end;
      end;

    finally
      stl.Free;
    end;
  end
  else
  begin
    raise Exception.Create('Arquivo XML não encontrado!');
  end;
end;

function TdmNFSe.fnc_monta_discriminacao: String;
var
  vDiscriminacao : String;
  vTexto1 : String;
  vPercAux: Real;
  vPercAux_Estadual, vPercAux_Federal, vPercAux_Municipal :Real;
  vTexto : String;
begin
  vDiscriminacao := '';
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;
  while not fDMCadNotaServico.cdsNotaServico_Imp_Itens.Eof do
  begin
    if trim(vDiscriminacao) <> '' then
      vDiscriminacao := vDiscriminacao + ' (' + fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString
    else
      vDiscriminacao := '(' + fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString;
    if (fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsInteger > 0) and (fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger > 0) and
       (fDMCadNotaServico.cdsParametrosIMP_MESANO_REF_NOITEM_NFSE.AsString = 'S') then
      vDiscriminacao := vDiscriminacao + ' Ref.: ' + FormatFloat('00',fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger) + '/' +
                        fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsString;

    //17/05/2017
    if (fDMCadNotaServico.qParametros_PedUSA_OPERACAO_SERV.AsString = 'S') and (trim(fDMCadNotaServico.cdsNotaServico_Imp_ItensNUM_OS_PED.AsString) <> '') then
      vDiscriminacao := vDiscriminacao + ' ' + fDMCadNotaServico.cdsNotaServico_Imp_ItensNUM_OS_PED.AsString + ' ';
    //*********************

    vDiscriminacao := vDiscriminacao + '  Valor R$ ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_TOTAL.AsFloat) + ')';

    fDMCadNotaServico.cdsNotaServico_Imp_Itens.Next;
  end;
  //Foi incluido dia 10/05/2013 a pedido da Shala devido a Engenhar não imprimir para Órgão Público
  if (fDMCadNotaServico.cdsCondPgto.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONDPGTO.AsInteger,[loCaseInsensitive])) and
     (fDMCadNotaServico.cdsCondPgtoIMPRIMIR_NFSE.AsString = 'S') then
  begin
    if fDMCadNotaServico.cdsNotaServico_ImpTIPO_PRAZO.AsString = 'V' then
      vDiscriminacao := vDiscriminacao + '(Pagamento a Vista)'
    else
    begin
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
      fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.First;
      vTexto1 := '';
      while not fDMCadNotaServico.cdsNotaServico_Imp_Parc.Eof do
      begin
        if trim(vTexto1) = '' then
          vTexto1 := '    (Vencimento: '
        else
          vTexto1 := vTexto1 + '   -  ';
        vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_Imp_ParcDTVENCIMENTO.AsString + ' R$ ' +
                   FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ParcVLR_VENCIMENTO.AsFloat);
        fDMCadNotaServico.cdsNotaServico_Imp_Parc.Next;
      end;
      if vTexto1 <> '' then
        vDiscriminacao :=  vDiscriminacao + vTexto1 + ')';
    end;
  end;
  //Incluido dia 06/07/2016 para imprimir os contratos
  if fDMCadNotaServico.qParametros_SerIMP_CONTRATO_NFSE.AsString = 'S' then
  begin
    fDMCadNotaServico.prc_Monta_Obs_Contrato;
    if trim(fDMCadNotaServico.vObs_Contrato) <> '' then
      vDiscriminacao := vDiscriminacao + fDMCadNotaServico.vObs_Contrato;
  end;
  //**************

  //Incluido dia 29/04/2014 para a Prestto
  if (fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger > 0) and
     (fDMCadNotaServico.cdsTipoCobranca.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger,[loCaseInsensitive])) then
  begin
    if (fDMCadNotaServico.cdsTipoCobrancaDEPOSITO.AsString = 'S') and
       (fDMCadNotaServico.cdsContas.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONTA.AsInteger,[loCaseInsensitive])) then
    begin
      vTexto1 := '(Deposito: Ag.: ' + fDMCadNotaServico.cdsContasAGENCIA.AsString + '-' + fDMCadNotaServico.cdsContasDIG_AGENCIA.AsString +
                 ', Conta: ' + fDMCadNotaServico.cdsContasNUMCONTA.AsString + '-' + fDMCadNotaServico.cdsContasDIG_CONTA.AsString +
                 ', ' + fDMCadNotaServico.cdsContasNOME.AsString + ')';
      vDiscriminacao := vDiscriminacao + vTexto1;
    end;
  end;
  //*******************

  if fDMCadNotaServico.cdsFilialSIMPLES.AsString = 'S' then
  begin
    if trim(fDMCadNotaServico.cdsParametrosOBS_SIMPLES.AsString) <> '' then
      vDiscriminacao := vDiscriminacao + ' (' + fDMCadNotaServico.cdsParametrosOBS_SIMPLES.Value + ')';
  end;
  vTexto1 := fDMCadNotaServico.fnc_Montar_Obs_Retencao;
  if trim(vTexto1) <> '' then
    vDiscriminacao := vDiscriminacao + vTexto1;
  if trim(fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value) <> '' then
    vDiscriminacao := vDiscriminacao + '   (' + fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value + ')';
  //Mês/Ano Referente
  if (fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsInteger > 0) and (fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsInteger > 0) and
     (fDMCadNotaServico.cdsParametrosIMP_MESANO_REF_NOITEM_NFSE.AsString <> 'S') then
    vDiscriminacao := vDiscriminacao + '   (Mês/Ano Ref.: ' + fDMCadNotaServico.cdsNotaServico_ImpMES_REF.AsString + '/' +
                      fDMCadNotaServico.cdsNotaServico_ImpANO_REF.AsString +   ')';
  //Lei 12.741/12
  if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO.AsFloat)) > 0 then
  begin
    if fDMCadNotaServico.cdsParametrosIMP_TIPO_TRIBUTOS_SERVICO.AsString = 'T' then
    begin
      vDiscriminacao := vDiscriminacao + '(Vlr. aproximado total de tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12. R$ ' +
                        FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO.AsFloat);
      vDiscriminacao := vDiscriminacao + '  ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_TRIBUTO.AsFloat) + '%';
      vDiscriminacao := vDiscriminacao + ' Fonte: ' + fDMCadNotaServico.cdsNotaServico_ImpFONTE_TRIBUTO.AsString + ')';
    end
    else
    begin
      vPercAux           := StrToCurr(FormatCurr('0.00',((fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO.AsFloat / fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat) * 100)));
      vPercAux_Estadual  := StrToCurr(FormatCurr('0.00',((fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_ESTADUAL.AsFloat / fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat) * 100)));
      vPercAux_Federal   := StrToCurr(FormatCurr('0.00',((fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_FEDERAL.AsFloat / fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat) * 100)));
      vPercAux_Municipal := StrToCurr(FormatCurr('0.00',((fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_MUNICIPAL.AsFloat / fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat) * 100)));
      vTexto := '(Vlr.aprox. tributos R$ ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_FEDERAL.AsFloat);
      if fDMCadNotaServico.cdsParametrosIMP_PERC_TRIB_SERVICO.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Federal);
      vTexto := vTexto + ' Federal,';
      vTexto := vTexto + ' R$ ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_ESTADUAL.AsFloat);
      if fDMCadNotaServico.cdsParametrosIMP_PERC_TRIB_SERVICO.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Estadual);
      vTexto := vTexto + ' Estadual e R$ ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO_MUNICIPAL.AsFloat);
      if fDMCadNotaServico.cdsParametrosIMP_PERC_TRIB_SERVICO.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Municipal);
      vTexto := vTexto + ' Municipal  R$ ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TRIBUTO.AsFloat);
      if fDMCadNotaServico.cdsParametrosIMP_PERC_TRIB_SERVICO.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux);
      vTexto := vTexto + ' Total';
      vTexto := vTexto + ' Lei 12.741/12,';
      if (trim(fDMCadNotaServico.cdsNotaServico_ImpFONTE_TRIBUTO.AsString) = '') and (fDMCadNotaServico.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'I') then
        vTexto := vTexto + ' Fonte IBPT)'
      else
        vTexto := vTexto + ' Fonte ' + fDMCadNotaServico.cdsNotaServico_ImpFONTE_TRIBUTO.AsString + ')';
      vDiscriminacao := vDiscriminacao + vTexto;
    end;
  end;
  Result := vDiscriminacao;
  //**************************

end;

procedure TdmNFSe.prc_Abrir_NotaServico_Comunicacao(ID: Integer);
begin
  qNotaServico_Comunicacao.Close;
  qNotaServico_Comunicacao.ParamByName('ID_NOTASERVICO').AsInteger := ID;
  qNotaServico_Comunicacao.Open;
end;

procedure TdmNFSe.prc_Gravar_Retorno(Caminho : string);
begin
  fDMCadNotaServico.prc_Localizar(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
  if not (fDMCadNotaServico.cdsNotaServico.IsEmpty) then
  begin
    fDMCadNotaServico.cdsNotaServico.Edit;
    fDMCadNotaServico.cdsNotaServicoPROTOCOLO.AsString := ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Protocolo;
    fDMCadNotaServico.cdsNotaServicoCOD_AUTENCIDADE_RET.AsString := ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.CodigoVerificacao;
    fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsString := ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.Numero;
    fDMCadNotaServico.cdsNotaServicoDTRECEBIMENTO_RET.AsDateTime := ACBrNFSe1.NotasFiscais.Items[vCont].NFSe.dhRecebimento;
    if fDMCadNotaServico.cdsNotaServicoDT_EMISSAO_RET.AsString = '' then
      fDMCadNotaServico.cdsNotaServicoDT_EMISSAO_RET.AsString := DateTimeToStr(DataEmissaoRet);
    fDMCadNotaServico.cdsNotaServicoXML.LoadFromFile(Caminho);

    fDMCadNotaServico.cdsNotaServico.Post;
    fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
  end;
end;

end.
