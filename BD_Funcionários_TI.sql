/*Criando o banco de dados */
create database func_ti;
use func_ti;

/*CRIANDO AS TABELAS INDIVIDUAIS DO BANCO DE DADOS*/
CREATE TABLE funcionarios ( 
	 id_func INT PRIMARY KEY AUTO_INCREMENT,  
	 id_cargo INT,  
	 id_escolaridade INT,  
	 id_vinculo INT,  
	 Nome VARCHAR(30) NOT NULL,  
	 nro_cpf VARCHAR(15) NOT NULL,  
	 registro INT,  
	 admissao DATE
 ); 
 
 CREATE TABLE cargo ( 
	 id_cargo INT PRIMARY KEY AUTO_INCREMENT,  
	 desc_cargo VARCHAR(30) NOT NULL,  
	 id_nivel_cargo INT,  
	 salario real NOT NULL
);

CREATE TABLE escolaridade ( 
	 id_escolaridade INT PRIMARY KEY AUTO_INCREMENT,  
	 desc_escolaridade VARCHAR(20) NOT NULL 
);

CREATE TABLE vinculo ( 
	 id_vinculo INT PRIMARY KEY AUTO_INCREMENT,  
	 desc_vinculo VARCHAR(20) NOT NULL 
);

CREATE TABLE nivel_cargo ( 
	 id_nivel_cargo INT PRIMARY KEY AUTO_INCREMENT,  
	 desc_nivel VARCHAR(20) NOT NULL 
);

/*DEFININDO AS CHAVES ESTRANGEIRAS DAS TABELAS*/
ALTER TABLE funcionarios ADD FOREIGN KEY(id_cargo) REFERENCES cargo (id_cargo);
ALTER TABLE funcionarios ADD FOREIGN KEY(id_escolaridade) REFERENCES escolaridade (id_escolaridade);
ALTER TABLE funcionarios ADD FOREIGN KEY(id_vinculo) REFERENCES vinculo (id_vinculo);
ALTER TABLE cargo ADD FOREIGN KEY(id_nivel_cargo) REFERENCES nivel_cargo (id_nivel_cargo);

/*POVOANDO AS TUPULAS DAS TABELAS*/
insert into escolaridade (id_escolaridade,desc_escolaridade) values ('1',"Médio");
insert into escolaridade (id_escolaridade,desc_escolaridade) values ('2',"Técnico");
insert into escolaridade (id_escolaridade,desc_escolaridade) values ('3',"Superior");
insert into escolaridade (id_escolaridade,desc_escolaridade) values ('4',"Especialização");

insert into nivel_cargo (id_nivel_cargo, desc_nivel) values (1,"Médio");
insert into nivel_cargo (id_nivel_cargo, desc_nivel) values (2,"Técnico");
insert into nivel_cargo (id_nivel_cargo, desc_nivel) values (3,"Superior");
insert into nivel_cargo (id_nivel_cargo, desc_nivel) values (4,"Sem nível");

insert into vinculo (id_vinculo, desc_vinculo) values (1,"Estagiário");
insert into vinculo (id_vinculo, desc_vinculo) values (2,"Celetista");
insert into vinculo (id_vinculo, desc_vinculo) values (3,"Contratado");
insert into vinculo (id_vinculo, desc_vinculo) values (4,"Terceirizado");
insert into vinculo (id_vinculo, desc_vinculo) values (5,"Estatutário");

insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (1,"Estagiário TI",4,420.3);
insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (2,"Estagiário ADS",4,650.8);
insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (3,"Técnico de Informática",2,2200);
insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (4,"Secretária",1,2100);
insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (5,"Gerente",3,5000);
insert into cargo (id_cargo,desc_cargo,id_nivel_cargo,salario) values (6,"Analista de Sistemas",3,3800);

insert into funcionarios (id_cargo,id_escolaridade,id_vinculo,Nome,nro_cpf,registro,admissao) 
values
(4,3,2,"Renata Sorrah","123456789-10",654,"1993-01-01"),
(3,1,5,"Raquel Maria Santiago","123656789-10",665,"1998-03-01"),
(3,1,4,"Yuri Maciel dos Anjos","123454869-10",684,"2013-05-01"),
(3,1,3,"Carlos Drumond de Andrade","121476789-10",154,"2002-04-01"),
(3,1,5,"Aécio Neves","123456963-10",254,"1920-12-01"),
(6,4,3,"Fernando Sabino ","124786789-10",354,"1994-07-01"),
(6,4,5,"Missilaine Angélica Meireles","123156789-10",854,"1999-08-01"),
(5,4,5,"Mateus Solano  ","123456369-10",754,"1997-06-01"),
(1,1,1,"Gabriel Medina ","123436489-10",454,"2022-03-01"),
(2,4,1,"Leonardo Lins Vieira","123951789-10",254,"2021-11-01"),
(3,4,5,"Filipe Neto","123336789-10",854,"2011-05-01"),
(1,4,1,"Matheus Felipe Amaral","123435789-10",354,"2022-02-01");
