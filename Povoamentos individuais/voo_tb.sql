/*
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'dd-mm-yyyy hh24:mi:ss';

create table Voo_tb (

    codigo integer, 
    portao varchar2(3), 
    local_partida varchar2(100), 
    local_chegada varchar2(100),
    data_partida TIMESTAMP, 
    data_chegada TIMESTAMP,
    CONSTRAINT Voo_tb_pk PRIMARY KEY (codigo)
             
);*/

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (74488,'13','Brasília','Recife','25-06-2022 13:14:22','25-06-2022 16:25:21');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (19525,'22','Porto Alegre','Recife','27-05-2022 12:34:01','27-05-2022 19:37:51');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (93742,'17','Joinville','Porto Alegre','26-06-2022 13:14:22','26-06-2022 15:10:27');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (17942,'12','Curitiba','São Paulo','15-08-2022 11:55:33','15-08-2022 14:40:10');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (85873,'11','Manaus','Macapá','14-02-2022 15:31:06','14-02-2022 18:15:08');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (84828,'01','Recife','Petrolina','13-03-2022 08:13:17','13-03-2022 10:10:18');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (78594,'08','Salvador','Rio Branco','31-08-2022 16:09:45','31-08-2022 20:15:55');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (83271,'25','Cuiabá','Belém','04-05-2022 10:12:11','04-05-2022 13:17:13');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (63128,'30','Palmas','Boa Vista','05-08-2022 14:08:09','05-08-2022 21:08:09');

insert into Voo_tb (codigo,portao,local_partida,local_chegada,data_partida,data_chegada)
    values (13582,'24','Brasília','Rio de Janeiro','26-05-2022 12:36:38','26-05-2022 14:50:36');