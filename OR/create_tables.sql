CREATE TABLE tb_passageiro of tp_passageiro(
    cpf PRIMARY KEY, 
    nome NOT NULL,
    idade NOT NULL,
    telefones NOT NULL,
    endereco NOT NULL,
    fidelidade NOT NULL CHECK(fidelidade = 1 OR fidelidade = 0)
) NESTED TABLE lista_bagagens STORE AS bagagem_passageiro;
/

CREATE TABLE tb_tripulante OF tp_tripulante(
    cpf PRIMARY KEY, 
    nome NOT NULL,
    idade NOT NULL,
    telefones NOT NULL,
    endereco NOT NULL,
    cargo NOT NULL CHECK (cargo = 'Piloto' or cargo = 'Comissário'),
    cadastro NOT NULL,
    salario NOT NULL,
    supervisor SCOPE IS tb_tripulante
);
/

CREATE TABLE tb_cia_aerea OF tp_cia_aerea(
    cnpj PRIMARY KEY,
    nome NOT NULL
);
/

CREATE TABLE tb_aviao OF tp_aviao(
    aviao_id PRIMARY KEY,
    tipo NOT NULL,
    cia_aerea WITH ROWID REFERENCES tb_cia_aerea NOT NULL
);
/


CREATE TABLE tb_voo OF tp_voo (
    codigo PRIMARY KEY,
    portao NOT NULL,
    local_partida NOT NULL, 
    local_chegada NOT NULL
);
/

CREATE TABLE tb_compra OF tp_compra(
    id_compra PRIMARY KEY,
    valor NOT NULL,
    desconto WITH ROWID REFERENCES tb_cia_aerea NOT NULL,
    passageiro WITH ROWID REFERENCES tb_passageiro NOT NULL
);
/

CREATE TABLE tb_passagem OF tp_passagem (
    passagem_id PRIMARY KEY,
    assento NOT NULL,
    voo WITH ROWID REFERENCES tb_voo NOT NULL,
    compra WITH ROWID REFERENCES tb_compra NOT NULL
);
/ 

CREATE TABLE tb_trabalha OF tp_trabalha (
    tripulante WITH ROWID REFERENCES tb_tripulante NOT NULL,
    cia_aerea WITH ROWID REFERENCES tb_cia_aerea NOT NULL,
    data_trabalha NOT NULL

);
/

CREATE TABLE tb_escala OF tp_escala(
    voo WITH ROWID REFERENCES tb_voo NOT NULL,
    aviao WITH ROWID REFERENCES tb_aviao NOT NULL,
    tripulante WITH ROWID REFERENCES tb_tripulante NOT NULL
);
/
