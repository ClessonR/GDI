CREATE SEQUENCE Tripulante_tb.cadastro
START WITH 1 
INCREMENT BY 1;

create table Pessoa_tb (
    
    cpf varchar2(11), 
    nome varchar2(100), 
    idade integer, 
    CONSTRAINT Pessoa_tb_pk PRIMARY KEY (cpf)

); 
               
create table Telefone_Pessoa_tb (
    
    cpf varchar2(11),
    contato varchar2(11), 
    CONSTRAINT Telefone_Pessoa_tb_pk PRIMARY KEY (cpf, contato), 
    CONSTRAINT Telefone_Pessoa_tb_fk FOREIGN KEY (cpf) 
        REFERENCES Pessoa_tb (cpf)      
);

create table CEP_tb (

    cep varchar2(8),
    rua varchar2(50),
    cidade varchar2(20),
    CONSTRAINT CEP_tb_pk PRIMARY KEY (cep)
);


create table Endereco_tb (

    cpf varchar2(11),
    numero varchar2(10),
    CEP varchar2(8),
    CONSTRAINT Endereco_tb_pk PRIMARY KEY (cpf),
    CONSTRAINT Endereco_tb_fk FOREIGN KEY (cpf)
        REFERENCES Pessoa_tb (cpf),
    CONSTRAINT Endereco_tb_fk2 FOREIGN KEY (CEP)
        REFERENCES CEP_tb (CEP)
);



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



create table Passageiro_tb (
    
    cpf_pe varchar2(11), 
    fidelidade integer,
    Check (fidelidade = 1 OR fidelidade = 0),
    CONSTRAINT Passageiro_tb_pk PRIMARY KEY (cpf_pe),
    CONSTRAINT Passageiro_tb_fk FOREIGN KEY (cpf_pe)
        REFERENCES Pessoa_tb(cpf)
        
);
                                    
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

create table Comp_aerea_tb (

    cnpj varchar2(14), 
    nome varchar2(30),
    CONSTRAINT Comp_aerea_tb_pk PRIMARY KEY (cnpj)

);
                      
create table Telefone_Comp_aerea_tb (
    
    cnpj_cia varchar2(14),
    contato varchar2(11),
    CONSTRAINT Telefone_Comp_aerea_tb PRIMARY KEY(cnpj_cia, contato),
    CONSTRAINT Telefone_Comp_aerea_fk FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj)
);

create table Modelo_aviao_tb (

    tipo_aviao varchar2(20), 
    capacidade_aviao integer,
    CONSTRAINT Modelo_aviao_tb_pk PRIMARY KEY (tipo_aviao)

);

create table Aviao_tb (

    aviao_id varchar2(10), 
    cnpj_cia varchar2(14), 
    tipo varchar2(100),
    CONSTRAINT Aviao_tb_pk PRIMARY KEY (aviao_id),
    CONSTRAINT Aviao_tb_fk FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Aviao_tb_fk2 FOREIGN KEY (tipo)
        REFERENCES Modelo_aviao_tb (tipo_aviao)
                        
);



create table Voo_tb (

    codigo integer, 
    portao char, 
    local_partida varchar2(100), 
    local_chegada varchar2(100),
    data_partida date, 
    data_chegada date,
    CONSTRAINT Voo_tb_pk PRIMARY KEY (codigo)
             
);


create table Compra_tb (

    id_compra integer,
    cnpj_cia varchar2(14),
    valor number(7,2),
    porcentagem integer,
    CHECK (porcentagem >= 0 AND porcentagem <= 100),
    cpf_pa varchar2(11),
    CONSTRAINT Compra_tb_pk PRIMARY KEY (id_compra),
    CONSTRAINT Compra_tb_fk1 FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Compra_tb_fk2 FOREIGN KEY (cpf_pa)
        REFERENCES Passageiro_tb (cpf_pe)
    
);

create table Passagem_tb ( 
    
    passagem_id integer, 
    assento varchar2(10),
    codigo_voo integer,
    id_compra integer,
    CONSTRAINT Passagem_tb_pk PRIMARY KEY (passagem_id),
    CONSTRAINT Passagem_tb_fk1 FOREIGN KEY (codigo_voo)
        REFERENCES Voo_tb (codigo),
    CONSTRAINT Passagem_tb_fk2 FOREIGN KEY (id_compra)
        REFERENCES Compra_tb (id_compra)

);

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

create table Escala_tb (
    
    id_aviao varchar2(10), 
    codigo_voo integer, 
    cpf_tri varchar2(11), 
    data_escala date,
    CONSTRAINT Escala_tb_pk PRIMARY KEY (id_aviao, codigo_voo, cpf_tri),
    CONSTRAINT Escala_tb_fk1 FOREIGN KEY (id_aviao)
        REFERENCES Aviao_tb (aviao_id),
    CONSTRAINT Escala_tb_fk2 FOREIGN KEY (codigo_voo)
        REFERENCES Voo_tb (codigo),
    CONSTRAINT Escala_tb_fk3 FOREIGN KEY (cpf_tri)
        REFERENCES Tripulante_tb (cpf_pe)

);