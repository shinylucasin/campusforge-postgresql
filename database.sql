CREATE DATABASE estacio;

CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE professores (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT NOT NULL,

    FOREIGN KEY (id_curso)
    REFERENCES cursos(id_curso)
);

CREATE TABLE turmas (
    id_turma SERIAL PRIMARY KEY,
    semestre VARCHAR(20) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,

    FOREIGN KEY (id_disciplina)
    REFERENCES disciplinas(id_disciplina),

    FOREIGN KEY (id_professor)
    REFERENCES professores(id_professor)
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_aluno)
    REFERENCES alunos(id_aluno),

    FOREIGN KEY (id_turma)
    REFERENCES turmas(id_turma)
);

-- Tabela Alunos
INSERT INTO alunos (nome, cpf, email, data_nascimento) VALUES
('Gabriel Silva Santos', '123.456.789-00', 'gabriel.silva@email.com', '2001-03-15'),
('Beatriz Oliveira Lima', '987.654.321-11', 'beatriz.oliveira@email.com', '1998-07-22'),
('Lucas Ferreira Costa', '456.789.123-22', 'lucas.ferreira@email.com', '2003-11-05'),
('Mariana Souza Almeida', '321.654.987-33', 'mariana.souza@email.com', '2000-01-30'),
('Rodrigo Pereira Rocha', '789.123.456-44', 'rodrigo.pereira@email.com', '1995-05-12'),
('Lucas Andrade Melo', '234.567.890-11', 'lucas.andrade@email.com', '2002-04-18'),
('Larissa Duarte Gomes', '345.678.901-22', 'larissa.duarte@email.com', '1999-09-05'),
('Pedro Henrique Souza', '456.789.012-33', 'pedro.souza@email.com', '2001-12-25'),
('Camila Martins Dias', '567.890.123-44', 'camila.martins@email.com', '2003-06-14'),
('Thiago Barbosa Lima', '678.901.234-55', 'thiago.barbosa@email.com', '1997-02-28'),
('Amanda Rodrigues Alencar', '789.012.345-66', 'amanda.rodrigues@email.com', '2000-10-10'),
('Bruno Cesar Vieira', '890.123.456-77', 'bruno.vieira@email.com', '1996-08-19'),
('Letícia Castro Nogueira', '901.234.567-88', 'leticia.castro@email.com', '2002-01-07'),
('Felipe Augusto Silva', '012.345.678-99', 'felipe.augusto@email.com', '2004-05-22'),
('Juliana Mendes Frota', '111.222.333-44', 'juliana.mendes@email.com', '1998-11-13'),
('Gustavo Borges Maciel', '222.333.444-55', 'gustavo.borges@email.com', '2001-07-19'),
('Isabela Freitas Ramos', '333.444.554-66', 'isabela.freitas@email.com', '2003-03-03'),
('Leonardo Antunes Coimbra', '444.555.666-77', 'leonardo.antunes@email.com', '1995-12-30'),
('Carolina Viana Peixoto', '555.666.777-88', 'carolina.viana@email.com', '2000-04-02'),
('Daniel Moraes Cardoso', '666.777.888-99', 'daniel.moraes@email.com', '1999-06-21'),
('Renata Fonseca Teles', '777.888.999-00', 'renata.fonseca@email.com', '2002-08-14'),
('Diego Cavalcanti Moura', '888.999.000-11', 'diego.cavalcanti@email.com', '1997-10-05'),
('Vanessa Guimarães Ortiz', '999.000.111-22', 'vanessa.ortiz@email.com', '2001-01-25'),
('Matheus Cunha Carvalho', '123.987.456-55', 'matheus.cunha@email.com', '2003-09-12'),
('Priscila Fontes Rangel', '321.987.654-77', 'priscila.rangel@email.com', '1996-03-17');

-- Tabela Cursos
INSERT INTO cursos (nome_curso, carga_horaria) VALUES
('Desenvolvimento Web com Python', 120),
('Banco de Dados SQL Avançado', 80),
('Lógica de Programação e Algoritmos', 40),
('Front-End Completo (HTML, CSS e JS)', 100),
('Estrutura de Dados e PHP', 60);

-- Tabela Disciplina
INSERT INTO disciplinas (nome_disciplina, carga_horaria, id_curso) VALUES
('Introdução ao HTML e CSS', 40, 4),
('JavaScript Avançado e DOM', 60, 4),
('Fundamentos de Python', 40, 1),
('Desenvolvimento Web com Django', 80, 1),
('Modelagem de Dados e Relacionamentos', 40, 2),
('Queries Complexas e Performance em SQL', 40, 2),
('Sintaxe PHP e Variáveis', 30, 5),
('Algoritmos e Estruturas de Repetição', 40, 3);

-- Tabela Professores
INSERT INTO professores (nome, especialidade, email) VALUES
('Augusto Neves', 'Python e Django', 'augusto.neves@escola.com'),
('Clarice Lisbôa', 'Banco de Dados SQL', 'clarice.lisboa@escola.com'),
('Silvio Santos', 'Lógica de Programação', 'silvio.santos@escola.com'),
('Ana Maria', 'Front-End e UX', 'ana.maria@escola.com'),
('Ricardo Reis', 'PHP e Back-End', 'ricardo.reis@escola.com');

-- Tabela Turmas
INSERT INTO turmas (semestre, turno, id_disciplina, id_professor) VALUES
('2026.1', 'Noturno', 1, 2),
('2026.1', 'Noturno', 2, 2),
('2026.1', 'Matutino', 3, 3),
('2026.1', 'Vespertino', 4, 3),
('2026.1', 'Sábado', 5, 4),
('2026.1', 'Sábado', 6, 4),
('2026.1', 'Noturno', 7, 5),
('2026.1', 'Matutino', 8, 5);

-- Tabela Matriculas
INSERT INTO matriculas (id_aluno, id_turma, data_matricula, status) VALUES
(1, 1, CURRENT_DATE, 'Ativo'),
(2, 1, CURRENT_DATE, 'Ativo'),
(3, 1, CURRENT_DATE, 'Ativo'),
(4, 1, CURRENT_DATE, 'Ativo'),
(5, 1, CURRENT_DATE, 'Ativo'),

(6, 2, CURRENT_DATE, 'Ativo'),
(7, 2, CURRENT_DATE, 'Ativo'),
(8, 2, CURRENT_DATE, 'Ativo'),
(9, 2, CURRENT_DATE, 'Ativo'),

(10, 3, CURRENT_DATE, 'Ativo'),
(11, 3, CURRENT_DATE, 'Ativo'),
(12, 3, CURRENT_DATE, 'Ativo'),

(13, 4, CURRENT_DATE, 'Ativo'),
(14, 4, CURRENT_DATE, 'Ativo'),
(15, 4, CURRENT_DATE, 'Ativo'),

(16, 5, CURRENT_DATE, 'Ativo'),
(17, 5, CURRENT_DATE, 'Ativo'),

(18, 6, CURRENT_DATE, 'Ativo'),
(19, 6, CURRENT_DATE, 'Ativo'),

(20, 7, CURRENT_DATE, 'Ativo'),
(21, 7, CURRENT_DATE, 'Ativo'),

(22, 8, CURRENT_DATE, 'Ativo'),
(23, 8, CURRENT_DATE, 'Ativo'),
(24, 8, CURRENT_DATE, 'Ativo'),
(25, 8, CURRENT_DATE, 'Ativo');
