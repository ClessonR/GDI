-- SQL

-- 1) Alterando coluna e depois alterando de volta
alter table pessoa_tb RENAME COLUMN idade TO age;
alter table pessoa_tb RENAME COLUMN age TO idade;
/
-- 2. Create index na tabela endereço e na coluna CPF;
--erro
CREATE INDEX idx_edc
ON endereco_tb(numero);
/


-- 3 & 5) Inserindo linha em COMP AEREA e logo em seguida deletando-a
insert into Comp_aerea_tb (cnpj, nome)
    values ('29609139000119', 'malaysia airlines');
DELETE from Comp_aerea_tb WHERE cnpj = '29609139000119';
/

-- 4) o local de destino do voo de código 93742 deveria ser Recife em vez de Porto Alegre
update voo_tb
set local_chegada = 'Recife'
WHERE codigo = '93742';
/

-- 6/8/11) consultar nome, cpf, idade e fidelidade dos Passageiros que residem em Recife ou Rondonópolis
select P.nome, P.cpf, P.idade, PA.fidelidade
from pessoa_tb P
    inner join endereco_tb E
        on P.cpf = E.cpf
    inner join cep_tb C
        on E.cep = C.cep
    inner join passageiro_tb PA
        on P.cpf = PA.cpf_pe
where C.cidade in ('Recife', 'Rondonópolis')
/

-- 7) Exibir nome e cpf dos funcionários que trabalharam nos meses de junho e julho
select P.nome, P.cpf
from trabalha_tb T
    inner join tripulante_tb TR
        on T.cpf_tri = TR.cpf_pe
    inner join pessoa_tb P
        on TR.cpf_pe = P.cpf
where T.data_trabalha between to_date('01/06/2022', 'dd/mm/yyyy') and to_date('30/07/2022', 'dd/mm/yyyy')
group by (P.nome,P.cpf)
/

-- 9) Selecina passageiros cujo nome se inicia pela letra 'M'
select P.cpf, P.nome, P.idade
from pessoa_tb P
    inner join passageiro_tb PA
        on P.cpf = PA.cpf_pe
WHERE nome LIKE 'M%';
/

-- 12/18) consultar compra(s) com maior percentual de desconto exibindo o ID da compra o percentual do desconto e o nome do comprador

select C.id_compra, C.porcentagem, P.nome 
from compra_tb C
    inner join passageiro_tb PA
        on C.cpf_pa = PA.cpf_pe
    inner join pessoa_tb P
        on PA.cpf_pe = P.cpf
where porcentagem in (select max(porcentagem) from compra_tb)
/

-- 10) Selecionar apenas os tripulantes supervisionados
select P.nome, T.cadastro, T.cargo
from tripulante_tb T
    inner join pessoa_tb P
        on P.cpf = T.cpf_pe
where cadastro_supervisor is not null
/

-- 14) consultar a média de bagagens que uma pessoa carrega
select avg(tot_bagagem)
from (select cpf_pa, count(*) as tot_bagagem
from bagagem_tb
group by cpf_pa)
/

-- 16 Mostrar todos os dados dos tripulantes dado que seu cargo é comissário
SELECT * from pessoa_tb 
FULL OUTER JOIN tripulante_tb 
ON pessoa_tb.CPF = tripulante_tb.CPF_PE
WHERE tripulante_tb.CARGO = 'Comissário'
/

-- 17 Selecionando o cnpj e o nome de uma companhia aerea baseando-se apenas no seu número;
SELECT * FROM COMP_AEREA_TB WHERE COMP_AEREA_TB.CNPJ = 
(SELECT CNPJ_CIA FROM TELEFONE_COMP_AEREA_TB WHERE TELEFONE_COMP_AEREA_TB.contato ='08008871118');
/

-- 22/15) mostrar a quantidade de aviões que cada companhia aérea possui
select C.nome as cia_aerea, count(*) as tot_aeronaves
from aviao_tb A
    inner join comp_aerea_tb C
        on A.cnpj_cia = C.cnpj
group by C.nome
/

-- 19)Retorna as colunas de todas as pessoas que são tripulantes com cargo de piloto
SELECT * FROM pessoa_tb
WHERE cpf = ANY (SELECT cpf_pe FROM tripulante_tb WHERE cargo = 'Piloto');
/

-- 20)o nomes e cpf dos funcionários cujo salário é maior que o salário de todos os funcionários da gol
SELECT p.nome, p.cpf from pessoa_tb p, tripulante_tb tt
    WHERE tt.salario > ALL (select t.salario from tripulante_tb t 
                            inner join trabalha_tb tra on t.cpf_pe = tra.cpf_tri 
                            inner join comp_aerea_tb comp on tra.cnpj_cia = comp.cnpj
                            where comp.nome = 'Gol Airlines');
/

-- 24) Retorna todos os aviões que estão escalados.
SELECT id_aviao FROM escala_tb
UNION
SELECT aviao_id FROM aviao_tb
/

-- 22/23) Retorna o cpf de todos os passageiros que já compraram mais de 10.000 em passagens*/
SELECT cpf_pa, SUM(valor) AS total FROM compra_tb
GROUP BY cpf_pa
HAVING SUM(valor) > 10000;
/

-- 13/25) cria view sobre a lotação de cada voo e dps consulta os voos com a menor lotação

create or replace view capacidade_voo_tb (voo, ocupacao) as
select codigo_voo, count(*)
from passagem_tb
group by codigo_voo;

select * from capacidade_voo_tb;

select * from capacidade_voo_tb
where ocupacao in (select min(ocupacao) from capacidade_voo_tb)
/
-- 21) exibir informações de cpf, cargo e salário dos tripulantes ordenados por salário 
select cpf_pe, cargo, salario
from tripulante_tb
order by salario DESC
/

------------------------------ PL --------------------------------

-- 4/6) Procedimento que calcula a soma do peso de todas as bagagens que um passageiro possui
CREATE OR REPLACE PROCEDURE peso_total_bagage (cpf bagagem_tb.cpf_pa%TYPE) 
IS
    tot_weight bagagem_tb.peso%TYPE;
begin
    select sum(bagagem_tb.peso) into tot_weight
    from bagagem_tb
    where bagagem_tb.cpf_pa = cpf;

    --print tot_weight;
    dbms_output.put_line('Peso: ' || tot_weight ||'kg');
    
end peso_total_bagage;
/
execute peso_total_bagage('10982770669');
/

-- 11) WHILE LOOP para mostrar o nome, cpf e número de cadastro de cada tripulante.
DECLARE
cpf_piloto tripulante_tb.cpf_pe%TYPE;
cadastro tripulante_tb.cadastro%TYPE;
nome pessoa_tb.nome%TYPE;
contador NUMBER;

BEGIN
    SELECT COUNT(*) INTO contador
    FROM tripulante_tb;
    
    WHILE (contador > 0) LOOP
    
        SELECT CPF_PE INTO cpf_piloto
        FROM tripulante_tb
        WHERE cadastro = contador;
        
        SELECT pessoa_tb.nome INTO nome
        FROM pessoa_tb
        WHERE cpf = cpf_piloto;
    
        DBMS_OUTPUT.PUT_LINE ('O tripulante '||nome||' de CPF:'|| cpf_piloto || ' possui o cadastro número '|| contador);
        contador := contador - 1;
    END LOOP;
END;
/

-- 12 FOR LOOP para descobrir quanto cada passageiro pagou em cada passagem.
DECLARE
  CURSOR c_product
  IS
    SELECT 
        CPF_PA, VALOR, PORCENTAGEM
    FROM 
        Compra_tb;
BEGIN
  FOR r_product IN c_product
  LOOP
    dbms_output.put_line( 'O cliente de CPF:' ||r_product.CPF_PA  ||' pagou R$' ||  r_product.VALOR || ' com ' || r_product.PORCENTAGEM || '% de desconto.');
  END LOOP;
END;
/

-- 3/10/14) o LOOP armazena na variável cpf_Salario_trip o CPF e o salário dos tripulantes que recebem um salário de 5000.00 ou mais. 
-- o LOOP é interrompido quando detectada falta de dados no cursor cursor_func

DECLARE
    
    iterator BINARY_INTEGER := 0;
    trip_cpf tripulante_tb.cpf_pe%TYPE;
    trip_salario tripulante_tb.salario%TYPE;
    TYPE tripInfo IS RECORD (salario tripulante_tb.salario%TYPE, cpf tripulante_tb.cpf_pe%TYPE);
    TYPE TabelaTrip IS TABLE OF tripInfo INDEX BY BINARY_INTEGER;
    cpf_Salario_trip TabelaTrip;
    CURSOR cursor_trip IS SELECT cpf_pe, salario FROM tripulante_tb;
    
BEGIN
    DBMS_OUTPUT.Put_line('Tripulantes que recebem 5000.00 ou mais');
    OPEN cursor_trip;
    
        LOOP
            FETCH cursor_trip INTO trip_cpf, trip_salario;
            IF trip_salario >= 5000.00 THEN
                cpf_Salario_trip(iterator).cpf := trip_cpf;
                cpf_Salario_trip(iterator).salario := trip_salario;
                DBMS_OUTPUT.Put_line(cpf_Salario_trip(iterator).cpf || ' ' || cpf_Salario_trip(iterator).salario);
                iterator := iterator+1;
            END IF;
            EXIT WHEN cursor_trip%NOTFOUND;
        END LOOP;

    CLOSE cursor_trip;
    
END;
/
-- trigger para impedir que haja redução no salário de um tripulante

-- 20)trigger para impedir que haja redução no salário de um tripulante
CREATE OR REPLACE TRIGGER alt_salario
BEFORE UPDATE ON tripulante_tb
FOR EACH ROW
DECLARE
    salario_diff number;
BEGIN
salario_diff  := :new.salario  - :old.salario;
IF salario_diff < 0 THEN
    RAISE_APPLICATION_ERROR(-20101,'O salário de um tripulante não pode sofrer redução.');
ELSIF salario_diff > 0 THEN
    dbms_output.put_line('Salário atualizado com sucesso!'); 
END IF;
END;
/
UPDATE tripulante_tb
SET salario = 1
WHERE cadastro = 2
/

-- 2)trigger que transfere para a tabela log_bagagem todas as movimentações que forem feitas na tabela bagagem_tb
CREATE TABLE log_bagagem(
    tipo_de_acao VARCHAR2(15),
    hora TIMESTAMP
);

-- 19)trigger de bagagem
CREATE OR REPLACE TRIGGER controle_bagagem
AFTER INSERT OR UPDATE OR DELETE ON bagagem_tb
BEGIN
    IF (INSERTING) THEN
        INSERT INTO log_bagagem(tipo_de_acao, hora)
            VALUES ('INSERCAO', SYSDATE);
    
    ELSIF (UPDATING) THEN
        INSERT INTO log_bagagem(tipo_de_acao, hora)
            VALUES ('ATUALIZACAO', SYSDATE);
    
    ELSIF (DELETING) THEN
        INSERT INTO log_bagagem(tipo_de_acao, hora)
            VALUES ('REMOCAO', SYSDATE);
    
    END IF;
END;
/

UPDATE bagagem_tb
SET peso = 35
WHERE cpf_pa = '18683894487'
/

-- 1) usa um record para printar as horas de voo de um piloto
declare
TYPE horas_de_voo_piloto IS RECORD ( nome pessoa_tb.nome%type, horas number(8));
hvp horas_de_voo_piloto;
begin
    select p.nome into hvp.nome from pessoa_tb p inner join tripulante_tb t on p.cpf = t.cpf_pe where p.cpf='06059026150';
    
    select sum(extract(hour from v.data_chegada- v.data_partida)) +  sum(extract(minute from v.data_chegada- v.data_partida))/60 into hvp.horas from voo_tb v 
        inner join escala_tb e on v.codigo = e.codigo_voo
        where e.cpf_tri = '06059026150';
        
    dbms_output.put_line(hvp.nome || ' tem ' || hvp.horas || ' horas de voo registradas');    
    dbms_output.put_line(hvp.horas);
end;
/
-- 5/9)cria uma funcao que calcula e retorna o valor inss
create or replace function inss_calc(salario in tripulante_tb.salario%type )
    return number is inss number;
begin
    --salario number(8) := 3000;
    case
        when (salario > 1212 and salario < 2427) then
            inss := (0.075 * 1212) + (0.09 * (salario - 1212));
        when (salario > 2427 and salario < 3641) then
            inss := (0.075 * 1212) + (2427 - 1212)*0.09 + (salario - 2427)*0.12;
        when (salario > 3641 and salario < 7087) then
            inss := (0.075 * 1212) + (2427 - 1212)*0.09 + (7087 - 3641)*0.12  + (salario - 3641)*0.14;
    end case;
    return inss;
end;
/

declare 
    salario tripulante_tb.salario%type := 3000;
begin
    dbms_output.put_line(inss_calc(salario));
end;
/

-- 7/15/16) Recebe um input e procura ele na tabela de cpf
CREATE OR REPLACE PROCEDURE search_cpf(cpf_recevied IN Pessoa_tb.cpf%TYPE) 
IS register pessoa_tb%rowtype;
BEGIN
    SELECT *
    INTO register
    FROM Pessoa_tb
    WHERE Pessoa_tb.cpf = cpf_recevied;
    
    DBMS_OUTPUT.PUT_LINE ('Nome: ' || register.nome);
    DBMS_OUTPUT.PUT_LINE ('Idade: ' || register.idade);
    DBMS_OUTPUT.PUT_LINE ('CPF: ' || register.cpf);

EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE ('Essa pessoa não está registrada no nosso banco de dados.');
END search_cpf;
/
EXECUTE search_cpf('71311506578');
/

--10,13,14-- Consultar o CEP da residência devarias pessoa
DECLARE
    nome_pe Pessoa_tb.nome%TYPE;
    cpf_pe Pessoa_tb.cpf%TYPE;
    cep_pe endereco_tb.cep%TYPE;
    
    CURSOR pessoa_nome IS
        SELECT nome, cpf
        FROM Pessoa_tb;

BEGIN
    OPEN pessoa_nome;
        LOOP
            FETCH pessoa_nome INTO nome_pe, cpf_pe;
            
            EXIT WHEN pessoa_nome%NOTFOUND;
            
            SELECT cep INTO cep_pe
            FROM endereco_tb
            WHERE cpf = cpf_pe;
            
            DBMS_OUTPUT.PUT_LINE(nome_pe || ' reside no CEP: ' || cep_pe);
        END LOOP;
    CLOSE pessoa_nome;
END;
/

-- 17) criar um package pra armazenar nossa procedures
CREATE OR REPLACE PACKAGE procedures_package
AS

PROCEDURE peso_total_bagage (cpf bagagem_tb.cpf_pa%TYPE);
PROCEDURE search_cpf(cpf_recevied IN Pessoa_tb.cpf%TYPE);

END procedures_package;
/
--18) Criar o body do package criado

CREATE OR REPLACE PACKAGE BODY procedures_package
AS

PROCEDURE peso_total_bagage (cpf bagagem_tb.cpf_pa%TYPE)   
IS
    tot_weight bagagem_tb.peso%TYPE;
begin
    select sum(bagagem_tb.peso) into tot_weight
    from bagagem_tb
    where bagagem_tb.cpf_pa = cpf;

    --print tot_weight;
    dbms_output.put_line('Peso: ' || tot_weight ||'kg');
    
end peso_total_bagage;

PROCEDURE search_cpf(cpf_recevied IN Pessoa_tb.cpf%TYPE) 
IS register pessoa_tb%rowtype;
BEGIN
    SELECT *
    INTO register
    FROM Pessoa_tb
    WHERE Pessoa_tb.cpf = cpf_recevied;
    
    DBMS_OUTPUT.PUT_LINE ('Nome: ' || register.nome);
    DBMS_OUTPUT.PUT_LINE ('Idade: ' || register.idade);
    DBMS_OUTPUT.PUT_LINE ('CPF: ' || register.cpf);

EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE ('Essa pessoa não está registrada no nosso banco de dados.');
END search_cpf;

END procedures_package;
/
EXECUTE procedures_package.peso_total_bagage('10982770669');
EXECUTE procedures_package.search_cpf('10982770669');
/
