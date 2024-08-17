create database jbarro;

CREATE TABLE condominio (
    ccodigo INT NOT NULL,
    cnome VARCHAR(50) NOT NULL,
    cendereco VARCHAR(50) NOT NULL,
    smatricula INT NOT NULL,
    CONSTRAINT pk_condominio PRIMARY KEY (ccodigo)
);
CREATE TABLE apartamento (
    apnumero INT NOT NULL,
    aptipo ENUM('Padrao', 'Cobertura'),
    ccodigo INT NOT NULL,
    pRG VARCHAR(14) NOT NULL UNIQUE,
    CONSTRAINT pk_apartamento PRIMARY KEY (apnumero)
);
CREATE TABLE proprietario (
    pRG VARCHAR(14) NOT NULL UNIQUE,
    pnome VARCHAR(50) NOT NULL,
    ptelefone VARCHAR(17) NOT NULL,
    pemail VARCHAR(30) NOT NULL,
    CONSTRAINT pk_proprietario PRIMARY KEY (pRG)
);
CREATE TABLE garagem (
    gnumero INT NOT NULL,
    gtipo ENUM('Padrao', 'Coberta'),
    apnumero INT NOT NULL,
    ccodigo INT NOT NULL,
    CONSTRAINT pk_garagem PRIMARY KEY (gnumero)
);
CREATE TABLE sindico (
    smatricula INT NOT NULL,
    snome VARCHAR(50) NOT NULL,
    sendereco VARCHAR(50) NOT NULL,
    stelefone VARCHAR(17) NOT NULL,
    CONSTRAINT pk_sindico PRIMARY KEY (smatricula)
);


alter table condominio add constraint fk_condominio_sindico foreign key(smatricula) references sindico(smatricula);
alter table apartamento add constraint fk_apartamento_condominio foreign key(ccodigo) references condominio(ccodigo);
alter table apartamento add constraint fk_apartamento_proprietario foreign key(pRG) references proprietario(pRG);
alter table garagem add constraint fk_garagem_apartamento foreign key(apnumero) references apartamento(apnumero);
alter table garagem add constraint fk_garagem_ foreign key(ccodigo) references condominio(ccodigo);

describe apartamento;
describe condominio;
describe garagem;
describe proprietario;
describe sindico;
