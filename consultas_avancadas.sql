-- Relatório: Turmas com alta lotação
SELECT 
    t.id_turma, 
    d.nome_disciplina, 
    t.semestre,
    COUNT(m.id_aluno) AS total_alunos_ativos
FROM turmas t
JOIN disciplinas d ON t.id_disciplina = d.id_disciplina
JOIN matriculas m ON t.id_turma = m.id_turma
WHERE m.status = 'Ativo'
GROUP BY t.id_turma, d.nome_disciplina, t.semestre
HAVING COUNT(m.id_aluno) > 2
ORDER BY total_alunos_ativos DESC;

-- Relatório: Contato dos alunos do curso de Desenvolvimento Web com Python
SELECT 
    nome, 
    email 
FROM alunos 
WHERE id_aluno IN (
    SELECT m.id_aluno
    FROM matriculas m
    JOIN turmas t ON m.id_turma = t.id_turma
    JOIN disciplinas d ON t.id_disciplina = d.id_disciplina
    JOIN cursos c ON d.id_curso = c.id_curso
    WHERE c.nome_curso = 'Desenvolvimento Web com Python'
);

-- Classificação de Cursos por Duração
SELECT 
    nome_curso, 
    carga_horaria,
    CASE
        WHEN carga_horaria <= 50 THEN 'Curso Rápido'
        WHEN carga_horaria BETWEEN 51 AND 100 THEN 'Curso Intermediário'
        ELSE 'Curso Extenso'
    END AS categoria_duracao
FROM cursos
ORDER BY carga_horaria ASC;

-- Criação da View de Relatório Geral
CREATE OR REPLACE VIEW vw_relatorio_academico AS
SELECT 
    a.nome AS nome_aluno, 
    a.cpf, 
    c.nome_curso,
    d.nome_disciplina, 
    t.semestre, 
    p.nome AS professor_responsavel, 
    m.status AS status_matricula
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN disciplinas d ON t.id_disciplina = d.id_disciplina
JOIN cursos c ON d.id_curso = c.id_curso
JOIN professores p ON t.id_professor = p.id_professor;

SELECT * FROM vw_relatorio_academico;

-- Otimizando buscas por CPF
CREATE INDEX idx_alunos_cpf ON alunos(cpf);

-- Otimizando os filtros de relatórios
CREATE INDEX idx_matriculas_status ON matriculas(status);