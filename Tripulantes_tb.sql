/*create table Pessoa_tb (cpf varchar2(11), nome varchar(100), idade integer, 
                        CONSTRAINT Pessoa_tb_pk PRIMARY KEY (cpf)); 
                         
insert into Pessoa_tb (cpf,nome,idade)  -- Passageiro
    values ('71311506578','Heitor Yuri da Silva',28);
insert into Pessoa_tb (cpf,nome,idade) -- Passageiro
    values ('44527288989','Geraldo Elias Rezende',57);*/
    
CREATE SEQUENCE Tripulante_seq
START WITH 1 
INCREMENT BY 1;

    
create table Tripulante_tb (
    cpf_pe varchar2(11), 
    cadastro integer UNIQUE, 
    cargo varchar2(20), 
    salario number(6,2), 
    cadastro_supervisor integer,
    CONSTRAINT Tripulante_tb_pk PRIMARY KEY (cpf_pe),
    CONSTRAINT Tripulante_tb_fk1 FOREIGN KEY (cpf_pe)
        REFERENCES Pessoa_tb(cpf),
    CONSTRAINT Tripulante_tb_fk2 FOREIGN KEY (cadastro_supervisor)
        REFERENCES Tripulante_tb(cadastro)
);


insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario) values ('44527288989',Tripulante_seq.NEXTVAL,'corno','30')
insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario) values ('71311506578',Tripulante_seq.NEXTVAL,'corno','30')