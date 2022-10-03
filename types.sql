-- PESSOA --

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    Rua varchar2(20),
    numero varchar2(6),
    cep varchar2(15),
    cidade varchar2(20)
);
/

CREATE OR REPLACE TYPE tp_fone_pessoa AS OBJECT(
    telefone varchar2(15)
);
/

CREATE OR REPLACE TYPE tp_fone_pessoa_array AS VARRAY(4) OF tp_fone;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    nome varchar2(20),
    cpf varchar2(11),
    dt_nascimento date,

    telefones tp_fone_pessoa_array,
    endereco tp_endereco
)NOT FINAL  NOT INSTANTIABLE ;
/

-------- PASSAGEIRO ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_pasageiro UNDER tp_pessoa(
    fidelidade char(1)
);
/

-------- TRIPULANTE ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_tripulante UNDER tp_pessoa(
    cargo varchar2()
    cadastro integer UNIQUE
    salario number(8,2)

);
/

------- BAGAGEM ---------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_bagagem AS OBJECT(
    bag_id varchar2(6),
    peso float, 
    inspecao integer
);
/
----- PASSAGEM ----------------------------------------

CREATE OR REPLACE TYPE tp_passagem AS OBJECT(
    passagem_id varchar2(6), 
    assento varchar2(10),
);
/
----- VOO ----------------------------------------------

CREATE OR REPLACE TYPE tp_voo AS OBJECT(
    codigo integer, 
    portao varchar2(3), 
    local_partida varchar2(100), 
    local_chegada varchar2(100),
    data_partida TIMESTAMP, 
    data_chegada TIMESTAMP
);
/

---------- AVIÃO --------------------------------------------------

CREATE OR REPLACE TYPE tp_avia AS OBJECT(
    aviao_id varchar2(10), 
    cnpj_cia varchar2(14), 
    tipo varchar2(100)
);
/
-------------- COMPANHIA AEREA ---------------------------------------
CREATE OR REPLACE TYPE tp_fone_cia AS OBJECT(
    telefone_cia varchar2(15)
);
/

CREATE OR REPLACE TYPE tp_fone_cia_array AS VARRAY(15) OF tp_fone;
/

CREATE OR REPLACE TYPE tp_cia_aerea AS OBJECT(
    cnpj varchar2(14), 
    nome varchar2(30),
    telefones tp_fone_cia_array,
);
/

--------- COLOCANDO A LISTA DE PASSAGEM EM CADA VOO --------------------

CREATE TYPE tp_lista_passagem AS TABLE OF tp_passagem;
/

ALTER TYPE tp_voo ADD ATTRIBUTE (lista_passagens tp_lista_passagem) CASCADE;
/
---------- COLOCANDO A LISTA DE AVIÕES DE CADA COMPANHIA AEREA ---------------

CREATE TYPE tp_lista_aviao AS TABLE OF tp_aviao;
/

ALTER TYPE tp_cia_aerea ADD ATTRIBUTE (lista_avioes tp_lista_aviao) CASCADE;
/

------------- ADICIONANDO SUPERVISOR DE CADA TRIPULANTE ------------------------------------------

ALTER TYPE tp_tripulante ADD ATTRIBUTE (supervisor REF tp_tripulante) CASCADE;
/

------------ ADICIONANDO A LISTA DE BAGAGEM A CADA PASSAGEIRO ------------------------
CREATE TYPE tp_lista_bagagem AS TABLE OF tp_bagagem;
/

ALTER TYPE tp_pasageiro ADD ATTRIBUTE (lista_bagagens tp_lista_passagem) CASCADE;
/
