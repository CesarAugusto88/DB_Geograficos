
CREATE TABLE Aluno (
nome varchar(100) not null,
numero_matricula int not null unique,
CPF varchar(13) not null,
RG varchar(13) not null,
telefone varchar(16) not null,
endereco_atual varchar(150) not null,
endereco_permanente varchar(150) not null,
email varchar(50) not null,
data_nascimento date not null,
sexo char(1) not null,
PRIMARY KEY(CPF,RG,numero_matricula)
);
-- inserts
INSERT INTO Aluno VALUES('Rodrigo Carvalho', 1, '329329329-9', '31311111-X', '1222222222','Rua Alfa, num 50, Centro', 'Rua Alfa, num 50, Centro', 'mail@mail.com', '2000-10-23', 'M');
INSERT INTO Aluno VALUES('Cesar Costa', 2, '909090909-9', '0909090-X', '1299999999999','Rua Albertina, num 10, Centro', 'Rua Ana, num 50, Centro', 'mail@gmail.com', '1988-10-23', 'M');

CREATE TABLE Departamento (
nome varchar(100) not null,
sigla varchar(10) not null,
codigo int not null unique,
endereco varchar(150),
numero_telefone varchar(15),
n_matricula int not null,
PRIMARY KEY(nome,sigla,codigo),
CONSTRAINT departamentoalunofk
      FOREIGN KEY(n_matricula ) 
	  REFERENCES Aluno(numero_matricula )
);
-- inserts
INSERT INTO Departamento VALUES('Engenharias', 'ENG', 1, 'Rua Eng, Centro, 101', '398765555', 1);
INSERT INTO Departamento VALUES('Pós-Graduação', 'POS', 2, 'Rua Eng, Centro, 101', '8787878787878', 2);

CREATE TABLE Professor (
nome varchar(100),
numero int not null unique,
RG varchar(13) not null,
CPF varchar(13) not null,
telefone varchar(16),
endereco varchar(150),
email varchar(50),
data_nascimento date,
sexo char(1),
c_departamento int not null,
PRIMARY KEY(numero,RG,CPF),
CONSTRAINT professordepartamentofk
      FOREIGN KEY(c_departamento) 
	  REFERENCES Departamento(codigo)
);
-- inserts
INSERT INTO Professor VALUES('Lubia', 1, '9998887766', '8888877665544', '12333444', 'R. tal Huss e Jeronimo', 'mail@inpe.br', '1980-01-01', 'F', 2);
INSERT INTO Professor VALUES('Karine', 2, '9898998898', '8787878787878', '9988776655', 'Av. Eng, Bairro, Ap. Bloco', 'mail@inpe.br', '1980-01-01', 'F', 2);

 
CREATE TABLE Matricula (
id int not null unique,
presencas int,
faltas int,
nota_final numeric(4,2),
n_professor int not null,
n_matricula int not null,
PRIMARY KEY(id),
CONSTRAINT matriculaalunofk
      FOREIGN KEY(n_matricula) 
	  REFERENCES Aluno(numero_matricula),
CONSTRAINT matriculaprofessorfk
      FOREIGN KEY(n_professor) 
	  REFERENCES Professor(numero)
);
-- inserts
INSERT INTO Matricula VALUES(1, 10, 20, 8.8, 1, 1);
INSERT INTO Matricula VALUES(2, 5, 20, 8.5, 2, 2);

CREATE TABLE Curso (
nome varchar(100),
descricao varchar(300),
numero integer not null unique,
numero_semestres smallint,
carga_horaria_total timestamp,
carga_horaria_semestre timestamp,
nivel varchar(13),
n_matricula int not null,
c_departamento int not null,
PRIMARY KEY(numero),
CONSTRAINT cursodepartamentofk
      FOREIGN KEY(c_departamento) 
	  REFERENCES Departamento(codigo),
CONSTRAINT cursoalunofk
      FOREIGN KEY(n_matricula) 
	  REFERENCES Aluno(numero_matricula)

);
-- alter table
ALTER TABLE curso
    ALTER COLUMN carga_horaria_total TYPE varchar(15),
    ALTER COLUMN carga_horaria_semestre TYPE varchar(15),
    ALTER COLUMN nivel TYPE varchar(45)
-- inserts
INSERT INTO Curso VALUES('Computação Aplicada', 'Computação Aplicada - CAP, alinhada a tecnologia aeroespacial', 1, 4, '350:00:00', '90:00:00', 'pos-graduação stricto-sensu', 2, 2);
INSERT INTO Curso VALUES('Sensoriamento Remoto', 'Sensoriamento Remoto - SR, alinhada a tecnologia aeroespacial', 2, 4, '350:00:00', '90:00:00', 'pos-graduação stricto-sensu', 1, 2);


CREATE TABLE Disciplina (
nome varchar(150) not null,
codigo int not null unique,
descricao varchar(300),
carga_horaria timestamp,
n_professor int not null,
id_matricula int not null,
PRIMARY KEY(codigo,nome),
CONSTRAINT disciplinaprofessorfk
      FOREIGN KEY(n_professor) 
	  REFERENCES Professor (numero),
CONSTRAINT disciplinamatriculafk
      FOREIGN KEY(id_matricula) 
	  REFERENCES Matricula(id)
);
--inserts
INSERT INTO Disciplina VALUES('DB Geográficos', 1, 'Gerenciamento de banco de dados geográficos', '40:00:00',2,2);
INSERT INTO Disciplina VALUES('Metodologia de Pesquisas', 2, 'Metodologia de pesquisas cientificas para desenvolvimento de dissertação', '40:00:00',1,2);


CREATE TABLE Disciplina_Curso (
codigo_curso int not null,
codigo_disciplina int not null,
PRIMARY KEY(codigo_curso,codigo_disciplina),
CONSTRAINT cursodisciplinafk
      FOREIGN KEY(codigo_curso) 
	  REFERENCES Curso(numero),
CONSTRAINT disciplinacursofk
      FOREIGN KEY(codigo_disciplina) 
	  REFERENCES Disciplina(codigo)
);
-- alter table
ALTER TABLE disciplina_curso DROP CONSTRAINT disciplina_curso_pkey;

ALTER TABLE Disciplina_Curso
    add COLUMN id int not null

ALTER TABLE Disciplina_Curso ADD PRIMARY KEY (id);

INSERT INTO Disciplina_Curso VALUES(1,1,1);
INSERT INTO Disciplina_Curso VALUES(2,2,2);

-- ##################################################
-- EXERCICIO 03
CREATE TABLE Bairros (
id int not null,
nome  varchar(45),
limites polygon,
PRIMARY KEY(id)

);
-- INSERT
INSERT INTO Bairros VALUES(1, 'Vila TI');

CREATE TABLE escola (
id int not null,
nome varchar(60),
cnpj varchar(45),
endereco varchar(100),
cidade varchar(45),
estado char(2),
PRIMARY KEY(id)
);
-- INSERT
INSERT INTO escola VALUES(1, 'UNIVAP', '12121212121', 'Urbanova', 'SJC', 'SP');
INSERT INTO escola VALUES(2, 'IFSP - CJ', '12121212121', 'Abernessia', 'CJ', 'SP');

CREATE TABLE Curso (
id int not null,
nome varchar(45),
ementa varchar(300),
carga_horaria int,
escola_id int,
PRIMARY KEY(id),
CONSTRAINT cursoescolafk
      FOREIGN KEY(escola_id) 
	  REFERENCES Escola(id)
);
-- insert
INSERT INTO Curso VALUES(1, 'Vila TI');
INSERT INTO Curso VALUES(2, 'TADS', 'Analise e desenvolvimento de sistemas', 350,2);
INSERT INTO curso VALUES(3, 'Matemática', 'Matemática aplicada', 400,1);
INSERT INTO curso VALUES(4, 'Engenharia Química', 'Engenharia química industrial', 400,1);


CREATE TABLE Aluno (
id int not null,
CPF int not null,
RG varchar(45),
nome varchar(20),
endereco varchar(100),
cidade varchar(45),
estado char(2),

PRIMARY KEY(id)
);
-- insert 
INSERT INTO aluno VALUES(1, 12121212, '11111111111', 'Cesar', 'Rua A', 'SJC', 'SP');
INSERT INTO aluno VALUES(2, 12121222, '22222222', 'Augusto', 'Rua B', 'CJ', 'SP');

CREATE TABLE Matricula (
Aluno_id int not null,
Curso_id int not null,
Ano_matricula date not null,
nota numeric(4,2),
PRIMARY KEY(Aluno_id,Curso_id,Ano_matricula),
CONSTRAINT matriculaalunofk 
      FOREIGN KEY(Aluno_id) 
	  REFERENCES Aluno(id),
CONSTRAINT matriculacursofk
      FOREIGN KEY(Curso_id) 
	  REFERENCES Curso(id)

);
-- inserts
INSERT INTO Matricula VALUES(1, 1, '2021-01-01', 8.8);
INSERT INTO Matricula VALUES(2, 2, '2021-01-01', 9.0);
INSERT INTO Matricula VALUES(2, 3, '2021-01-01', 9.0);
INSERT INTO Matricula VALUES(2, 4, '2021-01-01', 9.0);
INSERT INTO Matricula VALUES(2, 1, '2021-01-01', 9.0);
-- função trigger exercicio 6 c - OK
CREATE FUNCTION trigger_function() 
    RETURNS TRIGGER LANGUAGE PLPGSQL    AS $$
    BEGIN
        IF (3 <= (SELECT COUNT(*) from Matricula where Aluno_id = NEW.Aluno_id AND Ano_matricula = NEW.Ano_matricula)) THEN
        RAISE EXCEPTION 'Um aluno não pode se matricular em mais do que 3 cursos em um mesmo ano';
    ELSE
        RETURN NEW;
    END IF;
END $$;

CREATE TRIGGER matricula_trigger BEFORE INSERT OR UPDATE ON matricula
    FOR EACH ROW EXECUTE PROCEDURE trigger_function();


