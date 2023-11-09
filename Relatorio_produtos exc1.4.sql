Create Database Atividade6;
Use Atividade6;


CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
    (1, 'Eletro', 'Produtos eletrônicos variados'),
    (2, 'Roupas', 'Camisas e bermudas'),
    (3, 'Tecnologia', 'Todo tipo de tecnologia'),
    (4, 'Móveis', 'Todos os tipos de móveis');


INSERT INTO produtos (id_produto, nome, preco_unitario, id_categoria)
VALUES
    (1, 'Air Fryer', 100.00, 1),
    (2, 'Maquina de cortar cabelo', 50.00, 1),
    (3, 'Camisetas', 20.00, 2),
    (4, 'Espelho', 300.00, 3),
    (5, 'Leite em pó', 10.00, 4),
    (6, 'Laranjas', 25.00, 4),
    (7, 'Cuecas', 30.00, 2);


CREATE VIEW relatorio_produtos_categoria AS
SELECT
    c.nome_categoria AS nome_da_categoria,
    COUNT(p.id_produto) AS quantidade_de_produtos
FROM
    categorias c
LEFT JOIN
    produtos p ON c.id_categoria = p.id_categoria
GROUP BY
    c.id_categoria;

SELECT * FROM relatorio_produtos_categoria;
