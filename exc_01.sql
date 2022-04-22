create database exemplo;

use exemplo;

create table funcionario (
	codigo int auto_increment primary key, 
    primeiro_nome varchar(10), 
    segundo_nome varchar(10),
    ultimo_nome varchar(10), 
    data_nascimento date, 
    cpf varchar(11), 
    rg varchar(11), 
    endereco varchar(40), 
    cep varchar(8), 
    cidade varchar(20), 
    fone varchar(11), 
    cod_departamento int, 
    funcao varchar(10), 
    salario real
);

create table departamento (
	cod_dp int auto_increment primary key, 
    nome varchar(15), 
    localização varchar(20), 
    cod_func_ger int, 
    foreign key (cod_func_ger) references funcionario (codigo) 
);

#inserindo dados na tabela funcionario
insert into funcionario (primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, cpf, rg, endereco, cep, cidade, fone, cod_departamento, funcao, salario)
values ('jose','neto','souza','1990/02/10','11122233355','mg123456789','rua a','31180774','bh','3199998888',1,'Gerente',10000);
insert into funcionario (primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, cpf, rg, endereco, cep, cidade, fone, cod_departamento, funcao, salario) 
values 
('Maria','neto','souza','1989/02/10','11122233366','mg123456790','rua a','31180774','bh','3199998899',1,'Analista',8700);
insert into funcionario (primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, cpf, rg, endereco, cep, cidade, fone, cod_departamento, funcao, salario) 
values 
('Gael','Souza','pereira','1990/08/10','11144455587','mg123456896','rua c','31180850','rj','3199997744',2,'RH',7400);
insert into funcionario (primeiro_nome, segundo_nome, ultimo_nome, data_nascimento, cpf, rg, endereco, cep, cidade, fone, cod_departamento, funcao, salario) 
values 
('Josefina','Souza','pereira','1975/08/10','11144455741','mg445456896','rua b','31180874','sp','31745466',3,'Engenharia',12000);

#inserindo dados na tabela departamento
insert into departamento (nome, localização, cod_func_ger) 
values ('operacao', 'bh', 1);
insert into departamento (nome, localização, cod_func_ger) 
values ('filial', 'rj', 3);
insert into departamento (nome, localização, cod_func_ger) 
values ('rh', 'sp', 4);

#1 - Listar nome e sobrenome ordenado por sobrenome
select primeiro_nome, ultimo_nome from funcionario
order by primeiro_nome desc;

#2 - Listar todos os campos de funcionários 
select * from funcionario
order by cidade;

#3 - Liste os funcionários que têm salário superior a R$8.000,00 ordenados pelo nome completo
select * from funcionario
where salario > 80000
order by primeiro_nome, segundo_nome, ultimo_nome;

#4 - Liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho
select primeiro_nome, data_nascimento from funcionario order by data_nascimento desc;

#5 - Lsite os funcionários com uma listagem telefônica
select primeiro_nome, segundo_nome, ultimo_nome, fone
from funcionario
order by primeiro_nome, segundo_nome, ultimo_nome;

#6 - Liste o total da folha de pagamento
select sum(salario) as total
from funcionario;

#7 - Liste o nome, o nome do departamento e a função de todos os funcionários
select f.primeiro_nome, d.nome, f.funcao
from funcionario f join departamento d
on f.codigo = d.cod_dp
order by f.primeiro_nome;

#8 - Liste todos departamentos com seus respectivos gerentes
select d.nome, d.cod_func_ger, f.codigo, f.primeiro_nome 
from departamento d join funcionario f
on f.codigo = d.cod_func_ger;

#9 - Liste o valor da folha de pagamento de cada departamento (nome)
select d.nome, sum(f.salario) as total
from departamento d join funcionario f 
on f.cod_departamento = d.cod_dp
group by d.nome;

#10 - Liste os departamentos dos funcinários que tem a função de rh
select d.nome, f.primeiro_nome
from departamento d join funcionario f 
on d.cod_dp = f.cod_departamento
where f.funcao='rh'
order by d.nome;

#11 - Liste a quantidade de funcionários desta empresa
select count(*) as total_func
from funcionario;

#12 - Liste o salário médio pela empresa
select avg(salario) as media
from funcionario;

#13 - Liste o menor salário pago pela empresa em cada departamento
select d.nome, min(f.salario) as minino
from funcionario f join departamento d 
on f.cod_departamento = d.cod_dp
group by d.nome;

#14 Liste o nome do departamento e do funcionário
select d.nome, f.primeiro_nome
from departamento d join funcionario f 
on f.cod_departamento = d.cod_dp
order by d.nome;


