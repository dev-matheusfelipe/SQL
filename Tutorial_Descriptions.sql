#COMANDOS DDL - DATA DEFINITION LANGUAGE: CREATE DATABASE  / CREATE TABLE / ALTER TABLE / DROP TABLE
#COMANDOS DML - DATA MANIPULATION LANGUAGE: INSERT INTO / UPDATE / DELETE / TRUNCATE
#COMANDOS DQL - DATA QUERY LANGGUAGE: SELECT

#CRIANDO UM BANCO DE DADOS NOVO.
create database cadastro;

#CRIANDO UM BANCO DE DADOS COM CONSTRAINTS. /*OBS: ESSA CONFIGURAÇÃO É VOLTADA PARA O PADRÃO DO BRASIL POR CAUSA DA ACENTUAÇÕES.
create database cadastro
default character set utf8
default collate utf8_general_ci;

#COMANDO PARA USAR O BANCO DE DADOS. 
use cadastro;

#CRIANDO UMA TABELA "pessoas" DENTRO DO BANCO DE DADOS. 
create table pessoas (
	id int NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    nascimento date,
    sexo enum('M','F'),
    peso decimal(3,5),
    altura decimal(3,2),
    nacionalidade varchar(20) DEFAULT 'Brasil',
    PRIMARY KEY (id)
)DEFAULT CHARSET = ulf8;

#CRIANDO UMA TABELA "cursos" COM ALGUMAS DEFINIÇÕES. /*OBS: O COMANDO "if not exists" SÓ CRIA A TABELA SE CASO ELA NÃO EXISTIR.
create table if not exists cursos (
	nome varchar(30) NOT NULL UNIQUE,
    descricao text,
    carga int UNSIGNED,
    total_aulas int UNSIGNED,
    ano year DEFAULT '2022'
)DEFAULT CHARSET = ulf8;

#COMANDO PARA ADICIONAR UMA NOVA COLUNA E COLOCANDO ELA COMO CHAVE PRIMÁRIA. /*OBS: ESSE COMANDO ESTÁ ADICIONANDO UM "id_curso" NA PRIMEIRA POSIÇÃO DA TABELA "cursos".
alter table cursos
add column id_curso int FIRST;

alter table cursos
add PRIMARY KEY(id_curso);

#COMANDO PARA INSERIR DADOS EM UMA TABELA.
insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade)
values ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

#COMANDO PARA INSERIR DADOS EM UMA TABELA SIMPLIFICADO.
insert into pessoas values ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

#COMANDO PARA INSERIR VARIOS DADOS EM UMA TABELA.
insert into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade)
values 
(DEFAULT, 'Godofredo', '1984-01-02', 'M', '98.9', '1.43', 'Brasil'),
(DEFAULT, 'Pedro', '1974-03-02', 'M', '66.3', '1.33', 'EUA'),
(DEFAULT, 'Maria', '1963-05-12', 'F', '58.5', '1.43', 'Irlanda'),
(DEFAULT, 'Fernanda', '1950-08-08', 'F', '72.9', '1.83', DEFAULT);

#COMANDO PARA ADICIONAR UM CAMPO NA TABELA.
alter table pessoas
add column profissao varchar(10);

#COMANDO PARA APAGAR UMA COLUNA DA TABELA.
alter table pessoas
drop column profissao;

#COMANDO PARA APAGAR UMA TABELA.
drop table pessoas;
drop table if exists tests; #*OBS: ESSE COMANDO SÓ VAI APAGAR A TABELA SE O NOME DELA EXISTIR.

#COMANDO PARA ADICIONAR UM CAMPO EM UMA POSIÇÃO NA TABELA.
alter table pessoas
add column profissao varchar(10) after nome;

#COMANDO PARA ADICIONAR UM CAMPO NA  1º POSIÇÃO NA TABELA.
alter table pessoas
add column codigo int first;

#COMANDO PARA MODIFICAR A DEFINIÇÃO DE UM VARCHAR(EXEMPLO). - *OBS: NÃO PODE RENOMEAR USANDO ESSE COMANDO. 
alter table pessoas
modify column profrissao varchar(20) NOT NULL DEFAULT ''; #*OBS: ESSE "NOT NULL"  - ELIMINA A ESCRITA NULL DO CAMPO E O "DEFAULT ''" - DEIXA O CAMPO VAZIO. 

#COMANDO PARA RENOMEAR UMA COLUNA.
alter table pessoas
change column profissao prof varchar(20) NOT NULL DEFAULT ''; #*OBS: O "profissao" É O NOME ATUAL/EXISTENTE E "prof" É O NOVO NOME QUE VAI SER ALTERADO. / SE NÃO COLOCAR O "DEFAULT ''" ELE VOLTA A SER NULL.

#COMANDO PARA RENOMEAR UMA TABELA.
alter table pessoas
rename to gafanhotos;

#COMANDO PARA SELECIONAR TODA A TABELA "PESSOAS".
select * from pessoas;

#COMANDO PARA DESCREVER OU MOSTRAR A TABELA.
describe pessoas;
# OU
desc pessoas;

#COMANDO PARA MANIPULAR AS LINHAS /*OBS: ESSAS INFORMAÇÕES FORAM DIGITADAS PARA PODE FAZER A MANIPULAÇÃO.
insert into cursos values
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à linguagem Java','10','29','2000'),
('6','MySQL','Bancos de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10','YouTuber','Gerar polêmica e ganhar inscritos','5','2','2018');

#PARA MODIFICAR UMA LINHA INCORRETA BASTA USAR
update cursos
set nome = 'HTML5' #NOME NOVO QUE VAI SUBSTITUIR O ANTIGO.
where idcurso = '1'; #WHERE ESTÁ MODIFICANDO A LINHA 1 NA COLUNA 'idcurso' ONDE É A CHAVE PRIMARIA ONDE ESTAVA O 'HTML4'.

update cursos
set nome = 'PHP', ano = '2015' #É POSSIVEL ALTERAR AS INFORMAÇÕES DA LINHA TODA USANDO A , E NOME DA COLUNA QUE DESEJA ALTERAR.
where idcurso = '4'; #WHERE ESTÁ MODIFICANDO A LINHA 4 NA COLUNA 'idcurso' ONDE É A CHAVE PRIMARIA ONDE ESTAVA O NOME ='PGP' E ANO ='2010'.

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = '5'
limit 1; #ESSE COMANDO 'LIMIT' É PARA LIMITAR O LIMITE DE QUANTAS LINHAS ELE PODE MODIFICAR.

#COMANDO PARA EXLUIR LINHAS
delete from cursos
where idcurso='8'; #ESSE COMANDO ELE VAI DELETAR A LINHA "8" DA TABELA /*OBS: MUITO CUIDADO COM ESSE COMANDO. 

delete from cursos
where ano='2018'; #ESSE COMANDO ELE VAI DELETAR TODOS AS LINHAS QUE ENCONTRAR O "ano 2018" /*OBS: MUITO CUIDADO COM ESSE COMANDO. 

delete from cursos
where ano='2018' 
limit 3; #ESSE COMANDO LIMITA DELETAR SOMENTE A 3 LINHAS COM "ano 2018" /*OBS: MUITO CUIDADO COM ESSE COMANDO - CASO O MySQL NÃO DEIXE APAGAR TEM QUE DESMARCAR O SAFE UPDATES NAS CONFIGURAÇÕES. 

#COMANDO PARA APAGAR TODAS AS LINHAS DA TABELA /*OBS: CUIDADO ESSE COMANDO DELETAAAA TUDO. SEM VOLTA!
truncate table cursos;

#COMANDO PARA APAGAR O BANCO DE DADOS /*OBS: CUIDADO ESSE COMANDO DELETAAAA TUDO. SEM VOLTA!
drop database cadastro;

#COMANDO PARA VISUALIZAR A COLUNA POR ORDEM CRESCENTE
select * from cursos
order by nome; #ORDEM CRESCENTE

select * from cursos
order by nome desc; #ORDEM DECRESCENTE

#COMANDO PARA SELECIONAR SOMENTE ALGUMAS COLUNAS
select nome, carga, ano from cursos
order by nome; #O COMANDO "order" ELE ORDENA EM ASCENDENTE A COLUNA - PODENDO COLOCAR MAIS DE UMA INFORMAÇÃO EXMPLO: "order by nome, ano;"

#COMANDO PARA SELECIONAR POR LINAS
select * from cursos
where ano = '2016' #AQUI ELE VAI MOSTRA SOMENTE AS LINHAS QUE TIVEREM O "2016"
order by nome;

select * from cursos
where ano <= '2015' #AQUI ELE VAI MOSTRA SOMENTE AS LINHAS QUE FOREM MENOR OU IGUAL A "2015"
order by nome; 

#TODOS OS OPERADORES RELACIONAIS ( < / > / <= / >= / != / = / <> /)

#COMANDO PARA SELECIONAR O NOME E ANO ENTRE 2010 E 2022 POR EXEMPLO.
select nome, ano from cursos
where ano between 2010 and 2016;

#COMANDO PARA SELECIONAR SOMENTE OS VALORES POR EXEMPLO 2014 E 2016.
select nome, descricao, ano from cursos
where ano in (2014, 2016)
order by ano;

#COMANDO ADICIONANDO A FOREIGN KEY
alter table gafanhotos
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select d.nome, f.primeiro_nome #Select seleciona a tabela 
from departamento d join funcionario f  #From aqui está buscando as 2 tabelas 
on f.cod_departamento = d.cod_dp #On valida as duas tabelas
order by d.nome; #Order by Ordena a tabela

