/* create table Endereco_tb (

    cpf varchar2(11),
    numero varchar2(10),
    CEP varchar2(8),
    CONSTRAINT Endereco_tb_pk PRIMARY KEY (cpf),
    CONSTRAINT Endereco_tb_fk FOREIGN KEY (cpf)
        REFERENCES Pessoa_tb (cpf),
    CONSTRAINT Endereco_tb_fk2 FOREIGN KEY (CEP)
        REFERENCES CEP_tb (CEP)
); */

insert into Endereco_tb (cpf,numero,cep)
    values ('71311506578','811','88311710');

insert into Endereco_tb (cpf,numero,cep)
    values ('44527288989','241','29146671');

insert into Endereco_tb (cpf,numero,cep)
    values ('32008422704','896','76808221');

insert into Endereco_tb (cpf,numero,cep)
    values ('34988775267','443','69301300');

insert into Endereco_tb (cpf,numero,cep)
    values ('54657828622','130','57072790');

insert into Endereco_tb (cpf,numero,cep)
    values ('03757527062','673','89227701');

insert into Endereco_tb (cpf,numero,cep)
    values ('64145381084','780','21941210');

insert into Endereco_tb (cpf,numero,cep)
    values ('01280004223','818','59042200');

insert into Endereco_tb (cpf,numero,cep)
    values ('73641828619','575','45055788');

insert into Endereco_tb (cpf,numero,cep)
    values ('14121741633','259','59066454');

insert into Endereco_tb (cpf,numero,cep)
    values ('18683894487','228','51160061');

insert into Endereco_tb (cpf,numero,cep)
    values ('49152142140','866','83320160');

insert into Endereco_tb (cpf,numero,cep)
    values ('45238400756','690','64075595');

insert into Endereco_tb (cpf,numero,cep)
    values ('69444744507','772','35430252');

insert into Endereco_tb (cpf,numero,cep)
    values ('00853954550','600','78721040');

insert into Endereco_tb (cpf,numero,cep)
    values ('71518987702','268','78734172');

insert into Endereco_tb (cpf,numero,cep)
    values ('40681591064','552','65606740');

insert into Endereco_tb (cpf,numero,cep)
    values ('70740420801','963','58046514');

insert into Endereco_tb (cpf,numero,cep)
    values ('10982770669','364','69313179');

insert into Endereco_tb (cpf,numero,cep)
    values ('98946747552','106','69914268');

insert into Endereco_tb (cpf,numero,cep)
    values ('27901161809','615','66821080');

insert into Endereco_tb (cpf,numero,cep)
    values ('11096112183','735','70670600');

insert into Endereco_tb (cpf,numero,cep)
    values ('78860429560','679','69050147');

insert into Endereco_tb (cpf,numero,cep)
    values ('69334029676','595','74350760');

insert into Endereco_tb (cpf,numero,cep)
    values ('06059026150','401','88095370');

insert into Endereco_tb (cpf,numero,cep)
    values ('38627188670','502','74660020');

insert into Endereco_tb (cpf,numero,cep)
    values ('27240059960','816','64013520');

insert into Endereco_tb (cpf,numero,cep)
    values ('28158159664','227','69309515');

insert into Endereco_tb (cpf,numero,cep)
    values ('09516032486','237','88502280');

insert into Endereco_tb (cpf,numero,cep)
    values ('82491793741','665','64204220');

insert into Endereco_tb (cpf,numero,cep)
    values ('58777771907','415','57048036');

insert into Endereco_tb (cpf,numero,cep)
    values ('95441453206','504','50670610');

insert into Endereco_tb (cpf,numero,cep)
    values ('58615293961','457','33820570');

insert into Endereco_tb (cpf,numero,cep)
    values ('34037975548','433','89163107');
