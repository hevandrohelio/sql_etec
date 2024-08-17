delimiter $$
create procedure change_value(in id int, in increase int)
begin
	update apartamento
    set valor = valor * ( 1 + increase/100) where codigo_cond = id;
end $$
delimiter ;
call change_value(1, 10);

delimiter $$
create procedure sold(in rg_comprador varchar(15), in n_apartamento varchar(5))
begin
	insert into proprietario (rg) values (rg_comprador);
	update proprietario_apartamento set rg_prop = rg_comprador where numero_ap = n_apartamento;
end $$
delimiter ;
call sold("55999888-73","b301");