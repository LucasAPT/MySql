CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVRO  (
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);

INSERT INTO LIVRO VALUES ('A BRANCA DE NEVE','DISNEY','F', 280,'ROCCO', 150, 'DF', 2000);

SELECT * FROM LIVRO;

DROP DATABASE LIVRARIA;