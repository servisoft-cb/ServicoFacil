unit UCadNotaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadNotaServico, udmNFSe,
  DB, DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, Menus,
  RXDBCtrl, RzEdit, RzDBEdit, RzButton, UCBase, RzPanel, dbXPress, NxCollection, NxEdit,StrUtils, DateUtils,
  UCadNotaServico_Itens, UCadNotaServico_Canc, ComCtrls, ValorPor, RzDBDTP, RzDTP, UConsFat_Mensal, RzRadChk, UDMMovimento,
  UCadNotaServico_Obs, uXMLClientDataSet_NFSe_CampoBom, uXMLClientDataSet_NFSe_PortoAlegre, RzDBChk, USel_OS_Servico, Variants,
  UDMSelOS_Projeto, RzCmboBx, RzDBCmbo;

type
  TfrmCadNotaServico = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    pnlPesquisa: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    lblCliente: TLabel;
    Edit2: TEdit;
    lblSerie: TLabel;
    edtSerie: TEdit;
    StaticText1: TStaticText;
    lblNumNota: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    pnlNota: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    pnlCliente: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Shape1: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Shape2: TShape;
    lblTipo_Prazo: TLabel;
    rxcbTipo_Prazo: TRxDBComboBox;
    lblNome_Filial: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Shape5: TShape;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    ZerarDuplicata1: TMenuItem;
    GerarVlrDuplicata1: TMenuItem;
    Label23: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label18: TLabel;
    DBDateEdit1: TDBDateEdit;
    RzPageControl2: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    pnlValores: TPanel;
    Label39: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    UCControls1: TUCControls;
    DBCheckBox1: TDBCheckBox;
    pnlEnvio: TPanel;
    ckEmail: TCheckBox;
    Panel3: TPanel;
    Label24: TLabel;
    DBEdit7: TDBEdit;
    Label25: TLabel;
    DBEdit9: TDBEdit;
    Label26: TLabel;
    DBEdit10: TDBEdit;
    Label27: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label28: TLabel;
    DBEdit18: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Label22: TLabel;
    Label1: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnImp_Boleto: TNxButton;
    btnEnviar_NFSe: TNxButton;
    btnConsultar_NFSe: TNxButton;
    btnImprimir_NFSe: TNxButton;
    btnCancelar_NFSe: TNxButton;
    btnEnviarEmail: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    Label29: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    gbxLote_Protocolo: TRzGroupBox;
    Panel2: TPanel;
    Label30: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Panel6: TPanel;
    btnConsultar_NFSe2: TNxButton;
    btnConsultar2: TNxButton;
    SMDBGrid3: TSMDBGrid;
    btnExcluirLote: TNxButton;
    Label31: TLabel;
    Shape3: TShape;
    Label32: TLabel;
    DBEdit24: TDBEdit;
    Label33: TLabel;
    DBEdit25: TDBEdit;
    Label34: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label35: TLabel;
    DBEdit26: TDBEdit;
    PopupMenu2: TPopupMenu;
    testeaaaa1: TMenuItem;
    Label36: TLabel;
    DBDateEdit2: TDBDateEdit;
    RzDBCheckBox1: TRzDBCheckBox;
    Shape4: TShape;
    Label46: TLabel;
    btnConsNotas: TNxButton;
    Label55: TLabel;
    DBEdit33: TDBEdit;
    RzGroupBox3: TRzGroupBox;
    Label56: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit34: TDBEdit;
    Label58: TLabel;
    DBEdit35: TDBEdit;
    Label59: TLabel;
    DBEdit15: TDBEdit;
    Label61: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    Label41: TLabel;
    DBEdit36: TDBEdit;
    Label52: TLabel;
    DBEdit32: TDBEdit;
    Label43: TLabel;
    DBText2: TDBText;
    btnConsRps: TNxButton;
    NxDatePicker1: TNxDatePicker;
    NxDatePicker2: TNxDatePicker;
    DBEdit42: TDBEdit;
    btnCopiarOS: TNxButton;
    Label57: TLabel;
    DBText3: TDBText;
    CheckBox1: TCheckBox;
    DBEdit43: TDBEdit;
    Panel7: TPanel;
    RzGroupBox2: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    btnRecalcular: TRzBitBtn;
    Panel4: TPanel;
    btnInserir_Itens: TNxButton;
    btnExcluir_Itens: TNxButton;
    btnAlterar_Itens: TNxButton;
    btnGerar_Automatico: TNxButton;
    RzGroupBox1: TRzGroupBox;
    DBMemo1: TDBMemo;
    btnObs: TNxButton;
    gbxDuplicata: TRzGroupBox;
    Label72: TLabel;
    SpeedButton6: TSpeedButton;
    Label44: TLabel;
    Label45: TLabel;
    Label60: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label62: TLabel;
    SMDBGrid_Dupl2: TSMDBGrid;
    rxdbCondicaoPgto: TRxDBLookupCombo;
    rxdbConta_Orcamento: TRxDBLookupCombo;
    rxdbVendedor: TRxDBLookupCombo;
    dbPerc_Comissao: TDBEdit;
    rxdbTipoCobranca: TRxDBLookupCombo;
    rxdbConta: TRxDBLookupCombo;
    btnGerarParcelas: TNxButton;
    btnExcluirParcelas: TNxButton;
    dbVlr_Entrada: TDBEdit;
    pnlFaturado: TPanel;
    Label37: TLabel;
    Label40: TLabel;
    NxNumberEdit1: TNxNumberEdit;
    NxNumberEdit2: TNxNumberEdit;
    SMDBGrid4: TSMDBGrid;
    RzGroupBox4: TRzGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    NxButton1: TNxButton;
    stat1: TStatusBar;
    btnCopiarPedido: TNxButton;
    BitBtn1: TBitBtn;
    lblPercPIS: TLabel;
    dbedtPercPis: TDBEdit;
    lblPercCofins: TLabel;
    dbedtPercCofins: TDBEdit;
    Label77: TLabel;
    DBEdit46: TDBEdit;
    Label78: TLabel;
    DBEdit47: TDBEdit;
    dbedtNumNota: TDBEdit;
    dbedtSerie: TDBEdit;
    chkSomenteNEnviadas: TCheckBox;
    btnGerarCReceber: TNxButton;
    btnGerarMovimento: TNxButton;
    lblPercCSLL: TLabel;
    dbedtPercCSLL: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label73: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    TS_Obra: TRzTabSheet;
    Panel8: TPanel;
    pnlObra: TPanel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label80: TLabel;
    Label85: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    SpeedButton2: TSpeedButton;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo7: TRxDBLookupCombo;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    pnlInserirObra: TNxPanel;
    btnInserir_Obra: TNxButton;
    btnConfirmar_Obra: TNxButton;
    btnCancelar_Obra: TNxButton;
    btnExcluir_Obra: TNxButton;
    Label76: TLabel;
    RzDBComboBox5: TRzDBComboBox;
    Label64: TLabel;
    Label79: TLabel;
    DBEdit13: TDBEdit;
    DBEdit44: TDBEdit;
    pnlCidadeTrib: TPanel;
    Label63: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label89: TLabel;
    btnGravarVendedor_Dup: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure pnlClienteExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtSerieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBLookupCombo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure rxdbCondicaoPgtoChange(Sender: TObject);
    procedure ZerarDuplicata1Click(Sender: TObject);
    procedure GerarVlrDuplicata1Click(Sender: TObject);
    procedure btnImp_BoletoClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnInserir_ItensClick(Sender: TObject);
    procedure btnAlterar_ItensClick(Sender: TObject);
    procedure btnExcluir_ItensClick(Sender: TObject);
    procedure btnEnviar_NFSeClick(Sender: TObject);
    procedure btnConsultar_NFSeClick(Sender: TObject);
    procedure btnCancelar_NFSeClick(Sender: TObject);
    procedure btnGerar_AutomaticoClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure btnImprimir_NFSeClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConsultar2Click(Sender: TObject);
    procedure btnConsultar_NFSe2Click(Sender: TObject);
    procedure btnExcluirLoteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure btnRecalcularClick(Sender: TObject);
    procedure NxNumberEdit1GlyphClick(Sender: TObject);
    procedure RzDBCheckBox1Click(Sender: TObject);
    procedure btnConsNotasClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure btnConsRpsClick(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbVendedorExit(Sender: TObject);
    procedure rxdbVendedorEnter(Sender: TObject);
    procedure btnExcluirParcelasClick(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure dbVlr_EntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbConta_OrcamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure rxdbCondicaoPgtoEnter(Sender: TObject);
    procedure rxdbTipoCobrancaEnter(Sender: TObject);
    procedure rxdbConta_OrcamentoEnter(Sender: TObject);
    procedure Panel5Enter(Sender: TObject);
    procedure btnObsClick(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure btnCopiarOSClick(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBCheckBox1Enter(Sender: TObject);
    procedure btnCopiarPedidoClick(Sender: TObject);
    procedure pnlClienteEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGerarCReceberClick(Sender: TObject);
    procedure btnGerarMovimentoClick(Sender: TObject);
    procedure Panel8Exit(Sender: TObject);
    procedure btnInserir_ObraClick(Sender: TObject);
    procedure btnConfirmar_ObraClick(Sender: TObject);
    procedure btnCancelar_ObraClick(Sender: TObject);
    procedure btnExcluir_ObraClick(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure RxDBLookupCombo7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarVendedor_DupClick(Sender: TObject);
  private
    { Private declarations }
    vEnvioACBR: Boolean;
    vTipoNotaAnt: String;
    vID_Cliente_Ant: Integer;
    vID_Natureza_Ant: Integer;
    vID_Servico_Ant: Integer;
    vNomeArquivo: String;
    vNomeArqPDF: String;
    vRetorno: String;
    vProtocolo_Ret: String;
    vProtocolo_Ret2: String;
    vDtRecebimento_Ret: String;
    vLote_Ret: String;
    vNumLote_NFSe: Integer;
    vDadosCorpoEmail: WideString;
    vNum_RPS_Ret, vNum_NFSe_Ret: LongInt;
    vChave_NFSe: String;
    vAliquota_Ant: Real;
    vISS_Retido_Ant: String;

    vDtEmissao_Ret: String;
    vCod_Autencidade_Ret: String;
    vProcesso_OK: Boolean;
    vEmail_NFe: WideString;
    vFilial_Sel, vCodPagamento: Integer;
    vID_Vendedor_Ant: Integer;
    vNomeCliente_Ret: String;
    vValorServico_Ret: Real;
    vMostra_Opcao_Base: String;
    vID_CentroCusto_Ant : Integer;
    vConsultar: Boolean;

    sLista_Nota: TStringList;
    FListaNotas: TStringList;

    ffrmCadNotaServico_Itens: TfrmCadNotaServico_Itens;
    ffrmCadNotaServico_Canc: TfrmCadNotaServico_Canc;
    fDMCadNotaServico: TDMCadNotaServico;
    fDMSelOS_Projeto: TDMSelOS_Projeto;
    fDMNFSe: TDMNFSe;
    fDMMovimento: TDMMovimento;
    ffrmConsFat_Mensal: TfrmConsFat_Mensal;
    ffrmCadNotaServico_Obs: TfrmCadNotaServico_Obs;

    procedure prc_Limpa_Variaveis;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_NotaFiscal;
    procedure prc_Posicionar_Cliente;

    procedure prc_Habilitar_CamposNota;

    procedure prc_Opcao_Prazo;

    function fnc_Verifica_Registro: Boolean;
    function fnc_Cancelar: Boolean;

    function fnc_Existe_Nota: Boolean;

    function Monta_Diretorio(Tipo, Diretorio, Serie: string; Ano, Mes: Integer): string;  //"X" XML  "P" PDF   "G" PNG de Campo Bom

    function GerarNFSeTXT(AIndice: Integer): String;

    procedure prc_Montar_Protocolo;

    procedure prc_Enviar_Email;

    procedure prc_Monta_CorpoEmail;

    procedure prc_Gravar_Notas; //Acessa no envio
    procedure prc_Gravar_Autenticidade(vBtnConsRPS: Boolean = False); //Acessa na consulta do lote   a variável vai identificar se foi feita a consulta
                                                                 // através do botão 'Cons. RPS'

    procedure prc_Gravar_Envio_Email; //Gravar na tabela que o registro foi enviado por email
    procedure prc_Montar_RPS_NumNFSe(Texto: String);
    procedure prc_Limpar_Protocolo;
    procedure prc_Limpar_Protocolo_CB(Num_Lote: Integer);

    procedure prc_Gerar_Servico_Int;
    function GetTempDirectory: String;

    function fnc_Busca_TipoRetorno: String;
    function fnc_Dados_OK: Boolean;
    function Replace(Str, Ant, Novo: string): string;

    procedure prc_Limpar_Edit_Consulta;
    procedure prc_Consultar_NotaServicoLote;

    procedure prc_Gravar_Itens(ID_Servico: Integer; Vlr_Unitario: Real; Somar_Diminuir,Calc_Inss, Calc_Issqn, Calc_PisCofins, Calc_Csll, Calc_IR: String);

    procedure prc_Imprimir_Danfe(Tipo: String); //E= Envio   I=Imprimir
    procedure prc_Imprimir_Matricial_1(vArq: String);//Solumaster
    procedure prc_Imprimir_Matricial_2(vArq: String);//Decisão
    procedure prc_Imprimir_Matricial_3(vArq: String);//GVD
    procedure prc_Calcula_FatMensal;

    procedure prc_Opcao_Habilita;
    procedure prc_Le_fCds;
    procedure prc_Obter_Nota_PNG(Imprimir: Boolean = False);
    procedure prc_Atualiza_OrdemServico(ID: Integer; vTipo: String);
    procedure prc_Le_mPedidoAux;

    procedure prc_Consultar_RPS_Canc;
    procedure prc_Gravar_Nota_Canc;
    procedure prc_Ler_Parcelas;

    procedure prc_Movimento;

    procedure prc_Impressao_NFSe(Imprimir : Boolean = True);
    procedure prc_Posiciona_NotaServico_Imp;

    function fnc_LocalServidorNFe: String;

    function fnc_Verifica_AliqISSQN: Boolean;
    function fnc_senha(Opcao_Senha, Campo_Senha, Tipo, Desc1, Desc2, Desc3: String; Item: Integer; Vlr_Limite: Real): Boolean;

    function fnc_Busca_Inf(Campo1,Campo2 : String; Qtd: Integer) : String;

  public
    { Public declarations }
    cTXTStream: TMemoryStream;
    cXMLStream: TMemoryStream;
    sXMLNFSe: TMemoryStream;
  end;

var
  frmCadNotaServico: TfrmCadNotaServico;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao, uNFeComandos, URelDanfe_NFSe, URelDanfe_NFSe_SL, Math, uUtilCliente,
  USel_ContaOrc, uUtilCobranca, uXMLNFSe_CampoBom, uXMLNFSe_PortoAlegre, uUtilTabela, URelDanfe_NFSe_Poa, URelDANFE_NFSe_CB,
  USel_Ped_Servico, UConsNotaServico_NFeBD, USenha, USel_OS_Projeto,
  uUtilServico, uUtilForm, USel_CentroCusto;

{$R *.dfm}

procedure TfrmCadNotaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  prc_Grava_Grid(SMDBGrid1, Name, fDMCadNotaServico.qParametros_GeralENDGRIDS.AsString);
  FreeAndNil(FListaNotas);
  FreeAndNil(fDMMovimento);
  FreeAndNil(fDMCadNotaServico);
  Action := Cafree;
end;

procedure TfrmCadNotaServico.btnExcluirClick(Sender: TObject);
begin
  if not (SMDBGrid1.SelectedRows.CurrentRowSelected) then
  begin
    MessageDlg('*** Nota não selecionada para excluir!', mtError, [mbOk], 0);
    exit;
  end;

  if not fnc_Verifica_Registro then
    exit;

  prc_Posiciona_NotaFiscal;

  if fDMCadNotaServico.cdsNotaServico.IsEmpty then
    exit;

  if ((fDMCadNotaServico.cdsNotaServicoHOMOLOGACAO.AsString <> 'S') and (trim(fDMCadNotaServico.cdsNotaServicoSERIE.AsString) <> '8')) and (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S') then
  begin
    if fDMCadNotaServico.cdsNotaServicoNUMLOTE.AsInteger > 0 then
    begin
      MessageDlg('*** Nota possui lote, verificar no site da prefeitura se este RPS foi transformado em Nota!', mtError, [mbOk], 0);
      exit;
    end;

    if (fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger > 0) and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') then
    begin
      MessageDlg('*** Nota já autorizada na prefeitura!', mtError, [mbOk], 0);
      exit;
    end;

    if fDMCadNotaServico.cdsNotaServicoNUMLOTE.AsInteger > 0 then
    begin
      MessageDlg('*** Nota está no lote ' + fDMCadNotaServico.cdsNotaServicoNUMLOTE.AsString + ' na prefeitura!', mtError, [mbOk], 0);
      exit;
    end;

    if (fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.AsString <> '') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') then
    begin
      MessageDlg('*** Nota já autorizada na prefeitura!', mtError, [mbOk], 0);
      exit;
    end;
  end;
  if MessageDlg('Deseja excluir o RPS: ' +  fDMCadNotaServico.cdsNotaServicoNUMRPS.AsString + ' ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  prc_Excluir_Registro;

  fDMCadNotaServico.mOSAux.First;
  while not fDMCadNotaServico.mOSAux.Eof do
  begin
    prc_Atualiza_OrdemServico(fDMCadNotaServico.mOSAuxID.AsInteger,fDMCadNotaServico.mOSAuxTipo.AsString);
    fDMCadNotaServico.mOSAux.Next;
  end;

  //Atualiza Status Pedido    28/04/2017
  prc_Le_mPedidoAux;
  //******************

  uUtilServico.prc_Valores_OS_Projeto(fDMCadNotaServico);

  btnConsultarClick(Sender);
end;

procedure TfrmCadNotaServico.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadNotaServico.prc_Excluir_Registro;
begin
  fDMCadNotaServico.prc_Excluir;
end;

procedure TfrmCadNotaServico.prc_Gravar_Registro;
var
  vIDAux: Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  fDMCadNotaServico.mOSAux.EmptyDataSet;
  fDMCadNotaServico.mPedidoAux.EmptyDataSet;

  vIDAux := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
  if fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadNotaServico.vMSGNotaServico, mtError, [mbOk], 0);
    exit;
  end;

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('NOTASERVICO');
    sds.ExecSQL();

    try
      fDMCadNotaServico.prc_Excluir_Duplicata;
      fDMCadNotaServico.Excluir_ExtComissao;
      fDMCadNotaServico.prc_Excluir_Financeiro;
      fDMCadNotaServico.prc_Excluir_Movimento;
      fDMCadNotaServico.prc_Gravar_Comissao('');
      prc_Ler_Parcelas;
    except
      on e: Exception do
        raise Exception.Create('Erro ao gravar a Duplicata: ' + #13 + e.Message);
    end;

    try
      if fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger <> fDMCadNotaServico.cdsServicoID.AsInteger then
        fDMCadNotaServico.cdsServico.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger,[loCaseInsensitive]);

      prc_Movimento;
      fDMCadNotaServico.cdsNotaServico_Itens.First;
      while not fDMCadNotaServico.cdsNotaServico_Itens.Eof do
      begin
        //18/08/2021
        if fDMCadNotaServico.cdsNotaServico_ItensID_OS.AsInteger > 0 then
        begin
          if SQLLocate('PARAMETROS_SER','ID','USA_OS_PROJETO','1') = 'S' then
          begin
            if not fDMCadNotaServico.mOSProjeto.Locate('ID',fDMCadNotaServico.cdsNotaServico_ItensID_OS.AsInteger,[loCaseInsensitive]) then
            begin
              fDMCadNotaServico.mOSProjeto.Insert;
              fDMCadNotaServico.mOSProjetoID.AsInteger := fDMCadNotaServico.cdsNotaServico_ItensID_OS.AsInteger;
              fDMCadNotaServico.mOSProjeto.Post;
            end;
          end;
        end;
        if (fDMCadNotaServico.cdsNotaServico_ItensID_OS_SIMPLES.AsInteger > 0) and
           not(fDMCadNotaServico.mOSAux.FindKey([fDMCadNotaServico.cdsNotaServico_ItensID_OS_SIMPLES.AsInteger])) then
        begin
          fDMCadNotaServico.mOSAux.Insert;
          fDMCadNotaServico.mOSAuxID.AsInteger  := fDMCadNotaServico.cdsNotaServico_ItensID_OS_SIMPLES.AsInteger;
          fDMCadNotaServico.mOSAuxTipo.AsString := fDMCadNotaServico.cdsNotaServico_ItensTIPO.AsString;
          fDMCadNotaServico.mOSAux.Post;
        end
        else //  28/04/2017
        if (fDMCadNotaServico.cdsNotaServico_ItensID_PEDIDO.AsInteger > 0) and
           not(fDMCadNotaServico.mPedidoAux.FindKey([fDMCadNotaServico.cdsNotaServico_ItensID_PEDIDO.AsInteger])) then
        begin
          fDMCadNotaServico.mPedidoAux.Insert;
          fDMCadNotaServico.mPedidoAuxID_Pedido.AsInteger := fDMCadNotaServico.cdsNotaServico_ItensID_PEDIDO.AsInteger;
          fDMCadNotaServico.mPedidoAux.Post;
        end;//****************

        fDMCadNotaServico.cdsNotaServico_Itens.Next;
      end;

      //Atualiza Status Ordem Serviço
      fDMCadNotaServico.mOSAux.First;
      while not fDMCadNotaServico.mOSAux.Eof do
      begin
        prc_Atualiza_OrdemServico(fDMCadNotaServico.mOSAuxID.AsInteger,fDMCadNotaServico.mOSAuxTIPO.AsString);
        fDMCadNotaServico.mOSAux.Next;
      end;

      //Atualiza Status Pedido    28/04/2017
      prc_Le_mPedidoAux;
      //******************

      fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);

    except
      on e: Exception do
        raise Exception.Create('Erro ao gravar o movimento: ' + #13 + e.Message);
    end;

    dmDatabase.scoDados.Commit(ID);
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);

  if SQLLocate('PARAMETROS_SER','ID','USA_OS_PROJETO','1') = 'S' then
    uUtilServico.prc_Valores_OS_Projeto(fDMCadNotaServico)
  else
  begin
    fDMCadNotaServico.sdsprc_Status_OrdemServico.Close;
    fDMCadNotaServico.sdsprc_Status_OrdemServico.ParamByName('P_ID').AsInteger := vIDAux;
    fDMCadNotaServico.sdsprc_Status_OrdemServico.ExecSQL;
  end;

  TS_Consulta.TabEnabled   := True;
  prc_Habilitar_CamposNota;

  prc_Consultar(vIDAux);
  prc_Posiciona_NotaFiscal;
end;

procedure TfrmCadNotaServico.prc_Inserir_Registro;
begin
  fDMCadNotaServico.cdsParametros.Close;
  fDMCadNotaServico.cdsParametros.Open;

  if uUtilPadrao.fnc_Selecionar_Filial <= 0 then
    exit;

  fDMCadNotaServico.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);

  fDMCadNotaServico.prc_Abrir_Natureza;
  fDMCadNotaServico.prc_Abrir_Servico;

  fDMCadNotaServico.prc_Inserir('');
  lblNome_Filial.Caption := vFilial_Nome;

  if fDMCadNotaServico.cdsNotaServico.State in [dsBrowse] then
    exit;

  prc_Habilitar_CamposNota;

  RzPageControl1.ActivePage := TS_Cadastro;
  TS_Consulta.TabEnabled    := False;

  vTipoNotaAnt := 'S';
  if fDMCadNotaServico.cdsFilialID_SERVICO_PAD.AsInteger > 0 then
    fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger := fDMCadNotaServico.cdsFilialID_SERVICO_PAD.AsInteger;
  fDMCadNotaServico.cdsNotaServicoPERC_INSS.AsFloat := fDMCadNotaServico.cdsFilialPERC_INSS.AsFloat;
  fDMCadNotaServico.cdsNotaServicoPERC_IR.AsFloat   := fDMCadNotaServico.cdsFilialPERC_IR.AsFloat;
  fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger := fDMCadNotaServico.cdsFilialID_ATIVIDADE_CID.AsInteger;
  fDMCadNotaServico.cdsNotaServicoPERC_CSRF.AsFloat          := fDMCadNotaServico.cdsFilialPERC_CSRF.AsFloat;
  fDMCadNotaServico.cdsNotaServicoHOMOLOGACAO.AsString       := fDMCadNotaServico.cdsFilialNFSE_HOMOLOGACAO.AsString;
  fDMCadNotaServico.cdsNotaServicoTIPO_ES.AsString           := 'S';
  pnlFaturado.Visible := (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsFilialVLR_FATURAMENTO_MES_CSRF.AsFloat)) > 0);

  fDMCadNotaServico.cdsNotaServicoPERC_PIS.AsFloat    := fDMCadNotaServico.cdsFilialPERC_PIS.AsFloat;
  fDMCadNotaServico.cdsNotaServicoPERC_COFINS.AsFloat := fDMCadNotaServico.cdsFilialPERC_COFINS.AsFloat;
  fDMCadNotaServico.cdsNotaServicoPERC_CSLL.AsFloat   := fDMCadNotaServico.cdsFilialPERC_CSLL.AsFloat;
  fDMCadNotaServico.cdsNotaServicoEXIGIBILIDADE_ISS.AsInteger := fDMCadNotaServico.cdsFilialEXIGIBILIDADE_ISS.AsInteger;

  RxDBLookupCombo3.SetFocus;
  NxNumberEdit1.Clear;
  NxNumberEdit2.Clear;
  prc_Opcao_Habilita;
end;

procedure TfrmCadNotaServico.FormShow(Sender: TObject);
var
  vData: TDateTime;
  i: Integer;
begin
  fDMCadNotaServico := TDMCadNotaServico.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaServico);
  prc_le_Grid(SMDBGrid1, Name, fDMCadNotaServico.qParametros_GeralENDGRIDS.AsString);
  fDMMovimento := TDMMovimento.Create(Self);
  if SQLLocate('PARAMETROS_SER','ID','USA_OS_PROJETO','1') = 'S' then
    fDMSelOS_Projeto := TDMSelOS_Projeto.Create(Self);
  fDMCadNotaServico.prc_Abrir_cdsCliente('S','NSE');
  vEnvioACBR := fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString = 'A';

  fDMCadNotaServico.cdsCentroCusto.Open;

  vFilial_Sel := 0;
  vData := EncodeDate(YearOf(Date),MonthOf(Date),01);
  NxDatePicker1.Date := vData;
  NxDatePicker2.Date := Date;
  fDMCadNotaServico.cdsNotaServico_Consulta.IndexFieldNames := 'DTEMISSAO';
  btnConsultar.Click;

  btnEnviarEmail.Visible    := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  btnEnviar_NFSe.Visible    := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  btnConsultar_NFSe.Visible := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit8.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label17.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label23.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  CurrencyEdit2.Visible     := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label29.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  CurrencyEdit3.Visible     := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label24.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit7.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label25.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label26.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label27.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Label13.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit9.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit10.Visible          := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit11.Visible          := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  DBEdit12.Visible          := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  Panel12.Visible           := (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S');
  //Vendedor
  Label45.Visible           := (fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S');
  Label60.Visible           := (fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S');
  rxdbVendedor.Visible      := (fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S');
  dbPerc_Comissao.Visible   := (fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S');
  //*****
  if fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString = 'S' then
  begin
    for i := 1 to SMDBGrid1.ColCount - 2 do
    begin
      if (SMDBGrid1.Columns[i].FieldName = 'NUMLOTE') or (SMDBGrid1.Columns[i].FieldName = 'NUMRPS') or
         (SMDBGrid1.Columns[i].FieldName = 'STATUS_RPS') or (SMDBGrid1.Columns[i].FieldName = 'NUMRPS_SUBSTITUIDO') or
         (SMDBGrid1.Columns[i].FieldName = 'COD_AUTENCIDADE_RET') or (SMDBGrid1.Columns[i].FieldName = 'DT_EMISSAO_RET') or
         (SMDBGrid1.Columns[i].FieldName = 'PROTOCOLO') or (SMDBGrid1.Columns[i].FieldName = 'SERIE_SUBSTITUIDO') then
        SMDBGrid1.Columns[i].Visible := False;
    end;
  end;
  DBEdit29.ReadOnly   := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString <> 'P');
  DBEdit42.Visible    := ((fDMCadNotaServico.cdsParametrosUSA_ANO_CONTRATO.AsString = 'S') and (fDMCadNotaServico.qParametros_SerAGRUPA_CONTRATO_NFSE.AsString <> 'S'));
  btnCopiarOS.Visible := (fDMCadNotaServico.cdsParametrosUSA_COPIA_OS_NFSE.AsString = 'S');
  SMDBGrid4.Visible   := (fDMCadNotaServico.qParametros_SerAGRUPA_CONTRATO_NFSE.AsString = 'S');
  Label58.Visible     := (fDMCadNotaServico.qParametros_SerAGRUPA_CONTRATO_NFSE.AsString <> 'S');
  DBEdit35.Visible    := (fDMCadNotaServico.qParametros_SerAGRUPA_CONTRATO_NFSE.AsString <> 'S');
  
  NxNumberEdit2.Visible := (fDMCadNotaServico.cdsParametrosCONTROLAR_MENSAL_CSRF.AsString = 'S');
  Label40.Visible       := (fDMCadNotaServico.cdsParametrosCONTROLAR_MENSAL_CSRF.AsString = 'S');

  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'NUM_OS_SIMPLES') then
      SMDBGrid2.Columns[i].Visible := (fDMCadNotaServico.cdsParametrosUSA_COPIA_OS_NFSE.AsString = 'S');
  end;

  if fDMCadNotaServico.qParametros_SerAGRUPA_CONTRATO_NFSE.AsString = 'S' then
  begin
    if (SMDBGrid4.Columns[0].FieldName = 'ANO_CONTRATO') then
      SMDBGrid4.Columns[0].Visible := (fDMCadNotaServico.cdsParametrosUSA_ANO_CONTRATO.AsString = 'S');
  end;
  uUtilPadrao.fnc_Busca_Nome_Filial;
  stat1.Panels[0].Text := vUsuario;
  stat1.Panels[1].Text := vFilial_Nome;
  btnCopiarPedido.Visible := (fDMCadNotaServico.qParametros_PedUSA_OPERACAO_SERV.AsString = 'S');

  //Label73.Visible  := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  //Label76.Visible  := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  Label77.Visible  := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  Label78.Visible  := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  //DBEdit44.Visible := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  //DBEdit45.Visible := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  DBEdit46.Visible := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
  DBEdit47.Visible := (fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S');
end;

procedure TfrmCadNotaServico.prc_Consultar(ID: Integer);
begin
  fDMCadNotaServico.cdsNotaServico_Consulta.Close;
  fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.ctConsulta;
  if ID > 0 then
    fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                           ' WHERE NS.ID = ' + IntToStr(ID)
  else
  begin
    fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                           ' WHERE ((TIPO_ES = ' + QuotedStr('S') + ') OR (TIPO_ES IS NULL))';
    if not(RxDBLookupCombo1.Text = '') then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                             ' AND NS.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
    if Trim(edtSerie.Text) <> '' then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                           ' AND NS.SERIE = ' + QuotedStr(edtSerie.Text);
    if CurrencyEdit1.AsInteger > 0 then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                             ' AND NS.NUMNOTA = ' + CurrencyEdit1.Text;
    if CurrencyEdit2.AsInteger > 0 then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                             ' AND NS.NUMRPS = ' + CurrencyEdit2.Text;
    if (CurrencyEdit3.AsInteger > 0) then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText +
                                                             ' AND NS.NUMLOTE = ' + CurrencyEdit3.Text;
    if NxDatePicker1.Text <> '' then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText
                          + ' AND NS.DTEMISSAO_CAD >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',NxDatePicker1.date));
    if NxDatePicker2.Text <> '' then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText
                          + ' AND NS.DTEMISSAO_CAD <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',NxDatePicker2.date));
    if Trim(Edit2.Text) <> '' then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText
                                      + ' AND ((CLI.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%') + ')'
                                      + ' OR (CLI.FANTASIA LIKE ' + QuotedStr('%'+Edit2.Text+'%') + '))';
    if chkSomenteNEnviadas.Checked then
      fDMCadNotaServico.sdsNotaServico_Consulta.CommandText := fDMCadNotaServico.sdsNotaServico_Consulta.CommandText
                        + ' AND ((NS.NUMNOTA <= 0) or ((PR.NOME = ' + QuotedStr('CAMPO BOM')
                        + ') and (CHAVE_ACESSO = '''')))';

  end;

  fDMCadNotaServico.cdsNotaServico_Consulta.Open;
end;

procedure TfrmCadNotaServico.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadNotaServico.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadNotaServico.cdsNotaServico.State in [dsBrowse]) or not(fDMCadNotaServico.cdsNotaServico.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadNotaServico.cdsNotaServico.CancelUpdates;

  prc_Habilitar_CamposNota;

  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadNotaServico.btnAlterarClick(Sender: TObject);
var
  vCodAux: String;
begin
  fDMCadNotaServico.cdsParametros.Close;
  fDMCadNotaServico.cdsParametros.Open;

  if (fDMCadNotaServico.cdsNotaServico.IsEmpty) or not(fDMCadNotaServico.cdsNotaServico.Active) or (fDMCadNotaServico.cdsNotaServicoID.AsInteger < 1) then
    exit;

  if (fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger > 0) and (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S') and
    (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') then
  begin
    MessageDlg('*** Nota já efetivada!' , mtError, [mbOk], 0);
    exit;
  end;
  if (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString = 'S') and (fDMCadNotaServico.cdsNotaServico_ConsultaSTATUS_RPS.AsString = '2') then
  begin
    MessageDlg('*** Nota está cancelada!' , mtError, [mbOk], 0);
    exit;
  end;
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') and (trim(fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.AsString) <> '') then
  begin
    MessageDlg('*** Nota já efetivada!' , mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.cdsNotaServico.Edit;

  prc_Posicionar_Cliente;

  TS_Consulta.TabEnabled := False;
  prc_Habilitar_CamposNota;

  vCodAux := RxDBLookupCombo2.Text;
end;

procedure TfrmCadNotaServico.btnConfirmarClick(Sender: TObject);
var
  vIDAux: Integer;
  cData: String;
  vAux, vAuxLim: Real;
  vTexto: String;
begin
  if (fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0) and
     (fDMCadNotaServico.cdsCondPgto.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger,([Locaseinsensitive]))) then
  begin
    if (fDMCadNotaServico.cdsCondPgtoENTRADA.AsString = 'N') then
      fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat := StrToFloat(FormatFloat('0.00',0));
  end;
  if fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger <> fDMCadNotaServico.cdsFilialID.AsInteger then
    fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,[loCaseInsensitive]);

  if fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString = 'C' then
    fDMCadNotaServico.cdsNotaServicoTIPO_ENVIO_NFSE.AsString := 'CLOUD-DFE'
  else
    fDMCadNotaServico.cdsNotaServicoTIPO_ENVIO_NFSE.Clear;

  if ((fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V') or (StrToFloat(formatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat)) > 0)) and
     (fDMCadNotaServico.cdsNotaServicoID_BANCO.AsInteger <= 0) then
  begin
    //15/11/2022
    vTexto := Monta_Numero(SQLLocate('FILIAL','ID','ID_CONTA_CAIXA',fDMCadNotaServico.cdsNotaServicoFILIAL.AsString),1);
    if vTexto <> '0' then
      fDMCadNotaServico.cdsNotaServicoID_BANCO.AsInteger := StrToInt(vTexto)
    else
      fDMCadNotaServico.cdsNotaServicoID_BANCO.Clear;
  end;
  if (fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString = 'C') then
  begin
    if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
      fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);
    if (fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString = '1') and (fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger <> fDMCadNotaServico.cdsClienteID_CIDADE.AsInteger) then
    begin
      if MessageDlg('Cidade de tributação diferente do Cliente, Confirma?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
        exit;
    end;
  end;
  if ((fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V') or (StrToFloat(formatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat)) > 0)) and
     (fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger <= 0) then
    fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger := fDMCadNotaServico.cdsParametrosID_TIPO_COBRANCA_PADRAO.AsInteger;
  if (fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V') and not(fDMCadNotaServico.cdsNotaServico_Parc.IsEmpty) then
  begin
    fDMCadNotaServico.cdsNotaServico_Parc.First;
    while not fDMCadNotaServico.cdsNotaServico_Parc.Eof do
      fDMCadNotaServico.cdsNotaServico_Parc.Delete;
  end;
  if ((fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V') or (StrToFloat(formatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat)) > 0)) and
     (fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger <= 0) then
  begin
    //15/11/2022
    vTexto := Monta_Numero(SQLLocate('FILIAL','ID','ID_CONTA_CAIXA',fDMCadNotaServico.cdsNotaServicoFILIAL.AsString),1);
    if vTexto <> '0' then
      fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger := StrToInt(vTexto)
    else
      fDMCadNotaServico.cdsNotaServicoID_CONTA.Clear;
  end;
  if ((fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V') or (StrToFloat(formatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat)) > 0)) and
     (fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger <= 0) then
    fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger := fDMCadNotaServico.cdsParametrosID_TIPO_COBRANCA_PADRAO.AsInteger;

//14/02/2018  Controlar o valor limite do crédito e alerta valores em atraso
  if (fDMCadNotaServico.cdsParametrosALERTA_VLR_ATRASO.AsString = 'S') and
     (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat)) > 0) and
     (fDMCadNotaServico.cdsParametrosUSA_LIMITE_CREDITO.AsString <> 'S') then
  begin
    vAux := fnc_Limite_Credito(fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,0,date);
    if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and (trim(fDMCadNotaServico.cdsParametrosSENHA_CREDITO.AsString) = EmptyStr) then
    begin
      if MessageDlg('Cliente possui título em atraso, confirma a nota?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
        exit;
    end
    else
    if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and (trim(fDMCadNotaServico.cdsParametrosSENHA_CREDITO.AsString) <> '') then
    begin
      if not fnc_senha('ATR','SENHA_CREDITO','R','Valor em atraso: ' + FormatFloat('###,###,##0.00',vAux),'','',0,0) then
        exit;
    end;
  end
  else
  if (fDMCadNotaServico.cdsParametrosUSA_LIMITE_CREDITO.AsString = 'S') and
     (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat)) > 0) and
     (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat)) > 0) then
  begin
    vAux    := fnc_Limite_Credito(fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,0,0);
    vAux    := StrToFloat(FormatFloat('0.00',vAux + fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat));
    vAuxLim := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat - vAux));
    if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat)) <= StrToFloat(FormatFloat('0.00',vAux)) then
    begin
      if not fnc_senha('LCR','SENHA_CREDITO','',
                       'Limite de Crédito: ' + FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat),
                       'Limite Utilizado:' + FormatFloat('###,###,##0.00',vAux),
                       'Limite Disponível ==> ' + FormatFloat('###,###,##0.00',vAuxLim),0,StrToFloat(FormatFloat('0.00',vAuxLim))) then
        exit;
    end;
  end;
  //*******************

  if fDMCadNotaServico.fnc_Possui_Erro then
  begin
    MessageDlg(fDMCadNotaServico.vMSGNotaServico, mtError, [mbOk], 0);
    exit;
  end;

  //05/04/2017
  if not fnc_Verifica_AliqISSQN then
    exit;
  //***************

  if fDMCadNotaServico.fnc_Possui_Avisos then
  begin
    if MessageDlg(fDMCadNotaServico.vMSGNotaServico +#13 + #13 + ' Gravar assim mesmo?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
      exit;
  end;

  vIDAux := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
  fDMCadNotaServico.cdsNotaServicoSTATUS_RPS.AsString  := '1';

  fDMCadNotaServico.prc_Gravar;

  prc_Consultar(vIDAux);

  prc_Gravar_Registro;

  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadNotaServico.prc_Posiciona_NotaFiscal;
begin
  fDMCadNotaServico.prc_Localizar(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
  fDMCadNotaServico.cdsNotaServico_Itens.Close;
  fDMCadNotaServico.cdsNotaServico_Itens.Open;
  vFilial      := fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger;
  vFilial_Nome := '';
  if fDMCadNotaServico.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]) then
    vFilial_Nome := fDMCadNotaServico.cdsFilialNOME_INTERNO.AsString;
  if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
    fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaServico.cdsCidadeID.AsInteger <> fDMCadNotaServico.cdsFilialID_CIDADE.AsInteger then
    fDMCadNotaServico.cdsCidade.Locate('ID',fDMCadNotaServico.cdsFilialID_CIDADE.AsInteger,[loCaseInsensitive]);
  lblNome_Filial.Caption := vFilial_Nome;
end;

function TfrmCadNotaServico.fnc_Verifica_Registro: Boolean;
begin
  Result := False;
  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) or
        (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger < 1) then
    exit;
  if fDMCadNotaServico.cdsNotaServico_ConsultaHOMOLOGACAO.AsString = 'S' then
  begin
    Result := True;
    exit;
  end;
  if Trim(fDMCadNotaServico.cdsNotaServico_ConsultaCHAVE_ACESSO.AsString) <> '' then
    exit;
  Result := True;
end;

procedure TfrmCadNotaServico.pnlClienteExit(Sender: TObject);
begin
  prc_Posicionar_Cliente;
  fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger := fDMCadNotaServico.cdsClienteID_TIPOCOBRANCA.AsInteger;
  fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger         := fDMCadNotaServico.cdsClienteID_CONTABOLETO.AsInteger;
  if trim(RxDBLookupCombo4.Text) = '' then
    fDMCadNotaServico.cdsNotaServicoID_NATUREZA.Clear;
  if (fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString = 'C') and (fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger <= 0) then
  begin
    if fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString = '1' then
      fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsClienteID_CIDADE.AsInteger
    else
      fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsFilialID_CIDADE.AsInteger;
  end
  else
  if (vID_Cliente_Ant <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger) or (vID_Natureza_Ant <> fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger) then
  begin
    if fDMCadNotaServico.qParametros_SerUSA_NATUREZA_CID_NFSE.AsString = 'S' then
    begin
      if (fDMCadNotaServico.cdsNaturezaID.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger) then
        fDMCadNotaServico.cdsNatureza.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger,[loCaseInsensitive]);
      if fDMCadNotaServico.cdsNaturezaUSA_CIDADE_CLI.AsString = 'S' then
        fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsClienteID_CIDADE.AsInteger
      else
        fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.Clear;
    end
    else
    begin
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
        fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsClienteID_CIDADE.AsInteger
      else
      if trim(fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString) = 'THEMA' then
      begin
        if fDMCadNotaServico.qParametros_SerCID_PRESTACAO_SERV.AsString = 'C' then
          fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsClienteID_CIDADE.AsInteger
        else
        if fDMCadNotaServico.qParametros_SerCID_PRESTACAO_SERV.AsString = 'F' then
          fDMCadNotaServico.cdsNotaServicoID_CIDADE_TRIB.AsInteger := fDMCadNotaServico.cdsFilialID_CIDADE.AsInteger;
      end;
    end;
  end;
end;

procedure TfrmCadNotaServico.prc_Posicionar_Cliente;
begin
  if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
    fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);
  if (fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger) then
    fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,[loCaseInsensitive]);
end;

procedure TfrmCadNotaServico.prc_Habilitar_CamposNota;
begin
  btnConfirmar.Enabled       := not(btnConfirmar.Enabled);
  btnImp_Boleto.Enabled      := not(btnImp_Boleto.Enabled);
  btnAlterar.Enabled         := not(btnAlterar.Enabled);

  DBMemo1.ReadOnly           := not(DBMemo1.ReadOnly);
  pnlCadastro.Enabled        := not(pnlCadastro.Enabled);

  SMDBGrid_Dupl2.ReadOnly    := not(SMDBGrid_Dupl2.ReadOnly);

  btnGerarParcelas.Enabled   := not(btnGerarParcelas.Enabled);
  btnExcluirParcelas.Enabled := not(btnExcluirParcelas.Enabled);

  rxdbCondicaoPgto.ReadOnly   := not(rxdbCondicaoPgto.ReadOnly);
  rxdbConta_Orcamento.ReadOnly := not(rxdbConta_Orcamento.ReadOnly);
  rxdbConta.ReadOnly          := not(rxdbConta.ReadOnly);
  rxdbTipoCobranca.ReadOnly   := not(rxdbTipoCobranca.ReadOnly);

  rxdbVendedor.ReadOnly      := not(rxdbVendedor.ReadOnly);
  dbPerc_Comissao.ReadOnly   := not(dbPerc_Comissao.ReadOnly);

  dbVlr_Entrada.ReadOnly     := not(dbVlr_Entrada.ReadOnly);

  btnInserir_Itens.Enabled   := not(btnInserir_Itens.Enabled);
  btnAlterar_Itens.Enabled   := not(btnAlterar_Itens.Enabled);
  btnExcluir_Itens.Enabled   := not(btnExcluir_Itens.Enabled);
  btnGerar_Automatico.Enabled := not(btnGerar_Automatico.Enabled);
  btnObs.Enabled             := not(btnObs.Enabled);
  pnlValores.Enabled         := not(pnlValores.Enabled);
  pnlEnvio.Visible           := not(pnlEnvio.Visible);
  Panel3.Enabled             := not(Panel3.Enabled);
  btnRecalcular.Enabled      := not(btnRecalcular.Enabled);
  DBEdit43.Visible           := False;

  btnInserir_Obra.Enabled   := not(btnInserir_Obra.Enabled);
  btnConfirmar_Obra.Enabled := not(btnConfirmar_Obra.Enabled);
  btnCancelar_Obra.Enabled  := not(btnCancelar_Obra.Enabled);
  btnExcluir_Obra.Enabled   := not(btnExcluir_Obra.Enabled);
end;

function TfrmCadNotaServico.fnc_Cancelar: Boolean;
begin
  Result := True;
  fDMCadNotaServico.vMSGNotaServico := '';
  if (fDMCadNotaServico.cdsNotaServico.IsEmpty) or (fDMCadNotaServico.cdsNotaServicoID.AsInteger < 1) then
    fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + '*** Não existe nota selecionada!';
  if trim(fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.AsString) = '' then
    fDMCadNotaServico.vMsgErroParc := fDMCadNotaServico.vMSGNotaServico + '*** Nota Fiscal sem a chave de acesso!';

  if trim(fDMCadNotaServico.vMSGNotaServico) <> '' then
    Result := False;
end;

procedure TfrmCadNotaServico.SpeedButton1Click(Sender: TObject);
begin
  fDMCadNotaServico.cdsCliente.Close;
  fDMCadNotaServico.cdsCliente.Open;
end;

procedure TfrmCadNotaServico.SpeedButton6Click(Sender: TObject);
begin
  fDMCadNotaServico.cdsCondPgto.Close;
  fDMCadNotaServico.cdsCondPgto.Open;
end;

procedure TfrmCadNotaServico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadNotaServico.cdsNotaServico);
end;

procedure TfrmCadNotaServico.edtSerieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadNotaServico.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadNotaServico.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadNotaServico.RxDBLookupCombo3Exit(Sender: TObject);
var
  vAux: Real;
begin
  if trim(RxDBLookupCombo3.Text) = '' then
    exit;

  if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> RxDBLookupCombo3.KeyValue then
    fDMCadNotaServico.cdsCliente.Locate('CODIGO',RxDBLookupCombo3.KeyValue,[loCaseInsensitive]);

  prc_Verifica_Limite(fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,
                      fDMCadNotaServico.cdsNotaServicoID.AsInteger,
                      fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat);

  if (fDMCadNotaServico.cdsNotaServico.State in [dsInsert]) or (fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger <> vID_Cliente_Ant) then
  begin
    if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger then
      fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,[loCaseInsensitive]);

    if fDMCadNotaServico.cdsClienteID_TIPOCOBRANCA.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_TIPO_COBRANCA.AsInteger := fDMCadNotaServico.cdsClienteID_TIPOCOBRANCA.AsInteger;
    if fDMCadNotaServico.cdsClienteID_CONTABOLETO.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger := fDMCadNotaServico.cdsClienteID_CONTABOLETO.AsInteger;
    if fDMCadNotaServico.cdsClienteID_SERVICO.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger := fDMCadNotaServico.cdsClienteID_SERVICO.AsInteger;
    if not(fDMCadNotaServico.cdsClienteRETEM_ISS.IsNull) then
      fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString := fDMCadNotaServico.cdsClienteRETEM_ISS.AsString;
    if not(fDMCadNotaServico.cdsClienteRETEM_CSLL.IsNull) then
      fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString := fDMCadNotaServico.cdsClienteRETEM_CSLL.AsString;
    if not(fDMCadNotaServico.cdsClienteRETEM_INSS.IsNull) then
      fDMCadNotaServico.cdsNotaServicoRETEM_INSS.AsString := fDMCadNotaServico.cdsClienteRETEM_INSS.AsString;
    if not(fDMCadNotaServico.cdsClienteRETEM_PISCOFINS.IsNull) then
      fDMCadNotaServico.cdsNotaServicoRETEM_PISCOFINS.AsString := fDMCadNotaServico.cdsClienteRETEM_PISCOFINS.AsString;
    if fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString <> 'C' then
    begin
      if fDMCadNotaServico.cdsClienteID_NATUREZA.AsInteger > 0 then
        fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger := fDMCadNotaServico.cdsClienteID_NATUREZA.AsInteger
      else
      if fDMCadNotaServico.cdsFilialID_NATUREZA.AsInteger > 0 then
        fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger := fDMCadNotaServico.cdsFilialID_NATUREZA.AsInteger;
    end;
    fDMCadNotaServico.cdsNotaServicoDIMINUIR_RETENCAO.AsString := fDMCadNotaServico.cdsClienteDIMINUIR_RETENCAO.AsString;
    fDMCadNotaServico.cdsNotaServicoPERC_REDUCAO_INSS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClientePERC_REDUCAO_INSS.AsFloat));
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_INSS.AsFloat)) > 0) and
       (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClientePERC_REDUCAO_INSS.AsFloat)) > 0) then
    begin
      fDMCadNotaServico.cdsNotaServicoPERC_INSS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_INSS.AsFloat));
    end;
    if fDMCadNotaServico.cdsClienteCLIENTE_CONTA_ID.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger := fDMCadNotaServico.cdsClienteCLIENTE_CONTA_ID.AsInteger
    else
    if fDMCadNotaServico.cdsParametrosID_CONTA_ORC_SERVICO.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger := fDMCadNotaServico.cdsParametrosID_CONTA_ORC_SERVICO.AsInteger;
    //Vendedor
    if fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S' then
    begin
      if fDMCadNotaServico.cdsClienteID_VENDEDOR.AsInteger > 0 then
        fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger := fDMCadNotaServico.cdsClienteID_VENDEDOR.AsInteger;
      if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClientePERC_COMISSAO.AsFloat)) > 0 then
        fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsClientePERC_COMISSAO.AsFloat))
      else
      if (fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger > 0) and
         (fDMCadNotaServico.cdsVendedor.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger,[loCaseInsensitive])) then
      begin
        if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsVendedorPERC_COMISSAO_VEND.AsFloat)) > 0 then
          fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsVendedorPERC_COMISSAO_VEND.AsFloat));
      end;
    end;
  end;
  //*******
  //01/06/2022
  fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString := fDMCadNotaServico.cdsNotaServicoRETEM_PISCOFINS.AsString;
  prc_Calcula_FatMensal;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger := uUtilForm.fnc_Chamar_Form_SelPessoa('C',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,'');
end;

procedure TfrmCadNotaServico.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadNotaServico.cdsNotaServico_Consulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadNotaServico.rxdbCondicaoPgtoChange(Sender: TObject);
begin
  if ((fDMCadNotaServico.cdsNotaServicoNUM_CONTRATO.AsInteger <= 0) or
     (fDMCadNotaServico.cdsNotaServicoNUM_CONTRATO.IsNull)) or
     (vCodPagamento <> rxdbCondicaoPgto.KeyValue) then
  begin
    prc_Opcao_Prazo;
    if fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert] then
      btnGerarParcelasClick(Sender);
  end;
end;

procedure TfrmCadNotaServico.prc_Opcao_Prazo;
var
  vMostrarAux: String;
begin
  vMostrarAux := 'N';
  if rxdbCondicaoPgto.Text <> '' then
  begin
    if fDMCadNotaServico.cdsCondPgto.Locate('ID',rxdbCondicaoPgto.KeyValue,[loCaseInsensitive]) then
      vMostrarAux := fDMCadNotaServico.cdsCondPgtoTIPO.AsString;
  end;
  btnGerarParcelas.Visible   := (vMostrarAux = 'P');
  btnExcluirParcelas.Visible := (vMostrarAux = 'P');

  Label62.Visible            := ((vMostrarAux = 'P') and (fDMCadNotaServico.cdsCondPgtoENTRADA.AsString = 'S'));
  dbVlr_Entrada.Visible      := ((vMostrarAux = 'P') and (fDMCadNotaServico.cdsCondPgtoENTRADA.AsString = 'S'));

  SMDBGrid_Dupl2.Visible     := (vMostrarAux = 'P');
  if fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert] then
  begin
    fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString := vMostrarAux;
    if vMostrarAux = 'P' then
      rxcbTipo_Prazo.ItemIndex := 0
    else
    if vMostrarAux = 'V' then
      rxcbTipo_Prazo.ItemIndex := 1
    else
    if vMostrarAux = 'N' then
      rxcbTipo_Prazo.ItemIndex := 2;
  end;
  rxdbTipoCobranca.Visible    := (fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0);
  rxdbConta.Visible           := (fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0);
  rxdbConta_Orcamento.Visible := ((fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0) and (fDMCadNotaServico.cdsParametrosUSA_CONTA_ORCAMENTO.AsString = 'S'));
  Label74.Visible             := (fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0);
  Label75.Visible             := (fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0);
  Label44.Visible             := ((fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger > 0) and (fDMCadNotaServico.cdsParametrosUSA_CONTA_ORCAMENTO.AsString = 'S'));
end;

procedure TfrmCadNotaServico.ZerarDuplicata1Click(Sender: TObject);
begin
  if not (fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) then
    exit;
  SMDBGrid2.DisableScroll;
  fDMCadNotaServico.prc_Le_Itens('Z');
  SMDBGrid2.EnableScroll;
end;

procedure TfrmCadNotaServico.GerarVlrDuplicata1Click(Sender: TObject);
begin
  if not (fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) then
    exit;
  SMDBGrid2.DisableScroll;
  fDMCadNotaServico.prc_Le_Itens('G');
  SMDBGrid2.EnableScroll;
end;

procedure TfrmCadNotaServico.btnImp_BoletoClick(Sender: TObject);
begin
  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) or
    (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger <= 0) then
  begin
    MessageDlg('*** Não existe nota selecionada', mtError, [mbOk], 0);
    exit;
  end;

  prc_Posiciona_NotaFiscal;
  vTipo_Config_Email := 3;

  if (fDMCadNotaServico.cdsNotaServico.IsEmpty) or (fDMCadNotaServico.cdsNotaServicoID.AsInteger < 1) then
  begin
    MessageDlg('*** Nota selecionada não encontrada na base', mtError, [mbOk], 0);
    exit;
  end;

  vEmail_Fortes := fDMCadNotaServico.cdsClienteEMAIL_PGTO.AsString;

  if fDMCadNotaServico.cdsParametrosUSA_BOLETO_ACBR.AsString = 'S' then
    prc_Chama_CobRemessa(0,fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,
                           fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,
                           fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger,
                           fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsString);
end;

procedure TfrmCadNotaServico.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty)  then
    exit;
  if fDMCadNotaServico.cdsNotaServico_ConsultaSTATUS_RPS.AsString = '2' then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if fDMCadNotaServico.cdsNotaServico_ConsultaNOME_PROVEDOR.AsString = 'CAMPO BOM' then
  begin
    if (fDMCadNotaServico.cdsNotaServico_ConsultaCHAVE_ACESSO.AsString = '') then
    begin
      //Background := clYellow
      Background  := $0084FFFF;
      AFont.Color := clWindowText;
    end
    else
    if (fDMCadNotaServico.cdsNotaServico_ConsultaEMAIL_ENVIADO.AsString = 'N') then
      Background := $00C9C9C9;
  end
  else
  if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger <= 0) then
  begin
    if fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger <= 0 then
    begin
      Background  := $0084FFFF;
      AFont.Color := clBlack;
    end
    else
    if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger <= 0) and (trim(fDMCadNotaServico.cdsNotaServico_ConsultaPROTOCOLO.AsString) <> '') then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end
    else
    if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger <= 0) and (fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger > 0) then
    begin
      //Background := clMoneyGreen;
      Background  := clMaroon;
      AFont.Color := clWhite;
    end;
  end
  else
  if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger > 0) and (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S') and (fDMCadNotaServico.cdsNotaServico_ConsultaEMAIL_ENVIADO.AsString = 'N') then
      Background := $00C9C9C9;
end;

procedure TfrmCadNotaServico.SMDBGrid1DblClick(Sender: TObject);
begin
  prc_Posiciona_NotaFiscal;
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadNotaServico.btnInserir_ItensClick(Sender: TObject);
begin
  if fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString = 'S' then
    if fDMCadNotaServico.cdsNotaServico_Itens.RecordCount > 3 then
    begin
      ShowMessage('Limitado a 4 serviços por nota!');
      Exit;
    end;
  fDMCadNotaServico.prc_Inserir_Itens;

  if (fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger > 0) then
  begin
    if (fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger <> fDMCadNotaServico.cdsNaturezaID.AsInteger) then
      fDMCadNotaServico.cdsNatureza.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger,[loCaseInsensitive]);
    //11/05/2022
    //if fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString = 'S' then
    if (fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString = 'S') or ((trim(fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString) = '')
      and (fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString = 'S')) then
      fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_ISSQN.AsString := 'N';
  end;

  fDMCadNotaServico.vVlrTotal_NFSe          := 0;
  fDMCadNotaServico.vVlrLiquido_NFse        := 0;
  fDMCadNotaServico.vSomar_Diminuir_Ant     := '';
  fDMCadNotaServico.vCalcular_INSS_Ant      := '';
  fDMCadNotaServico.vCalcular_ISSQN_Ant     := '';
  fDMCadNotaServico.vCalcular_PisCofins_Ant := '';
  fDMCadNotaServico.vCalcular_CSLL_Ant      := '';
  fDMCadNotaServico.vCalcular_IR_Ant        := '';

  ffrmCadNotaServico_Itens := TfrmCadNotaServico_Itens.Create(self);
  ffrmCadNotaServico_Itens.fDMCadNotaServico := fDMCadNotaServico;
  ffrmCadNotaServico_Itens.ShowModal;
  FreeAndNil(ffrmCadNotaServico_Itens);
  btnRecalcularClick(Sender);
end;

procedure TfrmCadNotaServico.btnAlterar_ItensClick(Sender: TObject);
begin
  if (fDMCadNotaServico.cdsNotaServico_Itens.IsEmpty) or (fDMCadNotaServico.cdsNotaServico_ItensITEM.AsInteger <= 0) then
    exit;

  fDMCadNotaServico.cdsNotaServico_Itens.Edit;

  fDMCadNotaServico.vVlrTotal_NFSe      := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat));
  fDMCadNotaServico.vVlrLiquido_NFse    := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ItensVLR_LIQUIDO_NFSE.AsFloat));
  fDMCadNotaServico.vSomar_Diminuir_Ant := fDMCadNotaServico.cdsNotaServico_ItensSOMAR_DIMINUIR.AsString;
  fDMCadNotaServico.vCalcular_INSS_Ant  := fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_INSS.AsString;
  fDMCadNotaServico.vCalcular_ISSQN_Ant := fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_ISSQN.AsString;
  fDMCadNotaServico.vCalcular_PisCofins_Ant := fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_PISCOFINS.AsString;
  fDMCadNotaServico.vCalcular_CSLL_Ant  := fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_CSLL.AsString;
  fDMCadNotaServico.vCalcular_IR_Ant    := fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_IR.AsString;

  ffrmCadNotaServico_Itens := TfrmCadNotaServico_Itens.Create(self);
  ffrmCadNotaServico_Itens.fDMCadNotaServico := fDMCadNotaServico;
  ffrmCadNotaServico_Itens.ShowModal;
  FreeAndNil(ffrmCadNotaServico_Itens);

  btnRecalcularClick(Sender);
end;

procedure TfrmCadNotaServico.btnExcluir_ItensClick(Sender: TObject);
begin
  if not(fDMCadNotaServico.cdsNotaServico_Itens.Active) and
    (fDMCadNotaServico.cdsNotaServico_Itens.IsEmpty) or
    (fDMCadNotaServico.cdsNotaServico_ItensITEM.AsInteger < 1) then
    exit;

  if MessageDlg('Deseja excluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadNotaServico.prc_Excluir_Item;
  btnRecalcularClick(Sender);
end;

function TfrmCadNotaServico.GerarNFSeTXT(AIndice: Integer): String;

  function LPad(ATxt, AVlr: string; ATam: Integer): string;
  var
    I: Integer;
  begin
    Result := Atxt;
    for I := 0 to ATam - 1 - Length(ATxt) do
      Result := AVlr + Result;
  end;

  function RPad(ATxt, AVlr: string; ATam: Integer): string;
  var
    I: Integer;
  begin
    Result := Atxt;
    for I := 0 to ATam - 1 - Length(ATxt) do
      Result := Result + AVlr;
  end;

var
  cMunicipio: String;
  cNroLote: String;
  cData: String;
  cCNPJ: String;
  I: Integer;
  vTexto1: String;
  vVlrAux: Real;
  vDiscriminacao: WideString;
  cTXT: TStringList;
  cDiscriminacao: TStringList;
  cTXTDisc: TStringStream;
  vVlrIRAux: Real;
  vPercAux: Real;
  vPercAux_Estadual, vPercAux_Federal, vPercAux_Municipal :Real;
  vTexto: String;
begin
  if (fDMCadNotaServico.cdsNotaServico_ImpHOMOLOGACAO.AsString = 'S') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET') then
    cMunicipio := '999    '
  else
  begin
    if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET') then
    begin
      if fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString = '2' then
        cMunicipio := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_CLI.AsString,7)
      else
        cMunicipio := Formatar_Campo(fDMCadNotaServico.cdsFilialCODMUNICIPIO.AsString,7)
    end
    else
    begin
      if (fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString = '2') or (fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString = '5') or
         (fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString = '6') then
        cMunicipio := Formatar_Campo(fDMCadNotaServico.cdsFilialCODMUNICIPIO.AsString,7)
      else
        cMunicipio := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_CLI.AsString,7);
    end;
  end;
  cNroLote := fDMCadNotaServico.cdsNotaServico_ImpNUMRPS.Text;
  cNroLote := LPad(cNroLote, '0', 15);
  cData    := FormatDateTime('yyyy-mm-dd"T"hh:mm:ss',Now);
  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    cCNPJ := Monta_Numero(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    cCNPJ := Monta_Numero(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);
  cTXT := TStringList.Create;
  cTXT := TStringList.Create;
  try
    // IdentificacaoRps.Número
    cTXT.Add(cNroLote);
    //IdentificacaoRps.Serie
    if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET' then
      vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString,5)
    else
      vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString, 5);
    cTXT.Add(vTexto1);
    // IdentificacaoRps.Tipo
    cTXT.Add(fDMCadNotaServico.cdsNotaServico_ImpTIPO_RPS.AsString);
    // DataEmissao
    cTXT.Add(cData);
    // NaturezaOperacao
    //28/08/2023
    //vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString,1);
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCOD_NATUREZA.AsString,1);
    cTXT.Add(vTexto1);
    // RegimeEspecialTributacao
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsFilialCOD_REGIME_TIB_ESP.AsString,1);
    cTXT.Add(vTexto1);
    // OptanteSimplesNacional
    if fDMCadNotaServico.cdsFilialSIMPLES.AsString = 'S' then
      vTexto1 := '1'
    else
      vTexto1 := '2';
    cTXT.Add(vTexto1);
    // IncentivoCultural
    if fDMCadNotaServico.cdsFilialINCENTIVO_CULTURAL.AsString = 'S' then
      vTexto1 := '1'
    else
      vTexto1 := '2';
    cTXT.Add(vTexto1);
    // Status  1=Normal  2=Cancelado
    cTXT.Add(fDMCadNotaServico.cdsNotaServico_ImpSTATUS_RPS.AsString);

    // RpsSubstituido  Número
    if fDMCadNotaServico.cdsNotaServico_ImpNUMRPS_SUBSTITUIDO.AsInteger <= 0 then
      vTexto1 := ''
    else
      vTexto1 := fDMCadNotaServico.cdsNotaServico_ImpNUMRPS_SUBSTITUIDO.AsString;
    vTexto1 := Formatar_Campo(vTexto1,15);
    cTxt.Add(vTexto1);
    // RpsSubstituido  Série
    if fDMCadNotaServico.cdsNotaServico_ImpNUMRPS_SUBSTITUIDO.AsInteger <= 0 then
      vTexto1 := Formatar_Campo('',5)
    else
    if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET' then
      vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpSERIE_SUBSTITUIDO.AsString,5)
    else
      vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpSERIE_SUBSTITUIDO.AsString,5);
    cTxt.Add(vTexto1);
    // RpsSubstituido  Tipo
    cTxt.Add(Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpTIPO_SUBSTITUIDO.AsString,1));
    // ValorServicos
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_SERVICOS.AsFloat),15));
    // ValorDeducoes
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_DEDUCOES.AsFloat),15));
    // ValorPis
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_PIS.AsFloat),15));
    // ValorCofins
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_COFINS.AsFloat),15));
    // ValorInss
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_INSS.AsFloat),15));
    // ValorIR
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat),15));
    // ValorCsll
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_CSLL.AsFloat),15));
    // IssRetido
    cTxt.Add(Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpISS_RETIDO.AsString,1));
    // ValorIss
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS.AsFloat),15));
    // ValorIssRetido
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat),15));
    // OutrasRetencoes
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_OUTRAS_RETENCOES.AsFloat),15));
    // BaseCalculo
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpBASE_CALCULO.AsFloat),15));
    // Aliquota
    vVlrAux := fDMCadNotaServico.cdsNotaServico_ImpPERC_ALIQUOTA.AsFloat;
    if fDMCadNotaServico.cdsFilialMOSTRAR_ALIQUOTA_PD.AsString = 'P' then
      vVlrAux := vVlrAux * 10000
    else
      vVlrAux := vVlrAux * 100;
    vTexto1 := Monta_Numero(FormatFloat('0',vVlrAux),5);
    cTxt.Add(vTexto1);
    // ValorLiquidoNfse
    if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET' then
      cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat),15))
    else
      cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_LIQUIDO_NFSE.AsFloat),15));
    // DescontoIncondicionado
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_DESCONTO_INC.AsFloat),15));
    // DescontoCondicionado
    cTxt.Add(Monta_Numero(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_DESCONTO_COND.AsFloat),15));
    // ItemListaServico
    if (fDMCadNotaServico.cdsFilialINF_COD_SERVICO.AsString = 'N') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET')  then
    begin
      vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCOD_SERVICO.AsString,0);
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET' then
        vTexto1 := Formatar_Campo(vTexto1,4)
      else
        vTexto1 := Formatar_Campo(vTexto1,5);
    end
    else
      vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCOD_SERVICO.AsString,5);
    cTxt.Add(vTexto1);
    // CodigoCnae
    if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET')  then
    begin
      if trim(fDMCadNotaServico.cdsNotaServico_ImpCNAE_NFSE.AsString) <> '' then
      begin
        vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCNAE_NFSE.AsString,8);
      end
      else
        vTexto1 := Monta_Numero('0',8);
    end
    else
    begin
      if trim(fDMCadNotaServico.cdsNotaServico_ImpCNAE_NFSE.AsString) <> '' then
        vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCNAE_NFSE.AsString,7)
      else
        vTexto1 := Monta_Numero('0',7);
    end;
    cTxt.Add(vTexto1);
    // CodigoTributacaoMunicipio
    if trim(fDMCadNotaServico.cdsNotaServico_ImpCOD_ATIVIDADE_CID.AsString) <> '' then
      vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCOD_ATIVIDADE_CID.AsString,20)
    else
      vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsFilialCOD_TRIBUTACAO_MUNICIPIO.AsString,20);
    cTxt.Add(vTexto1);
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

    if (fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger > 0) and
       (fDMCadNotaServico.cdsTipoCobranca.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger,[loCaseInsensitive])) then
    begin
      if (fDMCadNotaServico.cdsTipoCobrancaDEPOSITO.AsString = 'S') and
         (fDMCadNotaServico.cdsContas.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONTA.AsInteger,[loCaseInsensitive])) then
      begin
        {fDMCadNotaServico.qContas.Close;
        fDMCadNotaServico.qContas.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServicoID_CONTA.AsInteger;
        fDMCadNotaServico.qContas.Open;

        if trim(fDMCadNotaServico.qContasNOME_BANCO.AsString) <> '' then
          vTexto := fDMCadNotaServico.qContasNOME_BANCO.AsString
        else
        if trim(fDMCadNotaServico.qContasDESCRICAO_NOTA.AsString) <> '' then
          vTexto := fDMCadNotaServico.qContasDESCRICAO_NOTA.AsString
        else
          vTexto := fDMCadNotaServico.qContasNOME.AsString;
        vAgeAux := fDMCadNotaServico.qContasAGENCIA.AsString;
        if (trim(fDMCadNotaServico.qContasDIG_AGENCIA.AsString) <> '') and (fDMCadNotaServico.qContasIMP_DIG_AGENCIA_DEP.AsString = 'S') then
          vAgeAux := vAgeAux + '-' + fDMCadNotaServico.qContasDIG_AGENCIA.AsString;
        vContaAux := fDMCadNotaServico.qContasNUMCONTA.AsString;
        if trim(fDMCadNotaServico.qContasDIG_CONTA.AsString) <> '' then
          vContaAux := vContaAux + '-' + fDMCadNotaServico.qContasDIG_CONTA.AsString;
        vTexto1 := '(Deposito: ' + vTexto + '  Age: ' + vAgeAux + ', Conta: ' + vContaAux
                + ')';}

        {vTexto1 := '(Deposito: Ag.: ' + fDMCadNotaServico.cdsContasAGENCIA.AsString + '-' + fDMCadNotaServico.cdsContasDIG_AGENCIA.AsString +
                   ', Conta: ' + fDMCadNotaServico.cdsContasNUMCONTA.AsString + '-' + fDMCadNotaServico.cdsContasDIG_CONTA.AsString +
                   ', ' + fDMCadNotaServico.cdsContasNOME.AsString + ')';}
        //vDiscriminacao := vDiscriminacao + vTexto1;
        vDiscriminacao := vDiscriminacao + fDMCadNotaServico.fnc_Monta_Obs_Deposito;
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
    //**************************

    vDiscriminacao := Formatar_Campo(vDiscriminacao,2000);
    cTxt.Add(vDiscriminacao);
    // CodigoMunicipio
    cTxt.Add(cMunicipio);
    // Prestador.Cnpj
    cTxt.Add(cCNPJ);
    // Prestador.InscricaoMunicipal
    if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'THEMA' then
      cTxt.Add(LPad('', ' ' , 15))
    else
      cTxt.Add(LPad(fDMCadNotaServico.cdsFilialINSCMUNICIPAL.AsString , ' ' , 15));
    // IdentificacaoTomado.Cpf
     if fDMCadNotaServico.cdsNotaServico_ImpPESSOA_CLI.AsString = 'F' then
     begin
       vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,11);
       cTxt.Add(vTexto1);
       vTexto1 := Formatar_Campo('',14);
       cTxt.Add(vTexto1);
     end
     else
     begin
       vTexto1 := Formatar_Campo('',11);
       cTxt.Add(vTexto1);
       vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,14);
       cTxt.Add(vTexto1);
     end;
    // IdentificacaoTomado.InscricaoMunicipal
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpINSC_MUNICIPAL_CLI.AsString,15);
    cTxt.Add(vTexto1);
    // Tomador.RazaoSocial
    vTexto1 := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpNOME_CLIENTE.AsString);
    vTexto1 := Formatar_Campo(vTexto1,115);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.Endereco
    vTexto1 := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpENDERECO_CLI.AsString);
    vTexto1 := Formatar_Campo(vTexto1,125);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.Numero
    vTexto1 := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpNUM_END_CLI.AsString);
    vTexto1 := Formatar_Campo(COPY(vTexto1,1,10),10);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.Complemento
    vTexto1 := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END.AsString);
    vTexto1 := Formatar_Campo(vTexto1,60);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.Bairro
    vTexto1 := TirarAcento(fDMCadNotaServico.cdsNotaServico_ImpBAIRRO_CLI.AsString);
     vTexto1 := Formatar_Campo(vTexto1,60);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.CodigoMunicipio
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCODMUNICIPIO_CLI.AsString,7);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.UF
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpUF_CLI.AsString,2);
    cTxt.Add(vTexto1);
    // Tomador.Endereco.CEP
    vTexto1 := Monta_Numero(fDMCadNotaServico.cdsNotaServico_ImpCEP_CLI.AsString,8);
    cTxt.Add(vTexto1);
    // Tomador.Contato.Telefone
    vTexto1 := fDMCadNotaServico.cdsNotaServico_ImpDDD_CLI.AsString + fDMCadNotaServico.cdsNotaServico_ImpFONE_CLI.AsString;
    vTexto1 := copy(vTexto1,1,11);
    vTexto1 := Monta_Numero(vTexto1,11);
    cTxt.Add(vTexto1);
    // Tomador.Contato.Email
    vTexto1 := Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpEMAIL_CLI.AsString,80);
    cTxt.Add(vTexto1);
    // IntermediarioServico
    vTexto1 := Formatar_Campo('',155);
    cTxt.Add(vTexto1);
    // ConstrucaoCivil.CodigoObra
    vTexto1 := Formatar_Campo('',15);
    cTxt.Add(vTexto1);
    // ConstrucaoCivil.Art
    vTexto1 := Formatar_Campo('',15);
    cTxt.Add(vTexto1);
    // Remove as quebras de linhas
    Result := EmptyStr;
    for I := 0 to cTXT.Count - 1 do
      Result := Result + cTXT[I];
  finally
    FreeAndNil(cTXT);
  end;
end;

procedure TfrmCadNotaServico.btnEnviar_NFSeClick(Sender: TObject);
var
  cTXT: TStringStream;
  vCnpjAux: String;
  cNota: String;
  vTexto1: WideString;
  i: Integer;
  vNumLoteAnt: Integer;
  vProcesso: Integer;
  vFlag: Boolean;
  vTexto: String;
  dtUltimo_Acesso: TDateTime;
  vIDAnt: Integer;
begin
  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) and (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger <= 0) then
    exit;

  //06/04/2016
  dmDatabase.sqEmpresa.Close;
  dmDatabase.sqEmpresa.Open;
  if not fDMCadNotaServico.cdsServico.Active then
    fDMCadNotaServico.prc_Abrir_Servico;

  if trim(RxDBLookupCombo1.Text) <> '' then
    fDMCadNotaServico.cdsFilial.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])
  else
    fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger,[loCaseInsensitive]);
  if trim(fDMCadNotaServico.cdsFilialINSCMUNICIPAL.AsString) = '' then
  begin
    MessageDlg('*** Filial sem inscrição municipal!', mtError, [mbOk], 0);
    exit;
  end;
  vIDAnt := 0;

  if vEnvioACBR then
  begin
    fDMNFSe    := TdmNFSe.Create(Self);
    fDMNFSe.fDMCadNotaServico := fDMCadNotaServico;
    fDMNFSe.ConfigurarComponente;
    vIDAnt := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  end;

  cTXTStream := TMemoryStream.Create;
  cXMLStream := TMemoryStream.Create;

  try
    vNumLote_NFSe   := 0;
    vNumLoteAnt     := 0;
    vProtocolo_Ret  := '';
    vProtocolo_Ret2 := '';
    cNota           := '';
    vFilial_Sel     := 0;
    vFlag           := False;
    fDMCadNotaServico.cdsNotaServico_Consulta.First;
    while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        if (fnc_Existe_Nota) then
        begin

//        prc_Posiciona_NotaFiscal;
          if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger then
            fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger,[loCaseInsensitive]);

          vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger;
          if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger > 0) then
          begin
            vNumLote_NFSe := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger;
            if (vNumLoteAnt > 0) and (vNumLoteAnt <> vNumLote_NFSe) then
              vNumLoteAnt := -99
            else
              vNumLoteAnt := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger;
          end;
          if trim(fDMCadNotaServico.cdsNotaServico_ConsultaPROTOCOLO.AsString) <> '' then
            vProtocolo_Ret := fDMCadNotaServico.cdsNotaServico_ConsultaPROTOCOLO.AsString;

          //25/03/2019
          if vEnvioACBR then
          begin
//          fDMNFSe.fDMCadNotaServico := fDMCadNotaServico;
            fDMNFSe.prc_Abrir_NotaServico_Comunicacao(fDMCadNotaServico.cdsNotaServicoID.AsInteger);
            fdmNFSe.Enviar_Nfse;
          end
          else
          begin
            //aqui 19/11/2014 Campo Bom
            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
            begin
              if not vFlag then
              begin
                vFlag := True;
                uXMLNFSe_CampoBom.prc_Inicio(fDMCadNotaServico);
              end;
              uXMLNFSe_CampoBom.prc_Gravar_XML(fDMCadNotaServico);
            end
            //aqui 11/03/2015 Porto Alegre
            else
            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
            begin
              if not vFlag then
              begin
                vFlag := True;
                uXMLNFSe_PortoAlegre.prc_Inicio_Envio(fDMCadNotaServico);
              end;
              uXMLNFSe_PortoAlegre.prc_Gravar_XML(fDMCadNotaServico);
            end
            else
            if trim(cNota) <> '' then
              cNota := cNota + #13;
            cNota := cNota + GerarNFSeTXT(0);
          end;
        end;
      end;
      fDMCadNotaServico.cdsNotaServico_Consulta.Next;
    end;

    if (vFlag) and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') then
    begin
      uXMLNFSe_CampoBom.prc_Finaliza(fDMCadNotaServico, cTXTStream);
    end;
    if (vFlag) and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') then
    begin

      uXMLNFSe_PortoAlegre.prc_Finaliza(fDMCadNotaServico, cTXTStream);
    end;
    if CheckBox1.Checked then
      cTXTStream.SaveToFile('C:\a\teste2.xml');

    if vNumLoteAnt = -99 then
      raise Exception.Create('*** Foram selecionados lotes diferentes para a mesma remessa, selecione novamente e faça o envio!');
    if not (vEnvioACBR) then
    begin
      if trim(vProtocolo_Ret) <> '' then
      begin
        vProcesso_OK := False;
        i := 0;
        while i < 5 do
        begin
          btnConsultar_NFSeClick(Sender);
          if vProcesso_OK then
            i := 10;
         i := i + 1;
        end;
        if vProcesso_OK then
        begin
          //raise Exception.Create('*** Processo de envio e retorno concluído!')
          MessageDlg('*** Processo de envio e retorno concluído!', mtConfirmation, [mbOk], 0);
          exit;
        end
        else
          raise Exception.Create('*** Nota já contém um protocolo, mas não está validada ' +#13 +
                                      'Aguarde e tente efetuar consulta mais tarde.' + #13 +
                                      'Para fazer o reenvio é necessário apagar o protocolo!');
      end;
      if trim(cNota) = '' then
        MessageDlg('*** Nenhuma nota foi selecionada para o envio!', mtError, [mbOk], 0)
      else
      begin
        if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'PORTO ALEGRE') then
        begin
          cTXT := TStringStream.Create(cNota);
          try
            cTXT.Position := 0;
            cTXTStream.CopyFrom(cTXT, cTXT.Size);
          finally
            FreeAndNil(cTXT);
          end;
        end;

        if (vFilial_Sel > 0) and (fDMCadNotaServico.cdsFilialID.AsInteger <> vFilial_Sel) then
          fDMCadNotaServico.cdsFilial.Locate('ID',vFilial_Sel,[loCaseInsensitive]);

        cTXTStream.Position := 0;
        if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
          vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
        else
          vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

        vRetorno           := '';
        vProtocolo_Ret     := '';
        vLote_Ret          := '';
        vDtRecebimento_Ret := '';
        //porto
        if (vNumLote_NFSe <= 0) and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') then
          vNumLote_NFSe := fDMCadNotaServico.fnc_Buscar_NumLote(fDMCadNotaServico.cdsFilialID.AsInteger);
        if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
          vNumLote_NFSe := 0;

        if CheckBox1.Checked then
          cTXTStream.SaveToFile('C:\a\teste1.xml');


        try
          vProcesso := 0;
          if CheckBox1.Checked then
            cTXTStream.SaveToFile('c:\a\teste222.xml');
          vRetorno  := NFSe_EnviarLote(fnc_LocalServidorNFe,
                                       vCnpjAux,
                                       IntToStr(vNumLote_NFSe),
                                       cTXTStream,
                                       cXMLStream );
          cXMLStream.Position := 0;
          prc_Montar_Protocolo;
          vProcesso := 1;
          if (vProtocolo_Ret <> '') or (vLote_Ret <> '') then
          begin

            prc_Gravar_Notas;
            //aqui eu ia colocar sleep

            btnConsultar_NFSeClick(Sender);
          end;

        except
          on E: exception do
          begin
            raise Exception.Create('Erro no envio: ' + E.Message);
          end;
        end;
      end;
    end;

    //mmoNFSeRetorno.Lines.LoadFromStream(cXMLStream);
  finally
    if not (vEnvioACBR) then
    begin
      if vProcesso < 1 then
      begin
        prc_Montar_Protocolo;
        if (vProtocolo_Ret <> '') or (vLote_Ret <> '') then
          prc_Gravar_Notas;
      end;
    end;

    FreeAndNil(cXMLStream);
    FreeAndNil(cTXTStream);
    FreeAndNil(cTXT);
    if vEnvioACBR then
    begin
      FreeAndNil(fDMNFSe);
      prc_Consultar(0);
      fDMCadNotaServico.cdsNotaServico_Consulta.Locate('ID',vIDAnt,[loCaseInsensitive]);
    end;
  end;
end;

function TfrmCadNotaServico.fnc_Existe_Nota: Boolean;
var
  vID: Integer;
begin
  Result := False;
  if fDMCadNotaServico.cdsNotaServico.State in [dsEdit, dsInsert] then
    exit;
  if RzPageControl1.ActivePage = TS_Cadastro then
  begin
    if not(fDMCadNotaServico.cdsNotaServico.Active) or (fDMCadNotaServico.cdsNotaServicoID.AsInteger <= 0) then
      exit;
    vID := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
  end
  else
  begin
    if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger <= 0) then
      exit;
    vID := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  end;

  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp
                                                    + ' WHERE NS.ID = ' + IntToStr(vID);
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  if not fDMCadNotaServico.cdsNotaServico_Imp.IsEmpty then
    Result := True;
  if trim(fDMCadNotaServico.cdsNotaServico_ImpCOD_AUTENCIDADE_RET.AsString) <> '' then
    Result := False;
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') and (fDMCadNotaServico.cdsNotaServico_ImpNUMLOTE.AsInteger <= 0) then
    Result := False;
end;

function TfrmCadNotaServico.Monta_Diretorio(Tipo,
  Diretorio, Serie: string; Ano, Mes: Integer): string;
var
  vSerieAux: String;
  vAnoMes: String;
begin
  //vAnoMes := FormatFloat('0000',YearOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO.AsDateTime)) + FormatFloat('00',MonthOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO.AsDateTime));
  if Ano > 0 then
    vAnoMes := FormatFloat('0000',Ano) + FormatFloat('00',Mes)
  else
    vAnoMes := copy(vDtRecebimento_Ret,1,4)  + copy(vDtRecebimento_Ret,6,2);
  Result  := '';
  if Diretorio = '' then
    Raise Exception.Create('*** É obrigatório informar o diretório para salvar o arquivo!');
  if copy(Diretorio,Length(Diretorio),1) <> '\' then
    Diretorio := Diretorio + '\';

  vSerieAux := Serie;
  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta "' + Diretorio + '" não existe!');
    exit;
  end;

  if trim(vAnoMes) <> '' then
    Result := Diretorio + vAnoMes + '\'
  else
    Result := Diretorio + vAnoMes;
  CreateDir(Result);
  if Tipo = 'G' then
    Result := Result + 'NFSe_' + FormatFloat('00',fDMCadNotaServico.cdsFilialID.AsFloat) + '_' + FormatFloat('000000000',vNum_NFSe_Ret) + '_S' + vSerieAux + '.png'
  else
  if Tipo = 'P' then
    Result := Result + 'NFSe_' + FormatFloat('00',fDMCadNotaServico.cdsFilialID.AsFloat) + '_' + FormatFloat('000000000',vNum_NFSe_Ret) + '_S' + vSerieAux + '.pdf'
  else
  if Tipo = 'C' then
    Result := Result + 'NFSe_' + FormatFloat('00',fDMCadNotaServico.cdsFilialID.AsFloat) + '_' + FormatFloat('000000000',vNum_NFSe_Ret) + '_CANC_S' + vSerieAux + '.xml'
  else
    Result := Result + 'NFSe_' + FormatFloat('00',fDMCadNotaServico.cdsFilialID.AsFloat) + '_' + FormatFloat('000000000',vNum_NFSe_Ret) + '_S' + vSerieAux + '.xml';
end;

procedure TfrmCadNotaServico.prc_Montar_Protocolo;
var
  i: Integer;
begin
  i := PosEx('Numero do Lote',vRetorno,0);
  if i > 0 then
  begin
    vLote_Ret := copy(vRetorno,i+17,Length(vRetorno) - (i+17));
    i := Pos(']',vLote_Ret);
    vLote_Ret := copy(vLote_Ret,1,i-1);
  end;

  i := PosEx('Data de Recebimento',vRetorno,0);
  if i > 0 then
  begin
    vDtRecebimento_Ret := copy(vRetorno,i+22,Length(vRetorno) - (i+22));
    i := Pos(']',vDtRecebimento_Ret);
    vDtRecebimento_Ret := copy(vDtRecebimento_Ret,1,i-1);
  end;

  vProtocolo_Ret := '';
  //if fDMCadNotaServico.cdsFilialTIPO_RETORNO.AsString = 'P' then
  //begin
    i := PosEx('Protocolo',vRetorno,0);
    if i > 0 then
      vProtocolo_Ret := copy(vRetorno,i+12,Length(vRetorno) - (i+12));
  //end;
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
    vProtocolo_Ret := vLote_Ret;
end;

procedure TfrmCadNotaServico.prc_Enviar_Email;
var
  vEmailAux: String;
  lista_Anexo: TStringList;
  texto: String;
  sDiretorio: string;
  sArquivo: string;
  vSenhaEmail: String;
begin
  if trim(fDMCadNotaServico.cdsClienteEMAIL_NFE.AsString) = '' then
    exit;

  // Define o diretório temporário
  sDiretorio := IncludeTrailingPathDelimiter(GetTempDirectory) + FormatDateTime('AAAAMMDDHHMMSS', Now) + '\';
  ForceDirectories(sDiretorio);

  Lista_Anexo := TStringList.Create;
  try
    sArquivo := sDiretorio + 'NFSe_' + FormatFloat('000000000',fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsInteger) + '.xml';
    // Cria o arquivo xml temporário
    fDMCadNotaServico.cdsNotaServico_ImpXML.SaveToFile(sArquivo);
    // Adiciona na lista de arquivos que serão enviados
    lista_Anexo.Add(sArquivo);
    if trim(vNomeArqPDF) <> '' then
      lista_Anexo.Add(vNomeArqPDF);

    vEmailAux := fDMCadNotaServico.cdsClienteEMAIL_NFE.AsString;
    if Trim(fDMCadNotaServico.cdsClienteEMAIL_NFE2.AsString) <> '' then
      vEmailAux := vEmailAux + ',' + fDMCadNotaServico.cdsClienteEMAIL_NFE2.AsString;
    //Lê a tabela de Contatos
    fDMCadNotaServico.cdsPessoa_Contato.Close;
    fDMCadNotaServico.sdsPessoa_Contato.ParamByName('CODIGO').AsInteger := fDMCadNotaServico.cdsClienteCODIGO.AsInteger;
    fDMCadNotaServico.cdsPessoa_Contato.Open;
    fDMCadNotaServico.cdsPessoa_Contato.First;
    while not fDMCadNotaServico.cdsPessoa_Contato.Eof do
    begin
      if (fDMCadNotaServico.cdsPessoa_ContatoENVIAR_NFE.AsString = 'S') or (fDMCadNotaServico.cdsPessoa_ContatoENVIAR_NFE.AsString = 's') then
        vEmailAux := vEmailAux + ',' + fDMCadNotaServico.cdsPessoa_ContatoEMAIL.AsString;
      fDMCadNotaServico.cdsPessoa_Contato.Next;
    end;
    //************

    prc_Monta_CorpoEmail;

    vDadosCorpoEmail := vDadosCorpoEmail;

    if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
      texto := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
    else
      texto := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);
    if fDMCadNotaServico.cdsParametrosUSA_ENVIO_EMAIL_CATEGORIA.AsString = 'S' then
    begin
      fDMCadNotaServico.qFilial_Email.Close;
      fDMCadNotaServico.qFilial_Email.ParamByName('ID').AsInteger :=  fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger;
      fDMCadNotaServico.qFilial_Email.Open;
      vSenhaEmail := Descriptografar( fDMCadNotaServico.qFilial_EmailBASE.AsInteger
                                 , 'ssfacil'
                                 , fDMCadNotaServico.qFilial_EmailSMTP_SENHA.AsString );

      EnviarEmail2(Trim(fnc_LocalServidorNFe),
                   texto,
                   fDMCadNotaServico.qFilial_EmailREMETENTE_EMAIL.AsString,
                   fDMCadNotaServico.qFilial_EmailREMETENTE_NOME.AsString,
                   fDMCadNotaServico.qFilial_EmailSMTP_CLIENTE.AsString,
                   fDMCadNotaServico.qFilial_EmailSMTP_PORTA.AsString,
                   fDMCadNotaServico.qFilial_EmailSMTP_REQUER_SSL.AsString,
                   fDMCadNotaServico.qFilial_EmailSMTP_USUARIO.AsString,
                   vSenhaEmail,
                   fDMCadNotaServico.qFilial_EmailSOLICITAR_CONFIRMACAO.AsString,
                   vEmailAux,'',
                   'Nota de Serviço Nº ' + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString,
                   vDadosCorpoEmail,
                   lista_Anexo);
    end
    else
    begin
      EnviarEmail( Trim(fnc_LocalServidorNFe),
                   texto,
                   vEmailAux,
                   '',
                   'Nota de serviço ',
                   vDadosCorpoEmail,
                   lista_Anexo );
    end;

    prc_Gravar_Envio_Email;

  finally
    FreeAndNil(Lista_Anexo);
    RemoveDir(sDiretorio);
  end;
end;

procedure TfrmCadNotaServico.prc_Monta_CorpoEmail;
begin
  vDadosCorpoEmail := '';
  vDadosCorpoEmail := 'EM ANEXO NOTA DE SERVIÇO nº ' + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail + #13;
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM' then
  begin
    vDadosCorpoEmail := vDadosCorpoEmail + 'Cód. Verificação Autencidade: ' + fDMCadNotaServico.cdsNotaServico_ImpCOD_AUTENCIDADE_RET.AsString;
    vDadosCorpoEmail := vDadosCorpoEmail + #13;
  end;
  vDadosCorpoEmail := vDadosCorpoEmail + 'Inscrição Municipal: ' + fDMCadNotaServico.cdsNotaServico_ImpINSCMUNICIPAL_FIL.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail + #13;
  vDadosCorpoEmail := vDadosCorpoEmail + 'Link para verificação: ' + fDMCadNotaServico.cdsFilialLINKNFSE.AsString + '    ';
  vDadosCorpoEmail := vDadosCorpoEmail + #13;

  //*************

  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + fDMCadNotaServico.cdsFilialNOME.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + fDMCadNotaServico.cdsFilialENDERECO.AsString + ', ' + fDMCadNotaServico.cdsFilialNUM_END.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + fDMCadNotaServico.cdsFilialCIDADE.AsString + ' - ' + fDMCadNotaServico.cdsFilialUF.AsString + '   ';
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + 'Fone: ' + fDMCadNotaServico.cdsFilialDDD1.AsString + ' ' + fDMCadNotaServico.cdsFilialFONE.AsString;
end;

procedure TfrmCadNotaServico.btnConsultar_NFSeClick(Sender: TObject);
var
  LoteProtocolo: String;
  vCnpjAux: String;
  vXML: WideString;
  vLoteAux: Integer;
  vFlag: Boolean;
  i: Integer;
  vPasta: String;
  vArqTemp: String;
  vAnoAux, vMesAux: Integer;
begin
  vFlag         := True;
  vProcesso_OK  := False;
  LoteProtocolo := '';

  if not fDMCadNotaServico.cdsServico.Active then
    fDMCadNotaServico.prc_Abrir_Servico;

  fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger,[loCaseInsensitive]);
  
  if trim(vProtocolo_Ret) = '' then
  begin
    if not(SMDBGrid1.SelectedRows.CurrentRowSelected) and (fDMCadNotaServico.cdsNotaServico_Consulta.Active) and
          (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger > 0) then
    begin
      if MessageDlg('Registro não está selecionado para consulta, deseja continuar?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
      begin
        vFilial_Sel := 0;
        exit;
      end;
      vFlag := False;
      vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger;
    end;
  end;

  if vFilial_Sel <= 0 then
  begin
    if (not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) or
       (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger <= 0))
      and (RxDBLookupCombo1.Text = '') then
      vFilial_Sel := 0
    else
    if fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger > 0 then
      vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger
    else
    if RxDBLookupCombo1.Text <> '' then
      vFilial_Sel := RxDBLookupCombo1.KeyValue;
  end;
  if vFilial_Sel <= 0 then
  begin
    MessageDlg('*** Não foi escolhida nenhuma filial!', mtError, [mbOk], 0);
    exit;
  end;

  if fDMCadNotaServico.cdsFilialID.AsInteger <> vFilial_Sel then
    fDMCadNotaServico.cdsFilial.Locate('ID',vFilial_Sel,[loCaseInsensitive]);

  if vEnvioACBR then
  begin
    MessageDlg('*** Opção não liberada para a Cidade ' + fDMCadNotaServico.cdsFilialCIDADE.AsString  +#13+
               '    Opção não usada para ACBR!',  mtInformation, [mbOk], 0);
    exit;
  end;

  if vFlag then
  begin
    LoteProtocolo := vProtocolo_Ret;
    if ((trim(LoteProtocolo) = '') or (trim(LoteProtocolo) = '0')) and
       (fDMCadNotaServico.cdsNotaServico_Consulta.Active) and (trim(fDMCadNotaServico.cdsNotaServico_ConsultaPROTOCOLO.AsString) <> '') then
    begin
      LoteProtocolo := fDMCadNotaServico.cdsNotaServico_ConsultaPROTOCOLO.AsString;
    end;
    if vNumLote_NFSe > 0 then
      vLoteAux := vNumLote_NFSe
    else
      vLoteAux := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger;
  end;

  if (trim(LoteProtocolo) = '') or (trim(LoteProtocolo) = '0') then
    LoteProtocolo := InputBox('Consulta Lote NFS-e','Informe o protocolo ou número do lote: ', '');
  if trim(LoteProtocolo) = '' then
  begin
    vFilial_Sel := 0;
    exit;
  end;

  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

  if not Assigned(cXMLStream) then
    cXMLStream := TMemoryStream.Create;

  try
    try
      //teste
        vPasta := ExtractFilePath(Application.ExeName) + 'Temp';
        if not DirectoryExists(vPasta) then
          CreateDir(vPasta);
        vArqTemp := vPasta + '\XMLNFSe_' + FormatDateTime('YYYYMMDD',Date) +  '_' + FormatDateTime('HHMMSS',Time) + '.xml';
        if FileExists(vArqTemp) then
          DeleteFile(vArqTemp);
        cXMLStream.SaveToFile(vArqTemp);
      //***

      NFSe_ConsultarLote( fnc_LocalServidorNFe,
                          vCnpjAux,
                          LoteProtocolo,
                          cXMLStream );

      cXMLStream.Position := 0;
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
      begin
        if FileExists(vArqTemp) then
          DeleteFile(vArqTemp);
      end;

      //Grava o número da nota e salva xml por nota
      //tirar SalvarASCII( cXMLStream, 'C:\A\Teste30.XML' );
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
      begin
        vPasta := ExtractFilePath(Application.ExeName) + 'Temp';
        if not DirectoryExists(vPasta) then
          CreateDir(vPasta);
        vArqTemp := vPasta + '\XMLNFSe_' + FormatDateTime('YYYYMMDD',Date) +  '_' + FormatDateTime('HHMMSS',Time) + '.xml';
        if FileExists(vArqTemp) then
          DeleteFile(vArqTemp);
        cXMLStream.SaveToFile(vArqTemp);
        //ver Porto Alegre  retorno
        uXMLNFSe_CampoBom.prc_Carregar_Campo_Bom(vArqTemp);
        if FileExists(vArqTemp) then
          DeleteFile(vArqTemp);
      end
      else
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
      begin

        vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServico_ConsultaDTEMISSAO_CAD.AsDateTime);
        vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServico_ConsultaDTEMISSAO_CAD.AsDateTime);
        vNomeArquivo := Monta_Diretorio('X',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

        if FileExists(vNomeArquivo) then
          DeleteFile(vNomeArquivo);

        cXMLStream.SaveToFile(vNomeArquivo);
        //ver Porto Alegre  retorno
        uXMLNFSe_PortoAlegre.prc_Carregar(vNomeArquivo);

      end
      else
      begin
        sLista_Nota := TStringList.Create;
        NFSe_ListarNotas(cXMLStream,sLista_Nota);
      end;
      prc_Gravar_Autenticidade;

    except
      on E: EExceptionNFSe do
      begin
        vFilial_Sel := 0;
        for i := 0 to e.count - 1 do
        begin
          // são leopoldo
          if (e.Erro[i].Codigo = 'L92') or (e.Erro[i].Codigo = 'L092') then
          begin
            raise Exception.Create('Favor consultar mais tarde esta nota! ' +#13 + 'Nota enviada ao servidor da prefeitura, somente aguardando a resposta!');
          end
          // campo bom
          //Deixado somente se não for Campo Bom   18/01/2016
          //else if (e.Erro[i].Codigo = '200') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') then
          else if (e.Erro[i].Codigo = '200') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') then
          begin
            // limpar os campos: lote , data , etc aqui
            if PosEx('Rejeitado',e.Message) > 0 then
              prc_Limpar_Protocolo_CB(StrToInt(LoteProtocolo));
          end
          else
          begin
            //prc_Limpar_Protocolo;
            break;
          end;
        end;
        raise Exception.Create('Erro na consulta do lote/protocolo: ' + E.Message);
      end;
    end;

  finally
    vLoteAux := vNumLote_NFSe;
    FreeAndNil(cXMLStream);
    if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'PORTO ALEGRE') then
      FreeAndNil(sLista_Nota);
    prc_Limpa_Variaveis;
    prc_Consultar(0); //Consultar o Lote;
    vFilial_Sel := 0;
  end;
end;

procedure TfrmCadNotaServico.prc_Gravar_Notas;
var
  sds: TSQLDataSet;
  vAux: Integer;
  vHomologacaoAux: String;
  vDtRecebimentoAux: String;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;

  try
    fDMCadNotaServico.cdsNotaServico_Consulta.First;
    while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
    begin
      vHomologacaoAux := fDMCadNotaServico.cdsNotaServico_ConsultaHOMOLOGACAO.AsString;
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
        vNumLote_NFSe := StrToInt(vProtocolo_Ret);
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        if Length(trim(vDtRecebimento_Ret)) > 20 then
          vDtRecebimentoAux := copy(vDtRecebimento_Ret,1,20)
        else
          vDtRecebimentoAux := vDtRecebimento_Ret;
        sds.CommandText := ' UPDATE NOTASERVICO SET PROTOCOLO = ' + QuotedStr(vProtocolo_Ret) +
                           ', NUMLOTE = ' + IntToStr(vNumLote_NFSe) +
                           ', DTRECEBIMENTO_RET = ' + QuotedStr(vDtRecebimentoAux) +
                           //', HOMOLOGACAO = ' + QuotedStr(vHomologacaoAux) +
                           ' WHERE ID = ' + fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString;
        sds.ExecSQL();
        if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
          vNumLote_NFSe := 0;
      end;
      fDMCadNotaServico.cdsNotaServico_Consulta.Next;
    end;

  finally
    FreeAndNil(sds);
  end;

  try
   //Grava a tabela de Lotes
   if not fDMCadNotaServico.cdsNotaServico_Lote.Active then
     fDMCadNotaServico.prc_Abrir_NotaServico_Lote(-1);
   vAux := dmDatabase.ProximaSequencia('NOTASERVICO_LOTE',0);
   fDMCadNotaServico.cdsNotaServico_Lote.Insert;
   fDMCadNotaServico.cdsNotaServico_LoteID.AsInteger           := vAux;
   fDMCadNotaServico.cdsNotaServico_LoteFILIAL.AsInteger       := fDMCadNotaServico.cdsFilialID.AsInteger;
   fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString     := vProtocolo_Ret;
   fDMCadNotaServico.cdsNotaServico_LoteNUMLOTE.AsInteger      := vNumLote_NFSe;
   fDMCadNotaServico.cdsNotaServico_LoteDATA.AsDateTime        := Date;
   fDMCadNotaServico.cdsNotaServico_LoteDTRECEBIMENTO.AsString := vDtRecebimento_Ret;
   fDMCadNotaServico.cdsNotaServico_Lote.Post;
   fDMCadNotaServico.cdsNotaServico_Lote.ApplyUpdates(0);
   //************
  except
    on e: Exception do
       raise Exception.Create('Erro ao gravar o protocolo na tabela de Lote: ' + #13 + e.Message);
  end;
end;

procedure TfrmCadNotaServico.prc_Gravar_Autenticidade(vBtnConsRPS: Boolean = False);
var
  i: Integer;
  sds: TSQLDataSet;
  vAnoAux, vMesAux: Integer;
  vHomologacaoAux: String;
  vAno,vMes,vDia: String;
  vData: TDateTime;
  vID_Mov: Integer;
  vGravar: Boolean;
  vID_Nota_Local: Integer;
  vNum_Nota_Local: Integer;
  vVlr_Entrada_Local: Real;
  texto2: String;
  vCNPJPref: String;
  vCNPJSis: String;
begin
//ver porto alegre  retorno
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') then
  begin
    prc_Le_fCds;
    exit;
  end
  else
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') then
  begin
    prc_Le_fCds;
    exit;
  end;
  vID_Nota_Local     := 0;
  vNum_Nota_Local    := 0;
  vVlr_Entrada_Local := 0;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;

  try
    for I := 0 to sLista_Nota.Count - 1 do
    begin
      //31/05/2017
      //if ckHomologacao.Checked then
      if fDMCadNotaServico.cdsFilialNFSE_HOMOLOGACAO.AsString = 'S' then
        vHomologacaoAux := 'S'
      else
        vHomologacaoAux := 'N';
        
      prc_Montar_RPS_NumNFSe(sLista_Nota[i]);

      if (vNum_NFSe_Ret > 0) and (vNum_RPS_Ret > 0) then
      begin
        sXMLNFSe := TMemoryStream.Create();
        NFSe_RecuperarNota(cXMLStream, IntToStr(vNum_NFSe_Ret), sXMLNFSe);

        try
          if vFilial_Sel <= 0 then
            vFilial_Sel := 1;
          fDMCadNotaServico.cdsNotaServico.Close;
          fDMCadNotaServico.sdsNotaServico.CommandText := fDMCadNotaServico.ctCommand
                                                        + ' WHERE NUMRPS = ' + IntToStr(vNum_RPS_Ret)
                                                        + ' AND FILIAL = ' + IntToStr(vFilial_Sel);
          fDMCadNotaServico.cdsNotaServico.Open;
          //10/02/2015
          vID_Nota_Local     := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
          vNum_Nota_Local    := fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger;
          vVlr_Entrada_Local := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat));
          if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
            fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);
          //aqui 29/09/2014
          vGravar := False;
          if (vBtnConsRPS) and not(fnc_Dados_OK) then
            vGravar := False
          else
          if (trim(fDMCadNotaServico.cdsNotaServicoCOD_AUTENCIDADE_RET.AsString) = '') or
             (fDMCadNotaServico.cdsNotaServicoCOD_AUTENCIDADE_RET.IsNull) then
          begin
            vGravar := True;
            fDMCadNotaServico.cdsNotaServico.Edit;
            fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger            := vNum_NFSe_Ret;
            fDMCadNotaServico.cdsNotaServicoCOD_AUTENCIDADE_RET.AsString := vCod_Autencidade_Ret;
            fDMCadNotaServico.cdsNotaServicoDT_EMISSAO_RET.AsString      := vDtEmissao_Ret;
            fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime         := Now;

            if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_CSLL.AsFloat)) <= 0 then
              fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString := 'N';

            try
              vAno  := copy(vDtEmissao_Ret,1,4);
              vMes  := copy(vDtEmissao_Ret,6,2);
              vDia  := copy(vDtEmissao_Ret,9,2);
              vData := EncodeDate(StrToInt(vAno),StrToInt(vMes),StrToInt(vDia));
            except
              begin
                vData := Date;
              end;
            end;
            fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime := vData;
            if trim(vProtocolo_Ret2) <> '' then
            begin
              fDMCadNotaServico.cdsNotaServicoPROTOCOLO.AsString         := fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString;
              fDMCadNotaServico.cdsNotaServicoDTRECEBIMENTO_RET.AsString := fDMCadNotaServico.cdsNotaServico_LoteDTRECEBIMENTO.AsString;
            end;
            sXMLNFSe.position := 0;
            fDMCadNotaServico.cdsNotaServicoXML.LoadFromStream(sXMLNFSe);

            if fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger <> fDMCadNotaServico.cdsServicoID.AsInteger then
              fDMCadNotaServico.cdsServico.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger,[loCaseInsensitive]);

            //03/05/2022 para gravar o total no movimento e não líquido  
            //vID_MOV := fnc_Gravar_Mov;
            prc_Movimento;
            //fDMCadNotaServico.cdsNotaServicoID_MOVIMENTO.AsInteger := vID_Mov;
            fDMCadNotaServico.cdsNotaServico.Post;
            fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
            vProcesso_OK := True;
          end;
        except
        end;

        if vGravar then
        begin
          sds.Close;
          sds.CommandText := 'UPDATE DUPLICATA SET NUMDUPLICATA = ' + QuotedStr(IntToStr(vNum_NFSe_Ret)) +
                             ', NUMNOTA = ' + IntToStr(vNum_NFSe_Ret) +
                             ', DTEMISSAO = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',vData)) +
                             ' WHERE NUMRPS = ' + IntToStr(vNum_RPS_Ret) +
                             ' AND FILIAL = ' + IntToStr(vFilial_Sel);
          sds.ExecSQL();

          if fDMCadNotaServico.cdsParametrosUSA_VENDEDOR.AsString = 'S' then
          begin
            sds.Close;
            sds.CommandText := 'UPDATE EXTCOMISSAO SET NUM_NOTA = ' + QuotedStr(IntToStr(vNum_NFSe_Ret)) +
                               ' WHERE NUMRPS = ' + IntToStr(vNum_RPS_Ret) +
                               ' AND FILIAL = ' + IntToStr(vFilial_Sel);
            sds.ExecSQL();
          end;

          if StrToFloat(FormatFloat('0.00',vVlr_Entrada_Local)) > 0 then
            texto2 := 'Recto.Entrada ref. Doc nº ' + IntToStr(vNum_Nota_Local) + ' de ' + fDMCadNotaServico.cdsClienteNOME.AsString
          else
            texto2 := 'Recto.A Vista ref. Doc nº ' + IntToStr(vNum_Nota_Local) + ' de ' + fDMCadNotaServico.cdsClienteNOME.AsString;

          sds.Close;
          sds.CommandText := 'UPDATE FINANCEIRO SET HISTORICO_COMPL = ' + QuotedStr(texto2) +
                             ' WHERE ID_NOTA_SERVICO = ' + IntToStr(vID_Nota_Local);
          sds.ExecSQL();
        end;

        vAnoAux      := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
        vMesAux      := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
        vNomeArquivo := Monta_Diretorio('X',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

        SalvarASCII( sXMLNFSe, vNomeArquivo );

        //if ckEmail.Checked then
        //  prc_Enviar_Email;
        FreeAndNil(sXMLNFSe);
      end;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.prc_Montar_RPS_NumNFSe(Texto: String);
var
  i: integer;
  vTexto1: String;
  vTexto2: String;
  vTexto3: String;
  vTexto4: String;
  vValorAux: String;
  vNomeAux: String;
begin
  i       := Pos('/',Texto);
  vTexto1 := copy(Texto,6,i-7);
  Delete(texto,1,i+1);
  i       := Pos('/',Texto);
  vTexto2 := copy(Texto,7,i-8);
  Delete(texto,1,i+1);
  i       := Pos('/',Texto);
  vTexto3 := copy(Texto,19,i-20);
  Delete(texto,1,i+1);
  i       := Pos('/',Texto);
  vTexto4 := copy(Texto,15,19);
  Delete(texto,1,i+1);

  i         := Pos('/',Texto);
  vValorAux := trim(copy(Texto,7,i-8));
  Delete(texto,1,i+1);

  vNomeAux := copy(Texto,15,Length(Texto)-14);

  vNum_RPS_Ret         := StrToInt(vTexto1);
  vNum_NFSe_Ret        := StrToInt(vTexto2);
  vCod_Autencidade_Ret := vTexto3;
  vDtEmissao_Ret       := vTexto4;
  if trim(vValorAux) <> '' then
  begin
    vValorAux         := Replace(vValorAux,'.',',');
    //Texto := Texto + Replace(FormatFloat('0.00',vVlrAux),',','.') + '|';

    vValorServico_Ret := StrToFloat(vValorAux);
  end
  else
    vValorServico_Ret := 0;
  vNomeCliente_Ret     := vNomeAux;
end;

procedure TfrmCadNotaServico.btnCancelar_NFSeClick(Sender: TObject);
var
  NumeroNFSe, CodigoCancelamento, MotivoCancelamento: String;
  cMunicipio: String;
  vCNPJAux: String;
  vAnoAux, vMesAux: Integer;
  vIDAux: Integer;
  i: Integer;
  vTexto1, vTexto2: String;
begin
  if fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger <= 0 then
  begin
    MessageDlg('*** Nota não foi enviada!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.prc_Abrir_Natureza;
  if (vEnvioACBR) and (fDMCadNotaServico.cdsCidadePERMITE_CANCELAMENTO.AsString <> 'S') then
  begin
    MessageDlg('*** Opção não liberada para a Cidade ' + fDMCadNotaServico.cdsNotaServico_ConsultaCIDADE.AsString  +#13+
               '    Opção não usada para ACBR!',  mtInformation, [mbOk], 0);
    exit;
  end;

  prc_Posiciona_NotaFiscal;

  vFilial := fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger;
  vIDAux  := fDMCadNotaServico.cdsNotaServicoID.AsInteger;

  if fDMCadNotaServico.cdsNotaServicoSTATUS_RPS.AsString = '2' then
  begin
    MessageDlg('*** Nota já cancelada!', mtError, [mbOk], 0);
    exit;
  end;

  fDMCadNotaServico.qVerDup.Close;
  fDMCadNotaServico.qVerDup.ParamByName('ID_NOTA_SERVICO').AsInteger := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
  fDMCadNotaServico.qVerDup.Open;
  if fDMCadNotaServico.qVerDupCONTADOR.AsInteger > 0 then
  begin
    MessageDlg('*** Duplicata com pagamento ou com título enviado ao banco, favor verificar!', mtError, [mbOk], 0);
    exit;
  end;

  if (trim(fDMCadNotaServico.cdsCidadeCANCELAMENTO_NFSE.AsString) = 'P') then
    MessageDlg('*** ATENÇÃO o sistema vai cancelar somente local a nota'+#13
              + '*** para cancelar na prefeitura precisa ser direto no site!', mtWarning, [mbOk], 0)
  else
    MessageDlg('*** Antes de cancelar, verificar se é possível cancelar pelo próprio sistema'+#13
              + '*** ou somente pode ser realizado no site da prefeitura!'+#13
              + '*** É preciso ver isso, pois caso contrário a nota na prefeitura fiscalmente fica valendo!' , mtWarning, [mbOk], 0);
  if MessageDlg('Deseja cancelar a nota ' +  fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsString + '?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadNotaServico.vCod_Cancelamento   := 0;
  fDMCadNotaServico.vMotivoCancelamento := '';
  fDMCadNotaServico.vDtCancelamento     := 0;

  ffrmCadNotaServico_Canc := TfrmCadNotaServico_Canc.Create(self);
  ffrmCadNotaServico_Canc.fDMCadNotaServico := fDMCadNotaServico;
  ffrmCadNotaServico_Canc.ShowModal;
  FreeAndNil(ffrmCadNotaServico_Canc);

  //Cancelamento pelo acbr
  if vEnvioACBR then
  begin
    fDMCadNotaServico.cdsNotaServico_Imp.Close;
    fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                        IntToStr(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
    fDMCadNotaServico.cdsNotaServico_Imp.Open;
    fDMNFSe    := TdmNFSe.Create(Self);
    try
      fDMNFSe.fDMCadNotaServico := fDMCadNotaServico;
      fdmNFSe.Cancelar_Nfse;
    finally
      FreeAndNil(fDMNFSe);
    end;
    btnConsultarClick(Sender);
    Abort;
  end;
  if (fDMCadNotaServico.vCod_Cancelamento <= 0) or (trim(fDMCadNotaServico.vMotivoCancelamento) = '') then
  begin
    MessageDlg('*** Código ou Motivo do cancelamento não informado!', mtError, [mbOk], 0);
    exit;
  end;
  cMunicipio := fDMCadNotaServico.cdsFilialCODMUNICIPIO.AsString;
  if fDMCadNotaServico.cdsFilialID.AsInteger <> vFilial then
    fDMCadNotaServico.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);
  if (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString = 'S')
   or (fDMCadNotaServico.cdsCidadeCANCELAMENTO_NFSE.AsString = 'P') then
  begin
    vIDAux := fDMCadNotaServico.cdsNotaServicoID.AsInteger; 
    fDMCadNotaServico.prc_Gravar_Cancelamento;
    fDMCadNotaServico.mOSAux.First;
    while not fDMCadNotaServico.mOSAux.Eof do
    begin
      prc_Atualiza_OrdemServico(fDMCadNotaServico.mOSAuxID.AsInteger,fDMCadNotaServico.mOSAuxTipo.AsString);
      fDMCadNotaServico.mOSAux.Next;
    end;
    btnConsultarClick(Sender);
    fDMCadNotaServico.cdsNotaServico.Locate('ID',vIDAux,[loCaseInsensitive]);
    exit;
  end;

  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
    NumeroNFSe := fDMCadNotaServico.cdsNotaServicoNUMLOTE.AsString
  else
    NumeroNFSe := fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsString;
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
  begin
    vTexto1 := copy(NumeroNFSe,1,4);
    Delete(NumeroNFSe,1,4);
    for i := 1 to 11 - Length(NumeroNFSe) do
      NumeroNFSe := '0' + NumeroNFSe;
    NumeroNFSe := vTexto1 + NumeroNFSe;
  end;

  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'IPM204')
   or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM')
   or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE')
   or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ABACO1') then
    CodigoCancelamento := IntToStr(fDMCadNotaServico.vCod_Cancelamento)
  else
    CodigoCancelamento := 'E506';
  MotivoCancelamento := fDMCadNotaServico.vMotivoCancelamento;

  //Aqui   09/07/2018
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'IPM204')
     or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ABACO1') then
  begin
    prc_Consultar_RPS_Canc;
    prc_Consultar(vIDAux);
    exit;
  end;
  //*******************

  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

  //Foi criado o campo CANCELAMENTO_NFSE COM o tipo 'P' para identificar que o cancelamento é pela prefeitura e não pelo sistema SSFacil
  //19/04/2018, ver se tem como buscar somente o XML que identifica a nota cancelada

  cXMLStream := TMemoryStream.Create;
  try
    try
      NFSe_CancelarNFSe( fnc_LocalServidorNFe,
                         vCnpjAux,
                         NumeroNFSe,
                         cMunicipio,
                         CodigoCancelamento,
                         MotivoCancelamento,
                         cXMLStream );

      cXMLStream.Position := 0;

      fDMCadNotaServico.prc_Gravar_Cancelamento;
      fDMCadNotaServico.mOSAux.First;
      while not fDMCadNotaServico.mOSAux.Eof do
      begin
        prc_Atualiza_OrdemServico(fDMCadNotaServico.mOSAuxID.AsInteger,fDMCadNotaServico.mOSAuxTipo.AsString);
        fDMCadNotaServico.mOSAux.Next;
      end;

      vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);
      vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);

      vNomeArquivo := Monta_Diretorio('C',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

      SalvarUTF8( cXMLStream, vNomeArquivo );

    except
      on e: Exception do
        raise Exception.Create('Erro ao enviar o cancelamento: ' + #13 + e.Message);
    end;

  finally
    FreeAndNil(cXMLStream);
  end;
end;

procedure TfrmCadNotaServico.btnGerar_AutomaticoClick(Sender: TObject);
begin
  prc_Gerar_Servico_Int;
end;

procedure TfrmCadNotaServico.prc_Gerar_Servico_Int;
begin
  if fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger <= 0 then
  begin
    ShowMessage('*** Cliente não informado!');
    exit;
  end;
  if not fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]) then
    exit;
  if not fDMCadNotaServico.cdsNotaServico_Itens.IsEmpty then
    exit;

  fDMCadNotaServico.vVlrTotal_NFSe          := 0;
  fDMCadNotaServico.vVlrLiquido_NFse        := 0;
  fDMCadNotaServico.vSomar_Diminuir_Ant     := '';
  fDMCadNotaServico.vCalcular_INSS_Ant      := '';
  fDMCadNotaServico.vCalcular_ISSQN_Ant     := '';
  fDMCadNotaServico.vCalcular_PisCofins_Ant := '';
  fDMCadNotaServico.vCalcular_CSLL_Ant      := '';
  fDMCadNotaServico.vCalcular_IR_Ant        := '';

  if (fDMCadNotaServico.cdsClienteID_SERVICO_INT.AsInteger > 0) then
    prc_Gravar_Itens(fDMCadNotaServico.cdsClienteID_SERVICO_INT.AsInteger,fDMCadNotaServico.cdsClienteVLR_SERVICO.AsFloat,'S','S','S','S','S','S');

  fDMCadNotaServico.cdsPessoa_Servico_Int.Close;
  fDMCadNotaServico.sdsPessoa_Servico_Int.ParamByName('CODIGO').AsInteger := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger;
  fDMCadNotaServico.cdsPessoa_Servico_Int.Open;
  fDMCadNotaServico.cdsPessoa_Servico_Int.First;
  while not fDMCadNotaServico.cdsPessoa_Servico_Int.Eof do
  begin
    prc_Gravar_Itens(fDMCadNotaServico.cdsPessoa_Servico_IntID_SERVICO_INT.AsInteger,fDMCadNotaServico.cdsPessoa_Servico_IntVLR_SERVICO.AsFloat,
                     fDMCadNotaServico.cdsPessoa_Servico_IntSOMAR_DIMINUIR.AsString,fDMCadNotaServico.cdsPessoa_Servico_IntCALCULAR_INSS.AsString,
                     fDMCadNotaServico.cdsPessoa_Servico_IntCALCULAR_ISSQN.AsString,fDMCadNotaServico.cdsPessoa_Servico_IntCALCULAR_PISCOFINS.AsString,
                     fDMCadNotaServico.cdsPessoa_Servico_IntCALCULAR_CSLL.AsString,fDMCadNotaServico.cdsPessoa_Servico_IntCALCULAR_IR.AsString);
    fDMCadNotaServico.cdsPessoa_Servico_Int.Next;
  end;

  fDMCadNotaServico.prc_Recalcular;
  fDMCadNotaServico.prc_Calcular_Impostos;
end;

procedure TfrmCadNotaServico.prc_Limpa_Variaveis;
begin
  vRetorno             := '';
  vProtocolo_Ret       := '';
  vDtRecebimento_Ret   := '';
  vLote_Ret            := '';
  vNumLote_NFSe        := 0;
  vDadosCorpoEmail     := '';
  vNum_RPS_Ret         := 0;
  vNum_NFSe_Ret        := 0;
  vDtEmissao_Ret       := '';
  vCod_Autencidade_Ret := '';
  vProtocolo_Ret2      := '';
  vFilial_Sel          := 0;
end;

procedure TfrmCadNotaServico.btnEnviarEmailClick(Sender: TObject);
var
  vEnviar: Boolean;
  vAnoAux: Integer;
  vMesAux: Integer;
begin
  if MessageDlg('Deseja enviar email das notas selecionadas?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadNotaServico.cdsNotaServico_Consulta.First;
  while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      fDMCadNotaServico.cdsNotaServico_Imp.Close;
      fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp
                                                        + ' WHERE NS.ID = ' + fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString;
      fDMCadNotaServico.cdsNotaServico_Imp.Open;
      vEnviar := True;
      if trim(fDMCadNotaServico.cdsNotaServico_ImpXML.AsString) = '' then
        vEnviar := False;
      if (vEnviar) and (not(fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServico_ImpID_CLIENTE.AsInteger,[loCaseInsensitive]))
        or  (trim(fDMCadNotaServico.cdsClienteEMAIL_NFE.AsString) = '')) then
        vEnviar := False;
      if vEnviar then
      begin
        vAnoAux       := YearOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);
        vMesAux       := MonthOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);
        vNum_NFSe_Ret := fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsInteger;
        if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger then
          fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger,[loCaseInsensitive]);
        //18/09/2016
        {if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
        begin
          vNomeArqPDF := Monta_Diretorio('G',fDMCadNotaServico.cdsParametrosENDPDFNFSE.AsString,fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString,vAnoAux,vMesAux);
          if not FileExists(vNomeArqPDF) then
          begin
            try
              prc_Obter_Nota_PNG(False);
            except
              ShowMessage('Não foi possível efetuar a impressão!');
            end;
          end;
        end
        else
        begin}
          vNomeArqPDF   := Monta_Diretorio('P',fDMCadNotaServico.cdsParametrosENDPDFNFSE.AsString,fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString,vAnoAux,vMesAux);
          prc_Imprimir_Danfe('E');
        //end;
        fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger,[loCaseInsensitive]);
        prc_Enviar_Email;
        vNum_NFSe_Ret := 0;
      end;
    end;
    fDMCadNotaServico.cdsNotaServico_Consulta.Next;
  end;
  btnConsultarClick(Sender);
end;

function TfrmCadNotaServico.GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function TfrmCadNotaServico.fnc_Busca_TipoRetorno: String;
begin
  fDMCadNotaServico.qTipoProvedor.Close;
  fDMCadNotaServico.qTipoProvedor.ParamByName('ID_CIDADE').AsInteger := fDMCadNotaServico.cdsFilialID_CIDADE.AsInteger;
  fDMCadNotaServico.qTipoProvedor.Open;
  Result := fDMCadNotaServico.qTipoProvedorTIPO_RETORNO.AsString;
end;

procedure TfrmCadNotaServico.Panel5Exit(Sender: TObject);
var
  vAux: Real;
begin
  if RxDBLookupCombo4.Text <> '' then
    fDMCadNotaServico.cdsNatureza.Locate('ID',RxDBLookupCombo4.KeyValue,[loCaseInsensitive]);
  //11/05/2022
  fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString := fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString;

  if fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger <> fDMCadNotaServico.cdsClienteCODIGO.AsInteger then
    fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);

  prc_Verifica_Limite(fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,fDMCadNotaServico.cdsNotaServicoID.AsInteger,
                      fDMCadNotaServico.cdsClienteVLR_LIMITE_CREDITO.AsFloat);

  if (RxDBLookupCombo2.Text <> '') and ((fDMCadNotaServico.cdsNotaServico.State in [dsInsert]) or
     (fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger <> vID_Servico_Ant)) then
  begin
    if fDMCadNotaServico.cdsFilialUSA_ATIVIDADE_CID_SERV.AsString = 'S' then
    begin
      if fDMCadNotaServico.cdsFilialUSA_ATIVIDADE_CID_SERV.AsString = 'S' then
        fDMCadNotaServico.prc_Abrir_Atividade(fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger);
    end;
    //09/05/2022  Busca % da tabela Filial_Servico
    //fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := 0;
    fDMCadNotaServico.prc_Le_Filial_Servico;

    if trim(fDMCadNotaServico.cdsServicoCNAE.AsString) <> '' then
      fDMCadNotaServico.cdsNotaServicoCNAE_NFSE.AsString := fDMCadNotaServico.cdsServicoCNAE.AsString;
    if fDMCadNotaServico.cdsServicoID_ATIVIDADE_CID.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger := fDMCadNotaServico.cdsServicoID_ATIVIDADE_CID.AsInteger
    else
    if fDMCadNotaServico.cdsFilialID_ATIVIDADE_CID.AsInteger > 0 then
      fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger := fDMCadNotaServico.cdsFilialID_ATIVIDADE_CID.AsInteger;

    //11/05/2022
    if fDMCadNotaServico.qFilial_ServicoID.AsInteger > 0 then
    begin
      if trim(fDMCadNotaServico.qFilial_ServicoMOSTRAR_BASE_ISSQN.AsString) <> '' then
        fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString := fDMCadNotaServico.qFilial_ServicoMOSTRAR_BASE_ISSQN.AsString;
    end;
    //*****************

    //09/05/2022 IF novo por filial_servico
    if fDMCadNotaServico.qFilial_ServicoID.AsInteger > 0 then
    begin
      fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadNotaServico.qFilial_ServicoPERC_ISSQN.AsFloat));
      fDMCadNotaServico.cdsNotaServicoPERC_PIS.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.qFilial_ServicoPERC_PIS.AsFloat));
      fDMCadNotaServico.cdsNotaServicoPERC_COFINS.AsFloat   := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.qFilial_ServicoPERC_COFINS.AsFloat));
      fDMCadNotaServico.cdsNotaServicoPERC_CSLL.AsFloat     := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.qFilial_ServicoPERC_CSLL.AsFloat));
      fDMCadNotaServico.cdsNotaServicoPERC_IR.AsFloat       := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.qFilial_ServicoPERC_IRPJ.AsFloat));
    end
    else
    if (fDMCadNotaServico.cdsFilialSIMPLES.AsString = 'S') and (StrToFloat(FormatFloat('0.00000',fDMCadNotaServico.cdsFilialPERC_ISS_SIMPLES.AsFloat)) > 0) then
      fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadNotaServico.cdsFilialPERC_ISS_SIMPLES.AsFloat))
    else
    if (StrToFloat(FormatFloat('0.0000',fDMCadNotaServico.cdsServicoPERC_ISS.AsFloat)) > 0) then
      fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsServicoPERC_ISS.AsFloat));

    if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString = 'B') then
      fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.00',0));

    vAux := fDMCadNotaServico.fnc_Buscar_Pessoa_Servico(fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger);
    //11/05/2022
    //if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString <> 'B') then
    if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString <> 'B') then
      if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and ((fDMCadNotaServico.cdsFilialSIMPLES.AsString <> 'S')
                                                         or(StrToFloat(FormatFloat('0.00000',fDMCadNotaServico.cdsFilialPERC_ISS_SIMPLES.AsFloat)) <= 0)) then
        fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := vAux;
    if fDMCadNotaServico.cdsFilialUSA_ATIVIDADE_CID_SERV.AsString = 'S' then
    begin
      if (fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger > 0)
            and ((fDMCadNotaServico.cdsFilialSIMPLES.AsString <> 'S')
               or(StrToFloat(FormatFloat('0.00000',fDMCadNotaServico.cdsFilialPERC_ISS_SIMPLES.AsFloat)) <= 0)) then
      begin
        //11/05/2022
        //if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString <> 'B') then
        if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString <> 'B') then
          if fDMCadNotaServico.cdsAtividade_Cid.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger,[loCaseInsensitive]) then
            fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsAtividade_CidPERC_ISSQN.AsFloat));
      end;
    end;
    fDMCadNotaServico.prc_Busca_IBPT(fDMCadNotaServico.cdsServicoCODIGO_NBS.AsString,'G');
  end;
end;

procedure TfrmCadNotaServico.DBCheckBox1Exit(Sender: TObject);
begin
  if (fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) and (vISS_Retido_Ant <> fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString) then
    btnRecalcularClick(Sender);
end;

procedure TfrmCadNotaServico.btnImprimir_NFSeClick(Sender: TObject);
var
  vArq: String;
begin
  prc_Posiciona_NotaFiscal;
  vTipo_Config_Email := 2;

  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) then
    Exit;

  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                      IntToStr(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;

  fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;

  fDMCadNotaServico.cdsNotaServico_Imp_Contrato.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Contrato.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Contrato.Open;

  if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger then
    fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger,[loCaseInsensitive]);

  //Impressão pelo acbr
  if vEnvioACBR then
  begin
    fDMNFSe    := TdmNFSe.Create(Self);
    try
      fDMNFSe.fDMCadNotaServico := fDMCadNotaServico;
      fDMNFSe.ConfigurarComponente;
      fDMNFSe.prc_Abrir_NotaServico_Comunicacao(fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger);
      fdmNFSe.Enviar_Nfse;
    finally
      FreeAndNil(fDMNFSe);
    end;
    Abort;
  end;

///////////////////////RELATÓRIO FORTES
  if (fDMCadNotaServico.cdsFilialIMPRESSAO_MATRICIAL.IsNull) or
     (fDMCadNotaServico.cdsFilialIMPRESSAO_MATRICIAL.AsString = '0') then
  begin
    prc_Imprimir_Danfe('I');
    Exit;
  end;

///////////////////////RELATÓRIO FAST/////////////
  if fDMCadNotaServico.cdsFilialRelatorios.Locate('TIPO',8,([loCaseInsensitive])) then //tipo 8 = Nota Serviço
  begin
    vArq := fDMCadNotaServico.cdsFilialRelatoriosCAMINHO.AsString;
    if FileExists(vArq) then
      fDMCadNotaServico.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      ShowMessage('Relatorio não localizado! ' + vArq);
      Exit;
    end;
    fDMCadNotaServico.frxReport1.ShowReport;

    Exit;
  end;
///////////////////////RELATÓRIO TEXTO
  vArq := fDMCadNotaServico.cdsParametrosIMPRESSORA_CAMINHO.AsString;
  vArq := InputBox('Impressão','Informe o caminho da impressora: ', fDMCadNotaServico.cdsParametrosIMPRESSORA_CAMINHO.AsString);
  case fDMCadNotaServico.cdsFilialIMPRESSAO_MATRICIAL.AsInteger of
    1: prc_Imprimir_Matricial_1(vArq);
    2: prc_Imprimir_Matricial_2(vArq);
    3: prc_Imprimir_Matricial_3(vArq);
  end;
end;

procedure TfrmCadNotaServico.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    edtSerie.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadNotaServico.prc_Limpar_Edit_Consulta;
begin
  edtSerie.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  NxDatePicker1.Clear;
  NxDatePicker2.Clear;
  Edit2.Clear;
end;

procedure TfrmCadNotaServico.btnConsultar2Click(Sender: TObject);
begin
  if CurrencyEdit4.AsInteger <= 0 then
  begin
    MessageDlg('*** Lote não informado!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Consultar_NotaServicoLote;
end;

procedure TfrmCadNotaServico.prc_Consultar_NotaServicoLote;
begin
  if vFilial_Sel <= 0 then
    vFilial_Sel := 1;
  fDMCadNotaServico.cdsNotaServico_Lote.Close;
  fDMCadNotaServico.sdsNotaServico_Lote.CommandText := fDMCadNotaServico.ctNotaServico_Lote +
                                                       ' WHERE NUMLOTE = ' + CurrencyEdit4.Text +
                                                       ' AND FILIAL = ' + IntToStr(vFilial_Sel);
  fDMCadNotaServico.cdsNotaServico_Lote.Open;
end;

procedure TfrmCadNotaServico.btnConsultar_NFSe2Click(Sender: TObject);
begin
  vProtocolo_Ret2 := '';
  if not(fDMCadNotaServico.cdsNotaServico_Lote.Active) or (fDMCadNotaServico.cdsNotaServico_Lote.IsEmpty) or
        (trim(fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString) = '') then
    exit;
  vProtocolo_Ret2 := fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString;
  vProtocolo_Ret  := fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString;
  btnConsultar_NFSeClick(Sender);
  vProtocolo_Ret2 := '';
  vProtocolo_Ret  := '';
end;

procedure TfrmCadNotaServico.prc_Limpar_Protocolo;
var
  sds: TSQLDataSet;
  vAux: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;

  try
    sds.CommandText := 'UPDATE NOTASERVICO SET PROTOCOLO = ' + QuotedStr('')
                     + ' WHERE NUMLOTE = ' + fDMCadNotaServico.cdsNotaServico_LoteNUMLOTE.AsString
                     + '   AND FILIAL = ' +  fDMCadNotaServico.cdsNotaServico_LoteFILIAL.AsString;
    sds.ExecSQL();
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.btnExcluirLoteClick(Sender: TObject);
var
  vNumLoteAux: Integer;
begin
  if not(fDMCadNotaServico.cdsNotaServico_Lote.Active) or (fDMCadNotaServico.cdsNotaServico_Lote.IsEmpty) or
        (trim(fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString) = '') then
    exit;
  if fDMCadNotaServico.cdsNotaServico_LoteNUMLOTE.AsInteger <= 0 then
    exit;

  if MessageDlg('Deseja limpar o protocolo da nota de serviço para fazer o reenvio?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  vNumLoteAux := fDMCadNotaServico.cdsNotaServico_LoteNUMLOTE.AsInteger;  

  fDMCadNotaServico.qVerifica_Lote.Close;
  fDMCadNotaServico.qVerifica_Lote.ParamByName('NUMLOTE').AsInteger := fDMCadNotaServico.cdsNotaServico_LoteNUMLOTE.AsInteger;
  fDMCadNotaServico.qVerifica_Lote.Open;
  if not fDMCadNotaServico.qVerifica_Lote.IsEmpty then
  begin
    MessageDlg('*** Lote já processado!', mtError, [mbOk], 0);
    exit;
  end;

  prc_Limpar_Protocolo;
  CurrencyEdit3.AsInteger := vNumLoteAux;
  btnConsultarClick(Sender);
end;

procedure TfrmCadNotaServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F9) and (fDMCadNotaServico.cdsParametrosIMPRESSAO_MATRICIAL.AsString <> 'S') then
  begin
    if vEnvioACBR then
      exit;

    gbxLote_Protocolo.Visible := not(gbxLote_Protocolo.Visible);
    if (gbxLote_Protocolo.Visible) and (fDMCadNotaServico.cdsNotaServico_Consulta.Active) and
       (fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger > 0) then
    begin
      CurrencyEdit4.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsInteger;
      vFilial_Sel             := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger;
      btnConsultar2Click(Sender);
    end;
  end
  else
  if (Key = Vk_F6) then
  begin
    ffrmConsFat_Mensal := TfrmConsFat_Mensal.Create(self);
    if RzPageControl1.ActivePage = TS_Cadastro then
      ffrmConsFat_Mensal.vID_Cliente := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger
    else
    if fDMCadNotaServico.cdsNotaServico_Consulta.Active then
      ffrmConsFat_Mensal.vID_Cliente := fDMCadNotaServico.cdsNotaServico_ConsultaID_CLIENTE.AsInteger;
    ffrmConsFat_Mensal.ShowModal;
    FreeAndNil(ffrmConsFat_Mensal);
  end
  else
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    CheckBox1.Visible := not(CheckBox1.Visible);
    BitBtn1.Visible   := not(BitBtn1.Visible);
    btnGerarCReceber.Visible  := not(btnGerarCReceber.Visible);
    btnGerarMovimento.Visible := not(btnGerarMovimento.Visible);
    btnGravarVendedor_Dup.Visible := not(btnGravarVendedor_Dup.Visible);
  end;
end;

procedure TfrmCadNotaServico.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) or (Key = #10) then
    Key := ' ';
end;

procedure TfrmCadNotaServico.prc_Imprimir_Danfe(Tipo: String);
begin
  fDMCadNotaServico.mImpNota.EmptyDataSet;
  if Tipo = 'E' then
  begin
    fDMCadNotaServico.mImpNota.Insert;
    fDMCadNotaServico.mImpNotaID_Nota.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
    fDMCadNotaServico.mImpNota.Post;
  end
  else
  if Tipo = 'I' then
  begin
    fDMCadNotaServico.cdsNotaServico_Consulta.First;
    while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        fDMCadNotaServico.mImpNota.Insert;
        fDMCadNotaServico.mImpNotaID_Nota.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
        fDMCadNotaServico.mImpNota.Post;
      end;
      fDMCadNotaServico.cdsNotaServico_Consulta.Next;
    end;
  end;
  fDMCadNotaServico.cdsNotaServico_Imp.Close;

  if fDMCadNotaServico.mImpNota.IsEmpty then
  begin
    MessageDlg('*** Não foi selecionada nenhuma nota para a impressão!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.mImpNota.First;

  //if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ISS.NET') then //NOVO HAMBURGO
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'IPM204') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ABACO1') then //NOVO HAMBURGO
  begin
    fRelDanfe_NFSe                   := TfRelDanfe_NFSe.Create(Self);
    fRelDanfe_NFSe.fDMCadNotaServico := fDMCadNotaServico;
    if Tipo = 'I' then
      fRelDanfe_NFSe.RLReport1.PreviewModal
    else
    begin
      //vNomeArqPdf := 'C:\a\aaa.pdf';
      fRelDanfe_NFSe.RLReport1.Prepare;
      fRelDanfe_NFSe.RLReport1.SaveToFile(vNomeArqPdf);
      fDMCadNotaServico.RLPDFFilter1.FileName := vNomeArqPdf;
      fDMCadNotaServico.RLPDFFilter1.FilterPages(fRelDanfe_NFSe.RLReport1.Pages,1,-1,'',0);
    end;
    fRelDanfe_NFSe.RLReport1.Free;
    fRelDanfe_NFSe.Destroy;
  end
  else
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') then
  begin
    fRelDanfe_NFSe_Poa                   := TfRelDanfe_NFSe_Poa.Create(Self);
    fRelDanfe_NFSe_Poa.fDMCadNotaServico := fDMCadNotaServico;
    if Tipo = 'I' then
      fRelDanfe_NFSe_Poa.RLReport1.PreviewModal
    else
    begin
      //vNomeArqPdf := 'C:\a\aaa.pdf';
      fRelDanfe_NFSe_Poa.RLReport1.Prepare;
      fRelDanfe_NFSe_Poa.RLReport1.SaveToFile(vNomeArqPdf);
      fDMCadNotaServico.RLPDFFilter1.FileName := vNomeArqPdf;
      fDMCadNotaServico.RLPDFFilter1.FilterPages(fRelDanfe_NFSe_Poa.RLReport1.Pages,1,-1,'',0);
    end;
    fRelDanfe_NFSe_Poa.RLReport1.Free;
    fRelDanfe_NFSe_Poa.Destroy;
  end
  else
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
  begin
    fRelDanfe_NFSe_CB                   := TfRelDanfe_NFSe_CB.Create(Self);
    fRelDanfe_NFSe_CB.fDMCadNotaServico := fDMCadNotaServico;
    if Tipo = 'I' then
      fRelDanfe_NFSe_CB.RLReport1.PreviewModal
    else
    begin
      //vNomeArqPdf := 'C:\a\aaa.pdf';
      fRelDanfe_NFSe_CB.RLReport1.Prepare;
      fRelDanfe_NFSe_CB.RLReport1.SaveToFile(vNomeArqPdf);
      fDMCadNotaServico.RLPDFFilter1.FileName := vNomeArqPdf;
      fDMCadNotaServico.RLPDFFilter1.FilterPages(fRelDanfe_NFSe_CB.RLReport1.Pages,1,-1,'',0);
    end;
    fRelDanfe_NFSe_CB.RLReport1.Free;
    fRelDanfe_NFSe_CB.Destroy;
  end
  else
  begin
    fRelDanfe_NFSe_SL                   := TfRelDanfe_NFSe_SL.Create(Self);
    fRelDanfe_NFSe_SL.fDMCadNotaServico := fDMCadNotaServico;
    if Tipo = 'I' then
      fRelDanfe_NFSe_SL.RLReport1.PreviewModal
    else
    begin
      //vNomeArqPdf := 'C:\a\aaa.pdf';
      fRelDanfe_NFSe_SL.RLReport1.Prepare;
      fRelDanfe_NFSe_SL.RLReport1.SaveToFile(vNomeArqPdf);
      fDMCadNotaServico.RLPDFFilter1.FileName := vNomeArqPdf;
      fDMCadNotaServico.RLPDFFilter1.FilterPages(fRelDanfe_NFSe_SL.RLReport1.Pages,1,-1,'',0);
    end;
    fRelDanfe_NFSe_SL.RLReport1.Free;
    fRelDanfe_NFSe_SL.Destroy;
  end;
end;

procedure TfrmCadNotaServico.prc_Imprimir_Matricial_1(vArq: String);
var
  vTexto1, vTexto2: String;
  f: TextFile;
  i, j: Word;
  vCaminhoImp: String;
  vVlrIRAux: Real;
begin
  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                      fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString;
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  if fDMCadNotaServico.cdsNotaServico_Imp.IsEmpty then
   Exit;

  AssignFile(F,vArq);
  Rewrite(F);
  Write(F,'2',#18);

//  WriteLn(F);
  vTexto1 := Formatar_Campo('',67);
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  WriteLn(F,vTexto1);

  for i := 1 to 6 do
    WriteLn(F);

  vTexto1 := Formatar_Campo('',59);
  vTexto1 := vTexto1 + '';
  WriteLn(F,vTexto1);

  vTexto1 := Formatar_Campo('',59);
  vTexto1 := vTexto1 + '';
  WriteLn(F,vTexto1);

  vTexto1 := Formatar_Campo('',59);
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsString;
  WriteLn(F,vTexto1);

  for i := 1 to 3 do
    WriteLn(F);

  vTexto1 := '              ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNOME_CLIENTE.AsString;
  WriteLn(F,vTexto1);
  vTexto1 := '              ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpENDERECO_CLI.AsString + ', ' +
            fDMCadNotaServico.cdsNotaServico_ImpNUM_END_CLI.AsString + ' - ' +
            fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END.AsString;
  WriteLn(F,vTexto1);
  vTexto1 := '              ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCIDADE_CLI.AsString,70 - Length(vTexto1)) +
            fDMCadNotaServico.cdsNotaServico_ImpUF_CLI.AsString;
  WriteLn(F,vTexto1);
  vTexto1 := '              ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,47 - Length(vTexto1)) +
            fDMCadNotaServico.cdsNotaServico_ImpINSC_MUNICIPAL_CLI.AsString;
  WriteLn(F,vTexto1);

  vTexto1 := '              ';
  if (fDMCadNotaServico.cdsCondPgto.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONDPGTO.AsInteger,[loCaseInsensitive])) and
     (fDMCadNotaServico.cdsCondPgtoIMPRIMIR_NFSE.AsString = 'S') then
  begin
    if fDMCadNotaServico.cdsNotaServico_ImpTIPO_PRAZO.AsString = 'V' then
      vTexto1 := vTexto1 + '(Pagamento a Vista)'
    else
    begin
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
      fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.First;
      while not fDMCadNotaServico.cdsNotaServico_Imp_Parc.Eof do
      begin
        if trim(vTexto1) <> '' then
          vTexto1 := vTexto1 + '  -  ';
        vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_Imp_ParcDTVENCIMENTO.AsString + ' R$' +
                   FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ParcVLR_VENCIMENTO.AsFloat);
        fDMCadNotaServico.cdsNotaServico_Imp_Parc.Next;
      end;
    end;
  end;
  WriteLn(F,vTexto1);

  for i := 1 to 3 do
    WriteLn(F);

////////////////////////////////ITENS DA NOTA
  j := 0;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;
  while not fDMCadNotaServico.cdsNotaServico_Imp_Itens.Eof do
  begin
    inc(j);
    vTexto1 := '   ';
    vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString,64 - Length(vTexto1));
    vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_TOTAL.AsFloat);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := ' ' + vTexto2;
    vTexto1 := vTexto1 + vTexto2;
    WriteLn(F,vTexto1);
    fDMCadNotaServico.cdsNotaServico_Imp_Itens.Next;
  end;

  for i := 1 to 5 - j do
    WriteLn(F);

   vTexto2 := '';

///////////////////////////////RETENÇÃO
//  writeLn(F,fDMCadNotaServico.fnc_Montar_Obs_Retencao);
  j := 0;
  vTexto1 := '';
  if (fDMCadNotaServico.cdsNotaServico_ImpRETEM_INSS.AsString = 'S') or
     (fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat > 0)  then
  begin
    WriteLn(F,'   RETENCOES');

    vVlrIRAux := 0;
    if fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat > 0 then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_IR.AsFloat) + '% IRRF ';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_INSS.AsString = 'S' then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_INSS.AsFloat) + '% INSS';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_INSS.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_PISCOFINS.AsString = 'S' then
    begin
      //09/05/2022
      //vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_PIS.AsFloat) + '% PIS + ';
      //vTexto1 := vTexto1 + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_COFINS.AsFloat) + '% COFINS ';
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_PIS.AsFloat) + '% PIS + ';
      vTexto1 := vTexto1 + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_COFINS.AsFloat) + '% COFINS ';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_PIS.AsFloat + fDMCadNotaServico.cdsNotaServico_ImpVLR_COFINS.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_CSLL.AsString = 'S' then
    begin
      //09/05/2022  Cleomar
      //vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_CSLL.AsFloat) + '% CSLL';
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_CSLL.AsFloat) + '% CSLL';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_CSLL.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsCurrency > 0 then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_ALIQUOTA.AsFloat) + '% ISS';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    vTexto1 := '   VALOR LIQUIDO';
    for i := 1 to 48 - Length(vTexto1) do
      vTexto1 := vTexto1 + '.';
    vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_LIQUIDO_NFSE.AsFloat);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := ' ' + vTexto2;
    WriteLn(F,vTexto1 + vTexto2);
  end;
  for i := 1 to 5 - j do
    WriteLn(F);

//////////////////////////// OBSREVAÇÕES DA NOTA
  vTexto1 := '';
  if trim(fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value) <> '' then
    vTexto1 := UpperCase(fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value);

  j := 0;
  while vTexto1 <> '' do
  begin
    WriteLn(F,' ' + Copy(vTexto1,1,58));
    Delete(vTexto1,1,58);
    inc(j);
  end;
  for i := 1 to 3 - j do
    WriteLn(F);

//////////////////////////// OPTANTE DO SIMPLES
  vTexto1 := '';
  if fDMCadNotaServico.cdsFilialSIMPLES.AsString = 'S' then
    if trim(fDMCadNotaServico.cdsParametrosOBS_SIMPLES.AsString) <> '' then
      vTexto1 := '"' + UpperCase(Trim(fDMCadNotaServico.cdsParametrosOBS_SIMPLES.Value)) + '"';

  j := 0;
  while vTexto1 <> '' do
  begin
    WriteLn(F,' ' + Copy(vTexto1,1,54));
    Delete(vTexto1,1,54);
    inc(j);
  end;
  for i := 1 to 3 - j do
    WriteLn(F);

///////////////////////////////TOTAIS DA NOTA
  WriteLn(F);
  vTexto1 := '      ';
  if fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS.AsFloat > 0 then
  begin
    vTexto1 := vTexto1 + Formatar_Campo(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_ALIQUOTA.AsFloat),24 - Length(vTexto1));
    vTexto1 := vTexto1 + Formatar_Campo(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS.AsFloat),64 - Length(vTexto1));
  end
  else
  begin
    vTexto1 := vTexto1 + Formatar_Campo('XXXXX',24);
    vTexto1 := vTexto1 + Formatar_Campo('XXXXX',64 - Length(vTexto1));
  end;
  vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_SERVICOS.AsFloat);
  for i := 1 to 10 - length(vTexto2) do
    vTexto2 := ' ' + vTexto2;
  vTexto1 := vTexto1 + vTexto2;
  WriteLn(F,vTexto1);

  for i := 1 to 3 do
    WriteLn(F);

  vTexto1 := '        ';
//  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  WriteLn(F,vTexto1);

/////////////////////////////SALTO DE PÁGINA
  for i := 1 to 6 do
    WriteLn(F);

  CloseFile(F);
end;

procedure TfrmCadNotaServico.prc_Gravar_Itens(ID_Servico: Integer;
  Vlr_Unitario: Real; Somar_Diminuir,Calc_Inss, Calc_Issqn, Calc_PisCofins, Calc_Csll, Calc_IR: String);
begin
  fDMCadNotaServico.prc_Inserir_Itens;
  fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger    := ID_Servico;
  fDMCadNotaServico.cdsNotaServico_ItensQTD.AsInteger               := 1;
  fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat        := Vlr_Unitario;
  fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat           := StrToCurr(FormatCurr('0.00',fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat *
                                                                       fDMCadNotaServico.cdsNotaServico_ItensQTD.AsInteger));
  fDMCadNotaServico.cdsNotaServico_ItensSOMAR_DIMINUIR.AsString     := Somar_Diminuir;
  fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_INSS.AsString      := Calc_Inss;
  fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_ISSQN.AsString     := Calc_Issqn;
  fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_CSLL.AsString      := Calc_Csll;
  fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_IR.AsString        := Calc_IR;
  fDMCadNotaServico.cdsNotaServico_ItensCALCULAR_PISCOFINS.AsString := Calc_PisCofins;
  if fDMCadNotaServico.cdsServico_Int.Locate('ID',fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger,[loCaseInsensitive]) then
    fDMCadNotaServico.cdsNotaServico_ItensNOME_SERVICO_INT.AsString := fDMCadNotaServico.cdsServico_IntNOME.AsString;
  fDMCadNotaServico.cdsNotaServico_Itens.Post;
end;

procedure TfrmCadNotaServico.btnRecalcularClick(Sender: TObject);
begin
  if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoBASE_CSRF.AsFloat)) > 0 then
  begin
    fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString      := 'S';
    fDMCadNotaServico.cdsNotaServicoRETEM_PISCOFINS.AsString := 'S';
  end;
  fDMCadNotaServico.vPerc_Trib_Maior := 0;
  fDMCadNotaServico.vPerc_Trib_2     := False;
  fDMCadNotaServico.cdsFilial.Close;
  fDMCadNotaServico.cdsFilial.Open;
  fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,[loCaseInsensitive]);
  fDMCadNotaServico.cdsNotaServico_Itens.First;
  while not fDMCadNotaServico.cdsNotaServico_Itens.Eof do
  begin
    if (fDMCadNotaServico.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'I') and (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I') then
    begin
      if (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.vPerc_Trib_Maior)) > 0) and
         (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat)) > 0) and
         (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.vPerc_Trib_Maior)) <>
         StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat))) then
        fDMCadNotaServico.vPerc_Trib_2 := True;
      if fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat > fDMCadNotaServico.vPerc_Trib_Maior then
        fDMCadNotaServico.vPerc_Trib_Maior := fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat;
    end;
    fDMCadNotaServico.cdsNotaServico_Itens.Edit;
    fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat := StrToCurr(FormatCurr('0.00',fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat *
                                                               fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat));
    fDMCadNotaServico.cdsNotaServico_Itens.Post;
    fDMCadNotaServico.cdsNotaServico_Itens.Next;
  end;
  fDMCadNotaServico.prc_Recalcular;
  fDMCadNotaServico.prc_Calcular_Impostos;
end;

procedure TfrmCadNotaServico.prc_Calcula_FatMensal;
var
  vAux: Real;
begin
  if pnlFaturado.Visible then
  begin
    vAux := 0;
    if trim(RxDBLookupCombo3.Text) <> '' then
     vAux := fDMCadNotaServico.fnc_Vlr_Fat_Mensal_Cli(fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,RxDBLookupCombo3.KeyValue,
             YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime),MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime),
             fDMCadNotaServico.cdsNotaServicoNUMRPS.AsInteger);
    NxNumberEdit1.Value := vAux;
    if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger then
      fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,[loCaseInsensitive]);
    vAux := StrToCurr(FormatCurr('0.00',fDMCadNotaServico.cdsFilialVLR_FATURAMENTO_MES_CSRF.AsFloat - vAux));
    if StrToFloat(FormatFloat('0.00',vAux)) <= 0 then
      vAux := StrToFloat(FormatFloat('0.00',0));
    NxNumberEdit2.Value := StrToFloat(FormatFloat('0.00',vAux));
  end;
end;

procedure TfrmCadNotaServico.NxNumberEdit1GlyphClick(Sender: TObject);
begin
  ffrmConsFat_Mensal := TfrmConsFat_Mensal.Create(self);
  ffrmConsFat_Mensal.vID_Cliente := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger;
  ffrmConsFat_Mensal.ShowModal;
  FreeAndNil(ffrmConsFat_Mensal);
end;

procedure TfrmCadNotaServico.RzDBCheckBox1Click(Sender: TObject);
begin
  if not Assigned(fDMCadNotaServico) then
    exit;
  if (fDMCadNotaServico.cdsNotaServico.Active) and (fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) and
     not(fDMCadNotaServico.cdsNotaServico_Itens.IsEmpty) then
  begin
    if RzDBCheckBox1.Checked then
      fDMCadNotaServico.cdsNotaServicoDIMINUIR_RETENCAO.AsString := 'S'
    else
      fDMCadNotaServico.cdsNotaServicoDIMINUIR_RETENCAO.AsString := 'N';
    btnRecalcularClick(Sender);
  end;
end;

procedure TfrmCadNotaServico.prc_Gravar_Envio_Email;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    sds.Close;
    sds.CommandText   := 'UPDATE NOTASERVICO SET EMAIL_ENVIADO = ' + QuotedStr('S')
                       + ' WHERE ID = ' + fDMCadNotaServico.cdsNotaServico_ImpID.AsString;
    sds.ExecSQL();
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.btnConsNotasClick(Sender: TObject);
var
  dtInicial, dtFinal: String;
  vCnpjAux: String;
begin
  if fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger > 0 then
    vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger
  else
  if RxDBLookupCombo1.Text <> '' then
    vFilial_Sel := RxDBLookupCombo1.KeyValue;

  if vFilial_Sel <= 0 then
  begin
    MessageDlg('*** Filial não selecionada!', mtError, [mbOk], 0);
    exit;
  end;

  if fDMCadNotaServico.cdsFilialID.AsInteger <> vFilial_Sel then
    fDMCadNotaServico.cdsFilial.Locate('ID',vFilial_Sel,[loCaseInsensitive]);

  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

  dtInicial := FormatDateTime('yyyy-mm-dd', incmonth(now,-1));
  dtFinal   := FormatDateTime('yyyy-mm-dd', now);

  dtInicial := InputBox('Consulta NFS-e','Informe a data inicial do período de emissão: ', dtInicial);
  dtFinal   := InputBox('Consulta NFS-e','Informe a data final do período de emissão: ', dtfinal);

  if not Assigned(cXMLStream) then
    cXMLStream := TMemoryStream.Create;

  try
    //mmoNFSeRetorno.Lines.LoadFromStream(cXMLStream);

    NFSe_ConsultarNFSe( fnc_LocalServidorNFe,
                        vCnpjAux,
                        dtInicial,
                        dtFinal,
                        cXMLStream );

    cXMLStream.Position := 0;
    //mmoNFSeRetorno.Lines.LoadFromStream(cXMLStream);
    
    //Grava o número da nota e salva xml por nota
    sLista_Nota := TStringList.Create;
    //sLista_Nota := NFSe_ListarNotas_NH(cXMLStream);
    NFSe_ListarNotas(cXMLStream,sLista_Nota);
    prc_Gravar_Autenticidade;

  finally
    FreeAndNil(cXMLStream);
  end;    
end;

procedure TfrmCadNotaServico.prc_Imprimir_Matricial_2(vArq: String);
var
  vTexto1, vTexto2: String;
  f: TextFile;
  i, j: Word;
  vCaminhoImp: String;
  vVlrIRAux: Real;
begin
  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                      fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString;
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  if fDMCadNotaServico.cdsNotaServico_Imp.IsEmpty then
   Exit;

  AssignFile(F,vArq);
  Rewrite(F);
  Write(F,'2',#18);

  for i := 1 to 11 do
    WriteLn(F);

  vTexto1 := Formatar_Campo('',90);
  vTexto1 := vTexto1 + FormatDateTime('DD/MM/YYYY',fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO.AsDateTime);
  WriteLn(F,vTexto1);

  for i := 1 to 4 do
  begin
    WriteLn(F);
  end;

//NOTA / DUPLICATA DECISÃO RH
  vTexto1 := '';
  if fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V' then
  begin
    for i := 1 to 20 do
       vTexto1 := vTexto1 + ' ';
    vTexto1 := vTexto1 + 'PAGAMENTO A VISTA';
    WriteLn(F,vTexto1);
  end
  else
  begin
    fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
    fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
    fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;
    fDMCadNotaServico.cdsNotaServico_Imp_Parc.First;
    while not fDMCadNotaServico.cdsNotaServico_Imp_Parc.Eof do
    begin
      vTexto1 := '';
      for i := 1 to 20 do
        vTexto1 := vTexto1 + ' ';
      vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + ' ';

      vTexto2 := 'R$ ' + FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ParcVLR_VENCIMENTO.AsFloat);
      for i := 1 to 11 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;

      vTexto1 := vTexto1 + vTexto2;
      for i := 1 to 100 - Length(vTexto1) do
        vTexto1 := vTexto1 + ' ';
      vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_Imp_ParcDTVENCIMENTO.AsString;
      WriteLn(F,vTexto1);
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Next;
    end;
  end;

  WriteLn(F);

  vTexto1 := '';
  for i := 1 to 110 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  WriteLn(F,vTexto1);

  for i := 1 to 2 do
    WriteLn(F);

  vTexto1 := '';
  for i := 1 to 35 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNOME_CLIENTE.AsString;
  WriteLn(F,vTexto1);

  vTexto1 := '';
  for i := 1 to 35 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpENDERECO_CLI.AsString + ', ' +
             fDMCadNotaServico.cdsNotaServico_ImpNUM_END_CLI.AsString + ' - ' +
             fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END.AsString;
  WriteLn(F,vTexto1);

  vTexto1 := '';
  for i := 1 to 35 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCIDADE_CLI.AsString,108 - Length(vTexto1)) +
             fDMCadNotaServico.cdsNotaServico_ImpUF_CLI.AsString;
  WriteLn(F,vTexto1);
  WriteLn(F);

  vTexto1 := '';
  for i := 1 to 35 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,108 - Length(vTexto1)) +
            fDMCadNotaServico.cdsNotaServico_ImpINSC_MUNICIPAL_CLI.AsString;
  WriteLn(F,vTexto1);

  for i := 1 to 2 do
    WriteLn(F);

  vTexto1 := '';
  for i := 1 to 35 do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + fDMCadNotaServico.ACBrExtenso1.ValorToTexto(fDMCadNotaServico.cdsNotaServico_ImpVLR_SERVICOS.AsFloat);
  WriteLn(F,vTexto1);

  for i := 1 to 7 do
    WriteLn(F);

  j := 0;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;
  while not fDMCadNotaServico.cdsNotaServico_Imp_Itens.Eof do
  begin
    inc(j);
    vTexto1 := '   ';
    vTexto1 := vTexto1 + Formatar_Campo(Copy(fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString,1,100),115 - Length(vTexto1));
    vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_TOTAL.AsFloat);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := ' ' + vTexto2;
    vTexto1 := vTexto1 + vTexto2;
    WriteLn(F,vTexto1);
    fDMCadNotaServico.cdsNotaServico_Imp_Itens.Next;
  end;

  for i := 1 to 15 - j do  //linhas 37 a
    WriteLn(F);

   vTexto2 := '';

///////////////////////////////RETENÇÃO
//  writeLn(F,fDMCadNotaServico.fnc_Montar_Obs_Retencao);
  j := 0;
  vTexto1 := '';
  if (fDMCadNotaServico.cdsNotaServico_ImpRETEM_INSS.AsString = 'S') or
     (fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat > 0)  then
  begin
    WriteLn(F,'   RETENCOES');
    Inc(j);

    vVlrIRAux := 0;
    if fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat > 0 then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_IR.AsFloat) + '% IRRF ';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_IR.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_INSS.AsString = 'S' then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_INSS.AsFloat) + '% INSS';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_INSS.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_PISCOFINS.AsString = 'S' then
    begin
      //09/05/2022  Cleomar
      //vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_PIS.AsFloat) + '% PIS + ';
      //vTexto1 := vTexto1 + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_COFINS.AsFloat) + '% COFINS ';
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_PIS.AsFloat) + '% PIS + ';
      vTexto1 := vTexto1 + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_COFINS.AsFloat) + '% COFINS ';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_PIS.AsFloat + fDMCadNotaServico.cdsNotaServico_ImpVLR_COFINS.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpRETEM_CSLL.AsString = 'S' then
    begin
      //09/05/2022  Cleomar
      //vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsFilialPERC_CSLL.AsFloat) + '% CSLL';
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_CSLL.AsFloat) + '% CSLL';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_CSLL.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    if fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsCurrency > 0 then
    begin
      vTexto1 := '    ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServico_ImpPERC_ALIQUOTA.AsFloat) + '% ISS';
      vTexto2 := FormatFloat('#,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_ISS_RETIDO.AsFloat);
      for i := 1 to 8 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      for i := 1 to 50 - Length(vTexto1) do
        vTexto1 := vTexto1 + '.';
      WriteLn(F,vTexto1+vTexto2);
      Inc(j);
    end;

    vTexto1 := '   VALOR LIQUIDO';
    for i := 1 to 48 - Length(vTexto1) do
      vTexto1 := vTexto1 + '.';
    vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_LIQUIDO_NFSE.AsFloat);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := ' ' + vTexto2;
    WriteLn(F,vTexto1 + vTexto2);
    Inc(j);
  end;
  for i := 1 to 10 - j do
    WriteLn(F);

///////////////////////////////TOTAIS DA NOTA
  vTexto1 := '';
  for i := 1 to 115 do
    vTexto1 := vTexto1 + ' ';
  vTexto2 := FormatFloat('###,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_SERVICOS.AsFloat);
  for i := 1 to 10 - length(vTexto2) do
    vTexto2 := ' ' + vTexto2;
  vTexto1 := vTexto1 + vTexto2;
  WriteLn(F,vTexto1);

/////////////////////////////SALTO DE PÁGINA
  for i := 1 to 4 do
    WriteLn(F);

  CloseFile(F);
end;

procedure TfrmCadNotaServico.RzPageControl1Change(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServico.State in [dsEdit, dsInsert] then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      prc_Opcao_Prazo;
      fDMCadNotaServico.prc_Abrir_Contas(SQLLocate('FILIAL','ID','CNPJ_CPF',fDMCadNotaServico.cdsNotaServicoFILIAL.AsString));
    end;
  end
  else
  if not(fDMCadNotaServico.cdsNotaServico.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) or
         (fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_NotaFiscal;
      prc_Opcao_Prazo;
      fDMCadNotaServico.prc_Abrir_Contas(SQLLocate('FILIAL','ID','CNPJ_CPF',fDMCadNotaServico.cdsNotaServicoFILIAL.AsString));
      fDMCadNotaServico.prc_Abrir_Natureza;
      prc_Opcao_Habilita;
      if fDMCadNotaServico.cdsFilialUSA_ATIVIDADE_CID_SERV.AsString = 'S' then
        fDMCadNotaServico.prc_Abrir_Atividade(fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger);
    end;
  end;
  NxNumberEdit1.Clear;
  NxNumberEdit2.Clear;
  pnlFaturado.Visible := (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsFilialVLR_FATURAMENTO_MES_CSRF.AsFloat)) > 0);
  pnlCidadeTrib.Visible := (fDMCadNotaServico.cdsFilialENVIO_NFSE.AsString = 'C');
end;

procedure TfrmCadNotaServico.btnConsRpsClick(Sender: TObject);
var
  NumeroRPS, SerieRPS, TipoRPS, NumLoteRPS: String;
  vCnpjAux: String;
  vID_Aux: Integer;
  vChaveAcessoCB: String;
  vPasta, vArqTemp: String;
  vAnoAux, vMesAux: Integer;
begin
  if not(fDMCadNotaServico.cdsNotaServico_Consulta.Active) or (fDMCadNotaServico.cdsNotaServico_Consulta.IsEmpty) then
    exit;
  if vEnvioACBR then
  begin
    fDMNFSe    := TdmNFSe.Create(Self);
    try
      fDMCadNotaServico.cdsNotaServico_Imp.Close;
      fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                          IntToStr(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
      fDMCadNotaServico.cdsNotaServico_Imp.Open;
      fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
      fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
      fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
      fDMNFSe.fDMCadNotaServico := fDMCadNotaServico;
      fDMNFSe.ConfigurarComponente;
      fDMNFSe.prc_Abrir_NotaServico_Comunicacao(fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger);
      //fdmNFSe.ConsultaNfse;
    finally
      FreeAndNil(fDMNFSe);
    end;
    Abort;
  end;

  if (fDMCadNotaServico.cdsNotaServico_ConsultaNUMRPS.AsInteger <= 0) and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM')
    and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'PORTO ALEGRE') then
  begin
    MessageDlg('*** Não existe nota selecionada!', mtInformation, [mbOk], 0);
    exit;
  end;
  if (fDMCadNotaServico.cdsNotaServico_ConsultaCOD_AUTENCIDADE_RET.AsString <> '') and not(fDMCadNotaServico.cdsNotaServico_ConsultaCOD_AUTENCIDADE_RET.IsNull) then
  begin
    MessageDlg('*** Nota já está autorizada!', mtInformation, [mbOk], 0);
    exit;
  end;
  vID_Aux := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  if fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger > 0 then
    vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger
  else
  if RxDBLookupCombo1.Text <> '' then
    vFilial_Sel := RxDBLookupCombo1.KeyValue;

  if vFilial_Sel <= 0 then
  begin
    MessageDlg('*** Filial não selecionada!', mtError, [mbOk], 0);
    exit;
  end;

  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

  NumeroRPS   := fDMCadNotaServico.cdsNotaServico_ConsultaNUMRPS.AsString;
  SerieRPS    := fDMCadNotaServico.cdsNotaServico_ConsultaSERIE.AsString;
  { Tipo RPS: 1 - RPS
              2 - Nota Fiscal Conjugada (Mista)
              3 - Cupom Fiscal }
  TipoRPS     := fDMCadNotaServico.cdsNotaServico_ConsultaTIPO_RPS.AsString;
  NumLoteRPS  := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsString;

  vChaveAcessoCB := fDMCadNotaServico.cdsNotaServico_ConsultaCHAVE_ACESSO.AsString;

  if fDMCadNotaServico.cdsFilialID.AsInteger <> vFilial_Sel then
    fDMCadNotaServico.cdsFilial.Locate('ID',vFilial_Sel,[loCaseInsensitive]);

  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') then
  begin
    //NumLoteRPS := InputBox('Consulta RPS','Informe o número do lote: ', NumLoteRPS);
    //SerieRPS   := InputBox('Consulta RPS','Informe a série lote: ', SerieRPS);
    //TipoRPS    := InputBox('Consulta RPS','Informe o tipo do lote: ', TipoRPS);

    cXMLStream := TMemoryStream.Create;
    try
      NFSe_ConsultarNFSeRPS( 'localhost',
                             vCnpjAux,
                             NumLoteRPS,
                             SerieRPS,
                             TipoRPS,
                             cXMLStream );
      cXMLStream.Position := 0;
      vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServico_ConsultaDTEMISSAO_CAD.AsDateTime);
      vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServico_ConsultaDTEMISSAO_CAD.AsDateTime);
      vArqTemp := Monta_Diretorio('X',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

      if FileExists(vArqTemp) then
        DeleteFile(vArqTemp);

      cXMLStream.SaveToFile(vArqTemp);
      uXMLNFSe_PortoAlegre.prc_Carregar(vArqTemp);
      prc_Gravar_Autenticidade;

    finally
      FreeAndNil(cXMLStream);
    end;
  end
  else
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') then
  begin
    vChaveAcessoCB := InputBox('ObterNota','Informe o número da chave de acesso: ', vChaveAcessoCB );

    cXMLStream := TMemoryStream.Create;
    try
      NFSe_ObterNota( 'localhost',
                      vCnpjAux,
                      vChaveAcessoCB,
                      cXMLStream );
      cXMLStream.Position := 0;
      //mmoNFSeRetorno.Lines.LoadFromStream(cXMLStream);
      vPasta := ExtractFilePath(Application.ExeName) + 'Temp';
      if not DirectoryExists(vPasta) then
        CreateDir(vPasta);
      vArqTemp := vPasta + '\XMLNFSe_' + FormatDateTime('YYYYMMDD',Date) +  '_' + FormatDateTime('HHMMSS',Time) + '.xml';
      if FileExists(vArqTemp) then
        DeleteFile(vArqTemp);
      cXMLStream.SaveToFile(vArqTemp);
      uXMLNFSe_CampoBom.prc_Carregar_Campo_Bom(vArqTemp);
      if FileExists(vArqTemp) then
        DeleteFile(vArqTemp);
      prc_Gravar_Autenticidade;
    finally
      FreeAndNil(cXMLStream);
    end;

  end
  else
  begin
    if not Assigned(cXMLStream) then
      cXMLStream := TMemoryStream.Create;
    try
      NFSe_ConsultarNFSeRPS( fnc_LocalServidorNFe,
                             vCnpjAux,
                             NumeroRPS,
                             SerieRPS,
                             TipoRPS,
                             cXMLStream );
      cXMLStream.Position := 0;
      //Grava o número da nota e salva xml por nota
      sLista_Nota := TStringList.Create;
      //sLista_Nota := NFSe_ListarNotas_NH(cXMLStream);
      NFSe_ListarNotas(cXMLStream,sLista_Nota);
      prc_Gravar_Autenticidade(True);
      vID_Aux := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
    finally
      FreeAndNil(cXMLStream);
    end;
  end;
  prc_Consultar(0);
  if vID_Aux > 0 then
    fDMCadNotaServico.cdsNotaServico_Consulta.Locate('ID',vID_Aux,[loCaseInsensitive]);
end;

procedure TfrmCadNotaServico.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    DBEdit8.ReadOnly      := not(DBEdit8.ReadOnly);
    dbedtNumNota.ReadOnly := not(dbedtNumNota.ReadOnly);
    dbedtSerie.ReadOnly   := not(dbedtSerie.ReadOnly);
  end;
end;

procedure TfrmCadNotaServico.rxdbVendedorExit(Sender: TObject);
begin
  if not fDMCadNotaServico.cdsVendedor.Active then
    exit;
  if (rxdbVendedor.Text <> '') and ((vID_Vendedor_Ant <> rxdbVendedor.KeyValue) or
     (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat)) <= 0)) then
  begin
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsVendedorPERC_COMISSAO_VEND.AsFloat)) > 0) then
      fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsVendedorPERC_COMISSAO_VEND.AsFloat));
  end;
end;

procedure TfrmCadNotaServico.rxdbVendedorEnter(Sender: TObject);
begin
  FDMCadNotaServico.cdsVendedor.IndexFieldNames := 'NOME';
  vID_Vendedor_Ant := 0;
  if rxdbVendedor.Text <> '' then
    vID_Vendedor_Ant := rxdbVendedor.KeyValue;
end;

procedure TfrmCadNotaServico.btnExcluirParcelasClick(Sender: TObject);
begin
  if (fDMCadNotaServico.cdsNotaServico_Parc.IsEmpty) or (fDMCadNotaServico.cdsNotaServico_ParcID.AsInteger <= 0) then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadNotaServico.cdsNotaServico_Parc.Delete;
end;

procedure TfrmCadNotaServico.btnGerarParcelasClick(Sender: TObject);
begin
  if not fDMCadNotaServico.fnc_Gerar_NotaServico_Parc then
    MessageDlg(fDMCadNotaServico.vMsgErroParc, mtError, [mbOk], 0);
end;

procedure TfrmCadNotaServico.dbVlr_EntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if trim(dbVlr_Entrada.Text) <> '' then
      fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat := StrToFloat(dbVlr_Entrada.Text)
    else
      fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat := 0;
    btnGerarParcelasClick(Sender);
  end;
end;

procedure TfrmCadNotaServico.rxdbConta_OrcamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vID_ContaOrcamento_Pos := fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger;
    frmSel_ContaOrc := TfrmSel_ContaOrc.Create(Self);
    frmSel_ContaOrc.ShowModal;
    fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger := vID_ContaOrcamento_Pos;
    FreeAndNil(frmSel_ContaOrc);
  end;
end;

procedure TfrmCadNotaServico.rxdbVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger := uUtilForm.fnc_Chamar_Form_SelPessoa('V',fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger,'');
end;

procedure TfrmCadNotaServico.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if (RxDBLookupCombo4.Text <> '') and (RxDBLookupCombo4.KeyValue <> fDMCadNotaServico.cdsNaturezaID.AsInteger) then
    fDMCadNotaServico.cdsNatureza.Locate('ID',RxDBLookupCombo4.KeyValue,[loCaseInsensitive]);
  if fDMCadNotaServico.cdsParametrosCONTROLAR_ISSQN_RET.AsString <> 'C' then
  begin
    if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaRETER_ISSQN.AsString = 'S') then
      fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString := '1'
    else
    if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaRETER_ISSQN.AsString <> 'S') then
      fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString := '2';
  end;
  //11/05/2022
  //if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString = 'B') then
    //fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := 0;
end;

procedure TfrmCadNotaServico.rxdbCondicaoPgtoEnter(Sender: TObject);
begin
  fDMCadNotaServico.cdsCondPgto.IndexFieldNames := 'NOME';
  vCodPagamento := fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger;
end;

procedure TfrmCadNotaServico.rxdbTipoCobrancaEnter(Sender: TObject);
begin
  fDMCadNotaServico.cdsTipoCobranca.IndexFieldNames := 'NOME';
end;

procedure TfrmCadNotaServico.rxdbConta_OrcamentoEnter(Sender: TObject);
begin
  fDMCadNotaServico.cdsContaOrcamento.IndexFieldNames := 'CODIGO';
end;

procedure TfrmCadNotaServico.Panel5Enter(Sender: TObject);
begin
  vID_Cliente_Ant := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger;
  vID_Servico_Ant := fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger;
end;

procedure TfrmCadNotaServico.btnObsClick(Sender: TObject);
begin
  ffrmCadNotaServico_Obs := TfrmCadNotaServico_Obs.Create(self);
  ffrmCadNotaServico_Obs.fDMCadNotaServico := fDMCadNotaServico;
  ffrmCadNotaServico_Obs.ShowModal;
  FreeAndNil(ffrmCadNotaServico_Obs);
end;

function TfrmCadNotaServico.fnc_Dados_OK: Boolean;
var
  vMSGAux: String;
  vClienteAux: String;
begin
  Result  := False;
  vMSGAux := '';
  if not fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]) then
    vMSGAux := '*** Cliente não encontrado!';
  vClienteAux := TirarAcento(fDMCadNotaServico.cdsClienteNOME.AsString);
  if ((StrToFloat(FormatFloat('0.00',vValorServico_Ret))) <>
     (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_TOTAL.AsFloat)))) or
     (vClienteAux <> vNomeCliente_Ret) then
    vMSGAux := '*** Valor do serviço XML: ' + FormatFloat('0.00',vValorServico_Ret) + #13
             + '*** Nome Cliente XML: ' + vNomeCliente_Ret + #13 + #13
             + '*** Valor do serviço na nota: ' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_TOTAL.AsFloat) + #13
             + '*** Nome Cliente na nota: ' + fDMCadNotaServico.cdsClienteNOME.AsString + #13 + #13;
  if trim(vMSGAux) <> '' then
  begin
    MessageDlg(vMSGAux, mtInformation, [mbOk], 0);
    exit;
  end;
  Result := True;
end;

function TfrmCadNotaServico.Replace(Str, Ant, Novo: string): string;
var
  iPos: Integer;
begin
  while Pos(Ant, Str) > 0 do
  begin
    iPos := Pos(Ant, Str);
    Str := copy(Str, 1, iPos - 1) + Novo + copy(Str, iPos + 1, Length(Str) - iPos);
  end;
  Result := Str;
end;

procedure TfrmCadNotaServico.prc_Opcao_Habilita;
begin
  Label8.Visible           := (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM');
  RxDBLookupCombo4.Visible := (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM');

  Label34.Visible          := (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM');
  RxDBLookupCombo5.Visible := (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM');

  DBEdit43.Visible         := ((fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger = fDMCadNotaServico.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) and
                               (fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger > 0));
end;

procedure TfrmCadNotaServico.prc_Le_fCds;
var
  vGravar: Boolean;
  vHomologacaoAux: String;
  vID_Mov: Integer;
  vAnoAux, vMesAux: Integer;
  vTexto, vTexto2: String;
  sds: TSQLDataSet;
  vSerie_Ret: String;
  vCNPJPref: String;
  vCNPJSis: String;
  vDtEmissao: TDate;
  vHora: TTime;
  vDtEmissaoHora: String;
begin
  //31/05/2017
  //if ckHomologacao.Checked then
  if fDMCadNotaServico.cdsFilialNFSE_HOMOLOGACAO.AsString = 'S' then
    vHomologacaoAux := 'S'
  else
    vHomologacaoAux := 'N';

  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
    NFSeCB     := TXMLClientDataset_NFSE_CampoBom.Create
  else
    NFSePoaRet := TXCDS_NFSe_POA_Retorno.Create;
  sXMLNFSe := TMemoryStream.Create();
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    FCds.First;
    while not FCds.Eof do
    begin
      if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
      begin
        //aqui verificar as datas de campo bom.
        vNum_NFSe_Ret        := FCds.FieldByName('ID.nNFS-e').AsInteger;
        vChave_NFSe          := FCds.FieldByName('ID.refNF').AsString;
        vCod_Autencidade_Ret := 'OK';
        vDtEmissao           := FCds.FieldByName('ID.dEmi').AsDateTime;
        vDtEmissaoHora       := FCds.FieldByName('ID.dEmi').AsString + ' ' + FCds.FieldByName('ID.hEmi').AsString;

        if (trim(FCds.FieldByName('ID.hEmi').AsString) <> '') then
          vHora := StrToTime(FormatDateTime('hh:mm',FCds.FieldByName('ID.hEmi').AsDateTime))
        else
          vHora := Now;
      end
      else
      begin
        vTexto := FCds.FieldByName('Numero').AsString;
        vTexto2 := copy(vTexto,1,4) + copy(vTexto,11,5);

        vNum_NFSe_Ret        := StrToInt(vTexto2);
        vNum_RPS_Ret         := FCds.FieldByName('IdentificacaoRps.Numero').AsInteger;
        vCod_Autencidade_Ret := FCds.FieldByName('CodigoVerificacao').AsString;
        vDtEmissao_Ret       := FCds.FieldByName('DataEmissao').AsString;
        vSerie_Ret           := FCds.FieldByName('IdentificacaoRps.Serie').AsString;

        vChave_NFSe          := 'OK';
      end;
      vGravar := True;
      if (vNum_NFSe_Ret > 0) and (Trim(vChave_NFSe) <> '') then
      begin
        try
          if vFilial_Sel <= 0 then
            vFilial_Sel := 1;
          fDMCadNotaServico.cdsNotaServico.Close;
          if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
          begin
            fDMCadNotaServico.sdsNotaServico.CommandText := fDMCadNotaServico.ctCommand + ' WHERE NUMNOTA = ' +
                                                            IntToStr(vNum_NFSe_Ret) + ' AND FILIAL = ' + IntToStr(vFilial_Sel) +
                                                            ' AND TIPO_ES = ''S'''
          end
          else
          begin
            if trim(vSerie_Ret) = '' then
              vSerie_Ret := trim(fDMCadNotaServico.cdsFilialSERIE_NFSE.AsString);
            fDMCadNotaServico.sdsNotaServico.CommandText := fDMCadNotaServico.ctCommand + ' WHERE NUMRPS = ' +
                                                            IntToStr(vNum_RPS_Ret) + ' AND FILIAL = ' + IntToStr(vFilial_Sel) +
                                                            ' AND SERIE = ' + QuotedStr(vSerie_Ret) +
                                                            ' AND TIPO_ES = ''S''';

          end;
          fDMCadNotaServico.cdsNotaServico.Open;

          //24/03/2016
          if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
          begin
            if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
              fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);

            if fDMCadNotaServico.cdsClientePESSOA.AsString = 'F' then
              vCNPJPref := FCds.FieldByName('TomS.CPF').AsString
            else
              vCNPJPref := FCds.FieldByName('TomS.CNPJ').AsString;
            vCNPJSis := Monta_Numero(fDMCadNotaServico.cdsClienteCNPJ_CPF.AsString,0);
            if (StrToFloat(FormatFloat('0.00',FCds.FieldByName('total.vtLiq').AsFloat)) <> StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_LIQUIDO_NFSE.AsFloat)))
              or (vCNPJPref <> vCNPJSis) then
            begin
              MessageDlg('*** Nome ou valor não corresponde ao autorizado!'
                 + #13 + 'Cliente no sistema: ' + fDMCadNotaServico.cdsClienteNOME.AsString
                 + #13 + 'Cliente autorizado na prefeitura: ' + FCds.FieldByName('TomS.xNome').AsString
                 + #13 + 'CNPJ/CPF no sistema: ' + vCNPJSis
                 + #13 + 'CNPJ/CPF autorizado na prefeitura: ' + vCNPJPref
                 + #13 + 'Valor no sistema:' + FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_LIQUIDO_NFSE.AsFloat)
                 + #13 + 'Valor autorizado na prefeitura:' + FormatFloat('0.00',FCds.FieldByName('total.vtLiq').AsFloat)
                 , mtInformation, [mbOk], 0);
              vGravar := False;
            end
          end;  

          if ((trim(fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.AsString) = '') or (fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.IsNull)) and
             not(fDMCadNotaServico.cdsNotaServico.IsEmpty) and (vGravar)  then
          begin
            fDMCadNotaServico.cdsNotaServico.Edit;
            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
            begin   //01/09/2018  aqui
              fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime := vDtEmissao;
              fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsString       := vDtEmissaoHora;
            end
            else
            begin
              fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime := Date;
              fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime     := Now;
            end;
            fDMCadNotaServico.cdsNotaServicoDT_EMISSAO_RET.AsString      := FormatDateTime('dd-mm-yyyy hh:mm',now);
            fDMCadNotaServico.cdsNotaServicoCOD_AUTENCIDADE_RET.AsString := vCod_Autencidade_Ret;
            fDMCadNotaServico.cdsNotaServicoCHAVE_ACESSO.AsString        := vChave_NFSe;

            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
            begin
              fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger := vNum_NFSe_Ret;
              //NFSePoaRet.GerarXML(fCds, sXMLNFSe, False);

              fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger := vNum_NFSe_Ret;

              vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
              vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
              vNomeArquivo := Monta_Diretorio('X',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);
              if FileExists(vNomeArquivo) then
                DeleteFile(vNomeArquivo);
              cXMLStream.SaveToFile(vNomeArquivo);
              fDMCadNotaServico.cdsNotaServicoXML.LoadFromFile(vNomeArquivo);
            end
            else
            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
            begin
              if StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_CSLL.AsFloat)) <= 0 then
                fDMCadNotaServico.cdsNotaServicoRETEM_CSLL.AsString := 'N';
              //vData := Date;
              if trim(vProtocolo_Ret2) <> '' then
              begin
                fDMCadNotaServico.cdsNotaServicoPROTOCOLO.AsString         := fDMCadNotaServico.cdsNotaServico_LotePROTOCOLO.AsString;
                fDMCadNotaServico.cdsNotaServicoDTRECEBIMENTO_RET.AsString := FormatDateTime('dd-mm-yyyy hh:mm',Now);
              end;
              NFSeCB.GerarXML(fCds, sXMLNFSe, False);
              sXMLNFSe.position := 0;
              fDMCadNotaServico.cdsNotaServicoXML.LoadFromStream(sXMLNFSe);
            end;

            if fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger <> fDMCadNotaServico.cdsServicoID.AsInteger then
              fDMCadNotaServico.cdsServico.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger,[loCaseInsensitive]);

            //03/05/2022 vai gravar o total e não o líquido no movimento  
            //vID_MOV := fnc_Gravar_Mov;
            //fDMCadNotaServico.cdsNotaServicoID_MOVIMENTO.AsInteger := vID_Mov;
            prc_Movimento;

            sds.Close;
            sds.CommandText   := 'UPDATE DUPLICATA SET NUMDUPLICATA = ' + QuotedStr(IntToStr(vNum_NFSe_Ret))
                               + ', NUMNOTA = ' + IntToStr(vNum_NFSe_Ret)
                               + ', DTEMISSAO = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime))
                               + ' WHERE NUMRPS = ' + IntToStr(vNum_RPS_Ret)
                               + ' AND FILIAL = ' + IntToStr(vFilial_Sel)
                               + ' AND ID_NOTA_SERVICO = ' + IntToStr(fDMCadNotaServico.cdsNotaServicoID.AsInteger);
            sds.ExecSQL();

            fDMCadNotaServico.cdsNotaServico.Post;
            fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
            vProcesso_OK := True;

            if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
            begin
              vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
              vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
              vNomeArquivo := Monta_Diretorio('X',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);
              //22/11/2013 foi ajustado
              //SalvarUTF8( sXMLNFSe, vNomeArquivo );
              SalvarASCII( sXMLNFSe, vNomeArquivo );
            end;
          end;

        except
        end;
        FreeAndNil(sXMLNFSe);
      end;
      FCds.Next;
    end;
  finally
    FreeAndNil(FCds);
    FreeAndNil(NFSeCB);
    FreeAndNil(sXMLNFSe);
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.prc_Obter_Nota_PNG;
var
  cPNGStream: TMemoryStream;
  sNotaInicio, sNotaFim, sSerie, dtInicial, dtFinal: String;
  vCNPJAux: String;
  vArqAux: String;
  vMesAux, vAnoAux: Integer;
begin
  sNotaInicio := fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  sNotaFim    := fDMCadNotaServico.cdsNotaServico_ImpNUMNOTA.AsString;
  sSerie      := fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString;
  dtInicial   := FormatDateTime('dd/mm/yyyy', fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);
  dtFinal     := FormatDateTime('dd/mm/yyyy', now);

  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);

  cPNGStream := TMemoryStream.Create;
  try
    NFSe_ObterNotaEmPNG( fnc_LocalServidorNFe,
                         vCnpjAux,
                         sNotaInicio,
                         sNotaFim,
                         StrToDateTime(dtInicial),
                         StrToDateTime(dtFinal),
                         sSerie,
                         cPNGStream);

    cPNGStream.Position := 0;
    vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);
    vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsDateTime);
    vArqAux := Monta_Diretorio('G',fDMCadNotaServico.cdsParametrosENDPDFNFSE.AsString,fDMCadNotaServico.cdsNotaServico_ImpSERIE.AsString,vAnoAux,vMesAux);
    cPNGStream.SaveToFile(vArqAux);
    if Imprimir then
      AbreArquivo(vArqAux);
  finally
    FreeAndNil(cPNGStream);
  end;
end;

procedure TfrmCadNotaServico.prc_Imprimir_Matricial_3(vArq: String);
var
  F: TextFile;
  vTexto1, vTexto2, vTexto3: String;
  i, j, k: Word;
begin
  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                      fDMCadNotaServico.cdsNotaServico_ConsultaID.AsString;
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  if fDMCadNotaServico.cdsNotaServico_Imp.IsEmpty then
   Exit;

  AssignFile(F,vArq);
  Rewrite(F);
  Write(F,'2',#18);

  for i := 1 to 6 do
    WriteLn(F);

  vTexto1 := '        ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpNOME_CLIENTE.AsString;
  WriteLn(F,vTexto1);
  vTexto1 := '        ';
  vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_ImpENDERECO_CLI.AsString + ', ' +
             fDMCadNotaServico.cdsNotaServico_ImpNUM_END_CLI.AsString + ' - ' +
             fDMCadNotaServico.cdsNotaServico_ImpCOMPLEMENTO_END.AsString;
  vTexto2 := Formatar_Campo('',47 - Length(vTexto1));
  vTexto2 := vTexto2 + fDMCadNotaServico.cdsNotaServico_ImpCEP_CLI.AsString;
  vTexto3 := Formatar_Campo('',64 - Length(vTexto1 + vTexto2));
  vTexto3 := vTexto3 + fDMCadNotaServico.cdsNotaServico_ImpDTEMISSAO_CAD.AsString;
  WriteLn(F,vTexto1 + vTexto2 + vTexto3);
  vTexto1 := '        ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCIDADE_CLI.AsString,47 - Length(vTexto1)) +
             fDMCadNotaServico.cdsNotaServico_ImpUF_CLI.AsString;
  WriteLn(F,vTexto1);
  vTexto1 := '        ';
  vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_ImpCNPJ_CPF_CLI.AsString,47 - Length(vTexto1)) +
             fDMCadNotaServico.cdsNotaServico_ImpINSC_MUNICIPAL_CLI.AsString;
  WriteLn(F,vTexto1);

  for i := 1 to 2 do
    WriteLn(F);

////////////////////////////////ITENS DA NOTA
  j := 0;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.First;
  while not fDMCadNotaServico.cdsNotaServico_Imp_Itens.Eof do
  begin
    inc(j);
    vTexto1 := '   ';
    vTexto1 := vTexto1 + Formatar_Campo(fDMCadNotaServico.cdsNotaServico_Imp_ItensNOME_SERVICO_INT.AsString,64 - Length(vTexto1));
    vTexto2 := FormatFloat('#,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ItensVLR_TOTAL.AsFloat);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := ' ' + vTexto2;
    vTexto1 := vTexto1 + vTexto2;
    WriteLn(F,vTexto1);
    fDMCadNotaServico.cdsNotaServico_Imp_Itens.Next;
  end;

/////////////////////////////////////
  for i := 1 to 17 - j do
    WriteLn(F);

  vTexto1 := Formatar_Campo('',64);
  vTexto2 := FormatFloat('#,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat);
  for i := 1 to 10 - Length(vTexto2) do
    vTexto2 := ' ' + vTexto2;
  vTexto1 := vTexto1 + vTexto2;
  WriteLn(F,vTexto1);

//  for i := 1 to 2 do
    WriteLn(F);

  j := 0;
//////////////////////////// OBSREVAÇÕES DA NOTA
  vTexto1 := '';
  if trim(fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value) <> '' then
    vTexto1 := Copy(UpperCase(fDMCadNotaServico.cdsNotaServico_ImpDISCRIMINACAO.Value),1,192);

  j := 0;
  while vTexto1 <> '' do
  begin
    if j = 3 then  //linha 34
    begin
      for i := 1 to 55 - Length(Copy(vTexto1,1,48)) do
        vTexto1 := vTexto1 + ' ';
      vTexto1 := vTexto1 + '0';

      for i := 1 to 64 - Length(vTexto1) do
        vTexto1 := vTexto1 + ' ';
      vTexto2 := '0,00';
      for i := 1 to 10 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      WriteLn(F,vTexto1 + vTexto2);
      inc(j);
      vTexto1 := '';
    end
    else
    begin
      WriteLn(F,Copy(vTexto1,1,48));
      Delete(vTexto1,1,48);
      inc(j);
    end;

  end;
  for i := 1 to 4 - j do
  begin
    if i = 4 - j then  //linha 34
    begin
      vTexto1 := '';
      for k := 1 to 55 do
        vTexto1 := vTexto1 + ' ';
      vTexto1 := vTexto1 + '0';

      for k := 1 to 64 - Length(vTexto1) do
        vTexto1 := vTexto1 + ' ';
      vTexto2 := '0,00';
      for k := 1 to 10 - Length(vTexto2) do
        vTexto2 := ' ' + vTexto2;
      WriteLn(F,vTexto1 + vTexto2);
    end
    else
      WriteLn(F);
  end;

///////////////////////////////////////
  if (fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger > 0) and
     (fDMCadNotaServico.cdsTipoCobranca.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_TIPO_COBRANCA.AsInteger,[loCaseInsensitive])) then
  begin
    if (fDMCadNotaServico.cdsTipoCobrancaDEPOSITO.AsString = 'S') and
       (fDMCadNotaServico.cdsContas.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONTA.AsInteger,[loCaseInsensitive])) then
    begin
      vTexto1 := '(Deposito: ' + fDMCadNotaServico.cdsContasNOME.AsString +
                 ' Ag.: ' + fDMCadNotaServico.cdsContasAGENCIA.AsString + fDMCadNotaServico.cdsContasDIG_AGENCIA.AsString +
                 ' Conta: ' + fDMCadNotaServico.cdsContasNUMCONTA.AsString + fDMCadNotaServico.cdsContasDIG_CONTA.AsString + ')';
      WriteLn(F,vTexto1);
    end
    else
      WriteLn(F);
  end
  else
    WriteLn(F);

///////////////////////////////////////
  vTexto1 := '';
  if (fDMCadNotaServico.cdsCondPgto.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpID_CONDPGTO.AsInteger,[loCaseInsensitive])) and
     (fDMCadNotaServico.cdsCondPgtoIMPRIMIR_NFSE.AsString = 'S') then
  begin
    if fDMCadNotaServico.cdsNotaServico_ImpTIPO_PRAZO.AsString = 'V' then
    begin
      vTexto1 := vTexto1 + '(Pagamento à vista)';
    end
    else
    begin
      vTexto1 := vTexto1 + 'VCTO.: ';
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
      fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ImpID.AsInteger;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;
      fDMCadNotaServico.cdsNotaServico_Imp_Parc.First;
      while not fDMCadNotaServico.cdsNotaServico_Imp_Parc.Eof do
      begin
        if trim(vTexto1) <> 'VCTO.:' then
          vTexto1 := vTexto1 + '  -  ';
        vTexto1 := vTexto1 + fDMCadNotaServico.cdsNotaServico_Imp_ParcDTVENCIMENTO.AsString + ' R$' +
                   FormatFloat('#,###,##0.00',fDMCadNotaServico.cdsNotaServico_Imp_ParcVLR_VENCIMENTO.AsFloat);
        fDMCadNotaServico.cdsNotaServico_Imp_Parc.Next;
      end;
    end;
  end;
  vTexto2 := FormatFloat('#,###,##0.00',fDMCadNotaServico.cdsNotaServico_ImpVLR_TOTAL.AsFloat);

  for i := 1 to 64 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  for i := 1 to 10 - Length(vTexto2) do
    vTexto2 := ' ' + vTexto2;

  vTexto1 := vTexto1 + vTexto2;
  WriteLn(F,vTexto1);

//  vTexto1 := Formatar_Campo('',64);
  WriteLn(F);

  for i := 1 to 3 do
    WriteLn(F);

  CloseFile(F);
end;

procedure TfrmCadNotaServico.prc_Limpar_Protocolo_CB(Num_Lote: Integer);
var
  sds: TSQLDataSet;
  vAux: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;

  try
    sds.CommandText := 'UPDATE NOTASERVICO SET PROTOCOLO = ' + QuotedStr('') + ', NUMLOTE = 0 ' +
                       'WHERE NUMLOTE = ' + IntToStr(Num_Lote) +
                       ' AND FILIAL = ' + IntToStr(fDMCadNotaServico.cdsFilialID.AsInteger);
    sds.ExecSQL();

  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if fDMCadNotaServico.cdsFilialUSA_ATIVIDADE_CID_SERV.AsString = 'S' then
  begin
    if RxDBLookupCombo4.Text <> '' then
      fDMCadNotaServico.cdsNatureza.Locate('ID',RxDBLookupCombo4.KeyValue,[loCaseInsensitive]);
    if fDMCadNotaServico.cdsAtividade_Cid.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_ATIVIDADE_CID.AsInteger,[loCaseInsensitive]) then
    begin
      //11/05/2022
      //if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNaturezaMOSTRAR_BASE_ISSQN.AsString <> 'B')
      if (RxDBLookupCombo4.Text <> '') and (fDMCadNotaServico.cdsNotaServicoMOSTRAR_BASE_ISSQN.AsString <> 'B')
         and ((fDMCadNotaServico.cdsFilialSIMPLES.AsString <> 'S')
           or (StrToFloat(FormatFloat('0.00000',fDMCadNotaServico.cdsFilialPERC_ISS_SIMPLES.AsFloat)) <= 0)) then
        fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsAtividade_CidPERC_ISSQN.AsFloat));
    end;
  end;
end;

procedure TfrmCadNotaServico.btnCopiarOSClick(Sender: TObject);
var
  ffrmSel_OS_Servico: TfrmSel_OS_Servico;
  ffrmSel_OS_Projeto: TfrmSel_OS_Projeto;
begin
  if fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger <= 0 then
  begin
    MessageDlg('*** Cliente não informado!', mtError, [mbOk], 0);
    Exit;
  end;
  if SQLLocate('PARAMETROS_SER','ID','USA_OS_PROJETO','1') = 'S' then
  begin
    ffrmSel_OS_Projeto := TfrmSel_OS_Projeto.Create(self);
    ffrmSel_OS_Projeto.vCodCliente       := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger;
    ffrmSel_OS_Projeto.fDMSelOS_Projeto  := fDMSelOS_Projeto;
    ffrmSel_OS_Projeto.fDMCadNotaServico := fDMCadNotaServico;
    ffrmSel_OS_Projeto.ShowModal;
    FreeAndNil(ffrmSel_OS_Projeto);
    btnRecalcularClick(Sender);
  end
  else
  begin
    ffrmSel_OS_Servico := TfrmSel_OS_Servico.Create(self);
    ffrmSel_OS_Servico.vCodCliente       := fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger;
    ffrmSel_OS_Servico.fDMCadNotaServico := fDMCadNotaServico;
    ffrmSel_OS_Servico.ShowModal;
    FreeAndNil(ffrmSel_OS_Servico);
    btnRecalcularClick(Sender);
  end;
end;

procedure TfrmCadNotaServico.prc_Atualiza_OrdemServico(ID: Integer; vTipo: String);
var
  sds: TSQLDataSet;
  sds2: TSQLDataSet;
  vTipo_Fat: String;
begin
  sds  := TSQLDataSet.Create(nil);
  sds2 := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    if vTipo = 'S' then
      sds.CommandText := 'SELECT V.ID, (SELECT COUNT(FATURADO) FATNAO FROM ordemservico_simples_item VNAO ' +
                         'WHERE VNAO.FATURADO = ' + QuotedStr('N') +
                         ' AND VNAO.ID = V.ID) TOT_NAO_FAT, ' +
                         ' (SELECT COUNT(FATURADO) FATNAO FROM ordemservico_simples_item VNAO WHERE VNAO.ID = V.ID) TOT_ITENS ' +
                         ' FROM ORDEMSERVICO V ' +
                         'WHERE V.ID = ' + IntToStr(ID)
    else
      sds.CommandText := 'SELECT V.ID, ' +
                         ' (SELECT COUNT(FATURADO) FATNAO ' +
                         '  FROM ORDEMSERVICO_SERV VNAO ' +
                         '  WHERE VNAO.FATURADO = ''N'' ' +
                         '  AND VNAO.ID = V.ID) TOT_NAO_FAT, ' +
                         ' (SELECT COUNT(FATURADO) FATNAO ' +
                         '  FROM ORDEMSERVICO_SERV VNAO ' +
                         '  WHERE VNAO.ID = V.ID) TOT_ITENS ' +
                         'FROM ORDEMSERVICO V ' +
                         'WHERE V.ID = ' + IntToStr(ID);
    sds.Open;

    if sds.FieldByName('TOT_NAO_FAT').AsInteger <= 0 then
      vTipo_Fat := 'S'
    else
    if sds.FieldByName('TOT_NAO_FAT').AsInteger <> sds.FieldByName('TOT_ITENS').AsInteger then
      vTipo_Fat := 'P'
    else
      vTipo_Fat := 'N';

    sds2.SQLConnection := dmDatabase.scoDados;
    sds2.NoMetadata    := True;
    sds2.GetMetadata   := False;
    sds2.CommandText   := ' UPDATE ORDEMSERVICO SET FATURADO = ' + QuotedStr(vTipo_Fat)
                        + ' WHERE ID = ' + IntToStr(ID);
    sds2.ExecSQL();
  finally
    FreeAndNil(sds);
    FreeAndNil(sds2);
  end;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo3Change(Sender: TObject);
begin
  if (trim(RxDBLookupCombo3.Text) <> '') and (RxDBLookupCombo3.KeyValue <> vID_Cliente_Ant) and
     (fDMCadNotaServico.cdsNotaServico.State in [dsInsert,dsEdit]) then
  begin
    fDMCadNotaServico.cdsNotaServicoNOME_CLIENTE_CONS.AsString := RxDBLookupCombo3.Text;
    DBEdit43.Visible := (RxDBLookupCombo3.KeyValue = fDMCadNotaServico.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger);
  end;
end;

function TfrmCadNotaServico.fnc_LocalServidorNFe: String;
begin
  Result := fDMCadNotaServico.cdsParametrosLOCALSERVIDORNFE.AsString;
  if trim(fDMCadNotaServico.cdsFilialLOCALSERVIDORNFE.AsString) <> '' then
    Result := fDMCadNotaServico.cdsFilialLOCALSERVIDORNFE.AsString;
end;

function TfrmCadNotaServico.fnc_Verifica_AliqISSQN: Boolean;
var
  vAux: Real;
begin
  vAux := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat));
  Result := True;
end;

procedure TfrmCadNotaServico.DBEdit2Enter(Sender: TObject);
begin
  vAliquota_Ant := StrToFloat(FormatFloat('0.0000',fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat));
  if not fnc_Verifica_AliqISSQN then
    DBEdit2.SetFocus;
end;

procedure TfrmCadNotaServico.DBEdit2Exit(Sender: TObject);
begin
  if StrToFloat(FormatFloat('0.0000',vAliquota_Ant)) <> StrToFloat(FormatFloat('0.0000',fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat)) then
    btnRecalcularClick(Sender);
end;

procedure TfrmCadNotaServico.DBCheckBox1Enter(Sender: TObject);
begin
  vISS_Retido_Ant := fDMCadNotaServico.cdsNotaServicoISS_RETIDO.AsString;
end;

procedure TfrmCadNotaServico.btnCopiarPedidoClick(Sender: TObject);
var
  ffrmSel_Ped_Servico: TfrmSel_Ped_Servico;
begin
  if fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger <= 0 then
  begin
    MessageDlg('*** Cliente não informado!', mtError, [mbOk], 0);
    Exit;
  end;
  ffrmSel_Ped_Servico := TfrmSel_Ped_Servico.Create(self);
  ffrmSel_Ped_Servico.fDMCadNotaServico := fDMCadNotaServico;
  ffrmSel_Ped_Servico.ShowModal;
  FreeAndNil(ffrmSel_Ped_Servico);
  btnRecalcularClick(Sender);
  prc_Opcao_Prazo;
  if fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert] then
    btnGerarParcelasClick(Sender);
end;

procedure TfrmCadNotaServico.prc_Le_mPedidoAux;
begin
  fDMCadNotaServico.mPedidoAux.First;
  while not fDMCadNotaServico.mPedidoAux.Eof do
  begin
    fDMCadNotaServico.sdsPrc_Atualiza_Status_Ped.Close;
    fDMCadNotaServico.sdsPrc_Atualiza_Status_Ped.ParamByName('P_ID').AsInteger := fDMCadNotaServico.mPedidoAuxID_Pedido.AsInteger;
    fDMCadNotaServico.sdsPrc_Atualiza_Status_Ped.ExecSQL;
    fDMCadNotaServico.mPedidoAux.Next;
  end;
end;

procedure TfrmCadNotaServico.pnlClienteEnter(Sender: TObject);
begin
  vID_Natureza_Ant := fDMCadNotaServico.cdsNotaServicoID_NATUREZA.AsInteger;
end;

procedure TfrmCadNotaServico.BitBtn1Click(Sender: TObject);
var
  ffrmConsNotaServico_NFeBD: TfrmConsNotaServico_NFeBD;
begin
  ffrmConsNotaServico_NFeBD := TfrmConsNotaServico_NFeBD.Create(self);
  if (fDMCadNotaServico.cdsNotaServico_Consulta.Active) then
    ffrmConsNotaServico_NFeBD.CurrencyEdit1.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaNUMNOTA.AsInteger;
  ffrmConsNotaServico_NFeBD.ShowModal;
  FreeAndNil(ffrmConsNotaServico_NFeBD);
end;

function TfrmCadNotaServico.fnc_senha(Opcao_Senha, Campo_Senha, Tipo, Desc1, Desc2, Desc3: String; Item: Integer; Vlr_Limite: Real): Boolean;
var
  ffrmSenha: TfrmSenha;
  vSenha_Pertence: String;
begin
  fDMCadNotaServico.cdsParametros.Close;
  fDMCadNotaServico.cdsParametros.Open;
  Result := True;

  if (trim(fDMCadNotaServico.cdsParametros.FieldByName(Campo_Senha).AsString) <> '') or
  (trim(fDMCadNotaServico.qParametros_Usuario.FieldByName(Campo_Senha).AsString) <> '') then
  begin
    vSenha    := '';
    vSenha_Pertence := 'Principal';
    ffrmSenha := TfrmSenha.Create(self);
    ffrmSenha.Panel1.Visible := (Tipo = 'R');
    ffrmSenha.Label2.Caption := Desc1;
    ffrmSenha.Label3.Caption := Desc2;
    ffrmSenha.Label4.Caption := Desc3;
    if (StrToFloat(FormatFloat('0.00',Vlr_Limite)) <> 0) and (StrToFloat(FormatFloat('0.00',Vlr_Limite)) < 0) then
      ffrmSenha.Label4.Font.Color := clRed
    else
    if (StrToFloat(FormatFloat('0.00',Vlr_Limite)) <> 0) and (StrToFloat(FormatFloat('0.00',Vlr_Limite)) > 0) then
      ffrmSenha.Label4.Font.Color := clNavy;

    ffrmSenha.ShowModal;
    FreeAndNil(ffrmSenha);
    if (trim(vSenha) = '') and (Tipo <> 'R') then
    begin
      Result := False;
      MessageDlg('*** Senha não informada!', mtError, [mbOk], 0);
      exit;
    end;
    if Tipo <> 'R' then
    begin
      if vSenha <> fDMCadNotaServico.cdsParametros.FieldByName(Campo_Senha).AsString then
      begin
        if vSenha <> fDMCadNotaServico.qParametros_Usuario.FieldByName(Campo_Senha).AsString then
        begin
          Result := False;
          MessageDlg('*** Senha incorreta!', mtError, [mbOk], 0);
          exit;
        end
        else
          vSenha_Pertence := vUsuario;
      end;
      if fDMCadNotaServico.qParametros_GeralGRAVAR_HIST_SENHA.AsString = 'S' then
      begin
        if not fDMCadNotaServico.mSenha.Locate('Tipo_Alt;Item',VarArrayOf([Opcao_Senha,Item]),[locaseinsensitive]) then
        begin
          fDMCadNotaServico.mSenha.Insert;
          fDMCadNotaServico.mSenhaTipo_Alt.AsString       := Opcao_Senha;
          fDMCadNotaServico.mSenhaSenha.AsString          := vSenha;
          fDMCadNotaServico.mSenhaItem.AsInteger          := Item;
          fDMCadNotaServico.mSenhaTipo_Doc.AsString       := 'NSE';
          fDMCadNotaServico.mSenhaSenha_Pertence.AsString := vSenha_Pertence;
          fDMCadNotaServico.mSenha.Post;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadNotaServico.prc_Consultar_RPS_Canc;
var
  NumeroRPS, SerieRPS, TipoRPS, NumLoteRPS: String;
  vCnpjAux: String;
  vPasta, vArqTemp: String;
  vAnoAux, vMesAux: Integer;
  cTXTDisc: TStringStream;
  StrStream: TStringStream;
  i: Integer;
  vTexto: WideString;
begin
  vFilial_Sel := fDMCadNotaServico.cdsNotaServico_ConsultaFILIAL.AsInteger;
  fDMCadNotaServico.cdsFilial.Locate('ID',vFilial_Sel,[loCaseInsensitive]);
  if fDMCadNotaServico.cdsFilialPESSOA.AsString = 'F' then
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,11)
  else
    vCnpjAux := Monta_Texto(fDMCadNotaServico.cdsFilialCNPJ_CPF.AsString,14);
  NumeroRPS   := fDMCadNotaServico.cdsNotaServico_ConsultaNUMRPS.AsString;
  SerieRPS    := fDMCadNotaServico.cdsNotaServico_ConsultaSERIE.AsString;
  { Tipo RPS: 1 - RPS
              2 - Nota Fiscal Conjugada (Mista)
              3 - Cupom Fiscal }
  TipoRPS     := fDMCadNotaServico.cdsNotaServico_ConsultaTIPO_RPS.AsString;
  NumLoteRPS  := fDMCadNotaServico.cdsNotaServico_ConsultaNUMLOTE.AsString;

  StrStream := TStringStream.Create('');

  if not Assigned(cXMLStream) then
    cXMLStream := TMemoryStream.Create;
  try
    NFSe_ConsultarNFSeRPS( fnc_LocalServidorNFe,
                           vCnpjAux,
                           NumeroRPS,
                           SerieRPS,
                           TipoRPS,
                           cXMLStream );
    cXMLStream.Position := 0;
    //Grava o número da nota e salva xml por nota
    sLista_Nota := TStringList.Create;
    //sLista_Nota := NFSe_ListarNotas_NH(cXMLStream);
    NFSe_ListarNotas(cXMLStream,sLista_Nota);
    cXMLStream.Position := 0;
                                      
    StrStream.CopyFrom(cXMLStream, cXMLStream.Size);
    StrStream.Position := 0;

    i      := Posex('InfConfirmacaoCancelamento',StrStream.DataString);
    vTexto := copy(StrStream.DataString,i,Length(StrStream.DataString)-i);
    if i > 0 then
    begin
      if Posex('Sucesso>true<',vTexto)  > 0 then
      begin
        i := Posex('<DataHora>',vTexto);
        vDtEmissao_Ret := copy(vTexto,i+10,4) + copy(vTexto,i+15,2) + copy(vTexto,i+18,2);
        fDMCadNotaServico.vDtCancelamento := EncodeDate(StrToInt(copy(vDtEmissao_Ret,1,4)),StrToInt(copy(vDtEmissao_Ret,5,2)),StrToInt(copy(vDtEmissao_Ret,7,2)));
        prc_Gravar_Nota_Canc;
      end;
    end;
    //prc_Gravar_NumNota(True);
  finally
    FreeAndNil(cXMLStream);
    FreeAndNil(StrStream);
  end;
end;

procedure TfrmCadNotaServico.prc_Gravar_Nota_Canc;
var
  i: Integer;
  sds: TSQLDataSet;
  vAnoAux, vMesAux: Integer;
  vHomologacaoAux: String;
  vAno,vMes,vDia: String;
  vData: TDateTime;
  vID_Mov: Integer;
  vGravar: Boolean;
  vID_Nota_Local: Integer;
  vNum_Nota_Local: Integer;
  vVlr_Entrada_Local: Real;
  texto2: String;
  vCNPJPref: String;
  vCNPJSis: String;
begin
  vID_Nota_Local     := 0;
  vNum_Nota_Local    := 0;
  vVlr_Entrada_Local := 0;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    for I := 0 to sLista_Nota.Count - 1 do
    begin
      vHomologacaoAux := 'N';
      prc_Montar_RPS_NumNFSe(sLista_Nota[i]);

      if (vNum_NFSe_Ret > 0) and (vNum_RPS_Ret > 0) then
      begin
        sXMLNFSe := TMemoryStream.Create();
        NFSe_RecuperarNota(cXMLStream, IntToStr(vNum_NFSe_Ret), sXMLNFSe);

        try
          if vFilial_Sel <= 0 then
            vFilial_Sel := 1;
          fDMCadNotaServico.cdsNotaServico.Close;
          fDMCadNotaServico.sdsNotaServico.CommandText := fDMCadNotaServico.ctCommand
                                                        + ' WHERE NUMRPS = ' + IntToStr(vNum_RPS_Ret)
                                                        + ' AND FILIAL = ' + IntToStr(vFilial_Sel);
          fDMCadNotaServico.cdsNotaServico.Open;
          //10/02/2015
          vID_Nota_Local     := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
          vNum_Nota_Local    := fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger;
          vVlr_Entrada_Local := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat));
          if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
            fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,[loCaseInsensitive]);
          //aqui 29/09/2014
          vGravar := False;
          if not(fnc_Dados_OK) then
            vGravar := False
          else
            vGravar := True;
          if vGravar then
          begin
            vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);
            vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);
            vNomeArquivo := Monta_Diretorio('C',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

            SalvarUTF8( cXMLStream, vNomeArquivo );

            fDMCadNotaServico.prc_Gravar_Cancelamento(vNomeArquivo);
            fDMCadNotaServico.mOSAux.First;
            while not fDMCadNotaServico.mOSAux.Eof do
            begin
              prc_Atualiza_OrdemServico(fDMCadNotaServico.mOSAuxID.AsInteger,fDMCadNotaServico.mOSAuxTipo.AsString);
              fDMCadNotaServico.mOSAux.Next;
            end;
            //vAnoAux := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);
            //vMesAux := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime);
            //vNomeArquivo := Monta_Diretorio('C',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);
            //SalvarUTF8( cXMLStream, vNomeArquivo );

            vProcesso_OK := True;
          end;
        except
        end;

        //vAnoAux      := YearOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
        //vMesAux      := MonthOf(fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime);
        //vNomeArquivo := Monta_Diretorio('C',fDMCadNotaServico.cdsParametrosENDXMLNFSE.AsString,fDMCadNotaServico.cdsNotaServicoSERIE.AsString,vAnoAux,vMesAux);

        //SalvarASCII( sXMLNFSe, vNomeArquivo );

        FreeAndNil(sXMLNFSe);
      end;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaServico.prc_Ler_Parcelas;
begin
  if fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'P' then
  begin
    fDMCadNotaServico.cdsNotaServico_Parc.First;
    while not fDMCadNotaServico.cdsNotaServico_Parc.Eof do
    begin
      if (fDMCadNotaServico.CDSNotaServico_ParcITEM.AsInteger = 0) and
         (StrToFloat(FormatFloat('0.00',fDMCadNotaServico.CDSNotaServico_ParcVLR_VENCIMENTO.AsFloat)) <>
         StrToFloat(FormatFloat('0.00',fDMCadNotaServico.CDSNotaServicoVLR_ENTRADA.AsFloat))) then
      begin
        if not(fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) then
          fDMCadNotaServico.cdsNotaServico.Edit;
        fDMCadNotaServico.cdsNotaServicoVLR_ENTRADA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.CDSNotaServico_ParcVLR_VENCIMENTO.AsFloat));
      end;
      fDMCadNotaServico.Gravar_Duplicata('R','N',fDMCadNotaServico.cdsNotaServico_ParcITEM.AsInteger,
                                                 fDMCadNotaServico.cdsNotaServico_ParcVLR_VENCIMENTO.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServico_ParcDTVENCIMENTO.AsDateTime,'');
      fDMCadNotaServico.cdsNotaServico_Parc.Next;
    end;
  end
  else
  if fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString = 'V' then
    fDMCadNotaServico.Gravar_Duplicata('R','N',1,fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoDTEMISSAO.AsDateTime,'AVI');
end;

procedure TfrmCadNotaServico.btnGerarCReceberClick(Sender: TObject);
begin
  if MessageDlg('Deseja gerar novamente o contas a receber?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  prc_Posiciona_NotaFiscal;
  if fDMCadNotaServico.cdsNotaServico.IsEmpty then
    exit;
  fDMCadNotaServico.cdsNotaServico.Edit;
  fDMCadNotaServico.prc_Excluir_Duplicata;
  prc_Ler_Parcelas;
  fDMCadNotaServico.cdsNotaServico.Post;
  fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
end;

procedure TfrmCadNotaServico.prc_Movimento;
var
  vIDAux: Integer;
  vID_Mov: Integer;
  vPerc_Pis, vPerc_Cofins: Real;
  vVlr_Pis, vVlr_Cofins: Real;
  vCancelada: String;
begin
  vID_Mov := 0;
  if fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger > 0 then
  begin
    vCancelada := 'N';
    if fDMCadNotaServico.cdsNotaServico_ConsultaSTATUS_RPS.AsString = '2' then
      vCancelada := 'S';
    fDMCadNotaServico.cdsNotaServico_Itens.First;
    vPerc_Pis    := fDMCadNotaServico.cdsNotaServicoPERC_PIS.AsFloat;
    vPerc_Cofins := fDMCadNotaServico.cdsNotaServicoPERC_COFINS.AsFloat;
    if fDMCadNotaServico.qParametros_SerUSA_CALC_PISCOFINS.AsString = 'S' then
    begin
      //09/05/2022  Cleomar
      //vPerc_Pis    := fDMCadNotaServico.cdsNotaServicoPERC_PIS.AsFloat;
      //vPerc_Cofins := fDMCadNotaServico.cdsNotaServicoPERC_COFINS.AsFloat;
      vVlr_Pis     := fDMCadNotaServico.cdsNotaServicoVLR_PIS_CALC.AsFloat;
      vVlr_Cofins  := fDMCadNotaServico.cdsNotaServicoVLR_COFINS_CALC.AsFloat;
    end
    else
    begin
      //09/05/2022  Cleomar
      //vPerc_Pis    := fDMCadNotaServico.cdsFilialPERC_PIS.AsFloat;
      //vPerc_Cofins := fDMCadNotaServico.cdsFilialPERC_COFINS.AsFloat;
      vVlr_Pis     := fDMCadNotaServico.cdsNotaServicoVLR_PIS.AsFloat;
      vVlr_Cofins  := fDMCadNotaServico.cdsNotaServicoVLR_COFINS.AsFloat;
    end;

    vID_Mov := fDMMovimento.fnc_Gravar_Movimento(fDMCadNotaServico.cdsNotaServicoID_MOVIMENTO.AsInteger,
                                                 fDMCadNotaServico.cdsNotaServicoFILIAL.AsInteger,0,
                                                 fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger,
                                                 fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger,
                                                 fDMCadNotaServico.cdsNotaServicoID.AsInteger,0,
                                                 fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger,0,
                                                 fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger,
                                                 fDMCadNotaServico.cdsNotaServicoNUMRPS.AsInteger,'NSE',
                                                 fDMCadNotaServico.cdsNotaServicoSERIE.AsString,'S','NSE',
                                                 fDMCadNotaServico.cdsNotaServicoVLR_SERVICOS.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_SERVICOS.AsFloat,0,0,0,0,0,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_ISS.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_IR.AsFloat,0,0,
                                                 //fDMCadNotaServico.cdsNotaServicoVLR_PIS.AsFloat, //20/08/2018
                                                 vVlr_Pis,
                                                 //fDMCadNotaServico.cdsNotaServicoVLR_COFINS.AsFloat, //20/08/2018
                                                 vVlr_Cofins,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_DUPLICATA.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_CSLL.AsFloat,
                                                 0,0,0,0,fDMCadNotaServico.cdsNotaServicoVLR_ISS_RETIDO.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_CSRF.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoBASE_INSS.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoBASE_CALCULO.AsFloat,0,0,0,0,0,0,0,
                                                 vPerc_Pis,
                                                 vPerc_Cofins,
                                                 fDMCadNotaServico.cdsNotaServicoPERC_ALIQUOTA.AsFloat,
                                                 fDMCadNotaServico.cdsNotaServicoVLR_LIQUIDO_NFSE.AsFloat,0,
                                                 vCancelada,'N','UN','',
                                                 fDMCadNotaServico.cdsServicoNOME.AsString,
                                                 fDMCadNotaServico.cdsServicoCODIGO.AsString,
                                                 fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime,
                                                 fDMCadNotaServico.cdsNotaServicoDTEMISSAO_CAD.AsDateTime,'',
                                                 fDMCadNotaServico.cdsNotaServicoTIPO_PRAZO.AsString,
                                                 fDMCadNotaServico.cdsNotaServicoID_CONDPGTO.AsInteger,0,
                                                 fDMCadNotaServico.cdsNotaServicoID_VENDEDOR.AsInteger,0,
                                                 fDMCadNotaServico.cdsNotaServicoPERC_COMISSAO.AsFloat,0,0,1,0,
                                                 fDMCadNotaServico.cdsNotaServicoRETEM_PISCOFINS.AsString,
                                                 0,0,0,0,0,0,0,0,0,0,0,0,0,
                                                 fDMCadNotaServico.cdsNotaServicoID_CONTA_ORCAMENTO.AsInteger);
  end;
  if (vID_MOV > 0) and (vID_Mov <> fDMCadNotaServico.cdsNotaServicoID_MOVIMENTO.AsInteger) then
  begin
    if not(fDMCadNotaServico.cdsNotaServico.State in [dsEdit,dsInsert]) then
      fDMCadNotaServico.cdsNotaServico.Edit;
    fDMCadNotaServico.cdsNotaServicoID_MOVIMENTO.AsInteger := vID_Mov;
    //fDMCadNotaServico.cdsNotaServico.Post;
  end;
end;

procedure TfrmCadNotaServico.btnGerarMovimentoClick(Sender: TObject);
var
  ID: TTransactionDesc;
  Form : TForm;
begin
  if MessageDlg('Deseja gerar novamente os movimentos das notas da consulta?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  Form := TForm.Create(Application);
  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    //SMDBGrid1.DisableScroll;
    uUtilPadrao.prc_Form_Aguarde(Form,'... Lendo ...');
    try
      fDMCadNotaServico.cdsNotaServico_Consulta.First;
      while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
      begin
        if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          prc_Posiciona_NotaFiscal;
          if not fDMCadNotaServico.cdsNotaServico.IsEmpty then
          begin
            uUtilServico.Excluir_MovimentoNFSe(fDMCadNotaServico,fDMCadNotaServico.cdsNotaServicoID.AsInteger);
            prc_Movimento;
            if fDMCadNotaServico.cdsNotaServico.State in [dsEdit] then
              fDMCadNotaServico.cdsNotaServico.Post;
            fDMCadNotaServico.cdsNotaServico.ApplyUpdates(0);
          end;
        end;
        fDMCadNotaServico.cdsNotaServico_Consulta.Next;
      end;
    finally
      //SMDBGrid1.EnableScroll;
    end;
    uUtilPadrao.prc_Form_Aguarde(Form,'... Gravando ...');
    dmDatabase.scoDados.Commit(ID);
    FreeAndNil(form);
  except
    on E: exception do
    begin
      FreeAndNil(form);
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar movimento. ' + #13 + E.Message);
    end;
  end;
  MessageDlg('*** Movimento das notas na consulta gerado!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmCadNotaServico.Panel8Exit(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServico_Obra.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('*** Favor confirmar ou cancelar a digitação da Obra!', mtError, [mbOk], 0);
    RzPageControl2.ActivePage := TS_Obra;
    DBEdit49.SetFocus;
  end;
end;

procedure TfrmCadNotaServico.btnInserir_ObraClick(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServico_Obra.IsEmpty then
  begin
    fDMCadNotaServico.cdsNotaServico_Obra.Insert;
    fDMCadNotaServico.cdsNotaServico_ObraID.AsInteger := fDMCadNotaServico.cdsNotaServicoID.AsInteger;
  end
  else
    fDMCadNotaServico.cdsNotaServico_Obra.Edit;
  pnlObra.Enabled := True;
  RxDBLookupCombo7.SetFocus;
end;

procedure TfrmCadNotaServico.btnConfirmar_ObraClick(Sender: TObject);
begin
  if not(fDMCadNotaServico.cdsNotaServico_Obra.State in [dsEdit,dsInsert]) then
    exit;
  if trim(RxDBLookupCombo7.Text) = '' then
  begin
    MessageDlg('*** Obra não foi informada!', mtError, [mbOk], 0);
    exit;
  end;
  if SQLLocate('CENTROCUSTO','ID','TIPO',RxDBLookupCombo7.KeyValue) = 'S' then
  begin
    MessageDlg('*** ' + RxDBLookupCombo7.Text + '  é uma conta sintética!' , mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.cdsNotaServico_Obra.Post;
  pnlObra.Enabled := False;
end;

procedure TfrmCadNotaServico.btnCancelar_ObraClick(Sender: TObject);
begin
  if vID_CentroCusto_Ant > 0 then
    fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.AsInteger := vID_CentroCusto_Ant
  else
    fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.Clear;
  fDMCadNotaServico.cdsNotaServico_Obra.Cancel;
  pnlObra.Enabled := False;
end;

procedure TfrmCadNotaServico.btnExcluir_ObraClick(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServico_Obra.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir a obra da nota de serviço?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  fDMCadNotaServico.cdsNotaServico_Obra.Delete;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo7Enter(Sender: TObject);
begin
  vID_CentroCusto_Ant := fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.AsInteger;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo7Exit(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.AsInteger <> vID_CentroCusto_Ant then
  begin
    fDMCadNotaServico.cdsCentroCusto.Locate('ID',fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger,[loCaseInsensitive]);

    fDMCadNotaServico.cdsNotaServico_ObraENDERECO.AsString   := fDMCadNotaServico.cdsCentroCustoENDERECO.AsString;
    fDMCadNotaServico.cdsNotaServico_ObraNUM_END.AsString    := fDMCadNotaServico.cdsCentroCustoNUM_END.AsString;
    fDMCadNotaServico.cdsNotaServico_ObraBAIRRO.AsString     := fDMCadNotaServico.cdsCentroCustoBAIRRO.AsString;
    fDMCadNotaServico.cdsNotaServico_ObraCEP.AsString        := fDMCadNotaServico.cdsCentroCustoCEP.AsString;
    fDMCadNotaServico.cdsNotaServico_ObraID_CIDADE.AsInteger := fDMCadNotaServico.cdsCentroCustoID_CIDADE.AsInteger;
    fDMCadNotaServico.cdsNotaServico_ObraCEI.AsString        := fDMCadNotaServico.cdsCentroCustoCEI.AsString;
  end;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vID_Centro_Custo   := fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.AsInteger;
    frmSel_CentroCusto := TfrmSel_CentroCusto.Create(Self);
    frmSel_CentroCusto.cbxInternoExterno.ItemIndex := 2;
    frmSel_CentroCusto.ShowModal;
    fDMCadNotaServico.cdsNotaServicoID_CENTROCUSTO.AsInteger := vID_Centro_Custo;
    RxDBLookupCombo7.SetFocus;
  end;
end;

procedure TfrmCadNotaServico.SpeedButton2Click(Sender: TObject);
begin
  fDMCadNotaServico.cdsCentroCusto.Close;
  fDMCadNotaServico.cdsCentroCusto.Open;
end;

procedure TfrmCadNotaServico.RzPageControl2Change(Sender: TObject);
begin
  if fDMCadNotaServico.cdsNotaServico_Obra.State in [dsEdit,dsInsert] then
  begin
    RzPageControl2.ActivePage := TS_Obra;
    DBEdit49.SetFocus;
  end;
end;

procedure TfrmCadNotaServico.RxDBLookupCombo6Enter(Sender: TObject);
begin
  fDMCadNotaServico.cdsCidade.IndexFieldNames := 'NOME;UF';
end;

procedure TfrmCadNotaServico.prc_Impressao_NFSe(Imprimir: Boolean);
begin
   fDMCadNotaServico.mImpNota.EmptyDataSet;
  //if Tipo = 'E' then
  //begin
    fDMCadNotaServico.mImpNota.Insert;
    fDMCadNotaServico.mImpNotaID_Nota.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
    fDMCadNotaServico.mImpNota.Post;
  //end
  {else
  if Tipo = 'I' then
  begin
    fDMCadNotaServico.cdsNotaServico_Consulta.First;
    while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        fDMCadNotaServico.mImpNota.Insert;
        fDMCadNotaServico.mImpNotaID_Nota.AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
        fDMCadNotaServico.mImpNota.Post;
      end;
      fDMCadNotaServico.cdsNotaServico_Consulta.Next;
    end;
  end;}
  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  if fDMCadNotaServico.mImpNota.IsEmpty then
  begin
    MessageDlg('*** Não foi selecionada nenhuma nota para a impressão!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.mImpNota.First;

  fRelDanfe_NFSe                   := TfRelDanfe_NFSe.Create(Self);
  fRelDanfe_NFSe.fDMCadNotaServico := fDMCadNotaServico;
  if Imprimir then
    fRelDanfe_NFSe.RLReport1.PreviewModal
  else
  begin
    //vNomeArqPdf := 'C:\a\aaa.pdf';
    fRelDanfe_NFSe.RLReport1.Prepare;
    fRelDanfe_NFSe.RLReport1.SaveToFile(vNomeArqPdf);
    fDMCadNotaServico.RLPDFFilter1.FileName := vNomeArqPdf;
    fDMCadNotaServico.RLPDFFilter1.FilterPages(fRelDanfe_NFSe.RLReport1.Pages,1,-1,'',0);
  end;
  fRelDanfe_NFSe.RLReport1.Free;
  fRelDanfe_NFSe.Destroy;
end;

procedure TfrmCadNotaServico.prc_Posiciona_NotaServico_Imp;
begin
  fDMCadNotaServico.cdsNotaServico_Imp.Close;
  fDMCadNotaServico.sdsNotaServico_Imp.CommandText := fDMCadNotaServico.ctNotaServico_Imp + ' WHERE NS.ID = ' +
                                                      IntToStr(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
  fDMCadNotaServico.cdsNotaServico_Imp.Open;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Itens.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Itens.Open;

  fDMCadNotaServico.cdsNotaServico_Imp_Parc.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Parc.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Parc.Open;

  fDMCadNotaServico.cdsNotaServico_Imp_Contrato.Close;
  fDMCadNotaServico.sdsNotaServico_Imp_Contrato.ParamByName('ID').AsInteger := fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger;
  fDMCadNotaServico.cdsNotaServico_Imp_Contrato.Open;

  if fDMCadNotaServico.cdsFilialID.AsInteger <> fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger then
    fDMCadNotaServico.cdsFilial.Locate('ID',fDMCadNotaServico.cdsNotaServico_ImpFILIAL.AsInteger,[loCaseInsensitive]);
end;

function TfrmCadNotaServico.fnc_Busca_Inf(Campo1, Campo2: String;
  Qtd: Integer): String;
var
  i, i2: Integer;
  vTexto1: String;
begin
  vTexto1 := '';
  i:= posex(Campo1,fDMCadNotaServico.cdsNotaServicoXML.Value);
  if i > 0 then
  begin
    i2:= posex(Campo2,fDMCadNotaServico.cdsNotaServicoXML.Value);
    vTexto1 := copy(fDMCadNotaServico.cdsNotaServicoXML.Value,i+Qtd,i2-(i+Qtd));
  end;
  Result := vTexto1;
end;

procedure TfrmCadNotaServico.FormCreate(Sender: TObject);
begin
  FListaNotas := TStringList.Create;
end;

procedure TfrmCadNotaServico.btnGravarVendedor_DupClick(Sender: TObject);
var
  vID_Vend_Int: Integer;

    procedure Acessar_Duplicata;
    begin
      fDMCadNotaServico.cdsDuplicata.Close;
      fDMCadNotaServico.sdsDuplicata.CommandText := fDMCadNotaServico.ctDuplicata
                                                  + ' WHERE ID_NOTA_SERVICO = ' + IntToStr(fDMCadNotaServico.cdsNotaServico_ConsultaID.AsInteger);
      fDMCadNotaServico.cdsDuplicata.Open;
    end;
    
begin
  fDMCadNotaServico.cdsNotaServico_Consulta.First;
  while not fDMCadNotaServico.cdsNotaServico_Consulta.Eof do
  begin
    if fDMCadNotaServico.cdsCliente.Locate('CODIGO',fDMCadNotaServico.cdsNotaServico_ConsultaID_CLIENTE.AsInteger,[loCaseInsensitive]) then
    begin
      if fDMCadNotaServico.cdsClienteID_VENDEDOR_INT.AsInteger > 0 then
      begin
        Acessar_Duplicata;
        fDMCadNotaServico.cdsDuplicata.First;
        while not fDMCadNotaServico.cdsDuplicata.Eof do
        begin
          if fDMCadNotaServico.cdsDuplicataID_VENDEDOR_INT.AsInteger <= 0 then
          begin
            fDMCadNotaServico.cdsDuplicata.Edit;
            fDMCadNotaServico.cdsDuplicataID_VENDEDOR_INT.AsInteger := fDMCadNotaServico.cdsClienteID_VENDEDOR_INT.AsInteger;
            fDMCadNotaServico.cdsDuplicataPERC_COMISSAO_INT.AsFloat := fDMCadNotaServico.cdsClientePERC_COMISSAO_INT.AsFloat;
            fDMCadNotaServico.cdsDuplicata.Post;
          end;
          fDMCadNotaServico.cdsDuplicata.Next;
        end;
        fDMCadNotaServico.cdsDuplicata.ApplyUpdates(0);
      end;
    end;
    fDMCadNotaServico.cdsNotaServico_Consulta.Next;
  end;
  MessageDlg('*** Ajuste concluído!',mtConfirmation , [mbOk], 0);
end;

end.
