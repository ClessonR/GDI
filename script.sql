create table Pessoa_tb (cpf varchar2(11), nome varchar(100), idade integer, 
                        CONSTRAINT Pessoa_tb_pk PRIMARY KEY (cpf)); 
                        
create table Telefone_Pessoa_tb (cpf varchar2(11), contato varchar(11), 
                                CONSTRAINT Telefone_Pessoa_tb_pk PRIMARY KEY (cpf, contato), 
                                CONSTRAINT Telefone_Pessoa_tb_fk FOREIGN KEY (cpf) 
                                    REFERENCES Pessoa_tb (cpf));
                                    
create table Bagagem_tb (bag_id integer,peso float, inspecao boolean,
                        CONSTRAINT Bagagem_tb_pk PRIMARY KEY (bag_id));
 
create table Comp_aerea_tb (cnpj varchar2(14), nome varchar(100),
                            CONSTRAINT Comp_aerea_tb_pk PRIMARY KEY (cnpj));
                            
create table Telefone_Comp_aerea_tb (cnpj varchar2(14), contato varchar(11),
                                    CONSTRAINT Telefone_Comp_aerea_tb PRIMARY KEY(cnpj, contato),
                                    CONSTRAINT Telefone_Comp_aerea_fk FOREIGN KEY (cnpj)
                                        REFERENCES Comp_aerea_tb (cnpj));

create table Aviao_tb ( aviao_id integer, capacidade integer, tipo varchar(100),
                        CONSTRAINT Aviao_tb_pk PRIMARY KEY (aviao_id));

create table Voo_tb ( codigo integer, portao char, local_partida varchar(100), local_chegada varchar(100),
                        data_partida TIMESTAMP, data_chegada TIMESTAMP,
                        CONSTRAINT Voo_tb_pk PRIMARY KEY (codigo));

create table Passagem_tb ( passagem_id integer, assento varchar2(10),
                        CONSTRAINT Passagem_tb_pk PRIMARY KEY (passagem_id));

create table Tripulante_tb ( equipe varchar(10), cadastro integer, cargo varchar(10), salário float,
                            CONSTRAINT Tripulante_tb_pk PRIMARY KEY (cpf)
                                REFERENCES Pessoa_tb (cpf);
          
create table Passageiro_tb ( fidelidade varchar(10))           