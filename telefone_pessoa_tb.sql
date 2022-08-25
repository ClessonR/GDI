create table Telefone_Pessoa_tb (cpf varchar2(11), contato varchar(11), 
                                CONSTRAINT Telefone_Pessoa_tb_pk PRIMARY KEY (cpf, contato), 
                                CONSTRAINT Telefone_Pessoa_tb_fk FOREIGN KEY (cpf) 
                                    REFERENCES Pessoa_tb (cpf));
            
insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('71311506578','95992915304');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('44527288989','6735856655');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('32008422704','6625156368');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('34988775267','2226451615');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('54657828622','7928065753');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('03757527062','1735222725');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('64145381084','8227893165');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('01280004223','5528886111');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('73641828619','8727827386');

insert into Telefone_Pessoa_tb (cpf,contato) 
    values ('14121741633','6337666892');