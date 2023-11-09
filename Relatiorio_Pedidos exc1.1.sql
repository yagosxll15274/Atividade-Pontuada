Create Database Atividade5;
Use Atividade5;


CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20)
);


CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO clientes (id_cliente, nome, email, telefone)
VALUES
    (1, 'Iago Batista', 'iagobxs@gmail.com', '(71) 98659-2265'),
    (2, 'Helena Santos', 'helenasxt@gmail.com', '(71) 95689-6658'),
    (3, 'Ingrid Oliveira', 'ingridbt@gmail.com', '(71) 95648-6215'),
    (4, 'Alana Martina', 'alanxtv@gmail.com', '(71) 98784-8558');


INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total)
VALUES
    (1, 1, '2023-09-08', 250.00),
    (2, 1, '2023-07-01', 120.00),
    (3, 2, '2023-01-22', 85.00),
    (4, 3, '2023-05-30', 350.00);


CREATE VIEW relatorio_pedidos_cliente AS
SELECT
    c.nome AS nome_do_cliente,
    COUNT(p.id_pedido) AS numero_de_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
LEFT JOIN
    pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;

SELECT * FROM relatorio_pedidos_cliente;
