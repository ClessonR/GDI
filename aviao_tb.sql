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

insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YSG','06164253000187','A320neo') 
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRI','02012862000160','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YJF','06164253000187','A320')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GGE','09296295000160','Gol Airlines')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GUZ','06164253000187','Gol Airlines')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PS-GPA','American Airlines','737-700')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-AXT','Emirates Airlines','737-800')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GXR','Gol Airlines','737-700')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('F-GZNR','TAP Air Portugal','A330')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-GGR','LATAM Airlines','A320neo')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PS-BIR','Azul Airlines','E195-E2')
insert into Aviao_tb (aviao_id,cnpj_cia,tipo) values ('PR-YRO','Azul Airlines','E195-E2')

