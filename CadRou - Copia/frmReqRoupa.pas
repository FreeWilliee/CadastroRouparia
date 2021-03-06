unit frmReqRoupa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinsDefaultPainters, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxSpinEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls,
  DBCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxGroupBox, Menus, cxLookAndFeelPainters, cxButtons, ADODB,
  ppParameter, ppBands, ppCtrls, ppVar, dxGDIPlusClasses, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  cxCheckBox;

type
  TfrmReq = class(TForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    dbMat: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    d1: TcxDateEdit;
    Label3: TLabel;
    seQtde: TcxSpinEdit;
    Label4: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    GridUsuSol: TcxGridDBColumn;
    GridDataLib: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    edObs: TEdit;
    Label5: TLabel;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cbSet: TComboBox;
    dtRp: TDataSource;
    adoSol: TADOStoredProc;
    GridLib: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    LIberarMaterial1: TMenuItem;
    N1: TMenuItem;
    MarcaremFalta1: TMenuItem;
    DesmarcaremFalta1: TMenuItem;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    Shape3: TShape;
    Label8: TLabel;
    N2: TMenuItem;
    RetornaraoEstoque1: TMenuItem;
    Panel2: TPanel;
    Label9: TLabel;
    seQtde2: TcxSpinEdit;
    btnRet: TcxButton;
    btnCancel: TcxButton;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    Shape4: TShape;
    Label10: TLabel;
    dtMs: TDataSource;
    adoLib: TADOStoredProc;
    adoFalt: TADOStoredProc;
    adoRet: TADOStoredProc;
    adoMs: TADOStoredProc;
    adoRp: TADOQuery;
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
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppParameterList2: TppParameterList;
    ppLabel11: TppLabel;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppDBText2: TppDBText;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    cb2: TcxCheckBox;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RetornaraoEstoque1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure LIberarMaterial1Click(Sender: TObject);
    procedure MarcaremFalta1Click(Sender: TObject);
    procedure DesmarcaremFalta1Click(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReq: TfrmReq;

implementation
uses dm_mod_dad, frmPrincipal;
{$R *.dfm}
//Fecha o form
procedure TfrmReq.cxButton3Click(Sender: TObject);
begin
  CLOSE;
end;
//Inclui requisi??o
procedure TfrmReq.cxButton1Click(Sender: TObject);
begin
  if (dbmat.Text = '') or (cbset.Text = '') or (d1.Text = '') or (seQtde.Text = '') then
    begin
      MessageDlg('Preencha os campos com *', mtInformation, [mbOK], 0);
    end else
          begin
            //adoSol.Parameters[2].Value := matricula;
            adoSol.Parameters[7].Value := dbMat.KeyValue;
            adoSol.Parameters[4].Value := adorp.fieldbyname('codigo').Value;
            adoSol.Parameters[8].Value := cbSet.Text;
            adoSol.Parameters[11].Value := seQtde.Text;
            adoSol.Parameters[10].Value := edObs.text;
            adoSol.Parameters[6].Value := d1.Text;
            adoSol.Parameters[9].Value := 'A';
            adoSol.ExecProc;

            //d_mod_dad.seg.parameters[2].Value := matricula;
            //d_mod_dad.seg.Parameters[3].Value := 'SOLICITA??O ROUPARIA';
            //d_mod_dad.seg.parameters[1].Value := 'Solicitou '+seQtde.Text+' '+ADOrp.fieldbyname('descricao').asstring+' ao setor ' +cbset.Text';
            //d_mod_dad.seg.ExecProc;

            d1.Clear;
            seqtde.Clear;
            edobs.Clear;

            adoMs.Close;
            adoMs.Open;
          end;
end;
//Muda a cor do campo conforme ? atualizado os seus n?veis de libera??o
procedure TfrmReq.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[gridlib.Index]= 'A')then
    begin
     ACanvas.Canvas.Brush.Color := $000080FF;
    end;
      if (AViewInfo.GridRecord.Values[gridlib.Index]= 'E')then
    begin
     ACanvas.Canvas.Brush.Color := $0000D56A;
    end;
      if (AViewInfo.GridRecord.Values[gridlib.Index]= 'F')then
    begin
     ACanvas.Canvas.Brush.Color := clRed;
    end;
      if (AViewInfo.GridRecord.Values[gridlib.Index]= 'R')then
    begin
     ACanvas.Canvas.Brush.Color := clAqua;
    end;
end;

procedure TfrmReq.FormCreate(Sender: TObject);
begin
  adoms.Open;
end;

procedure TfrmReq.RetornaraoEstoque1Click(Sender: TObject);
begin
 PANEL2.Visible := TRUE;
end;

procedure TfrmReq.btnCancelClick(Sender: TObject);
begin
  PANEL2.Visible := false;
  seqtde2.Clear;
end;
//Libera o material para o setor e desconta do estoque da rouparia
procedure TfrmReq.LIberarMaterial1Click(Sender: TObject);
begin
  if adoms.FieldByName('liberacao').AsString = 'A' then
  begin
    begin
     if messagedlg('Deseja autorizar a libera??o deste Uniforme?', mtconfirmation, [mbyes, mbno],0)=mryes then
        begin
          adolib.Parameters[3].Value := adoMS.fieldbyname('COD_MAT').Value;
          adolib.Parameters[11].Value := adoMS.fieldbyname('QTDE').Value;
          adolib.Parameters[7].Value := adoMS.fieldbyname('MATERIAL').Value;
          adolib.Parameters[1].Value := '3';
          adolib.ExecProc;

          adofalt.Parameters[1].Value := '4';
          adofalt.Parameters[4].Value := adoms.fieldbyname('req').Value;
          //adofalt.Parameters[5].Value := matricula
          adofalt.ExecProc;

         //d_mod_dad.seg.parameters[2].Value := matricula;
         //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
         //d_mod_dad.seg.parameters[1].Value := 'Liberou '+seQtde.Text+' '+adoMS.fieldbyname('MATERIAL').asstring+' ao setor '+cbset.Text' ;
         //d_mod_dad.seg.ExecProc;

         adoms.Close;
         adoms.Open;
       end;
    end;
  end;
end;
//Indica que o material est? em falta
procedure TfrmReq.MarcaremFalta1Click(Sender: TObject);
begin
   if adoms.FieldByName('liberacao').AsString = 'A' then
    begin
      adofalt.Parameters[1].Value := '5';
      adofalt.Parameters[3].Value := adoms.fieldbyname('req').Value;
      adofalt.ExecProc;

      //d_mod_dad.seg.parameters[2].Value := matricula;
      //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
      //d_mod_dad.seg.parameters[1].Value := 'Marcou o(s) item(s) '+ADOcMat.fieldbyname('descricao').asstring+' como em falta';
      //d_mod_dad.seg.ExecProc;

      adoms.Close;
      adoms.Open;
    end;
end;
//Material n?o est? mais em falta e ? atualizado para aguardar aprova??o
procedure TfrmReq.DesmarcaremFalta1Click(Sender: TObject);
begin
 if adoms.FieldByName('liberacao').AsString = 'F' then
   begin
      adofalt.Parameters[1].Value := '6';
      adofalt.Parameters[3].Value := adoms.fieldbyname('req').Value;
      adofalt.ExecProc;

      //d_mod_dad.seg.parameters[2].Value := matricula;
      //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
      //d_mod_dad.seg.parameters[1].Value := 'Marcou o(s) item(s) '+ADOcMat.fieldbyname('descricao').asstring+' como em disponivel';
      //d_mod_dad.seg.ExecProc;

      adoms.Close;
      adoms.Open;
    end;
end;
//Habilita painel para retorno do material, sendo acrescentado o valor indicado ao estoque rouparia
procedure TfrmReq.btnRetClick(Sender: TObject);
begin
  if adoms.FieldByName('liberacao').AsString = 'E' then
    begin
     if messagedlg('Deseja retornar '+ seqtde2.Text +' item(s) ao estoque?', mtconfirmation, [mbyes, mbno],0)=mryes then
        begin
          adoret.Parameters[3].Value := adoMS.fieldbyname('codigo').Value;
          adoret.Parameters[5].Value := adoms.fieldbyname('req').Value;
          adoret.Parameters[11].Value := seQtde2.Text;
          //adoret.Parameters[4].Value := matricula
          adoret.ExecProc;

         //d_mod_dad.seg.parameters[2].Value := matricula;
         //d_mod_dad.seg.Parameters[3].Value := 'CAD_ROUPARIA';
         //d_mod_dad.seg.parameters[1].Value := 'Retornou '+seQtde2.Text+' '+adoMS.fieldbyname('MATERIAL').asstring+' ao estoque ;
         //d_mod_dad.seg.ExecProc;

         panel2.Visible := false;

         adoms.Close;
         adoms.Open;
       end;
    end;
end;
//Imprime relat?rio
procedure TfrmReq.cxButton2Click(Sender: TObject);
begin
  rel1.Print;
end;

procedure TfrmReq.cb2Click(Sender: TObject);
begin
  if cb2.Checked = true then
    begin
      adoms.Parameters[1].Value := '7';
      adoms.Close;
      adoms.Open;
end else
    begin
      adoms.Parameters[1].Value := '8';
      adoms.Close;
      adoms.Open;
    end;
end;

end.
