unit UCadNotaServico_Itens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadNotaServico, ExtCtrls, StdCtrls, RxLookup, Mask, DBCtrls,
  Buttons, DB, RzCmboBx, RzDBCmbo;

type
  TfrmCadNotaServico_Itens = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    RzDBComboBox1: TRzDBComboBox;
    Label6: TLabel;
    RzDBComboBox2: TRzDBComboBox;
    Label7: TLabel;
    RzDBComboBox3: TRzDBComboBox;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    RzDBComboBox4: TRzDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadNotaServico: TDMCadNotaServico;
  end;

var
  frmCadNotaServico_Itens: TfrmCadNotaServico_Itens;

implementation

uses
  rsDBUtils, Math;

{$R *.dfm}

procedure TfrmCadNotaServico_Itens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDMCadNotaServico.vSomar_Diminuir_Ant := '';
  fDMCadNotaServico.vCalcular_INSS_Ant := '';
  fDMCadNotaServico.vCalcular_ISSQN_Ant := '';
  fDMCadNotaServico.vCalcular_PisCofins_Ant := '';
  fDMCadNotaServico.vCalcular_CSLL_Ant := '';
  fDMCadNotaServico.vCalcular_IR_Ant := '';

  if fDMCadNotaServico.cdsNotaServico_Itens.State in [dsEdit, dsInsert] then
    fDMCadNotaServico.cdsNotaServico_Itens.Cancel;
  Action := Cafree;
end;

procedure TfrmCadNotaServico_Itens.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaServico);

  if fDMCadNotaServico.cdsClienteCODIGO.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger then
    fDMCadNotaServico.cdsCliente.Locate('CODIGO', fDMCadNotaServico.cdsNotaServicoID_CLIENTE.AsInteger, [loCaseInsensitive]);
  Label8.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  Label9.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit6.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit7.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');

  Label10.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  Label11.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  Label12.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  Label13.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit8.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit9.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit10.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
  DBEdit11.Visible := (fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString = 'I');
end;

procedure TfrmCadNotaServico_Itens.BitBtn1Click(Sender: TObject);
begin
  fDMCadNotaServico.vMSGNotaServico := '';
  if fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger <= 0 then
    fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Serviço interno não informado!';
  if fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat <= 0 then
    fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Valor unitário não informado!';
  if trim(fDMCadNotaServico.vMSGNotaServico) <> '' then
  begin
    MessageDlg(fDMCadNotaServico.vMSGNotaServico, mtError, [mbOk], 0);
    exit;
  end;
  if StrToFloat(FormatFloat('0.00000', fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat)) <= 0 then
    fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat := StrToFloat(FormatFloat('0.00000', 1));
  if (fDMCadNotaServico.cdsParametrosUSA_RECIBO_NFSE.AsString = 'S') and (fDMCadNotaServico.cdsNotaServicoNUM_CONTRATO.AsInteger > 0) then
  begin
    if fDMCadNotaServico.fnc_Recibo_Gerado then
      fDMCadNotaServico.cdsNotaServico_ItensGERAR_DUPLICATA.AsString := 'N';
  end;
  fDMCadNotaServico.cdsNotaServico_Itens.Post;

  Close;
end;

procedure TfrmCadNotaServico_Itens.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadNotaServico_Itens.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    fDMCadNotaServico.cdsNotaServico_ItensNOME_SERVICO_INT.AsString := RxDBLookupCombo1.Text;
end;

procedure TfrmCadNotaServico_Itens.DBEdit2Exit(Sender: TObject);
var
  vAux: Real;
begin
  vAux := RoundTo(StrToFloat(FormatFloat('0.000', fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat * fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat)), -2);
  fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat := vAux;
end;

procedure TfrmCadNotaServico_Itens.DBEdit3Exit(Sender: TObject);
var
  vAux: Real;
begin
  vAux := RoundTo(StrToFloat(FormatFloat('0.000', fDMCadNotaServico.cdsNotaServico_ItensVLR_UNITARIO.AsFloat * fDMCadNotaServico.cdsNotaServico_ItensQTD.AsFloat)), -2);
  fDMCadNotaServico.cdsNotaServico_ItensVLR_TOTAL.AsFloat := vAux;

end;

procedure TfrmCadNotaServico_Itens.SpeedButton1Click(Sender: TObject);
begin
  fDMCadNotaServico.cdsServico_Int.Close;
  fDMCadNotaServico.cdsServico_Int.Open;
end;

procedure TfrmCadNotaServico_Itens.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadNotaServico.cdsServico_Int.IndexFieldNames := 'NOME';
end;

procedure TfrmCadNotaServico_Itens.Panel2Exit(Sender: TObject);
begin
  fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  if (fDMCadNotaServico.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString <> 'I') and (fDMCadNotaServico.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString <> 'P') then
    exit;
  if fDMCadNotaServico.cdsServico_IntID.AsInteger <> fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger then
    fDMCadNotaServico.cdsServico_Int.Locate('ID', fDMCadNotaServico.cdsNotaServico_ItensID_SERVICO_INT.AsInteger, [loCaseInsensitive]);
  if fDMCadNotaServico.cdsServicoID.AsInteger <> fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger then
    fDMCadNotaServico.cdsServico.Locate('ID', fDMCadNotaServico.cdsNotaServicoID_SERVICO.AsInteger, [loCaseInsensitive]);
  if (fDMCadNotaServico.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'P') or (copy(fDMCadNotaServico.cdsParametrosLEI_TRANSPARENCIA_SERVICO.AsString, 1, 1) = 'P') then
  begin
    //fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.cdsNotaServicoPERC_TRIBUTO.AsFloat));
    fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00', fDMCadNotaServico.cdsNotaServicoPERC_TRIBUTO_ESTADUAL.AsFloat));
    fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00', fDMCadNotaServico.cdsNotaServicoPERC_TRIBUTO_FEDERAL.AsFloat));
    fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00', fDMCadNotaServico.cdsNotaServicoPERC_TRIBUTO_MUNICIPAL.AsFloat));
  end
  else
  begin
    if trim(fDMCadNotaServico.cdsServico_IntCODIGO_NBS.AsString) <> '' then
      //fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.fnc_Busca_IBPT(fDMCadNotaServico.cdsServico_IntCODIGO_NBS.AsString)))
      fDMCadNotaServico.prc_Busca_IBPT(fDMCadNotaServico.cdsServico_IntCODIGO_NBS.AsString, 'I')
    else if trim(fDMCadNotaServico.cdsServicoCODIGO_NBS.AsString) <> '' then
      //fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaServico.fnc_Busca_IBPT(fDMCadNotaServico.cdsServicoCODIGO_NBS.AsString)))
      fDMCadNotaServico.prc_Busca_IBPT(fDMCadNotaServico.cdsServicoCODIGO_NBS.AsString, 'I')
    else
    begin
      fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
      fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
      fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
      fDMCadNotaServico.cdsNotaServico_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00', 0));
    end;
  end;
end;

end.

