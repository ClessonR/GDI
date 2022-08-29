/*create table Aviao_tb (
    aviao_id varchar2(10), 
    cnpj_cia varchar2(14), 
    tipo varchar2(100),
    CONSTRAINT Aviao_tb_pk PRIMARY KEY (aviao_id),
    CONSTRAINT Aviao_tb_fk FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Aviao_tb_fk2 FOREIGN KEY (tipo)
        REFERENCES Modelo_aviao_tb (tipo_aviao)     
);*/


-- Azul Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','06164253000187','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GGE','06164253000187','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','06164253000187','737-900ER') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YJF','06164253000187','A320')

-- Gol Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GUZ','09296295000160','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PS-GPA','09296295000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-AXT','09296295000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-FKW','09296295000160','737-900ER')

-- LATAM Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-FMZ','02012862000160','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-FRI','02012862000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-FRS','02012862000160','A320')

--TAP Air Portugal
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GBO','33136896000190','A330')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GCT','33136896000190','A330')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GED','33136896000190','737-900ER')

-- Copa Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GFT','03834757000179','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GGC','03834757000179','E195-E2')

-- Emirates Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GKY','08692080000286','A330') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-GLM','08692080000286','A330')

-- American Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-QUA','06164253000187','737-900ER') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PP-HEE','36212637000199','737-800')