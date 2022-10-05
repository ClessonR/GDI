/*
O nosso modelo estava incrivelmente horrível.
*/
-- TIPOS UTILIZADOS POR OUTROS TIPOS
-- Tipo que armazena telefones
CREATE SEQUENCE id_proposta INCREMENT by 1 START WITH 1;

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    numero VARCHAR2 (14)

);
/
CREATE OR REPLACE TYPE tp_imagem AS OBJECT (

    imagem VARCHAR2 (100)

);
/
-- Criando array para atributo multivalorado
CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) OF tp_telefone;

/
CREATE OR REPLACE TYPE tp_arr_imagem AS VARRAY (10) OF tp_imagem;
/
-- Tipo que armazena endereços 
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(

    cep VARCHAR2(9),
    numero NUMBER,
    rua VARCHAR2(50),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(50)
    
);
/
-- Tipo que armazena dados bancarios
CREATE OR REPLACE TYPE tp_dados_bancarios AS OBJECT(

    banco NUMBER(10),
    agencia NUMBER(10),
    conta VARCHAR2(10)
    
);

/
-- Entidade anúncio
CREATE OR REPLACE TYPE tp_anuncio AS OBJECT(

    id_anuncio INTEGER,
    tipo_anuncio VARCHAR2(50),
    tipo_imovel VARCHAR2(50),
    valor NUMBER,
    area NUMBER,
    qtd_quartos NUMBER,
    comissao NUMBER,
    descricao VARCHAR(150),
    endereco tp_endereco,
    contatos tp_arr_telefone,
    imagens tp_arr_imagem
   
);

/
-- Criando a nested table anuncio --
CREATE OR REPLACE TYPE tp_nested_anuncio AS TABLE OF tp_anuncio;

/

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Pessoa (CPF, Nome, Email, Avaliação, Descrição, *Endereco, *DadosBancarios)
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    
    cpf VARCHAR2(14),
    nome VARCHAR2(30),
    email VARCHAR2(30),
    descricao VARCHAR2(100),
    telefone tp_arr_telefone,
    endereco tp_endereco,
    dados_bancarios tp_dados_bancarios,
    anuncios tp_nested_anuncio,
    MEMBER PROCEDURE display_info,
    FINAL MEMBER PROCEDURE display_address -- final member pois nao é necessario mudar esse procedimento nos subtipos

) NOT FINAL NOT INSTANTIABLE;

/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE display_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
        DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf);
        DBMS_OUTPUT.PUT_LINE('Email: ' || email);
        DBMS_OUTPUT.PUT_LINE('Descricao: ' || descricao);
    END;
    FINAL MEMBER PROCEDURE display_address IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('O seu nome é ' || nome);
        DBMS_OUTPUT.PUT_LINE('Ele(a) mora em ' || endereco.cidade || ', ' || endereco.estado);
        DBMS_OUTPUT.PUT_LINE(endereco.cep);
    END;
END;

/
-- O tipo corretor herda de pessoa
CREATE OR REPLACE TYPE tp_corretor UNDER tp_pessoa(
    creci VARCHAR2(8),
    OVERRIDING MEMBER PROCEDURE display_info -- dando override para imprimir o creci, além das outras informações
);

/
CREATE OR REPLACE TYPE BODY tp_corretor AS
    OVERRIDING MEMBER PROCEDURE display_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
        DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf);
        DBMS_OUTPUT.PUT_LINE('Email: ' || email);
        DBMS_OUTPUT.PUT_LINE('Descricao: ' || descricao);
        DBMS_OUTPUT.PUT_LINE('CRECI: ' || creci);
    END;
END;


/

-- O tipo cliente também herda de pessoa
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    avaliacao NUMBER,
    MEMBER PROCEDURE porcent_avaliacao(SELF IN OUT NOCOPY tp_cliente, input NUMBER)
);

/

CREATE OR REPLACE TYPE BODY tp_cliente AS 
MEMBER PROCEDURE porcent_avaliacao (SELF IN OUT NOCOPY tp_cliente, input NUMBER) IS
    BEGIN
        SELF.avaliacao := input*20;
        DBMS_OUTPUT.PUT_LINE(SELF.avaliacao);
    END;
END;
/
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
/
-- Tipo gerente
CREATE OR REPLACE TYPE tp_gerente AS OBJECT(

    cpf VARCHAR2(14),
    nome VARCHAR2(30),
    email VARCHAR2(30),
    telefone tp_arr_telefone,
    endereco tp_endereco,
    CONSTRUCTOR FUNCTION tp_gerente (x1 tp_gerente) RETURN SELF AS RESULT,
    MAP MEMBER FUNCTION num_telefones RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY tp_gerente AS
    CONSTRUCTOR FUNCTION tp_gerente (x1 tp_gerente) RETURN SELF AS RESULT IS
    BEGIN
        cpf := x1.cpf; 
        nome := x1.nome; 
        email := x1.email; 
        telefone := x1.telefone;
        endereco := x1.endereco; 
        RETURN; 
    END;
    MAP MEMBER FUNCTION num_telefones RETURN NUMBER IS
    num_count NUMBER;
    BEGIN
        SELECT COUNT (*) INTO num_count FROM TABLE (self.telefone);
        RETURN num_count;
    END;
END;
/

-- Tipo de avaliacao
CREATE OR REPLACE TYPE tp_avaliacao AS OBJECT (
    cpf_avaliador REF tp_cliente,
    cpf_avaliado REF tp_cliente,
    avaliacao NUMBER,
    MEMBER FUNCTION porcentagem_avaliacao RETURN NUMBER
);

/

CREATE OR REPLACE TYPE BODY tp_avaliacao AS 
MEMBER FUNCTION porcentagem_avaliacao RETURN NUMBER IS
    BEGIN
        RETURN avaliacao*20;
    END;
END;
/

-- Indicação de auxílio
CREATE OR REPLACE TYPE tp_indicacao AS OBJECT(
    data DATE,
    cliente REF tp_cliente,
    corretor REF tp_corretor,
    gerente REF tp_gerente
);

/


-- TIPO PROPOSTA --
CREATE OR REPLACE TYPE tp_proposta AS OBJECT(
    id_proposta INTEGER,
    cliente REF tp_cliente,
    id_anuncio INTEGER, --o codigo do anuncio referenciado
    valor NUMBER,
    status VARCHAR2(8),
    data DATE,
    ORDER MEMBER FUNCTION comparar_valor(propostax tp_proposta) RETURN NUMBER
);

/
ALTER TYPE tp_proposta ADD ATTRIBUTE (revisor REF tp_gerente);
/
CREATE OR REPLACE TYPE BODY tp_proposta AS
    ORDER MEMBER FUNCTION comparar_valor (propostax tp_proposta) RETURN NUMBER IS 
    BEGIN
        RETURN propostax.valor - SELF.valor;
    END;
END;
/