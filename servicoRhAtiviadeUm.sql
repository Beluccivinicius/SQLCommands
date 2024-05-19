-- Criando o Banco de dados db_Rh
CREATE DATABASE db_Rh;

-- Utilizando o banco de dados 
USE db_Rh;

-- Criando a tabela de funcionarios dessa empresa
CREATE TABLE tb_pessoa(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255), 
idade BIGINT, 
areatrabalho VARCHAR(255),
formacao VARCHAR(255),
sexo VARCHAR(1),
salario DECIMAL(20,2),
PRIMARY KEY(id));

-- Inserindo pessoas acima de 2000,00
INSERT INTO tb_pessoa(nome, idade, areatrabalho, formacao, sexo, salario) 
VALUES ("Vinicius", 20, "desenvolvedor", "direito", "M", 5555.00),
("João", 18, "administrador", "administração", "M", 3000.00),
("Maria", 40, "Gerente", "Engenharia", "F", 15000.00),
("Moana", 50, "Engenharia", "Qualidade", "F", 6000.00),
("Carlos", 45, "desenvolvedor", "Análise e Desenvolvimento de Sistemas", "M", 8000.00);

-- inserindo pessoas abaixo de 2000,00
INSERT INTO tb_pessoa(nome, idade, areatrabalho, sexo, salario) 
VALUES ("manoel", 45, "portaria", "M", 1500.00),
("Joana", 28, "portaria", "F", 1900.00);

-- Selecionando os salarios menores que 2000 reais
SELECT * FROM tb_pessoa WHERE salario < 2000;

-- Selecionando toda a tabela
SELECT * FROM tb_pessoa;

-- Selecionando os salarios maiores que 2000 reais
SELECT * FROM tb_pessoa WHERE salario > 2000;

-- Comando para autorizar dar UPDATE uma linha com WHERE sem ser o Id
SET SQL_SAFE_UPDATES = 0;

-- UPDATE na area de trabalho: desenvolvedor
UPDATE tb_pessoa SET salario = 4000.99 WHERE areatrabalho = "desenvolvedor";

-- Criando Outra tabela para se relacionar com a tb_pessoas
CREATE TABLE tb_departamento(
id BIGINT AUTO_INCREMENT,
id_departamento BIGINT,
PRIMARY KEY(id)
);



ALTER TABLE tb_funcao MODIFY COLUMN cargo BIGINT NOT NULL;

-- Populando a tabela tb_area
INSERT INTO tb_area (nomearea, quantidadepessoa) VALUES ("Administrativo",  100),
("Segurança", 50), ("Desenvolvimento de software", 30), ("Qualidade", 20);

-- Visualizando dados tb_area
SELECT * FROM tb_area; 

ALTER TABLE tb_funcionario ADD CONSTRAINT fk_funcionarios_funcao FOREIGN KEY (id) REFERENCES tb_funcao(id); 
