unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses frmRouparia, frmReqRoupa, dm_mod_dad;

{$R *.dfm}

procedure TfrmMenu.cxButton2Click(Sender: TObject);
begin
  if frmReq = nil then
     frmReq := TfrmReq.create(self);
     frmReq.Show;
end;

procedure TfrmMenu.cxButton1Click(Sender: TObject);
begin
   if frmCadRp = nil then
      frmCadRp := TfrmCadRp.create(self);
      frmCadRp.Show;
end;

end.
