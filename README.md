## Sistema de Caixa Simples

Aplicação desktop em Delphi (VCL para Windows) que implementa um sistema de caixa simplificado para um estabelecimento de alimentação, permitindo o cadastro de grupos de produtos e produtos, lançamento de vendas com descontos/receitas adicionais e consulta de relatórios de vendas.

---

## Linguagem Utilizada

- **Linguagem principal**: Delphi (Object Pascal)
- **Tipo de aplicação**: VCL Application para Windows (`Caixa_Simples.dpr`:1)
- **Arquitetura alvo**: Win32 (configuração padrão `Debug`/`Release` em `Caixa_Simples.dproj`:1-13,61-63)
- **Acesso a dados**: FireDAC, com driver Firebird (`Uconexao.pas`:5-11)
- **Banco de dados**: Firebird 3.0 (`database\schema.sql`:1-4)

---

## Estrutura de Pastas

Visão geral da estrutura principal do projeto:

```text
.
├── Apresentacao/
│   ├── FormCadGrupoProdutos.pas/dfm
│   ├── FormCadProduto.pas/dfm
│   ├── FormlancVendas.pas/dfm
│   └── FormRelVendas.pas/dfm
├── Controles/
│   ├── UCtrlProdutos.pas
│   └── UctrlVendas.pas
├── Funcoes/
│   └── UFuncionalidades.pas
├── InfraData/
│   └── Uconexao.pas
├── database/
│   ├── PD_Food.fdb
│   ├── schema.sql
│   └── seed.sql
├── config/
│   └── config.ini
├── Win32/
│   └── Debug/
│       └── Caixa_Simples.exe
├── Caixa_Simples.dpr
└── Caixa_Simples.dproj

```

### Descrição das pastas principais

- `Apresentacao/`  
  Contém as telas (forms VCL) da aplicação:
  - `FormCadGrupoProdutos` – cadastro de grupos de produtos.
  - `FormCadProduto` – cadastro de produtos vinculados a grupos.
  - `FormlancVendas` – lançamento de vendas, itens, descontos e formas de pagamento.
  - `FormRelVendas` – consulta e visualização de relatórios de vendas por período.

- `Controles/`  
  Camada de controle de regras de negócio e acesso a dados:
  - `UCtrlProdutos` – operações de manutenção e consulta de grupos de produtos e produtos, incluindo persistência (`TUCtrlProdutos`, `CarregarDadosGrupoProdutos`, `CarregarProdutos`, `PersistenciaGrupoProduto`, `PersistenciaProduto` em `UCtrlProdutos.pas`:15-35,58-88,133-205).
  - `UctrlVendas` – operações de manutenção de vendas, itens, receitas e descontos, bem como consultas detalhadas e listagens (`TUCtrlVendas` em `UctrlVendas.pas`:16-76,83-215,295-382).

- `Funcoes/`  
  Utilitários e funcionalidades de apoio:
  - `UFuncionalidades` – funções auxiliares, como formatação de valores e obtenção da versão do sistema a partir do executável (`TFuncionalidades` em `UFuncionalidades.pas`:10-19,51-87).

- `InfraData/`  
  Infraestrutura de acesso a dados:
  - `Uconexao` – encapsula a criação e configuração de `TFDConnection`/`TFDTransaction` para Firebird, carregando parâmetros de `config.ini` (`Tconecxao` em `Uconexao.pas`:14-30,38-82,92-97).

- `database/`  
  Artefatos de banco de dados:
  - `PD_Food.fdb` – banco Firebird já criado para uso local.
  - `schema.sql` – script de criação completa do banco e estruturas (tabelas, sequences, triggers e índices) (`schema.sql`:1-214).
  - `seed.sql` – seed com dados iniciais (grupos de produtos, produtos e uma venda de exemplo) (`seed.sql`:1-17).

- `config/`  
  Arquivos de configuração:
  - `config.ini` – parâmetros de conexão ao banco Firebird, como caminho do arquivo `.fdb`, usuário, senha, host e porta (`config.ini`:1-13).

- `Win32/Debug/`  
  Saída de build para o alvo Win32 em modo Debug:
  - `Caixa_Simples.exe` – executável gerado a partir do projeto (`Caixa_Simples.dproj`:189-194).

- Raiz do projeto  
  - `Caixa_Simples.dpr` – ponto de entrada da aplicação, registra a `FrmPrincipal` como form principal e inicializa a aplicação (`Caixa_Simples.dpr`:1-21).
  - `Caixa_Simples.dproj` – arquivo de projeto Delphi, contendo configurações de build, plataformas, pacotes e deploy.
  - `Principal.pas/dfm` – form principal do sistema de caixa, com menus para cadastros, lançamento de vendas e relatórios (`Principal.pas`:12-37,61-66,97-124,155-163).
  - `Avaliação Delphi - DEVELOPER-SR.pdf` – documento de avaliação técnica que descreve o problema de negócio, requisitos e critérios de entrega.
  - `prototipos_visuais (1).pdf` – protótipos visuais (wireframes) das telas do sistema PD_FOOD.

---

## Descrição do Projeto

Este projeto implementa a solução proposta na avaliação técnica **“Avaliação Delphi - DEVELOPER-SR”**, cujo objetivo é construir um **sistema de caixa simples (PD_FOOD)** para um estabelecimento do segmento de alimentação rápida.

o sistema foi modelado para contemplar:

- **Cadastro de Grupos de Produtos**  
  Estruturar o catálogo em grupos (ex.: Lanches, Bebidas, Sobremesas) a partir da tabela `CADGRUPOPRODUTO` (`schema.sql`:24-33,2-4).

- **Cadastro de Produtos**  
  Cadastro de produtos vinculados a um grupo, com descrição e preço unitário (`CADPRODUTO` em `schema.sql`:36-49).  
  A lógica de persistência e consulta está concentrada em `TUCtrlProdutos` (`UCtrlProdutos.pas`:15-35,58-88,133-205).

- **Lançamento de Vendas**  
  Inclusão de vendas com múltiplos itens (`VENDA` e `VENDAITEM` em `schema.sql`:52-90), onde:
  - Cada venda possui data, valor bruto, valor de desconto, valor líquido e status (cancelada ou não).
  - Cada item registra produto, quantidade, valor unitário e subtotal calculado.
  - A tela `FormlancVendas` orquestra o fluxo de inclusão de itens e finalização da venda utilizando os métodos de `TUCtrlVendas` (`UctrlVendas.pas`:83-145,295-328,384-412).

- **Receitas e Descontos**  
  Registro de receitas adicionais (`VENDARCEITA`) e descontos (`VENDADESCONTO`) vinculados à venda, permitindo simular cenários como:
  - Taxas adicionais (ex.: taxa de serviço).
  - Descontos promocionais, descontos de funcionário ou de cortesia (tipos criados em memória em `CriarTipoPagamentos` e `CriarTipoDescontos` – `UctrlVendas.pas`:216-274,330-371).

- **Relatórios de Vendas**  
  Consulta de vendas por período e status (ativas/canceladas) e detalhamento da composição de cada venda (`CarregarVendas` e `CarregarDetalheVenda` em `UctrlVendas.pas`:147-171,83-119). A interface gráfica é provida por `FormRelVendas`.

- **Versão do Sistema e Usabilidade**  
  A tela principal exibe a versão do executável e data/hora no `StatusBar` (`Principal.pas`:61-66,160-163), seguindo boas práticas de identificação de build. Funções auxiliares em `UFuncionalidades` padronizam formatação de valores monetários (`UFuncionalidades.pas`:51-54,30-47).

Em conjunto, o projeto demonstra:

- Capacidade de modelar um domínio simples de vendas de PDV.
- Integração completa entre **camada de apresentação (VCL)**, **regras de negócio (Controles)** e **persistência de dados (FireDAC + Firebird)**.
- Alinhamento com especificações e protótipos definidos nos arquivos PDF, fornecendo uma base pronta para evolução (novos relatórios, formas de pagamento, etc.).

---

## Pré-requisitos

Para compilar e executar o projeto em ambiente de desenvolvimento, são necessários:

- **Sistema operacional**
  - Windows 10 ou superior (32 ou 64 bits).

- **IDE e compilador**
  - Delphi (RAD Studio) com suporte a:
    - VCL para Win32.
    - FireDAC com driver Firebird instalado.
  - O projeto foi criado em uma versão recente da IDE, compatível com `ProjectVersion 20.1` (`Caixa_Simples.dproj`:1-4).

- **Banco de dados**
  - Firebird 3.0 instalado (ou compatível) (`database\schema.sql`:1-4).
  - Usuário padrão: `SYSDBA`.
  - Senha padrão: `masterkey`.

- **Ferramentas auxiliares (opcional)**
  - Cliente SQL ou ferramenta de administração Firebird (FlameRobin, DBeaver, isql, etc.) para executar scripts `schema.sql` e `seed.sql`, se quiser recriar o banco.

---

## Instalação

### 1. Obter o código-fonte

- Clonar ou copiar o repositório para uma pasta local, por exemplo:
  - `E:\Projetos\Sistema_Caixa_Simples`

### 2. Configurar o banco de dados

Você tem duas opções:

1. **Usar o banco já existente**
   - O arquivo `database\PD_Food.fdb` já está presente e pode ser usado diretamente.
   - Verifique se o caminho configurado em `config\config.ini` aponta para o local correto do arquivo (`config.ini`:4,11).

2. **Recriar o banco a partir dos scripts**
   - Criar um banco Firebird apontando para o caminho desejado.
   - Executar o script de criação de estrutura:
     - `database\schema.sql` – cria banco, sequences, tabelas, índices e triggers.
   - Executar o script de carga inicial:
     - `database\seed.sql` – popula grupos de produtos, produtos e uma venda de exemplo.
   - Ajustar `Database` e `Path` em `config\config.ini` para o novo caminho do `.fdb`.

> Observação: `Uconexao.pas` possui um caminho absoluto para o `config.ini` (`Uconexao.pas`:42-47). Em um ambiente real, recomenda-se ajustar este caminho para refletir o local atual do projeto ou utilizar um caminho relativo.

### 3. Ajustar configuração de conexão

- Edite `config\config.ini` e valide:
  - `Database` / `Path` – caminho completo para `PD_Food.fdb`.
  - `User_Name` / `User` – usuário Firebird (ex.: `SYSDBA`).
  - `Password` – senha do usuário (ex.: `masterkey`).
  - `Server` – host do Firebird (ex.: `localhost`).
  - `Port` – porta (padrão `3050`).

### 4. Abrir o projeto na IDE

- Abra `Caixa_Simples.dproj` na IDE Delphi.
- Selecione a configuração:
  - `Debug` ou `Release`.
  - Plataforma `Win32`.

### 5. Compilar e executar

- Compile o projeto pela IDE (menu **Build/Run**) ou execute diretamente:
  - `Win32\Debug\PD_Food.exe` (caso já exista um build gerado).
- Ao executar, a tela principal (`FrmPrincipal`) será exibida com o menu de navegação e informações de versão/data (`Principal.pas`:12-21,61-66,160-163).

---

## Uso

### Fluxo geral da aplicação

1. **Tela Principal**
   - Exibe o título do sistema, ícone e informações de versão.
   - Menu principal com seções:
     - `Arquivo` – inclui opção de sair do sistema (`Sair1Click` em `Principal.pas`:32,155-158).
     - `Cadastro` – acesso a cadastros de grupos de produtos e produtos (`Principal.pas`:33-35,68-95,126-153).
     - `Vendas` – lançamento de novas vendas.
     - `Relatórios` – consulta de vendas por período.
     - `Ajuda` – informações gerais/sobre.

2. **Cadastro de Grupos de Produtos**
   - Navegue em: `Cadastro` → `Grupos de Produtos`.
   - Permite:
     - Listar grupos já cadastrados.
     - Incluir, alterar e excluir grupos via `TUCtrlProdutos.PersistenciaGrupoProduto` (`UCtrlProdutos.pas`:133-163).
   - O sistema impede a exclusão de grupos que já possuem vendas associadas (`VerificarSeGrupoProdutoVenda` em `UCtrlProdutos.pas`:207-229).

3. **Cadastro de Produtos**
   - Navegue em: `Cadastro` → `Produtos`.
   - Permite:
     - Listar produtos com informações de grupo e valor.
     - Criar e editar produtos vinculando-os a um grupo, com preço unitário.
   - A persistência é controlada por `TUCtrlProdutos.PersistenciaProduto` (`UCtrlProdutos.pas`:166-205).

4. **Lançamento de Vendas**

   - Navegue em: `Vendas` → `Nova Venda` (`Principal.pas`:35,97-124).
   - Fluxo típico:
     1. Incluir cabeçalho de venda (`PersistenciaVenda(Incluir, ...)` – `UctrlVendas.pas`:295-307).
     2. Adicionar itens (produto, quantidade, valor) (`PersistenciaItemVenda` – `UctrlVendas.pas`:384-400).
     3. Aplicar descontos opcionais (`CriarTipoDescontos` + `PersistenciaVendadesconto` – `UctrlVendas.pas`:216-246,330-351).
     4. Registrar receita de pagamento/fechamento (`PersistenciaVendaReceita` – `UctrlVendas.pas`:353-371).
     5. Atualizar totais de venda (bruto, desconto, líquido) (`PersistenciaVenda(Alterar, ...)` – `UctrlVendas.pas`:308-327).

5. **Consulta e Relatórios de Vendas**

   - Navegue em: `Relatórios` → `Vendas por Período` (`Principal.pas`:36,165-192).
   - Permite:
     - Filtrar vendas por intervalo de datas.
     - Filtrar por status (ativas ou canceladas) (`CarregarVendas` com parâmetro `PStatus` – `UctrlVendas.pas`:147-171).
     - Visualizar detalhes completos de uma venda (itens, descontos, receitas) através de `CarregarDetalheVenda` (`UctrlVendas.pas`:83-119).

6. **Encerramento**
   - Use o menu `Arquivo` → `Sair` ou feche a janela principal para encerrar a aplicação (`Principal.pas`:155-158).

---

## Contribuição

Contribuições são bem-vindas. Recomenda-se seguir o fluxo abaixo:

1. **Fork e branch**
   - Faça um fork do repositório.
   - Crie um branch descritivo para sua mudança:
     - Ex.: `feature/melhoria-relatorio-vendas`, `fix/ajuste-conexao-firebird`.

2. **Padrões de código**
   - Manter a organização por camadas já estabelecida:
     - `Apresentacao` para forms e componentes visuais.
     - `Controles` para regras de negócio e consultas SQL.
     - `InfraData` para infraestrutura de banco de dados.
     - `Funcoes` para utilitários gerais.
   - Usar nomenclaturas consistentes com o projeto:
     - Prefixos `TFrm...` para forms, `TUCtrl...` para classes de controle.
   - Manter a responsabilidade de acesso a dados concentrada nas classes de controle, utilizando `FireDAC` e a conexão centralizada em `Tconecxao`.

3. **Boas práticas**
   - Evitar caminhos absolutos fixos na conexão; preferir caminhos relativos ou configuráveis via `config.ini`.
   - Manter SQL organizado e legível, uma instrução por linha, conforme padrão existente (`UCtrlProdutos.pas`:60-67,71-87; `UctrlVendas.pas`:121-171).
   - Sempre que possível, reutilizar funções auxiliares existentes (ex.: formatação de valores em `UFuncionalidades`).

4. **Pull Request**
   - Atualize seu branch com a versão mais recente da branch principal antes de abrir o PR.
   - Descreva claramente:
     - Objetivo da alteração.
     - Arquivos impactados.
     - Passos básicos para testar a funcionalidade (ex.: cadastrar produto, lançar venda, gerar relatório).
   - Caso altere estrutura de banco:
     - Atualize `database\schema.sql` e, se aplicável, `seed.sql`.
     - Documente as mudanças no corpo do PR.

5. **Testes e validação**
   - O projeto não possui suíte automatizada de testes, portanto:
     - Valide manualmente todos os fluxos relacionados à alteração (cadastros, venda, relatórios).
     - Teste em diferentes combinações de desconto/receita e estados de venda (ativa/cancelada).

---

Este README foi elaborado para fornecer uma visão completa do projeto Sistema de Caixa Simples, facilitando a compreensão, configuração e evolução do sistema por novos desenvolvedores.

