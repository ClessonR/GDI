/*create table Compra_tb (

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
    
);*/

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (350326078, '06164253000187', 3000.50, 0, '18683894487');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (264400458, '09296295000160', 1500.50, 10, '49152142140');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (312984064, '02012862000160', 759.00, 0, '00853954550');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (178693652, '06164253000187', 545.00, 15, '69444744507');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (981102074, '03834757000179', 4243.75, 10, '71518987702');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (495663180, '09296295000160', 3175.25, 5, '40681591064');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (349971622, '33136896000190', 8691.00, 0, '32008422704');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (461179953, '02012862000160', 6688.00, 0, '70740420801');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (537887656, '09296295000160', 3960.70, 20, '32008422704');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (258183477, '08692080000286', 4245.30, 0, '45238400756');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (738412219, '06164253000187', 3175.40, 0, '18683894487');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (388389369, '36212637000199', 25044.50, 0, '69444744507');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (589003455, '08692080000286', 19000.00, 10, '71311506578');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (113359863, '09296295000160', 2030.25, 0, '44527288989');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (472676094, '06164253000187', 2000.37, 0, '44527288989');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (664171520, '33136896000190', 960.21, 20, '54657828622');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (486218148, '02012862000160', 10096.20, 5, '03757527062');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (944334495, '36212637000199', 5000.00, 0, '71518987702');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (468220465, '33136896000190', 0.00, 100, '64145381084');

insert into Compra_tb (id_compra, cnpj_cia, valor, porcentagem, cpf_pa)
    values (222559602, '03834757000179', 5200.00, 0, '00853954550');