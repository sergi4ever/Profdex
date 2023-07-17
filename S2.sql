SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS estudantes;

CREATE TABLE IF NOT EXISTS estudantes(
	matricula_aluno int primary key,
	email varchar(255) NOT NULL,
	password varchar(32) NOT NULL,
	curso varchar(5) NOT NULL,
	nome_aluno varchar(45) NOT NULL
);
       
DROP TABLE IF EXISTS departamentos;

CREATE TABLE IF NOT EXISTS departamentos(
	sigla varchar(5) NOT NULL,
	nome_departamentos varchar(30) NOT NULL,
    primary key (sigla)
);

 DROP TABLE IF EXISTS professor;

CREATE TABLE IF NOT EXISTS professor(
	matricula_professor int primary key,
	nome_professor varchar(30) NOT NULL,
	departamento_sigla VARCHAR(5),
	FOREIGN KEY (departamento_sigla) REFERENCES departamentos (sigla)
);

DROP TABLE IF EXISTS disciplinas;

CREATE TABLE IF NOT EXISTS disciplinas(
    id serial primary key,
    nome_disciplinas varchar(50) NOT NULL,
    departamento_sigla varchar(5),
    FOREIGN KEY (departamento_sigla) REFERENCES departamentos (sigla) 
);
    
DROP TABLE IF EXISTS turmas;    

CREATE TABLE IF NOT EXISTS turmas (
    id SERIAL PRIMARY KEY,
    matricula_aluno INT,
    disciplina_id INT,
    matricula_professor INT,
    FOREIGN KEY (matricula_aluno)
        REFERENCES aluno (matricula_aluno),
    FOREIGN KEY (disciplina_id)
        REFERENCES disciplina (id),
    FOREIGN KEY (matricula_professor)
        REFERENCES professor (matricula_professor)
);

drop table if exists avaliacao;

create table avaliacao(
	matricula_professor int primary key,
	avaliacao_professor VARCHAR(255),
    foreign key (matricula_professor) references professor (matricula_professor)
);

drop table if exists denuncia;

create table denuncia(
	matricula_professor int primary key,
	denuncia_professor VARCHAR(255),
    foreign key (matricula_professor) references professor (matricula_professor)
);

INSERT INTO estudantes(matricula_aluno, email, password, curso, nome_aluno) VALUES ('1060', '123@h.com', 452, 'Comp', 'Jonas');
INSERT INTO estudantes(matricula_aluno, email, password, curso, nome_aluno) VALUES ('3020', '351@h.com', 453, 'Est', 'Erika');
INSERT INTO estudantes(matricula_aluno, email, password, curso, nome_aluno) VALUES ('4256', '789@h.com', 454, 'Cic', 'Portugal');


INSERT INTO departamentos(sigla, nome_departamentos) VALUES ('Cic', 'Ciências da Computação');
INSERT INTO departamentos(sigla, nome_departamentos) VALUES ('Comp', 'Computação licenciatura');
INSERT INTO departamentos(sigla, nome_departamentos) VALUES ('Iq', 'Instituo de Química');


INSERT INTO disciplinas(id, nome_disciplinas, departamento_sigla) VALUES (2, 'Computadores', 'Cic');
INSERT INTO disciplinas(id, nome_disciplinas, departamento_sigla) VALUES (3, 'Moléculas Simétricas', 'Quim');
INSERT INTO disciplinas(id, nome_disciplinas, departamento_sigla) VALUES (1, 'Corpo Humano', 'Bio');


INSERT INTO professor(matricula_professor, nome_professor, departamento_sigla) VALUES ('231', 'Pedro Garcia', 'Cic');
INSERT INTO professor(matricula_professor, nome_professor, departamento_sigla) VALUES ('321', 'Mll', 'IQ');
INSERT INTO professor(matricula_professor, nome_professor, departamento_sigla) VALUES ('890', 'Milha', 'Comb');


INSERT INTO turmas(id, matricula_aluno, disciplina_id, matricula_professor) VALUES (1, '24', 1, '25');
INSERT INTO turmas(id, matricula_aluno, disciplina_id, matricula_professor) VALUES (2, '24', 5, '23');
INSERT INTO turmas(id, matricula_aluno, disciplina_id, matricula_professor) VALUES (3, '24', 4, '22');

INSERT INTO avalicao(matricula_professor, avaliacao_professor) VALUES ('123', 'Bom em explicar');
INSERT INTO avalicao(matricula_professor, avaliacao_professor) VALUES ('321', 'Provas cabiveis');
INSERT INTO avalicao(matricula_professor, avaliacao_professor) VALUES ('231', 'Preocupado com a turma');

INSERT INTO denuncia(matricula_professor, denuncia_professor) VALUES ('123', 'Fala cuspindo');
INSERT INTO denuncia(matricula_professor, denuncia_professor) VALUES ('231', 'Muito Rígido');
INSERT INTO denuncia(matricula_professor, denuncia_professor) VALUES ('312', 'Explica mal');