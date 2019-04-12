unit UDMCadFilial_Certificado;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMFilial_Certificado = class(TDataModule)
    sdsFilial_Certificado: TSQLDataSet;
    dspFilial_Certificado: TDataSetProvider;
    cdsFilial_Certificado: TClientDataSet;
    dsFilial_Certificado: TDataSource;
    sdsFilial_CertificadoID: TIntegerField;
    sdsFilial_CertificadoCHAVE_ACESSO: TMemoField;
    sdsFilial_CertificadoCNPJ_TITULAR: TStringField;
    sdsFilial_CertificadoEMISSOR: TStringField;
    sdsFilial_CertificadoNOME_TITULAR: TStringField;
    sdsFilial_CertificadoNUMERO_SERIE: TStringField;
    sdsFilial_CertificadoUTILIZA_NFE: TIntegerField;
    sdsFilial_CertificadoUTILIZA_NFSE: TIntegerField;
    sdsFilial_CertificadoVALIDADE_INICIO: TSQLTimeStampField;
    sdsFilial_CertificadoVALIDADE_FIM: TSQLTimeStampField;
    sdsFilial_CertificadoUTILIZA_MDFE: TIntegerField;
    sdsFilial_CertificadoUSUARIO_WEB: TStringField;
    sdsFilial_CertificadoSENHA_WEB: TStringField;
    sdsFilial_CertificadoAGUARDARCONSULTARETORNO: TIntegerField;
    sdsFilial_CertificadoCONSULTARLOTEAPOSENVIO: TStringField;
    sdsFilial_CertificadoINTERVALOTENTATIVAS: TIntegerField;
    cdsFilial_CertificadoID: TIntegerField;
    cdsFilial_CertificadoCHAVE_ACESSO: TMemoField;
    cdsFilial_CertificadoCNPJ_TITULAR: TStringField;
    cdsFilial_CertificadoEMISSOR: TStringField;
    cdsFilial_CertificadoNOME_TITULAR: TStringField;
    cdsFilial_CertificadoNUMERO_SERIE: TStringField;
    cdsFilial_CertificadoUTILIZA_NFE: TIntegerField;
    cdsFilial_CertificadoUTILIZA_NFSE: TIntegerField;
    cdsFilial_CertificadoVALIDADE_INICIO: TSQLTimeStampField;
    cdsFilial_CertificadoVALIDADE_FIM: TSQLTimeStampField;
    cdsFilial_CertificadoUTILIZA_MDFE: TIntegerField;
    cdsFilial_CertificadoUSUARIO_WEB: TStringField;
    cdsFilial_CertificadoSENHA_WEB: TStringField;
    cdsFilial_CertificadoAGUARDARCONSULTARETORNO: TIntegerField;
    cdsFilial_CertificadoCONSULTARLOTEAPOSENVIO: TStringField;
    cdsFilial_CertificadoINTERVALOTENTATIVAS: TIntegerField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    sdsFilialID: TIntegerField;
    sdsFilialNOME: TStringField;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctCommand : String;
    vMsgErro: string;
    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  DMFilial_Certificado: TDMFilial_Certificado;

implementation

uses
  DmdDatabase;

{$R *.dfm}

procedure TDMFilial_Certificado.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsFilial_Certificado.CommandText;
end;

procedure TDMFilial_Certificado.prc_Excluir;
begin
  if not (cdsFilial_Certificado.Active) or (cdsFilial_Certificado.IsEmpty) then
    exit;
  cdsFilial_Certificado.Delete;
  cdsFilial_Certificado.ApplyUpdates(0);
end;

procedure TDMFilial_Certificado.prc_Gravar;
begin
  vMsgErro := '';
  if trim(cdsFilial_CertificadoNUMERO_SERIE.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Nº de Série não informado!';
  if cdsFilial_CertificadoID.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Filial não informada!';
  if vMsgErro <> '' then
    exit;
  cdsFilial_Certificado.Post;
  cdsFilial_Certificado.ApplyUpdates(0);
end;

procedure TDMFilial_Certificado.prc_Inserir;
var
  vAux : String;
begin
  if not cdsFilial_Certificado.Active then
    prc_Localizar(-1);
  cdsFilial_Certificado.Insert;
end;

procedure TDMFilial_Certificado.prc_Localizar(ID: Integer);
begin
  cdsFilial_Certificado.Close;
  sdsFilial_Certificado.CommandText := ctCommand;
  if ID <> 0 then
    sdsFilial_Certificado.CommandText := sdsFilial_Certificado.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsFilial_Certificado.Open;
end;

end.
