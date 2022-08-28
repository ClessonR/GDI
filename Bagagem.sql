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
            values ('49152142140', 1, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('45238400756', 1, 2.5, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69444744507', 1, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('00853954550', 1, 2.0, 1);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('71518987702', 1, 2.0, 0);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('40681591064', 1, 2.0, 0);

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('70740420801', 1, 2.0, 0);


-- levam 2 bagagens

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('71311506578', 1, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('71311506578', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('44527288989', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('44527288989', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('32008422704', 1, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('32008422704', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('64145381084', 1, 2.0, 1); 
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
        values ('64145381084', 2, 2.0, 1);  


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('54657828622', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('54657828622', 2, 2.0, 0);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('03757527062', 1, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('03757527062', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('01280004223', 1, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('01280004223', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('73641828619', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('73641828619', 2, 2.0, 1);

            
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('14121741633', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('14121741633', 2, 2.0, 1);


insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('34988775267', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('34988775267', 2, 2.0, 0);


-- levam 3 bagagens

insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('10982770669', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('10982770669', 2, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('10982770669', 3, 2.0, 1);



insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('98946747552', 1, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('98946747552', 2, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('98946747552', 3, 2.0, 1);



insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('27901161809', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('27901161809', 2, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('27901161809', 3, 2.0, 1);



insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('11096112183', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('11096112183', 2, 2.0, 0);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('11096112183', 3, 2.0, 0);



insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('78860429560', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('78860429560', 2, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('78860429560', 3, 2.0, 1);



insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69334029676', 1, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69334029676', 2, 2.0, 1);
insert into Bagagem_tb (cpf_pa, bag_id, peso, inspecao)
            values ('69334029676', 3, 2.0, 1);

