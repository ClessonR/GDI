create table Aviao_tb (
    aviao_id varchar2(10), 
    cnpj_cia varchar2(14), 
    tipo varchar2(100),
    CONSTRAINT Aviao_tb_pk PRIMARY KEY (aviao_id),
    CONSTRAINT Aviao_tb_fk FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Aviao_tb_fk2 FOREIGN KEY (tipo)
        REFERENCES Modelo_aviao_tb (tipo_aviao)     
);

-- Azul Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','06164253000187','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GGE','06164253000187','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','06164253000187','737-900ER') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','06164253000187','A320')

-- Gol Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','09296295000160','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','09296295000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YJF','09296295000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GGE','09296295000160','737-900ER')

-- LATAM Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','02012862000160','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','02012862000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YJF','02012862000160','A320')

--TAP Air Portugal
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GUZ','33136896000190','A330')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PS-GPA','33136896000190','A330')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-AXT','33136896000190','737-900ER')

-- Copa Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','03834757000179','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','03834757000179','E195-E2')

-- Emirates Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','08692080000286','A330') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','08692080000286','A330')

-- American Airlines
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','06164253000187','737-900ER') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','36212637000199','737-800')

