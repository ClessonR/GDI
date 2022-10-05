-- Pessoa --
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR(9)
);

/

CREATE OR REPLACE TYPE tp_arr_telefones AS VARRAY(5) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cidade VARCHAR2(20), 
    rua VARCHAR2(255), 
    numero NUMBER, 
    complemento VARCHAR2(255), 
    estado VARCHAR2(20), 
    cep CHAR(9)
);

/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    -- Basicos
    cpf CHAR(11), 
    nome VARCHAR2(255), 
    data_nascimento DATE, 
    genero CHAR,
    -- Referencias
    telefones tp_arr_telefones,
    endereco tp_endereco,

    MEMBER PROCEDURE print_info

) NOT FINAL NOT INSTANTIABLE;

/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf)
        DBMS_OUTPUT.PUT_LINE(nome)
        DBMS_OUTPUT.PUT_LINE(data_nascimento)
        DBMS_OUTPUT.PUT_LINE(genero)
    End;
END;

/

-- Funcionário, Cliente e Médico --

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
    plano_de_saude VARCHAR2(255),

    OVERRIDING MEMBER PROCEDURE print_info
);

/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(plano_de_saude);
    End;
END;

/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
    cargo VARCHAR2(255),
    salario NUMBER(20, 2),
    data_admissao DATE,
    OVERRIDING MEMBER PROCEDURE print_info,
    CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT    
) NOT FINAL;

/

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario) CASCADE;
/
ALTER TYPE tp_funcionario ADD ATTRIBUTE (avaliacao_supervisor VARCHAR2(255)) CASCADE;
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(cargo);
        DBMS_OUTPUT.PUT_LINE(salario);
        DBMS_OUTPUT.PUT_LINE(data_admissao);
    End;
    
    CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT BEGIN
        cpf := new_func.cpf;
        nome := new_func.nome;
        data_nascimento := new_func.data_nascimento;
        genero := new_func.genero;
        telefones := new_func.telefones;
        endereco := new_func.endereco;
        cargo := new_func.cargo;
        salario := new_func.salario;
        data_admissao := new_func.data_admissao;
        RETURN;
    END;

END;

/

CREATE OR REPLACE TYPE tp_medico UNDER tp_funcionario (
    crm VARCHAR2(255),

    OVERRIDING MEMBER PROCEDURE print_info,
    MEMBER FUNCTION salarioAnual RETURN NUMBER
);

/

CREATE OR REPLACE TYPE BODY tp_medico AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(cargo);
        DBMS_OUTPUT.PUT_LINE(salario);
        DBMS_OUTPUT.PUT_LINE(data_admissao);
        DBMS_OUTPUT.PUT_LINE(crm);
    End;

    MEMBER FUNCTION salarioAnual RETURN NUMBER IS
    BEGIN
        RETURN salario*12;
    END;

END;

/

-- Mendicamento --

CREATE OR REPLACE TYPE tp_medicamento AS OBJECT (
    nome VARCHAR2(255)
);

/

-- Produto --
CREATE OR REPLACE TYPE tp_produto AS OBJECT (
    nome_comercial VARCHAR2(30),
    preco_de_compra NUMBER(20, 2),
    preco_de_revenda NUMBER(20, 2),
    estoque INTEGER,
    data_de_fabricacao DATE,
    data_de_vencimento DATE,
    lote INTEGER,
    MAP MEMBER FUNCTION comparaEstoque RETURN INTEGER
);
/

CREATE OR REPLACE TYPE BODY tp_produto AS

    MAP MEMBER FUNCTION comparaEstoque RETURN INTEGER IS
    BEGIN
        RETURN estoque;
    END;
END;

/

CREATE OR REPLACE TYPE nt_tp_fornece AS TABLE OF tp_produto;
/

-- Tipo Produto --

CREATE OR REPLACE TYPE tp_arr_tipos_produtos_fornecidos AS VARRAY (2) OF VARCHAR2(255);

/

--  Fornecedor --

CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    cnpj CHAR(14),
    nome VARCHAR2(255),
    tipos_produtos tp_arr_tipos_produtos_fornecidos,
    produtos nt_tp_fornece
);

/

-- Compra -- 

CREATE OR REPLACE TYPE tp_compra AS OBJECT (
    datahora_compra TIMESTAMP,
    cliente_compra REF tp_cliente,
    -- produto_compra REF tp_produto
    produto_compra nt_tp_fornece
);

/

-- Serviço e preço de serviço --

CREATE OR REPLACE TYPE tp_preco_servico AS OBJECT (
    tipo_servico VARCHAR2 (255),
    preco_servico NUMBER(20, 2),
    ORDER MEMBER FUNCTION compararpservico (SELF IN OUT NOCOPY tp_preco_servico, x tp_preco_servico) RETURN NUMBER
);

/


/*Compara o preço do serviço e retorna 1 caso um serviço sejá mais barato que outro,
 0 caso um serviço sejá mais caro e -1 caso seja o mesmo preço*/
CREATE OR REPLACE TYPE BODY tp_preco_servico AS
ORDER MEMBER FUNCTION compararpservico (SELF IN OUT NOCOPY tp_preco_servico, x tp_preco_servico) RETURN NUMBER IS
    BEGIN 
        IF SELF.preco_servico < x.preco_servico THEN
            RETURN -1;
        ELSIF SELF.preco_servico > x.preco_servico THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;
END;

/ 
-- Atende --

CREATE OR REPLACE TYPE tp_atende AS OBJECT (
    cliente_atendimento REF tp_cliente,
    funcionario_atendimento REF tp_funcionario,
    servico_atendimento VARCHAR2(255),
    datahora_atendimento TIMESTAMP
);

/


CREATE OR REPLACE TYPE tp_servico AS OBJECT (
    id INTEGER,
    preco REF tp_preco_servico
);

/

-- Consulta --

CREATE OR REPLACE TYPE nt_tp_prescreve AS TABLE OF tp_medicamento;

/

CREATE OR REPLACE TYPE tp_consulta AS OBJECT (
    medico_consulta REF tp_medico,
    cliente_consulta REF tp_cliente,
    medicamentos_prescritos nt_tp_prescreve,
    datahora_consulta TIMESTAMP
);

/