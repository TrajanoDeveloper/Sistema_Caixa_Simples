object FrmlancVendas: TFrmlancVendas
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amento de Venda'
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
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1169
      Height = 114
      Align = alTop
      Caption = 'Cabe'#231'aho da venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 28
        Top = 32
        Width = 45
        Height = 28
        Caption = 'Data'
      end
      object LbStatus: TLabel
        Left = 507
        Top = 50
        Width = 92
        Height = 45
        Caption = 'ATIVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -32
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCancelarVenda: TSpeedButton
        Left = 899
        Top = 60
        Width = 169
        Height = 36
        Caption = 'Cancelar Venda'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        StyleElements = [seFont, seClient]
        OnClick = btnCancelarVendaClick
      end
      object LbData: TLabel
        Left = 27
        Top = 62
        Width = 114
        Height = 28
        Caption = '19/11/2025'
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 115
      Width = 1169
      Height = 621
      Align = alClient
      Caption = 'Itens da venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object DBItens: TDBGrid
        Left = 2
        Top = 169
        Width = 1165
        Height = 446
        Align = alTop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -20
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_PRODUTO'
            Title.Caption = 'C'#243'digo'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 253
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_FORMATADO'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Caption = 'Quantidade'
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_SUBTOTAL_FORMATADO'
            Title.Caption = 'SubTotal'
            Width = 187
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 2
        Top = 30
        Width = 1165
        Height = 139
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object BtnAdicionarItem: TSpeedButton
          Left = 565
          Top = 22
          Width = 169
          Height = 36
          Caption = 'Adicionar Item'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          StyleElements = [seFont, seClient]
          OnClick = BtnAdicionarItemClick
        end
        object Label3: TLabel
          Left = 17
          Top = 15
          Width = 76
          Height = 28
          Caption = 'Produto'
        end
        object Label4: TLabel
          Left = 352
          Top = 15
          Width = 110
          Height = 28
          Caption = 'Quantidade'
        end
        object BtnEfetuarPagamento: TSpeedButton
          Left = 808
          Top = 47
          Width = 196
          Height = 36
          Caption = 'Efetuar pagamento'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          StyleElements = [seFont, seClient]
          OnClick = BtnEfetuarPagamentoClick
        end
        object BtnRemoverItem: TSpeedButton
          Left = 565
          Top = 64
          Width = 169
          Height = 36
          Caption = 'Remover Item'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          StyleElements = [seFont, seClient]
          OnClick = BtnRemoverItemClick
        end
        object DBProduto: TDBLookupComboBox
          Left = 17
          Top = 49
          Width = 280
          Height = 36
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          TabOrder = 0
        end
        object EdtQuantidade: TSpinEdit
          Left = 352
          Top = 47
          Width = 121
          Height = 38
          MaxValue = 100
          MinValue = 1
          TabOrder = 1
          Value = 1
        end
      end
      object CardPanel1: TCardPanel
        Left = 80
        Top = 119
        Width = 970
        Height = 465
        ActiveCard = Card1
        Caption = 'CardPanel1'
        TabOrder = 2
        Visible = False
        object Card1: TCard
          Left = 1
          Top = 1
          Width = 968
          Height = 463
          Alignment = taLeftJustify
          Caption = 'Card1'
          CardIndex = 0
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 953
            Height = 30
            Align = alCustom
            Caption = 'Pagamento'
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
          end
          object GroupBox4: TGroupBox
            Left = 488
            Top = 66
            Width = 433
            Height = 111
            Align = alCustom
            Caption = 'Desconto Aplicado'
            TabOrder = 1
            object Label9: TLabel
              Left = 27
              Top = 43
              Width = 100
              Height = 28
              Caption = 'Desconto: '
            end
            object DBTipoDesconto: TDBLookupComboBox
              Left = 128
              Top = 42
              Width = 266
              Height = 36
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              TabOrder = 0
              OnClick = DBTipoDescontoClick
            end
          end
          object GroupBox3: TGroupBox
            Left = 33
            Top = 66
            Width = 433
            Height = 111
            Align = alCustom
            Caption = 'Formas de Pagamento'
            TabOrder = 2
            object Label7: TLabel
              Left = 19
              Top = 43
              Width = 70
              Height = 28
              Caption = 'Forma: '
            end
            object DBTipoPagamento: TDBLookupComboBox
              Left = 95
              Top = 42
              Width = 266
              Height = 36
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              TabOrder = 0
            end
          end
          object GroupBox5: TGroupBox
            Left = 7
            Top = 183
            Width = 911
            Height = 220
            Caption = 'Total da Venda'
            TabOrder = 3
            object Shape1: TShape
              Left = 16
              Top = 128
              Width = 873
              Height = 73
              Shape = stRoundRect
            end
            object Label5: TLabel
              Left = 26
              Top = 59
              Width = 118
              Height = 28
              Caption = 'Valor Bruto: '
            end
            object Label6: TLabel
              Left = 394
              Top = 59
              Width = 100
              Height = 28
              Caption = 'Desconto: '
            end
            object LbValorDescontp: TLabel
              Left = 714
              Top = 59
              Width = 72
              Height = 28
              Caption = 'R$ 0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 316
              Top = 134
              Width = 259
              Height = 54
              Caption = 'Valor L'#237'quido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LbValorLiquido: TLabel
              Left = 731
              Top = 141
              Width = 111
              Height = 45
              Caption = 'R$ 0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clLime
              Font.Height = -32
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LbValorBruto: TLabel
              Left = 183
              Top = 59
              Width = 72
              Height = 28
              Caption = 'R$ 0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 394
            Width = 968
            Height = 69
            Align = alBottom
            TabOrder = 4
            object BtnSairPagto: TButton
              Left = 23
              Top = 24
              Width = 75
              Height = 25
              Caption = 'Sair'
              TabOrder = 0
              OnClick = BtnSairPagtoClick
            end
            object BtnPagamento: TButton
              Left = 369
              Top = 24
              Width = 200
              Height = 25
              Caption = 'Efetivar Pagamento'
              TabOrder = 1
              OnClick = BtnPagamentoClick
            end
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 736
      Width = 1169
      Height = 45
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object Btn_novo: TButton
        Left = 15
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
      object Btn_Limpar: TButton
        Left = 93
        Top = 6
        Width = 78
        Height = 35
        Caption = 'Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Btn_Fechar: TButton
        Left = 174
        Top = 6
        Width = 78
        Height = 35
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Btn_FecharClick
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 41
  end
end
