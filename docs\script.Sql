CREATE DATABASE IF NOT EXISTS entrega_2_banco_de_dados
    DEFAULT CHARSET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE entrega_2_banco_de_dados;

CREATE TABLE Empresa (
    ID_EMPRESA      INT PRIMARY KEY                NOT NULL AUTO_INCREMENT,
    DS_RAZAO_SOCIAL varchar(150)                   NOT NULL,
    NR_CNPJ         varchar(14)                    NOT NULL,
    NM_FANTASIA     varchar(150)                   NOT NULL,
    DS_ENDERECO     varchar(200)                   NOT NULL,
    NR_TELEFONE     varchar(20)                    NOT NULL,
    DS_EMAIL        varchar(150)                   NOT NULL,

    CONSTRAINT UQ_CNPJ_EMPRESA UNIQUE (NR_CNPJ)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Cliente (
    ID_CLIENTE      INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_CLIENTE    varchar(150)                   NOT NULL,
    NR_CNPJ         varchar(14)                    NULL UNIQUE,
    NR_CPF          varchar(11)                    NULL UNIQUE,
    NR_TELEFONE     varchar(11)                    NOT NULL,
    DS_EMAIL        varchar(120)                   NOT NULL,
    DS_ENDERECO     varchar(200)                   NOT NULL,
    TP_CLIENTE      char(1)                        NOT NULL, -- pessoa fisica (F), juridica (J)
    IN_ATIVO        boolean                        NOT NULL DEFAULT TRUE,

    CONSTRAINT CK_CLIENTE_DOC CHECK (
    (TP_CLIENTE = 'F' AND NR_CPF IS NOT NULL AND NR_CNPJ IS NULL) OR
    (TP_CLIENTE = 'J' AND NR_CNPJ IS NOT NULL AND NR_CPF IS NULL)
)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Fornecedor (
    ID_FORNECEDOR  INT  PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    NM_FORNECEDOR  varchar(120)                   NOT NULL,
    NR_CNPJ        varchar(14)                    NOT NULL,
    NR_TELEFONE    varchar(11)                    NOT NULL,
    DS_EMAIL       varchar(120)                   NOT NULL,
    DS_ENDERECO    varchar(200)                   NOT NULL,
    IN_ATIVO       CHAR(1)                        NOT NULL DEFAULT 'A',

    CONSTRAINT UQ_CNPJ_Fornecedor     UNIQUE (NR_CNPJ),
    CONSTRAINT UQ_TELEFONE_Fornecedor UNIQUE (NR_TELEFONE),
    CONSTRAINT UQ_EMAIL_Fornecedor    UNIQUE (DS_EMAIL),
    CONSTRAINT CK_FORNECEDOR_ATIVO    CHECK (IN_ATIVO IN ('A', 'I'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Produto (
    ID_PRODUTO        INT PRIMARY KEY             NOT NULL AUTO_INCREMENT,
    DS_NOME           varchar(120)                NOT NULL,
    DS_CATEGORIA      varchar(50)                 NOT NULL,
    DS_TAMANHO        varchar(10)                 NOT NULL,
    DS_COR            varchar(30)                 NOT NULL,
    VL_PRECO_VAREJO   decimal(10,2)               NOT NULL,
    VL_PRECO_ATACADO  decimal(10,2)               NOT NULL,
    IN_ATIVO          boolean                     NOT NULL DEFAULT TRUE,

    CONSTRAINT CK_PRODUTO_PRECOS CHECK (VL_PRECO_ATACADO > 0 AND VL_PRECO_ATACADO < VL_PRECO_VAREJO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Funcionario (
    ID_FUNCIONARIO  INT PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    ID_EMPRESA      INT                           NOT NULL,
    NM_FUNCIONARIO  varchar(120)                  NOT NULL,
    NR_CPF          varchar(11)                   NOT NULL,
    NR_TELEFONE     varchar(11)                   NOT NULL,
    DS_CARGO        varchar(30)                   NOT NULL,
    DS_EMAIL        varchar(120)                  NOT NULL,
    DT_ADMISSAO     DATE                          NOT NULL,
    IN_ATIVO        boolean                       NOT NULL DEFAULT TRUE,

    CONSTRAINT UQ_FUNCIONARIO_CPF UNIQUE (NR_CPF),
    CONSTRAINT FK_EMPRESA_Funcionario FOREIGN KEY (ID_EMPRESA)
                    REFERENCES Empresa (ID_EMPRESA)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Pedido (
    ID_PEDIDO      INT  PRIMARY KEY                NOT NULL AUTO_INCREMENT,
    ID_CLIENTE     INT                             NOT NULL,
    ID_FUNCIONARIO INT                             NOT NULL,
    ID_EMPRESA     INT                             NOT NULL,
    DT_PEDIDO      DATE                            NOT NULL,
    DS_STATUS      varchar(20)                     NOT NULL,
    TP_VENDA       varchar(20)                     NOT NULL,
    VL_TOTAL       decimal(10,2)                   NOT NULL,
    DT_ENVIO       DATE                            NULL,

    CONSTRAINT CK_PEDIDO_STATUS CHECK (DS_STATUS IN ('pendente','pago','enviado','concluido','cancelado')),
    CONSTRAINT CK_PEDIDO_TIPO   CHECK (TP_VENDA IN ('varejo','atacado')),
    CONSTRAINT CK_PEDIDO_TOTAL  CHECK (VL_TOTAL >= 0),
    CONSTRAINT CK_PEDIDO_ENVIO  CHECK (DS_STATUS <> 'cancelado' OR DT_ENVIO IS NULL),
    CONSTRAINT FK_CLIENTE_Pedido       FOREIGN KEY (ID_CLIENTE)
                    REFERENCES Cliente (ID_CLIENTE),
    CONSTRAINT FK_FUNCIONARIO_Pedido   FOREIGN KEY (ID_FUNCIONARIO)
                    REFERENCES Funcionario (ID_FUNCIONARIO),
    CONSTRAINT FK_EMPRESA_Pedido       FOREIGN KEY (ID_EMPRESA)
                    REFERENCES Empresa (ID_EMPRESA)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Item_Pedido (
    ID_ITEM_PEDIDO   INT PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    ID_PEDIDO        INT                           NOT NULL,
    ID_PRODUTO       INT                           NOT NULL,
    QT_ITEM          INT                           NOT NULL,
    VL_PRECO_UNITARIO decimal(10,2)                NOT NULL,

    CONSTRAINT CK_ITEM_QT    CHECK (QT_ITEM > 0),
    CONSTRAINT CK_ITEM_PRECO CHECK (VL_PRECO_UNITARIO > 0),
    CONSTRAINT UQ_ITEM_PEDIDO_PRODUTO UNIQUE (ID_PEDIDO, ID_PRODUTO),
    CONSTRAINT FK_ITEM_PEDIDO  FOREIGN KEY (ID_PEDIDO)  REFERENCES
        Pedido (ID_PEDIDO),
    CONSTRAINT FK_ITEM_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES
        Produto (ID_PRODUTO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

USE entrega_2_banco_de_dados;

CREATE TABLE Estoque (
    ID_ESTOQUE      INT PRIMARY KEY                NOT NULL AUTO_INCREMENT,
    ID_PRODUTO      INT                            NOT NULL,
    QT_DISPONIVEL   INT                            NOT NULL,
    QT_MINIMA       INT                            NOT NULL,
    DS_LOCALIZACAO  varchar(30)                    NOT NULL,
    DT_ATUALIZACAO  DATETIME                       NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT UQ_ESTOQUE_PRODUTO   UNIQUE (ID_PRODUTO),
    CONSTRAINT CK_ESTOQUE_DISPONIVEL CHECK (QT_DISPONIVEL >= 0),
    CONSTRAINT CK_ESTOQUE_MINIMA     CHECK (QT_MINIMA >= 0),
    CONSTRAINT FK_ESTOQUE_PRODUTO    FOREIGN KEY (ID_PRODUTO)
                    REFERENCES Produto (ID_PRODUTO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Fornecedor_Produto (
    ID_FORNECEDOR INT NOT NULL,
    ID_PRODUTO    INT NOT NULL,

    PRIMARY KEY (ID_FORNECEDOR, ID_PRODUTO),
    CONSTRAINT FK_FP_FORNECEDOR FOREIGN KEY (ID_FORNECEDOR) REFERENCES Fornecedor (ID_FORNECEDOR),
    CONSTRAINT FK_FP_PRODUTO    FOREIGN KEY (ID_PRODUTO)    REFERENCES Produto (ID_PRODUTO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Cliente (
    ID_CLIENTE      INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_CLIENTE    varchar(150)                   NOT NULL,
    NR_CNPJ         varchar(14)                    NULL UNIQUE,
    NR_CPF          varchar(11)                    NULL UNIQUE,
    NR_TELEFONE     varchar(11)                    NOT NULL,
    DS_EMAIL        varchar(120)                   NOT NULL,
    DS_ENDERECO     varchar(200)                   NOT NULL,
    TP_CLIENTE      char(1)                        NOT NULL, -- pessoa fisica (F), juridica (J)
    IN_ATIVO        boolean                        NOT NULL DEFAULT TRUE,

    CONSTRAINT CK_CLIENTE_DOC CHECK (
    (TP_CLIENTE = 'F' AND NR_CPF IS NOT NULL AND NR_CNPJ IS NULL) OR
    (TP_CLIENTE = 'J' AND NR_CNPJ IS NOT NULL AND NR_CPF IS NULL)
)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Pagamento (
    ID_PAGAMENTO            INT PRIMARY KEY        NOT NULL AUTO_INCREMENT,
    ID_PEDIDO               INT                    NOT NULL,
    NR_PARCELA              INT                    NOT NULL DEFAULT 1,
    QT_PARCELAS             INT                    NOT NULL DEFAULT 1,
    DT_PAGAMENTO            DATE                   NULL, -- NULL enquanto pendente/cancelado
    TP_FORMA_DE_PAGAMENTO   varchar(30)            NOT NULL,
    VL_PAGAMENTO            decimal(10,2)          NOT NULL,
    DS_STATUS               varchar(20)            NOT NULL,
    VL_DESCONTO             decimal(10,2)          NOT NULL DEFAULT 0,

    CONSTRAINT CK_PAG_FORMA  CHECK (TP_FORMA_DE_PAGAMENTO IN
                ('pix','cartao_credito','cartao_debito','boleto','transferencia','dinheiro')),
    CONSTRAINT CK_PAG_STATUS CHECK (DS_STATUS IN ('confirmado','pendente','estornado','cancelado')),
    CONSTRAINT CK_PAG_VALOR  CHECK (VL_PAGAMENTO > 0 AND VL_DESCONTO >= 0),
    CONSTRAINT CK_PAG_PARCELA CHECK (NR_PARCELA >= 1 AND NR_PARCELA <= QT_PARCELAS),
    CONSTRAINT UQ_PAG_PEDIDO_PARCELA UNIQUE (ID_PEDIDO, NR_PARCELA),
    CONSTRAINT FK_ID_PEDIDO FOREIGN KEY (ID_PEDIDO)
                       REFERENCES Pedido (ID_PEDIDO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



USE entrega_2_banco_de_dados;

-- =====================================================================
-- CONSULTAS GERENCIAIS
-- =====================================================================

-- G01 — Qual o faturamento mensal por tipo de venda (varejo x atacado) nos últimos 12 meses?
-- Atende: Acompanhamento de receita e mix de vendas
SELECT
    DATE_FORMAT(P.DT_PEDIDO, '%Y-%m')  AS MES,
    P.TP_VENDA                         AS TIPO_VENDA,
    COUNT(*)                           AS QT_PEDIDOS,
    SUM(P.VL_TOTAL)                    AS FATURAMENTO
FROM Pedido P
WHERE P.DS_STATUS IN ('pago', 'enviado', 'concluido')
  AND P.DT_PEDIDO >= DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 11 MONTH)
GROUP BY DATE_FORMAT(P.DT_PEDIDO, '%Y-%m'), P.TP_VENDA
ORDER BY MES, TIPO_VENDA;


-- G02 — Quais são os 10 produtos mais vendidos em quantidade e receita?
-- Atende: Gestão de portfólio e priorização de compras
SELECT
    PR.ID_PRODUTO,
    PR.DS_NOME,
    PR.DS_CATEGORIA,
    SUM(IP.QT_ITEM)                          AS QT_VENDIDA,
    SUM(IP.QT_ITEM * IP.VL_PRECO_UNITARIO)   AS RECEITA
FROM Item_Pedido IP
JOIN Pedido  P  ON P.ID_PEDIDO   = IP.ID_PEDIDO
JOIN Produto PR ON PR.ID_PRODUTO = IP.ID_PRODUTO
WHERE P.DS_STATUS <> 'cancelado'
GROUP BY PR.ID_PRODUTO, PR.DS_NOME, PR.DS_CATEGORIA
ORDER BY QT_VENDIDA DESC, RECEITA DESC
LIMIT 10;


-- G03 — Quais pedidos estão pendentes de pagamento há mais de 7 dias?
-- Atende: Risco de inadimplência e fluxo de caixa
SELECT
    P.ID_PEDIDO,
    C.NOME_CLIENTE,
    C.NR_TELEFONE,
    P.DT_PEDIDO,
    DATEDIFF(CURDATE(), P.DT_PEDIDO)  AS DIAS_EM_ABERTO,
    P.VL_TOTAL
FROM Pedido P
JOIN Cliente C ON C.ID_CLIENTE = P.ID_CLIENTE
WHERE P.DS_STATUS = 'pendente'
  AND DATEDIFF(CURDATE(), P.DT_PEDIDO) > 7
ORDER BY DIAS_EM_ABERTO DESC;


-- G04 — Qual o desempenho de vendas por funcionário (ranking de vendedores)?
-- Atende: Gestão de equipe comercial e metas
SELECT
    RANK() OVER (ORDER BY COALESCE(SUM(P.VL_TOTAL), 0) DESC) AS POSICAO,
    F.ID_FUNCIONARIO,
    F.NM_FUNCIONARIO,
    F.DS_CARGO,
    COUNT(P.ID_PEDIDO)                                       AS QT_PEDIDOS,
    COALESCE(SUM(P.VL_TOTAL), 0)                             AS TOTAL_VENDIDO,
    COALESCE(ROUND(AVG(P.VL_TOTAL), 2), 0)                   AS TICKET_MEDIO
FROM Funcionario F
LEFT JOIN Pedido P
       ON P.ID_FUNCIONARIO = F.ID_FUNCIONARIO
      AND P.DS_STATUS <> 'cancelado'
WHERE F.IN_ATIVO = TRUE
GROUP BY F.ID_FUNCIONARIO, F.NM_FUNCIONARIO, F.DS_CARGO
ORDER BY POSICAO, F.NM_FUNCIONARIO;


-- =====================================================================
-- CONSULTAS DE AUDITORIA
-- (cada consulta lista os registros que VIOLAM a regra; resultado vazio = conforme)
-- =====================================================================

-- A01 — O cadastro do cliente possui CNPJ ou CPF cadastrado?
-- Verifica: RN01
SELECT
    C.ID_CLIENTE,
    C.NOME_CLIENTE,
    C.TP_CLIENTE,
    C.NR_CPF,
    C.NR_CNPJ
FROM Cliente C
WHERE (COALESCE(TRIM(C.NR_CPF), '') = '' AND COALESCE(TRIM(C.NR_CNPJ), '') = '')
   OR (COALESCE(TRIM(C.NR_CPF), '') <> '' AND COALESCE(TRIM(C.NR_CNPJ), '') <> '');


-- A02 — O pedido pode ser considerado efetuado?
-- Verifica: RN02
-- Premissa: pedido efetuado (pago, enviado ou concluído) precisa ter ao menos um pagamento confirmado.
SELECT
    P.ID_PEDIDO,
    P.DT_PEDIDO,
    P.DS_STATUS,
    P.VL_TOTAL
FROM Pedido P
WHERE P.DS_STATUS IN ('pago', 'enviado', 'concluido')
  AND NOT EXISTS (
        SELECT 1
        FROM Pagamento PG
        WHERE PG.ID_PEDIDO = P.ID_PEDIDO
          AND PG.DS_STATUS = 'confirmado'
  );


-- A03 — Os pagamentos efetuados por Pix possuem 5% de desconto?
-- Verifica: RN03
-- Premissa: VL_PAGAMENTO já é o valor pago com desconto; o desconto deve ser 5% do valor original.
SELECT
    PG.ID_PAGAMENTO,
    PG.ID_PEDIDO,
    PG.VL_PAGAMENTO,
    PG.VL_DESCONTO,
    ROUND((PG.VL_PAGAMENTO + PG.VL_DESCONTO) * 0.05, 2) AS DESCONTO_ESPERADO
FROM Pagamento PG
WHERE PG.TP_FORMA_DE_PAGAMENTO = 'pix'
  AND PG.DS_STATUS = 'confirmado'
  AND PG.VL_DESCONTO <> ROUND((PG.VL_PAGAMENTO + PG.VL_DESCONTO) * 0.05, 2);


-- A04 — Há algum produto sem a quantidade mínima em estoque?
-- Verifica: RN04
SELECT
    PR.ID_PRODUTO,
    PR.DS_NOME,
    E.QT_DISPONIVEL,
    E.QT_MINIMA
FROM Produto PR
LEFT JOIN Estoque E ON E.ID_PRODUTO = PR.ID_PRODUTO
WHERE PR.IN_ATIVO = TRUE
  AND (E.ID_ESTOQUE IS NULL OR E.QT_DISPONIVEL < E.QT_MINIMA);


-- A05 — Há algum pedido cancelado mesmo após ter sido enviado?
-- Verifica: RN05
SELECT
    P.ID_PEDIDO,
    P.DT_PEDIDO,
    P.DT_ENVIO,
    P.DS_STATUS
FROM Pedido P
WHERE P.DS_STATUS = 'cancelado'
  AND P.DT_ENVIO IS NOT NULL;


-- A06 — Há algum pedido em atacado que tenha menos de 15 peças?
-- Verifica: RN06
SELECT
    P.ID_PEDIDO,
    P.DT_PEDIDO,
    P.TP_VENDA,
    COALESCE(SUM(IP.QT_ITEM), 0) AS QT_PECAS
FROM Pedido P
LEFT JOIN Item_Pedido IP ON IP.ID_PEDIDO = P.ID_PEDIDO
WHERE P.TP_VENDA = 'atacado'
GROUP BY P.ID_PEDIDO, P.DT_PEDIDO, P.TP_VENDA
HAVING COALESCE(SUM(IP.QT_ITEM), 0) < 15;




