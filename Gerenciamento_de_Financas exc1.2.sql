Use Atividade4;


CREATE TABLE contas (
    id_conta INT PRIMARY KEY,
    nome VARCHAR(255),
    saldo DECIMAL(10, 2)
);


CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY,
    id_conta INT,
    tipo VARCHAR(255),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);


DELIMITER //
CREATE TRIGGER atividade4.atualizar_saldo_conta
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    DECLARE valor_transacao DECIMAL(10, 2);


    SET valor_transacao = NEW.valor;


    IF NEW.tipo = 'entrada' THEN
        UPDATE contas
        SET saldo = saldo + valor_transacao
        WHERE id_conta = NEW.id_conta;
    ELSEIF NEW.tipo = 'saída' THEN
        UPDATE contas
        SET saldo = saldo - valor_transacao
        WHERE id_conta = NEW.id_conta;
    END IF;
END;
//
DELIMITER ;



INSERT INTO transacoes (id_transacao, id_conta, tipo, valor)
VALUES (1, 1, 'entrada', 100.00);


INSERT INTO transacoes (id_transacao, id_conta, tipo, valor)
VALUES (1, 1, 'saída', 50.00);



INSERT INTO contas (id_conta, nome, saldo)
VALUES (1, 'Iago Batista', 3000000.00);


INSERT INTO contas (id_conta, nome, saldo)
VALUES (2, 'Conta de Poupança', 150000.00);

select * from contas;