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
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'ABACO1' then
  begin
    RzComboBox1.Items.Clear;
    RzComboBox1.Items.Add('MC01- Servi�o n�o realizado ');
    RzComboBox1.Items.Add('MC02- Dados cadastrais incorretos ');
    RzComboBox1.Items.Add('MC03- Diverg�ncia no pre�o do servi�o ');
    RzComboBox1.Items.Add('MC04- Outros dados incorretos');
  end
  else
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'CAMPO BOM' then
  begin
    RzComboBox1.Items.Clear;
    RzComboBox1.Items.Add('1- Servi�o N�o Prestado');
    RzComboBox1.Items.Add('2- NFSe emitida com dados incorretos');
  end
  else
  if fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString = 'PORTO ALEGRE' then
  begin
    RzComboBox1.Items.Clear;
    RzComboBox1.Items.Add('1- Erro na emiss�o');
    RzComboBox1.Items.Add('2- Servi�o n�o conclu�do');
  end;
  DateEdit1.Date := Date;
end;

procedure TfrmCadNotaServico_Canc.btnConfirmarClick(Sender: TObject);
begin
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data de cancelamento n�o foi informada!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMCadNotaServico.vMSGNotaServico := '';
  if RzComboBox1.ItemIndex < 0 then
    fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** C�digo do cancelamento n�o informado';
  if (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'CAMPO BOM') and (fDMCadNotaServico.cdsFilialNOME_PROVEDOR.AsString <> 'PORTO ALEGRE') then
  begin
    if (RzComboBox1.ItemIndex = 3) or (RzComboBox1.ItemIndex = 5) then
      fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** C�digo do cancelamento inv�lido';
    if trim(Edit1.Text) = '' then
      fDMCadNotaServico.vMSGNotaServico := fDMCadNotaServico.vMSGNotaServico + #13 + '*** Motivo do cancelamento n�o informado';
  end;

  if trim(fDMCadNotaServico.vMSGNotaServico) <> '' then
  begin
    MessageDlg(fDMCadNotaServico.vMSGNotaServico, mtError, [mbOk], 0);
    exit;
  end;
  fDMCadNotaServico.vCod_Cancelamento   := RzComboBox1.ItemIndex;
  fDMCadNotaServico.vMotivoCancelamento := Edit1.Text;
  fDMCadNotaServico.vCod_Cancelamento   := fDMCadNotaServico.vCod_Cancelamento + 1;
  fDMCadNotaServico.vDtCancelamento     := DateEdit1.Date;
  Close;
end;

procedure TfrmCadNotaServico_Canc.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
