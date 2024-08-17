create database imobiliaria;

CREATE TABLE condominio (
    ccodigo INT NOT NULL AUTO_INCREMENT,
    cnome VARCHAR(50) NOT NULL,
    cendereco VARCHAR(50) NOT NULL,
    smatricula INT NOT NULL,
    CONSTRAINT pk_condominio PRIMARY KEY (ccodigo),
    CONSTRAINT fk_condominio_sindico FOREIGN KEY (smatricula)
        REFERENCES sindico (smatricula)
);
CREATE TABLE apartamento (
    apnumero INT NOT NULL,
    aptipo ENUM('Padrao', 'Cobertura'),
    ccodigo INT,
    CONSTRAINT pk_apartamento PRIMARY KEY (apnumero),
    CONSTRAINT fk_apartamento_condominio FOREIGN KEY (ccodigo)
        REFERENCES condominio (ccodigo)
);
CREATE TABLE proprietario (
    pRG VARCHAR(14) NOT NULL UNIQUE,
    pnome VARCHAR(50) NOT NULL,
    ptelefone VARCHAR(17) NOT NULL,
    pemail VARCHAR(30) NOT NULL,
    CONSTRAINT pk_proprietario PRIMARY KEY (pRG)
);
CREATE TABLE garagem (
    gnumero INT NOT NULL AUTO_INCREMENT,
    gtipo ENUM('Padrao', 'Coberta'),
    apnumero INT,
    CONSTRAINT pk_garagem PRIMARY KEY (gnumero),
    CONSTRAINT fk_garagem_apartamento FOREIGN KEY (apnumero)
        REFERENCES apartamento (apnumero)
);
CREATE TABLE sindico (
    smatricula INT NOT NULL AUTO_INCREMENT,
    snome VARCHAR(50) NOT NULL,
    sendereco VARCHAR(50) NOT NULL,
    stelefone VARCHAR(17) NOT NULL,
    CONSTRAINT pk_sindico PRIMARY KEY (smatricula)
);
CREATE TABLE proprietario_apartamento (
    prop_ap_id INT NOT NULL AUTO_INCREMENT,
    numero_ap INT NOT NULL,
    RG_prop VARCHAR(14),
    CONSTRAINT pk_prop_ap PRIMARY KEY (prop_ap_id),
    CONSTRAINT fk_numero_ap FOREIGN KEY (numero_ap)
        REFERENCES apartamento (apnumero),
    CONSTRAINT fk_rg_prop FOREIGN KEY (RG_prop)
        REFERENCES proprietario (pRG)
);

describe apartamento;
describe condominio;
describe garagem;
describe proprietario;
describe sindico;
describe proprietario_apartamento;

insert into sindico(snome, sendereco, stelefone) values("André da Silva", "Rua Eudoro Lemos de Oliveira", "1193385-2239"),
("Luiz Felipe de Almeida", "Avenida Pompéia", "1194786-0781");

insert into proprietario(pRG,pnome,ptelefone,pemail) values("537.888.989-03","Luiz Antônio","1193365-0044","luiz.antonio@gmail.com"),
("338.725.175-39","Tobias Armelindo de Oliveira","1195749-2280","tobias.oliveira@gmail.com"),("541.335.856-01","Everton Moralis","1194876-1734","everton.moralis02@gmail.com"),
("724.566.318-56","Davi dos Santos Santana","1194781-1148","davi.santana@terra.com.br"),("213.218.979-07","Elizabeth Almeida","1198677-8954","elizabeth.almeida@gmail.com"),
("648.215.336-30","Lucas de Souza","1197784-0215","lucas.souza@protonmail.com"),("895.316.748-44","Isabela da Silva","1195645-3014","isabela.silva@gmail.com"),
("215.481.300-65","Elias Anselmo dos Santos","1197536-0488","elias.santos@gmail.com"),("012.223.148-07","Luiz Fernades","1195487-7848","luiz.fernandes@gmail.com"),
("336.847.454-77","Mariana Satto da Silva","1195547-8849","mariana.satto@gmail.com");

insert into condominio(cnome, cendereco,smatricula) values("Condomínio Malta", "Avenida Braz Leme", 1), ("Condomínio Edifício Versailes", "Avenida Pompéia", 2);

insert into apartamento(apnumero, aptipo, ccodigo) values(1, "Padrao", 1), (2, "Padrao", 1), (3, "Padrao", 1),(4,"Padrao",1),(5,"Cobertura",1),
(6, "Padrao", 2), (7, "Padrao", 2),(8,"Padrão",2),(9,"Padrao", 2),(10, "Cobertura", 2);

insert into garagem(gtipo, apnumero) values("Padrao",1),("Padrao",1),("Padrao",2),("Padrao",2),("Padrao",3),("Padrao",3),("Padrao",4),("Padrao",4),("Coberta",5),
("Coberta",5),("Padrao",6),("Padrao",7),("Padrao",8),("Padrao",9),("Coberta",10);

insert into proprietario_apartamento(numero_ap, RG_prop) values(1,"537.888.989-03"),
(2,"338.725.175-39"),(3,"541.335.856-01"),
(4,"724.566.318-56"),(5,"213.218.979-07"),
(6,"648.215.336-30"),(7,"895.316.748-44"),
(8,"215.481.300-65"),(9,"012.223.148-07"),
(10,"336.847.454-77");

update proprietario_apartamento set RG_prop=null where numero_ap=7;

update proprietario_apartamento set RG_prop=null where numero_ap=10;

delete from proprietario_apartamento where RG_prop is NULL;

SELECT 
    *
FROM
    sindico;
SELECT 
    *
FROM
    proprietario;
SELECT 
    *
FROM
    condominio;
SELECT 
    *
FROM
    apartamento;
SELECT 
    *
FROM
    garagem;
SELECT 
    *
FROM
    proprietario_apartamento;