-- PESSOA --

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    rua varchar2(20),
    numero varchar2(6),
    cep varchar2(15),
    cidade varchar2(20)
);
/

CREATE OR REPLACE TYPE tp_fone_pessoa AS OBJECT(
    telefone varchar2(15)
);
/

CREATE OR REPLACE TYPE tp_fone_pessoa_array AS VARRAY(4) OF tp_fone_pessoa;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf varchar2(11),
    nome varchar2(20),
    idade integer,
    telefones tp_fone_pessoa_array,
    endereco ref tp_endereco,
    MEMBER PROCEDURE display_info,
    FINAL MEMBER PROCEDURE display_address -- o endereço não é alterado para os tipos herdados   
    ORDER MEMBER FUNCTION func_order(ord_tb_pessoa tp_pessoa) RETURN NUMBER

)NOT FINAL NOT INSTANTIABLE ;
/
CREATE OR REPLACE TYPE body tp_pessoa AS
    ORDER MEMBER FUNCTION func_order(ord_tb_pessoa tp_pessoa) RETURN NUMBER IS
    BEGIN
        IF (ord_tb_pessoa.idade < self.idade) then 
            RETURN 1;
        ELSIF (ord_tb_pessoa.idade = self.idade) then  
            RETURN 0;
        ELSe (ord_tb_pessoa.idade > self.idade) then 
            RETURN -1;
    END IF;
    END;
    
    MEMBER PROCEDURE display_info IS
    BEGIN
        dbms_output.putline('Nome: ' || nome);
        dbms_output.putline('CPF: ' || cpf);
        dbms_output.putline('Idade: ' || idade);
        dbms_output.putline('Cargo: ' || cargo);
        dbms_output.putline('Salário: ' || salario);
    END;

    FINAL MEMBER PROCEDURE display_address IS
    BEGIN
        dbms_output.putline('Endereço: ' || endereco.rua || " " || endereco.numero || ", " || endereco.cidade)
    END;

END;
/

-------- PASSAGEIRO ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_pasageiro UNDER tp_pessoa(
    fidelidade boolean,
);
/

-------- TRIPULANTE ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_tripulante UNDER tp_pessoa(
    cargo varchar2(20),
    cadastro integer,
    salario number(8,2),
    MEMBER FUNCTION calc_aumento_salario(percentual number) RETURN number,
    OVERRIDING MEMBER PROCEDURE display_info
);
/

CREATE OR REPLACE TYPE BODY tp_passageiro AS
    OVERRIDING MEMBER PROCEDURE display_info IS
    BEGIN
        dbms_output.putline('Nome: ' || nome);
        dbms_output.putline('CPF: ' || cpf);
        dbms_output.putline('Idade: ' || idade);
        dbms_output.putline('Cargo: ' || cargo);
        dbms_output.putline('Salário: ' || salario);
    END;

    MEMBER FUNCTION calc_aumento_salario IS
END;


------------- ADICIONANDO SUPERVISOR DE CADA TRIPULANTE ------------------------------------------

ALTER TYPE tp_tripulante ADD ATTRIBUTE (supervisor REF tp_tripulante) CASCADE;
/


------- BAGAGEM ---------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_bagagem AS OBJECT(
    bag_id varchar2(6),
    peso float, 
    inspecao integer
);
/

------------ ADICIONANDO A LISTA DE BAGAGEM A CADA PASSAGEIRO ------------------------
CREATE OR REPLACE TYPE tp_lista_bagagem AS TABLE OF tp_bagagem;
/

ALTER TYPE tp_pasageiro ADD ATTRIBUTE (lista_bagagens tp_lista_passagem) CASCADE;
/

----- PASSAGEM ----------------------------------------

CREATE OR REPLACE TYPE tp_passagem AS OBJECT(
    passagem_id varchar2(6), 
    assento varchar2(10)
);
/
----- VOO ----------------------------------------------

CREATE OR REPLACE TYPE tp_voo AS OBJECT(
    codigo integer, 
    portao varchar2(3),
    local_partida varchar2(100), 
    local_chegada varchar2(100)  
);
/

---------- AVIÃO --------------------------------------------------

CREATE OR REPLACE TYPE tp_aviao AS OBJECT(
    aviao_id varchar2(10),  
    tipo varchar2(100)
);
/

---------- ESCALA --------------------------------------------------

CREATE OR REPLACE TYPE tp_escala AS OBJECT (
    voo REF tp_voo,
    aviao REF tp_aviao,
    tripulante REF tp_tripulante
);
/

-------------- COMPANHIA AEREA ---------------------------------------

CREATE OR REPLACE TYPE tp_cia_aerea AS OBJECT(
    cnpj varchar2(14), 
    nome varchar2(30)
);
/

--------- COLOCANDO A LISTA DE PASSAGEM EM CADA VOO --------------------

CREATE OR REPLACE TYPE tp_lista_passagem AS TABLE OF tp_passagem;
/

ALTER TYPE tp_voo ADD ATTRIBUTE (lista_passagens tp_lista_passagem) CASCADE;
/
---------- COLOCANDO A LISTA DE AVIÕES DE CADA COMPANHIA AEREA ---------------

CREATE TYPE tp_lista_aviao AS TABLE OF tp_aviao;
/

ALTER TYPE tp_cia_aerea ADD ATTRIBUTE (lista_avioes tp_lista_aviao) CASCADE;
/

--------------------------------- TIPO COMPRA --------------------------
CREATE OR REPLACE TYPE tp_compra AS OBJECT(
    id_compra integer,
    valor integer,
    desconto REF tp_cia_aerea
);
/

CREATE OR REPLACE TYPE tp_lista_passagem AS TABLE OF tp_passagem;
/

ALTER TYPE tp_compra ADD ATTRIBUTE (lista_passagens tp_lista_passagem) CASCADE;
/

CREATE OR REPLACE TYPE tp_lista_compra AS TABLE OF tp_compra;
/

ALTER TYPE tp_passageiro ADD ATTRIBUTE (lista_compras tp_lista_compra);
/


----------------- TRABALHA ---------------------------------
CREATE OR REPLACE TYPE tp_trabalha AS OBJECT(
    tripulante REF tp_tripulante,
    cia_aerea REF tp_cia_aerea,
    data_trabalha date
);
/
