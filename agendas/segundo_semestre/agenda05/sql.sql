/*
1)	Relação de condomínios apresentando além do nome, o endereço e o total de apartamentos.

2)	Altere a estrutura da Tabela apartamento adicionando o campo valor com a seguinte definição.

3)	Altere os registros de todos os apartamentos definindo o valor baseado na seguinte tabela de preços.

4)	Relacione os proprietários apresentando o nome, o telefone,
o total de apartamentos que ele possui e o valor total do seu patrimônio considerando
somente os apartamentos dos dois condomínios, por ordem alfabética.
*/

/*1)*/
select c.cnome, c.cendereco, count(a.apnumero) as qtd_ap from condominio c inner join apartamento a on a.ccodigo = c.ccodigo group by c.cnome, c.cendereco;
/*2)*/
alter table apartamento add column apreco double(10,2) default 0;
/*3)*/

update apartamento set apreco = 100000.00 where apnumero = 1;
update apartamento set apreco = 115000.00 where apnumero = 2;
update apartamento set apreco = 125000.00 where apnumero = 3;
update apartamento set apreco = 135000.00 where apnumero = 4;
update apartamento set apreco = 150000.00 where apnumero = 5;
update apartamento set apreco = 200000.00 where apnumero = 6;
update apartamento set apreco = 215000.00 where apnumero = 7;
update apartamento set apreco = 225000.00 where apnumero = 8;
update apartamento set apreco = 235000.00 where apnumero = 9;
update apartamento set apreco = 250000.00 where apnumero = 10;

/*4)*/
select pnome, ptelefone, count(numero_ap) as total_aparteamentos, sum(apreco) as patrimonio from proprietario inner join
proprietario_apartamento on proprietario.pRG = proprietario_apartamento.RG_prop inner join apartamento
on proprietario_apartamento.numero_ap = apartamento.apnumero group by pnome, ptelefone order by pnome;


select * from apartamento;
describe apartamento;
describe condominio;
describe garagem;
describe proprietario;
describe sindico;
describe proprietario_apartamento;