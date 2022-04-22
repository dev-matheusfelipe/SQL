#CRIANDO O BANCO DE DADOS
create database hotelaria;
#USANDO O BANCO DE DADOS
use hotelaria;

#CRIANDO AS TABELAS
create table cliente (
	Nome_cli varchar(30) NOT NULL,
    CPF_cli varchar(15) NOT NULL PRIMARY KEY,
    RG_cli varchar(12) NOT NULL,
    Email_cli varchar(30) NOT NULL,
    Telefone varchar(15) NOT NULL,
    Cidade varchar(15) NOT NULL,
    Codigo_cli varchar(5) NOT NULL
);

create table usuario (
	Nome_Rec varchar(20) NOT NULL,
    Cod_Rec int NOT NULL,
    CPF_usario varchar(15) NOT NULL,
    Telefone_Rec varchar(15) NOT NULL,
    Tipo_usuario int NOT NULL,
    foreign key (Nome_Rec) references cliente(Nome_cli),
    foreign key (CPF_usario) references cliente(CPF_cli),
    foreign key (Telefone_Rec) references cliente(Telefone),
    foreign key (Cod_Rec) references cliente(Codigo_cli)
);

create table estornar (
	Nome_cli_estornar varchar(30),
    CPF_cli_est varchar(15),
    Codigo_gastos int,
    Num_Ap int,
    foreign key (Nome_cli_estornar) references cliente(Nome_cli),
    foreign key (CPF_cli_est) references cliente(CPF_cli)
);

create table tipos_de_quartos (
	Quarto_Simples boolean,
    Quarto_Simples2 boolean,
    Ap_Familia boolean,
    Suite_Simples boolean,
    Suite_Master boolean,
    Suite_Presidencial boolean,
    Num_Ap int,
    Codigo_quarto int
);

create table check_out (
	Codigo_gastos_checkOut int,
    CPF_cli_checkOut varchar(15),
    Codigo_quarto_checkOut int,
	Num_Ap_checkOut int,
    foreign key (CPF_cli_checkOut) references cliente(CPF_cli)
);

create table transferencia_de_contas (
	Num_Ap_transConta int,
    Codigo_gastos_transConta int,
    CPF_cli_transConta varchar(15),
    foreign key (CPF_cli_transConta) references cliente(CPF_cli)
);

create table status_do_quarto (
	Reforma int,
    Desocupado int,
    Ocupado int
);

create table gastos (
	Codigo_gastos int,
    Nome_cliente_gastos varchar(30),
    Num_Ap_gastos int,
    Codigo_cli_gastos int,
    Quantidade int,
    Tipo_de_gasto int,
    Codigo_Reserva int,
    foreign key (Nome_cliente_gastos) references cliente(Nome_cli)
);

create table reserva (
	Nome_cli_reserva varchar(30),
    CPF_cli_reserva varchar(15),
    Email_cli varchar(30),
	Possui_veiculo char,
    Placa_veiculo varchar(9),
    Cartao_fidelidade boolean,
    Codigo_reserva int,
	Codigo_cli_reserva int,
    foreign key (Nome_cli_reserva) references cliente(Nome_cli),
    foreign key (CPF_cli_reserva) references cliente(CPF_cli),
    foreign key (Email_cli) references cliente(Email_cli),
	foreign key (Codigo_cli_reserva) references cliente(Codigo_cli)
);

create table check_in (
	Cod_reserva varchar(5),
    Nome_cli varchar(30),
    CPF_cli_CheckIn varchar(30),
    RG_cli_CheckIn varchar(12),
    Data_chegada date,
    Data_saida date,
    foreign key (Nome_cli) references cliente(Nome_cli),
    foreign key (CPF_cli_CheckIn) references cliente(CPF_cli),
    foreign key (RG_cli_CheckIn) references cliente(RG_cli)
);

#CRIANDO OS VALORES PARA AS TABELAS
insert into cliente (Nome_cli, CPF_cli, RG_cli, Email_cli, Telefone, Cidade, Codigo_cli)
values
('João Fernando Machado Da Costa','89954010017', '457668465', 'reece.braun@gmail.com', '(67)3422-7788','Anchorage','YS15A'),
('Rosa Maria','30054298067', '435840435', 'giovanny22@hotmail.com', '(67)3423-9900','Freeport','YT10A'),
('Rui Silva','94980954006', '293777548', 'sam_powlowski58@yahoo.com', '(67)3423-9900','Broomfield','YT10A'),
('Maria João Freits','10379764016', '388740887', 'abe_gaylord@hotmail.com', '(67)3423-9900','Shawnee','YT10A'),
('Jandira Futy','21063537070', '508704194', 'alan.homenick@gmail.com', '(67)3423-9900','Las Cruces','YP10A'),
('Arlene Guzman','69980152087', '354543672', 'dereck96@yahoo.com', '(67)3423-9900','Evansville','YR10A'),
('Joseph Mims','16387621046', '113072934', 'estrella8@gmail.com', '(67)3423-9900','Oak Park','NS01D'),
('Patrick Moreira Rodrigues','55394447012', '444199482', 'eddie_boyer16@hotmail.com', '(67)3423-9900','Des Moines','YS16A'),
('Zelia Maria Mendes Matias','08667591076', '184771912', 'gunner93@gmail.com', '(67)3423-9900','Temple','OT01B'),
('Vanessa Silva Silva','10656914084', '218759812', 'wilson_kemmer77@gmail.com', '(67)3423-9900','St. George','VW02D'),
('Maurizio Braco','78081176098', '143345059', 'kevin_pfannerstill@hotmail.com', '(67)3423-9900','Medford','YS01A'),
('Regina B Haynes','40915045079', '163750671', 'addie82@gmail.com', '(67)3423-9900','Moorhead','UI01B'),
('Guido Seta','57295858024', '300304651', 'breanna.wisozk@hotmail.com', '(67)3423-9900','Altamonte Springs','PE02B'),
('Allan Gontarde Moreir','22480236005', '493547484', 'carlee43@gmail.com', '(67)3423-9900','Norman','PN01B'),
('Daiana Barco','80862057035', '120268747', 'elenora79@gmail.com', '(67)3423-9900','Urbandale','YS25A'),
('Luciano Magnano','12826630032', '422192934', 'cathryn.marvin@hotmail.com', '(67)3423-9900','','YS25A'),
('Sofia Gonzalez','36063035052', '280799007', 'major96@hotmail.com', '(67)3423-9900','Reno','YS19A'),
('Cinthya Fabila','63338747012', '311257197', 'arch.wiza96@hotmail.com', '(67)3423-9900','Concord','TZ01D'),
('Marco Bustamante','95579643080', '504667877', 'delmer22@hotmail.com', '(67)3423-9900','Portland','YQ04A'),
('Renata Antunes','33068199050', '270575996', 'allene_hodkiewicz4@gmail.com', '(67)3423-9900','Bowling Green','LB02B');

insert into check_in (Cod_reserva, Nome_cli, CPF_cli_CheckIn, RG_cli_CheckIn, Data_chegada, Data_saida)
values
('YP10A', 'Jandira Futy', '21063537070', '508704194', '2017-08-13', '2017-08-24'),
('YR10A', 'Arlene Guzman', '69980152087', '354543672', '2017-08-17', '2017-08-27'),
('NS01D', 'Joseph Mims', '16387621046', '113072934', '2017-08-15', '2017-08-28'),
('YS16A', 'Patrick Moreira Rodrigues', '55394447012', '444199482', '2017-08-15', '2017-08-31'),
('OT01B', 'Zelia Maria Mendes Matias', '08667591076', '184771912', '2017-08-16', '2017-08-30'),
('VW02D', 'Vanessa Silva Silva', '10656914084', '218759812', '2017-08-16', '2017-08-25'),
('YS01A', 'Maurizio Braco', '78081176098', '143345059', '2017-08-17', '2017-08-26'),
('UI01B', 'Regina B Haynes', '40915045079', '163750671', '2017-08-17', '2017-08-26');

#Exc-- 3
select * from check_in
where Data_chegada = '2017-08-15'
order by Nome_cli;

#Exc-- 4
select Nome_cli, Cidade from cliente
order by Nome_cli;








