-- Criamos um banco de dados
CREATE DATABASE db_quitanda;

--  Selecionamos o banco de dados
USE db_quitanda;

-- Criar tabela no banco de dados
CREATE TABLE tb_produto(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
quantidade INT,
dataValidade DATE,
preco DECIMAL NOT NULL,
PRIMARY KEY(id)
);

-- inserir dados na tabela 	tb_produto
INSERT INTO tb_produto(
	nome,
    quantidade, 
    dataValidade, 
    preco
)
VALUES ("banana", 34, "2024-31-12", 8.00);

-- inserir varios dados na tabela tb_produto
INSERT INTO tb_produto(nome, quantidade, dataValidade, preco) 
VALUES ("Tomate", 100, "2023-12-15", 8.00),
("Maçã", 20, "2023-12-15", 5.00),
("Laranja", 50, "2023-12-15", 10.00),
("Banana", 200, "2023-12-15", 12.00),
("Uva", 1200, "2023-12-15", 30.00),
("Pêra", 500, "2023-12-15", 2.99);

-- Exibir dados de uma tabela
SELECT * FROM tb_produto;

-- Retornar valores do banco de dados se usa sempre SELECT
-- Retonarndo uma coluna apenas
-- AS muda o nome da coluna para a visualização do usuário
SELECT nome, preco AS abacaxi FROM tb_produto;

-- Selecionando apenas uma tupla, parecido com o if, todos aqueles que for == a uma informação passada
SELECT nome, preco AS abacaxi FROM tb_produto WHERE id = 1;

-- Operadores Relacionais >, >=, <, <=, ==, <>
SELECT nome, preco FROM tb_produto WHERE quantidade > 100;

-- Operadores Portas lógicas, AND, OR NOT
SELECT * FROM tb_produto WHERE preco > 5.00 AND quantidade < 100;

-- Aleteração na estrutura da tabela
-- Decimal = 6 digitos no total, 2 depois da vírgula
ALTER TABLE tb_produto MODIFY preco DECIMAL(6,2);

ALTER TABLE tb_produto ADD descricao VARCHAR(255);

-- Alterar o um registro no banco de dados
UPDATE tb_produto SET preco = 3.99;

-- Desativar a trava de segurança 
SET SQL_SAFE_UPDATES = 0;

-- Apagar a tabela do banco de dados
DROP TABLE tb_produto;

-- apagar o banco de dados
DROP DATABASE db_quitanda;
 