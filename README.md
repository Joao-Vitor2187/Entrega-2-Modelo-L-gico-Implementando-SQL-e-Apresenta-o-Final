# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final


**Modelagem de um sistema de gestão de informações para uma organização de pequeno porte**

## Sumário

  - 1.0 Relatório Técnico Final(1-relatório-técnico-final)
  - 1.1 Revisão do Modelo Conceitual(11-revisão-do-modelo-conceitual)
  - 1.2 Conversão do Modelo Conceitual para o Modelo Lógico(12-conversão-do-modelo-conceitual-para-o-modelo-lógico)
  - 1.3 Definição de Chaves Primárias e Estrangeiras(13-definição-de-chaves-primárias-e-estrangeiras)
  - 1.4 Processo de Normalização (1FN, 2FN e 3FN)(14-processo-de-normalização-1fn-2fn-e-3fn)
  - 1.5 Justificativas Técnicas das Decisões(15-justificativas-técnicas-das-decisões)
  - 1.6 Proposta de Arquitetura Analítica para BI e IA(16-proposta-de-arquitetura-analítica-para-bi-e-ia)

---

# 1. Relatório Técnico Final

## 1.1 Revisão do Modelo Conceitual

### Caracterização da organização

**Nome e natureza:** Peg Vest Jeans, empresa com fins lucrativos especializada na comercialização de jeans feminino, principalmente no segmento de atacado.

**Contexto e porte:** A Entrega 1 informa aproximadamente 20 pessoas envolvidas na operação. O volume de atividades foi classificado como médio, mas ainda não há números confirmados de pedidos, clientes ativos ou produtos cadastrados.

**Problemas identificados:**

- **P1 — Controle de estoque:** dificuldade para acompanhar quantidades disponíveis e movimentações dos produtos.
- **P2 — Falta de padronização:** ausência de padronização suficiente nos processos e registros operacionais.
- **P3 — Sistemas desconectados:** utilização de sistemas diferentes para os canais de venda, com compatibilidade limitada entre eles.

**Escopo do sistema:** cadastro de clientes, funcionários, fornecedores e produtos; compras; controle e movimentação de estoque; pedidos e itens; pagamentos; entregas; informações fiscais; controle de acesso e consultas gerenciais.

**Justificativa da escolha:** a organização foi escolhida porque um integrante possui vínculo de trabalho e facilidade de acesso ao estabelecimento, além de a empresa atender aos critérios do projeto.

**Evidências:**

- **Endereço:** Rua Rodrigues dos Santos, 718.
- **Site:** <https://pegvest.com.br/>
- **Google Maps:** <https://share.google/DAEpR3k6h6TCqBPD0>
- **Contato geral informado:** (11) 96173-2019.
- **Fotografias da visita/entrevista:** inserir os arquivos JPG ou PNG no repositório.

**Responsável entrevistado:** `[PREENCHER NOME, FUNÇÃO E TELEFONE CONFIRMADO]`.

### Relato da entrevista

As fotografias fornecidas pelo grupo constituem evidência visual da visita, mas não identificam sozinhas a data, o entrevistado ou o conteúdo da conversa.

- **Entrevistado e função:** `[PREENCHER]`.
- **Integrantes presentes:** `[PREENCHER]`.
- **Data e local:** `[PREENCHER]`.
- **Informações confirmadas pelo entrevistado:** `[PREENCHER]`.
- **Processos observados presencialmente:** `[PREENCHER]`.

### Processos de negócio

1. Cadastro e manutenção de clientes.
2. Cadastro e atualização de produtos.
3. Cadastro e consulta de fornecedores.
4. Registro de compras e recebimentos.
5. Controle de estoque.
6. Registro de entradas, saídas e transferências.
7. Registro de pedidos e vendas.
8. Detalhamento dos produtos e quantidades de cada pedido.
9. Registro e acompanhamento de pagamentos.
10. Controle de entregas e informações fiscais, quando realizados pela organização.

### Requisitos funcionais

- **RF01:** cadastrar clientes com identificação, tipo de pessoa, CPF ou CNPJ e dados de contato.
- **RF02:** consultar, atualizar e inativar clientes, preservando o histórico.
- **RF03:** cadastrar produtos com código, descrição, modelo, cor, tamanho e preços.
- **RF04:** consultar produtos por código e características.
- **RF05:** cadastrar e consultar fornecedores.
- **RF06:** registrar compras com fornecedor, data e situação.
- **RF07:** registrar os itens das compras, com produto, quantidade e custo unitário.
- **RF08:** consultar estoque por produto e local, quando aplicável.
- **RF09:** registrar movimentações de estoque.
- **RF10:** consultar produtos abaixo do estoque mínimo.
- **RF11:** registrar pedidos com cliente, funcionário, data e tipo de venda.
- **RF12:** registrar os itens dos pedidos, com produto, quantidade e preço unitário.
- **RF13:** registrar pagamentos associados aos pedidos.
- **RF14:** consultar a situação dos pagamentos.
- **RF15:** registrar cancelamentos sem apagar o histórico.
- **RF16:** registrar informações e situações das entregas.
- **RF17:** armazenar informações de notas fiscais.
- **RF18:** cadastrar funcionários e perfis de acesso.
- **RF19:** gerar relatórios de vendas por período, produto, tipo de venda e funcionário.
- **RF20:** gerar relatórios gerenciais de estoque, compras, pagamentos e entregas.

### Requisitos não funcionais

- **RNF01:** desempenho adequado nas operações e consultas.
- **RNF02:** autenticação e controle de acesso por perfil.
- **RNF03:** integridade e consistência dos dados.
- **RNF04:** realização de backups periódicos.
- **RNF05:** interface e operações de fácil utilização.
- **RNF06:** estrutura que permita manutenção e evolução.
- **RNF07:** proteção dos dados pessoais e acesso autorizado.
- **RNF08:** rastreabilidade das movimentações e alterações relevantes.

### Regras de negócio

- **RN01:** o cliente deve possuir CPF, quando pessoa física, ou CNPJ, quando pessoa jurídica; o documento deve ser único.
- **RN02:** um pedido somente pode ser considerado efetuado quando possuir os dados obrigatórios e ao menos um item válido.
- **RN03:** pagamentos realizados por Pix recebem desconto de 5%, conforme regra informada no projeto, ainda sujeita à confirmação da empresa.
- **RN04:** a venda não pode ser concluída quando o estoque for insuficiente; o saldo não pode ficar negativo.
- **RN05:** um pedido não pode ser cancelado depois de enviado.
- **RN06:** pedidos de atacado devem conter no mínimo 15 peças.
- **RN07:** somente usuários autorizados podem conceder descontos fora da política comercial.
- **RN08:** alterações de preços e configurações devem ser restritas aos perfis autorizados.
- **RN09:** a liberação de entrega depende de autorização.
- **RN10:** dados pessoais devem ser acessados somente por usuários autorizados.
- **RN11:** compras e movimentações de estoque devem manter histórico para rastreabilidade.

---

## 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

**Entidades → Tabelas:** as entidades do DER são convertidas em tabelas relacionais: `CLIENTE`, `FUNCIONARIO`, `EMPRESA`, `PRODUTO`, `ESTOQUE`, `FORNECEDOR`, `PEDIDO` e `PAGAMENTO`.

Para representar os dados dos relacionamentos e os processos adicionais, a proposta também considera `ITEM_PEDIDO`, `COMPRA`, `ITEM_COMPRA`, `MOVIMENTACAO_ESTOQUE`, `LOCAL_ESTOQUE`, `ENTREGA`, `PERFIL_ACESSO` e `NOTA_FISCAL`. A inclusão definitiva dessas tabelas depende da confirmação dos processos e do DER revisado.

**Atributos → Colunas:** os atributos são convertidos em colunas com tipos de dados compatíveis, como `INT`, `VARCHAR`, `DATE`, `DATETIME` e `DECIMAL`. A definição final deve coincidir com o diagrama lógico e o dicionário de dados.

**Relacionamentos → Chaves:** os relacionamentos 1:N são implementados por chaves estrangeiras no lado N. Os relacionamentos N:N são convertidos em tabelas associativas. Nos relacionamentos 1:1, pode ser utilizada uma FK com restrição `UNIQUE` ou uma chave compartilhada.

**Cardinalidades:**

- `CLIENTE` 1:N `PEDIDO`.
- `FUNCIONARIO` 1:N `PEDIDO`.
- `PEDIDO` 1:N `ITEM_PEDIDO`.
- `PRODUTO` 1:N `ITEM_PEDIDO`.
- `PEDIDO` 1:N `PAGAMENTO`, se houver pagamentos parciais.
- `FORNECEDOR` 1:N `COMPRA`.
- `COMPRA` 1:N `ITEM_COMPRA`.
- `PRODUTO` 1:N `ITEM_COMPRA`.
- `PRODUTO` 1:N `ESTOQUE`.
- `ESTOQUE` 1:N `MOVIMENTACAO_ESTOQUE`.

**Generalização/especialização:** não foi identificada generalização/especialização no conjunto de entidades informado. Portanto, não se aplica estratégia específica de conversão.

---

## 1.3 Definição de Chaves Primárias e Estrangeiras

| Tabela | PK | FKs |
|---|---|---|
| `CLIENTE` | `id_cliente` | — |
| `FUNCIONARIO` | `id_funcionario` | `id_perfil` |
| `PERFIL_ACESSO` | `id_perfil` | — |
| `EMPRESA` | `id_empresa` | — |
| `PRODUTO` | `id_produto` | — |
| `FORNECEDOR` | `id_fornecedor` | — |
| `LOCAL_ESTOQUE` | `id_local` | — |
| `ESTOQUE` | `id_estoque` | `id_produto`, `id_local` |
| `MOVIMENTACAO_ESTOQUE` | `id_movimentacao` | `id_estoque`, `id_funcionario` |
| `PEDIDO` | `id_pedido` | `id_cliente`, `id_funcionario` |
| `ITEM_PEDIDO` | `id_item_pedido` | `id_pedido`, `id_produto` |
| `PAGAMENTO` | `id_pagamento` | `id_pedido` |
| `COMPRA` | `id_compra` | `id_fornecedor`, `id_funcionario` |
| `ITEM_COMPRA` | `id_item_compra` | `id_compra`, `id_produto` |
| `ENTREGA` | `id_entrega` | `id_pedido` |
| `NOTA_FISCAL` | `id_nota_fiscal` | `id_pedido` |

As chaves primárias identificam unicamente os registros. As chaves estrangeiras garantem a integridade referencial entre as tabelas relacionadas.

---

## 1.4 Processo de Normalização (1FN, 2FN e 3FN)

- **1FN:** cada coluna deve armazenar um único valor. Os produtos de um pedido são separados em `ITEM_PEDIDO`, e os produtos de uma compra são separados em `ITEM_COMPRA`, evitando listas de produtos em uma única coluna.
- **2FN:** os atributos devem depender da chave primária completa. Quantidade e preço unitário pertencem ao item do pedido ou da compra, enquanto os dados gerais permanecem nas tabelas `PEDIDO` e `COMPRA`.
- **3FN:** os atributos não chave devem depender diretamente da chave primária. Dados de clientes, fornecedores, funcionários e perfis ficam em suas próprias tabelas, evitando repetição desnecessária em pedidos e movimentações.

A normalização reduz redundâncias e evita anomalias de inserção, atualização e exclusão.

---

## 1.5 Justificativas Técnicas das Decisões

**Chaves primárias:** foram propostas chaves identificadoras próprias, como `id_cliente`, `id_produto` e `id_pedido`, para manter identificadores estáveis mesmo quando dados cadastrais forem alterados.

**Chaves estrangeiras:** conectam pedidos a clientes e funcionários, itens aos respectivos pedidos e produtos, pagamentos aos pedidos, compras aos fornecedores e movimentações aos registros de estoque.

**Restrições:**

- **RN01:** CPF/CNPJ obrigatório conforme o tipo de pessoa e documento único.
- **RN02:** pedido deve possuir ao menos um item válido.
- **RN03:** desconto Pix de 5%, caso confirmado.
- **RN04:** impedir saldo negativo e validar estoque mínimo.
- **RN05:** impedir cancelamento após envio.
- **RN06:** validar mínimo de 15 peças para atacado.

> A regra de existência de ao menos um item, o mínimo de peças e a transição de situação do pedido exigem validações adicionais no processo ou no banco; uma chave estrangeira isolada não garante essas regras.

**Decisões arquiteturais:** separar pedidos e itens, compras e itens, e estoque e movimentações permite registrar operações com vários produtos, preservar histórico e melhorar a rastreabilidade.

---

## 1.6 Proposta de Arquitetura Analítica para BI e IA

A estrutura poderá apoiar relatórios de faturamento, desempenho de produtos, pagamentos pendentes e produtividade comercial.

### Consultas gerenciais

| Código | Pergunta | Atende |
|---|---|---|
| **G01** | Qual o faturamento mensal por tipo de venda (varejo x atacado) nos últimos 12 meses? | Acompanhamento de receita e mix de vendas |
| **G02** | Quais são os 10 produtos mais vendidos em quantidade e receita? | Gestão de portfólio e priorização de compras |
| **G03** | Quais pedidos estão pendentes de pagamento há mais de 7 dias? | Risco de inadimplência e fluxo de caixa |
| **G04** | Qual o desempenho de vendas por funcionário (ranking de vendedores)? | Gestão de equipe comercial e metas |

### Consultas de auditoria

| Código | Pergunta | Verifica |
|---|---|---|
| **A01** | O cadastro do cliente possui CNPJ ou CPF cadastrado? | RN01 |
| **A02** | O pedido pode ser considerado efetuado? | RN02 |
| **A03** | Os pagamentos efetuados por Pix possuem 5% de desconto? | RN03 |
| **A04** | Há algum produto sem a quantidade mínima em estoque? | RN04 |
| **A05** | Há algum pedido cancelado mesmo após ter sido enviado? | RN05 |
| **A06** | Há algum pedido em atacado que tenha menos de 15 peças? | RN06 |

### Potencial de BI e IA

Os dados históricos podem apoiar painéis de vendas, estoque, pagamentos e desempenho dos funcionários. Futuramente, análises preditivas poderão ajudar a estimar demanda e sugerir reposição de produtos. Essas aplicações dependem de dados históricos suficientes e consistentes.

### Rastreabilidade

| Problema ou KPI | Tabelas envolvidas | Consulta |
|---|---|---|
| P1 — Controle de estoque | `PRODUTO`, `ESTOQUE`, `MOVIMENTACAO_ESTOQUE` | A04 |
| P2 — Padronização dos processos | `PEDIDO`, `ITEM_PEDIDO`, `PAGAMENTO`, `FUNCIONARIO` | A02, A03, A05, G03 |
| P3 — Sistemas desconectados | `PEDIDO`, `ITEM_PEDIDO`, `PRODUTO`, `PAGAMENTO` | G01, G02 |
| Faturamento por tipo de venda | `PEDIDO`, `ITEM_PEDIDO`, `PAGAMENTO` | G01 |
| Produtos mais vendidos | `PRODUTO`, `ITEM_PEDIDO`, `PEDIDO` | G02 |
| Pagamentos pendentes | `PEDIDO`, `CLIENTE`, `PAGAMENTO` | G03 |
| Vendas por funcionário | `FUNCIONARIO`, `PEDIDO`, `ITEM_PEDIDO` | G04 |

## 2\. Modelo Lógico Relacional
### Diagrama DER anexado ao repositório


## 3\. Script SQL Completo
### Script SQL Completo anexado ao repositório


## 6\. Uso de Inteligência Artificial

Durante o desenvolvimento do projeto, foram utilizadas ferramentas de Inteligência Artificial como apoio à pesquisa, organização, modelagem e implementação do banco de dados. A seguir, estão documentados os principais usos realizados pelo grupo.

### 6.1. Registro dos prompts utilizados

| Item | Prompt 1 — Orientação sobre as partes 5 e 7 | Prompt 2 — Desenvolvimento da Entrega 2 | Prompt 3 — Geração da massa de dados SQL |
|---|---|---|---|
| **Ferramenta e etapa** | ChatGPT — orientação sobre a documentação do modelo lógico. | ChatGPT — desenvolvimento e revisão técnica da Entrega 2. | ChatGPT — implementação SQL e geração de massa de dados. |
| **Motivação** | Compreender o que deveria ser desenvolvido nas partes 5 e 7 do trabalho e como realizar essas etapas seguindo os conceitos de banco de dados. | Obter apoio para desenvolver e revisar a segunda entrega, mantendo a coerência entre modelo conceitual, modelo lógico, normalização, SQL e documentação. | Facilitar a criação de registros fictícios para preencher a tabela `Empresa` do banco de dados, respeitando sua estrutura e suas restrições. |
| **Prompt(s) utilizados** | "Seguinte, eu e meu grupo temos um trabalho de modelagem de banco de dados, nestes arquivos readme(1) e dicionario de dados está a primeira entrega, que seria o modelo conceitual, neste outro readme está o modelo lógico a outra entrega que ele quer, eu fiquei encarregado de fazer a parte 5 e 7 deste esqueleto, quero que você me explique o que devo fazer, e como você faria, atuando como um especialista em banco de dados, seguindo todas as regras que são utilizadas para um trabalho de banco de dados." | Prompt solicitando que o ChatGPT atuasse como especialista em Banco de Dados e Engenharia de Software para desenvolver e revisar a Entrega 2 do projeto Peg Vest Jeans, seguindo o esqueleto oficial do professor e analisando modelagem, normalização, SQL, consultas e documentação. | "Atue como um especialista em Banco de Dados e SQL, com experiência em modelagem relacional e implementação de scripts MySQL. Estou desenvolvendo um banco de dados para a empresa Peg Vest Jeans, que atua no comércio de roupas jeans femininas. Com base no script SQL disponibilizado, analise a estrutura da tabela `Empresa` e desenvolva uma massa de dados fictícia para realizar sua população. Siga os seguintes critérios: 1. Analise os nomes das colunas, os tipos de dados, as chaves e as restrições definidas na tabela `Empresa`. 2. Gere registros fictícios, mas realistas e coerentes com o contexto comercial da Peg Vest Jeans. 3. Preencha todos os campos obrigatórios, respeitando os limites e formatos definidos no script SQL. 4. Respeite as restrições de integridade e evite duplicidade em campos que possuam restrição de unicidade. 5. Utilize comandos `INSERT INTO` compatíveis com MySQL. 6. Organize os comandos de forma clara, com comentários identificando a finalidade dos registros. 7. Não invente colunas que não existam na estrutura original da tabela. 8. Garanta que os dados gerados sejam coerentes com o modelo lógico e com o restante do banco de dados. Ao final, apresente o script SQL completo da massa de dados e explique brevemente como os registros atendem à estrutura da tabela. Não afirme que o script foi executado ou testado sem que isso tenha sido realizado." |
| **Resposta recebida** | Orientações sobre as atividades necessárias nas partes indicadas e sugestões de como desenvolvê-las conforme os conceitos de modelagem de banco de dados. | Orientações para analisar o projeto, identificar inconsistências, sugerir melhorias, desenvolver a documentação e verificar a coerência entre os diferentes artefatos. | Geração de comandos SQL com registros fictícios para inserir informações na tabela `Empresa`, considerando os campos definidos na estrutura do banco. |
| **Fontes consultadas e verificadas** | Foram utilizados como referência os arquivos README da primeira e segunda entregas e o dicionário de dados disponibilizados pelo grupo. | Foram indicados como materiais de referência os documentos oficiais do professor, o esqueleto da Entrega 2, os materiais da Entrega 1, o DER e os arquivos SQL do grupo. | Foi utilizado como referência o script SQL do projeto, principalmente a estrutura, os campos, os tipos de dados e as restrições da tabela `Empresa`. Não foram utilizadas fontes externas. |
| **Trechos rejeitados ou corrigidos** | Não foram especificados trechos rejeitados ou corrigidos pelo grupo. | As sugestões da IA deveriam ser comparadas com os documentos oficiais e com a estrutura original do projeto. Não foram especificadas todas as alterações realizadas manualmente. | Os dados gerados precisaram ser considerados em relação aos campos, tipos de dados e restrições da tabela. Eventuais ajustes devem ser conferidos antes da execução. |
| **Justificativa da escolha final** | O ChatGPT foi utilizado para facilitar a compreensão das etapas do trabalho e orientar o desenvolvimento das partes atribuídas ao integrante. | A ferramenta foi utilizada para auxiliar na organização e revisão de um trabalho com várias etapas interdependentes, buscando maior consistência técnica e adequação às exigências acadêmicas. | A ferramenta foi utilizada para agilizar a criação de dados fictícios, respeitando a estrutura do banco e reduzindo a necessidade de inserção manual de cada registro. |
| **Reflexão crítica** | A IA facilita a compreensão dos conceitos, mas suas orientações precisam ser comparadas com o material do professor. Uma explicação aparentemente correta pode não atender exatamente ao que foi solicitado. | A IA pode interpretar incorretamente documentos, sugerir alterações desnecessárias ou apresentar soluções que não correspondem à realidade da empresa. Por isso, suas sugestões precisam ser analisadas e validadas pelo grupo. | A geração automática de dados pode apresentar erros de sintaxe, incompatibilidade com as colunas ou informações fictícias incoerentes. Por isso, os comandos SQL precisam ser revisados e testados no SGBD antes da entrega. |

### 6.2. Considerações sobre o uso de IA

O grupo utilizou a Inteligência Artificial como ferramenta de apoio durante o desenvolvimento do projeto, principalmente para esclarecer conceitos, organizar informações, revisar a modelagem e auxiliar na implementação SQL.

As respostas geradas não foram consideradas automaticamente corretas. Foi necessário analisar as sugestões e considerar as orientações do professor, os requisitos do sistema e a estrutura do banco de dados.

A responsabilidade pela análise, validação e entrega final do trabalho permanece com os integrantes do grupo.

---

## 7\. Apresentação Corporativa Final

*(pitch cronometrado de **8 minutos** — vale 15%, maior peso individual da Dimensão Procedimental)*

Formato: slides com estética limpa e minimalista — **proibida a leitura de blocos longos de texto**.

O pitch deve conter, nesta ordem:

1. **Contextualização do problema institucional/organizacional** solucionado  
2. **Apresentação da solução** proposta  
3. **Apresentação do modelo lógico**  
4. **Demonstração da implementação** (SQL rodando)  
5. **Demonstração de consultas** (gerenciais/auditoria)  
6. **Potencial para BI e IA**  
7. **Benefícios diretos** para a tomada de decisão da organização

**Defesa do modelo lógico:** logo após o pitch, fora do tempo cronometrado, o grupo responde às perguntas do professor e da turma. **Cada pergunta deve ser respondida exclusivamente pelo aluno a quem foi dirigida** — os colegas não podem responder por ele.

**Regras da apresentação:**

- **Participação:** não é necessário e nem recomendável que todos os integrantes falem durante o pitch, mas é **obrigatório que todos participem** da apresentação e estejam presentes para a defesa.  
- **Ausência:** o integrante ausente na apresentação terá **nota reduzida**, exceto em casos com justificativa legal (ex.: doença que impeça o comparecimento, com atestado).  
- **Apresentação pessoal:** será avaliada. Postura e vestimenta adequadas a uma apresentação corporativa. Não são adequados bonés, bermudas, chinelos, camisas de time, roupas esportivas ou semelhantes.

---

## Critérios Atitudinais (20%)

**Estes critérios NÃO constam explicitamente como item de entrega nos artefatos do grupo.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub (Seção 5\) e pela conduta do grupo na **Apresentação Corporativa Final** (seção 7\) — não pela leitura do relatório:

- **Participação e colaboração (5%):** participação técnica ativa \+ colaboração com o grupo, incluindo colaboração equilibrada no histórico de commits do repositório GitHub.  
- **Responsabilidade (5%):** cumprimento de prazos \+ entrega dos itens sob sua responsabilidade.  
- **Postura profissional (5%):** comunicação profissional \+ conduta ética.  
- **Autonomia e resolução de problemas (5%):** buscar soluções independentes \+ propor melhorias.

---

## Resumo dos Pesos

| Dimensão | Peso total | Itens principais |
| :---- | :---- | :---- |
| Conceitual | 30% | Conversão conceitual→lógico (7,5%), Normalização (7,5%), Justificativas técnicas (7,5%), Análise BI/IA (7,5%) |
| Procedimental | 50% | Modelo lógico (10%), Implementação SQL (12%), Documentação/repositório (13%), Apresentação final (15%) |
| Atitudinal | 20% | Participação/colaboração, responsabilidade, postura profissional, autonomia |

&nbsp;

**Entrega final:** Relatório Técnico \+ Dicionário de Dados \+ Modelo Conceitual \+ Modelo Lógico \+ Script SQL \+ Massa de Dados \+ Repositório GitHub, seguidos da Apresentação Corporativa Final perante o professor e a turma.

&nbsp;
