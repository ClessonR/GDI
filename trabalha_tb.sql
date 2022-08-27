create table Trabalha_tb (
    cnpj_cia varchar2(14),
    cpf_tri varchar2(11),
    data_trabalha date,
    CONSTRAINT Trabalha_tb_pk PRIMARY KEY (cnpj_cia, cpf_tri, data_trabalha),
    CONSTRAINT Trabalha_tb_fk1 FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Trabalha_tb_fk2 FOREIGN KEY (cpf_tri)
        REFERENCES Tripulante_tb (cpf_pe)
);

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) values ();

