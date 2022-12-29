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

