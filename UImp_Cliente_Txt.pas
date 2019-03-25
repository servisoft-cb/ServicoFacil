unit UImp_Cliente_Txt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadPessoa, StdCtrls, Mask, ToolEdit, NxCollection;

type
  TfrmImp_Cliente_Txt = class(TForm)
    lbDiretorio: TLabel;
    File_Cliente: TFilenameEdit;
    btnImportar: TNxButton;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vArquivo : String;
    Txt  : TextFile;
    fDMCadPessoa: TDMCadPessoa;
    vCod_Alfa : String;

    procedure prc_Gravar_Pessoa;
    function fnc_Busca_Cod_Alfa : String;
    function fnc_selecionar_Campo(Campo : String) : String;
    procedure prc_Localiza_Cidade;

  public
    { Public declarations }
  end;

var
  frmImp_Cliente_Txt: TfrmImp_Cliente_Txt;

implementation

uses uUtilPadrao, StrUtils;

{$R *.dfm}

procedure TfrmImp_Cliente_Txt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmImp_Cliente_Txt.btnImportarClick(Sender: TObject);
var
  vCont : Integer;
  i : Integer;
  vCod_Ant : String;
begin
  vArquivo := fnc_verifica_Arquivo(File_Cliente.Text,'L');
  AssignFile(Txt, vArquivo);
  vCod_Alfa := '';
  vCod_Ant  := '';
  Reset(Txt);
  try
    while not Eof(Txt) do
    begin
      ReadLn(Txt,vRegistro_CSV);
      i := posex('Textbox',vRegistro_CSV);
      //if Copy(vRegistro_CSV,1,4) <> 'Text' then
      if i <= 0 then
      begin
        vCod_Alfa := fnc_Busca_Cod_Alfa;
        if Length(vCod_Alfa) < 10 then
        begin
          try
            if (vCod_Alfa <> vCod_Ant) AND (trim(vCod_Alfa) <> '') then
            begin
              prc_Gravar_Pessoa;
            end;
            if trim(vCod_Alfa) <> '' then
              vCod_Ant := vCod_Alfa;
          except
            on e: Exception do
              ShowMessage('Ocorreu o seguinte erro ao importar: Cód: ' + vCod_Alfa + #13 + e.Message);
          end;
        end;
      end;
    end;

  finally
    CloseFile(Txt);
  end;
  MessageDlg('Tabela de clientes gravada!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmImp_Cliente_Txt.prc_Gravar_Pessoa;
var
  i : Integer;
  vAux : String;
begin
  fDMCadPessoa.cdsPessoa.Close;
  fDMCadPessoa.sdsPessoa.CommandText := fDMCadPessoa.ctCommand + ' WHERE COD_ALFA = ' + QuotedStr(vCod_Alfa);
  fDMCadPessoa.cdsPessoa.Open;
  if not fDMCadPessoa.cdsPessoa.IsEmpty then
  begin
    if CheckBox1.Checked then
      exit;
    fDMCadPessoa.cdsPessoa.Edit;
  end
  else
  begin
    fDMCadPessoa.prc_Inserir('C');
    
  end;
  fDMCadPessoa.cdsPessoaCOD_ALFA.AsString := vCod_Alfa;
  i := pos('-',vRegistro_CSV);
  if i > 0 then
    delete(vRegistro_CSV,1,i+1);
  fDMCadPessoa.cdsPessoaNOME.AsString := fnc_Montar_Campo(',');
  fDMCadPessoa.cdsPessoaHOMEPAGE.AsString := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(',');
  if PosEx('Ativo',vAux) > 0 then
    fDMCadPessoa.cdsPessoaINATIVO.AsString := 'N'
  else
    fDMCadPessoa.cdsPessoaINATIVO.AsString := 'S';
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_selecionar_Campo(vAux);
  if trim(vAux) <> '' then
    fDMCadPessoa.cdsPessoaDTCADASTRO.AsString := vAux;
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_selecionar_Campo(vAux);
  if trim(vAux) <> '' then
  begin
    fDMCadPessoa.cdsPessoaCNPJ_CPF.AsString := trim(vAux);
    if Length(trim(vAux)) > 15 then
      fDMCadPessoa.cdsPessoaPESSOA.AsString := 'J'
    else
      fDMCadPessoa.cdsPessoaPESSOA.AsString := 'F';
  end;
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_selecionar_Campo(vAux);
  fDMCadPessoa.cdsPessoaFANTASIA.AsString := vAux;
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_selecionar_Campo(vAux);
  fDMCadPessoa.cdsPessoaEMAIL_NFE.AsString := vAux;
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(',');
  fDMCadPessoa.cdsPessoaTP_CLIENTE.AsString := 'S';
  vAux := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(',');
  if copy(vAux,1,1) = '"' then
    Delete(vAux,1,1);
  if copy(vAux,Length(vAux),1) = '"' then
    Delete(vAux,1,1);
  fDMCadPessoa.cdsPessoaENDERECO.AsString := vAux;
  vAux := fnc_Montar_Campo(',');
  vRegistro_CSV2 := vAux;
  vAux := fnc_Montar_Campo('-',vRegistro_CSV2);
  fDMCadPessoa.cdsPessoaNUM_END.AsString := trim(vAux);
  vAux := fnc_Montar_Campo('-',vRegistro_CSV2);
  fDMCadPessoa.cdsPessoaBAIRRO.AsString := trim(vAux);
  vAux := fnc_Montar_Campo('-',vRegistro_CSV2);
  fDMCadPessoa.cdsPessoaCIDADE.AsString := TirarAcento(trim(vAux));
  vAux := fnc_Montar_Campo('-',vRegistro_CSV2);
  fDMCadPessoa.cdsPessoaUF.AsString := trim(vAux);
  prc_Localiza_Cidade;
  if not fDMCadPessoa.cdsCidade.IsEmpty then
    fDMCadPessoa.cdsPessoaID_CIDADE.AsInteger := fDMCadPessoa.cdsCidadeID.AsInteger
  else
    fDMCadPessoa.cdsPessoaUF.Clear;
  vAux := vRegistro_CSV2;
  i := posex('CEP',vAux);
  //vAux := fnc_Montar_Campo('-',vRegistro_CSV2);
  //vAux := vRegistro_CSV2;
  if i > 0 then
    fDMCadPessoa.cdsPessoaCEP.AsString := copy(vAux,i+3,9);
  vRegistro_CSV2 := fnc_Montar_Campo(',');
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo(':',vRegistro_CSV2)
  else
    vAux := '';
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo('-',vRegistro_CSV2)
  else
    vAux := '';
  vAux := Monta_Numero(vAux,0);
  if Length(vAux) < 4 then
  begin
    if trim(vAux) <> '' then
      fDMCadPessoa.cdsPessoaDDDFONE1.AsString := vAux;
  end;
  fDMCadPessoa.cdsPessoaTELEFONE1.AsString := vRegistro_CSV2;

  vRegistro_CSV2 := fnc_Montar_Campo(',');
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo(':',vRegistro_CSV2)
  else
    vAux := '';
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo('-',vRegistro_CSV2)
  else
    vAux := vRegistro_CSV2;
  vAux := Monta_Numero(vAux,0);
  if Length(vAux) < 4 then
  begin
    if trim(vAux) <> '' then
      fDMCadPessoa.cdsPessoaDDDFAX.AsString := vAux;
  end;
  fDMCadPessoa.cdsPessoaFANTASIA.AsString := vRegistro_CSV2;
  vAux := fnc_Montar_Campo(',');
  //vAux := fnc_Montar_Campo(',');
  vAux := fnc_Montar_Campo(','); //CNAE
  vAux := fnc_Montar_Campo(','); //CNAE Descrição
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Insc. Estadual
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo(':',vRegistro_CSV2);
  fDMCadPessoa.cdsPessoaINSCR_EST.AsString := trim(vRegistro_CSV2);
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Insc. Municipal
  if trim(vRegistro_CSV2) <> '' then
    vAux := fnc_Montar_Campo(':',vRegistro_CSV2)
  else
    vAux := '';
  fDMCadPessoa.cdsPessoaINSC_MUNICIPAL.AsString := trim(vRegistro_CSV2);
  vRegistro_CSV2 := fnc_Montar_Campo(','); //INSS,CEI
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Alvará
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Tipo de Registro
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Data do Registro
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Número do Registro
  vRegistro_CSV2 := fnc_Montar_Campo(','); //UF do Registro
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Atividades
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Capital Social
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Conta Tesouraria
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Série
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Multa por atraso
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Juros por dia
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Dias para protesto
  vRegistro_CSV2 := fnc_Montar_Campo(','); //Instruções a listar no boleto
  fDMCadPessoa.cdsPessoaUSUARIO.AsString := 'IMP.NFSE';
  if fDMCadPessoa.cdsPessoaDTCADASTRO.AsDateTime < 10 then
  begin
    fDMCadPessoa.cdsPessoaDTCADASTRO.AsDateTime := Date;
    fDMCadPessoa.cdsPessoaHRCADASTRO.AsDateTime := Now;
  end;
  fDMCadPessoa.cdsPessoaID_PAIS.AsInteger          := 1;
  fDMCadPessoa.cdsPessoaTP_CLIENTE.AsString        := 'S';
  fDMCadPessoa.cdsPessoaTP_FORNECEDOR.AsString     := 'N';
  fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString := 'N';
  fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString       := 'N';
  fDMCadPessoa.cdsPessoaTP_ATELIER.AsString        := 'N';
  fDMCadPessoa.cdsPessoaORGAO_PUBLICO.AsString     := 'N';
  fDMCadPessoa.cdsPessoaUSA_TRANSFICMS.AsString    := 'N';
  fDMCadPessoa.cdsPessoaCLIENTE_ESTOQUE.AsString   := 'N';
  fDMCadPessoa.cdsPessoaUSA_TAMANHO_AGRUPADO_NFE.AsString := 'N';
  fDMCadPessoa.cdsPessoaTP_ALUNO.AsString                 := 'N';

  if fDMCadPessoa.cdsPessoaINSCR_EST.AsString = 'ISENTO' then
    fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 2
  else
  if trim(fDMCadPessoa.cdsPessoaINSCR_EST.AsString) <> '' then
    fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 1
  else
    fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 9;

  if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F' then
    fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 1
  else
    fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 0;
  fDMCadPessoa.cdsPessoa.Post;
  fDMCadPessoa.cdsPessoa.ApplyUpdates(0);
end;

procedure TfrmImp_Cliente_Txt.FormShow(Sender: TObject);
begin
  fDMCadPessoa := TDMCadPessoa.Create(Self);
end;

function TfrmImp_Cliente_Txt.fnc_Busca_Cod_Alfa: String;
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

function TfrmImp_Cliente_Txt.fnc_selecionar_Campo(Campo : String) : String;
var
  i : Integer;
begin
  i := pos(':',Campo);
  if i > 0 then
    Result := TrimLeft(copy(Campo,i+1,Length(Campo)))
  else
    Result := '';
end;

procedure TfrmImp_Cliente_Txt.prc_Localiza_Cidade;
begin
  fDMCadPessoa.cdsCidade.Close;
  fDMCadPessoa.sdsCidade.CommandText := fDMCadPessoa.ctCidade
                                      + ' WHERE UF = ' + QuotedStr(fDMCadPessoa.cdsPessoaUF.AsString)
                                      + '   AND NOME = ' + QuotedStr(fDMCadPessoa.cdsPessoaCIDADE.AsString);
  fDMCadPessoa.cdsCidade.Open;
end;

end.
