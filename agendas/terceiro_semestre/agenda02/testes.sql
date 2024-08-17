delimiter $$
create function times (a int, b int)
returns int
begin
	set @r = a * b;
    return @r;
end $$
delimiter ;

select times(8, 10) resultado;