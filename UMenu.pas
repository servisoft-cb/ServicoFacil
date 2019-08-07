unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ComCtrls, jpeg,
  ToolWin, Menus, Types, UCBase, UCDBXConn, ActnList, ImgList, ShellAPI, ExtCtrls, RLConsts, IniFiles, Midaslib, DBClient,
  GradPnl, SqlExpr;
  
type
  TfMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Pais1: TMenuItem;
    Sobre1: TMenuItem;
    UF1: TMenuItem;
    Cidade1: TMenuItem;
    UCDBXConn1: TUCDBXConn;
    UserControl1: TUserControl;
    UCSettings1: TUCSettings;
    Administrao1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    PerfildeUsurios1: TMenuItem;
    LogdoSistema1: TMenuItem;
    N1: TMenuItem;
    rocarSenha1: TMenuItem;
    EfetuarLogoff1: TMenuItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    Pessoa1: TMenuItem;
    EmpresaFiliais1: TMenuItem;
    N2: TMenuItem;
    CondiodePagamento2: TMenuItem;
    N3: TMenuItem;
    Parmetros1: TMenuItem;
    abelaImpostos1: TMenuItem;
    RegimeTributrio1: TMenuItem;
    ToolBar1: TToolBar;
    alCliente: TAction;
    alNotaFiscal: TAction;
    alProduto: TAction;
    alMovimentos: TAction;
    alSaida: TAction;
    tbPessoa: TToolButton;
    tbNotaFiscal: TToolButton;
    tbProduto: TToolButton;
    alTransportador: TAction;
    alFornecedor: TAction;
    Image2: TImage;
    alCompras: TAction;
    alPedido: TAction;
    ipoCobrana1: TMenuItem;
    ContasBancos1: TMenuItem;
    N12: TMenuItem;
    Agenda1: TMenuItem;
    Funcionrio1: TMenuItem;
    Banco1: TMenuItem;
    Servios1: TMenuItem;
    CadastroServios1: TMenuItem;
    ProvedorNFSe1: TMenuItem;
    Natureza1: TMenuItem;
    N17: TMenuItem;
    NotaServio1: TMenuItem;
    CadastroServiosInterno1: TMenuItem;
    Setores1: TMenuItem;
    N19: TMenuItem;
    ImportarXMLNFSe1: TMenuItem;
    CadastroAtividadeMunicipio1: TMenuItem;
    N20: TMenuItem;
    ConsultaNotasServio1: TMenuItem;
    Contrato1: TMenuItem;
    N9: TMenuItem;
    tbOServico: TToolButton;
    GerarNotaServio1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    N24: TMenuItem;
    OrdemdeServioBaixa1: TMenuItem;
    OrdemdeServioConsulta1: TMenuItem;
    Ferados1: TMenuItem;
    FeriadoFixo1: TMenuItem;
    ContratoServio1: TMenuItem;
    CNAE1: TMenuItem;
    abIBPT1: TMenuItem;
    UCControls1: TUCControls;
    abelaSimplesFaixaicms1: TMenuItem;
    lbDatabase: TLabel;
    Contabilista1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    CidadeUFPais1: TMenuItem;
    Financeiro2: TMenuItem;
    Servios2: TMenuItem;
    N4: TMenuItem;
    N26: TMenuItem;
    N34: TMenuItem;
    N33: TMenuItem;
    N36: TMenuItem;
    ConfiguraoEmail1: TMenuItem;
    N37: TMenuItem;
    Recibo1: TMenuItem;
    Shape3: TShape;
    Label4: TLabel;
    N5: TMenuItem;
    ImportarClientesCSV1: TMenuItem;
    GerarNotaServioArquivoCSV1: TMenuItem;
    ConfiguraoCertificado1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pais1Click(Sender: TObject);
    procedure UF1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure EfetuarLogoff1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmpresaFiliais1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sobre1Click(Sender: TObject);
    procedure RegimeTributrio1Click(Sender: TObject);
    procedure ContasBancos1Click(Sender: TObject);
    procedure ipoCobrana1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Pessoa1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure CadastroServios1Click(Sender: TObject);
    procedure ProvedorNFSe1Click(Sender: TObject);
    procedure Natureza1Click(Sender: TObject);
    procedure NotaServio1Click(Sender: TObject);
    procedure CadastroServiosInterno1Click(Sender: TObject);
    procedure Setores1Click(Sender: TObject);
    procedure ImportarXMLNFSe1Click(Sender: TObject);
    procedure CadastroAtividadeMunicipio1Click(Sender: TObject);
    procedure ConsultaNotasServio1Click(Sender: TObject);
    procedure UserControl1AfterLogin(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure GerarNotaServio1Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure OrdemdeServioBaixa1Click(Sender: TObject);
    procedure OrdemdeServioConsulta1Click(Sender: TObject);
    procedure Ferados1Click(Sender: TObject);
    procedure FeriadoFixo1Click(Sender: TObject);
    procedure ContratoServio1Click(Sender: TObject);
    procedure CNAE1Click(Sender: TObject);
    procedure abIBPT1Click(Sender: TObject);
    procedure Contabilista1Click(Sender: TObject);
    procedure CondiodePagamento2Click(Sender: TObject);
    procedure ConfiguraoEmail1Click(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure tbProdutoClick(Sender: TObject);
    procedure tbNotaFiscalClick(Sender: TObject);
    procedure ImportarClientesCSV1Click(Sender: TObject);
    procedure GerarNotaServioArquivoCSV1Click(Sender: TObject);
    procedure ConfiguraoCertificado1Click(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Habilita_Menu;

    //ffrmCadPais: TfrmCadPais;
  public
    { Public declarations }
    vTipoPessoa: String;
    vPath: String;
    vTipo_Reg_Cons_Fat: String;
    vTipo_Reg_Pedido: String; //P=Pedido  C=Compras
    vVersao: String;

    procedure OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
    procedure GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
    function GetBuildInfoAsString: string;
    procedure gravaVersao(vVersao: String);
    procedure gravaModulos;
    procedure prc_Verifica_Nota_Dupl(Tipo: String);
    procedure prc_Verifica_Certificado;
  end;

var
  fMenu: TfMenu;

implementation

uses DmdDatabase, uFrmSobre, UCadPais, UCadUF, UCadCidade, UCadPessoa, UCadCondPgto, UCadRegime_Trib,
  UCadContas, UCadTipoCobranca, UCadAgenda, UCadFuncionario, UCadBanco, UCadContrato, UCadServico, UCadProvedor,
  UCadNatureza, UCadNotaServico, UCadServico_Int, uCadSetor, UImportarXML_NFSe, UCadAtividade_Cid, UConsNotas_SER,
  uUtilPadrao, UDMUtil, UGerar_NFSe, UCadOrdemServico, UBaixaOrdemServico, UConsOrdemServico, UCadFeriado, UCadFeriado_Fixo,
  uCadContratoServ, uCadCNAE, UCadTab_IBPT, UCadContabilista, UCDataInfo, uCadOS_Simples, uCadOrdemServico_Param,
  UCadConfig_Email, UCadRecibo, DateUtils, UConsOrdemServico_Mat, UCadFilial,
  DmdDatabase_NFeBD, UImp_Cliente_Txt, UGerar_NFSe_txt,
  UCadFilial_Certificado, UCadNotaServico_acbr;

{$R *.dfm}

procedure TfMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMenu.OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
var
  existe: TForm;
  j: Byte;
begin
  existe := nil;
  for j := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[j] is FClass then
      existe := Screen.Forms[j];
  end;

  if not (existe = nil) then
  begin
    existe.BringToFront;
    existe.SetFocus;
  end
  else
  begin
    Application.CreateForm(FClass,existe);
    existe.FormStyle := fsMDIChild;
    if existe.Name = 'frmCadPessoa' then
      vTipoPessoa := TipoPessoa;
    existe.Show;
  end;
  existe.WindowState := vEstado;
end;

procedure TfMenu.Pais1Click(Sender: TObject);
begin
  OpenForm(TfrmCadPais,wsMaximized);
end;

procedure TfMenu.UF1Click(Sender: TObject);
begin
  OpenForm(TfrmCadUF,wsMaximized);
end;

procedure TfMenu.Cidade1Click(Sender: TObject);
begin
  OpenForm(TfrmCadCidade,wsMaximized);
end;

procedure TfMenu.EfetuarLogoff1Click(Sender: TObject);
begin
  UserControl1.Logoff;
end;

procedure TfMenu.FormCreate(Sender: TObject);
var
  TaskBarH: THandle;
  TaskBarR: TRect;
  vDia, vMes, vAno: Word;
//  i: Integer;
begin
  UserControl1.Execute;
  vPath := ExtractFilePath(Application.ExeName);
  lbDatabase.Caption := dmDatabase.scoDados.Params.Values['DATABASE'];

   // obtem o retangulo com o taskbar
  TaskBarH := FindWindow('Shell_TrayWnd', nil);
  GetWindowRect(TaskBarH, TaskBarR);
  // altura do taskbar = TaskBarR.
  Image2.Top  := Height - (Screen.Height - TaskBarR.Top) - Image2.Height - 32;
  Image2.Left := Screen.Width - Image2.Width - 16;

  vVersao := GetBuildInfoAsString;
  if vVersao <> '0.0.0.0' then
  begin
    Caption := Caption + ' - v' + vVersao;
    {DecodeDate(Date,vAno,vMes,vDia);
    //aqui tirar depois
    case vDia of
      5,10,15,20,25,30: begin
                          gravaVersao(vVersao);  //enviar versão para banco Servisoft
                          gravaModulos;//verifica módulos no banco Servisoft
                        end;
    end;}
  end;

  /////controle de módulos
  DMUtil.cdsModulo.IndexFieldNames := 'NOME';
  DMUtil.cdsModulo.Open;
  Servios1.Visible     := not DMUtil.cdsModulo.FindKey(['SERVICOS']);
  tbOServico.Visible   := not DMUtil.cdsModulo.FindKey(['SERVICOS']);
end;

procedure TfMenu.EmpresaFiliais1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFilial,wsMaximized);
end;

procedure TfMenu.Parmetros1Click(Sender: TObject);
begin
  prc_ShellExecute('SSFacil_Parametros.exe');
end;

procedure TfMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Encerrar o programa ServiçoFácil?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    CanClose := False
  else
    CanClose := True;
end;

procedure TfMenu.Sobre1Click(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
end;

procedure TfMenu.RegimeTributrio1Click(Sender: TObject);
begin
  OpenForm(TfrmCadRegime_Trib,wsMaximized);
end;

procedure TfMenu.ContasBancos1Click(Sender: TObject);
begin
  OpenForm(TfrmCadContas,wsMaximized);
end;

procedure TfMenu.ipoCobrana1Click(Sender: TObject);
begin
  OpenForm(TfrmCadTipoCobranca,wsMaximized);
end;

procedure TfMenu.ToolButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMenu.Agenda1Click(Sender: TObject);
begin
  OpenForm(TfrmCadAgenda,wsMaximized);
end;

procedure TfMenu.Funcionrio1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFuncionario,wsMaximized);
end;

procedure TfMenu.Pessoa1Click(Sender: TObject);
begin
  OpenForm(TfrmCadPessoa,wsMaximized,'');
end;

procedure TfMenu.Banco1Click(Sender: TObject);
begin
  OpenForm(TfrmCadBanco,wsMaximized,'');
end;

procedure TfMenu.CadastroServios1Click(Sender: TObject);
begin
  OpenForm(TfrmCadServico,wsMaximized);
end;

procedure TfMenu.ProvedorNFSe1Click(Sender: TObject);
begin
  OpenForm(TfrmCadProvedor,wsMaximized);
end;

procedure TfMenu.Natureza1Click(Sender: TObject);
begin
  OpenForm(TfrmCadNatureza,wsMaximized);
end;

procedure TfMenu.NotaServio1Click(Sender: TObject);
var
  sds: TSQLDataSet;
  vEnviaAcbr : String;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    sds.CommandText := 'SELECT FIRST(1)ENVIO_NFSE FROM FILIAL WHERE ENVIO_NFSE = ' + QuotedStr('A');
    sds.Open;
    vEnviaAcbr := sds.FieldByName('ENVIO_NFSE').AsString
  finally
    FreeAndNil(sds);
  end;
  if vEnviaAcbr = 'A' then
    OpenForm(TfrmCadNotaServico_acbr,wsMaximized)
  else
    OpenForm(TfrmCadNotaServico,wsMaximized);
end;

procedure TfMenu.CadastroServiosInterno1Click(Sender: TObject);
begin
  OpenForm(TfrmCadServico_Int,wsMaximized);
end;

procedure TfMenu.Setores1Click(Sender: TObject);
begin
  OpenForm(TfrmCadSetor,wsMaximized);
end;

procedure TfMenu.ImportarXMLNFSe1Click(Sender: TObject);
begin
  OpenForm(TfrmImportarXML_NFSe,wsMaximized);
end;              

procedure TfMenu.CadastroAtividadeMunicipio1Click(Sender: TObject);
begin
  OpenForm(TfrmCadAtividade_Cid,wsMaximized);
end;

procedure TfMenu.ConsultaNotasServio1Click(Sender: TObject);
begin
  OpenForm(TfrmConsNotas_SER,wsMaximized);
end;

procedure TfMenu.GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(exeName), Dummy);
  if VerInfoSize > 0 then
  begin
    GetMem(VerInfo,VerInfoSize);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
      begin
        VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
        with VerValue^ do
        begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
        end;
      end;
    finally
      FreeMem(VerInfo,VerInfoSize);
    end;
  end;
end;

function TfMenu.GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(GetCurrentDir + '\ServicoFacil.EXE', V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure TfMenu.gravaVersao(vVersao: String);
var
  Config: TIniFile;
begin
  //if dmDatabase.sqEmpresaDT_VERSAO.AsDateTime = Date then
    //Exit;
  Config := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  dmDatabase.scoLiberacao.Params.Values['DRIVERNAME'] := 'INTERBASE';
  dmDatabase.scoLiberacao.Params.Values['SQLDIALECT'] := '3';
  dmDatabase.scoLiberacao.Params.Values['DATABASE']   := Config.ReadString('Liberacao', 'DATABASE', '');
  dmDatabase.scoLiberacao.Params.Values['USER_NAME']  := Config.ReadString('Liberacao', 'USERNAME', '');
  dmDatabase.scoLiberacao.Params.Values['PASSWORD']   := dmDatabase.Decoder64.DecodeString(Config.ReadString('Liberacao', 'PASSWORD', ''));
  dmDatabase.scoLiberacao.Connected := True;
  dmDatabase.scoLiberacao.Connected := True;
  dmDatabase.sdsExecRemoto.CommandText := 'UPDATE PESSOA SET VERSAO_EXE = ' + QuotedStr(vVersao) +
                                          ' WHERE DOCUMENTO = ' + QuotedStr(dmDatabase.sqEmpresaCNPJ_CPF.AsString);
  dmDatabase.sdsExecRemoto.ExecSQL(True);

  //dmDatabase.sdsExec.CommandText := 'UPDATE FILIAL SET DT_VERSAO = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',Date)) +
  //                                  ' WHERE PRINCIPAL = ''S''';
  //dmDatabase.sdsExec.ExecSQL(True);
end;

procedure TfMenu.UserControl1AfterLogin(Sender: TObject);
begin
  prc_Habilita_Menu;
end;

procedure TfMenu.FormShow(Sender: TObject);
begin
  prc_Habilita_Menu;
  prc_Verifica_Nota_Dupl('A');
  prc_Verifica_Certificado;

  lbDatabase.Top  := Image2.Top - 15;
  lbDatabase.Left := Image2.Left - 269;
end;

procedure TfMenu.Contrato1Click(Sender: TObject);
begin
  OpenForm(TfrmCadContrato,wsMaximized);
end;

procedure TfMenu.gravaModulos;
begin
  DMUtil.cdsModulo.Open;
  DMUtil.cdsModulo.EmptyDataSet;
  dmDatabase.cdsModuloRemoto.Open;
  while not dmDatabase.cdsModuloRemoto.Eof do
  begin
    DMUtil.cdsModulo.Insert;
    DMUtil.cdsModuloID.AsInteger  := dmDatabase.cdsModuloRemotoMODULO_ID.AsInteger;
    DMUtil.cdsModuloNOME.AsString := dmDatabase.cdsModuloRemotoMODULO_NOME.AsString;
    DMUtil.cdsModulo.Post;
  end;
  DMUtil.cdsModulo.ApplyUpdates(0);
  DMUtil.cdsModulo.Close;
end;

procedure TfMenu.GerarNotaServio1Click(Sender: TObject);
begin
  OpenForm(TfrmGerar_NFSe,wsMaximized);
end;

procedure TfMenu.OrdemdeServio1Click(Sender: TObject);
begin
  OpenForm(TfrmCadOrdemServico,wsMaximized);
end;

procedure TfMenu.OrdemdeServioBaixa1Click(Sender: TObject);
begin
  OpenForm(TfrmBaixaOrdemServico,wsMaximized);
end;

procedure TfMenu.OrdemdeServioConsulta1Click(Sender: TObject);
begin
  OpenForm(TfrmConsOrdemServico,wsMaximized);
end;

procedure TfMenu.Ferados1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFeriado,wsMaximized);
end;

procedure TfMenu.FeriadoFixo1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFeriado_Fixo,wsMaximized);
end;

procedure TfMenu.ContratoServio1Click(Sender: TObject);
begin
  OpenForm(TfrmCadContratoServ,wsMaximized);
end;

procedure TfMenu.CNAE1Click(Sender: TObject);
begin
  OpenForm(TfrmCadCNAE,wsMaximized);
end;

procedure TfMenu.abIBPT1Click(Sender: TObject);
begin
  OpenForm(TfrmCadTab_IBPT,wsMaximized);
end;

procedure TfMenu.prc_Verifica_Nota_Dupl(Tipo: String);
var
  sds: TSQLDataSet;
begin
  {sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    if (Tipo = 'A') or (Tipo = 'N') then
    begin
      sds.CommandText := 'SELECT COUNT(1) FROM NOTAFISCAL '
                       + 'WHERE ((NFECHAVEACESSO = ' + QuotedStr('') +')'
                       + ' OR (NFECHAVEACESSO IS NULL)) '
                       + ' AND (TIPO_REG = ' + QuotedStr('NTS') +')'
                       + ' AND (NUMNOTA > 0)'
                       + ' AND (CANCELADA = ' + QuotedStr('N') + ')';
      sds.Open;
      Label1.Visible := (sds.FieldByName('COUNT').AsInteger > 0);
      Shape1.Visible := (sds.FieldByName('COUNT').AsInteger > 0);
      sds.Close;
    end;
    if (Tipo = 'A') or (Tipo = 'D') then
    begin
      lblCheque.Visible         := Label5.Visible;
      lblCheque_Valor.Visible   := Label5.Visible;
      lblCPagar.Visible         := Label5.Visible;
      lblCPagar_Valor.Visible   := Label5.Visible;
      lblCReceber.Visible       := Label5.Visible;
      lblCReceber_Valor.Visible := Label5.Visible;
      Shape2.Visible            := Label5.Visible;
      if Label5.Visible then
      begin
        sds.Close;
        sds.CommandText := 'SELECT SUM(DUP.VLR_RESTANTE) VLR_RESTANTE, DUP.TIPO_ES '
                         + 'FROM DUPLICATA DUP '
                         + 'WHERE DUP.DTVENCIMENTO = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',Date))
                         + ' GROUP BY DUP.TIPO_ES ';
        sds.Open;
        while not sds.eof do
        begin
          if sds.FieldByName('TIPO_ES').AsString = 'E' then
            lblCReceber_Valor.Caption := 'R$ ' + FormatFloat('###,###,##0.00',sds.FieldByName('VLR_RESTANTE').AsFloat)
          else
            lblCPagar_Valor.Caption := 'R$ ' + FormatFloat('###,###,##0.00',sds.FieldByName('VLR_RESTANTE').AsFloat);
          sds.Next;
        end;
        sds.Close;
        sds.CommandText := 'SELECT SUM(C.VALOR) VALOR '
                         + 'FROM CHEQUE C '
                         + 'WHERE C.DTBOM_PARA = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',Date))
                         + ' AND C.DTCOMPENSADO IS NULL ';
        sds.Open;
        lblCheque_Valor.Caption := 'R$ ' + FormatFloat('###,###,##0.00',sds.FieldByName('VALOR').AsFloat);
        sds.Close;
      end;
    end;
  finally
    FreeAndNil(sds);
  end;}
end;

procedure TfMenu.Contabilista1Click(Sender: TObject);
begin
  OpenForm(TfrmCadContabilista,wsMaximized);
end;

procedure TfMenu.prc_Habilita_Menu;
var
  i: Integer;
begin
  for i := 0 to self.Menu.Items.Count - 1  do
    Self.Menu.Items.Items[i].Visible := Self.Menu.Items.Items[i].Enabled;

  for i := 0 to self.Menu.Items.Count - 1  do
    Self.Menu.Items.Items[i].Visible := Self.Menu.Items.Items[i].Enabled;

  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if Components[i] is TMenuItem then
      TMenuItem(Self.Components[i]).Visible := TMenuItem(Self.Components[i]).Enabled;
  end;
  tbNotaFiscal.Visible := NotaServio1.Visible;
  tbOServico.Visible   := OrdemdeServio1.Visible;
  tbProduto.Visible    := CadastroServiosInterno1.Visible;
  tbPessoa.Visible     := Pessoa1.Visible;
  vUsuario := UserControl1.CurrentUser.LoginName;
end;

procedure TfMenu.CondiodePagamento2Click(Sender: TObject);
begin
  OpenForm(TfrmCadCondPgto,wsMaximized);
end;

procedure TfMenu.ConfiguraoEmail1Click(Sender: TObject);
begin
  OpenForm(TfrmCadConfig_Email,wsMaximized);
end;

procedure TfMenu.Recibo1Click(Sender: TObject);
begin
  OpenForm(TfrmCadRecibo,wsMaximized);
end;

procedure TfMenu.prc_Verifica_Certificado;
var
  sds: TSQLDataSet;
  vDataFin : TDateTime;
  vDataIni : TDateTime;
  vQtdAux : Integer;
  fdmDatabase_NFeBD: TdmDatabase_NFeBD;
  vCont : Integer;
  vDiasVenc : Integer;
begin
  Label4.Caption := '';
  fdmDatabase_NFeBD := TdmDatabase_NFeBD.Create(Self);
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := fdmDatabase_NFeBD.scoNFeBD;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' SELECT CC.CNPJ_TITULAR, CC.chave_acesso, CC.validade_inicio, CC.validade_fim '
                       + ' FROM CONFIG_CERTIFICADOS CC';
    sds.Open;
    vCont := 0;
    sds.First;
    while not sds.Eof do
    begin
      try
        vDataIni := sds.FieldByName('validade_inicio').AsDateTime;
        vDataFin := sds.FieldByName('validade_fim').AsDateTime;
        vQtdAux  := DaysBetween(date,vDataFin);
        if vQtdAux <= 15 then
        begin
          vCont := vCont + 1;
          if vCont = 1 then
            vDiasVenc := vQtdAux
          else
          if vQtdAux < vDiasVenc then
            vDiasVenc := vQtdAux;
        end;
      except
      end;
      sds.Next;
    end;
    if vCont > 0 then
    begin
      Label4.Caption := 'Existe Certificado Digital vencendo em ...' + IntToStr(vDiasVenc) + ' dias...';
      Shape3.Visible := True;
      Label4.Visible := True;
    end;
    sds.Close;
  finally
    FreeAndNil(sds);
    FreeAndNil(fdmDatabase_NFeBD);
  end;

end;

procedure TfMenu.tbProdutoClick(Sender: TObject);
begin
  OpenForm(TfrmCadServico_Int,wsMaximized);
end;

procedure TfMenu.tbNotaFiscalClick(Sender: TObject);
begin
  NotaServio1Click(Sender);
//  OpenForm(TfrmCadNotaServico,wsMaximized,'');
end;

procedure TfMenu.ImportarClientesCSV1Click(Sender: TObject);
begin
  OpenForm(TfrmImp_Cliente_Txt,wsMaximized,'');
end;

procedure TfMenu.GerarNotaServioArquivoCSV1Click(Sender: TObject);
begin
  OpenForm(TfrmGerar_NFSe_txt,wsMaximized,'');
end;

//initialization
//  RLConsts.SetVersion(3,72,'B');

procedure TfMenu.ConfiguraoCertificado1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFilial_Certificado, wsMaximized);
end;

end.
