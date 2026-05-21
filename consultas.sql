-- lista todos os alunos
SELECT * FROM alunos;

-- lista disciplinas ordenadas por nome
SELECT * FROM disciplinas
ORDER BY nome_disciplina;

-- lista alunos com o cadastro ativo
SELECT
a.nome AS aluno,
m.status
FROM alunos a

JOIN matriculas m
ON a.id_aluno = m.id_aluno

WHERE m.status = 'Ativo';

-- aluno, disciplina, professor, e semestre
SELECT 
a.nome AS aluno,
d.nome_disciplina AS disciplina,
p.nome AS professor,
t.semestre

FROM matriculas m

JOIN alunos a
ON m.id_aluno = a.id_aluno

JOIN turmas t
ON m.id_turma = t.id_turma

JOIN disciplinas d
ON t.id_disciplina = d.id_disciplina

JOIN professores p
ON t.id_professor = p.id_professor;

-- quantidade de alunos por turma
SELECT
    t.id_turma,
    d.nome_disciplina AS disciplina,
    COUNT(m.id_aluno) AS quantidade_alunos

FROM turmas t

JOIN disciplinas d
    ON t.id_disciplina = d.id_disciplina

JOIN matriculas m
    ON t.id_turma = m.id_turma

GROUP BY
    t.id_turma,
    d.nome_disciplina

ORDER BY quantidade_alunos ASC;

-- cursos e suas disciplinas
SELECT
    c.nome_curso,
    d.nome_disciplina

FROM cursos c

JOIN disciplinas d
    ON c.id_curso = d.id_curso

ORDER BY c.nome_curso;

