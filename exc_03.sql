-- O objetivo desse arquivo é esclarecer as diferentes formas de uma tabela autorelacionada

-- Criação da database
create database petshop;
use petshop;

-- Criação da mesa que vamos usar para fazer o autorealacionamento
create table cliente(
idCliente int auto_increment primary key,
nomeCliente varchar(50) not null,
telFixo int,
telCelular int not null,
endereco varchar(200)
);

-- Selecionar para checar se está tudo certo
select * from cliente;
describe cliente;

-- As tabelas a seguir não são necessárias para o exercício de autorelacionamento, mas podem ser úteis caso deseje treinar relação entre tabelas
/*
create table raca(
idRaca int auto_increment primary key,
nomeRaca varchar(60),
ValorMedio decimal(6,2) check(ValorMedio > 0)
);


create table pet(
idPet int auto_increment primary key,
tipo varchar(50),
nomePet varchar(50),
dtNascimento date,
chip int(8) unique,
fkCliente int,
fkRaca int,
foreign key (fkCliente) references cliente(idCliente),
foreign key (fkRaca) references raca(idRaca)
)
auto_increment = 100
select * from pet;
describe pet;
*/

-- Vamos inserir alguns dados na tabela cliente
insert into cliente values
(null, 'Carlos', 39987555, 934000085, 'Rua dos amigos 797'),
(null, 'Robinho', 39887744, 978775511, 'Rua Alameda Almejante'),
(null, 'Camila', 78971123, 938475599, 'Rua Mágica dos Sonhos'), 
(null, 'Baum', 37795886, 377775555, 'Avenida Diversão Feliz'),
(null, 'Tonhão Silva', 37794556, 934343434, 'Rua Pelicano'),
(null, 'Marina Silva', 35543454, 93371454, 'Rua do Tititi'),
(Null, 'Roberto', 39978569, 978784545, 'Rua Rua Rua'),
(Null, 'Bolado', 37784568, 977548102, 'Avenida Paul Mendes');

-- Novamente, esses dados são desnecessários no momento
/*
insert into raca values
(null, 'persa', 500),
(null, 'olhos dourados', 800),
(null, 'lynx', 5000.50),
(null, 'laranja', 149.99),
(null, 'golden', 2000.45),
(null, 'vira-lata', null),
(null, 'husky', 4000),
(null, 'dobberman', 1500.80),
(null, 'russo', 1400.75),
(null, 'pincher', 400),
(null, 'galápagos', 7000),
(null, 'pato', 450),
(null, 'papagaio', 300),
(null, 'pinguim', 6000);

select * from raca;

 insert into pet (tipo, nomePet, dtNascimento, chip, fkCliente, fkRaca) values
 ('Cachorro', 'Xuxuzinho', 20191010,12365478, 2, 7),
 ('Tartaruga', 'Velocista', 19990910, 55668899, 4, 11),
 ('Gato', 'Psiu', 20150520, 78878879, 1, 1),
 ('Gato', 'Pizza', 20180712, 85581346, 1, 4),
 ('Gato', 'Cacholo', 20151220, 11770000, 4, 2),
 ('Cachorro', 'Matador', 20220115, 06660666, 3,10),
 ('Gato', 'Amebo', 20120719, 00000050, 1, 2),
 ('Pásssaro', 'Iara', 20210506, 66997812, 5, 13),
 ('Pássaro', 'Quack' , 20170711, 17937931, 6, 12),
 ('Gato', 'Frajola', 20140101, 77880003, 5, 3);
 insert into pet values
 (null, 'Cachorro', 'Carlinhos', 20051030, 55665566, null, null),
 (null, 'Gato', 'Lambinha', 20171220, 77889123, null, null);
 
 select * from pet;
*/

-- Um último select para confirmar como estão os dados na tabela cliente, onde iremos fazer o autorelacionamento   
select * from cliente;
 
 -- adição de chaves estrangeiras que se referenciam à si mesma, relacionando a fk_cliente com a ID da própria tabela
 alter table cliente add fk_cliente int;
alter table cliente add foreign key (fk_cliente) references cliente(idCliente);

-- checagem, novamente
select * from cliente;

-- Adicionar valores à tabela de cliente, atualizando os valores de fk que se encontram vazios
update cliente set fk_cliente = 1 where idCliente=2;
update cliente set fk_cliente = 1 where idCliente=3;
update cliente set fk_cliente = 3 where idCliente=4;
update cliente set fk_cliente = 1 where idCliente=6;
update cliente set fk_cliente = 2 where idCliente=7;
update cliente set fk_cliente = 7 where idCliente=8;

-- checagem
select * from cliente;

-- Fazer uma primeira autorelação. Na hora do select, colocamos alias para cada uma, para na hora de exibir simplesmente não ser 2 "nomeCliente"
-- é necessário adicionar um "apelido" às "duas" tabelas. Mesmo que seja só uma, imagine que estamos trabalhando com duas tabelas que são exatamente iguais
-- Lembre-se de indicar sempre qual tabela a coluna se refere

-- dessa forma, se mostra os clientes que foram indicados por alguém e também indicaram alguém. 
select c.nomeCliente as 'Cliente indicada', fk.nomeCliente as 'indicado por'  
from cliente as fk join cliente as c 
on c.fk_cliente = fk.idCliente;

-- Aqui é outra forma de mostrar 
-- Mostra todos os clientes, mesmo que eles não tenham sido indicados por alguém
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk left join cliente as c 
on fk.fk_cliente = c.idCliente;

-- Mostra todos os clientes, mesmo que ele não tenha indicado ninguém
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk right join cliente as c 
on fk.fk_cliente = c.idCliente; 

-- Mostra somente os clientes que não indicaram ninguém 
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk right join cliente as c 
on fk.fk_cliente = c.idCliente where fk.nomeCliente is null;

-- Mostra somente os clientes que indicaram outro cliente
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk right join cliente as c 
on fk.fk_cliente = c.idCliente where fk.nomeCliente is not null;

-- Mostra somente os clientes que não foram indicados por ninguém
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk left join cliente as c 
on fk.fk_cliente = c.idCliente where c.nomeCliente is null;

-- Mostra somente os clientes que foram indicados por alguém
select c.nomeCliente as 'Cliente que indicou', fk.nomeCliente as 'indicou' 
from cliente as fk left join cliente as c 
on fk.fk_cliente = c.idCliente where c.nomeCliente is not null;


select * from cliente join cliente as fk on fk.fk_cliente = cliente.idCliente;
select * from cliente;
