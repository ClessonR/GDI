/*CREATE SEQUENCE Tripulante_seq
START WITH 1 
INCREMENT BY 1;

    
create table Tripulante_tb (
    cpf_pe varchar2(11), 
    cadastro integer UNIQUE, 
    cargo varchar2(20), 
    salario number(8,2), 
    cadastro_supervisor integer,
    CONSTRAINT Tripulante_tb_pk PRIMARY KEY (cpf_pe),
    CONSTRAINT Tripulante_tb_fk1 FOREIGN KEY (cpf_pe)
        REFERENCES Pessoa_tb(cpf),
    CONSTRAINT Tripulante_tb_fk2 FOREIGN KEY (cadastro_supervisor)
        REFERENCES Tripulante_tb(cadastro)
);*/

--Piloto

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#1
    values ('06059026150',Tripulante_seq.NEXTVAL,'Piloto',28000.00, NULL);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#2
    values ('38627188670',Tripulante_seq.NEXTVAL,'Piloto',30000.00, NULL);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#3
    values ('27240059960',Tripulante_seq.NEXTVAL,'Piloto',20000.00,1);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#4
    values ('28158159664',Tripulante_seq.NEXTVAL,'Piloto',18000.00,2);


--Comissário

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#5
    values ('09516032486',Tripulante_seq.NEXTVAL,'Comissário',4000.00, 1);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#6
    values ('82491793741',Tripulante_seq.NEXTVAL,'Comissário',3500.00, 1);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#7
    values ('58777771907',Tripulante_seq.NEXTVAL,'Comissário',3500.00, 1);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#8
    values ('95441453206',Tripulante_seq.NEXTVAL,'Comissário',5000.00, 2);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#9
    values ('58615293961',Tripulante_seq.NEXTVAL,'Comissário',3000.00,2);

insert into Tripulante_tb (cpf_pe,cadastro,cargo,salario,cadastro_supervisor) --#10
    values ('34037975548',Tripulante_seq.NEXTVAL,'Comissário',4200.00,2);