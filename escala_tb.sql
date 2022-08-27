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

PR-YSG--airbus
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
FAB2584

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YSG',85873,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GGE',78594,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GUZ',8050,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YRI',2384,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PS-GPA',5159,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-AXT',3579,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-GXR',3579,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PS-BIR',3579,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('PR-YSG',3579,'06059026150','21-06-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cfp_tri,data_escala)
    values ('FAB2584',3579,'06059026150','21-06-2022 12:34:01');