unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ComCtrls, FormlancVendas, FormRelVendas,
  FormCadGrupoProdutos, FormCadProduto, Uconexao, UFuncionalidades;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo: TMenuItem;
    Cadastro: TMenuItem;
    Vendas1: TMenuItem;
    Relatorios: TMenuItem;
    Ajuda1: TMenuItem;
    Image1: TImage;
    LbTitulo: TLabel;
    LbVersão: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    StatusBar1: TStatusBar;
    Sair1: TMenuItem;
    GruposdePrpodutpos1: TMenuItem;
    Produtos1: TMenuItem;
    NovaVenda1: TMenuItem;
    VendasPorPerodo1: TMenuItem;
    Sobre1: TMenuItem;
    Timer1: TTimer;
    procedure Sair1Click(Sender: TObject);
    procedure GruposdePrpodutpos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure NovaVenda1Click(Sender: TObject);
    procedure VendasPorPerodo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

    FVersaoSistema: string;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin

  FVersaoSistema := TFuncionalidades.BuscarVersaoSistema;
  LbVersão.Caption := FVersaoSistema;
end;

procedure TFrmPrincipal.GruposdePrpodutpos1Click(Sender: TObject);
var
  FrmCadGrupoProduto: TFrmCadGrupoProduto;
  i: Integer;
begin
  FrmCadGrupoProduto := nil;
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TFrmCadGrupoProduto then
    begin
      FrmCadGrupoProduto := TFrmCadGrupoProduto(MDIChildren[i]);
      break;
    end;
  end;


  if FrmCadGrupoProduto = nil then
  begin
    FrmCadGrupoProduto := TFrmCadGrupoProduto.Create(Application);
  end
  else

  begin
    FrmCadGrupoProduto.BringToFront;
    Application.ExeName
  end;

end;

procedure TFrmPrincipal.NovaVenda1Click(Sender: TObject);
var
  Frmlancvendas: TFrmlancVendas;
  i: Integer;
begin
  Frmlancvendas := nil;
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TFrmlancVendas then
    begin
      Frmlancvendas := TFrmlancVendas(MDIChildren[i]);
      break;
    end;
  end;


  if Frmlancvendas = nil then
  begin
    Frmlancvendas := TFrmlancVendas.Create(Application);
  end
  else

  begin
    Frmlancvendas.BringToFront;
    Application.ExeName
  end;

end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
var
  FrmCadProduto: TFrmCadProduto;
  i: Integer;
begin
  FrmCadProduto := nil;
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TFrmCadProduto then
    begin
      FrmCadProduto := TFrmCadProduto(MDIChildren[i]);
      break;
    end;
  end;


  if FrmCadProduto = nil then
  begin
    FrmCadProduto := TFrmCadProduto.Create(Application);
  end
  else

  begin
    FrmCadProduto.BringToFront;
    Application.ExeName
  end;

end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Versão: '+ FVersaoSistema +' | Data: '+ DateTimeToStr(now);
end;

procedure TFrmPrincipal.VendasPorPerodo1Click(Sender: TObject);
var
  FrmRelVendas: TFrmRelVendas;
  i: Integer;
begin
  FrmRelVendas := nil;
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TFrmRelVendas then
    begin
      FrmRelVendas := TFrmRelVendas(MDIChildren[i]);
      break;
    end;
  end;


  if FrmRelVendas = nil then
  begin
    FrmRelVendas := TFrmRelVendas.Create(Application);
  end
  else

  begin
    FrmRelVendas.BringToFront;
    Application.ExeName
  end;

end;

end.
