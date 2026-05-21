-- Updates
UPDATE alunos
SET email = 'lucas.costa@hotmail.com'
WHERE id_aluno = 3;

UPDATE matriculas
SET status = 'Trancado'
WHERE id_matricula IN ( 7, 10, 16, 23 );

UPDATE professores
SET especialidade = 'Python, Django e APIs REST'
WHERE id_professor = 1;

UPDATE turmas
SET semestre = '2026.2'
WHERE turno = 'Noturno';

UPDATE disciplinas
SET carga_horaria = 50
WHERE carga_horaria = 40;

-- Deletes
DELETE FROM matriculas
WHERE status = 'Trancado';

DELETE FROM matriculas
WHERE id_turma = 8;

DELETE FROM turmas
WHERE id_turma = 8;

-- ✅ Apaga primeiro as matrículas das turmas com id_disciplina = 7
DELETE FROM matriculas
WHERE id_turma IN (SELECT id_turma FROM turmas WHERE id_disciplina = 7);

DELETE FROM turmas
WHERE id_disciplina = 7;

DELETE FROM disciplinas
WHERE carga_horaria < 40;

-- Constraints
ALTER TABLE matriculas
DROP CONSTRAINT IF EXISTS chk_status;

ALTER TABLE matriculas
ADD CONSTRAINT chk_status
CHECK (status IN ('Ativo', 'Trancado', 'Concluído'));

-- Triggers
CREATE OR REPLACE FUNCTION impedir_matricula_duplicada()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM matriculas
        WHERE id_aluno = NEW.id_aluno
        AND id_turma = NEW.id_turma
    ) THEN
        RAISE EXCEPTION 'O(A) aluno(a) já está matriculado nesta turma!';
    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_matricula_duplicada ON matriculas;

CREATE TRIGGER trg_matricula_duplicada
BEFORE INSERT ON matriculas
FOR EACH ROW
EXECUTE FUNCTION impedir_matricula_duplicada();

-- Procedures
CREATE OR REPLACE PROCEDURE matricular_aluno(
    p_id_aluno INT,
    p_id_turma INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM matriculas
        WHERE id_aluno = p_id_aluno
        AND id_turma = p_id_turma
    ) THEN
        RAISE EXCEPTION 'Aluno já matriculado nessa turma';
    END IF;

    INSERT INTO matriculas (id_aluno, id_turma, data_matricula, status)
    VALUES (p_id_aluno, p_id_turma, CURRENT_DATE, 'Ativo');
END;
$$;
