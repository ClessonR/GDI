/*create table Escala_tb (
    
    id_aviao varchar2(10), 
    codigo_voo integer, 
    cpf_tri varchar2(11), 
    data_escala TIMESTAMP,
    CONSTRAINT Escala_tb_pk PRIMARY KEY (id_aviao, codigo_voo, cpf_tri),
    CONSTRAINT Escala_tb_fk1 FOREIGN KEY (id_aviao)
        REFERENCES Aviao_tb (aviao_id),
    CONSTRAINT Escala_tb_fk2 FOREIGN KEY (codigo_voo)
        REFERENCES Voo_tb (codigo),
    CONSTRAINT Escala_tb_fk3 FOREIGN KEY (cpf_tri)
        REFERENCES Tripulante_tb (cpf_pe)

);*/


-- voo 74488

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-YSG',74488,'06059026150','21-06-2022 13:14:22');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-YSG',74488,'27240059960','21-06-2022 13:14:22');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-YSG',74488,'09516032486','21-06-2022 13:14:22');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-YSG',74488,'82491793741','22-06-2022 14:15:12');


--voo 19525

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GUZ',19525,'38627188670','22-05-2022 12:34:01');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GUZ',19525,'28158159664','20-05-2022 13:50:05');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GUZ',19525,'95441453206','21-05-2022 08:44:21');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GUZ',19525,'58615293961','22-05-2022 12:34:01');


--voo 93742

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FMZ',93742,'38627188670','19-05-2022 17:54:12');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FMZ',93742,'28158159664','19-05-2022 17:54:12');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FMZ',93742,'95441453206','19-05-2022 17:54:12');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FMZ',93742,'58615293961','19-05-2022 17:54:12');


--voo 17942

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GBO',17942,'06059026150','10-08-2022 10:45:53');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GBO',17942,'27240059960','10-08-2022 11:55:33');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GBO',17942,'09516032486','10-08-2022 09:37:13');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GBO',17942,'58777771907','10-08-2022 11:55:33');


--voo 85873

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GFT',85873,'38627188670','09-02-2022 15:31:06');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GFT',85873,'28158159664','09-02-2022 15:31:06');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GFT',85873,'95441453206','09-02-2022 15:31:06');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GFT',85873,'34037975548','09-02-2022 15:31:06');


--voo 84828

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GKY',84828,'06059026150','05-03-2022 09:15:37');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GKY',84828,'27240059960','08-03-2022 08:13:17');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GKY',84828,'82491793741','08-03-2022 08:13:17');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-GKY',84828,'58777771907','06-03-2022 18:10:14');


--voo 78594

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-QUA',78594,'38627188670','26-08-2022 16:09:45');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-QUA',78594,'28158159664','26-08-2022 16:09:45');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-QUA',78594,'58615293961','26-08-2022 16:09:45');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-QUA',78594,'34037975548','26-08-2022 16:09:45');


--voo 83271

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GGE',83271,'06059026150','30-04-2022 10:12:11');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GGE',83271,'27240059960','28-04-2022 11:52:31');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GGE',83271,'09516032486','28-04-2022 11:15:31');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PR-GGE',83271,'82491793741','30-04-2022 10:12:11');


--voo 63128

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PS-GPA',63128,'38627188670','29-07-2022 14:08:09');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PS-GPA',63128,'28158159664','29-07-2022 14:08:09');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PS-GPA',63128,'34037975548','29-07-2022 14:08:09');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PS-GPA',63128,'58615293961','29-07-2022 14:08:09');


--voo 13582

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FRI',13582,'06059026150','21-05-2022 12:36:38');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FRI',13582,'27240059960','21-05-2022 12:36:38');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FRI',13582,'82491793741','21-05-2022 12:36:38');

insert into Escala_tb (id_aviao,codigo_voo,cpf_tri,data_escala)
    values ('PP-FRI',13582,'58777771907','21-05-2022 12:36:38');