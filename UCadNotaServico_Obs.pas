unit UCadNotaServico_Obs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit,
  uDMCadNotaServico, Buttons, ExtCtrls, DBCtrls, RzButton, UCadObs_Aux, DB, RxLookup;

type
  TfrmCadNotaServico_Obs = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    Label23: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton3: TSpeedButton;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Memo1: TMemo;
    RzBitBtn1: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ffrmCadObs_Aux: TfrmCadObs_Aux;
  public
    { Public declarations }
    fDMCadNotaServico : TDMCadNotaServico;

  end;

var
  frmCadNotaServico_Obs: TfrmCadNotaServico_Obs;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmCadNotaServico_Obs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadNotaServico_Obs.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaServico);
end;

procedure TfrmCadNotaServico_Obs.btnConfirmarClick(Sender: TObject);
begin
  if trim(Memo1.Lines.Text) = '' then
    exit;
  if fDMCadNotaServico.cdsNotaServico.State in [dsBrowse] then
    fDMCadNotaServico.cdsNotaServico.Edit;
  if (fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.IsNull) or (trim(fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.Value) = '') then
    fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.Value := Memo1.Lines.Text
  else
    fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.Value := fDMCadNotaServico.cdsNotaServicoDISCRIMINACAO.Value + '(' + Memo1.Lines.Text + ')';
  Close;
end;

procedure TfrmCadNotaServico_Obs.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadNotaServico_Obs.SpeedButton3Click(Sender: TObject);
begin
  fDMCadNotaServico.cdsObs_Aux.Close;
  fDMCadNotaServico.cdsObs_Aux.Open;
end;

procedure TfrmCadNotaServico_Obs.SpeedButton7Click(Sender: TObject);
begin
  ffrmCadObs_Aux := TfrmCadObs_Aux.Create(self);
  ffrmCadObs_Aux.ShowModal;

  FreeAndNil(ffrmCadObs_Aux);

  SpeedButton3Click(Sender);
end;

procedure TfrmCadNotaServico_Obs.RzBitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo7.Text = '' then
    exit;
  Memo1.Lines.Clear;
  Memo1.Lines.Text := fDMCadNotaServico.cdsObs_AuxOBS.AsString;
  Memo1.SetFocus;
end;

procedure TfrmCadNotaServico_Obs.Memo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) or (Key = #10) then
    Key := ' ';
end;

end.
