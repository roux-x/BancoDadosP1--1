
-- criar tabelas rayane
CREATE TABLE Categoria (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
);

CREATE TABLE Produto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    quantidade_estoque INT,
    data_fabricacao DATE,
    valor_unitario DECIMAL(10, 2),
    categoria_codigo INT,
    FOREIGN KEY (categoria_codigo) REFERENCES Categoria(codigo)
);

CREATE TABLE Cliente (
    codigo INT PRIMARY KEY,
    nome_completo VARCHAR(255),
    nome_usuario VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(11),
    data_nascimento DATE,
    endereco TEXT
);

CREATE TABLE Funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(11)
);

CREATE TABLE Pedido (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    cliente_codigo INT,
    FOREIGN KEY (cliente_codigo) REFERENCES Cliente(codigo)
);

CREATE TABLE Pedido_Produto (
    pedido_codigo INT,
    produto_codigo INT,
    quantidade INT,
    PRIMARY KEY (pedido_codigo, produto_codigo),
    FOREIGN KEY (pedido_codigo) REFERENCES Pedido(codigo),
    FOREIGN KEY (produto_codigo) REFERENCES Produto(codigo)
);

-- inserir 5 produtos João
INSERT INTO produto  (codigo, nome, descricao , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (1, 'Camisa Social Masculina Slim', 'Camisa Social Masculina, Slim, Fio 80, Lisa da Camisaria Colombo[^1^][1]', 100, '2023-08-01', 79.99);

INSERT INTO produto  (codigo, nome, descricao , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (2, 'Vestido Feminino', 'Vestido Feminino da Dafiti[^1^][1]', 100, '2023-08-01', 99.99);

INSERT INTO produto  (codigo, nome, descricao , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (3, 'Vestuário Infantil', 'Vestuário Infantil da Loja Kyly[^1^][1]', 100, '2023-08-01', 64.90);

INSERT INTO produto  (codigo, nome, descricao , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (4, 'Macacão Recém-Nascido', 'Macacão de recém nascido confeccionado todo em tecido Soft sendo muito macio e fofinho, com alta durabilidade e resistência da Ano Zero[^1^][1]', 100, '2023-08-01', 29.99);

INSERT INTO produto  (codigo, nome, descricao , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (5, 'Biquíni Ripple', 'Biquíni Ripple, também conhecido como "empina bumbum", é o favorito para quem se considera mais "tradicional" no quesito marquinha e também quer evidenciar a silhueta[^1^][3]', 100, '2023-08-01', 89.99);

select * from produto

-- inserir 5 funcionarios ( taissa)
INSERT INTO funcionario (nome, cpf) VALUES 
("João","829.617.175-90"),
("Gabriela", "248.284.013-93"),
("Pedro", "701.476.232-00"),
("Maria", "661.418.542-06"),
("Larissa", "728.068.519-63");

ALTER TABLE Pedido
ADD COLUMN funcionario_codigo INT;

CREATE TABLE Pedido_novo (
    codigo INT PRIMARY KEY,
    data_pedido DATE,
    cliente_codigo INT,
    funcionario_codigo INT,
    FOREIGN KEY (cliente_codigo) REFERENCES Cliente(codigo),
    FOREIGN KEY (funcionario_codigo) REFERENCES Funcionario(codigo)
);

INSERT INTO Pedido_novo (codigo, data_pedido, cliente_codigo)
SELECT codigo, data_pedido, cliente_codigo FROM Pedido;

DROP TABLE Pedido;

ALTER TABLE Pedido_novo RENAME TO Pedido;


-- inserir 5 categorias  paula
INSERT INTO Categoria (codigo, nome) VALUES
(1, 'masculino'),
(2, 'feminino'),
(3, 'recem nascido'),
(4, 'infantil'),
(5, 'praia');

select * from categoria

-- inserir 5 pedidos rafael 

INSERT INTO Pedido (codigo, data_pedido, cliente_codigo) VALUES
(1, '2023-08-23', 1),
(2, '2023-08-22', 2),
(3, '2023-08-25', 3),
(4, '2023-08-26', 4),
(5, '2023-08-26', 5);

select * from Pedido 

-- inserir 5 produtos em cada pedido sendo que cliente pode ter mais de um produto e o mesmo 
produto em mais de 1 unidade no mesmo pedido para o mesmo cliente 


INSERT INTO Pedido_Produto (pedido_codigo, produto_codigo, quantidade) VALUES
(1, 1, 10),
(2, 2, 12),
(3, 3, 6), 
(4, 4, 5),
(5, 5, 1),
(2, 4, 16), 
(3, 5, 1),
(4, 1, 1),
(4, 2, 3),
(1, 3, 1),
(1, 5, 1);

select * from Pedido_Produto

-- inserir 5 cliente (alex)

INSERT INTO Cliente(
nome_completo,
cpf,
nome_usuario,
email,
data_nascimento, 
endereco)
VALUES('Alex de Laurinha',17746328709,'alexmatadordepombo','alexdrxx@gmail.com','1999-02-09','rua herminio goulart, 777');

INSERT INTO Cliente(
nome_completo,
cpf,
nome_usuario,
email,
data_nascimento, 
endereco)
VALUES('Rayanne Briane',01335868729,'ray_barbie','rayannes2@gmail.com','1993-12-02','rua constantino, 44');

INSERT INTO Cliente(
nome_completo,
cpf,
nome_usuario,
email,
data_nascimento, 
endereco)
VALUES('Taissa Minna',13834033729,'issataissa','taissanx0@gmail.com','1997-06-24','rua jurubeba, 1433');

INSERT INTO Cliente(
nome_completo,
cpf,
nome_usuario,
email,
data_nascimento, 
endereco)
VALUES('Rafael Papel',72797168739,'rafaelzão','rafael_o_moreno@gmail.com','1991-08-17','rua do tunel, 33');

INSERT INTO Cliente(
nome_completo,
cpf,
nome_usuario,
email,
data_nascimento, 
endereco)
VALUES('Paula Beatriz',09362063719,'paulinhabx','beatrizwinx@gmail.com','1998-02-02','rua da feira, 13');

select * from Cliente 

-- alterar um registro pelo comando uptade 

select * from Produto p 

UPDATE Produto
SET quantidade_estoque = 90
WHERE codigo = 3;

select * from Produto p 

-- excluir um registro 

DELETE FROM Funcionario
WHERE codigo = 4;

-- SQLs de consulta
a. Pelo menos 2 com algum tipo de junção

SELECT Pedido.codigo AS pedido_codigo, Cliente.nome_completo, Cliente.email
FROM Pedido
JOIN Cliente ON Pedido.cliente_codigo = Cliente.codigo
WHERE Cliente.codigo = 1; 


SELECT Pedido.codigo AS pedido_codigo, Produto.nome AS produto_nome, Produto.descricao AS produto_descricao, Categoria.nome AS categoria_nome
FROM Pedido_Produto
JOIN Pedido ON Pedido_Produto.pedido_codigo = Pedido.codigo
JOIN Produto ON Pedido_Produto.produto_codigo = Produto.codigo
JOIN Categoria ON Produto.categoria_codigo = Categoria.codigo
WHERE Pedido.codigo = 1; 


b. Pelo menos 1 com usando count() e group by()

SELECT Categoria.nome, COUNT(Produto.codigo) AS quantidade_produtos
FROM Produto
JOIN Categoria ON Produto.categoria_codigo = Categoria.codigo
GROUP BY Categoria.nome;

c. Uma consulta livre

SELECT Categoria.nome, SUM(Produto.quantidade_estoque) AS total_estoque
FROM Produto
JOIN Categoria ON Produto.categoria_codigo = Categoria.codigo
GROUP BY Categoria.nome;

d. 1 SQL para construção de nota fiscal

SELECT Pedido.codigo AS codigo_pedido, 
       Cliente.nome_completo AS nome_cliente, 
       Cliente.cpf AS cpf_cliente, 
       Funcionario.nome AS nome_funcionario, 
       Produto.nome AS nome_produto, 
       Pedido_Produto.quantidade AS quantidade_produto, 
       Produto.valor_unitario AS valor_unitario_produto,
       Pedido_Produto.quantidade * Produto.valor_unitario AS valor_total_produto
FROM Pedido
JOIN Cliente ON Pedido.cliente_codigo = Cliente.codigo
JOIN Funcionario ON Pedido.funcionario_codigo = Funcionario.codigo
JOIN Pedido_Produto ON Pedido.codigo = Pedido_Produto.pedido_codigo
JOIN Produto ON Pedido_Produto.produto_codigo = Produto.codigo
WHERE Pedido.codigo = 1; -- substitua 1 pelo código do pedido desejado


-- Esta consulta retorna o código do pedido, o nome e CPF do cliente,
 o nome do funcionário, o nome e valor unitário de cada produto no pedido, 
 a quantidade de cada produto no pedido e o valor total de cada produto 
 no pedido (quantidade vezes valor unitário) para o pedido com o código 1.

