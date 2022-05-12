unit UGerar_NFSe_txt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit,
  CurrEdit, NxCollection, UDMCadOS, UDMCadNotaServico, UDMCadRecibo, Grids, DBGrids, SMDBGrid, RxLookup, dbXPress, SqlExpr,
  RzPanel, RzTabs;

type
  TfrmGerar_NFSe_txt = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ceAno: TCurrencyEdit;
    btnConsultar: TNxButton;
    ComboBox3: TComboBox;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    ckRecibo: TCheckBox;
    lbDiretorio: TLabel;
    Label2: TLabel;
    ceQtdDigitos: TCurrencyEdit;
    RzGroupBox1: TRzGroupBox;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzGroupBox2: TRzGroupBox;
    SMDBGrid1: TSMDBGrid;
    Panel4: TPanel;
    btnExcluir: TNxButton;
    gbxConta_Orcamento: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    Panel3: TPanel;
    btExcluir_Itens: TNxButton;
    Panel2: TPanel;
    btnConfBaixa: TNxButton;
    btnGerar_Recibo: TNxButton;
    TabSheet2: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    Label6: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    File_Extrato: TFilenameEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfBaixaClick(Sender: TObject);
    procedure btnGerar_ReciboClick(Sender: TObject);
    procedure btExcluir_ItensClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadNotaServico: TDMCadNotaServico;
    fDMCadRecibo: TDMCadRecibo;
    fDMCadOS: TDMCadOS;
    vContador_NFSe: Integer;
    vArquivo : String;
    Txt  : TextFile;
    vCod_Alfa : String;
    vVlr_Servico : Real;

    vDesc_Servico : String;

    procedure prc_Gravar_NFSe;
    procedure prc_Gravar_Recibo;
    procedure prc_Le_txt;
    procedure prc_Gravar_mExtrato;
    procedure prc_Gravar_mExtrato_Itens;
    procedure prc_Le_mExtrato;
    function fnc_Busca_Cod_Alfa : String;

  public
    { Public declarations }
  end;

var
  frmGerar_NFSe_txt: TfrmGerar_NFSe_txt;

implementation

uses DateUtils, rsDBUtils, DB, uUtilPadrao, DmdDatabase, SysConst,
  StrUtils;

{$R *.dfm}

procedure TfrmGerar_NFSe_txt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadOS);
  FreeAndNil(fDMCadNotaServico);
  FreeAndNil(fDMCadRecibo);
  Action := Cafree;
end;

procedure TfrmGerar_NFSe_txt.btnConsultarClick(Sender: TObject);
begin
  if (ComboBox3.ItemIndex < 0) then
  begin
    MessageDlg('*** Mês não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if (ceAno.AsInteger < 2000) then
  begin
    MessageDlg('*** Ano incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Filial não informada!', mtError, [mbOk], 0);
    exit;
  end;
  if trim(File_Extrato.Text) = '' then
  begin
    MessageDlg('*** Arquivo não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if fDMCadOS.qParametrosID_COND_PGTO_NFSE.AsInteger <= 0 then
  begin
    MessageDlg('*** Condição de pagamento da NFse não informada nos parametros!', mtError, [mbOk], 0);
    exit;
  end;
  vFilial := RxDBLookupCombo1.KeyValue;
  prc_Le_txt;
  prc_Le_mExtrato;
  Refresh;
  MessageDlg('Tabela gravada!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmGerar_NFSe_txt.FormShow(Sender: TObject);
begin
  fDMCadNotaServico := TDMCadNotaServico.Create(Self);
  fDMCadRecibo      := TDMCadRecibo.Create(Self);
  fDMCadOS          := TDMCadOS.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadOS);
  ceAno.AsInteger         := YearOf(Date);
  if fDMCadOS.cdsFilial.RecordCount = 1 then
    RxDBLookupCombo1.KeyValue := fDMCadOS.cdsFilialID.AsInteger;
  if fDMCadOS.qParametrosUSA_RECIBO_NFSE.AsString <> 'S' then
    ckRecibo.Checked := False;
  ckRecibo.Visible := (fDMCadOS.qParametrosUSA_RECIBO_NFSE.AsString = 'S');
  btnGerar_Recibo.Visible := (fDMCadOS.qParametrosUSA_RECIBO_NFSE.AsString = 'S');
  ceQtdDigitos.AsInteger  := fDMCadOS.qParametrosQTD_DIG_COD_CLI_CTB.AsInteger;
  fDMCadNotaServico.prc_Abrir_cdsCliente('','NSE');
end;

procedure TfrmGerar_NFSe_txt.btnConfBaixaClick(Sender: TObject);
begin
  vFilial        := RxDBLookupCombo1.KeyValue;
  vContador_NFSe := 0;
  fDMCadOS.vMSGNotaGerada := '';
  fDMCadOS.vMSGAviso      := '';
  fDMCadOS.mExtrato.First;
  while not fDMCadOS.mExtrato.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      if fDMCadOS.mExtratoNum_Contrato.IsNull then
        prc_Gravar_NFSe
      else
      if fDMCadOS.mExtratoNum_Contrato.AsInteger > 0 then
      begin
        if not(fDMCadOS.fnc_Nota_Gerada(ceAno.AsInteger,ComboBox3.ItemIndex + 1,fDMCadOS.mExtratoNum_Contrato.AsInteger,fDMCadOS.mExtratoAno_Contrato.AsInteger))  then
          prc_Gravar_NFSe;
      end
      else
        prc_Gravar_NFSe;
    end;
    fDMCadOS.mExtrato.Next;
  end;

  if (trim(fDMCadOS.vMSGNotaGerada) <> '') and (trim(fDMCadOS.vMSGAviso) <> '') then
    MessageDlg('*** CONTRATOS NÃO GERADOS ***!' +#13+#13 + fDMCadOS.vMSGNotaGerada + #13 +#13 +
               '*** Notas Geradas Com Aviso: ' + #13 + fDMCadOS.vMSGAviso, mtError, [mbOk], 0)
  else
  if trim(fDMCadOS.vMSGNotaGerada) <> '' then
    MessageDlg('*** CONTRATOS NÃO GERADOS ***!' +#13+#13 + fDMCadOS.vMSGNotaGerada, mtError, [mbOk], 0)
  else
  if trim(fDMCadOS.vMSGAviso) <> '' then
    MessageDlg('*** Notas Geradas Com Aviso: ' +#13 + fDMCadOS.vMSGAviso, mtError, [mbOk], 0)
  else
    MessageDlg('Notas Geradas, Qtd: ' + IntToStr(vContador_NFSe) , mtInformation, [mbOk], 0);
end;

procedure TfrmGerar_NFSe_txt.prc_Gravar_NFSe;
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vDias_Mes: Integer;
  vDia: Integer;
  vMes : Integer;
  vAno : Integer;
  vGerar_Dup : String;
begin
  //fDMCadOS.prc_Localizar(fDMCadOS.cdsContratoID.AsInteger);
  //if (fDMCadOS.cdsOS.IsEmpty) or (fDMCadOS.cdsOSID.AsInteger <= 0) then
  //  exit;

  if vFilial <> fDMCadOS.cdsFilialID.AsInteger then
    fDMCadOS.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 '
                     + ' WHERE TABELA = ' + QuotedStr('NOTASERVICO');
    sds.ExecSQL();

    fDMCadNotaServico.prc_Inserir('');

    fDMCadOS.cdsCliente.Locate('CODIGO',fDMCadOS.mExtratoID_Cliente.AsInteger,[loCaseInsensitive]);
    if fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger <= 0 then
      fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.Clear;
    if fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger <= 0 then
      fDMCadNotaServico.cdsNotaServicoID_NATUREZA.Clear;

    //fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger         := fDMCadOS.cdsOSID_NATUREZA.AsInteger;
    fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString           := fDMCadOS.mExtratoRetem_ISS.AsString;
    fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat         := fDMCadOS.mExtratoPerc_ISS.AsFloat;
    fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger          := fDMCadOS.cdsFilialID_SERVICO_PAD.AsInteger;
    fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.Value           := '';
    fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger         := fDMCadOS.qParametrosID_COND_PGTO_NFSE.AsInteger;
    //fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger    := fDMCadOS.qParametrosID_TIPO_COBRANCA_PADRAO.AsInteger;
    fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString           := 'P';
    fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger          := fDMCadOS.mExtratoID_Cliente.AsInteger;
    //fDMCadNotaServico.cdsNotaServicoID_BANCO.AsInteger            := fDMCadOS.qParametrosID_CONTA_PADRAO.AsInteger;
    fDMCadNotaServico.cdsNotaServicoDTINICIO_DUPLICATA.AsDateTime := fDMCadOS.mExtratoDtEmissao.AsDateTime;
    fDMCadNotaServico.cdsNotaServicoHOMOLOGACAO.AsString          := 'N';
    //fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger            := fDMCadOS.cdsOSID_CONTA.AsInteger;
    fDMCadNotaServico.cdsNotaServicoCNAE_NFSE.AsString            := fDMCadOS.mExtratoCNAE.AsString;
    fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString           := 'N';
    fDMCadNotaServico.cdsNotaServicoRETEM_PISCOFINS.AsString      := 'N';
    fDMCadNotaServico.cdsNotaServicoRETEM_INSS.AsString           := fDMCadOS.mExtratoRetem_INSS.AsString;
    //fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger    := fDMCadOS.cdsOSID_ATIVIDADE_CID.AsInteger;
    fDMCadNotaServico.cdsNotaServicoPERC_INSS.AsFloat             := fDMCadOS.mExtratoPerc_INSS.AsFloat;
    fDMCadNotaServico.cdsNotaServicoPERC_IR.AsFloat               := fDMCadOS.mExtratoPerc_IR.AsFloat;
    fDMCadNotaServico.cdsNotaServicoDIMINUIR_RETENCAO.AsString    := 'S';
    fDMCadNotaServico.cdsNotaServicoEMAIL_ENVIADO.AsString        := 'N';
    fDMCadNotaServico.cdsNotaServicoPERC_TRIBUTO.AsFloat          := fDMCadNotaServico.cdsFilialPERC_TRIB_SERV.AsFloat;
    fDMCadNotaServico.cdsNotaServicoPERC_REDUCAO_INSS.AsFloat     := StrToFloat(FormatFloat('0.000',fDMCadOS.mExtratoPerc_Red_INSS.AsFloat));
    fDMCadNotaServico.cdsNotaServicoANO_REF.AsInteger             := ceAno.AsInteger;
    fDMCadNotaServico.cdsNotaServicoMES_REF.AsInteger             := ComboBox3.ItemIndex + 1;
    //fDMCadNotaServico.cdsNotaServicoID_CONTRATO.AsInteger         := fDMCadOS.cdsOSID.AsInteger;
    if (trim(fDMCadOS.mExtratoNum_Contrato.AsString) <> '') and not(fDMCadOS.mExtratoNum_Contrato.IsNull) then
      fDMCadNotaServico.cdsNotaServicoNUM_CONTRATO.AsString        := fDMCadOS.mExtratoNum_Contrato.AsString;
    //fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger  := fDMCadOS.cdsOSID_CONTA_ORCAMENTO.AsInteger;
    {if fDMCadOS.cdsOSID_VENDEDOR.AsInteger > 0 then
    begin
      fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger       := fDMCadOS.cdsOSID_VENDEDOR.AsInteger;
      fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat       := StrToFloat(FormatFloat('0.00',fDMCadOS.cdsOSPERC_COMISSAO.AsFloat));
    end;}
    //if fDMCadOS.cdsOSID_CONTA.AsInteger > 0 then
    //  fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger := fDMCadOS.cdsOSID_CONTA.AsInteger;
    //if fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger > 0 then
     // fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger := fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger;

    //if fDMCadOS.cdsClienteCLIENTE_CONTA_ID.AsInteger > 0 then
    //  fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger := fDMCadOS.cdsClienteCLIENTE_CONTA_ID.AsInteger
    //else
    //if fDMCadOS.qParametrosID_CONTA_ORC_SERVICO.AsInteger > 0 then
    //  fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger := fDMCadOS.qParametrosID_CONTA_ORC_SERVICO.AsInteger;
    fDMCadNotaServico.qProximaNota.Close;
    fDMCadNotaServico.qProximaNota.ParamByName('FILIAL').AsInteger := fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger;
    fDMCadNotaServico.qProximaNota.ParamByName('SERIE').AsString   := fDMCadOS.cdsFilialSERIE_NFSE.AsString;
    fDMCadNotaServico.qProximaNota.Open;
    fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger := fDMCadNotaServico.qProximaNotaNUMNOTA.AsInteger + 1;
    fDMCadNotaServico.cdsNotaServicoSERIE.AsString    := fDMCadOS.cdsFilialSERIE_NFSE.AsString;
    fDMCadNotaServico.qProximaNota.Close;

    vGerar_Dup := 'S';
    if (fDMCadOS.qParametrosUSA_RECIBO_NFSE.AsString = 'S') and not(ckRecibo.Checked) then
    begin
      if fDMCadOS.fnc_Recibo_Gerado(ceAno.AsInteger,ComboBox3.ItemIndex + 1) then
        vGerar_Dup := 'N';
    end;

    fDMCadOS.mExtrato_Itens.First;
    while not fDMCadOS.mExtrato_Itens.Eof do
    begin
      fDMCadNotaServico.prc_Inserir_Itens;
      fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat        := StrToFloat(FormatFloat('0.00',fDMCadOS.mExtrato_ItensVlr_Unitario.AsFloat));
      fDMCadNotaServico.cdsNotaServico_ItensGERAR_DUPLICATA.AsString    := vGerar_Dup;
      fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger    := fDMCadOS.mExtrato_ItensID_Servico_Int.AsInteger;
      fDMCadNotaServico.cdsNotaServico_ItensNOME_SERVICO_INT.AsString   := fDMCadOS.mExtrato_ItensNome_Servico.AsString;
      fDMCadNotaServico.cdsNotaServico_ItensSOMAR_DIMINUIR.AsString     := 'S';
      fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_INSS.AsString      := 'S';
      fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_IR.AsString        := 'S';
      fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_ISSQN.AsString     := 'S';
      fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_PISCOFINS.AsString := 'N';
      fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadOS.mExtrato_ItensQtd.AsFloat));
      fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat           := StrToFloat(FormatFloat('0.00',fDMCadOS.mExtrato_ItensVlr_Total.AsFloat));
      fDMCadNotaServico.cdsNotaServico_Itens.Post;
      fDMCadOS.mExtrato_Itens.Next;
    end;
    if not(fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) then
      fDMCadNotaServico.cdsNotaServico.Edit;

    fDMCadNotaServico.prc_Recalcular;
    fDMCadNotaServico.prc_Calcular_Impostos;

    //Parcelas
    fDMCadNotaServico.CDSNotaServico_Parc.Insert;
    fDMCadNotaServico.CDSNotaServico_ParcID.AsInteger   := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
    fDMCadNotaServico.CDSNotaServico_ParcITEM.AsInteger := 1;

    //28/07/2014 = Foi incluida a opção para calcular automatico o vencimento
    fDMCadNotaServico.CDSNotaServico_ParcDTVENCIMENTO.AsDateTime := fDMCadOS.mExtratoDtVencimento.AsDateTime;
    fDMCadNotaServico.CDSNotaServico_ParcVLR_VENCIMENTO.AsFloat  := fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat;
    {if fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadNotaServico.CDSNotaServico_ParcID_TIPOCOBRANCA.AsInteger := fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger;
    if fDMCadOS.cdsOSID_CONTA.AsInteger > 0 then
      fDMCadNotaServico.CDSNotaServico_ParcID_CONTA.AsInteger := fDMCadOS.cdsOSID_CONTA.AsInteger;}
    fDMCadNotaServico.CDSNotaServico_Parc.Post;

    if fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert] then
      fDMCadNotaServico.cdsNotaServico.Post;
    fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);

    fDMCadNotaServico.Gravar_Duplicata('R','N',fDMCadNotaServico.cdsNotaServico_ParcITEM.AsInteger,fDMCadNotaServico.cdsNotaServico_ParcVLR_VENCIMENTO.AsFloat,fDMCadNotaServico.cdsNotaServico_ParcDTVENCIMENTO.AsDateTime,'');

    dmDatabase.scoDados.Commit(ID);

    vContador_NFSe := vContador_NFSe + 1;
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TfrmGerar_NFSe_txt.btnGerar_ReciboClick(Sender: TObject);
begin
  vFilial        := RxDBLookupCombo1.KeyValue;
  vContador_NFSe := 0;
  fDMCadOS.vMSGNotaGerada := '';
  fDMCadOS.cdsContrato.First;
  while not fDMCadOS.cdsContrato.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and not(fDMCadOS.fnc_Recibo_Gerado(ceAno.AsInteger,ComboBox3.ItemIndex + 1)) and (fDMCadOS.cdsContratoDIA_VENCIMENTO.AsInteger > 0)  then
      prc_Gravar_Recibo;
    fDMCadOS.cdsContrato.Next;
  end;
  if trim(fDMCadOS.vMSGNotaGerada) <> '' then
    MessageDlg('*** CONTRATOS NÃO GERADOS ***!' +#13+#13 + fDMCadOS.vMSGNotaGerada, mtError, [mbOk], 0)
  else
  if trim(fDMCadOS.vMSGNotaGerada) <> '' then
    MessageDlg('*** CONTRATOS NÃO GERADOS ***!' +#13+#13 + fDMCadOS.vMSGNotaGerada, mtError, [mbOk], 0)
  else
    MessageDlg('Recibos Gerados, Qtd: ' + IntToStr(vContador_NFSe) , mtInformation, [mbOk], 0);
end;

procedure TfrmGerar_NFSe_txt.prc_Gravar_Recibo;
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vDias_Mes: Integer;
  vDia: Integer;
  vMes : Integer;
  vAno : Integer;
begin
  fDMCadOS.prc_Localizar(fDMCadOS.cdsContratoID.AsInteger);
  if (fDMCadOS.cdsOS.IsEmpty) or (fDMCadOS.cdsOSID.AsInteger <= 0) then
    exit;

  if vFilial <> fDMCadOS.cdsFilialID.AsInteger then
    fDMCadOS.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 '
                     + ' WHERE TABELA = ' + QuotedStr('RECIBO');
    sds.ExecSQL();

    fDMCadRecibo.prc_Inserir;

    fDMCadOS.cdsCliente.Locate('CODIGO',fDMCadOS.cdsContratoID_CLIENTE.AsInteger,[loCaseInsensitive]);

    fDMCadRecibo.cdsReciboID_CLIENTE.AsInteger   := fDMCadOS.cdsOSID_CLIENTE.AsInteger;
    fDMCadRecibo.cdsReciboDTEMISSAO.AsDateTime   := Date;
    fDMCadRecibo.cdsReciboVLR_TOTAL.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadOS.cdsOSVLR_TOTAL.AsFloat));
    fDMCadRecibo.cdsReciboVLR_DUPLICATA.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadOS.cdsOSVLR_TOTAL.AsFloat));
    fDMCadRecibo.cdsReciboID_CONTRATO.AsInteger  := fDMCadOS.cdsOSID.AsInteger;
    if fDMCadOS.cdsOSID_CONDPGTO.AsInteger > 0 then
      fDMCadRecibo.cdsReciboID_CONDPGTO.AsInteger := fDMCadOS.cdsOSID_CONDPGTO.AsInteger;
    fDMCadRecibo.cdsReciboTIPO_PRAZO.AsString    := 'P';
    fDMCadRecibo.cdsReciboNUM_CONTRATO.AsInteger := fDMCadOS.cdsOSNUM_CONTRATO.AsInteger;
    fDMCadRecibo.cdsReciboANO_REF.AsInteger      := ceAno.AsInteger;
    fDMCadRecibo.cdsReciboMES_REF.AsInteger      := ComboBox3.ItemIndex + 1;
    fDMCadRecibo.cdsReciboOBS.AsString           := '';
    fDMCadRecibo.cdsReciboFILIAL.AsInteger       := fDMCadOS.cdsOSFILIAL.AsInteger;
    fDMCadRecibo.cdsReciboOBS.AsString           := 'Valor Referente ao Contrato ' + fDMCadOS.cdsOSNUM_CONTRATO.AsString
                                                  + #13 + ' Mês/Ano Ref: ' + fDMCadRecibo.cdsReciboMES_REF.AsString + '/'
                                                  + fDMCadRecibo.cdsReciboANO_REF.AsString;

    fDMCadRecibo.cdsReciboID_CONTA_ORCAMENTO.AsInteger := fDMCadOS.cdsOSID_CONTA_ORCAMENTO.AsInteger;
    if fDMCadOS.cdsOSID_VENDEDOR.AsInteger > 0 then
    begin
      fDMCadRecibo.cdsReciboID_VENDEDOR.AsInteger := fDMCadOS.cdsOSID_VENDEDOR.AsInteger;
      fDMCadRecibo.cdsReciboPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadOS.cdsOSPERC_COMISSAO.AsFloat));
    end;
    if fDMCadOS.cdsOSID_CONTA.AsInteger > 0 then
      fDMCadRecibo.cdsReciboID_CONTA.AsInteger := fDMCadOS.cdsOSID_CONTA.AsInteger;
    if fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadRecibo.cdsReciboID_TIPO_COBRANCA.AsInteger := fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger;
    if fDMCadOS.cdsClienteCLIENTE_CONTA_ID.AsInteger > 0 then
      fDMCadRecibo.cdsReciboID_CONTA_ORCAMENTO.AsInteger := fDMCadOS.cdsClienteCLIENTE_CONTA_ID.AsInteger
    else
    if fDMCadOS.qParametrosID_CONTA_ORC_SERVICO.AsInteger > 0 then
      fDMCadRecibo.cdsReciboID_CONTA_ORCAMENTO.AsInteger := fDMCadOS.qParametrosID_CONTA_ORC_SERVICO.AsInteger;
    fDMCadRecibo.qProximo_Num.Close;
    fDMCadRecibo.qProximo_Num.Open;
    fDMCadRecibo.cdsReciboNUM_RECIBO.AsInteger := fDMCadRecibo.qProximo_NumNUM_RECIBO.AsInteger + 1;
    fDMCadRecibo.qProximo_Num.Close;

    fDMCadOS.cdsOS_Servico_Int.First;
    while not fDMCadOS.cdsOS_Servico_Int.Eof do
    begin
      fDMCadRecibo.prc_Inserir_Itens;
      fDMCadRecibo.cdsRecibo_ItensID_SERVICO_INT.AsInteger  := fDMCadOS.cdsOS_Servico_IntID_SERVICO_INT.AsInteger;
      fDMCadRecibo.cdsRecibo_ItensNOME_SERVICO_INT.AsString := fDMCadOS.cdsOS_Servico_IntNOME_SERVICO_INT.AsString;
      if StrToFloat(FormatFloat('0.000',fDMCadOS.cdsOS_Servico_IntQTD.AsFloat)) > 0 then
        fDMCadRecibo.cdsRecibo_ItensQTD.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadOS.cdsOS_Servico_IntQTD.AsFloat))
      else
        fDMCadRecibo.cdsRecibo_ItensQTD.AsFloat := 1;
      fDMCadRecibo.cdsRecibo_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadOS.cdsOS_Servico_IntVLR_SERVICO.AsFloat));
      fDMCadRecibo.cdsRecibo_ItensVLR_TOTAL.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadRecibo.cdsRecibo_ItensVLR_UNITARIO.AsFloat * fDMCadRecibo.cdsRecibo_ItensQTD.AsFloat));
      fDMCadRecibo.cdsRecibo_ItensGERAR_DUPLICATA.AsString := 'S';
      fDMCadRecibo.cdsRecibo_Itens.Post;
      fDMCadOS.cdsOS_Servico_Int.Next;
    end;
    if not(fDMCadRecibo.cdsRecibo.State in [dsEdit,dsInsert]) then
      fDMCadRecibo.cdsRecibo.Edit;

    //Parcelas
    fDMCadRecibo.cdsRecibo_Parc.Insert;
    fDMCadRecibo.cdsRecibo_ParcID.AsInteger   := fDMCadRecibo.cdsReciboID.AsInteger;
    fDMCadRecibo.cdsRecibo_ParcITEM.AsInteger := 1;

    if fDMCadOS.cdsOSOPCAO_VENCIMENTO_MREF.AsString = 'S' then
    begin
      vDias_Mes := DaysInAMonth(ceAno.AsInteger,ComboBox3.ItemIndex+1);
      if fDMCadOS.cdsOSDIA_VENCIMENTO.AsInteger > vDias_Mes then
        vDia := vDias_Mes
      else
        vDia := fDMCadOS.cdsOSDIA_VENCIMENTO.AsInteger;
      fDMCadRecibo.cdsRecibo_ParcDTVENCIMENTO.AsDateTime := EncodeDate(ceAno.AsInteger,ComboBox3.ItemIndex+1,vDia);
    end
    else
    begin
      vMes := (ComboBox3.ItemIndex+1) + 1;
      vAno := ceAno.AsInteger;
      if vMes > 12 then
      begin
        vMes := 1;
        vAno := vAno + 1;
      end;
      vDias_Mes := DaysInAMonth(vAno,vMes);
      if fDMCadOS.cdsOSDIA_VENCIMENTO.AsInteger > vDias_Mes then
        vDia := vDias_Mes
      else
        vDia := fDMCadOS.cdsOSDIA_VENCIMENTO.AsInteger;
      fDMCadRecibo.cdsRecibo_ParcDTVENCIMENTO.AsDateTime := EncodeDate(vAno,vMes,vDia);
       //IncMonth(fDMCadNotaServico.CDSNotaServico_ParcDTVENCIMENTO.AsDateTime,1);
    end;
    fDMCadRecibo.cdsRecibo_ParcVLR_VENCIMENTO.AsFloat  := fDMCadRecibo.cdsReciboVLR_DUPLICATA.AsFloat;
    if fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadRecibo.cdsRecibo_ParcID_TIPOCOBRANCA.AsInteger := fDMCadOS.cdsOSID_TIPO_COBRANCA.AsInteger;
    if fDMCadOS.cdsOSID_CONTA.AsInteger > 0 then
      fDMCadRecibo.cdsRecibo_ParcID_CONTA.AsInteger := fDMCadOS.cdsOSID_CONTA.AsInteger;
    fDMCadRecibo.cdsRecibo_Parc.Post;

    if fDMCadRecibo.cdsRecibo.State in [dsEdit,dsInsert] then
      fDMCadRecibo.cdsRecibo.Post;
    fDMCadRecibo.cdsRecibo.ApplyUpdates(0);

    fDMCadRecibo.Gravar_Duplicata('R','N',fDMCadRecibo.cdsRecibo_ParcITEM.AsInteger,fDMCadRecibo.cdsRecibo_ParcVLR_VENCIMENTO.AsFloat,fDMCadRecibo.cdsRecibo_ParcDTVENCIMENTO.AsDateTime,'');

    dmDatabase.scoDados.Commit(ID);

    vContador_NFSe := vContador_NFSe + 1;
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TfrmGerar_NFSe_txt.prc_Le_txt;
var
  i, i2 : Integer;
  vCod_Ant : String;
  vAux : String;
begin
  fDMCadOS.mExtrato.First;
  while not fDMCadOS.mExtrato.Eof do
  begin
    //fDMCadOS.mExtrato_Itens.First;
    //while not fDMCadOS.mExtrato_Itens.Eof do
    //  fDMCadOS.mExtrato_Itens.Delete;
    fDMCadOS.mExtrato.Delete;
  end;
  fDMCadOS.mExtrato_Nao.First;
  while not fDMCadOS.mExtrato_Nao.Eof do
    fDMCadOS.mExtrato_Nao.Delete;
  vArquivo := fnc_verifica_Arquivo(File_Extrato.Text,'L');
  vCod_Alfa := '';
  vCod_Ant  := '';
  AssignFile(Txt, vArquivo);
  Reset(Txt);
  try
    while not Eof(Txt) do
    begin
      ReadLn(Txt,vRegistro_CSV);
      i := PosEx('Textbox',vRegistro_CSV);
      if i <= 0 then
        i2 := PosEx('Total faturado',vRegistro_CSV);
      //if Copy(vRegistro_CSV,1,4) <> 'Text' then
      if (i <= 0) and (i2 <= 0) and (trim(vRegistro_CSV) <> '') then
      begin
        vAux      := fnc_Montar_Campo(',');
        //vCod_Alfa := fnc_Montar_Campo(',');
        vCod_Alfa := fnc_Busca_Cod_Alfa;
        prc_Gravar_mExtrato;
        vCod_Ant := vCod_Alfa;
      end;
    end;

  finally
    CloseFile(Txt);
  end;
end;

procedure TfrmGerar_NFSe_txt.prc_Gravar_mExtrato;
var
  i : Integer;
  vAux : String;
  vDtVencimento, vDtEmissao, vNumContrato : String;
  vVlrAux : Real;
  vExiste : Boolean;
  vCodAux : String;
  vCod_Alfa_Aux : String;
begin
  fDMCadOS.qCliente.Close;
  fDMCadOS.qCliente.ParamByName('COD_ALFA').AsString := vCod_Alfa;
  fDMCadOS.qCliente.Open;
  if fDMCadOS.qCliente.IsEmpty then
  begin
    //Gravar o arquivo dos contratos não gerados
    fDMCadOS.mExtrato_Nao.Insert;
    fDMCadOS.mExtrato_NaoCod_Alfa.AsString := vCod_Alfa;
    fDMCadOS.mExtrato_NaoMotivo.AsString   := 'Cliente não encontrado';
    fDMCadOS.mExtrato_Nao.Post;
    exit;
  end;

  vAux := fnc_Montar_Campo(','); //Código e Nome
  vAux := fnc_Montar_Campo(','); //Vencimento
  vDtVencimento := vAux;
  vAux := fnc_Montar_Campo(',');
  vDtEmissao := vAux;
  vDesc_Servico := TirarAcento(fnc_Montar_Campo(','));
  vNumContrato  := fnc_Montar_Campo(',');

  vCodAux := vNumContrato + '.' + vCod_Alfa;
  i := Pos('/',vCod_Alfa);
  if (i > 0) and (ceQtdDigitos.AsInteger > 0) then
  begin
    vAux := copy(vCod_Alfa,1,i-1);
    for i := 1 to ceQtdDigitos.AsInteger - Length(vAux) do
      vAux := '0' + vAux;
    vCod_Alfa_Aux := vAux + '/' +copy(vCod_Alfa,Pos('/',vCod_Alfa)+1,Length(vCod_Alfa)-Pos('/',vCod_Alfa));
  end
  else
    vCod_Alfa_Aux := vCod_Alfa;
  {vExiste := False;
  if trim(vNumContrato) = '' then
  begin
    if fDMCadOS.mExtrato.Locate('Cod_Alfa',vCod_Alfa,[loCaseInsensitive]) then
      vExiste := True;
  end
  else
  if fDMCadOS.mExtrato.Locate('Num_Contrato',vNumContrato,[loCaseInsensitive]) then
    vExiste := True;}

  //if fDMCadOS.mExtrato.Locate('Cod_Alfa',vCod_Alfa,[loCaseInsensitive]) then
  if fDMCadOS.mExtrato.Locate('Cod_Alfa_Aux',vCod_Alfa_Aux,[loCaseInsensitive]) then
  //if vExiste then
    fDMCadOS.mExtrato.Edit
  else
  begin
    fDMCadOS.mExtrato.Insert;
    fDMCadOS.mExtratoCod_Alfa_Aux.AsString := vCod_Alfa_Aux;
    if trim(vNumContrato) <> '' then
      fDMCadOS.mExtratoNum_Contrato.AsString := vNumContrato
    else
      fDMCadOS.mExtratoNum_Contrato.Clear;
    fDMCadOS.mExtratoCod_Alfa.AsString     := fDMCadOS.qClienteCOD_ALFA.AsString;
    fDMCadOS.mExtratoID_Cliente.AsInteger  := fDMCadOS.qClienteCODIGO.AsInteger;
    fDMCadOS.mExtratoDtVencimento.AsString := vDtVencimento;
    fDMCadOS.mExtratoDtEmissao.AsString    := vDtEmissao;
    //fDMCadOS.mExtratoMes_Ref.AsInteger     := MonthOf(fDMCadOS.mExtratoDtEmissao.AsDateTime);
    //fDMCadOS.mExtratoAno_Ref.AsInteger     := YearOf(fDMCadOS.mExtratoDtEmissao.AsDateTime);
    fDMCadOS.mExtratoNome_Cliente.AsString := fDMCadOS.qClienteNOME.AsString;
    fDMCadOS.mExtratoAno_Ref.AsInteger     := ceAno.AsInteger;
    fDMCadOS.mExtratoMes_Ref.AsInteger     := ComboBox3.ItemIndex + 1;
  end;
  if vNumContrato <> '' then
    fDMCadOS.mExtratoNum_Contrato.AsString := vNumContrato;

  vAux := fnc_Montar_Campo(','); //OS
  //Incluido 09/05/2016
  vAux := fnc_Montar_Campo(','); //Título
  vAux := fnc_Montar_Campo(','); //Nosso Número
  //**************
  vAux := fnc_Montar_Campo(','); //Valor a receber Parte Inteira
  vAux := fnc_Montar_Campo(','); //Deduções Parte Inteira
  vAux := fnc_Montar_Campo(','); //Acréscimo Parte Inteira
  vAux := fnc_Montar_Campo(','); //Desconto Parte Inteira
  if trim(vAux) <> '' then
    vAux := fnc_Montar_Campo(','); //Desconto Parte Decimal
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(','); //Valor Total (Inteiro)
  vAux := vAux + ',' + fnc_Montar_Campo(','); //Valor Total (Decimal)
  vAux := StringReplace(vAux,'.','',[rfReplaceAll]);
  vVlr_Servico := StrToFloat(vAux);
  fDMCadOS.mExtratoVlr_Servico.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadOS.mExtratoVlr_Servico.AsFloat + vVlr_Servico));
  fDMCadOS.mExtratoVlr_Total.AsFloat   := StrToFloat(FormatFloat('0.00',fDMCadOS.mExtratoVlr_Total.AsFloat + vVlr_Servico));
  fDMCadOS.prc_Abrir_Servico('P');
  if not fDMCadOS.cdsServico.IsEmpty then
  begin
    fDMCadOS.mExtratoPerc_ISS.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadOS.cdsServicoPERC_ISS.AsFloat));
    if trim(fDMCadOS.cdsServicoCNAE.AsString) <> '' then
      fDMCadOS.mExtratoCNAE.AsString := fDMCadOS.cdsServicoCNAE.AsString
    else
    if trim(fDMCadOS.cdsFilialCNAE_NFSE.AsString) <> '' then
      fDMCadOS.mExtratoCNAE.AsString := fDMCadOS.cdsFilialCNAE_NFSE.AsString;
  end;
  if fDMCadOS.mExtratoPerc_ISS.AsFloat <= 0 then
    fDMCadOS.mExtratoPerc_ISS.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadOS.cdsFilialPERC_ISS.AsFloat));
  fDMCadOS.mExtratoPerc_INSS.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadOS.cdsFilialPERC_INSS.AsFloat));
  fDMCadOS.mExtratoPerc_IR.AsFloat   := StrToFloat(FormatFloat('0.000',fDMCadOS.cdsFilialPERC_IR.AsFloat));
  if fDMCadOS.qClienteRETEM_INSS.AsString = 'S' then
    fDMCadOS.mExtratoRetem_ISS.AsString := 'S'
  else
    fDMCadOS.mExtratoRetem_ISS.AsString := 'N';
  if fDMCadOS.qClienteRETEM_INSS.AsString = 'S' then
    fDMCadOS.mExtratoRetem_INSS.AsString := 'S'
  else
    fDMCadOS.mExtratoRetem_INSS.AsString := 'N';
  fDMCadOS.mExtratoPerc_Red_INSS.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadOS.qClientePERC_REDUCAO_INSS.AsFloat));
  fDMCadOS.mExtratoRetem_IR.AsString     := 'N';

  fDMCadOS.mExtrato.Post;

  prc_Gravar_mExtrato_Itens;
end;

procedure TfrmGerar_NFSe_txt.prc_Gravar_mExtrato_Itens;
var
  vItemAux : Integer;
begin
  fDMCadOS.mExtrato_Itens.Last;
  vItemAux := fDMCadOS.mExtrato_ItensItem.AsInteger + 1;
  fDMCadOS.mExtrato_Itens.Insert;
  fDMCadOS.mExtrato_ItensCod_Alfa.AsString        := fDMCadOS.mExtratoCod_Alfa.AsString;
  fDMCadOS.mExtrato_ItensNum_Contrato.AsString    := fDMCadOS.mExtratoNum_Contrato.AsString;
  fDMCadOS.mExtrato_ItensItem.AsInteger           := vItemAux;
  fDMCadOS.mExtrato_ItensID_Servico.AsInteger     := fDMCadOS.cdsFilialID_SERVICO_PAD.AsInteger;
  fDMCadOS.mExtrato_ItensCod_Servico.AsString     := fDMCadOS.cdsServicoCODIGO.AsString;
  fDMCadOS.mExtrato_ItensID_Servico_Int.AsInteger := 1;
  fDMCadOS.mExtrato_ItensNome_Servico.AsString    := vDesc_Servico;
  fDMCadOS.mExtrato_ItensQtd.AsInteger            := 1;
  fDMCadOS.mExtrato_ItensVlr_Unitario.AsFloat     := StrToFloat(FormatFloat('0.00',vVlr_Servico));
  fDMCadOS.mExtrato_ItensVlr_Total.AsFloat        := StrToFloat(FormatFloat('0.00',vVlr_Servico));
  fDMCadOS.mExtrato_Itens.Post;
end;

function TfrmGerar_NFSe_txt.fnc_Busca_Cod_Alfa: String;
var
  i : integer;
begin
  Result := '';
  i := pos('-',vRegistro_CSV);
  if i <= 0 then
    exit;
  Result := copy(vRegistro_CSV,1,i-1);
  Result := TrimRight(Result);
end;

procedure TfrmGerar_NFSe_txt.prc_Le_mExtrato;
var
  vQtdAux : Integer;
  vVlrTotalAux : Real;
begin
  vQtdAux      := 0;
  vVlrTotalAux := 0;
  fDMCadOS.mExtrato.First;
  while not fDMCadOS.mExtrato.Eof do
  begin
    vQtdAux      := vQtdAux + 1;
    vVlrTotalAux := StrToFloat(FormatFloat('0.00',vVlrTotalAux + fDMCadOS.mExtratoVlr_Total.AsFloat));
    fDMCadOS.mExtrato.Next;
  end;
  CurrencyEdit1.Value     := vQtdAux;
  CurrencyEdit2.Value     := vVlrTotalAux;
  CurrencyEdit3.AsInteger := fDMCadOS.mExtrato_Nao.RecordCount;
end;

procedure TfrmGerar_NFSe_txt.btExcluir_ItensClick(Sender: TObject);
var
  vVlrAux : Real;
begin
  if fDMCadOS.mExtrato_Itens.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir o serviço?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vVlrAux := 0;
  try
    vVlrAux := fDMCadOS.mExtrato_ItensVlr_Total.AsFloat;
    fDMCadOS.mExtrato_Itens.Delete;
    vVlrAux := StrToFloat(FormatFloat('0.00',CurrencyEdit2.Value - vVlrAux));
    CurrencyEdit2.Value := vVlrAux;
  except
  end;
end;

procedure TfrmGerar_NFSe_txt.btnExcluirClick(Sender: TObject);
var
  vVlrAux : Real;
  vQtdAux : Integer;
begin
  if fDMCadOS.mExtrato.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir o contrato ' + fDMCadOS.mExtratoNum_Contrato.AsString + '?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vVlrAux := 0;
  try
    vVlrAux := fDMCadOS.mExtratoVlr_Total.AsFloat;
    fDMCadOS.mExtrato.Delete;
    vVlrAux := StrToFloat(FormatFloat('0.00',CurrencyEdit2.Value - vVlrAux));
    CurrencyEdit2.Value := vVlrAux;
    CurrencyEdit1.AsInteger := CurrencyEdit1.AsInteger - 1;
  except
  end;
end;

end.
