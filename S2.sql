DROP TABLE IF EXISTS estudantes;

CREATE TABLE IF NOT EXISTS estudantes(
	matricula_aluno int primary key,
	email varchar(255) NOT NULL,
	password varchar(32) NOT NULL,
	curso varchar(5) NOT NULL,
	nome_aluno varchar(45) NOT NULL
);
    
 DROP TABLE IF EXISTS professor;

CREATE TABLE IF NOT EXISTS professor(
	matricula_professor int primary key,
	nome_professor varchar(30) NOT NULL,
	departamento_sigla VARCHAR(5),
	FOREIGN KEY (departamento_sigla) REFERENCES departamentos (sigla)
);
   
DROP TABLE IF EXISTS departamentos;

CREATE TABLE IF NOT EXISTS departamentos(
	sigla varchar(5) NOT NULL,
	nome_departamentos varchar(30) NOT NULL,
    primary key (sigla)
);

DROP TABLE IF EXISTS disciplinas;

CREATE TABLE IF NOT EXISTS disciplinas(
    id serial primary key,
    nome_disciplinas varchar(50) NOT NULL,
    departamento_sigla varchar(5),
    FOREIGN KEY (departamento_sigla) REFERENCES departamentos (sigla) 
);
    
DROP TABLE IF EXISTS turmas;    

CREATE TABLE IF NOT EXISTS turmas(
	id SERIAL PRIMARY KEY,
    aluno_matricula int,
    disciplina_id int,
    professor_matricula int,
    FOREIGN KEY (aluno_matricula) REFERENCES aluno (matricula_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina (id),
    FOREIGN KEY (professor_matricula) REFERENCES professor (matricula_professor)
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


INSERT INTO turmas(id, aluno_matricula, disciplina_id, professor_matricula) VALUES (1, '24', 1, '25');
INSERT INTO turmas(id, aluno_matricula, disciplina_id, professor_matricula) VALUES (2, '24', 5, '23');
INSERT INTO turmas(id, aluno_matricula, disciplina_id, professor_matricula) VALUES (3, '24', 4, '22');