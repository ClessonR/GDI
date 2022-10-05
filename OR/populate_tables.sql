-------------- POVOAMENTO TRIPULANTES -----------------------

/* CREATE TABLE tb_tripulante OF tp_tripulante(
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
/ */

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '54900376280',
        'Laudemar Camara',
        22,
        tp_fone_pessoa_array(
            tp_fone_pessoa('68994228235'),
            tp_fone_pessoa('68320748758')),
        tp_endereco('69908268', 'Rua Beco Forquilha', '444', 'Rio Branco'),
        'Piloto',
        1,
        15000.00,
        NULL
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '95872776780',
        'Maria Luiza',
        22,
        tp_fone_pessoa_array(
            tp_fone_pessoa('81969753051'),
            tp_fone_pessoa('89696453392')),
        tp_endereco('68914000', 'Rua A1', '23', 'Macapá'),
        'Piloto',
        2,
        20000.00,
        NULL
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '27240059960',
        'Thomas Morais',
        35,
        tp_fone_pessoa_array(
            tp_fone_pessoa('21849522106'),
            tp_fone_pessoa('21849684475')),
        tp_endereco('59000000', 'Rua Jardim Pérola', '1263', 'Natal'),
        'Piloto',
        3,
        14200.00,
        NULL
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '28158159664',
        'Daniel Sampaio',
        40,
        tp_fone_pessoa_array(
            tp_fone_pessoa('81969778112'),
            tp_fone_pessoa('81969905054')),
        tp_endereco('68914000', 'Rua Posto Norte', '726', 'Macapá'),
        'Piloto',
        4,
        18500.00,
        NULL
    )
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '09516032486',
        'Daniel Sampaio',
        40,
        tp_fone_pessoa_array(
            tp_fone_pessoa('24859385562'),
            tp_fone_pessoa('74859234084')),
        tp_endereco('60000000', 'Rua Silva Pedro', '12', 'Recife'),
        'Comissário',
        5,
        4000.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '54900376280')
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '82491793741',
        'Pedro Galvão',
        32,
        tp_fone_pessoa_array(
            tp_fone_pessoa('992342221')),
        tp_endereco('51034024', 'Rua Dom Pedro 2º', '1566', 'Fortaleza'),
        'Comissário',
        6,
        5500.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95872776780')
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '58777771907',
        'Maria Fernanda',
        48,
        tp_fone_pessoa_array(
            tp_fone_pessoa('86798205764'),
            tp_fone_pessoa('86792430004')),
        tp_endereco('79680000', 'Rua Nogueira', '989', 'Água Clara'),
        'Comissário',
        7,
        4500.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '27240059960')
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '95441453206',
        'Leandro Oliveira',
        50,
        tp_fone_pessoa_array(
            tp_fone_pessoa('85192189256'),
            tp_fone_pessoa('85519729807')),
        tp_endereco('91999000', 'Rua Conjunto C', '200', 'Porto Alegre'),
        'Comissário',
        8,
        4500.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '27240059960')
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '58615293961',
        'José Lucas',
        21,
        tp_fone_pessoa_array(
            tp_fone_pessoa('982310123'),
            tp_fone_pessoa('755666198')),
        tp_endereco('51254029', 'Rua Padre Macedo', '332', 'Goiania'),
        'Comissário',
        9,
        2800.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    ) 
);

INSERT INTO tb_tripulante VALUES ( --sem supervisor
    tp_tripulante(
        '34037975548',
        'Edivam Campos',
        60,
        tp_fone_pessoa_array(
            tp_fone_pessoa('224510123'),
            tp_fone_pessoa('755624598')),
        tp_endereco('23254569', 'Rua Seixas', '432', 'Manaus'),
        'Comissário',
        10,
        4750.00,
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95872776780')
    ) 
);


    
-------------- POVOAMENTO PASSAGEIRO -----------------------
/*CREATE TABLE tb_passageiro of tp_passageiro(
    cpf PRIMARY KEY, 
    nome NOT NULL,
    idade NOT NULL,
    telefones NOT NULL,
    endereco NOT NULL,
    fidelidade NOT NULL CHECK(fidelidade = 1 OR fidelidade = 0)
) NESTED TABLE lista_bagagens STORE AS bagagem_passageiro, NESTED TABLE lista_compras STORE AS compra_passagens (NESTED TABLE lista_passagens STORE AS passagens_pasageiro);
/*/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '71311506578',
        'Heitor da Silva',
        28,
        tp_fone_pessoa_array(
            tp_fone_pessoa('81938719135'),
            tp_fone_pessoa('48927017404')),
        tp_endereco('88311710', 'Rua Cardeal Arcoverde', '811', 'Campo Grande'),
        1,
        tp_lista_bagagem (tp_bagagem('1', 10))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '44527288989',
        'Geraldo Elias Rezende',
        57,
        tp_fone_pessoa_array(
            tp_fone_pessoa('61927753768'),
            tp_fone_pessoa('82930732883')),
        tp_endereco('29146671', 'Rua Benjamin', '241', 'Rio Branco'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '32008422704',
        'Sônia Márcia Valentina Galvão',
        43,
        tp_fone_pessoa_array(
            tp_fone_pessoa('22927356889'),
            tp_fone_pessoa('66929698631')),
        tp_endereco('76808221', 'Rua Sport Recife', '087', 'Recife'),
        0,
        tp_lista_bagagem (tp_bagagem('1', 10), tp_bagagem('2', 22))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '54657828622',
        'Bernardo Thomas da Cruz',
        19,
        tp_fone_pessoa_array(
            tp_fone_pessoa('31931643106'),
            tp_fone_pessoa('95926149210')),
        tp_endereco('69301300', 'Travessa dos Bandeirantes', '443', 'Cuiabá'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '03757527062',
        'Andreia Emily Lara Monteiro',
        32,
        tp_fone_pessoa_array(
            tp_fone_pessoa('96927765833'),
            tp_fone_pessoa('97938381573')),
        tp_endereco('57072790', 'Avenida Catarina Madureira', '130', 'Macapá'),
        1,
       tp_lista_bagagem (tp_bagagem('1', 5))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '64145381084',
        'Daniel Samuel Nelson Souza',
        25,
        tp_fone_pessoa_array(
            tp_fone_pessoa('63927389864'),
            tp_fone_pessoa('95930148765')),
        tp_endereco('89227701', 'Rua Nacional', '673', 'Manaus'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '01280004223',
        'Cláudio Carlos Eduardo Nogueira',
        37,
        tp_fone_pessoa_array(
            tp_fone_pessoa('83933786705'),
            tp_fone_pessoa('89922461832')),
        tp_endereco('21941210', 'Rua Arauana', '780', 'Rio de Janeiro'),
        0,
        tp_lista_bagagem (tp_bagagem('13', 2), tp_bagagem('21', 10), tp_bagagem('1', 15))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '73641828619',
        'Isaac Heitor Lucca Martins',
        42,
        tp_fone_pessoa_array(
            tp_fone_pessoa('96926617987'),
            tp_fone_pessoa('87937263836')),
        tp_endereco('59042200', 'Rua Turmalina', '818', 'Porto Velho'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '14121741633',
        'Giovanna Catarina Laura da Mota',
        39,
        tp_fone_pessoa_array(
            tp_fone_pessoa('98934582538'),
            tp_fone_pessoa('88925856576')),
        tp_endereco('45055788', 'Rua Otávio Sebastião', '575', 'Oficinas'),
        1,
        tp_lista_bagagem (tp_bagagem('1', 5))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '34988775267',
        'Isabella Vanessa Ferreira',
        53,
        tp_fone_pessoa_array(
            tp_fone_pessoa('61938756547'),
            tp_fone_pessoa('84932386557')),
        tp_endereco('59066454', 'Travessa Sargento do S. Macêdo', '259', 'Recife'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '49152142140',
        'Fernanda Ferreira',
        35,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783875547'),
            tp_fone_pessoa('849333657')),
        tp_endereco('59233454', 'Muro Verde', '11', 'Palmas'),
        0,
        tp_lista_bagagem (tp_bagagem('1', 32), tp_bagagem('7', 13))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '45238400756',
        'Ronaldo Vieira',
        20,
        tp_fone_pessoa_array(
            tp_fone_pessoa('221875347'),
            tp_fone_pessoa('849324567')),
        tp_endereco('59223421', 'Rua amarela', '11', 'Manaus'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '6893894227',
        'Caio Santos',
        24,
        tp_fone_pessoa_array(
            tp_fone_pessoa('999875547'),
            tp_fone_pessoa('852233621')),
        tp_endereco('46232254', 'Mauro Cesar', '233', 'Sao Paulo'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '69444744507',
        'Michel Ferreira',
        35,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783875547'),
            tp_fone_pessoa('849333657')),
        tp_endereco('59233454', 'Muro Verde', '11', 'Palmas'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '00853954550',
        'Michele Ferreira',
        35,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783875547'),
            tp_fone_pessoa('849333657')),
        tp_endereco('11233454', 'Verde', '110', 'Ibura'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '71518987702',
        'Marconi Ferreira',
        33,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783115547'),
            tp_fone_pessoa('149333650')),
        tp_endereco('59211454', 'Muro alto', '111', 'Ilha do Retiro'),
        0,
        tp_lista_bagagem (tp_bagagem('1', 8))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '40681591064',
        'Leandro Rosa',
        33,
        tp_fone_pessoa_array(
            tp_fone_pessoa('213415547'),
            tp_fone_pessoa('123459950')),
        tp_endereco('98811454', 'Prazeres', '333', 'Campo Grande'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '70740420801',
        'Raquel Lyra',
        45,
        tp_fone_pessoa_array(
            tp_fone_pessoa('998235547'),
            tp_fone_pessoa('210334950')),
        tp_endereco('23481954', 'Campina', '3', 'Roma'),
        0,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '69334029676',
        'Falconi Berenilson',
        33,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783115547'),
            tp_fone_pessoa('149333650')),
        tp_endereco('54300370', 'Ibura', '26', 'Vila do Sesi'),
        0,
        tp_lista_bagagem (tp_bagagem('1', 8), tp_bagagem('2', 8), tp_bagagem('3', 8), tp_bagagem('4', 8))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '78860429560',
        'Kaissa Silva',
        33,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783115547'),
            tp_fone_pessoa('149333650')),
        tp_endereco('51300370', 'Boa Viagem', '356', 'Entra Apulso'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '11096112183',
        'Luiz Inacio Lula da Silva',
        33,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783115547'),
            tp_fone_pessoa('149333650')),
        tp_endereco('51326558', 'Guarujá', '157', 'Triplex'),
        0,
        NULL
    )    
);
/


INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '27901161809',
        'Falcão Berenilson',
        73,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783225547'),
            tp_fone_pessoa('109333650')),
        tp_endereco('54300370', 'Rua Lugar', '260', 'Jardim'),
        1,
        NULL
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '98946747552',
        'Chico Bereni',
        75,
        tp_fone_pessoa_array(
            tp_fone_pessoa('783225547'),
            tp_fone_pessoa('109333650')),
        tp_endereco('54100370', 'Rua Jardim', '267', 'Jardins'),
        0,
        tp_lista_bagagem (tp_bagagem('1', 13), tp_bagagem('2', 22))
    )    
);
/

INSERT INTO tb_passageiro VALUES (
    tp_passageiro(
        '10982770669',
        'Marcos Castro',
        43,
        tp_fone_pessoa_array(
            tp_fone_pessoa('213225547'),
            tp_fone_pessoa('321311350')),
        tp_endereco('31231370', 'Rua Davi Pscicopata', '21', 'Jardim Brasil'),
        1,
        NULL
    )    
);
/




---------------- POVOAMENTO CIA AEREA ---------------------

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('06164253000187', 'Azul Airlines')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('09296295000160', 'Gol Airlines')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('02012862000160', 'LATAM Airlines')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('33136896000190', 'TAP Air Portugal')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('03834757000179', 'Copa Airlines')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('08692080000286', 'Emirates Airlines')
);

INSERT INTO tb_cia_aerea VALUES (
    tp_cia_aerea('36212637000199', 'American Airlines')
);

---------------- POVOAMENTO AVIAO ---------------------

-- Azul Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-YSG','A320neo',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-GGE', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-YRI', '737-900ER',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-YJF', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'))
);

-- Gol Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-GUZ', 'A320neo',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PS-GPA', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-AXT', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-FKW', '737-900ER',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'))
);

-- LATAM Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-FMZ', 'A320neo',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-FRI', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-FRS', 'A320',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'))
);

-- TAP Air Portugal
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GBO', 'A330',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GCT', 'A330',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'))
);
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GED', '737-900ER',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'))
);

-- Copa Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GFT','A320neo',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GGC','E195-E2',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'))
);

-- Emirates Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GKY','A330',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-GLM','A330',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'))
);

-- American Airlines
INSERT INTO tb_aviao VALUES (
    tp_aviao('PR-QUA','737-900ER',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'))
); 
INSERT INTO tb_aviao VALUES (
    tp_aviao('PP-HEE','737-800',
    (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'))
);

---------------- POVOAMENTO VOO    ---------------------

INSERT INTO tb_voo VALUES (74488,'13','Brasília','Recife');
INSERT INTO tb_voo VALUES (19525,'22','Porto Alegre','Recife');
INSERT INTO tb_voo VALUES (93742,'17','Joinville','Porto Alegre');
INSERT INTO tb_voo VALUES (17942,'12','Curitiba','São Paulo');
INSERT INTO tb_voo VALUES (85873,'11','Manaus','Macapá');
INSERT INTO tb_voo VALUES (78594,'08','Salvador','Rio Branco');
INSERT INTO tb_voo VALUES (83271,'25','Cuiabá','Belém');
INSERT INTO tb_voo VALUES (63128,'30','Palmas','Boa Vista');
INSERT INTO tb_voo VALUES (13582,'24','Brasília','Rio de Janeiro');

---------------- POVOAMENTO ESCALA ---------------------

-- Voo 74488
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 74488),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-YSG'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '27240059960')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 74488),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-YSG'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '09516032486')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 74488),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-YSG'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '82491793741')
    )
);

-- Voo 19525

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 19525),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GUZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 19525),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GUZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 19525),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GUZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 93742

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 93742),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FMZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 93742),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FMZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 93742),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FMZ'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 17942

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 17942),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-GBO'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 17942),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-GBO'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 17942),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-GBO'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 85873

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 85873),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-GFT'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 85873),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-GFT'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 78594

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 78594),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-QUA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 78594),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-QUA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 78594),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-QUA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);


-- Voo 83271

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 83271),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GGE'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 83271),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GGE'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 83271),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PR-GGE'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 63128

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 63128),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PS-GPA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 63128),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PS-GPA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 63128),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PS-GPA'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

-- Voo 13582

INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 13582),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FRI'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 13582),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FRI'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206')
    )
);
INSERT INTO tb_escala VALUES (
    tp_escala(
        (SELECT REF(V) FROM tb_voo V WHERE V.codigo = 13582),
        (SELECT REF(A) FROM tb_aviao A WHERE A.aviao_id = 'PP-FRI'),
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961')
    )
);

---------------- POVOAMENTO TRABALHA ---------------

INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'),
        to_date('01-02-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'),
        to_date('02-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '06164253000187'),
        to_date('01-02-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'),
        to_date('02-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'),
        to_date('02-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'),
        to_date('02-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'),
        to_date('07-06-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'),
        to_date('07-06-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '02012862000160'),
        to_date('07-06-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'),
        to_date('10-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'),
        to_date('10-05-2022' , 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'),
        to_date('10-05-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('20-06-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('20-06-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('20-06-2022', 'dd-mm-yyyy')
    )
);

------------------------------------------------------------------------

INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);

INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '36212637000199'),
        to_date('20-07-2022', 'dd-mm-yyyy')
    )
);

INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('24-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('24-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58615293961'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('24-07-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('24-07-2022', 'dd-mm-yyyy')
    )
);

--------------------------------------------------------------------------------

--- Primeiro Turno ---
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '27240059960'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'),
        to_date('10-09-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '82491793741'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'),
        to_date('10-09-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('10-09-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '34037975548'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('10-09-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('10-09-2022', 'dd-mm-yyyy')
    )
);

-------------------------------------------------------------------------------

--- Primeiro Turno ---
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '28158159664'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '09296295000160'),
        to_date('20-08-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '82491793741'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '33136896000190'),
        to_date('20-08-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('20-08-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '95441453206'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '08692080000286'),
        to_date('20-08-2022', 'dd-mm-yyyy')
    )
);
INSERT INTO tb_trabalha VALUES (
    tp_trabalha(
        (SELECT REF(T) FROM tb_tripulante T WHERE T.cpf = '58777771907'),
        (SELECT REF(C) FROM tb_cia_aerea C WHERE C.cnpj = '03834757000179'),
        to_date('20-08-2022', 'dd-mm-yyyy')
    )
);

------------------------------------------Povoamento tb_compra -----------------------------------------------------



insert into tb_compra values ('312984064',759,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '02012862000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '00853954550')
);
/

    
insert into tb_compra values ('178693652',545,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '06164253000187'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '69444744507')
);
/

insert into tb_compra values ('981102074',4243,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '03834757000179'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '71518987702')
);
/    

insert into tb_compra values ('495663180',3175,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '09296295000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '40681591064')
);
/

insert into tb_compra values ('349971622',8691,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '33136896000190'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '32008422704')
);
/

insert into tb_compra values ('461179953',6688,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '02012862000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '70740420801')
);
/


insert into tb_compra values ('537887656',3960,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '09296295000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '32008422704')
);
/


insert into tb_compra values ('258183477',4245,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '08692080000286'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '45238400756')
);
/

insert into tb_compra values ('388389369',25044,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '36212637000199'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '69444744507')
);
/

insert into tb_compra values ('589003455',19000,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '08692080000286'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '71311506578')
);
/

insert into tb_compra values ('113359863',2030,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '09296295000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '44527288989')
);
/

insert into tb_compra values ('472676094',2000,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '06164253000187'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '44527288989')
);
/


insert into tb_compra values ('664171520',960,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '33136896000190'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '54657828622')
);
/


insert into tb_compra values ('486218148',10096,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '02012862000160'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '03757527062')
);
/

 
insert into tb_compra values ('944334495',5000,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '36212637000199'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '71518987702')
);
/


insert into tb_compra values ('468220465', 0,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '33136896000190'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '64145381084')
);
/



insert into tb_compra values ('222559602',5200,
    (SELECT REF(c) FROM tb_cia_aerea c WHERE c.cnpj = '03834757000179'),
    (SELECT REF(p) FROM tb_passageiro p WHERE p.cpf = '00853954550')
);
/
------------------------------------------Povoamento tb_passagem -----------------------------------------------------

insert into tb_passagem values ('A07G9E','16B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 74488),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '312984064')
);
insert into tb_passagem values ('BU1Z8C','17B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 74488),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '178693652')
);
insert into tb_passagem values ('K8RPZ8','42A',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 74488),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '178693652')
);

insert into tb_passagem values ('O763QT','15A',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 19525),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '981102074')
);
insert into tb_passagem values ('NQZWKR','76A',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 19525),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '495663180')
);

insert into tb_passagem values ('WN8IRT','15B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 93742),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '349971622')
);
insert into tb_passagem values ('JZQ8HP','22A',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 93742),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '461179953')
);

insert into tb_passagem values ('R9B2JB','33B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 17942),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '537887656')
);
insert into tb_passagem values ('LZVDVI','44B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 17942),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '258183477')
);
insert into tb_passagem values ('IV69IY','31B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 78594),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '472676094')
);
insert into tb_passagem values ('ZW4BIC','32B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 78594),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '664171520')
);
insert into tb_passagem values ('BXIK5Y','33B',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 78594),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '486218148')
);

insert into tb_passagem values ('JFLSYR','52C',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 83271),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '944334495')
);
insert into tb_passagem values ('Q4Y49R','53C',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 83271),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '468220465')
);
insert into tb_passagem values ('FZ6S1N','32A',
    (SELECT REF(v) FROM tb_voo v WHERE v.codigo = 83271),
    (SELECT REF(c) FROM tb_compra c WHERE c.id_compra = '222559602')
);
