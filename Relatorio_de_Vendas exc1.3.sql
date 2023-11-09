Use Atividade5;


CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2)
);


CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);


INSERT INTO funcionarios (id_funcionario, nome, cargo, salario)
VALUES
    (1, 'Aline Santos', 'Vendedor', 3500.00),
    (2, 'Monique Lima', 'Vendedor', 7800.00),
    (3, 'Linaldo Ferreira', 'Gerente', 2500.00),
    (4, 'Ligia Mendes', 'Vendedor', 1700.00);


INSERT INTO vendas (id_venda, id_funcionario, data_venda, valor_venda)
VALUES
    (1, 1, '2023-02-01', 2000.00),
    (2, 2, '2023-05-09', 200.00),
    (3, 1, '2023-06-11', 1800.00),
    (4, 3, '2023-08-15', 2500.00),
    (5, 4, '2023-11-30', 2100.00);


CREATE VIEW relatorio_vendas_funcionario AS
SELECT
    f.nome AS nome_do_funcionario,
    COUNT(v.id_venda) AS numero_de_vendas,
    SUM(v.valor_venda) AS valor_total_vendas
FROM
    funcionarios f
LEFT JOIN
    vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY
    f.id_funcionario;

SELECT * FROM relatorio_vendas_funcionario;
