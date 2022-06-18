CREATE DATABASE blog;

USE blog;

CREATE TABLE usuario (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(100) UNIQUE NOT NULL,
	senha VARCHAR(12) NOT NULL,
	p_nome VARCHAR(30) NOT NULL,
	s_nome VARCHAR(50) NOT NULL,
	sexo CHAR NOT NULL
);

CREATE TABLE postagem (
	id_postagem INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(120) NOT NULL,
	conteudo TEXT NOT NULL,
	autor INT,
	FOREIGN KEY autor REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
	corpo TEXT NOT NULL,
	autor INT,
	FOREIGN KEY postagem REFERENCES postagem(id_postagem)
); 