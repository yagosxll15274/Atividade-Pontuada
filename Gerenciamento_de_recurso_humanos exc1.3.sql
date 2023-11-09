Use Atividade4;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);

DELIMITER //


CREATE TRIGGER verificar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN

    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A data de admissão deve ser maior que a data atual';
    END IF;
END;
//

DELIMITER ;


INSERT INTO funcionarios (id_funcionario, nome, data_admissao)
VALUES (1, 'Helena Machado', '2025-01-01');


INSERT INTO funcionarios (id_funcionario, nome, data_admissao)
VALUES (2, 'Livia Andrade', '2026-01-01');

select * from funcionarios;