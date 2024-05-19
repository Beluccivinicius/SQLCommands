-- CRIANDO O SCHEMA
CREATE DATABASE db_generation_game_online;

-- UTILIZANDO O BANCO DE DADOS
USE db_generation_game_online;

-- CRIANDO AS TABELAS NECESSARIAS
CREATE TABLE tb_classes (
	id INT AUTO_INCREMENT NOT NULL,
    tipo_personagem VARCHAR(100),
    preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tb_personagem (
	id INT AUTO_INCREMENT NOT NULL, 
    nome VARCHAR(255) NOT NULL,
    forca TINYINT NOT NULL,
    defesa TINYINT NOT NULL,
    velocidade TINYINT NOT NULL,
    foto VARCHAR(255),
    PRIMARY KEY(id)
);

-- ADICIONANDO O CAMPO QUE IRA SER INSERIDO A CHAVE ESTRANGEIRA
ALTER TABLE tb_personagem ADD tipo_personagem INT;

-- COLOCANDO A COLUNA TIPO_PERSONAGEM COMO NN
ALTER TABLE tb_personagem MODIFY COLUMN classeid INT;

-- VENDO A ESTRUTURA DA TABELA PERSONAGEM/CLASSES
DESCRIBE tb_personagem;

DESCRIBE tb_classes;

-- CRIANDO A CHAVE ESTRANGEIRA DA TABELA CLASSES NA TABELA PERSONAGEM
ALTER TABLE tb_personagem ADD CONSTRAINT fk_personagem_classes 
FOREIGN KEY (classeid) REFERENCES tb_classes(id);

DROP TABLE tb_personagem;

DESCRIBE tb_personagem;

-- POPULANDO AS TABELAS;
INSERT INTO tb_classes (tipo_personagem, preco)	VALUES ("mago", 20.00),("Guerreiro", 30.76), 
("Arqueira", 60.00), ("Ork", 100.01), ("Elfo", 40.89);


-- INSERINDO DADOS NA TB_PERSONAGEM
INSERT INTO tb_personagem (nome, forca, defesa, velocidade, foto, classeid) VALUES ("less", 50,10,80, "foto1.png", 1),
("tob", 100,89,40, "foto2.png", 2), ("monster",2,89,40, "foto3.png", 4), ("jabu", 50,10,80, "foto1.png", 1), ("drop",50,10,80, "foto5.png", 2), 
("Ted", 30,10,80, "foto6.png", 5), ("Lasso", 14,79,50, "foto4.png", 3), ("Jule",46,29,30, "foto5.png", 5);

SELECT * FROM tb_personagem;

SELECT * FROM tb_classes;

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT * FROM tb_personagem WHERE forca > 20;

-- update na tabela para inserir um personagem a mais.

UPDATE tb_personagem SET defesa = 17 WHERE id = 3;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

SELECT * FROM tb_personagem WHERE defesa > 10 AND defesa < 20;

-- adcionando um personagem com a letra c

INSERT INTO tb_personagem (nome, forca, defesa, velocidade, foto, classeid) VALUES ("Cleiton", 67, 20, 40, "foto8.png", 3); 

--  Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

SELECT * FROM tb_personagem WHERE nome LIKE "%c%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT * FROM tb_personagem INNER JOIN tb_classes ON tb_personagem.classeid = tb_classes.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
-- onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).

SELECT tb_personagem.nome, tb_personagem.foto, tb_classes.preco FROM tb_personagem INNER JOIN tb_classes 
ON tb_personagem.classeid = tb_classes.id WHERE tb_classes.tipo_personagem = "mago"


