unit frmRouparia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxControls, cxPC, StdCtrls,
  ImgList, cxContainer, cxEdit, cxTextEdit, cxNavigator, cxDBNavigator,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, Menus, cxLookAndFeelPainters, cxGroupBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxDBEdit,
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ADODB,
  cxSpinEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxCalc, cxRadioGroup, DBCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppParameter,
  ppBands, ppCtrls, ppVar, dxGDIPlusClasses, ppPrnabl, ppCache;

type
  TfrmCadRp = class(TForm)
    cxDBNavigator1: TcxDBNavigator;
    ImageList1: TImageList;
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edtCod: TcxDBTextEdit;
    Label1: TLabel;
    cxButton2: TcxButton;
    Label2: TLabel;
    edtDesc: TcxDBTextEdit;
    Label4: TLabel;
    edtGeral: TcxDBTextEdit;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    ADOcMat: TADOStoredProc;
    dtcMat: TDataSource;
    Label3: TLabel;
    editPesq: TcxTextEdit;
    cxButton3: TcxButton;
    Panel2: TPanel;
    cxPageControl2: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    adoMOV: TADOStoredProc;
    dtMov: TDataSource;
    cxTabSheet4: TcxTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbmot: TcxComboBox;
    edtOut: TcxTextEdit;
    d1: TcxDateEdit;
    cxButton4: TcxButton;
    dbTot: TcxDBTextEdit;
    Label9: TLabel;
    dbcod: TDBLookupComboBox;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2DBTableView1Column3: TcxGridDBColumn;
    cxGrid2DBTableView1Column4: TcxGridDBColumn;
    adoTb: TADOQuery;
    dtTb: TDataSource;
    cxButton1: TcxButton;
    cxButton5: TcxButton;
    Panel3: TPanel;
    cb1: TCheckBox;
    ADOcheck: TADOStoredProc;
    cxGrid2DBTableView1Column5: TcxGridDBColumn;
    Label10: TLabel;
    edtRoupa: TcxDBTextEdit;
    ppDBPipeline1: TppDBPipeline;
    rel1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppParameterList2: TppParameterList;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBPipeline2: TppDBPipeline;
    rel2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage2: TppImage;
    ppSystemVariable4: TppSystemVariable;
    ppLabel11: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel20: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppParameterList1: TppParameterList;
    spQtde: TcxSpinEdit;
    adoBox: TADOQuery;
    dtBox: TDataSource;
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cbmotClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cb1Click(Sender: TObject);
    procedure ADOcMatAfterPost(DataSet: TDataSet);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ADOcMatAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRp: TfrmCadRp;

implementation
uses dm_mod_dad, frmPrincipal, frmReqRoupa;
{$R *.dfm}
//Buscar materiais cadastrados
procedure TfrmCadRp.cxButton3Click(Sender: TObject);
begin
  ADOcMat.close;
  ADOcMat.parameters[1].value := '%'+editPesq.text+'%';
  ADOcMat.parameters[8].value := '302';
  ADOcMat.open;

  editPesq.Clear;
end;
//Abre a proc de busca
procedure TfrmCadRp.FormCreate(Sender: TObject);
begin
  ADOcMat.open;
  adotb.open;
  adoBox.Open;
end;
//Fecha o formulario
procedure TfrmCadRp.cxButton2Click(Sender: TObject);
begin
  close;
end;
//Habilita o campo de edição se for selecionado o motivo como outros
procedure TfrmCadRp.cbmotClick(Sender: TObject);
begin
  if cbMot.ItemIndex = 2 then
    begin
      edtOut.Enabled := True
    END ELSE
      edtOut.Enabled := FALSE;
end;
//Se o botão de checagem estiver habilitado então será acrescentado registros ao estoque
//caso contrario continuará dispensando os itens
procedure TfrmCadRp.cxButton4Click(Sender: TObject);
begin
   if (cb1.Checked = true) and (spQtde.Value > 0) then
     begin
        dbTot.Text:= (spQtde.Value + dbTot.Text);
        ADOcheck.Close;
        adocheck.Parameters[1].Value := '1';
        adocheck.Parameters[3].Value := dbcod.KeyValue;
        adocheck.Parameters[6].Value := d1.Text;
        adocheck.Parameters[7].Value := 'Acrescentado ao estoque';
        adocheck.Parameters[11].Value := spQtde.Text;
        adocheck.Parameters[12].Value := dbtot.Text;
        adocheck.ExecProc;

        ADOcheck.Close;
        adocheck.Parameters[1].Value := '12';
        adocheck.Parameters[3].Value := dbcod.KeyValue;
        adocheck.Parameters[11].Value := spQtde.Text;
        adocheck.ExecProc;

        //d_mod_dad.seg.parameters[2].Value := matricula;
        //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
        //d_mod_dad.seg.parameters[1].Value := 'Acrescentou '+spQtde.Text+' item(s) ao estoque do material '+ADOcMat.fieldbyname('descricao').asstring;
        //d_mod_dad.seg.ExecProc;
        d1.Clear;
        spqtde.Clear;
        adotb.Close;
        adotb.Open;
        ADOcMat.Close;
        ADOcMat.Open;
        adoBox.Close;
        adoBox.Open;
    end else
        if spQtde.Value > 0 then
          begin
            dbTot.Text := ((spQtde.Value - dbTot.Text)* -1);
            ADOcheck.Close;
            adocheck.Parameters[1].Value := '1';
            adocheck.Parameters[3].Value := dbcod.KeyValue;
            adocheck.Parameters[6].Value := d1.Text;
            adocheck.Parameters[7].Value := cbmot.text;
            adocheck.Parameters[8].Value := edtout.Text;
            adocheck.Parameters[11].Value := spQtde.Text;
            adocheck.Parameters[12].Value := dbtot.Text;
            adocheck.ExecProc;

            //d_mod_dad.seg.parameters[2].Value := matricula;
            //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
            //d_mod_dad.seg.parameters[1].Value := 'Dispensou '+spQtde.Text+' item(s) ao estoque do material '+ADOcMat.fieldbyname('descricao').asstring;
            //d_mod_dad.seg.ExecProc;
            d1.Clear;
            spqtde.Clear;
            edtOut.Clear;
            adotb.Close;
            adotb.Open;
            ADOcMat.Close;
            ADOcMat.Open;
            adoBox.Close;
            adoBox.Open;
    end
end;
//Se o botão de checagem estiver habilitado, entao o seletor de motivos ficará desabilitado
procedure TfrmCadRp.cb1Click(Sender: TObject);
begin
  if cb1.Checked = true then
    begin
      cbmot.Enabled := false;
end else
      begin
        cbmot.Enabled := true;
      end;
end;
//Após inserção de valores, registro na tabela log
procedure TfrmCadRp.ADOcMatAfterPost(DataSet: TDataSet);
begin
     //d_mod_dad.seg.parameters[2].Value := matricula;
     //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
     //d_mod_dad.seg.parameters[1].Value := 'Adicionou o material: '+ADOcMat.fieldbyname('descricao').asstring;
     //d_mod_dad.seg.ExecProc;
     adoBox.Close;
     adoBox.Open;
     adotb.Close;
     adotb.Open;
     frmreq.adoRp.Close;
     frmreq.adoRp.Open;
end;

procedure TfrmCadRp.cxButton5Click(Sender: TObject);
begin
  rel1.Print;
end;

procedure TfrmCadRp.cxButton1Click(Sender: TObject);
begin
 rel2.Print;
end;

procedure TfrmCadRp.ADOcMatAfterDelete(DataSet: TDataSet);
begin
    adoBox.Close;
    adoBox.Open;
    adotb.Close;
    adotb.Open;
end;

end.
