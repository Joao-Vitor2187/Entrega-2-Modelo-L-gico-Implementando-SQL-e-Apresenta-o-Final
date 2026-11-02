use entrega_2_banco_de_dados;


INSERT INTO Empresa
    (DS_RAZAO_SOCIAL, NR_CNPJ, NM_FANTASIA, DS_ENDERECO, NR_TELEFONE, DS_EMAIL)
VALUES
('Peg Vest jeans',  '11222333000180', 'Peg Vest jeans',   'R. Rodrigues dos Santos, 718','11961732019',  'vendas@pegvetjeans.com.br');

SELECT * FROM Empresa;

INSERT INTO Cliente
    (NOME_CLIENTE, NR_CPF_CNPJ, NR_TELEFONE, DS_EMAIL, DS_ENDERECO, TP_CLIENTE, IN_ATIVO)
VALUES
-- Pessoas físicas
('Ana Beatriz Souza',        '12345678901', '11987654321', 'ana.souza@email.com',        'Rua das Flores, 120 - Pinheiros, São Paulo - SP',            'F', 1),
('Carlos Eduardo Lima',      '23456789012', '11976543210', 'carlos.lima@email.com',      'Av. Paulista, 1500 - Bela Vista, São Paulo - SP',            'F', 1),
('Mariana Oliveira Costa',   '34567890123', '21998765432', 'mariana.costa@email.com',    'Rua Voluntários da Pátria, 45 - Botafogo, Rio de Janeiro - RJ', 'F', 1),
('João Pedro Santos',        '45678901234', '31987651234', 'joao.santos@email.com',      'Av. Afonso Pena, 900 - Centro, Belo Horizonte - MG',         'F', 1),
('Fernanda Almeida',         '56789012345', '41991234567', 'fernanda.almeida@email.com', 'Rua XV de Novembro, 300 - Centro, Curitiba - PR',            'F', 0),
('Ricardo Mendes Pereira',   '67890123456', '51982345678', 'ricardo.pereira@email.com',  'Av. Ipiranga, 2200 - Azenha, Porto Alegre - RS',             'F', 1),
('Tech Solutions Ltda',            '12345678000195', '1133334444', 'contato@techsolutions.com.br',   'Av. Brigadeiro Faria Lima, 3477 - Itaim Bibi, São Paulo - SP', 'J', 1),
('Mercado Bom Preço ME',           '23456789000106', '2133335555', 'financeiro@bompreco.com.br',     'Rua da Assembleia, 100 - Centro, Rio de Janeiro - RJ',        'J', 1),
('Construtora Horizonte S.A.',     '34567890000117', '3133336666', 'compras@horizonte.com.br',       'Av. do Contorno, 5000 - Funcionários, Belo Horizonte - MG',   'J', 1),
('Distribuidora Sul Comércio Ltda','45678901000128', '4133337777', 'vendas@distribuidorasul.com.br', 'Rua Marechal Deodoro, 500 - Centro, Curitiba - PR',         'J', 1);

SELECT * FROM Cliente;

INSERT INTO Fornecedor
    (NM_FORNECEDOR, NR_CNPJ, NR_TELEFONE, DS_EMAIL, DS_ENDERECO, IN_ATIVO)
VALUES
('Denim Brasil Tecidos S.A.',            '14253647000101', '11931110001', 'vendas@denimbrasiltecidos.com.br',      'Rua José Paulino, 850 - Bom Retiro, São Paulo - SP, 01120-001', 'A'),
('Índigo Azul Têxtil Ltda',              '25364758000102', '11932220002', 'comercial@indigoazultextil.com.br',     'Av. do Estado, 4200 - Cambuci, São Paulo - SP, 01516-000', 'A'),
('Jeans Premium Confecções Eireli',      '36475869000103', '19933330003', 'pedidos@jeanspremiumconfeccoes.com.br', 'Rua Barão de Jaguara, 600 - Centro, Campinas - SP, 13015-001', 'A'),
('Fiolinha Linhas e Aviamentos',         '47586970000104', '11934440004', 'vendas@fiolinhaaviamentos.com.br',      'Rua Aurora, 320 - Santa Ifigênia, São Paulo - SP, 01209-001', 'A'),
('Botões & Rebites Metálicos Ltda',      '58697081000105', '11935550005', 'atendimento@botoesrebites.com.br',      'Rua Oriente, 145 - Brás, São Paulo - SP, 03016-000', 'A'),
('Zíper Forte Indústria e Comércio',     '69708192000106', '47936660006', 'orcamentos@ziperforte.com.br',          'Rua Blumenau, 980 - Itoupava Seca, Blumenau - SC, 89030-001', 'A'),
('Lavanderia Industrial Stone Wash',     '70819203000107', '44937770007', 'contato@stonewashlavanderia.com.br',    'Av. Colombo, 5100 - Zona 07, Maringá - PR, 87020-001', 'A'),
('Toritama Jeans Atacado',               '81920314000108', '81938880008', 'vendas@toritamajeansatacado.com.br',    'Rua Pedro Alves, 75 - Centro, Toritama - PE, 55125-000', 'A'),
('Estamparia Digital Pop Cor',           '92031425000109', '11939990009', 'arte@estampariapopcor.com.br',          'Rua Silva Teles, 410 - Brás, São Paulo - SP, 03026-000', 'I'),
('Etiquetas Marca Viva Ltda',            '03142536000110', '11940010010', 'comercial@etiquetasmarcaviva.com.br',   'Rua Joli, 230 - Brás, São Paulo - SP, 03016-020', 'A'),
('Cabides e Displays Vitrine Ltda',      '14253640000111', '31941120011', 'vendas@vitrinedisplays.com.br',         'Av. Cristiano Machado, 3300 - Cidade Nova, Belo Horizonte - MG, 31170-000', 'A'),
('Embalagens Eco Sacola Verde',          '25364751000112', '41942230012', 'pedidos@ecosacolaverde.com.br',         'Rua Brigadeiro Franco, 1500 - Centro, Curitiba - PR, 80430-210', 'A');

SELECT * FROM Fornecedor;

INSERT INTO Produto
    (ID_PRODUTO, DS_NOME, DS_CATEGORIA, DS_TAMANHO, DS_COR, VL_PRECO_VAREJO, VL_PRECO_ATACADO, IN_ATIVO)
VALUES
(1,  'Camiseta Básica Algodão',   'Camiseta',  'P',  'Branco',     59.90,  39.90, TRUE),
(2,  'Camiseta Básica Algodão',   'Camiseta',  'M',  'Branco',     59.90,  39.90, TRUE),
(3,  'Camiseta Básica Algodão',   'Camiseta',  'G',  'Preto',      59.90,  39.90, TRUE),
(4,  'Camiseta Estampada Urban',  'Camiseta',  'M',  'Azul',       79.90,  54.90, TRUE),
(5,  'Camiseta Polo Piquet',      'Camiseta',  'G',  'Verde',      99.90,  69.90, TRUE),
(6,  'Camiseta Oversized Street', 'Camiseta',  'GG', 'Cinza',      89.90,  61.90, TRUE),
(7,  'Calça Jeans Slim',          'Calça',     '38', 'Azul',      189.90, 129.90, TRUE),
(8,  'Calça Jeans Slim',          'Calça',     '40', 'Azul',      189.90, 129.90, TRUE),
(9,  'Calça Jeans Reta',          'Calça',     '42', 'Preto',     199.90, 139.90, TRUE),
(10, 'Calça Sarja Chino',         'Calça',     '44', 'Bege',      169.90, 114.90, TRUE),
(11, 'Calça Jogger Moletom',      'Calça',     'M',  'Cinza',     139.90,  94.90, TRUE),
(12, 'Calça Legging Fitness',     'Calça',     'P',  'Preto',      89.90,  59.90, TRUE),
(13, 'Bermuda Tactel Praia',      'Bermuda',   'M',  'Azul',       69.90,  44.90, TRUE),
(14, 'Bermuda Jeans Destroyed',   'Bermuda',   '42', 'Azul',      119.90,  79.90, TRUE),
(15, 'Short Saia Social',         'Short',     'P',  'Preto',      79.90,  52.90, TRUE),
(16, 'Short Moletom Casual',      'Short',     'G',  'Cinza',      74.90,  49.90, FALSE),
(17, 'Vestido Midi Floral',       'Vestido',   'M',  'Rosa',      159.90, 109.90, TRUE),
(18, 'Vestido Longo Festa',       'Vestido',   'G',  'Vinho',     249.90, 169.90, TRUE),
(19, 'Vestido Curto Casual',      'Vestido',   'P',  'Amarelo',   119.90,  79.90, TRUE),
(20, 'Saia Plissada Midi',        'Saia',      'M',  'Verde',     109.90,  72.90, TRUE),
(21, 'Moletom Canguru Capuz',     'Moletom',   'G',  'Preto',     179.90, 124.90, TRUE),
(22, 'Moletom Careca Básico',     'Moletom',   'M',  'Cinza',     149.90,  99.90, TRUE),
(23, 'Jaqueta Jeans Clássica',    'Jaqueta',   'M',  'Azul',      229.90, 159.90, TRUE),
(24, 'Jaqueta Corta Vento',       'Jaqueta',   'GG', 'Vermelho',  199.90, 139.90, FALSE),
(25, 'Casaco Tricot Gola Alta',   'Casaco',    'P',  'Bege',      189.90, 129.90, TRUE),
(26, 'Camisa Social Slim',        'Camisa',    'M',  'Branco',    149.90, 102.90, TRUE),
(27, 'Camisa Linho Manga Longa',  'Camisa',    'G',  'Bege',      169.90, 116.90, TRUE),
(28, 'Camisa Xadrez Flanela',     'Camisa',    'M',  'Vermelho',  139.90,  94.90, TRUE),
(29, 'Boné Aba Curva Bordado',    'Acessório', 'U',  'Preto',      49.90,  32.90, TRUE),
(30, 'Cinto Couro Sintético',     'Acessório', 'U',  'Marrom',     59.90,  39.90, FALSE);

SELECT * FROM Produto;

INSERT INTO Funcionario
    (NM_FUNCIONARIO, NR_CPF, NR_TELEFONE, DS_CARGO, DS_EMAIL, DT_ADMISSAO, IN_ATIVO)
VALUES
('Marcos Vinícius Andrade',   '10293847561', '11987651122', 'Gerente de Vendas',     'marcos.andrade@empresa.com.br',   '2018-03-12', 1),
('Fernanda Cristina Lopes',   '20384756172', '11976542233', 'Vendedora',             'fernanda.lopes@empresa.com.br',   '2020-07-01', 1),
('Rodrigo Alves Pinto',       '30475667283', '11965433344', 'Vendedor',              'rodrigo.pinto@empresa.com.br',    '2021-02-15', 1),
('Tatiane Moraes Ribeiro',    '40566778394', '11954324455', 'Vendedora',             'tatiane.ribeiro@empresa.com.br',  '2019-09-23', 1),
('Eduardo Henrique Silva',    '50657889405', '11943215566', 'Estoquista',            'eduardo.silva@empresa.com.br',    '2017-05-08', 1),
('Larissa Gonçalves Cardoso', '60748990516', '11932106677', 'Analista Financeiro',   'larissa.cardoso@empresa.com.br',  '2022-01-10', 1),
('Paulo Roberto Fernandes',   '70839001627', '11921097788', 'Gerente de Estoque',    'paulo.fernandes@empresa.com.br',  '2016-11-30', 1),
('Aline Batista Correia',     '81920112738', '11910988899', 'Assistente Administrativo', 'aline.correia@empresa.com.br', '2023-04-17', 1),
('Thiago Ramos Monteiro',     '92011223849', '11999889900', 'Vendedor',              'thiago.monteiro@empresa.com.br',  '2019-06-03', 0),
('Débora Siqueira Nunes',     '03102334950', '11988770011', 'Atendente',             'debora.nunes@empresa.com.br',     '2021-10-25', 1),
('Felipe Augusto Carvalho',   '14213445061', '11977661122', 'Entregador',            'felipe.carvalho@empresa.com.br',  '2020-02-18', 1),
('Renata Machado Freitas',    '25324556172', '11966552233', 'Gerente Financeiro',    'renata.freitas@empresa.com.br',   '2015-08-05', 1),
('Bruno César Teixeira',      '36435667283', '11955443344', 'Estoquista',            'bruno.teixeira@empresa.com.br',   '2022-09-12', 0),
('Vanessa Duarte Campos',     '47546778394', '11944334455', 'Analista de RH',        'vanessa.campos@empresa.com.br',   '2018-12-01', 1),
('Leonardo Barros Azevedo',   '58657889405', '11933225566', 'Auxiliar de Logística', 'leonardo.azevedo@empresa.com.br', '2023-08-21', 1);

SELECT * FROM Funcionario;

INSERT INTO Pedido
    (ID_CLIENTE, ID_FUNCIONARIO, ID_EMPRESA, DT_PEDIDO, DS_STATUS, TP_VENDA, VL_TOTAL, DT_ENVIO)
VALUES
(1,  3,  3, '2026-08-03', 'concluido', 'varejo',  249.90, '2026-08-05'),
(2,  7,  3, '2026-08-05', 'concluido', 'atacado', 4850.00, '2026-08-08'),
(3,  1,  3, '2026-08-10', 'cancelado', 'varejo',  129.50, NULL),
(4, 12,  3, '2026-08-12', 'concluido', 'varejo',  580.75, '2026-08-14'),
(5,  5,  3, '2026-08-15', 'concluido', 'atacado', 12300.00, '2026-08-19'),
(6,  9,  3, '2026-08-20', 'enviado',   'varejo',  319.99, '2026-08-22'),
(7, 14,  3, '2026-08-25', 'cancelado', 'atacado', 2750.00, NULL),
(8,  2,  3, '2026-09-01', 'concluido', 'varejo',   89.90, '2026-09-03'),
(9, 10,  3, '2026-09-04', 'enviado',   'atacado', 7600.40, '2026-09-07'),
(10, 6,  3, '2026-09-09', 'concluido', 'varejo',  459.00, '2026-09-11'),
(1, 15,  3, '2026-09-14', 'pago',      'varejo',  175.30, NULL),
(3,  8,  3, '2026-09-18', 'concluido', 'atacado', 9980.00, '2026-09-22'),
(7,  4,  3, '2026-09-23', 'cancelado', 'varejo',  399.00, NULL),
(8, 11,  3, '2026-09-28', 'enviado',   'varejo',  620.45, '2026-09-30'),
(2, 13,  3, '2026-10-02', 'pago',      'atacado', 5400.00, NULL),
(4,  3,  3, '2026-10-08', 'concluido', 'varejo',  210.00, '2026-10-10'),
(9,  6,  3, '2026-10-13', 'pendente',  'varejo',  145.80, NULL),
(5,  1,  3, '2026-10-19', 'enviado',   'atacado', 15750.00, '2026-10-23'),
(10, 7,  3, '2026-10-24', 'pendente',  'atacado', 3200.00, NULL),
(6,  2,  3, '2026-10-29', 'pago',      'varejo',  98.60, NULL);

SELECT * FROM Pedido;

INSERT INTO Item_Pedido
    (ID_PEDIDO, ID_PRODUTO, QT_ITEM, VL_PRECO_UNITARIO)
VALUES
(1,   5,  3,   83.30),
(2,  12, 10,  485.00),
(3,   7,  1,  129.50),
(4,  18,  1,  580.75),
(5,  25,  6, 2050.00),
(6,   9,  1,  319.99),
(7,  22,  5,  550.00),
(8,  30,  1,   89.90),
(9,  13,  4, 1900.10),
(10, 19,  3,  153.00),
(11, 24,  2,   87.65),
(12, 20,  4, 2495.00),
(13, 15,  1,  399.00),
(14, 23,  1,  620.45),
(15,  8,  6,  900.00),
(16,  2,  2,  105.00),
(17, 11,  2,   72.90),
(18, 28,  7, 2250.00),
(19, 17,  4,  800.00),
(20, 27,  2,   49.30);

INSERT INTO Fornecedor_Produto (ID_FORNECEDOR, ID_PRODUTO) VALUES
-- Fornecedor principal de cada produto
(1, 1),   (1, 2),   (1, 3),
(2, 4),   (2, 5),   (2, 6),
(3, 7),   (3, 8),
(4, 9),   (4, 10),  (4, 11),
(5, 12),  (5, 13),
(6, 14),  (6, 15),  (6, 16),
(7, 17),  (7, 18),
(8, 19),  (8, 20),  (8, 21),
(9, 22),  (9, 23),
(10, 24), (10, 25), (10, 26),
(11, 27), (11, 28),
(12, 29), (12, 30),
-- Produtos com um segundo fornecedor
(4, 1),   (7, 5),   (9, 8),   (12, 11),
(2, 14),  (10, 17), (1, 20),  (5, 23),
(11, 25), (3, 28);

SELECT * FROM Fornecedor_Produto;

INSERT INTO Pagamento (ID_PEDIDO, NR_PARCELA, QT_PARCELAS, DT_PAGAMENTO, TP_FORMA_DE_PAGAMENTO, VL_PAGAMENTO, DS_STATUS, VL_DESCONTO) VALUES
-- Pedido 1 (concluido, 249.90)
(1,  1, 1, '2026-08-03', 'pix',            249.90,  'confirmado', 0.00),
-- Pedido 2 (concluido, 4850.00)
(2,  1, 2, '2026-08-05', 'cartao_credito', 2425.00, 'confirmado', 0.00),
(2,  2, 2, '2026-09-05', 'cartao_credito', 2425.00, 'confirmado', 0.00),
-- Pedido 3 (cancelado, 129.50)
(3,  1, 1, NULL,         'boleto',         129.50,  'cancelado', 0.00),
-- Pedido 4 (concluido, 580.75)
(4,  1, 1, '2026-08-12', 'cartao_debito',  580.75,  'confirmado', 0.00),
-- Pedido 5 (concluido, 12300.00)
(5,  1, 3, '2026-08-15', 'boleto',         4100.00, 'confirmado', 0.00),
(5,  2, 3, '2026-09-15', 'boleto',         4100.00, 'confirmado', 0.00),
(5,  3, 3, '2026-10-15', 'boleto',         4100.00, 'confirmado', 0.00),
-- Pedido 6 (enviado, 319.99)
(6,  1, 1, '2026-08-20', 'pix',            319.99,  'confirmado', 0.00),
-- Pedido 7 (cancelado e estornado, 2750.00)
(7,  1, 1, '2026-08-26', 'pix',            2750.00, 'estornado', 0.00),
-- Pedido 8 (concluido, 89.90 = 84.90 + 5.00 de desconto)
(8,  1, 1, '2026-09-01', 'dinheiro',       84.90,   'confirmado', 5.00),
-- Pedido 9 (enviado, 7600.40)
(9,  1, 2, '2026-09-04', 'cartao_credito', 3800.20, 'confirmado', 0.00),
(9,  2, 2, '2026-10-04', 'cartao_credito', 3800.20, 'confirmado', 0.00),
-- Pedido 10 (concluido, 459.00)
(10, 1, 1, '2026-09-09', 'pix',            459.00,  'confirmado', 0.00),
-- Pedido 11 (pago, 175.30)
(11, 1, 1, '2026-09-14', 'pix',            175.30,  'confirmado', 0.00),
-- Pedido 12 (concluido, 9980.00)
(12, 1, 4, '2026-09-18', 'cartao_credito', 2495.00, 'confirmado', 0.00),
(12, 2, 4, '2026-10-18', 'cartao_credito', 2495.00, 'confirmado', 0.00),
(12, 3, 4, NULL,         'cartao_credito', 2495.00, 'pendente',   0.00),
(12, 4, 4, NULL,         'cartao_credito', 2495.00, 'pendente',   0.00),
-- Pedido 13 (cancelado, 399.00)
(13, 1, 1, NULL,         'pix',            399.00,  'cancelado', 0.00),
-- Pedido 14 (enviado, 620.45)
(14, 1, 1, '2026-09-28', 'cartao_debito',  620.45,  'confirmado', 0.00),
-- Pedido 15 (pago, 5400.00)
(15, 1, 1, '2026-10-02', 'transferencia',  5400.00, 'confirmado', 0.00),
-- Pedido 16 (concluido, 210.00)
(16, 1, 1, '2026-10-08', 'dinheiro',       210.00,  'confirmado', 0.00),
-- Pedido 17 (pendente, 145.80)
(17, 1, 1, NULL,         'boleto',         145.80,  'pendente',   0.00),
-- Pedido 18 (enviado, 15750.00)
(18, 1, 3, '2026-10-19', 'boleto',         5250.00, 'confirmado', 0.00),
(18, 2, 3, NULL,         'boleto',         5250.00, 'pendente',   0.00),
(18, 3, 3, NULL,         'boleto',         5250.00, 'pendente',   0.00),
-- Pedido 19 (pendente, 3200.00)
(19, 1, 2, NULL,         'cartao_credito', 1600.00, 'pendente',   0.00),
(19, 2, 2, NULL,         'cartao_credito', 1600.00, 'pendente',   0.00),
-- Pedido 20 (pago, 98.60)
(20, 1, 1, '2026-10-29', 'pix',            98.60,   'confirmado', 0.00);

SELECT * FROM Pagamento;

































