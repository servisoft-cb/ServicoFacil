unit UDMGerar_NFSe;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDMGerar_NFSe = class(TDataModule)
    mExtrato: TClientDataSet;
    dsmExtrato: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGerar_NFSe: TDMGerar_NFSe;

implementation

{$R *.dfm}

end.
