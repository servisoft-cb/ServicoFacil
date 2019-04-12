unit uEnvio_NFSe_Acbr;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, SqlExpr, DmdDatabase, dbXPress,
  uDMNFSe, UDMCadNotaServico;

procedure prc_Envio(fDMCadNotaServico: TDMCadNotaServico; fDMNFSe: TDMNFSe);

implementation

uses
  DateUtils, uUtilPadrao;

procedure prc_Envio(fDMCadNotaServico: TDMCadNotaServico; fDMNFSe: TDMNFSe);
begin
  fDMNFSe.Enviar_Nfse;


end;


end.

