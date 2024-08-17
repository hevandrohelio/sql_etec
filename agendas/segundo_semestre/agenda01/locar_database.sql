create database locar;
use locar;
describe filial;
describe veiculo;

create table filial(
	codigo int not null,
    nome varchar(100) not null,
    endereco varchar(100) not null,
    primary key(codigo)) default charset utf8;

create table veiculo(
	placa varchar(7) not null,
    ano date not null,
    fabricante varchar(30) not null,
    modelo varchar(30) not null,
    combustivel enum('Gasolina', 'Etanol', 'Diesel', 'GNV'),
    chassis varchar(20) not null,
    cor varchar(20) not null,
    primary key(placa)
) default charset utf8;

