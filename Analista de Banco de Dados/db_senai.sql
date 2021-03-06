-- APAGA BANCO DE DADOS SE EXISTE
DROP DATABASE IF EXISTS db_senai;

-- CRIA BANCO DE DADOS SE NÃO EXISTE
CREATE DATABASE IF NOT EXISTS db_senai;

-- SELECIONA O BANCO A SER UTILIZADO
USE db_senai;

-- CRIA TABELA
CREATE TABLE clientes
(
	cod INT,
    nome VARCHAR (100)
);

-- ALTERA TABELAS
ALTER TABLE clientes ADD email VARCHAR (50);
ALTER TABLE clientes DROP email;
ALTER TABLE clientes MODIFY nome VARCHAR (200);

-- APAGA TABELA
DROP TABLE clientes;

-- CRIA TABELA
CREATE TABLE produtos
(
	cod INT,
    nome VARCHAR (100),
    preco DECIMAL (10,2)
);

-- INSERE NA TABELA PRODUTOS
INSERT INTO produtos (cod, nome, preco) VALUES (1, 'cafe', 5.0);

-- MOSTRA OS DADOS 
SELECT * FROM produtos;

-- INSERE UM PRODUTO NA TABELA PRODUTOS
INSERT INTO produtos (cod, nome) VALUES (1, 'batata');
-- NA TABELA ACIMA TEM UM PRODUTO SEM O PREÇO // PARA CORRIGIR PODERIA:
-- EXCLUIR O PRODUTO E CRIA OUTRO OU USAR O COMANDO 'UPDATE'

-- INSERE NA TABELA
INSERT INTO produtos VALUES (3, 'ARROZ', 10.0);
-- NO COMANDO ACIMA FOI UTILIZADO UM ATALHO PARA INSERIR O PRODUTO
-- O BANCO JÁ ENTENDE QUE EXISTEM AQUELAS INFORMAÇÕES, BASTANDO APENAS QUE SE INSIRA OS VALORES NA ORDEM CORRETA

-- MOSTRA OS DADOS 
SELECT * FROM produtos;

-- INSERÇAO DE DADOS
INSERT INTO produtos VALUES 
(4, 'Açúcar', 2.99), (5, 'Macarrão', 2.99), (6, 'Carne', 12.99), (7, 'Frango', 8.99), (8, 'Água', 1.99),
(9, 'Detergente', 0.99), (10, 'Sabao em pó', 6.99), (11, 'Sal', 1.99), (12, 'Balde', 4.99), 
(13, 'Refrigerante', 4.99), (14, 'Suco 200ml', 1.99), (15, 'Pão Kg', 23.99), (16, 'Bacon Kg', 23.99), 
(17, 'Calabresa', 13.99), (18, 'Vassoura', 6.99), (19, 'Leite em pó', 5.99), (20, 'Cerveja', 2.99);

-- ATUALIZA DADOS EM UMA TABELA (nome e preco)
UPDATE produtos SET nome = 'Água Mineral', preco = 2.99 WHERE cod = 8;

-- ATUALIZA DADOS EM UMA TABELA
UPDATE produtos SET nome = 'Filé de Frango' WHERE cod = 7;

-- ATUALIZA DIVERSOS DADOS // SUBIU +1 NOS PREÇOS DOS PRODUTOS DOS CÓDIGOS SELECIONADOS
UPDATE produtos SET preco = preco +1 WHERE cod IN (6, 12, 19); 
-- COMANDO APARENTEMENTE BEM RELEVANTE

-- MOSTRA OS DADOS 
SELECT * FROM produtos;

-- VOU INSERIR PRODUTOS PARA DEPOIS REMOVÊ-LOS
INSERT INTO produtos VALUES (21, 'Melancia', 2.99), (22, 'Manjericão', 1.99), (23, 'Queijo Coalho', 8.99);

-- REMOVENDO PRODUTOS DE DUAS FORMAS // INDIVUAL E VÁRIOS ITENS
DELETE FROM produtos WHERE cod = 21;
DELETE FROM produtos WHERE cod IN (22, 23);

-- REMOVENDO PRODUTOS DE ACORDO COM DEFINIÇÃO NO PREÇO
DELETE FROM produtos WHERE preco <3;

-- APAGANDO PRODUTOS SEM PREÇO
DELETE FROM produtos WHERE preco IS NULL;

-- SELECIONA/MOSTRA TODOS OS DADOS NA TABELA produtos
SELECT * FROM produtos;

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS (nome, preço) NA TABELA produtos
SELECT nome, preco FROM produtos;

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS (nome, preço) ONDE 'cod' é 15 NA TABELA produtos
SELECT nome, preco FROM produtos WHERE cod = 15;

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS (nome, preço) DE DETERMINADOS cod
SELECT nome, preco FROM produtos WHERE cod IN (15,17,99);
-- COMO NÃO EXISTE PRODUTO DE cod 99, ELE NÃO LISTA

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS ONDE O PREÇO ESTÁ ENTRE UM VALOR E OUTRO 
SELECT cod, nome, preco FROM produtos WHERE preco BETWEEN 2 and 5;

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS ONDE O NOME É 'PÃO' 
SELECT cod, nome, preco FROM produtos WHERE nome LIKE 'PÃO';

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS ONDE O NOME COMEÇA COM 'Ba'
SELECT cod, nome, preco FROM produtos WHERE nome LIKE 'Ba%';
-- O % NO FINAL SIGNIFICA QUE PODE TERMINAR COM QUALQUER COISA

-- SELECIONA/MOSTRA DADOS ESPECÍFICOS ONDE O NOME TERMINA COM 'e'
SELECT cod, nome, preco FROM produtos WHERE nome LIKE '%e';
-- O % NO INÍCIO SIGNIFICA QUE PODE COMEÇAR COM QUALQUER COISA

-- SELECIONA/MOSTRA OS DADOS NA TABELA produtos
SELECT cod, nome, preco FROM produtos;
-- GERALMENTE NÃO SE USA O * NA PESQUISA, POIS COSTUMAMOS BUSCAR UM DADO ESPECÍFICO

-- SELECIONA/MOSTRA DADOS E TEM UM QUE NÃO EXISTE NA TABELA ''campo fixo''
SELECT cod, nome, preco 'promocao' FROM produtos;
-- ELE VAI MOSTRAR UMA COLUNA ADICIONAL, MAS ORIGINALMENTE ELA NÃO EXISTE

-- DADO CALCULADO // É INSERIDO UMA COLUNA E ALTERAÇÃO PROVISÓRIA NO PREÇO
SELECT cod, nome, preco +1 FROM produtos;

-- FAZ A MESMA SINTAXE ACIMA, APENAS ALTERANDO O NOME 'AS'
SELECT cod, nome, preco +1 AS PRECO_ACRESCIMO FROM produtos;

-- REALIZA CONSULTA EM ORDEM DE PREÇO
SELECT cod, nome, preco FROM produtos ORDER BY preco;

-- REALIZA CONSULTA EM ORDEM DE PREÇO
SELECT cod, nome, preco FROM produtos ORDER BY preco;

-- REALIZA CONSULTA EM ORDEM DE PREÇO DO MAIOR PARA O MENOR (DESC)
SELECT cod, nome, preco FROM produtos ORDER BY preco DESC;

-- REALIZA CONSULTA EM ORDEM DE PREÇO DESC E NOME EM ORDEM ASC
SELECT cod, nome, preco FROM produtos ORDER BY preco DESC, nome ASC;

-- CRIA TABELA vendas
CREATE TABLE vendas (
	cod_venda INT,
	data_venda DATE,
	cod_produto INT,
	quantidade INT
);

-- INSERE DADOS NA TABELA venda
INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(1, '2022-01-27', 1, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(2, '2022-01-27', 2, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(3, '2022-01-27', 3, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(4, '2022-01-27', 4, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(5, '2022-01-27', 5, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(6, '2022-01-27', 6, 1);

INSERT INTO vendas (cod_venda, data_venda, cod_produto, quantidade) VALUES
(7, '2022-01-27', 7, 1);

-- MOSTRA OS DADOS NA TABELA vendas
SELECT * FROM vendas;

-- QUANTIDADE TOTAL QUE FOI VENDIDA DE DETERMINADO PRODUTO
SELECT SUM(quantidade) FROM vendas WHERE cod_produto = '1';
-- SUM > SOMA

-- QUANTIDADE MÉDIA QUE FOI VENDIDA DE DETERMINADO PRODUTO
SELECT AVG(quantidade) FROM vendas WHERE cod_produto = '1';
-- AVG > MÉDIA

-- QUANTIDADE MÁXIMA DE VENDAS EM UM DETERMINADO PRODUTO
SELECT MAX(quantidade) FROM vendas WHERE cod_produto = '1';

-- QUANTIDADE MÍNIMA DE VENDAS EM UM DETERMINADO PRODUTO
SELECT MIN(quantidade) FROM vendas WHERE cod_produto = '1';

-- QUANTAS VENDAS FORAM REALIZADAS DESSE PRODUTO
SELECT COUNT(*) FROM vendas WHERE cod_produto = '1';

-- EM ALGUNS COMANDOS ACIMA, EXISTEM FUNÇÕES QUE FAZEM A MESMA COISA MAS COM SINTAXE DIFERENTE
-- EXEMPLO: SELECT MAX E SELECT COUNT(*)

-- QUANTAS VENDAS FORAM REALIZADAS // NESSA SINTAXE CONTA APENAS PRODUTOS VÁLIDOS
SELECT COUNT(QUANTIDADE) FROM vendas WHERE cod_produto = '1';

-- AULA 9 - UNIÃO
CREATE TABLE CLIENTES
(
	CODIGO INT,
    NOME VARCHAR(100),
    CODIGO_VENDEDOR INT
);

INSERT INTO CLIENTES (CODIGO, NOME, CODIGO_VENDEDOR) VALUES 
(1, 'Joel Rodrigues', 1), (2, 'Wesley', 1), (3, 'João', 2), 
(4, 'Teresa', NULL), (5, 'Carlos', NULL), (6, 'Estevão', 3), 
(7, 'Camila', 2), (8, 'Diego', NULL), (9, 'Antonio', 3), (10, 'Ramon', 1);

CREATE TABLE VENDEDORES
(
	CODIGO INT,
    NOME VARCHAR(100)
);

INSERT INTO VENDEDORES VALUES
(1, 'ANDRÉ'), (2, 'GILBERTO'), (3, 'DANIELA'), (4, 'MARCÍLIO');

SELECT * FROM CLIENTES;
SELECT * FROM VENDEDORES;

SELECT CODIGO, NOME
FROM VENDEDORES;

-- RELACIONANADO TABELAS
SELECT 
	CLIENTES.CODIGO,
	CLIENTES.NOME,
    CLIENTES.CODIGO_VENDEDOR,
    VENDEDORES.NOME
FROM CLIENTES
INNER JOIN VENDEDORES ON CLIENTES.CODIGO_VENDEDOR = VENDEDORES.CODIGO;

SELECT 
	CLIENTES.CODIGO,
	CLIENTES.NOME,
    CLIENTES.CODIGO_VENDEDOR,
    VENDEDORES.NOME
FROM CLIENTES
LEFT JOIN VENDEDORES ON CLIENTES.CODIGO_VENDEDOR = VENDEDORES.CODIGO;

SELECT CLIENTES.CODIGO,
	CLIENTES.NOME, 
    CLIENTES.CODIGO_VENDEDOR,
    VENDEDORES.NOME
FROM CLIENTES
RIGHT JOIN VENDEDORES ON CLIENTES.CODIGO_VENDEDOR = VENDEDORES.CODIGO;