Use Atividade6;


CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cidade VARCHAR(255)
);


CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    data_pagamento DATE,
    valor_pagamento DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO clientes (id_cliente, nome, endereco, cidade)
VALUES
    (1, 'Iago Batista', 'Avenida Santos Dumont', 'São Paulo'),
    (2, 'Helen Ferreira', 'Travessa Iça ', 'Salvador'),
    (3, 'Livia Fernandez', 'Avenida Jornalista Aderbal Gaertner Stresser', 'Curitiba'),
    (4, 'Luisa Costa', 'Avenida Epitácio Pessoa', 'Rio de Janeiro');


INSERT INTO pagamentos (id_pagamento, id_cliente, data_pagamento, valor_pagamento)
VALUES
    (1, 1, '2023-06-01', 150.00),
    (2, 2, '2023-11-15', 350.00),
    (3, 1, '2023-10-03', 160.00),
    (4, 3, '2023-07-04', 200.00),
    (5, 4, '2023-01-05', 850.00);


CREATE VIEW relatorio_pagamentos_cidade AS
SELECT
    c.cidade AS nome_da_cidade,
    SUM(p.valor_pagamento) AS valor_total_pagamentos
FROM
    clientes c
LEFT JOIN
    pagamentos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.cidade;

SELECT * FROM relatorio_pagamentos_cidade;
