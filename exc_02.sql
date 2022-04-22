create database grau
default character set utf8
default collate utf8_general_ci;

use grau;

create table banco (
	cod int primary key NOT NULL,
    nome varchar(15) NOT NULL
);

create table agencia (
	num_agencia int unique NOT NULL,
    endereco varchar(30) NOT NULL,
    cod_banco int NOT NULL,
    foreign key (cod_banco) references banco(cod)
);

create table cliente (
	id int auto_increment primary key,
	cpf varchar(17) NOT NULL UNIQUE,
    nome varchar(30) NOT NULL,
	sexo enum('M','F') NOT NULL,
    endereco varchar(30) NOT NULL
);

create table conta (
	num_conta varchar(10) NOT NULL UNIQUE,
	saldo decimal NOT NULL,
    tipo_conta int NOT NULL,
    num_agencia int NOT NULL,
    foreign key (num_agencia) references agencia(num_agencia)
);

create table historico (
	cpf varchar(17) NOT NULL,
    num_conta varchar(10) NOT NULL,
    data_inicio date NOT NULL,
    foreign key (cpf) references cliente(cpf),
    foreign key (num_conta) references conta(num_conta)
);

create table tel_cliente (
	cpf_cli varchar(17) NOT NULL,
    tel_cli varchar(25) NOT NULL,
    foreign key (cpf_cli) references cliente(cpf)
);

describe agencia;
desc banco;
select * from banco;
select * from agencia;
select * from cliente;
select * from conta;
select * from historico;
select * from tel_cliente;

insert into banco
values 
('1', 'Banco do Brasil'),
('4', 'CEF');

insert into agencia
values 
('0562', 'Rua joaquim Teixeira Alves, 1555', '4'),
('3153', 'Av. Marcelino Pires', '1');

insert into cliente
values 
('', '111.222.333-44', 'Jennifer B Souza', 'F', 'Rua Cuiaba, 1050'),
('', '666.777.888-99', 'Caetano K Lima', 'M', 'Rua Ivinhema, 879'),
('', '555.444.777-33', 'Silvia Macedo', 'F', 'Rua Estados Unidos, 735');

insert into conta
values 
('86340-2', '763.05', '2', '3153'),
('23584-7', '3879.12', '1','0562');

insert into historico (cpf, num_conta, data_inicio)
values 
('111.222.333-44', '23584-7', '1997-12-17'),
('666.777.888-99', '23584-7', '1997-12-08'),
('555.444.777-33', '86340-2', '1997-11-29');

insert into tel_cliente (cpf_cli, tel_cli)
values
('111.222.333-44', '(67)3422-7788'),
('666.777.888-99', '(67)3423-9900'),
('555.444.777-33', '(67)8121-8833');

alter table cliente
add column email varchar(30) after endereco;

delete from conta
where num_conta='86340-2' 
limit 1;

update agencia
set num_agencia = '6342'
where cod_banco = '4';

update cliente
set email = 'caetanolima@gmail.com'
where id = '2';







