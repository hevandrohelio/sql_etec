describe fabricante;
describe filial;
describe veiculo;

create table filial(
	fcodigo int not null auto_increment,
    fnome varchar(20) not null,
    fendereco varchar(100) not null,
    ftelefone varchar(18) not null default 0,
    
    constraint pk_filial primary key(fcodigo)
);

create table fabricante(
	fbcodigo int unsigned not null auto_increment,
    fbnome varchar(40) not null,
    
    constraint pk_fabricante primary key(fbcodigo)
);

create table veiculo(

	placa varchar(8) not null,
    ano year not null,
    modelo varchar(20) not null,
    combustivel varchar(20) not null,
    chassis varchar(20) not null,
    cor varchar(20) not null,
    
    fcodigo int unsigned not null,
    
    constraint pk_veiculo primary key (placa),
    
    constraint fk_veiculo_fabric foreign key(fcodigo) references fabricante(fbcodigo));