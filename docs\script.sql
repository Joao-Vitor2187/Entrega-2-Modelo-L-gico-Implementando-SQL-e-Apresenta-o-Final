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


CREATE TABLE Fornecedor_Produto (
    ID_FORNECEDOR INT NOT NULL,
    ID_PRODUTO    INT NOT NULL,

    PRIMARY KEY (ID_FORNECEDOR, ID_PRODUTO),
    CONSTRAINT FK_FP_FORNECEDOR FOREIGN KEY (ID_FORNECEDOR) REFERENCES Fornecedor (ID_FORNECEDOR),
    CONSTRAINT FK_FP_PRODUTO    FOREIGN KEY (ID_PRODUTO)    REFERENCES Produto (ID_PRODUTO)
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



















