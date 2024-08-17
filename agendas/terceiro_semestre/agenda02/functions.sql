delimiter $$
create function get_apt_data (bm_id int)
returns varchar(100)
begin
	declare building_manager varchar(80);
    set building_manager = (select nome from sindico where matricula = bm_id);
    return building_manager;
end $$
delimiter ;
select get_apt_data (1);
select condominio.nome, condominio.endereco, get_apt_data (condominio.matricula_sind) from condominio;

delimiter $$
create function calc_taxa_condominio (cod_ap varchar(5), percentual decimal(5, 2))
returns decimal(10,2)
begin
	declare valor_ap decimal(10,2);
    declare taxa_cond decimal(10,2);
    
    select valor into valor_ap from apartamento where numero = cod_ap;
    set taxa_cond = valor_ap * (percentual / 100);
    
    return taxa_cond;
end $$

delimiter ;

select numero, valor, calc_taxa_condominio (numero, 2.5) from apartamento a where codigo_cond = 1;