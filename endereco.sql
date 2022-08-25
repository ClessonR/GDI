create table Endereco_tb (
    cpf varchar2(11) , 
    numero varchar2(10), 
    CEP varchar2(9), 
    cidade varchar2(50),
        CONSTRAINT Endereco_tb_pk PRIMARY KEY (cpf),
        CONSTRAINT Endereco_tb_fk FOREIGN KEY (cpf)
        REFERENCES Pessoa_tb (cpf));

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('71311506578','811','88311710','Itajaí');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('44527288989','241','29146671','Cariacica');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('32008422704','896','76808221','Caladinho');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('34988775267','443','69301300','Boa Vista');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('54657828622','130','57072790','Maceió');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('03757527062','673','89227701','Joinville');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('64145381084','780','21941210','Rio de Janeiro');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('01280004223','818','59042200','Natal');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('73641828619','575','45055788','Vitória da Conquista');

insert into Endereco_tb (cpf,numero,cep,cidade)
    values ('14121741633','259','59066454','Campo Grande');

