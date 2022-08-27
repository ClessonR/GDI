create table Comp_aerea_tb (

    cnpj varchar2(14), 
    nome varchar2(30),
    CONSTRAINT Comp_aerea_tb_pk PRIMARY KEY (cnpj)

);

insert into Comp_aerea_tb (cnpj, nome)
    values ('06164253000187', 'Azul Airlines');

insert into Comp_aerea_tb (cnpj, nome)
    values ('09296295000160', 'Gol Airlines');

insert into Comp_aerea_tb (cnpj, nome)
    values ('02012862000160', 'LATAM Airlines');

insert into Comp_aerea_tb (cnpj, nome)
    values ('33136896000190', 'TAP Air Portugal');

insert into Comp_aerea_tb (cnpj, nome)
    values ('03834757000179', 'Copa Airlines');

insert into Comp_aerea_tb (cnpj, nome)
    values ('08692080000286', 'Emirates Airlines');

insert into Comp_aerea_tb (cnpj, nome)
    values ('36212637000199', 'American Airlines');
