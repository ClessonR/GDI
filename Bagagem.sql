/* create table Bagagem_tb (
    
    cpf_pa varchar2(11),
    bag_id integer,
    peso float, 
    inspecao integer,
    Check (inspecao = 1 OR inspecao = 0),
    CONSTRAINT Bagagem_tb_pk PRIMARY KEY (cpf_pa, bag_id),
    CONSTRAINT Bagagem_tb_fk FOREIGN KEY (cpf_pa)
        REFERENCES Passageiro_tb (cpf_pe)
                        
);
 */
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('18683894487', 1, 1.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('49152142140', 2, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('45238400756', 3, 2.5, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69444744507', 4, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('00853954550', 5, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('71518987702', 6, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('40681591064', 7, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('70740420801', 8, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('71311506578', 9, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('44527288989', 10, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('32008422704', 11, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('64145381084', 12, 2.0, 1);  

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('54657828622', 13, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('03757527062', 14, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('01280004223', 15, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('73641828619', 16, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('14121741633', 17, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('34988775267', 18, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('10982770669', 19, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('98946747552', 20, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('27901161809', 21, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('11096112183', 22, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('78860429560', 23, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69334029676', 24, 2.0, 1);


