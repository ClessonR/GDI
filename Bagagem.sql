create table Bagagem_tb (
    
    cpf_pa varchar2(11),
    bag_id integer,
    peso float, 
    inspecao integer,
    Check (inspecao = 1 OR inspecao = 0),
    CONSTRAINT Bagagem_tb_pk PRIMARY KEY (cpf_pa, bag_id),
    CONSTRAINT Bagagem_tb_fk FOREIGN KEY (cpf_pa)
        REFERENCES Passageiro_tb (cpf_pe)
                        
);

