CREATE DATABASE DireitosConnect;

USE DireitosConnect;

CREATE TABLE pessoas (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    CPF CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(50),
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    id_pessoa INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas (id)
);

CREATE TABLE advogados (
    id_pessoa INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas (id),
    cadastro_oab VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE conversas (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    id_remetente INT NOT NULL,
    id_destinatario INT NOT NULL,
    FOREIGN KEY (id_remetente) REFERENCES pessoas (id),
    FOREIGN KEY (id_destinatario) REFERENCES pessoas (id)
);

CREATE TABLE mensagens (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    id_conversa INT NOT NULL,
    FOREIGN KEY (id_conversa) REFERENCES conversas (id),
    id_emissor INT NOT NULL,
    FOREIGN KEY (id_emissor) REFERENCES pessoas (id),
    tipo_conteudo VARCHAR(20), -- 'imagem' / 'video' / 'texto'
    conteudo VARCHAR(255)
);

CREATE TABLE areas_juridicas (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    nome VARCHAR(50)
);

CREATE TABLE tipo_assinaturas (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    nome VARCHAR(30) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE assinaturas (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    id_tipo_assinatura INT NOT NULL,
    FOREIGN KEY (id_tipo_assinatura) REFERENCES tipo_assinaturas (id),
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas (id)
);

CREATE TABLE casos_juridicos (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    titulo VARCHAR(50),
    descricao VARCHAR(255),
    id_cliente INT NOT NULL,
    id_advogado INT NOT NULL,
    id_area_juridica INT NOT NULL,
    FOREIGN KEY (id_area_juridica) REFERENCES areas_juridicas (id),
    FOREIGN KEY (id_cliente) REFERENCES pessoas (id),
    FOREIGN KEY (id_advogado) REFERENCES pessoas (id)
);

CREATE TABLE pagamentos (
    id INT NOT NULL PRIMARY KEY IDENTITY,
    forma_pagamento VARCHAR(30),
    data_pagamento DATE,
    id_assinatura INT NOT NULL,
    FOREIGN KEY (id_assinatura) REFERENCES assinaturas (id)
);
