/* 
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-mm-yyyy';

create table Trabalha_tb (
    cnpj_cia varchar2(14),
    cpf_tri varchar2(11),
    data_trabalha date,
    CONSTRAINT Trabalha_tb_pk PRIMARY KEY (cnpj_cia, cpf_tri, data_trabalha),
    CONSTRAINT Trabalha_tb_fk1 FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj),
    CONSTRAINT Trabalha_tb_fk2 FOREIGN KEY (cpf_tri)
        REFERENCES Tripulante_tb (cpf_pe)
);

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) values ();
 */
--- Primeiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto 
    values ('06164253000187','06059026150','01-02-2022' );

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('06164253000187','95441453206','01-02-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('06164253000187','58615293961','01-02-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('06164253000187','34037975548','01-02-2022');

--- Segundo Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto 
    values ('09296295000160','06059026150','02-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('09296295000160','95441453206','02-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('09296295000160','58615293961','02-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('09296295000160','34037975548','02-05-2022');

--- Terceiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto 
    values ('02012862000160','06059026150','07-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('02012862000160','95441453206','07-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('02012862000160','58615293961','07-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('02012862000160','34037975548','07-06-2022');

--- Quarto Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto 
    values ('33136896000190','06059026150','10-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('33136896000190','95441453206','10-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('33136896000190','58615293961','10-05-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','34037975548','10-05-2022');

--- Quinto Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto 
    values ('03834757000179','06059026150','20-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','95441453206','20-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','58615293961','20-06-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','34037975548','20-06-2022');

--- --- ---- ----
--- Primeiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto
    values ('08692080000286','38627188670','20-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','58777771907','20-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','95441453206','20-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','58615293961','20-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','34037975548','20-07-2022');

--- Segundo Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto
    values ('36212637000199','38627188670','22-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('36212637000199','58777771907','22-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('36212637000199','95441453206','22-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('36212637000199','58615293961','22-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('36212637000199','34037975548','22-07-2022');

--- Terceiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto
    values ('03834757000179','38627188670','24-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','58777771907','24-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','95441453206','24-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','58615293961','24-07-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','34037975548','24-07-2022');

--- --- ---- ----
--- Primeiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto
    values ('09296295000160','27240059960','10-09-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('33136896000190','82491793741','10-09-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','95441453206','10-09-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','34037975548','10-09-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','58777771907','10-09-2022');

--- --- ---- ----
--- Primeiro Turno ---
insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Piloto
    values ('09296295000160','28158159664','20-08-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('33136896000190','82491793741','20-08-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('03834757000179','58777771907','20-08-2022');

insert into Trabalha_tb (cnpj_cia,cpf_tri,data_trabalha) -- Comissário
    values ('08692080000286','95441453206','20-08-2022');

