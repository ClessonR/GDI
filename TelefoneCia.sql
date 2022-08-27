create table Telefone_Comp_aerea_tb (
    
    cnpj_cia varchar2(14),
    contato varchar2(15),
    CONSTRAINT Telefone_Comp_aerea_tb PRIMARY KEY(cnpj_cia, contato),
    CONSTRAINT Telefone_Comp_aerea_fk FOREIGN KEY (cnpj_cia)
        REFERENCES Comp_aerea_tb (cnpj)
    
);

-- Azul
insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '40031118');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '08008871118');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '40033255');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '+18885872985');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '+351800602985');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '40031181');

-- Gol

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '03001152121');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '+551155044410');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '08007090466');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '03001157007');

-- LATAM

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '03005705700');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '40025700');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '551140025700');

-- TAP

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '08007272347');

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '08008882099');

-- COPA

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '551149332399');

-- EMIRATES

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '+551155035000');

-- AA

insert into Telefone_Comp_aerea_tb (cnpj_cia, contato)
    values ('06164253000187', '30045000');
