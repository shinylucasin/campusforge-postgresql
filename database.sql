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
