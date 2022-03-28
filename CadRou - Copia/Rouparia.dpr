program Rouparia;

uses
  Forms,
  frmRouparia in 'frmRouparia.pas' {frmCadRp},
  dm_mod_dad in 'dm_mod_dad.pas' {dmCon: TDataModule},
  frmReqRoupa in 'frmReqRoupa.pas' {frmReq},
  frmPrincipal in 'frmPrincipal.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TdmCon, dmCon);
  Application.Run;
end.
