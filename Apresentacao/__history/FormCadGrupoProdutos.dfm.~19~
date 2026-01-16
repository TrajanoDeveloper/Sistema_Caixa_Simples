object FrmCadGrupoProduto: TFrmCadGrupoProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Grupo de Produtos'
  ClientHeight = 782
  ClientWidth = 1171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1171
    Height = 782
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 726
      Width = 1169
      Height = 55
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object Btn_novo: TButton
        Left = 16
        Top = 6
        Width = 75
        Height = 35
        Caption = 'Novo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_novoClick
      end
      object Btn_Salvar: TButton
        Left = 96
        Top = 6
        Width = 75
        Height = 35
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Btn_SalvarClick
      end
      object Btn_Excluir: TButton
        Left = 175
        Top = 6
        Width = 75
        Height = 35
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Btn_ExcluirClick
      end
      object Btn_Limpar: TButton
        Left = 256
        Top = 6
        Width = 75
        Height = 35
        Caption = 'Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Btn_LimparClick
      end
      object Btn_Fechar: TButton
        Left = 337
        Top = 6
        Width = 75
        Height = 35
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Btn_FecharClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1169
      Height = 725
      Align = alClient
      Caption = 'Dados do Grupo de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 739
      object Label1: TLabel
        Left = 19
        Top = 31
        Width = 92
        Height = 28
        Caption = 'Descri'#231#227'o'
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 160
        Width = 1165
        Height = 563
        Align = alBottom
        Caption = 'Grupos de Produtos'
        TabOrder = 0
        object DBGridGrupoProdutos: TDBGrid
          Left = 2
          Top = 30
          Width = 1161
          Height = 531
          Align = alClient
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -20
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          OnDblClick = DBGridGrupoProdutosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 830
              Visible = True
            end>
        end
      end
      object EdtDescricao: TEdit
        Left = 19
        Top = 59
        Width = 414
        Height = 36
        TabOrder = 1
      end
    end
  end
end
