CREATE DATABASE DireitosConnect;

USE DireitosConnect;

CREATE TABLE pessoa (
    id INT PRIMARY KEY IDENTITY,
    CPF CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL 
);

CREATE TABLE cliente (
    id_pessoa INT PRIMARY KEY,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE advogado (
    id_pessoa INT PRIMARY KEY,
    cadastro_oab VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE conversa (
    id INT PRIMARY KEY IDENTITY,
    id_remetente INT NOT NULL,
    id_destinatario INT NOT NULL,
    FOREIGN KEY (id_remetente) REFERENCES pessoa (id),
    FOREIGN KEY (id_destinatario) REFERENCES pessoa (id)
);


CREATE TABLE mensagem (
    id INT PRIMARY KEY IDENTITY,
    id_conversa INT NOT NULL,
    id_emissor INT NOT NULL,
    id_tipo_conteudo INT NOT NULL,
    conteudo VARCHAR(255),
    FOREIGN KEY (id_conversa) REFERENCES conversa (id),
);

CREATE TABLE tipo_conteudo (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(20) NOT NULL,
	id_mensagem int not null,
	foreign key(id_mensagem) references mensagem (id)
);

CREATE TABLE caso_juridico (
    id INT PRIMARY KEY IDENTITY,
    titulo VARCHAR(100),
    descricao VARCHAR(255),
    id_cliente INT NOT NULL,
    id_advogado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_pessoa),
    FOREIGN KEY (id_advogado) REFERENCES advogado (id_pessoa),
);

CREATE TABLE area_juridica (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
	id_area_juridica int not null,
 FOREIGN KEY (id_area_juridica) REFERENCES caso_juridico (id)
);

CREATE TABLE assinatura (
    id INT PRIMARY KEY IDENTITY,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE tipo_assinatura (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(30) NOT NULL,
	id_tipo_assinatura INT NOT NULL,
    valor FLOAT NOT NULL,
	FOREIGN KEY (id_tipo_assinatura) REFERENCES assinatura (id),
);

CREATE TABLE pagamento (
    id INT PRIMARY KEY IDENTITY,
    forma_pagamento VARCHAR(50),
    data_pagamento DATE,
    id_assinatura INT NOT NULL,
    FOREIGN KEY (id_assinatura) REFERENCES tipo_assinatura (id)
);
