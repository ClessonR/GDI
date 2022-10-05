/* create table Passageiro_tb (
    
    cpf_pe varchar2(11), 
    fidelidade integer,
    Check (fidelidade = 1 OR fidelidade = 0),
    CONSTRAINT Passageiro_tb_pk PRIMARY KEY (cpf_pe),
    CONSTRAINT Passageiro_tb_fk FOREIGN KEY (cpf_pe)
        REFERENCES Pessoa_tb(cpf)
        
);
 */

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('18683894487', 0);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('49152142140', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('45238400756', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('69444744507', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('00853954550', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('71518987702', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('40681591064', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('70740420801', 0);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('71311506578', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('44527288989', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('32008422704', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('54657828622', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('03757527062', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('64145381084', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('01280004223', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('73641828619', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('14121741633', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('34988775267', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('10982770669', 0);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('98946747552', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('27901161809', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('11096112183', 1);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('78860429560', 0);

insert into Passageiro_tb (cpf_pe, fidelidade)
    values ('69334029676', 1);