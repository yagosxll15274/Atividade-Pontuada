Use Atividade4;

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);


CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);


CREATE TABLE requisitos_serie (
    serie INT PRIMARY KEY,
    idade_minima INT
);


INSERT INTO requisitos_serie (serie, idade_minima)
VALUES (1, 6), (2, 7), (3, 8), (4, 9);

DELIMITER //

CREATE TRIGGER verificar_idade_matricula
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    DECLARE idade_minima_serie INT;


    SELECT TIMESTAMPDIFF(YEAR, a.data_nascimento, CURDATE()) INTO idade_aluno
    FROM alunos a
    WHERE a.id_aluno = NEW.id_aluno;


    IF idade_aluno < idade_minima_serie THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O aluno não atende aos requisitos de idade para a série.';
    END IF;
END;
//


DELIMITER ;


INSERT INTO alunos (id_aluno, nome, data_nascimento, serie)
VALUES (1, 'Joaquim Barreto', '2016-01-01', 1);


INSERT INTO matriculas (id_matricula, id_aluno, data_matricula, status)
VALUES (1, 1, '2023-01-01', 'Ativa');


INSERT INTO matriculas (id_matricula, id_aluno, data_matricula, status)
VALUES (2, 1, '2023-01-01', 'Ativa');

SELECT * FROM alunos;
SELECT * FROM Matriculas;
SELECT * FROM requisitos_serie;