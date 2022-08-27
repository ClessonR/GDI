/*create table Escala_tb (
    
    id_aviao integer, 
    codigo_voo integer, 
    cpf_tri varchar2(11), 
    data_escala date,
    CONSTRAINT Escala_tb_pk PRIMARY KEY (id_aviao, codigo_voo, cpf_tri),
    CONSTRAINT Escala_tb_fk1 FOREIGN KEY (id_aviao)
        REFERENCES Aviao_tb (aviao_id),
    CONSTRAINT Escala_tb_fk2 FOREIGN KEY (codigo_voo)
        REFERENCES Voo_tb (codigo),
    CONSTRAINT Escala_tb_fk3 FOREIGN KEY (cpf_tri)
        REFERENCES Tripulante_tb (cpf_pe)

);*/

/*PR-YSG--airbus
PR-GGE--boing
PR-GUZ
PR-YRI
PS-GPA

PR-AXT
PR-YJF
PR-GXR
F-GZNR
PR-GGR

PR-YSI
PS-BIR--particular
PR-YYJ
PR-YRO
FAB2584*/

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YSG',74488,'06059026150','21-06-2022 13:14:22');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GGE',19525,'38627188670','22-05-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GUZ',93742,'27240059960','19-01-2022 17:54:12');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YRI',17942,'28158159664','10-08-2022 11:55:33');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PS-GPA',85873,'09516032486','09-02-2022 15:31:06');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-AXT',84828,'82491793741','08-03-2022 08:13:17');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GXR',78594,'95441453206','26-08-2022 16:09:45');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PS-BIR',83271,'95441453206','30-04-2022 10:12:11');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YSG',63128,'09516032486','29-07-2022 14:08:09');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('FAB2584',13582,'34037975548','21-05-2022 12:36:38');