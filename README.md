# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

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

*(documentação obrigatória — não é opcional se o grupo usou IA em qualquer etapa: pesquisa, levantamento de processos, requisitos e regras típicos, escrita, organização de ideias, revisão de texto, geração de massa de dados ou apoio a scripts SQL)*

Para cada uso relevante de ferramenta de IA (ChatGPT, Claude, Gemini, Perplexity etc.), registre:

| Item | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | Qual IA foi usada e em qual parte do trabalho (ex.: normalização, geração da massa de dados, escrita de queries SQL, redação do relatório, preparação dos slides). |
| **Motivação** | Por que o grupo recorreu à IA nesse ponto específico. |
| **Prompt(s) utilizados** | Texto exato (ou muito próximo) do que foi perguntado/pedido à IA. |
| **Resposta recebida** | Resumo ou trecho relevante da resposta da IA. |
| **Fontes consultadas e verificadas** | Se a IA citou fontes/dados, quais foram checadas pelo grupo e como. |
| **Trechos rejeitados ou corrigidos** | O que da resposta da IA foi descartado, editado ou corrigido manualmente (ex.: query SQL ajustada, dado fictício alterado), e por quê. |
| **Justificativa da escolha final** | Por que o grupo manteve, adaptou ou rejeitou o que a IA sugeriu. |
| **Reflexão crítica** | Limites, vieses ou erros identificados no uso da IA nessa etapa (ex.: normalização incorreta sugerida pela IA, script SQL com erro de sintaxe, dado fictício incoerente com o volume real da organização). |

&nbsp;

*Se o grupo não usou nenhuma ferramenta de IA em alguma dessas etapas, declare isso explicitamente.*

**Uso de IA observado e não declarado será penalizado.**

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
