
---------------- Laboratório SQL: Retorne os comandos em SQL do laboratório.  
-- Cesar Augusto de Moraes Costa 3308072022

-- 1 e 2. Criação das tabelas
CREATE TABLE Instrutor ( 
    InstrutorID   	INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT InstrutorPK PRIMARY KEY (InstrutorID) 
);

CREATE TABLE Aluno ( 
    AlunoID   		INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT AlunoPK PRIMARY KEY (AlunoID) 
);

CREATE TABLE Escola ( 
    EscolaID   		INT   			NOT NULL,
    CNPJ			INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT EscolaPK PRIMARY KEY (EscolaID) 
);

CREATE TABLE Curso ( 
    CursoID   		INT   			NOT NULL,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Carga_horaria	INT 			NOT NULL,
    Ementa			VARCHAR( 500 )	,
    EscolaID        INT 			NOT NULL,
    
    CONSTRAINT CursoPK PRIMARY KEY (CursoID), 
    
    CONSTRAINT CursoEscolaFK 	FOREIGN KEY (EscolaID) 
    							REFERENCES Escola(EscolaID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);

-- 02) Crie as tabelas Turma e Matricula. Use as ações ‘ON DELETE CASCADE’ e 
-- ‘ON UPDATE CASCADE‘ para todas as chaves estrangeiras criadas. Crie os 
-- atributos nessa ordem: (1) Turma: TurmaID, Data_inicio, Data_termino, 
-- CursoID,  InstrutorID.  (2)  Matricula:  TurmaID,  AlunoID,  Nota_final, 
-- Presenca. 
CREATE TABLE Turma ( 
    TurmaID   		INT   			NOT NULL,
    Data_inicio     DATE 	        NOT NULL,
    Data_termino	DATE 			NOT NULL,
    CursoID   		INT   			NOT NULL,
    InstrutorID   	INT   			NOT NULL,  

    CONSTRAINT TurmaPK PRIMARY KEY (TurmaID),

	CONSTRAINT TurmaCursoFK FOREIGN KEY (CursoID)
                                REFERENCES Curso(CursoID)
	 							ON DELETE CASCADE 
    							ON UPDATE CASCADE,
    CONSTRAINT TurmaInstrutorFK FOREIGN KEY (InstrutorID)
                                REFERENCES Instrutor(InstrutorID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE

);

CREATE TABLE Matricula ( 
    TurmaID   		INT   			NOT NULL,
    AlunoID   		INT   			NOT NULL,
    Nota_final   	NUMERIC(4,2)	NOT NULL,
    Presenca        INT             NOT NULL,
    CONSTRAINT MatriculaPK PRIMARY KEY (TurmaID, AlunoID),
    CONSTRAINT MatriculaTurmaFK FOREIGN KEY (TurmaID)
                                REFERENCES Turma(TurmaID)
                                ON DELETE CASCADE 
    							ON UPDATE CASCADE, 
    CONSTRAINT MatriculaAlunoFK FOREIGN KEY (AlunoID)
                                REFERENCES Aluno(AlunoID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);

-- 3. Use os comandos SQL para inserir dados na tabela Instrutor 

INSERT INTO Instrutor VALUES(1, 11111, 'Rodrigo Carvalho', 'Rua Alfa, num 50, Centro');
INSERT INTO Instrutor VALUES(2, 22222, 'Jacqueline França', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Instrutor VALUES(3, 33333, 'Leandro Siqueira', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Instrutor VALUES(4, 44444, 'Diego Faria', 'Rua Siqueira Campos, num 80, Jd Apolo');


-- 4. Use os comandos SQL para inserir dados na tabela Aluno
ALTER TABLE Aluno ALTER COLUMN nome  TYPE varchar(100);

INSERT INTO Aluno VALUES(1, 12222, 'Jose Vitor Ferreira Fernandes Gomes Dias', 'Rua Alfa, num 100, Centro');
INSERT INTO Aluno VALUES(2, 32222, 'Rodrigo Gomes Dias', 'Rua Sete de Setembro, num 200, Alvorada');
INSERT INTO Aluno VALUES(3, 42222, 'Daniel Ribeiro Alvarenga', 'Rua Nelson Davila, num 150, Centro');
INSERT INTO Aluno VALUES(4, 52222, 'Gustavo Ferreira', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(5, 62222, 'Marcelo Reis Fernandes', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(6, 72222, 'Renata Fernandes Carvalho', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(7, 82222, 'Debora Ribeiro Reis', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(8, 92222, 'Daniela Reis Barbosa', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(9, 13333, 'Luciane Cardoso', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(10, 91919, 'Claudio Cardoso', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(11, 81818, 'Marina Reis Alvarenga', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(12, 71717, 'Sabrina Carvalho', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(13, 61616, 'Julio Cesar Dias', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(14, 51515, 'Regiane Limeira', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(15, 41414, 'Augusto Dias Gomes', 'Rua Nelson Davila, num 120, Centro');

-- OBS: Erro ao inserir o primeiro registro, temos que aumentar o range do atributo nome
-- ALTER TABLE <table name> ALTER COLUMN <column name>  TYPE <new column type>
-- ALTER TABLE Aluno ALTER COLUMN nome  TYPE varchar(100)
-- ALTER TABLE <name_table> ALTER COLUMN <name_column> SET NOT NULL;

-- 5. Use os comandos SQL para inserir dados na tabela Escola, Curso, Turma e Matricula

INSERT INTO Escola VALUES(1, 11111, 'InfoSys', 'Rua Nelson Davila, num 400, Centro');
INSERT INTO Escola VALUES(2, 22222, 'Inova', 'Rua Sete de Setembro, num 800, Alvorada');
INSERT INTO Escola VALUES(3, 33333, 'CodSys', 'Rua Alfa, num 1030, Apolo');
--
INSERT INTO Curso VALUES(1, 'Linux - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(2, 'Linux - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(3, 'Windows - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(4, 'Windows - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(5, 'C++ Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(6, 'Java Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(7, 'Python', 120, '', 3);
INSERT INTO Curso VALUES(8, 'Database System and SQL', 240, '', 2);
INSERT INTO Curso VALUES(9, 'Data Science', 240, '', 2);
INSERT INTO Curso VALUES(10, 'Geoinformatics', 240, '', 2);
-- 

INSERT INTO Turma VALUES(1, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma VALUES(2, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma VALUES(3, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma VALUES(4, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma VALUES(5, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma VALUES(6, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma VALUES(7, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma VALUES(8, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma VALUES(9, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(10, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(11, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(12, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma VALUES(13, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma VALUES(14, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma VALUES(15, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma VALUES(16, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(17, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(18, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 10, 4);
INSERT INTO Turma VALUES(19, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 10, 4);


-- TurmaID, AlunoID, Nota e Presenca
INSERT INTO Matricula VALUES(1, 1, '8.4', 80);   
INSERT INTO Matricula VALUES(1, 2, '6.4', 85);   
INSERT INTO Matricula VALUES(1, 3, '5.0', 67);   
INSERT INTO Matricula VALUES(1, 4, '9.4', 100);   
INSERT INTO Matricula VALUES(1, 5, '8.7', 100); 
  
INSERT INTO Matricula VALUES(2, 1, '7.4', 80);   
INSERT INTO Matricula VALUES(2, 2, '7.4', 85);   
INSERT INTO Matricula VALUES(2, 3, '8.0', 80);   
INSERT INTO Matricula VALUES(2, 4, '7.4', 70);   
INSERT INTO Matricula VALUES(2, 5, '9.7', 100);   

INSERT INTO Matricula VALUES(3, 6, '8.4', 80);   
INSERT INTO Matricula VALUES(3, 7, '6.4', 85);   
INSERT INTO Matricula VALUES(3, 8, '5.0', 67);   
INSERT INTO Matricula VALUES(3, 9, '9.4', 100);   
INSERT INTO Matricula VALUES(3, 10, '8.7', 100); 
  
INSERT INTO Matricula VALUES(4, 6, '7.4', 80);   
INSERT INTO Matricula VALUES(4, 7, '9.4', 85);   
INSERT INTO Matricula VALUES(4, 8, '8.0', 80);   
INSERT INTO Matricula VALUES(4, 9, '7.4', 70);   
INSERT INTO Matricula VALUES(4, 10, '9.7', 100); 

INSERT INTO Matricula VALUES(9, 11, '7.4', 80);   
INSERT INTO Matricula VALUES(9, 12, '9.4', 85);   
INSERT INTO Matricula VALUES(9, 13, '8.0', 70);  

INSERT INTO Matricula VALUES(10, 14, '7.4', 80);   
INSERT INTO Matricula VALUES(10, 15, '9.4', 85);   
INSERT INTO Matricula VALUES(10, 1, '8.0', 70);  

INSERT INTO Matricula VALUES(11, 2, '7.4', 80);   
INSERT INTO Matricula VALUES(11, 3, '9.4', 85);   
INSERT INTO Matricula VALUES(11, 4, '8.0', 70);  

-- 6. Recupere as infos do catalogo 

--a. Quais esquemas existem nesse banco de dados?
SELECT current_schema();

--b. Recupere as informações sobre as tabelas do esquema “public“.
SELECT * FROM information_schema.tables;

--c. Recupere as informações sobre todas as colunas de todas as
--tabelas do esquema “public”.
SELECT * FROM information_schema.tables WHERE table_schema = 'public';

--d. Recupere as informações sobre todas as restrições (constraints) de
--todas as tabelas do esquema “public”.
SELECT con.*
FROM pg_catalog.pg_constraint con
INNER JOIN pg_catalog.pg_class rel
ON rel.oid = con.conrelid
    INNER JOIN pg_catalog.pg_namespace nsp
    ON nsp.oid = connamespace
WHERE nsp.nspname = 'public';

-- 07) Selecione todos alunos ordenados pelo nome. 
select * from aluno
order by nome asc

-- 08) Quantos cursos estão cadastrados no banco de dados? 
select count(*) from aluno

-- 09) Quantos cursos foram ministrados pelo instrutor 'Leandro Siqueira'? 
SELECT count(i.InstrutorID)
FROM instrutor as i
INNER JOIN turma as t 
ON t.InstrutorID = i.InstrutorID AND i.nome = 'Leandro Siqueira'

-- 10) Quantas  horas  de  curso  foram  ministradas  pelo  instrutor  'Leandro 
-- Siqueira'? 
SELECT SUM(carga_horaria) As Total_Horas
FROM curso as c
INNER JOIN turma as t 
ON c.CursoID = t.CursoID
    INNER JOIN Instrutor as i 
    ON t.InstrutorID = i.InstrutorID AND i.nome = 'Leandro Siqueira'

-- 11) Quantas turmas foram ministradas por cada instrutor?   
SELECT count(t.TurmaId) as QuantidadeTurmas, i.nome As Instrutor
FROM instrutor as i
INNER JOIN turma as t 
ON t.InstrutorID = i.InstrutorID
group by i.nome
-- ou
SELECT count(t.TurmaId) as QuantidadeTurmas, i.nome As Instrutor
FROM instrutor as i, turma t
where t.InstrutorID = i.InstrutorID
group by i.nome

-- 12) Quantas horas de curso foram ministradas por cada instrutor ? 
SELECT SUM(carga_horaria) As Total_Horas, i.nome As Instrutor
FROM curso as c
INNER JOIN turma as t 
ON c.CursoID = t.CursoID
    INNER JOIN Instrutor as i 
    ON t.InstrutorID = i.InstrutorID
group by i.nome

-- 13)  Se os cursos pagam 100,00 por hora ministrada, quanto cada instrutor 
-- recebeu por ano? 
SELECT EXTRACT(YEAR FROM t.data_inicio) AS Ano, i.nome,  
SUM(c.carga_horaria)*100 AS "Valor Recebido Por Ano" FROM instrutor i, turma t, curso c
WHERE t.InstrutorId = i.InstrutorId AND t.CursoId = c.CursoId
GROUP BY Ano, i.nome 
ORDER BY i.nome

-- 14) Quais instrutores deram mais que 850 horas de curso? 
SELECT SUM(c.carga_horaria) As Total_Horas, i.nome As Instrutor
FROM curso as c
INNER JOIN turma as t 
ON c.CursoID = t.CursoID
    INNER JOIN Instrutor as i 
    ON t.InstrutorID = i.InstrutorID
group by i.nome
HAVING SUM(carga_horaria)>850 
-- ou
SELECT SUM(c.carga_horaria) As Total_Horas, i.nome As Instrutor
FROM curso c, instrutor i, turma t
where t.InstrutorID = i.InstrutorID and c.CursoID = t.CursoID
group by i.nome
HAVING SUM(carga_horaria)>850

-- 15) Quantas turmas cada curso teve por ano? 
SELECT c.nome AS curso, EXTRACT(YEAR FROM t.data_inicio) AS ano, 
	    COUNT(t.turmaid) AS quantidade_turmas FROM turma t, curso c 
GROUP BY curso, ano
ORDER BY ano

-- 16) Quais cursos o aluno 'Rodrigo Gomes Dias' cursou e qual foi a nota dele 
-- em cada um? 
SELECT c.nome As Curso, a.nome AS Aluno, m.Nota_final
FROM curso c
    INNER JOIN turma t
    ON c.CursoID = t.CursoID
        INNER JOIN matricula m 
        ON m.TurmaID = t.TurmaId
            INNER JOIN aluno a 
            ON a.AlunoID = m.AlunoID AND a.nome = 'Rodrigo Gomes Dias'
GROUP BY c.nome, a.nome, m.Nota_final

-- 17) Crie uma view que contenha o histórico dos alunos contendo as seguintes 
-- informações:  nome  do  aluno,  CPF  do  aluno,  endereço  do  aluno,  curso 
-- ministrado,  data  de  inicio  e  termino  do  curso,  nome  do  instrutor  do 
-- curso, carga horaria, nota final, presença. 
CREATE VIEW historico AS
    SELECT a.nome, a.cpf, a.endereco, c.nome as Curso, t.data_inicio, t.data_termino,
            i.nome as Instrutor, c.carga_horaria, m.nota_final, m.presenca
    FROM curso c
    INNER JOIN turma t
    ON c.CursoID = t.CursoID
        INNER JOIN matricula m 
        ON m.TurmaID = t.TurmaId
            INNER JOIN aluno a 
            ON a.AlunoID = m.AlunoID
                INNER JOIN instrutor i
                ON i.InstrutorID = t.InstrutorID
GROUP BY a.nome, a.cpf, a.endereco, c.nome, t.data_inicio, t.data_termino,
            i.nome, c.carga_horaria, m.nota_final, m.presenca
order by a.nome

-- 18) Insira uma nova turma na tabela Turma 
INSERT INTO Turma VALUES(20, to_date('2022-03-27', 'YYYY-MM-DD'), to_date('2022-06-23', 'YYYY-MM-DD'), 8, 2);

-- 19) Altere o nome do instrutor "Diego Faria" para "Diego Garcia Faria" 
UPDATE instrutor SET
nome = 'Diego Garcia Faria'
where nome = 'Diego Faria'

-- 20) Aumente a nota de todos alunos em 10% 
UPDATE matricula SET
nota_final = (nota_final * 1.1)
-- ALTER TABLE matricula DROP CONSTRAINT verifica_nota_final;

-- 21) Remova o instrutor "Rodrigo Carvalho" da tabela instrutor. OBS: Observe 
-- o  que  acontece  com  as  turmas  associadas  ao  instrutor  "Rodrigo 
-- Carvalho". 
delete from instrutor
where nome = 'Rodrigo Carvalho'

-- 22) Mude o atributo "CNPJ" da tabela "Escola" para um tipo textual.
ALTER TABLE escola
    ALTER COLUMN CNPJ TYPE varchar(100)

-- 23) Renomeie o atributo "CNPJ" para "CNPJ_Escola". 
ALTER TABLE escola RENAME COLUMN CNPJ TO CNPJ_Escola; 

-- 24) Remova o atributo "CNPJ_Escola". 
ALTER TABLE escola DROP COLUMN CNPJ_Escola; 

-- 25) Remova  todos  os  registros  da  tabela  "Instrutor”.  OBS:  Observe  o  que 
-- acontece  com  os  registros  das  tabelas  que  recebem  o  atributo 
-- "InstrutorID" como foreign key. 
DELETE FROM instrutor

-- 26) Remova o atributo "InstrutorID" da tabela "Instrutor". 
ALTER TABLE instrutor DROP COLUMN InstrutorID CASCADE;

-- 27) Remova a tabela "Instrutor". 
DROP TABLE instrutor

-- 28) Remova todas as tabelas do banco (esquema e conteúdo).
DROP schema public cascade;
CREATE schema public; 

-- 29) Crie novamente as tabelas do banco de dados usando os scripts acima. 
-- OK. feito insert

-- 30) Adicione um atributo "valor_hora" na tabela "Curso" tipo REAL. 
ALTER TABLE Curso ADD COLUMN valor_hora REAL

-- 31) Preencha o novo atributo “valor_hora” da tabela “Curso” com o valor 50 
-- (cada curso paga R$ 50,00 por hora ministrada). 
UPDATE Curso 
SET valor_hora = 50

-- 32) Crie uma nova tabela chamada “instrutor_pagamento” que contenha os 
-- seguintes atributos:  (1) o id do instrutor ( PK - FK da tabela instrutor), 
-- (2) ano (PK - tipo INT) e (3) valor_pagamento (tipo REAL). 
CREATE TABLE instrutor_pagamento (
    InstrutorID   		INT   			NOT NULL,
    Ano	                INT 			NOT NULL,
    valor_pagamento		REAL    NOT NULL,
    
    CONSTRAINT Instrutor_pagamentoPK PRIMARY KEY (InstrutorID, Ano), 
    
    CONSTRAINT InstrutorFK 	FOREIGN KEY (InstrutorID) 
    							REFERENCES Instrutor(InstrutorID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE

);

-- 33) Insira  na  tabela  "instrutor_pagamento"  o  valor  que  cada  instrutor 
-- recebeu por ano. 
INSERT INTO instrutor_pagamento
    (
    InstrutorID,
    Ano,
    valor_pagamento
    )
SELECT i.instrutorid, EXTRACT(YEAR FROM t.data_inicio) As Ano, SUM(c.valor_hora * c.carga_horaria)
FROM curso as c
INNER JOIN turma as t 
ON c.CursoID = t.CursoID
    INNER JOIN instrutor as i 
    ON t.InstrutorID = i.InstrutorID
group by i.instrutorid, Ano
order by i.instrutorid

-- 34) Faça uma trigger que atualiza o valor do pagamento do instrutor toda vez 
-- que inserirmos uma nova turma no sistema.
-- Verificar:
-- SELECT i.instrutorid, EXTRACT(YEAR FROM t.data_inicio) AS Ano, i.nome,  
-- SUM(c.carga_horaria * c.valor_hora) AS "Valor Recebido Por Ano" FROM instrutor i, turma t, curso c
-- WHERE t.InstrutorId = i.InstrutorId AND t.CursoId = c.CursoId
-- GROUP BY Ano, i.nome, i.instrutorid 
-- ORDER BY i.instrutorid

-- select * from instrutor_pagamento i
-- ORDER BY i.instrutorid

-- SELECT SUM(c.carga_horaria * c.valor_hora) FROM instrutor i, turma t, curso c
-- WHERE t.InstrutorId = i.InstrutorId AND t.CursoId = c.CursoId
-- GROUP BY EXTRACT(YEAR FROM t.data_inicio), i.nome, i.instrutorid 
-- ORDER BY i.instrutorid

CREATE OR REPLACE FUNCTION func_trigger_instrutor_pagamento()
RETURNS trigger AS
$BODY$
DECLARE n REAL;
BEGIN
    IF ((SELECT COUNT(InstrutorID) FROM Instrutor_Pagamento where Ano = EXTRACT(YEAR FROM NEW.data_inicio)) <> 0) THEN
        n = (SELECT (c.carga_horaria * c.valor_hora) FROM instrutor i, turma t, curso c
            WHERE i.InstrutorId = NEW.InstrutorId AND c.CursoId = NEW.CursoID
            GROUP BY i.instrutorid, c.carga_horaria, c.valor_hora 
            );
        
        UPDATE instrutor_pagamento SET valor_pagamento = valor_pagamento + n 
        WHERE InstrutorID = NEW.InstrutorID AND Ano = EXTRACT(YEAR FROM NEW.data_inicio);
        RETURN NEW;
    END IF;

    INSERT INTO instrutor_pagamento
    (
    InstrutorID,
    Ano,
    valor_pagamento
    )
    SELECT i.instrutorid, EXTRACT(YEAR FROM NEW.data_inicio) As Ano, (c.valor_hora * c.carga_horaria)
    FROM curso as c
    INNER JOIN turma as t 
    ON c.CursoID = NEW.CursoID
        INNER JOIN instrutor as i 
        ON i.InstrutorID = NEW.InstrutorID
    group by i.instrutorid, Ano, c.valor_hora, c.carga_horaria;
    RETURN NEW;        
END;
$BODY$
LANGUAGE plpgsql;

-- Trigger:
CREATE TRIGGER trigger_atualiza_valor_pagamento AFTER INSERT OR UPDATE ON turma 
    FOR EACH ROW EXECUTE PROCEDURE func_trigger_instrutor_pagamento();

-- DROP FUNCTION func_trigger_instrutor_pagamento() CASCADE

-- 35) Insira 3 turmas novas em 2019 para alguns instrutores e confira se sua 
-- trigger  está  funcionando  e  atualizando  a  tabela  "instrutor_pagamento" 
-- corretamente.  
INSERT INTO Turma VALUES(
    20, to_date('2015-03-28', 'YYYY-MM-DD'), to_date('2022-06-23', 'YYYY-MM-DD'), 8, 1);
-- instrutorid=1, ano=2015, valor_pagamento=(24000+12000)
INSERT INTO Turma VALUES(
    21, to_date('2019-03-28', 'YYYY-MM-DD'), to_date('2019-06-23', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(
    22, to_date('2019-06-28', 'YYYY-MM-DD'), to_date('2019-09-23', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(
    23, to_date('2019-09-28', 'YYYY-MM-DD'), to_date('2019-12-23', 'YYYY-MM-DD'), 8, 1);

Select * from instrutor_pagamento

