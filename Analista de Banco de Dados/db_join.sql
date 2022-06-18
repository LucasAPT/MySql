-- CRIA BANCO DE DADOS

CREATE DATABASE db_join;

-- SELECIONA BANCO A SER UTILIZADO

USE db_join;

-- CRIA TABELA

CREATE TABLE fornecedor

(
	cnpj VARCHAR(14) PRIMARY KEY,
	razao_social VARCHAR(50),
	endereco VARCHAR(100),
	cidade VARCHAR(30)
);

-- INSERE VALORES

INSERT INTO fornecedor VALUES 

('17624092000185', 'Alpha Soluçoes em Informática', 'Rua 9 de Julho, 738', 'Marília'),

('47132482000176', 'MicroSvstem Informática ', 'Av. da Saudade, 98', 'Bauru'),

('56021482000112', 'J.W. Sistemas', 'Rua Paes Leme, 172', 'Marília'),

('27385372000136', 'ADABAS S/A', 'RRua 9 de Julho, 829', 'Marília');

-- CRIA TABELA

CREATE TABLE cliente

(
	codigo INT PRIMARY KEY,
	nome VARCHAR(50),
	endereco VARCHAR(100),
	cidade VARCHAR(30)
);

-- INSERE VALORES

INSERT INTO cliente VALUES 

(1, 'Francisco Santos', 'Rua XV de Novembro', '16'),

(2, 'Claudete Pereira', ' ', ' '),

(3, 'José Souza', 'Rua XV de Novembro', '16'),

(4, 'Sonia Santos Oliveira', ' ', 'Bauru');

-- CRIA TABELA

CREATE TABLE produto

(
	codigo INT PRIMARY KEY,
	descricao VARCHAR(100),
	estoque INT,
	valor INT,
	cnpj_fornecedor VARCHAR(14)
);

-- INSERE VALORES

INSERT INTO produto VALUES

(100,'Micro Pentium IV', 14, 850, '56021482000112'),

(200,'Impressora EPSON', 8, 280, '27385372000136'),

(300,'Scanner Genius', 9, 190, ' '),

(400,'Disquete 3M', 30, 10, '17624092000185');

-- CRIA TABELA

CREATE TABLE nota

(
	numero INT PRIMARY KEY,
	data DATE,
	tipo_pgto VARCHAR(15),
	codigo_cliente INT,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo)
);

-- INSERE VALORES

INSERT INTO nota VALUES

(1001, '2002-05-18', 'a vista', 2),

(1002, '2002-05-18', 'a vista', NULL),

(1003, '2002-05-19', 'a prazo', 4),

(1004, '2002-05-20', 'a vista', 3);

-- CRIA TABELA

CREATE TABLE item

(
	numero_nota INT,
    codigo_produto INT,
    FOREIGN KEY (codigo_produto) REFERENCES produto (codigo),
	qtde INT
);

-- INSERE VALORES

INSERT INTO item VALUES

(1001, 100, 1),

(1001, 400, 5),

(1003, 200, 1),

(1004, 300, 1),

(1004, 200, 2),

(1004, 300, 1);

-- PESQUISAS

-- QUESTÃO 01

SELECT p.descricao, p.estoque, f.razao_social
FROM produto AS p, fornecedor AS f 
WHERE p.cnpj_fornecedor = f.cnpj;

-- QUESTÃO 02

SELECT nome AS  'Nome Cliente',
numero_nota AS 'Nota Fiscal',
`data` AS 'Data',
valor as 'Valor (R$)' 
FROM (db_join.item  AS item LEFT JOIN db_join.nota AS nota ON item.numero_nota = numero)
LEFT JOIN db_join.produto AS produto ON item.codigo_produto=produto.codigo
LEFT JOIN db_join.cliente AS cliente ON cliente.codigo=nota.codigo_cliente;

-- QUESTÃO 03

SELECT cliente.nome, SUM(item.qtde * produto.valor) AS 'Soma das Notas (R$)'
FROM nota, item, produto, cliente 
WHERE nota.numero = item.numero_nota
AND item.codigo_produto = produto.codigo
AND cliente.codigo = nota.codigo_cliente
GROUP BY (cliente.nome);

-- QUESTÃO 04

SELECT f.razao_social, p.descricao, p.estoque
FROM produto AS p, FORNECEDOR AS f
WHERE p.cnpj_fornecedor = f.cnpj AND p.estoque =0;

-- QUESTÃO 05

SELECT nota.numero, item.qtde, produto.valor,
SUM(item.qtde * produto.valor) 'Soma Total (R$)',
nota.tipo_pgto AS tipo_pgto
FROM nota, item, produto
WHERE nota.numero = item.numero_nota 
AND item.codigo_produto = produto.codigo
AND nota.tipo_pgto = 'A Vista'
	UNION
SELECT nota.numero, item.qtde, produto.valor,
SUM(item.qtde * produto.valor) 'Soma Total (R$)',
nota.tipo_pgto AS tipo_pgto
FROM nota, item, produto
WHERE nota.numero = item.numero_nota 
AND item.codigo_produto = produto.codigo
AND nota.tipo_pgto = 'A Prazo' GROUP BY (nota.tipo_pgto);

-- QUESTÃO 05 / TOTAL SEPARADO 

SELECT nota.numero, item.qtde, produto.valor,
(item.qtde * produto.valor) AS 'Notas',
nota.tipo_pgto AS tipo_pagamento
FROM nota, item, produto 
WHERE nota.numero = item.numero_nota 
AND item.codigo_produto = produto.codigo
AND nota.tipo_pgto = 'A vista'
	UNION
SELECT nota.numero, item.qtde, produto.valor,
(item.qtde * produto.valor) AS 'Notas', 
nota.tipo_pgto AS tipo_pagamento
FROM nota, item, produto 
WHERE nota.numero = item.numero_nota 
AND item.codigo_produto = produto.codigo
AND nota.tipo_pgto = 'A prazo';
