Use Atividade5;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(255)
);


CREATE TABLE estoque (
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


INSERT INTO produtos (id_produto, nome, preco_unitario, categoria)
VALUES
    (1, 'Camisa', 18.00, 'Roupa'),
    (2, 'Pilhas', 20.00, 'Eletrônicos'),
    (3, 'Leite', 15.00, 'Alimento'),
    (4, 'Coca-cola', 30.00, 'Alimento');


INSERT INTO estoque (id_produto, quantidade)
VALUES
    (1, 5),
    (2, 8),
    (3, 2),
    (4, 3);


CREATE VIEW estoque_critico AS
SELECT
    p.nome AS nome_do_produto,
    e.quantidade AS quantidade_em_estoque
FROM
    produtos p
JOIN
    estoque e ON p.id_produto = e.id_produto
WHERE
    e.quantidade < 5;
    
SELECT * FROM estoque_critico;
