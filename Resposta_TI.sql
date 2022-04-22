#1 - Resposta
select 
count(id_func) "Total de Funcionários"
from
funcionarios;

#2 - Resposta    
select
count(f.id_cargo) "Qtd. Servidores", c.desc_cargo "Cargo"
from
funcionarios f join cargo as c
on c.id_cargo = f.id_cargo
group by  f.id_cargo;

#3 - Resposta 
select f.nome "Servidores",
concat("R$ ",format(c.salario,2)) "Renda"
from
funcionarios f join cargo as c
on c.id_cargo = f.id_cargo
order by c.salario desc;

#4 - Resposta
select f.nome "Servidores",
concat("R$ ",format((((c.salario*5)/100)+c.salario),2)) "Valor com Aumento"
from funcionarios f
join cargo c 
on c.id_cargo = f.id_cargo
where c.id_cargo = 3 /*Filtrando pelo cargo de técnico*/

/*O union permite juntar mais de um select*/
union

select f.nome "Servidores",
concat("R$ ",format(c.salario,2)) "Valor com Aumento"
from funcionarios f join cargo c 
on c.id_cargo = f.id_cargo
where c.id_cargo != 3 /*Excluindo o cargo de técnico*/
order by Servidores;

#5 - Resposta 
select f.id_func, f.nome "Servidores",
concat("R$ ",format((((c.salario*10)/100)+c.salario),2)) "Valor com Aumento"
from funcionarios f join cargo c 
on c.id_cargo = f.id_cargo
where f.id_escolaridade = 3
and c.id_nivel_cargo  = 1 /*Filtrando pelo cargo de técnico*/
group by f.id_func;
