unit UCadNotaServico_Canc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, RxDBComb, uDMCadNotaServico,
  RzCmboBx, RzDBCmbo, Buttons, ExtCtrls, DBCtrls, RzButton;

type
  TfrmCadNotaServico_Canc = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btnConfirmar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    Edit1: TEdit;
    RzComboBox1: TRzComboBox;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadNotaServico  : TDMCadNotaServico;

  end;

var
  frmCadNotaServico_Canc: TfrmCadNotaServico_Canc;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmCadNotaServico_Canc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadNotaServico_Canc.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaServico);
  CurrencyEdit1.AsInteger := fDMCadNotaServico.cdsNotaServicoNUMNOTA.AsInteger;
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
  begin
    RzComboBox1.Items.Clear;
    RzComboBox1.Items.Add('1- Serviço Não Prestado');
    RzComboBox1.Items.Add('2- NFSe emitida com dados incorretos');
  end
  else
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
  begin
    RzComboBox1.Items.Clear;
    RzComboBox1.Items.Add('1- Erro na emissão');
    RzComboBox1.Items.Add('2- Serviço não concluído');
  end;
  DateEdit1.Date := Date;
end;

procedure TfrmCadNotaServico_Canc.btnConfirmarClick(Sender: TObject);
begin
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data de cancelamento não foi informada!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMCadNotaServico.vMSGNotaServico := '';
  if RzComboBox1.ItemIndex < 0 then
    fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Código do cancelamento não informado';
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'PORTO ALEGRE') then
  begin
    if (RzComboBox1.ItemIndex = 3) or (RzComboBox1.ItemIndex = 5) then
      fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Código do cancelamento inválido';
    if trim(Edit1.Text) = '' then
      fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Motivo do cancelamento não informado';
  end;

  if trim(fDMCadNotaServico.vMSGNotaServico) <> '' then
  begin
    MessageDlg(fDMCadNotaServico.vMSGNotaServico, mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.vCod_Cancelamento   := RzComboBox1.ItemIndex;
  fDMCadNotaServico.vMotivoCancelamento := Edit1.Text;
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM') or (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE') then
    fDMCadNotaServico.vCod_Cancelamento := fDMCadNotaServico.vCod_Cancelamento + 1;
  fDMCadNotaServico.vDtCancelamento := DateEdit1.Date;
  Close;
end;

procedure TfrmCadNotaServico_Canc.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
