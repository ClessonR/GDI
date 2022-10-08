-- PESSOA --
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep varchar2(50),
    rua varchar2(200),
    numero varchar2(6),
    cidade varchar2(200),

    CONSTRUCTOR FUNCTION tp_endereco (x1 tp_endereco) RETURN SELF AS RESULT
);
/



CREATE OR REPLACE TYPE BODY tp_endereco AS
    CONSTRUCTOR FUNCTION tp_endereco (x1 tp_endereco) 
    RETURN SELF AS RESULT IS 
    BEGIN
        cep := x1.cep; 
        rua := x1.rua; 
        numero:= x1.rua;
        cidade := x1.cidade; 
        RETURN;
    END;
END;
/

CREATE OR REPLACE TYPE tp_fone_pessoa AS OBJECT(
    telefone varchar2(15)
);
/

CREATE OR REPLACE TYPE tp_fone_pessoa_array AS VARRAY(4) OF tp_fone_pessoa;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf varchar2(100),
    nome varchar2(200),
    idade integer,
    telefones tp_fone_pessoa_array,
    endereco tp_endereco,
    MEMBER PROCEDURE display_info,
    FINAL MEMBER PROCEDURE display_address, -- o endereço não é alterado para os tipos herdados   
    ORDER MEMBER FUNCTION func_order(ord_tb_pessoa tp_pessoa) RETURN NUMBER
)NOT FINAL NOT INSTANTIABLE ;
/

CREATE OR REPLACE TYPE body tp_pessoa AS
    MEMBER PROCEDURE display_info IS
    BEGIN
        dbms_output.put_line('Nome: ' || nome);
        dbms_output.put_line('CPF: ' || cpf);
        dbms_output.put_line('Idade: ' || idade);
    END;

    FINAL MEMBER PROCEDURE display_address IS
    BEGIN
        dbms_output.put_line('Endereço: ' || endereco.rua || ' ' || endereco.numero || ', ' || endereco.cidade);
    END;
    
    ORDER MEMBER FUNCTION func_order(ord_tb_pessoa tp_pessoa) RETURN NUMBER IS
    BEGIN
        IF (ord_tb_pessoa.idade < self.idade) then 
            RETURN 1;
        ELSIF (ord_tb_pessoa.idade = self.idade) then  
            RETURN 0;
        ELSIF (ord_tb_pessoa.idade > self.idade) then 
            RETURN -1;
        END IF;
    END;
    
END;
/


-------- PASSAGEIRO ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_passageiro UNDER tp_pessoa(
    fidelidade integer
);
/

-------- TRIPULANTE ----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_tripulante UNDER tp_pessoa(
    cargo varchar2(200),
    cadastro integer,
    salario number(15,2),
    MEMBER FUNCTION calc_aumento_salario(percentual number) RETURN number,
    OVERRIDING MEMBER PROCEDURE display_info

);
/

CREATE OR REPLACE TYPE BODY tp_tripulante AS
     MEMBER FUNCTION calc_aumento_salario (percentual number) RETURN number IS
        value number;
    BEGIN
        value := percentual/100;
        RETURN salario * (1 + value);
    END;

    OVERRIDING MEMBER PROCEDURE display_info IS
    BEGIN
        dbms_output.put_line('Nome: ' || nome);
        dbms_output.put_line('CPF: ' || cpf);
        dbms_output.put_line('Idade: ' || idade);
        dbms_output.put_line('Cargo: ' || cargo);
        dbms_output.put_line('Salário: ' || salario);
    END;

END;
/


------------- ADICIONANDO SUPERVISOR DE CADA TRIPULANTE ----------------------

ALTER TYPE tp_tripulante ADD ATTRIBUTE (supervisor REF tp_tripulante) CASCADE;
/


------- BAGAGEM ---------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_bagagem AS OBJECT(
    bag_id varchar2(100),
    peso float
);
/

------------ ADICIONANDO A LISTA DE BAGAGEM A CADA PASSAGEIRO ------------------------
CREATE OR REPLACE TYPE tp_lista_bagagem AS TABLE OF tp_bagagem;
/

ALTER TYPE tp_passageiro ADD ATTRIBUTE (lista_bagagens tp_lista_bagagem) CASCADE;
/

-------------- COMPANHIA AEREA ---------------------------------------

CREATE OR REPLACE TYPE tp_cia_aerea AS OBJECT(
    cnpj varchar2(14), 
    nome varchar2(30)
);
/

----- VOO ----------------------------------------------

CREATE OR REPLACE TYPE tp_voo AS OBJECT(
    codigo integer, 
    portao varchar2(3),
    local_partida varchar2(100), 
    local_chegada varchar2(100) ,
    CONSTRUCTOR FUNCTION tp_voo (x1 tp_voo) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_voo AS
    CONSTRUCTOR FUNCTION tp_voo (x1 tp_voo) RETURN SELF AS RESULT IS
    BEGIN
        codigo := x1.codigo; 
        portao := x1.portao;
        local_partida := x1.local_partida; 
        local_chegada := x1.local_chegada; 
        RETURN; 
    END;
END;
/

---------- AVIÃO --------------------------------------------------

CREATE OR REPLACE TYPE tp_aviao AS OBJECT(
    aviao_id varchar2(10),  
    tipo varchar2(100),
    cia_aerea REF tp_cia_aerea
    
);
/

---------- ESCALA --------------------------------------------------

CREATE OR REPLACE TYPE tp_escala AS OBJECT (
    voo REF tp_voo,
    aviao REF tp_aviao,
    tripulante REF tp_tripulante
);
/

--------------------------------- TIPO COMPRA --------------------------
CREATE OR REPLACE TYPE tp_compra AS OBJECT(
    id_compra varchar2(9),
    valor integer,
    desconto REF tp_cia_aerea,
    passageiro REF tp_passageiro,
    MAP MEMBER FUNCTION compare_id RETURN varchar2
);
/

CREATE OR REPLACE TYPE BODY tp_compra AS

    MAP MEMBER FUNCTION compare_id 
    RETURN varchar2 IS
    BEGIN
        RETURN id_compra;
    END;
END;
/
----------------- TRABALHA ---------------------------------
CREATE OR REPLACE TYPE tp_trabalha AS OBJECT(
    tripulante REF tp_tripulante,
    cia_aerea REF tp_cia_aerea,
    data_trabalha date
);
/

----- PASSAGEM ----------------------------------------

CREATE OR REPLACE TYPE tp_passagem AS OBJECT(
    passagem_id varchar2(6), 
    assento varchar2(10),
    voo REF tp_voo,
    compra REF tp_compra
);
/
