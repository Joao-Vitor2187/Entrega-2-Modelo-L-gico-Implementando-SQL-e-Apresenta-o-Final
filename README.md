# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

> Este arquivo é o esqueleto dos artefatos finais do grupo, a serem organizados no repositório GitHub. **Será corrigido exclusivamente o conteúdo da branch `main` do repositório** — arquivos que estiverem em qualquer outra branch não serão considerados, mesmo que o link enviado aponte para ela. Preencha cada seção com o conteúdo do seu projeto. Alguns itens são documentos Markdown, outros são arquivos separados (diagramas, dicionário de dados, script `.sql`, massa de dados, slides) — está indicado em cada seção. Nesta etapa vocês atuam como uma **software house** implementando o banco de dados completo do sistema modelado na Entrega 1 e revisado na seção 1.1 — seja para uma empresa, uma ONG ou outra organização escolhida pelo grupo.

> **Lembrete:** termos como "empresa" e "negócio" usados abaixo são o vocabulário técnico padrão de modelagem de dados e se aplicam a qualquer tipo de organização, com ou sem fins lucrativos.

> **Importante:** esta etapa exige uma **organização real**, com evidências de existência e contato com um responsável.

> - **Se a organização da Entrega 1 era real**, continue com ela — não é permitido trocá-la por outra.  
> - **Se a organização da Entrega 1 era fictícia** (ou não teve a existência comprovada na correção), o grupo deve **procurar agora uma organização real** e refazer, para ela, toda a base da Entrega 1, inclusive o DER (ver seção 1.1, Caso B).

> Em qualquer caso, o grupo deve manter o acesso à organização, pois pode ser necessário voltar a campo para validar regras, tirar dúvidas sobre o processo de normalização ou conferir se a massa de dados reflete a realidade observada.

---

## 1\. Relatório Técnico Final

*(arquivo Markdown — reúne a maior parte da Dimensão Conceitual, 30%)*

**O Relatório Técnico Final deve ser o próprio `README.md` da raiz da branch `main`**, seguindo a estrutura deste esqueleto. Relatório entregue em outro arquivo (PDF, Word, outro `.md`, Google Docs, wiki do GitHub etc.) **não será corrigido**. Os demais artefatos (DER, modelo lógico, dicionário de dados, levantamento, script SQL, massa de dados, slides) ficam em arquivos separados no repositório, com link a partir do README.

### Integrantes

| Nome completo do aluno | RGM | Usuário do GitHub |
| :---- | :---- | :---- |
| Nome | RGM | usuario |

&nbsp;

### 1.1 Revisão do Modelo Conceitual

*(obrigatória, sem peso próprio — mas todo o restante da entrega é construído e avaliado sobre este modelo: um erro que permanecer no DER revisado se propaga para a conversão, a normalização, o modelo lógico e o script SQL)*

**Caracterização da organização (todos os grupos)**

*Repita aqui a caracterização da organização — atualizada, mesmo que a organização seja a da Entrega 1\. Na Entrega 1, os erros mais comuns foram: porte sem números, problema declarado que depois não aparecia no DER, evidências fora do repositório e modelo cobrindo só parte da organização. Evite-os:*

- **Nome e natureza da organização:** qual organização real o grupo escolheu (com acesso garantido para pesquisa de campo) — pode ser uma empresa (livraria, lanchonete, pet shop), uma ONG, uma associação comunitária ou outra instituição.  
- **Contexto e porte:** com ou sem fins lucrativos; tamanho da operação; número de pessoas envolvidas (funcionários, voluntários, membros, fiéis); volume de atividades (vendas, atendimentos, doações, rituais, eventos). **Informe números**, não só adjetivos (ex.: "cerca de 300 pedidos por semana", e não "grande movimento") — são eles que justificam o tamanho da massa de dados (seção 4).  
- **Problemas e necessidades identificados:** qual é a "crise operacional" — o que está desorganizado hoje (planilhas soltas, papel, falta de controle de estoque/doações/cadastros etc.)? Numere cada problema (`P1`, `P2`…). **Todo problema declarado aqui precisa ser resolvido pelo modelo:** deve aparecer no DER e ter ao menos uma consulta gerencial no script SQL (ver a tabela de rastreabilidade da seção 1.6). O problema deve ser de **gestão de informações** — refazer o site ou melhorar a divulgação da organização, por exemplo, não é um problema que um banco de dados resolva.  
- **Escopo do sistema:** o banco de dados deve reunir **todos os dados da organização**, não só os de um setor ou processo. Mesmo que os problemas declarados se concentrem em uma área, o modelo não pode servir somente a um recorte (ex.: só o estoque de uma clínica, deixando de fora pacientes e atendimentos).  
- **Justificativa da escolha:** por que essa organização foi escolhida e por que ela é um bom caso para o projeto? Se algum integrante trabalha na organização ou tem vínculo familiar com os responsáveis, declare isso — o vínculo não gera desconto, mas **não dispensa a comprovação da entrevista com o responsável, realizada no ambiente da organização**.  
- **Evidências da organização:** comprove que a organização existe e que o grupo teve acesso a ela — fotos do local/da visita, link da organização no Google, endereço completo e forma de contato. **Prefira o perfil da organização no Google Meu Negócio (Google Business Profile)**, que é a comprovação mais direta; site e redes sociais complementam. As fotos só são aceitas como **arquivos JPG ou PNG dentro do repositório** — fotos hospedadas fora dele (Google Drive, Imgur, anexos colados no editor do GitHub etc.) não são consideradas.  
- **Responsável pela organização:** **nome e telefone** de quem atendeu o grupo — o professor pode entrar em contato para confirmar as informações.

**Relato da entrevista (todos os grupos)**

*Relate a entrevista com o responsável pela organização. A entrevista da Entrega 1 pode ser reaproveitada se atender a todos os itens abaixo — inclusive ter sido feita no ambiente da organização, com foto — e se tiver levantado o necessário para os processos, requisitos e regras desta etapa. Se algo precisou ser confirmado depois (ex.: processos típicos levantados por pesquisa), relate também a nova visita.*

- **Quem:** nome e função do entrevistado e quais integrantes do grupo participaram.  
- **Quando e onde:** data e local — a entrevista deve ser realizada **no ambiente da organização**. A **observação presencial** da rotina é parte importante do levantamento de requisitos: o que o grupo vê acontecer no local (como um pedido é anotado, onde o estoque é controlado, que papéis e planilhas circulam) muitas vezes difere do que é dito na entrevista. **Destaque os achados obtidos pela observação**, separados dos obtidos pelas respostas do entrevistado.  
- **Comprovação:** ao menos uma foto da entrevista no local, como arquivo JPG ou PNG no repositório.  
- **O que foi levantado:** o que foi perguntado, o que foi confirmado e, se houve nova visita, o que mudou em relação à Entrega 1 (processos, regras, volumes, problemas). O levantamento completo fica em **um arquivo Markdown (`.md`) à parte no repositório**, com link no README — **recomenda-se fortemente** colocá-lo numa pasta chamada **`levantamento`** (ex.: `levantamento/levantamento.md`). Esse arquivo é um **texto organizado, escrito pelo grupo**, sobre o que foi levantado — **não** é um vídeo ou áudio da entrevista, nem a transcrição crua de formulários ou de perguntas e respostas. **No README, apresente um resumo do levantamento.**

**Nível de detalhe — processos, requisitos e regras de negócio (todos os grupos)**

*Frases genéricas como "o sistema deve permitir cadastrar cliente" são **superficiais** e não bastam. Em processos, requisitos e regras, indique **quais dados** estão envolvidos — todos os campos que aparecem no trabalho (DER, dicionário de dados, modelo lógico):*

| Superficial | Detalhado |
| :---- | :---- |
| *O sistema deve permitir cadastrar cliente.* | *RF03 — O sistema deve permitir cadastrar cliente com nome completo, CPF, telefone, e-mail e endereço (logradouro, número, bairro, CEP).* |
| *O cliente faz o pedido.* | *O garçom anota no pedido a mesa, o número da pulseira do cliente e, para cada item, o produto, a quantidade e as observações.* |
| *O cliente precisa estar cadastrado.* | *RN05 — Todo cliente deve ter CPF válido e único; telefone e nome completo são obrigatórios.* |

&nbsp;

**Processos de negócio (todos os grupos)**

*Apresente os **principais processos mapeados** na organização — ex.: cadastro de clientes/beneficiários/fiéis, controle de estoque ou doações, vendas ou arrecadação, emissão de pedidos ou solicitações, entregas ou distribuição, organização de eventos/rituais/mutirões.*

- **Levante os processos típicos do tipo de organização.** É recomendável usar pesquisas e ferramentas de IA para descobrir quais processos são comuns em organizações do mesmo tipo (ex.: o que toda pizzaria, ONG de doação de alimentos ou oficina mecânica costuma fazer) e conferir se eles existem na organização escolhida. Isso pode exigir **uma nova visita à organização** para confirmar como cada processo funciona lá. Registre esse uso de IA na seção 6\.  
- **Inclua os processos que existem na organização**, mesmo os que não estão ligados aos problemas declarados — o banco de dados reúne todos os dados da organização (ver *Escopo do sistema* acima).  
- **Justifique os processos prováveis não incluídos:** se um processo comum nesse tipo de organização ficou de fora (ex.: compras de fornecedores, cancelamentos, escala da equipe), explique por quê — por exemplo, a organização não o realiza, ou ele é feito por terceiros.

**Requisitos (todos os grupos)**

*Apresente os requisitos do sistema, atualizados com base na correção da Entrega 1 (ou elaborados agora, para quem trocou de organização):*

- **Requisitos Funcionais:** o que o sistema precisa **fazer**, com os dados envolvidos (ex.: "o sistema deve permitir registrar uma venda com data, cliente, vendedor, forma de pagamento e, para cada item, produto, quantidade e preço unitário"). Cada um com um código (`RF01`, `RF02`…).  
- **Requisitos Não Funcionais:** características de qualidade (ex.: desempenho, segurança, usabilidade, disponibilidade). Cada um com um código (`RNF01`, `RNF02`…).  
- **Levante os requisitos típicos do tipo de organização.** Assim como nos processos, é recomendável usar pesquisas e ferramentas de IA para descobrir quais requisitos funcionais e não funcionais são comuns em sistemas de organizações semelhantes e conferir se eles se aplicam à organização escolhida — o que pode exigir confirmação com o responsável. Registre esse uso de IA na seção 6\.  
- **Justifique os requisitos prováveis não incluídos:** se um requisito comum nesse tipo de organização ficou de fora, explique por quê (ex.: a organização não realiza o processo correspondente, ou a necessidade não existe no porte dela).

*Na Entrega 1, os erros mais comuns foram: requisitos de um sistema diferente do que foi mapeado (ex.: cardápio por QR Code ou motor de recomendação, quando o processo real é o garçom anotar o pedido), problemas declarados sem nenhum requisito que os resolva e requisitos técnicos (autenticação por JWT, hospedagem em nuvem) listados como funcionais. Os requisitos devem corresponder aos processos de negócio descritos acima e cobrir todos os problemas declarados (`P1`, `P2`…).*

**Regras de negócio (todos os grupos)**

*Liste as regras de negócio vigentes, cada uma com um código (`RN01`, `RN02`…) — mantenha os códigos da Entrega 1 quando já existirem. Esses códigos são citados nas justificativas das restrições (seção 1.5) e nas consultas de auditoria do script SQL (seção 3).*

- **Levante as regras típicas do tipo de organização.** Assim como nos processos e nos requisitos, é recomendável usar pesquisas e ferramentas de IA para descobrir quais regras são comuns em organizações semelhantes e conferir se elas valem na organização escolhida — o que pode exigir confirmação com o responsável. Considere tanto as **regras operacionais** (ex.: pedido só é entregue se estiver registrado; cancelamento fica no histórico, não é apagado) quanto as **restrições legais e organizacionais** (ex.: LGPD, emissão de nota fiscal, normas sanitárias, idade mínima, acesso por cargo). Registre esse uso de IA na seção 6\.  
- **Justifique as regras prováveis não incluídas:** se uma regra comum nesse tipo de organização ficou de fora, explique por quê (ex.: a organização não realiza o processo correspondente, ou a regra não se aplica ao porte ou à natureza dela).

**Notação do DER conceitual (todos os grupos — Caso A e Caso B)**

*O DER deve seguir a notação do **brModelo**, como no exemplo abaixo:*

![Exemplo de DER na notação do brModelo](Exemplo_DER.png)

| Elemento | Como aparece | No exemplo |
| :---- | :---- | :---- |
| **Entidade** | retângulo | `Entity 1` a `Entity 5` |
| **Relacionamento** | losango | `Rel 33`, `Rel 34` |
| **Cardinalidade mínima e máxima** | par `(mín, máx)` dos dois lados de cada relacionamento | `(0, 1)`, `(1, n)`, `(0, n)` |
| **Autorrelacionamento** | losango ligado duas vezes à mesma entidade, cada lado com sua cardinalidade | `Rel 33`, em `Entity 3` |
| **Atributo identificador (chave)** | círculo **preenchido** | `Chave 1`, `Chave 2`, `Chave 3`, `Chave 4` |
| **Identificador composto** | mais de um círculo preenchido na mesma entidade (obrigatório) — ou mais de um atributo sublinhado, se os atributos estiverem listados no retângulo | `Chave 50` \+ `Chave 51`, em `Entity 5` |
| **Atributo comum** | círculo **vazio** | `Attribute 10`, `Attribute 30` |
| **Atributo multivalorado** | círculo vazio com a cardinalidade do atributo | `Attribute 11 (1, n)` |
| **Atributo composto** *(representação gráfica opcional)* | atributo com seus próprios subatributos ligados a ele | `Attribute 21`, com `attr 211` e `attr 212` |
| **Generalização/especialização** | triângulo ligando a entidade genérica às especializadas. **A indicação de totalidade e disjunção não é obrigatória** | `Entity 1` → `Entity 2` e `Entity 3` |
| **Entidade associativa** | retângulo envolvendo o losango do relacionamento, que passa a poder se relacionar com outras entidades e ter atributos próprios | `Rel 53`, com `Attribute 530` |

&nbsp;

- **Representação gráfica opcional:** atributos compostos podem ser desenhados como no exemplo (subatributos ligados ao atributo), mas não é obrigatório; o mesmo vale para a indicação de totalidade/disjunção da generalização/especialização.  
- **Atributos de entidades:** podem ser representados como no brModelo (círculos ligados à entidade, como no exemplo) **ou** listados dentro do retângulo da entidade — nesse caso, o **identificador deve estar sublinhado**.  
- **Atributos de relacionamentos e de entidades associativas:** **somente** como no brModelo, ligados ao losango ou à entidade associativa (como `Attribute 530`) — não podem ser listados dentro de um retângulo.  
- **Sem chaves estrangeiras** — elas só aparecem no modelo lógico (seção 2).

*Informe no README **em qual software ou aplicativo o DER foi criado**.*

**Caso A — mesma organização da Entrega 1**

*Apresente o **DER conceitual revisado**, na notação descrita acima. A revisão parte da correção da Entrega 1 recebida pelo grupo — o DER e os demais itens acima. Para cada apontamento da correção, registre o que foi feito:*

| Apontamento da correção da E1 | O que mudou no trabalho | Por quê |
| :---- | :---- | :---- |
| *ex.: N:N entre PEDIDO e PRODUTO sem quantidade* | *criada a entidade associativa ITEM\_PEDIDO com quantidade e preço praticado* | *sem ela não é possível saber quanto de cada produto foi vendido* |
| *ex.: chaves estrangeiras desenhadas no DER* | *removidas — passam a aparecer só no modelo lógico (seção 2\)* | *FK é decisão do modelo lógico, não do conceitual* |

&nbsp;

*Se o grupo discordar de algum apontamento e mantiver o modelo como estava, registre isso na tabela com a justificativa. Apontamento não citado na tabela é tratado como não corrigido.*

**Caso B — nova organização (a da Entrega 1 era fictícia ou não teve a existência comprovada)**

*Além de todos os itens acima, apresente o **DER conceitual** da nova organização, na notação descrita acima.*

*Use a correção da Entrega 1 do grupo como guia dos erros a não repetir, mesmo sendo outra organização.*

### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

*(vale 7,5%)*

- **Entidades → Tabelas:** *como cada entidade virou tabela.*  
- **Atributos → Colunas:** *conversão correta dos atributos.*  
- **Relacionamentos → Chaves:** *como os relacionamentos foram traduzidos.*  
- **Cardinalidades:** *como cada cardinalidade (1:1, 1:N, N:N) foi tratada (inclusive tabelas associativas, se houver).*  
- **Generalização/especialização:** *se o DER tiver, qual estratégia de conversão foi usada (tabela única, uma tabela por entidade ou só as especializadas) e por quê.*

### 1.3 Definição de Chaves Primárias e Estrangeiras

*Liste as PKs e FKs de cada tabela (serve de base para a justificativa técnica abaixo).*

### 1.4 Processo de Normalização (1FN, 2FN e 3FN)

*(vale 7,5%)*

- **1FN:** *eliminação de grupos repetitivos/atributos multivalorados.*  
- **2FN:** *eliminação de dependências parciais.*  
- **3FN:** *eliminação de dependências transitivas.*  
- **Justificativa do processo:** *por que cada forma normal foi necessária no seu caso.*

### 1.5 Justificativas Técnicas das Decisões

*(vale 7,5%)*

- Justificar as **chaves primárias** escolhidas.  
- Justificar as **chaves estrangeiras** e os relacionamentos que elas implementam.  
- Justificar as **restrições** aplicadas (unicidade, obrigatoriedade, valores permitidos etc.), citando o código da regra de negócio (`RNxx`) que cada restrição implementa, quando houver.  
- Justificar **decisões arquiteturais** gerais do modelo.

### 1.6 Proposta de Arquitetura Analítica para BI e IA

*(vale 7,5%)*

- **Informações estratégicas** que podem ser extraídas dos dados para a gestão da organização.  
- **Indicadores e métricas gerenciais** propostos (KPIs).  
- **Potencial dos dados para BI:** como a estrutura apoia dashboards/relatórios.  
- **Aplicações analíticas e de IA:** como o modelo pode alimentar análises preditivas, recomendações etc.

**Rastreabilidade:** inclua uma tabela que ligue cada problema declarado na caracterização da organização e cada KPI proposto às tabelas que o sustentam e à consulta do script SQL que o responde (pelo código da consulta — ver seção 3):

| Problema ou KPI | Tabelas envolvidas | Consulta no script |
| :---- | :---- | :---- |
| *ex.: P1 — ruptura de estoque de bebidas* | *PRODUTO, MOVIMENTACAO\_ESTOQUE* | *G03* |
| *ex.: ticket médio por ambiente* | *PEDIDO, ITEM\_PEDIDO, AMBIENTE* | *G05* |

&nbsp;

*KPI sem consulta no script que o calcule não é considerado KPI. Cada problema declarado deve ter pelo menos uma consulta que o responda.*

> **O que é KPI:** *Key Performance Indicator* (indicador-chave de desempenho) é um número que mostra, de forma objetiva, se a organização está indo bem em algo que importa para a gestão dela. Um KPI tem **fórmula** (como é calculado), **período** (por dia, semana, mês) e, de preferência, uma **meta** para comparação. Exemplos: ticket médio por venda, taxa de cancelamento de pedidos, produtos abaixo do estoque mínimo, tempo médio de atendimento, número de beneficiários atendidos por mês, percentual de doações recorrentes. "Melhorar o atendimento" não é KPI; "tempo médio entre o pedido e a entrega, por semana" é.

> **Como levantar:** é recomendável usar pesquisas e ferramentas de IA para descobrir quais indicadores são usados por organizações do mesmo tipo (ex.: "principais KPIs de uma pizzaria", "indicadores de gestão de uma ONG de doação de alimentos") e quais análises de BI e de IA costumam ser aplicadas a elas. Depois, **filtre pelo que o seu banco consegue calcular**: um KPI só vale se as tabelas do modelo tiverem os dados necessários e se houver uma consulta no script que o calcule (ver *Rastreabilidade*, abaixo). Se possível, confirme com o responsável pela organização quais indicadores seriam úteis para ele. Registre esse uso de IA na seção 6\.

---

## 2\. Modelo Lógico Relacional

*(diagrama separado — vale 10% na Dimensão Procedimental)*

O modelo lógico deve seguir a **notação visual do brModelo** para o modelo lógico, como no exemplo abaixo. Informe no README **em qual software ou aplicativo ele foi criado**.

![Exemplo de modelo lógico na notação do brModelo](Exemplo_Logico.png)

| Elemento | Como aparece | No exemplo |
| :---- | :---- | :---- |
| **Tabela** | retângulo com o nome da tabela no topo e uma linha por coluna | `Entity 1`, `Entity 5` |
| **Coluna** | nome da coluna, à esquerda, com o tipo de dado à direita | `Attribute 30` — `INT` |
| **Chave primária** | marca `PK` ao lado do tipo | `Chave 1`, em `Entity 1`; `Chave 50` \+ `Chave 51`, em `Entity 5` (chave primária composta) |
| **Chave estrangeira** | marca `FK` ao lado do tipo | `Chave 3`, em `Entity 4` |
| **Coluna que é chave primária e estrangeira** | marcas `PK, FK` | `Chave 1`, em `Entity 2` |
| **Ligação entre tabelas** | linha entre a tabela da FK e a tabela referenciada, com a cardinalidade `(mín, máx)` em cada ponta | `Entity 3` — `Entity 4`: `(1, 1)` e `(0, n)` |

&nbsp;

Deve apresentar claramente:

- Tabelas  
- Atributos (colunas), com seus tipos de dados  
- Chaves primárias  
- Chaves estrangeiras  
- Cardinalidades já convertidas

As **demais restrições de integridade** — obrigatoriedade (`NOT NULL`), unicidade (`UNIQUE`), valores permitidos (`CHECK`), valores padrão (`DEFAULT`) — não aparecem no diagrama do brModelo e devem ser documentadas no **dicionário de dados** (seção 5\) e implementadas no **script SQL** (seção 3).

---

## 3\. Script SQL Completo

*(arquivo `.sql` — vale 12% na Dimensão Procedimental)*

O script completo é **um arquivo no formato `.sql` disponível no repositório**, de preferência numa pasta chamada **`docs`** (ex.: `docs/script.sql`), com link no README. Script colado só no README, em PDF, em imagem ou em outro formato não é aceito.

**SGBD:** MySQL — o disponível no laboratório ou outra instalação equivalente a que o grupo tenha acesso. O script deve executar no MySQL.

O script deve conter, nesta ordem lógica:

1. `CREATE DATABASE`  
2. `CREATE TABLE` (todas as tabelas, com tipos de dados adequados)  
3. **Constraints** (PK, FK, `NOT NULL`, `UNIQUE`, `CHECK` etc.)  
4. `INSERT INTO` (carga da massa de dados — ver seção 4\)  
5. `SELECT` com `JOIN` (consultas que cruzam múltiplas tabelas)  
6. `UPDATE`  
7. `DELETE`  
8. **Consultas gerenciais** (que respondem perguntas de gestão, ex.: faturamento/arrecadação por período, número de atendimentos/beneficiários)  
9. **Consultas de auditoria** (que verificam consistência/integridade dos dados)

Cada **consulta gerencial** e cada **consulta de auditoria** deve ter um cabeçalho em comentário com um código (`G01`, `G02`… para gerenciais; `A01`, `A02`… para auditoria), a pergunta que ela responde em português e o que ela atende:

```sql
-- G03 — Quais bebidas estão abaixo do estoque mínimo hoje?
-- Atende: P1 (ruptura de estoque de bebidas)
SELECT ...

-- A02 — Existe pedido registrado sem nenhum item?
-- Verifica: RN04 (todo pedido tem ao menos um item)
SELECT ...
```

&nbsp;

- **Consultas gerenciais** respondem aos problemas declarados e aos KPIs da seção 1.6 — pelo menos uma por problema declarado e por KPI.  
- **Consultas de auditoria** verificam regras de negócio, citando o código da regra (`RNxx`) que cada uma confere.  
- Essas mesmas consultas são as usadas na demonstração da apresentação final (seção 7).

*Teste o script do zero (banco vazio) antes de entregar, para garantir que ele executa sem erros.*

---

## 4\. Massa de Dados

*(incluída no script ou em arquivo separado — parte da nota de Implementação SQL, 12%)*

Se a massa de dados ficar em arquivo separado, ele deve seguir a mesma regra do script: **um arquivo no formato `.sql` no repositório**, de preferência na pasta **`docs`** (ex.: `docs/massa_de_dados.sql`), com link no README.

- **Dados reais da organização (nomes de clientes, fiéis, beneficiários, doadores, valores reais etc.) não devem ser utilizados, em respeito à privacidade dessas informações.** A massa de dados deve ser **fictícia**, mas **coerente com as operações modeladas** (mesmos tipos de processo, volumes e regras observados na organização real).  
- Volume de registros **coerente com a realidade da organização** (nada de 3 linhas de exemplo — mas também nada artificialmente inflado sem sentido).  
- **Explique como o volume real da organização** — os números informados em *Contexto e porte* (seção 1.1), como clientes ativos, pedidos por mês, atendimentos por semana, itens no estoque — **justifica a quantidade de registros de cada tabela** da massa de dados.  
- Dados consistentes o suficiente para validar os processos organizacionais modelados (ex.: pedidos que referenciam clientes e produtos existentes, ou doações que referenciam doadores e campanhas existentes).  
- **Variedade e quantidade coerentes com a organização, para que os testes sejam possíveis:** os dados devem cobrir as situações reais — não só o caso comum, mas também pedidos cancelados, clientes sem compras, produtos abaixo do estoque mínimo, pagamentos em formas diferentes, registros em períodos diferentes. Sem essa variedade, as consultas gerenciais e de auditoria (seção 3\) não têm o que mostrar: uma consulta de produtos abaixo do estoque mínimo que retorna vazio não demonstra nada.  
- **Documente o uso de LLMs** para gerar essa massa de dados na seção 6 (**Uso de Inteligência Artificial**), incluindo ferramentas, prompts e ajustes feitos manualmente.

---

## 5\. Repositório GitHub

*(vale 13% — Documentação e Repositório)*

O repositório deve conter:

- Relatório Técnico (no `README.md`)  
- **Dicionário de Dados** atualizado, no modelo do arquivo `02-03g_Exemplo_Dicionario_Dados.pdf` e com as restrições de integridade de cada coluna (obrigatoriedade, unicidade, valores permitidos, valor padrão), em **um único arquivo HTML** no repositório. **Exceção — turma de GTI:** o dicionário é apresentado em **um único arquivo Markdown (`.md`) separado do README**, seguindo o mesmo modelo do `02-03g_Exemplo_Dicionario_Dados.pdf`.  
- Diagramas (DER revisado e modelo lógico)  
- Levantamento (pasta `levantamento`, recomendada) e evidências da organização e da entrevista (fotos JPG ou PNG)  
- Script SQL completo em arquivo `.sql` (de preferência na pasta `docs`)  
- **Histórico de commits** que evidencie o desenvolvimento ao longo do tempo (evite um único commit final)  
- **Evidências de colaboração entre os membros do grupo:** é a listagem de commits do repositório, que deve estar **equilibrada entre os integrantes** — a quantidade de commits deve se distribuir de forma proporcional entre todos os membros do grupo, cada um fazendo commits com a própria conta do GitHub. O integrante precisa ser **identificável na conta do GitHub**: o nome configurado na conta deve ser compatível com o nome do aluno na tabela de Integrantes, onde também deve constar o usuário do GitHub de cada um

---

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
