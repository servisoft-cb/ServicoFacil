unit UCadFilial_Certificado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, DBGrids,
  ExtCtrls, StdCtrls, DB, RzTabs, DBCtrls, ToolEdit, UCBase, RxLookup, Mask, RXDBCtrl, RxDBComb, NxCollection,
  ComCtrls, StrUtils, UDMCadFilial_Certificado, ACBrBase, ACBrDFe, ACBrNFe;

type
  TfrmCadFilial_Certificado = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnImprimir: TNxButton;
    stat1: TStatusBar;
    RzPageControl2: TRzPageControl;
    TS_Dados: TRzTabSheet;
    pnlCadastro: TPanel;
    Label12: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    UCControls1: TUCControls;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    ACBrNFe1: TACBrNFe;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadFilial_Certificado : TDMFilial_Certificado;
    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
  public
    { Public declarations }
  end;

var
  frmCadFilial_Certificado: TfrmCadFilial_Certificado;

implementation

uses
  DmdDatabase, rsDBUtils, uUtilPadrao, UMenu, ACBrDFeSSL;

{$R *.dfm}

procedure TfrmCadFilial_Certificado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadFilial_Certificado.btnExcluirClick(Sender: TObject);
begin
  if fDMCadFilial_Certificado.cdsFilial_Certificado.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  prc_Excluir_Registro;
end;

procedure TfrmCadFilial_Certificado.prc_Excluir_Registro;
begin
  fDMCadFilial_Certificado.prc_Excluir;
end;

procedure TfrmCadFilial_Certificado.prc_Gravar_Registro;
begin
  fDMCadFilial_Certificado.prc_Gravar;
  if fDMCadFilial_Certificado.cdsFilial_Certificado.State in [dsEdit, dsInsert] then
  begin
    MessageDlg(fDMCadFilial_Certificado.vMsgErro, mtError, [mbOk], 0);
    exit;
  end;

  TS_Consulta.TabEnabled := not (TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled := not (pnlCadastro.Enabled);
  btnConfirmar.Enabled := not (btnConfirmar.Enabled);
  btnAlterar.Enabled := not (btnAlterar.Enabled);
end;

procedure TfrmCadFilial_Certificado.prc_Inserir_Registro;
begin
  fDMCadFilial_Certificado.prc_Inserir;

  if fDMCadFilial_Certificado.cdsFilial_Certificado.State in [dsBrowse] then
    exit;

  if fDMCadFilial_Certificado.cdsFilial.RecordCount > 1 then
    fDMCadFilial_Certificado.cdsFilial_CertificadoID.AsInteger := fDMCadFilial_Certificado.cdsFilial_CertificadoID.AsInteger;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled := False;
  btnConfirmar.Enabled := True;
  pnlCadastro.Enabled := True;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfrmCadFilial_Certificado.FormShow(Sender: TObject);
begin
  fDMCadFilial_Certificado := TDMFilial_Certificado.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadFilial_Certificado);
  fDMCadFilial_Certificado.cdsFilial.Close;
  fDMCadFilial_Certificado.cdsFilial.Open;
  fnc_Busca_Nome_Filial;
  stat1.Panels[1].Text := vFilial_Nome;
  stat1.Panels[0].Text := vUsuario;
  stat1.Panels[2].Text := 'Duplo clique para consultar';
end;

procedure TfrmCadFilial_Certificado.prc_Consultar;
begin
  fDMCadFilial_Certificado.cdsFilial_Certificado.Close;
  fDMCadFilial_Certificado.sdsFilial_Certificado.CommandText := fDMCadFilial_Certificado.ctCommand + ' WHERE 0 = 0 ';
  fDMCadFilial_Certificado.cdsFilial_Certificado.Open;
end;

procedure TfrmCadFilial_Certificado.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadFilial_Certificado.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadFilial_Certificado.cdsFilial_Certificado.State in [dsBrowse]) or not (fDMCadFilial_Certificado.cdsFilial_Certificado.Active) then
  begin
    stat1.Panels[2].Text := 'Duplo clique para consulta';
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  fDMCadFilial_Certificado.cdsFilial_Certificado.CancelUpdates;
  TS_Consulta.TabEnabled := True;
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled := not (pnlCadastro.Enabled);
  btnConfirmar.Enabled := not (btnConfirmar.Enabled);
  btnAlterar.Enabled := not (btnAlterar.Enabled);
end;

procedure TfrmCadFilial_Certificado.SMDBGrid1DblClick(Sender: TObject);
begin
  stat1.Panels[2].Text := '';
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadFilial_Certificado.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadFilial_Certificado.cdsFilial_Certificado.IsEmpty) or not (fDMCadFilial_Certificado.cdsFilial_Certificado.Active) or (fDMCadFilial_Certificado.cdsFilial_CertificadoID.AsInteger < 1) then
    exit;

  fDMCadFilial_Certificado.cdsFilial_Certificado.Edit;
  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled := False;
  btnConfirmar.Enabled := True;
  pnlCadastro.Enabled := True;
  stat1.Panels[2].Text := '';
end;

procedure TfrmCadFilial_Certificado.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
  stat1.Panels[2].Text := 'Duplo clique para consulta';
end;

procedure TfrmCadFilial_Certificado.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadFilial_Certificado);
end;

procedure TfrmCadFilial_Certificado.btnInserirClick(Sender: TObject);
begin
  stat1.Panels[2].Text := '';
  prc_Inserir_Registro;
end;

procedure TfrmCadFilial_Certificado.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadFilial_Certificado.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not (pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus;
end;

procedure TfrmCadFilial_Certificado.SpeedButton1Click(Sender: TObject);
var
  vDocumento : String;
begin
  ACBrNFe1.SSL.SelecionarCertificado;

   if ACBrNFe1.SSL.CertificadoLido then
   begin
     fDMCadFilial_Certificado.cdsFilial_CertificadoNUMERO_SERIE.AsString := ACBrNFe1.SSL.CertNumeroSerie;
     vDocumento := ACBrNFe1.SSL.CertCNPJ;
   end;
end;

end.

