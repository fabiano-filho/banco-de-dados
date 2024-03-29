/* Modelagem Básica  */

/*
ENTIDADE -> TABELA
CAMPOS -> ATRIBUTOS
REGISTROS -> CONJUNTO DE ATRIBUTOS
*/

CLIENTE

NOME - CARACTERE(30)
CPF - NUMERICO(11)
EMAIL - CARACTERE(30)
TELEFONE - CARACTERE(30)
ENDERECO - CARACTERE(100)
SEXO - CARACTERE(1)

/* Processos de Modelagem */
/* Fase 1 e 2 - AD ADM DE BANCO DE DADOS */
MODELAGEM CONCEITUAL - Rascunho
MODELAGEM LÓGICA - Diagramas

/* Fase 3 - DBA / AD */
MODELAGEM FÍSICA - Scripts para o banco

/* INICIANDO MODELAGEM FISICA */
; -> DELIMITADOR

CREATE DATABASE PROJETO;

# SELECIONAR O BANCO

USE PROJETO;

# CRIANDO UMA TABELA 
CREATE TABLE [NOME DA TABELA] (
	[ATRIBUTOS] [TIPAGEM],
)
CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
	CPF INT(11),
	EMAIL VARCHAR(30),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),
	SEXO CHAR(1)
);

# VERIFICANDO AS TABELAS DO BANCO

SHOW TABLES;

# DESCOBRINDO A ESTRUTURA DE UMA TABELA
DESC [NOME DA TABELA]

# sintaxe basica de inserção - INSERT INTO TABELA...

FORMA 01 - OMITINDO AS COLUNAS

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

# FORMA 02 - COLOCANDO AS COLUNAS

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);


# FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL 

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);


# SELECAO, PROJECAO E JUNCAO

PROJECAO -> SELECT (COLUNAS)
SELECAO -> WHERE (LINHAS)
JUNCAO -> JOIN 


# EXERCÍCIO 1

CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS (
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);

INSERT INTO LIVROS(NOME, AUTOR, SEXO_AUTOR, QTD_PAGINAS, EDITORA, PRECO, UF_EDITORA, ANO_PUB) VALUES 
('Cavaleiro Real','Ana Claudia','F','465','Atlas',49.9,'RJ',2009),
('SQL para leigos','João Nunes','M','450','Addison',98,'SP',2018),
('Receitas Caseiras','Celia Tavares','F','210','Atlas',45,'RJ',2008),
('Pessoas Efetivas','Eduardo Santos','M','390','Beta',78.99,'RJ',2018),
('Habitos Saudáveis','Eduardo Santos','M','630','Beta',150.98,'RJ',2019),
('A Casa Marrom','Hermes Macedo','M','250','Bubba',60,'MG',2016),
('Estacio Querido','Geraldo Francisco','M','310','Insignia',100,'ES',2015),
('Pra sempre amigas','Leda Silva','F','510','Insignia',78.98,'ES',2011),
('Copas Inesqueciveis','Marco Alcantara','M','200','Larson',130.98,'RS',2018),
('O poder da mente','Clara Mafra','F','120','Continental',56.58,'SP',2017)


# Querys

# Trazer todos os dados
SELECT * FROM LIVROS

# Trazer o nome do livro e o nome da editora
SELECT LIVRO, EDITORA FROM LIVROS

# Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino
SELECT 	LIVRO,
		UF
FROM LIVROS
WHERE SEXO = 'M';

# Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino
SELECT LIVRO, PAGINAS FROM LIVROS
WHERE SEXO = 'F';

# Trazer os valores dos livros das editoras de São Paulo
SELECT LIVRO, VALOR FROM LIVROS WHERE UF = 'SP'

# Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio)
SELECT 	AUTOR, 
		SEXO
FROM LIVROS 
WHERE SEXO = 'M' AND (UF = 'SP' OR UF = 'RJ');


/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/

/* OR - OU */

SHOW DATABASES;

USE PROJETO;

SELECT * FROM CLIENTE;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE
SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E */

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES
LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) AS "Quantidade de Registros da Tab. Cliente"
 FROM CLIENTE;

/* OPERADOR GROUP BY */

# Soma/conta uma coluna e agrupa por outra

SELECT SEXO, COUNT(*)
FROM CLIENTE;

SELECT * FROM CLIENTE;

SELECT SEXO, COUNT(*) "Quantidade", 
FROM CLIENTE
GROUP BY SEXO;


# Performace em operadores lógicos

/* 1 MILHAO DE REGISTROS



PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU / OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';


*/



/* Exercício 2 - performace */
create database exercicio;

use exercicio;

create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );

  
SELECT COUNT(*) FROM FUNCIONARIOS;

-- Traga os funcionarios que trabalham no departamento de filmes ou de roupas
-- Verificando qnt de func. por departamento
SELECT 	DEPARTAMENTO,
		COUNT(*)
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 2;

-- Filmes - 21, Roupas - 53
-- Devido a qtd de funcionarios em roupas ser maior, o where começa com esse departamento.
SELECT 	idFuncionario,
		nome,
		email,
		departamento
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'ROUPAS' OR DEPARTAMENTO = 'FILMES';


-- O gestor de marketing pediu a lista das funcionarias que trabalhem no departamento de filmes ou no departamento lar. ele necessita enviar um email para as colaboradoras desses dois setores	

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
GROUP BY SEXO;

SELECT 	DEPARTAMENTO,
		COUNT(*)
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 2;

-- Feminino - 491, Filmes - 21
-- Por se tratar de and, a menor qtd de ocorrencias deve ser filtrada primeiro.
SELECT 	IDFUNCIONARIO,
		NOME,
		sexo,
		EMAIL,
		DEPARTAMENTO,
		CARGO
FROM FUNCIONARIOS
WHERE (DEPARTAMENTO = 'LAR' OR DEPARTAMENTO = 'FILMES') AND SEXO = 'FEMININO';


-- Traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim
SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
GROUP BY SEXO;

SELECT DEPARTAMENTO, COUNT(*)
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;


SELECT 	IDFUNCIONARIO,
		NOME,
		SEXO,
		DEPARTAMENTO
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino' OR DEPARTAMENTO = 'Jardim';



/* FILTRANDO VALORES NULOS */
-- Não pode utilizar o = pq não da para comparar um campo com vazio
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* Utilizando UPDATE para atualizar valores de uma tabela 
SINTAXE: 
UPDATE [TABELA] 
SET [ATRIBUTO QUE DESEJA ALTERAR] = [NOVO VALOR DO ATRIBUTO] 
WHERE [CONDICAO]
*/

-- DICA: NUNCA UTILIZE UPDATE E DELETE SEM WHERE

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM'
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'JORGE@EMAIL.COM'
WHERE NOME = 'JORGE';


/* DELETANDO REGISTROS COM A CLAUSULA DELETE */
DELETE FROM CLIENTE; -- DELETA TODOS OS REGISTROS DA TABELA

SELECT COUNT(*) FROM CLIENTE; -- 6
SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'ANA'; -- 1

-- DICA: UTILIZE O SELECT ANTES DE FAZER O DELETE
SELECT * FROM CLIENTE
WHERE NOME = 'ANA';

DELETE FROM CLIENTE
WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE;


/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

DROP TABLE ENDERECO, TELEFONE;

/* Endereco - Obrigatorio 
Cadastro de somente um

Telefone - Nao obrigatorio
cadastro de mais de um (opcional)
*/

/* FOREIGN KEY - CHAVE ESTRANGEIRA 
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

/* Inserindo dados na tabela CLIENTE */

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

/* Inserindo dados na tabela ENDERECO */

INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'BELO HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

SELECT NOME, CIDADE, COUNT(*) AS QTD_TELEFONE
FROM CLIENTE AS C, ENDERECO AS E, TELEFONE AS T
WHERE C.IDCLIENTE = E.ID_CLIENTE AND C.IDCLIENTE = T.ID_CLIENTE
GROUP BY NOME;

/* Inserindo dados na tabela TELEFONE */

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);


/* SELECAO, PROJECAO E JUNCAO */
/* PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA */
SELECT NOW();

/* SELECAO -> É UM FILTRO QUE RETORNA UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
   A CLAUSULA DE SELEÇÃO É O WHERE
*/
SELECT NOME, SEXO, EMAIL -- PROJECAO
FROM CLIENTE -- ORIGEM
WHERE SEXO = 'F'; -- SELECAO

/* JUNCAO -> JOIN. Unir duas ou mais tabelas */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;


/* NOME, SEXO, BAIRRO. CIDADE, TIPO, NUMERO */
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO /* projecao */
FROM CLIENTE C /* origem */
INNER JOIN ENDERECO E /* juncao */
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/*
	DML -> DATA MANIPULATION LANGUAGE
  	DDL -> DATA DEFINITION LANGUAGE
	DCL -> DATA CONTROL LANGUAGE
	TCL -> TRANSACTION CONTROL LANGUAGE
*/ 

-- DML - DATA MANIPULATION LANGUAGE
/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;


-- DDL - DATA DEFINITION LANGUAGE 

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */
/* CHANGE - ALTERANDO O NOME DE UMA COLUNA */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

/* MODIFY - ALTERANDO O TIPO DE UMA COLUNA */
ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO INT;

/* ADICIONANDO COLUNAS */
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* DELETANDO COLUNAS */
ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECÍFICA */
/* CLAUSULA AFTER PARA INSERIR DEPOIS DA COLUNA ESPECIFICADA */
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL 
AFTER VALOR_UNITARIO;

/* CLAUSULA FIRST PARA INSERIR NO INCIO */
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL 
FIRST;

/* EXERCÍCIOS DML */
/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CEL','44522578',21);

/* RELATÓRIO DE HOMENS */
DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

SELECT  C.NOME, C.SEXO, C.EMAIL, C.CPF,
		E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO,
		T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

/*
	6, 7, 12, 13, 14, 18, 19
*/

/* CORRINDO SEXO DE CLIENTES FEMININAS */
/* DICA: ANTES DE EXECUTAR O UPDATE, REALIZAR UM SELECT PARA CONFIRMAR AS INFORMAÇÕES */
SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (6, 7, 12, 13, 14, 18, 19);

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (6, 7, 12, 13, 14, 18, 19);

/* CORRINDO SEXO DE CLIENTES MASCULINOS */
UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 16;



/* RELATÓRIO DE MULHERES */
SELECT  C.NOME, C.SEXO, C.EMAIL, C.CPF,
		E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO,
		T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

/* QUANTIDADE DE HOMENS E MULHERES */
SELECT SEXO, COUNT(*) 'QTD'
FROM CLIENTE
GROUP BY SEXO;

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND E.BAIRRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO'
AND T.TIPO != 'CEL';

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
SELECT C.NOME, C.EMAIL, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'RJ' AND T.TIPO = 'CEL'; 

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR, T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND E.ESTADO = 'SP' AND T.TIPO = 'CEL';


/* FUNÇÕES */
SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************') AS "E-MAIL", 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


/* VIEWS */
/* VIEW -> UM PONTEIRO QUE APONTA PARA UMA QUERY NO BANCO DE DADOS */
CREATE VIEW VW_RELATORIO AS 
SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************') AS "E-MAIL", 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


/* PARA VISUALIZAR AS VIEWS NO MYSQL BASTA USAR O COMANDO SHOW TABLES;*/

/* DELETANDO UMA VIEW */  
-- DROP VIEW [NOME DA VIEW ]

/* OPERAÇÕES DML NAS VIEWS - INSERT, UPDATE E DELETE */ 
/* OPERAÇÕES DML EM UMA VIEW REFLETEM DIRETAMENTE NA TABELA FISICA */

/* EM VIEWS QUE POSSUEM JOIN, NÃO É PERMITIDO REALIZAR DELETE E INSERT */

INSERT INTO VW_RELATORIO VALUES ('ANDREIA', 'F', 'ANDREIA@UOL.COM.BR', 'CEL', '873547864', 'CENTRO', 'VITORIA', 'ES');


/* ORDENANDO DADOS */

CREATE TABLE ALUNOS(
	NUMERO INT, 
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS
ORDER BY 1, 2;

/* MESCLANDO ORDER BY COM PROJECAO */
-- SE DIGITAR O INDICE ELE NAO BATE COM A PROJECAO, CASO Q QNTD DE COLUNA SEJA MENOR QUE A QTD DE INDICE
SELECT NOME FROM ALUNOS
ORDER BY 1, 2;

-- SE DIGITAR O NOME DAS COLUNAS ELE CONSEGUE ORDENAR
SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;

/* ORDER BY DESC / ASC */
-- ASC É UTILIZADO POR PADRAO NO ORDER BY
 SELECT * FROM ALUNOS
 ORDER BY 1 DESC, 2 DESC;
 
 /* Delimitador */

SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1

STATUS

DELIMITER $

SELECT * FROM V_RELATORIO;

DELIMITER  @

DELIMITER@

DELIMITER @ @

DELIMITER ;

/* STORED PROCEDURES */

SELECT 'MAFRA';

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN

	QUALQUER PROGRAMACAO;

END
$


DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

/* CHAMANDO UMA PROCEDURE */


CALL NOME_EMPRESA()$

DELIMITER ;

CALL NOME_EMPRESA();

/* PROCEDURES COM PARAMETROS */

SELECT 10 + 10 AS CONTA;

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN
	
	SELECT 10 + 10 AS CONTA;

END
$

CALL CONTA();

DROP PROCEDURE CONTA;

DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	
	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$

CALL CONTA(100,50)$
CALL CONTA(345634,4354)$
CALL CONTA(55654,56760)$
CALL CONTA(45646,6766)$

/* PROCEDURES */

USE DATABASE PROJETO;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

DELIMITER #
STATUS 

CREATE PROCEDURE SP_CAD_CURSO(NOME VARCHAR(30), HORAS INT(3), VALOR FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS VALUES (NULL, NOME, HORAS, VALOR);
END
#

DELIMITER ;

CALL SP_CAD_CURSO('JAVA', 30, 500.00);
CALL SP_CAD_CURSO('FUNDAMENTOS DE BANCOS DE DADOS', 40, 700.00);
CALL SP_CAD_CURSO('BI SQL SERVER', 35, 3000.00);
CALL SP_CAD_CURSO('POWER BI', 20, 1000.00);
CALL SP_CAD_CURSO('TABLEAU', 30, 1200.00);


/* CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS */

DELIMITER #

CREATE PROCEDURE SP_CONSULTA_CURSO(CURSO VARCHAR(30))
BEGIN
	SELECT * FROM CURSOS
	WHERE NOME LIKE CONCAT(CONCAT('%', CURSO),  '%');
END
#

DELIMITER ;

+---------+--------------------------------+-------+---------+
| IDCURSO | NOME                           | HORAS | VALOR   |
+---------+--------------------------------+-------+---------+
|       1 | JAVA                           |    30 |  500.00 |
|       2 | FUNDAMENTOS DE BANCOS DE DADOS |    40 |  700.00 |
|       3 | BI SQL SERVER                  |    35 | 3000.00 |
|       4 | POWER BI                       |    20 | 1000.00 |
|       5 | TABLEAU                        |    30 | 1200.00 |
+---------+--------------------------------+-------+---------+

CALL SP_CONSULTA_CURSO('BANCO');
CALL SP_CONSULTA_CURSO('BI');

/* FUNCOES DE AGREGACAO NUMERICA */

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);

/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV FROM VENDEDORES;

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */

SELECT MIN(FEVEREIRO) AS MIN_FEV FROM VENDEDORES;

/* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA */

SELECT AVG(FEVEREIRO) AS MEDIA_FEV FROM VENDEDORES;

/* VARIAS FUNCOES */
SELECT 	MAX(JANEIRO) AS MAIOR_JAN,
		MIN(JANEIRO) AS MIN_JAN,
		AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

/* TRUNCATE */
-- TRUNCATE(NUMERO, NUMERO DE CASAS);

SELECT 	MAX(JANEIRO) AS MAIOR_JAN,
		MIN(JANEIRO) AS MIN_JAN,
		TRUNCATE(AVG(JANEIRO), 2) AS MEDIA_JAN
FROM VENDEDORES;


/* AGREGACAO COM SUM() */
/* SOMA TODOS OS VALORES DE UMA COLUNA */
SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO
ORDER BY 2;

/* SUBQUERIES - UTILIZAR QUANDO O RESULTADO DE UMA QUERY DEPENDE DO RESULTADO DE OUTRA QUERY */
/* VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME */

SELECT NOME, MARCO AS MIN_MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

/* VENDEDOR QUE VENDEU MAIS EM MARCO E O SEU NOME */

SELECT NOME, MARCO AS MAX_MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

/* VENDEDOR QUE VENDEU MAIS QUE A MEDIA DE FEVEREIRO EM FEV */
SELECT NOME, FEVEREIRO
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

/* VENDEDOR QUE VENDEU MENOS QUE A MEDIA DE FEVEREIRO EM FEV */
SELECT NOME, FEVEREIRO
FROM VENDEDORES
WHERE FEVEREIRO < (SELECT AVG(FEVEREIRO) FROM VENDEDORES);


/* OPERACOES EM LINHA */

SELECT * FROM VENDEDORES;

SELECT NOME,
       JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO + FEVEREIRO + MARCO) AS 'TOTAL',
	   TRUNCATE((JANEIRO + FEVEREIRO + MARCO) / 3, 2) AS 'MEDIA'
FROM VENDEDORES
ORDER BY 6;

/* APLICANDO UM DESCONTO */
SELECT NOME,
       JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO + FEVEREIRO + MARCO) AS 'TOTAL',
	   (JANEIRO + FEVEREIRO + MARCO) * .25 AS 'DESCONTO',
	   TRUNCATE((JANEIRO + FEVEREIRO + MARCO) / 3, 2) AS 'MEDIA'
FROM VENDEDORES
ORDER BY 6;


/* A33 - ALTERANDO TABELAS */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT
);

--ADICIONANDO UMA PK
ALTER TABLE TABELA 
ADD PRIMARY KEY (COLUNA1);

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE TABELA 
ADD COLUNA varchar(30);

ALTER TABLE TABELA 
ADD COLUNA100 INT;

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

--MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE TABELA
 MODIFY COLUNA2 DATE NOT NULL;
 
ALTER TABLE TABELA 
CHANGE MODIFICADA COLUNA1 VARCHAR(30);

ALTER TABLE TABELA 
MODIFY COLUNA1 INT PRIMARY KEY AUTO_INCREMENT;

--RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;

/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

/* ORGANIZANDO CHAVES */

SHOW TABLES;

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE
ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE
ADD CONSTRAINT PK_TELEFONE
PRIMARY KEY(IDTELEFONE);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/* DICIONARIO DE DADOS */

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT  CONSTRAINT_SCHEMA AS "BANCO",
		TABLE_NAME AS "TABELA",
		CONSTRAINT_NAME AS "NOME DA REGRA", 
		CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = "COMERCIO";

/* APAGANDO CONSTRAINTS */

USE COMERCIO
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

/* ACOES DE CONSTRAINTS */

INSERT INTO CLIENTE VALUES(1, 'FABIANO FILHO');
INSERT INTO CLIENTE VALUES(2, 'JOSE COSTA');

INSERT INTO TELEFONE VALUES(1, 'CEL', '91999229', 1);
INSERT INTO TELEFONE VALUES(2, 'RES', '91999229', 1);
INSERT INTO TELEFONE VALUES(3, 'CEL', '09090900', 2);
INSERT INTO TELEFONE VALUES(4, 'CEL', '09090900', 5);

SELECT ID_CLIENTE
FROM TELEFONE
WHERE ID_CLIENTE NOT IN (SELECT ID_CLIENTE FROM CLIENTE CROSS JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE);

DELETE FROM TELEFONE
WHERE ID_CLIENTE = 5;

DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

/* EXERCICIO SISTEMA DO SEU JOSE */

CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	ID_CARRO INT UNIQUE,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('F', 'M') NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('CEL', 'RES', 'COM') NOT NULL,
	NUMERO VARCHAR(11) NOT NULL,
	ID_CLIENTE INT
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	ID_MARCA INT,
	PLACA VARCHAR(30) NOT NULL UNIQUE,
	MODELO VARCHAR(30) NOT NULL
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE CARRO_COR(
	ID_COR INT,
	ID_CARRO INT,
	PRIMARY KEY(ID_CARRO, ID_COR)
);

/* CONSTRAINTS */
ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARROCOR_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARROCOR_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);


INSERT INTO MARCA VALUES(NULL, 'TOYOTA'),
                        (NULL, 'CHEVROLET'),
						(NULL, 'AUDI'),
						(NULL, 'BMW'),
						(NULL, 'FORD'),
						(NULL, 'VOLKSWAGEN'),
						(NULL, 'FIAT');

INSERT INTO COR VALUES(NULL, 'AMARELO'),
				      (NULL, 'VERMELHO'),
					  (NULL, 'PRETO'),
					  (NULL, 'AZUL'),
					  (NULL, 'ROXO'),
					  (NULL, 'VERDE'),
					  (NULL, 'CINZA'),
					  (NULL, 'LARANJA');
						
INSERT INTO CARRO VALUES(NULL, 1, 'BRASI01', 'COROLLA'),
						(NULL, 2, 'BRASIO2', 'ONIX'),
						(NULL, 3, 'BRASI03', 'AUDI A5'),
						(NULL, 4, 'BRASI04', 'BMW X6'),
						(NULL, 5, 'BRASI05', 'RANGER'),
						(NULL, 6, 'BRASI06', 'T-CROSS'),
						(NULL, 7, 'BRASI07', 'UNO'),
						(NULL, 1, 'BRASI08', 'YARIS'),
						(NULL, 2, 'BRASI09', 'HILUX'),
						(NULL, 3, 'BRASI10', 'RS E-TRON GT');
						
						
INSERT INTO CARRO_COR VALUES(1, 1),
							(2, 2),
							(3, 3),
							(4, 4),
							(5, 5),
							(6, 6),
							(7, 7),
							(8, 8),
							(2, 9),
							(1, 10),
							(3, 1);

						
						
INSERT INTO CLIENTE VALUES(NULL, 1, 'FABIANO', 'M'),
						  (NULL, 2, 'RUAN', 'M'),
						  (NULL, 3, 'RAYANA', 'F'),
						  (NULL, 4, 'MATEUS', 'M'),
						  (NULL, 5, 'KAROL', 'F'),
						  (NULL, 6, 'JHONY', 'M'),
						  (NULL, 7, 'CARLA', 'F'),
						  (NULL, 8, 'KLARA', 'F'),
						  (NULL, 9, 'GUSTAVO', 'M'),
						  (NULL, 10, 'IARA', 'F');

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '99999999991', 1),
						   (NULL, 'CEL', '99999999992', 2),
						   (NULL, 'CEL', '99999999993', 3),
						   (NULL, 'CEL', '99999999994', 4),
						   (NULL, 'CEL', '99999999995', 5),
						   (NULL, 'CEL', '99999999996', 6),
						   (NULL, 'CEL', '99999999997', 7),
						   (NULL, 'CEL', '99999999998', 8),
						   (NULL, 'CEL', '99999999999', 9),
						   (NULL, 'CEL', '99999999910', 10);
						  




/* TRIGGERS */ 

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM

CREATE DATABASE AULA40;
USE AULA40;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(30)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER */

DELIMITER #

CREATE TRIGGER TG_BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN 
	INSERT INTO BKP_USUARIO VALUES
	(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
END
#

INSERT INTO USUARIO VALUES(NULL,'ANDRADE','ANDRADE2009','HEXACAMPEAO');

SELECT * FROM USUARIO;

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

SELECT * FROM BKP_USUARIO;

/* A 41 - COMUNICACAO ENTRE BANCOS */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

STATUS

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA;

STATUS

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUT
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,
	NEW.NOME,NEW.VALOR);

END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,
	OLD.NOME,OLD.VALOR);

END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

DROP TRIGGER BACKUP_PRODUT;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,
	NEW.NOME,NEW.VALOR);

END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO C#',100.00);


SELECT * FROM PRODUTO;
SELECT * FROM BACKUP.BKP_PRODUTO;

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_PRODUTO_DEL;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,
	OLD.NOME,OLD.VALOR,'D');

END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;

/* A 43 - TRIGGER DE AUDITORIA */

DELIMITER ;

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);

/*QUANDO*/
SELECT NOW();
/*QUEM*/
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
	
);

USE LOJA;

SELECT * FROM PRODUTO;

DELIMITER $

CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,
	OLD.VALOR,NEW.VALOR,NOW(),CURRENT_USER(),'U');
	
END
$

DELIMITER ;

UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

/* A44 - AUTORELACIONAMENTO */

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

-- INSERT INTO CURSOS(1, 'SEM PRE REQ', 0, 0.0, NULL);

INSERT INTO CURSOS VALUES
(NULL, 'BD RELACIONAL', 20, 400.0, NULL),
(NULL, 'BUSINESS INTELLIGENCE', 40, 800.0, 1),
(NULL, 'RELATORIOS AVANCADOS', 20, 400.0, 2),
(NULL, 'LÓGICA DE PROGRAMACAO', 20, 400.0, NULL),
(NULL, 'PYTHON', 20, 400.0, 4);

SELECT * FROM CURSOS;

SELECT 	C.NOME AS CURSO, 
		C.VALOR AS VALOR, 
		C.HORAS AS CARGA,		
		IFNULL(R.NOME, 'SEM PRE REQUISITO') AS "PRE REQUISITO"
FROM CURSOS C
INNER JOIN CURSOS R
ON R.IDCURSO = C.ID_PREREQ;

SELECT 	C.NOME AS CURSO, 
		C.VALOR AS VALOR, 
		C.HORAS AS CARGA,		
		IFNULL(R.NOME, '-----') AS "PRE REQUISITO"
FROM CURSOS C LEFT JOIN CURSOS R
ON R.IDCURSO = C.ID_PREREQ;

-- LEFT JOIN PEGA TODOS OS REGISTROS DA TABELA ESQUERDA QUE POSSUEM OU NAO UM PRE REQ
-- INNER JOIN PEGA TODOS OS REQUISITOS QUE ESTAO NA INTERCEÇÃO DOS CONJUNTOS

/* CURSORES */

CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT, 
	MAR INT
);

INSERT INTO VENDEDORES VALUES
(NULL, 'MAFRA', 32432, 322425, 34245),
(NULL, 'FABIANO', 392939, 2239943, 2394950),
(NULL, 'JOAO', 84829429, 63467, 73344),
(NULL, 'LILIAN', 098840, 10847, 12324),
(NULL, 'ANTONIO', 02845, 4231, 450),
(NULL, 'GLORIA', 1214, 097473, 234413);

SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR)/3 AS MEDIA FROM VENDEDORES; -- DEPENDENDO DO TAMANHO DO BANCO ESTA OPERAÇÃO DEMANDA MT PROCESSAMENTO

CREATE TABLE VENDA_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT, 
	MAR INT,
	TOTAL INT,
	MEDIA FLOAT
);

DELIMITER $

CREATE PROCEDURE SP_INSERE_DADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VJAN, VFEV, VMAR, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);
	
	DECLARE REGISTRO CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES;
	);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
	
	OPEN REGISTRO; -- ABRE O CURSOR NA MEMORIA RAM PARA PERMITIR ALTERAÇÕES A CADA REGISTRO
	
	REPEAT -- LOOP
		-- CONSULTA PROXIMO REGISTRO
		FETCH REGISTRO INTO VNOME, VJAN, VFEV, VMAR; -- GUARDA RESULTADO DO CURSOR NAS VARIAVEIS
		IF NOT FIM THEN -- SE A VARIAVEL FIM FOR FALSA, CONTINUE
			
			SET VTOTAL = VJAN + VFEV + VMAR;
			SET VMEDIA = VTOTAL / 3;
			
			INSERT INTO VENDA_TOTAL VALUES(VNOME, VJAN, VFEV, VMAR, VTOTAL, VMEDIA);
		END IF;
	UNTIL FIM END REPEAT;
	
	CLOSE REGISTRO; -- FECHA CURSOR E DESALOCA DA MEMORIA RAM
END
$

DELIMITER ;

CALL SP_INSERE_DADOS();

DROP PROCEDURE SP_INSERE_DADOS
