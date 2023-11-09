create database Atividade1;
Use atividade1;

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);


CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);


DELIMITER //
CREATE TRIGGER atualizar_estoque_emprestimo
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN

    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.id_livro;
END;
//
DELIMITER ;

INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque)
VALUES (1, 'Flores Vermelhos', 'Brad Cooper', 5),
(2, 'Troca de corpos Uma História unica','Lanny Henry',10);


INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao)
VALUES (2, 1, '2023-11-09 10:00:00', '2023-11-16 10:00:00'),
(3, 2, '2023-10-09 10:00:00', '2023-12-16 11:00:00');

select * from livros;
select * from emprestimos;

