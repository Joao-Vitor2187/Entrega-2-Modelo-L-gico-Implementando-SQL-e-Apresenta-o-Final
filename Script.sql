CREATE DATABASE IF NOT EXISTS entrega_2_banco_de_dados
    DEFAULT CHARSET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE entrega_2_banco_de_dados;

CREATE TABLE Cliente (
    ID_CLIENTE      INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NOME_CLIENTE    varchar(150)                   NOT NULL,
    NR_CPF_CNPJ     varchar(14)                    NOT NULL UNIQUE,
    NR_TELEFONE     varchar(11)                    NOT NULL,
    DS_EMAIL        varchar(120)                   NOT NULL,
    DS_ENDERECO     varchar(200)                   NOT NULL,
    TP_CLIENTE      char(1)                        NOT NULL, -- pessoa física (f), jurídica (j)
    IN_ATIVO                                       boolean,


    CONSTRAINT CK_CLIENTE_TIPO CHECK (TP_CLIENTE IN ('F', 'J'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Funcionario (
    ID_FUNCIONARIO  INT PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    NM_FUNCIONARIO  varchar(120)                  NOT NULL,
    NR_CPF          varchar(11)                   NOT NULL,
    NR_TELEFONE     varchar(11)                   NOT NULL,
    DS_CARGO        varchar(30)                   NOT NULL,
    DS_EMAIL        varchar(120)                  NOT NULL,
    DT_ADMISSAO     DATE                          NOT NULL,
    IN_ATIVO        boolean                       NOT NULL DEFAULT TRUE,

    CONSTRAINT UQ_FUNCIONARIO_CPF UNIQUE (NR_CPF)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE Empresa (
    ID_EMPRESA      INT PRIMARY KEY                NOT NULL AUTO_INCREMENT,
    DS_RAZAO_SOCIAL varchar(150)                   NOT NULL,
    NR_CNPJ         varchar(14)                    NOT NULL,
    NM_FANTASIA     varchar(150)                   NOT NULL,
    DS_ENDERECO     varchar(200)                   NOT NULL,
    NR_TELEFONE     varchar(20)                    NOT NULL,
    DS_EMAIL        varchar(150)                   NOT NULL,

    CONSTRAINT UQ_CNPJ_EMPRESA UNIQUE (NR_CNPJ)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Etoque (
    ID_ESTOQUE             INT  PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    QT_PRODUTO_DISPONIVEL  INT                            NOT NULL,
    ID_PRODUTO             INT                            NOT NULL,
    QT_DISPONIVEL          INT CHECK (QT_DISPONIVEL >= 0) NOT NULL,
    QT_MINIMA              INT CHECK (QT_MINIMA >= 0)     NOT NULL,
    DT_ATUALIZACAO         DATETIME                       NOT NULL,

    CONSTRAINT UQ_ESTOQUE_PRODUTO UNIQUE (ID_PRODUTO),
    CONSTRAINT FK_ESTOQUE_PRODUTO UNIQUE (ID_PRODUTO),
    CONSTRAINT FK_QT_PRODUTO_DISPONIVEL FOREIGN KEY (QT_PRODUTO_DISPONIVEL)
                    REFERENCES Produto (QT_PRODUTO_DISPONIVEL)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Pedido (
    ID_PEDIDO      INT  PRIMARY KEY                NOT NULL AUTO_INCREMENT,
    ID_CLIENTE     INT                             NOT NULL AUTO_INCREMENT,
    ID_FUNCIONARIO INT                             NOT NULL AUTO_INCREMENT,
    DT_PEDIDO      DATE                            NOT NULL,
    DS_STATUS      varchar(20)                     NOT NULL,
    TP_VENDA       varchar(20)                     NOT NULL,
    VL_TOTAL       decimal(10,2)                   NOT NULL,
    DT_ENVIO       DATE                            NOT NULL,

    CONSTRAINT FK_CLIENTE_Pedido       FOREIGN KEY (ID_CLIENTE)
                    REFERENCES Cliente (ID_CLIENTE),
    CONSTRAINT FK_FUNCIONARIO_Pedido   FOREIGN KEY (ID_FUNCIONARIO)
                    REFERENCES Funcionario (ID_FUNCIONARIO)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Fornecedor (
    ID_FORNECEDOR  INT  PRIMARY KEY               NOT NULL AUTO_INCREMENT,
    NM_FORNECEDOR  varchar(120)                   NOT NULL,
    NR_CNPJ        varchar(14)                    NOT NULL,
    NR_TELEFONE    varchar(11)                    NOT NULL,
    DS_EMAIL       varchar(120)                   NOT NULL,
    DS_ENDERECO    varchar(200)                   NOT NULL,
    IN_ATIVO       boolean                        NOT NULL, CHECK ( IN_ATIVO IN ('A', 'I')),

    CONSTRAINT UQ_CNPJ_Fornecedor     UNIQUE (NR_CNPJ),
    CONSTRAINT UQ_TELEFONE_Fornecedor UNIQUE (NR_TELEFONE),
    CONSTRAINT UQ_EMAIL_Fornecedor    UNIQUE (DS_EMAIL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Pagamento (
    ID_PAGAMENTO            INT PRIMARY KEY        NOT NULL AUTO_INCREMENT,
    ID_PEDIDO               INT                    NOT NULL,
    DT_PAGAMENTO            DATE                   NOT NULL,
    TP_FORMA_DE_PAGAMENTO   varchar(30)            NOT NULL,
    VL_PAGAMENTO            decimal(10,2)          NOT NULL,
    DS_STATUS               varchar(20)            NOT NULL,
    VL_DESCONTO             decimal(5,2)           NOT NULL,

    CONSTRAINT FK_ID_PEDIDO FOREIGN KEY (ID_PEDIDO)
                       REFERENCES Pedido (ID_PEDIDO),
    CONSTRAINT FK_ID_PAGAMENTO FOREIGN KEY (ID_PAGAMENTO)
                       REFERENCES Pagamento (ID_PAGAMENTO)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Produto
(
    ID_PRODUTO             INT PRIMARY KEY        NOT NULL AUTO_INCREMENT,
    QT_PRODUTO_DISPONIVEL  INT                    NOT NULL,
    QT_MINIMA              INT                    NOT NULL,
    DS_LOCALIZACAO         INT                    NOT NULL,
    DT_ATUALIZACAO         DATETIME               NOT NULL
        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;























