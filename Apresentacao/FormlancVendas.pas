unit FormlancVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCalendars, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.WinXPanels, UCtrlProdutos, UctrlVendas,
  UFuncionalidades,
  Datasnap.DBClient, System.StrUtils;

type
  THabilitaBotoes = (todos, novo, pesquisa, limpar);

  TFrmlancVendas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Btn_novo: TButton;
    Btn_Limpar: TButton;
    Btn_Fechar: TButton;
    DBItens: TDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    LbStatus: TLabel;
    btnCancelarVenda: TSpeedButton;
    BtnAdicionarItem: TSpeedButton;
    DBProduto: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtQuantidade: TSpinEdit;
    BtnEfetuarPagamento: TSpeedButton;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    DBTipoDesconto: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    DBTipoPagamento: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    Shape1: TShape;
    Label5: TLabel;
    Label6: TLabel;
    LbValorDescontp: TLabel;
    Label8: TLabel;
    LbValorLiquido: TLabel;
    LbValorBruto: TLabel;
    Panel5: TPanel;
    BtnSairPagto: TButton;
    BtnRemoverItem: TSpeedButton;
    LbData: TLabel;
    BtnPagamento: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEfetuarPagamentoClick(Sender: TObject);
    procedure BtnSairPagtoClick(Sender: TObject);
    procedure Btn_FecharClick(Sender: TObject);
    procedure Btn_novoClick(Sender: TObject);
    procedure BtnAdicionarItemClick(Sender: TObject);
    procedure BtnRemoverItemClick(Sender: TObject);
    procedure BtnPagamentoClick(Sender: TObject);
    procedure DBTipoDescontoClick(Sender: TObject);
  private
    { Private declarations }
    FVendaAtiva: Boolean;
    FUCtrlProdutos: TUCtrlProdutos;
    FUCtrlVendas: TUCtrlVendas;
    HabilitaBotoes: THabilitaBotoes;
    procedure ParemtrizarCamposAoBanco;
    Procedure LimparCampos;
    procedure HabilitarCampos(Habilitar: Boolean);
    procedure HabilitarBotoes(HabilitaBotao: THabilitaBotoes);
    procedure ImputarDados;
    procedure ImputarDadospagamento;
    procedure Pagar;
    procedure LimparPagamento;
  public
    { Public declarations }
  end;

var
  FrmlancVendas: TFrmlancVendas;

implementation

{$R *.dfm}

procedure TFrmlancVendas.BtnAdicionarItemClick(Sender: TObject);
begin
  ImputarDados;
  FUCtrlVendas.PersistenciaItemVenda(Incluir, 0);
  FUCtrlVendas.CarregarItensVenda(FUCtrlVendas.CodigoVenda);
end;

procedure TFrmlancVendas.btnCancelarVendaClick(Sender: TObject);
begin
  if FVendaAtiva then
  begin
    LbStatus.Caption := 'CANCELADA';
    LbStatus.Font.Color := clRed;
    FVendaAtiva := False;
    btnCancelarVenda.Caption := 'Ativar Venda';
    btnCancelarVenda.Font.Color := clGreen;
    FUCtrlVendas.PersistenciaVenda(Alterar, 2);
    HabilitarCampos(False);
    HabilitarBotoes(todos);
    btnCancelarVenda.Enabled := True;
    exit;
  end;
  if not FVendaAtiva then
  begin
    LbStatus.Caption := 'ATIVA';
    LbStatus.Font.Color := clGreen;
    FVendaAtiva := True;
    btnCancelarVenda.Caption := 'Cancelar Venda';
    btnCancelarVenda.Font.Color := clRed;
    FUCtrlVendas.PersistenciaVenda(Alterar, 1);
    HabilitarCampos(True);
    HabilitarBotoes(novo);
    exit;
  end;
end;

procedure TFrmlancVendas.Btn_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmlancVendas.Btn_novoClick(Sender: TObject);
begin
  HabilitarBotoes(novo);
  HabilitarCampos(True);
  FUCtrlVendas.PersistenciaVenda(Incluir);
  FUCtrlVendas.RetornaCodigoVenda;

end;

procedure TFrmlancVendas.BtnSairPagtoClick(Sender: TObject);
begin
  CardPanel1.Visible := False;
  CardPanel1.SendToBack;
  LimparPagamento;
end;

procedure TFrmlancVendas.DBTipoDescontoClick(Sender: TObject);
Var
  VPercentual: Integer;
  VValorFinal: Double;
begin
  VValorFinal := 0;
  VPercentual := 0;
  VPercentual := FUCtrlVendas.CdsTipoDescontos.FieldByName('PERCENTUAL')
    .AsInteger;
  FUCtrlVendas.ValorDesconto :=
    ((FUCtrlVendas.ValorBrutpo * VPercentual) / 100);
  VValorFinal := FUCtrlVendas.ValorBrutpo - FUCtrlVendas.ValorDesconto;
  LbValorLiquido.Caption := 'R$ ' + TFuncionalidades.FormatarValorTexto
    (VValorFinal);
  LbValorDescontp.Caption := 'R$ ' + TFuncionalidades.FormatarValorTexto
    (FUCtrlVendas.ValorDesconto);
  FUCtrlVendas.ValorLiquido := VValorFinal;
  FUCtrlVendas.ValorPercentual := FUCtrlVendas.ValorDesconto;
end;

procedure TFrmlancVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FreeAndNil(FUCtrlProdutos);
  FreeAndNil(FUCtrlVendas);
end;

procedure TFrmlancVendas.FormCreate(Sender: TObject);
begin
  FVendaAtiva := True;
  FUCtrlProdutos := TUCtrlProdutos.Create;
  FUCtrlVendas := TUCtrlVendas.Create;
end;

procedure TFrmlancVendas.FormShow(Sender: TObject);
begin
  LbData.Caption := datetostr(now);
  FUCtrlProdutos.CarregarProdutos;
  FUCtrlVendas.CriarTipoPagamentos;
  FUCtrlVendas.CriarTipoDescontos;
  FUCtrlVendas.CarregarItensVenda(0);
  HabilitarCampos(False);
  HabilitarBotoes(todos);
  ParemtrizarCamposAoBanco;
end;

procedure TFrmlancVendas.HabilitarBotoes(HabilitaBotao: THabilitaBotoes);
begin
  case HabilitaBotao of
    todos:
      begin
        Btn_novo.Enabled := True;
        Btn_Limpar.Enabled := False;
        Btn_Fechar.Enabled := True;
        btnCancelarVenda.Enabled := False;
        BtnAdicionarItem.Enabled := False;
        BtnRemoverItem.Enabled := False;
        BtnEfetuarPagamento.Enabled := False;
      end;
    novo:
      begin
        Btn_novo.Enabled := False;
        Btn_Limpar.Enabled := True;
        btnCancelarVenda.Enabled := True;
        BtnAdicionarItem.Enabled := True;
        BtnRemoverItem.Enabled := True;
        BtnEfetuarPagamento.Enabled := True;
      end;
  end;
end;

procedure TFrmlancVendas.HabilitarCampos(Habilitar: Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
    begin
      (Components[I] as TDBEdit).Enabled := Habilitar;
    end;
    if Components[I] is TDBLookupComboBox then
    begin
      (Components[I] as TDBLookupComboBox).Enabled := Habilitar;
    end;
    if Components[I] is TSpinEdit then
    begin
      (Components[I] as TSpinEdit).Enabled := Habilitar;
    end;
    if Components[I] is TCalendarPicker then
    begin
      (Components[I] as TCalendarPicker).Enabled := Habilitar;
    end;
  end;
end;

procedure TFrmlancVendas.ImputarDados;
begin
  FUCtrlVendas.CodigoProduto := DBProduto.KeyValue;
  FUCtrlVendas.Quantidade := EdtQuantidade.Value;
  FUCtrlVendas.Valor := FUCtrlProdutos.BuscarValorProduto(DBProduto.KeyValue);
  if not FUCtrlVendas.QueryItensVenda.IsEmpty then
    FUCtrlVendas.CodigoItem := FUCtrlVendas.QueryItensVenda.FieldByName
      ('CODIGO_SEQUENCIAL').AsInteger;
end;

procedure TFrmlancVendas.ImputarDadospagamento;
begin

  if DBTipoPagamento.KeyValue = null then
    FUCtrlVendas.CodigoReceita := 0
  else
    FUCtrlVendas.CodigoReceita := DBTipoPagamento.KeyValue;
  if DBTipoDesconto.KeyValue = null then
    FUCtrlVendas.CodidoDesCconto := 0
  else
    FUCtrlVendas.CodidoDesCconto := DBTipoDesconto.KeyValue;
  FUCtrlVendas.DescricaoReceita := DBTipoPagamento.Text;
  FUCtrlVendas.DescricaoDesconto := DBTipoDesconto.Text;
end;

procedure TFrmlancVendas.LimparCampos;
begin

end;

procedure TFrmlancVendas.LimparPagamento;
begin
  FUCtrlVendas.CodigoProduto := 0;
  FUCtrlVendas.Quantidade := 0;
  FUCtrlVendas.Valor := 0;
  FUCtrlVendas.CodigoItem := 0;
  DBTipoDesconto.KeyValue := null;
  DBTipoPagamento.KeyValue := null;
  LbValorBruto.Caption := 'R$ 0,00' ;
  LbValorDescontp.Caption := 'R$ 0,00';
  LbValorLiquido.Caption := 'R$ 0,00';

end;

procedure TFrmlancVendas.Pagar;
var
  VValorButo: Double;
begin
  VValorButo := 0;
  FUCtrlVendas.QueryItensVenda.First;
  while not FUCtrlVendas.QueryItensVenda.eof do
  begin
    VValorButo := VValorButo + FUCtrlVendas.QueryItensVenda.FieldByName
      ('VALOR_SUBTOTAL').AsFloat;
    FUCtrlVendas.QueryItensVenda.Next;
  end;
  FUCtrlVendas.ValorBrutpo := VValorButo;
  LbValorBruto.Caption := ' R$ ' + FormatFloat('#,##0.00', VValorButo);
  LbValorLiquido.Caption := LbValorBruto.Caption;
end;

procedure TFrmlancVendas.ParemtrizarCamposAoBanco;
begin
  DBProduto.ListSource := FUCtrlProdutos.DtsProduto;
  DBTipoPagamento.ListSource := FUCtrlVendas.DtsTipoPagamentos;
  DBTipoDesconto.ListSource := FUCtrlVendas.DtsTipoDescontos;
  DBItens.DataSource := FUCtrlVendas.DtsItensVenda;
end;

procedure TFrmlancVendas.BtnEfetuarPagamentoClick(Sender: TObject);
begin
  if FUCtrlVendas.QueryItensVenda.IsEmpty then
  begin
    MessageDlg('Não há itens adicionados!', TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbNo], 0);
    exit;
  end;
  CardPanel1.Visible := True;
  CardPanel1.BringToFront;
  Pagar;

end;

procedure TFrmlancVendas.BtnPagamentoClick(Sender: TObject);
begin
  ImputarDadospagamento;
  if FUCtrlVendas.CodigoReceita = 0 then
  begin
    MessageDlg('Informe a forma de pagamento!', TMsgDlgType.mtWarning,
      [mbok], 0);
    exit;
  end;

  FUCtrlVendas.PersistenciaVenda(Alterar);
  FUCtrlVendas.PersistenciaVendaReceita(Incluir);
  FUCtrlVendas.PersistenciaVendadesconto(Incluir);

  MessageDlg('Pagamento Relazado!', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbok], 0);
  BtnSairPagto.Click;
  Btn_Fechar.Click;
end;

procedure TFrmlancVendas.BtnRemoverItemClick(Sender: TObject);
begin
  ImputarDados;
  FUCtrlVendas.PersistenciaItemVenda(Excluir, 0);
  FUCtrlVendas.CarregarItensVenda(FUCtrlVendas.CodigoVenda);
end;

end.
