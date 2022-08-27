/* create table CEP_tb (
    cep varchar2(8),
    rua varchar2(50),
    cidade varchar2(20),
    CONSTRAINT CEP_tb_pk PRIMARY KEY (cep),
    CONSTRAINT CEP_tb_fk FOREIGN KEY (cep)
        REFERENCES Endereco_tb (CEP)
); */

insert into CEP_tb (cep,rua,cidade)
    values ('88311710','Rua Cardeal Arcoverde','Campo Grande');

insert into CEP_tb (cep,rua,cidade)
    values ('29146671','Rua Benjamin','Rio Branco');

insert into CEP_tb (cep,rua,cidade)
    values ('76808221','Avenida Francisco Lacerda de Aguiar 150','Cachoeiro de Itapemirim');

insert into CEP_tb (cep,rua,cidade)
    values ('69301300','Avenida dos Tamoios','Macapá');

insert into CEP_tb (cep,rua,cidade)
    values ('57072790','Travessa dos Bandeirantes','Cuiabá');

insert into CEP_tb (cep,rua,cidade)
    values ('89227701','Avenida Catarina Madureira','Macapá');

insert into CEP_tb (cep,rua,cidade)
    values ('21941210','Rua Nacional','Manaus');

insert into CEP_tb (cep,rua,cidade)
    values ('59042200','Rua Arauana','Rio de Janeiro');

insert into CEP_tb (cep,rua,cidade)
    values ('45055788','Rua Turmalina','Porto Velho');

insert into CEP_tb (cep,rua,cidade)
    values ('59066454','Rua Otávio Sebastião','Oficinas');
