CREATE DATABASE detran;
use detran;

create table cliente (
	cpf varchar(11) PRIMARY KEY,
    nome varchar(60),
    dtNasc date
);

create table modelo (
	codMod int PRIMARY KEY,
    Desc_2 varchar(40)
);

create table Patio (
	num int PRIMARY KEY,
    ender varchar(40),
    capacidade int
);

create table veiculo (
	placa varchar(8) PRIMARY KEY,
    Modelo_codMod int,
    Clinte_cpf varchar(11),
    cor varchar(20),
    foreign key(Modelo_codMod) references Modelo(codMod),
    foreign key(Clinte_cpf) references Cliente(cpf)
);

create table estaciona (
	cod int PRIMARY KEY,
    Patio_num int,
    Veiculo_placa varchar(10),
    dtEntrada date,
    dtSaida date,
    hsEntrada time,
    hsSaida time,
    foreign key(Patio_num) references Patio(num),
    foreign key(Veiculo_placa) references Veiculo(placa)
);

insert into cliente(cpf, nome, dtNasc)
values
('1112223331','Renata Sorrah','1993-01-01'),
('2223334442','Raquel Maria','1998-03-01'),
('3334445553','Yuri Maciel','2013-05-01'),
('4445556664','Carlos Drumond','2002-04-01'),
('5556667775','Mateus Solano','1920-12-01'),
('6667778886','Filipe Neto','1994-07-01'),
('7778889997','Matheus Felipe','2022-03-01');

insert into modelo(codMod, Desc_2)
values
('111','Fiat Palio'),
('222','Fiat Uno'),
('333','BMW X6'),
('444','Audi R6'),
('555','BMW I8'),
('666','Audi R8'),
('777','Chevrolet Prisma');

insert into patio(num, ender, capacidade)
values
(1111,'Rua A',15),
(2222,'Rua B',5),
(3333,'Rua C',16),
(4444,'Rua D',17),
(5555,'Rua E',14),
(6666,'Rua F',11),
(7777,'Rua G',16);

insert into veiculo(placa, Modelo_codMod, Clinte_cpf, cor)
values
('NEJ3372','111','1112223331','Branco'),
('NEZ9105','222','2223334442','Cinza'),
('HMA0178','333','3334445553','Amarelo'),
('MMS9519','444','4445556664','Vermelho'),
('KAD5286','555','5556667775','Preto'),
('HXX2126','666','6667778886','Ouro'),
('HTE0388','777','7778889997','Verde');

truncate table veiculo;

insert into estaciona(cod, Patio_num, Veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida)
values
('321','1111','NEJ3372','2022-03-15','2022-03-16','11:15','10:50'),
('123','2222','NEZ9105','2022-08-20','2022-08-30','13:17','12:15'),
('741','3333','HMA0178','2022-05-15','2022-05-20',':17:06','13:40'),
('852','4444','MMS9519','2022-02-19','2022-02-28','14:20','14:45'),
('963','5555','KAD5286','2022-07-16','2022-07-28','16:35','18:30'),
('789','6666','HXX2126','2022-09-30','2022-10-05','20:43','15:14'),
('456','7777','HTE0388','2022-12-04','2022-12-12','22:30','21:20');

alter table veiculo
add column ano date;

alter table veiculo
drop column ano;

truncate table veiculo;

insert into veiculo(placa, Modelo_codMod, Clinte_cpf, cor, ano)
values
('NEJ3372','111','1112223331','Branco','2000-10-15'),
('NEZ9105','222','2223334442','Cinza','2001-11-25'),
('HMA0178','333','3334445553','Amarelo','2003-04-04'),
('MMS9519','444','4445556664','Vermelho','2004-05-07'),
('KAD5286','555','5556667775','Preto','2005-06-12'),
('HXX2126','666','6667778886','Ouro','2006-05-10'),
('HTE0388','777','7778889997','Verde','2007-04-12');

### RESPOSTAS ###

#1
select v.placa, c.nome
from veiculo v inner join cliente c
on v.Clinte_cpf = c.cpf;

#2
select c.cpf, c.nome, v.placa
from cliente c join veiculo v
on v.Clinte_cpf = c.cpf
where v.placa = 'MMS9519';

#3
select v.placa, v.cor, v.Modelo_codMod
from veiculo v inner join modelo m
on v.Modelo_codMod = m.codMod
where m.codMod = '111';

#4
select v.placa, v.ano, p.num
from veiculo v inner join estaciona e join patio p
on e.Patio_num = p.num
on v.placa = e.Veiculo_placa
where e.Patio_num = '1111';

#5
select v.placa, v.ano, m.Desc_2
from veiculo v inner join modelo m 
on v.Modelo_codMod = m.codMod
where v.ano >= 2000;

#6
select p.ender, e.dtEntrada, e.dtSaida, e.Veiculo_placa
from patio p join estaciona e
on  p.num = e.Patio_num
where e.Veiculo_placa = 'KAD5286';

#7
select count(v.cor) "Qtd. Carros"
from veiculo v
where v.cor = 'Verde';

#8
select c.nome, c.cpf, m.codMod, m.Desc_2
from cliente c inner join modelo m join veiculo v
on m.codMod = v.Modelo_codMod
on v.Clinte_cpf = c.cpf
where m.codMod = 111;

#9
select v.placa, e.dtEntrada, e.dtSaida, v.cor
from veiculo v inner join estaciona e 
on e.Veiculo_placa = v.placa
where v.cor = 'Verde';

#10
select v.placa, e.dtEntrada, hsEntrada, e.dtSaida, hsSaida
from veiculo v join estaciona e
on  e.Veiculo_placa = v.placa
where e.Veiculo_placa = 'MMS9519';

#11
select c.nome, m.codMod, m.Desc_2
from cliente c inner join modelo m join veiculo v
on m.codMod = v.Modelo_codMod
on v.Clinte_cpf = c.cpf
where m.codMod = 222;

#12
select c.nome, c.cpf, m.codMod
from cliente c inner join modelo m join veiculo v
on m.codMod = v.Modelo_codMod
on v.Clinte_cpf = c.cpf
where m.codMod = 333;

#13
select m.codMod, m.Desc_2
from cliente c inner join modelo m join veiculo v
on m.codMod = v.Modelo_codMod
on v.Clinte_cpf = c.cpf
where m.codMod = 222;

#14
select c.nome, m.Desc_2
from cliente c inner join modelo m join veiculo v
on m.codMod = v.Modelo_codMod
on v.Clinte_cpf = c.cpf
order by c.nome;
