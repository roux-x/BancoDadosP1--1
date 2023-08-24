
--  joao

INSERT INTO produto  (id, nome, descricao_prod , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (1, 'Camisa Social Masculina Slim', 'Camisa Social Masculina, Slim, Fio 80, Lisa da Camisaria Colombo[^1^][1]', 100, '2023-08-01', 79.99);

INSERT INTO produto  (id, nome, descricao_prod , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (2, 'Vestido Feminino', 'Vestido Feminino da Dafiti[^1^][1]', 100, '2023-08-01', 99.99);

INSERT INTO produto  (id, nome, descricao_prod , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (3, 'Vestuário Infantil', 'Vestuário Infantil da Loja Kyly[^1^][1]', 100, '2023-08-01', 64.90);

INSERT INTO produto  (id, nome, descricao_prod , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (4, 'Macacão Recém-Nascido', 'Macacão de recém nascido confeccionado todo em tecido Soft sendo muito macio e fofinho, com alta durabilidade e resistência da Ano Zero[^1^][1]', 100, '2023-08-01', 29.99);

INSERT INTO produto  (id, nome, descricao_prod , quantidade_estoque, data_fabricacao, valor_unitario)
VALUES (5, 'Biquíni Ripple', 'Biquíni Ripple, também conhecido como "empina bumbum", é o favorito para quem se considera mais "tradicional" no quesito marquinha e também quer evidenciar a silhueta[^1^][3]', 100, '2023-08-01', 89.99);

SELECT * FROM produto 

-- rafael

-- Tabela de itensPedido
CREATE TABLE itensPedido (
    PedidoCodigo INT,
    ProdutoCodigo INT,
    Quantidade INT,
    PRIMARY KEY (PedidoCodigo, ProdutoCodigo),
    FOREIGN KEY (PedidoCodigo) REFERENCES pedido(id),
    FOREIGN KEY (ProdutoCodigo) REFERENCES produto(id)
); 

-- criar tabela pedido

CREATE TABLE pedido (
    id INTEGER PRIMARY KEY autoincrement ,
    data_pedido DATE,
    cliente_codigo INT,
    FOREIGN KEY (cliente_codigo) REFERENCES cliente(id)
);




-- inclusao pedido
INSERT INTO pedido (data_pedido , cliente_codigo) VALUES ('2023-08-24', 1),
('2023-08-24', 2),('2023-08-24', 3),('2023-08-24', 4),('2023-08-25', 5);


select * from pedido p 


-- Adicionar 5 produtos ao pedido
INSERT INTO itenspedido (Pedido_Codigo, produto_codigo, quantidade) VALUES ('1', '1', 5),('1', '2', 3),('2', '3', 1),
('3', '4', 1),('4', '5', 2),('5', '3', 1),('1', '2', 4),('2', '4', 1),('3', '3', 5),('4', '2', 1),('5', '2', 1),('3', '2', 1); 

SELECT * FROM itenspedido 


