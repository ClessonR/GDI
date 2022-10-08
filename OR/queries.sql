-- testar função de passageiro 
DECLARE
    passageiro tp_passageiro;
BEGIN
    SELECT VALUE(P) INTO passageiro FROM tb_passageiro P WHERE P.cpf = '32008422704';
    passageiro.display_info();
END;
/

DECLARE
    passageiro tp_passageiro;
BEGIN
    SELECT VALUE(P) INTO passageiro FROM tb_passageiro P WHERE P.cpf = '32008422704';
    passageiro.display_address();
END;
/

-- testar função de tripulante 
DECLARE
    tripulante tp_tripulante;
BEGIN
    SELECT VALUE(T) INTO tripulante FROM tb_tripulante T WHERE T.cpf = '58615293961';
    tripulante.display_info();
END;
/

DECLARE
    tripulante tp_tripulante;
BEGIN
    SELECT VALUE(T) INTO tripulante FROM tb_tripulante T WHERE T.cpf = '58615293961';
    tripulante.display_address();
END;
/

-- retorna o id de todas as passagens com valor > 5000

SELECT P.passagem_id 
FROM tb_passagem P
WHERE DEREF(P.compra).valor > 5000
/

-- consulta os telefones do passageiro 'Geraldo Elias Rezende' (VARRAY)
select T.telefone 
from tb_passageiro P, table(P.telefones) T
where P.nome = 'Geraldo Elias Rezende'
/

-- consulta as bagagens do passageiro 'Giovanna Catarina Laura da Mota' (NESTED TABLE)
select P.cpf, P.nome, P.idade, B.bag_id, B.peso 
from tb_passageiro P, table(P.lista_bagagens) B
where P.nome = 'Giovanna Catarina Laura da Mota'
/

-- consulta referente as bagegens dos passageiros de um determinado voo
select P.passagem_id, DEREF(P.voo).codigo as voo, DEREF(P.compra).id_compra, C.id_compra, DEREF(C.passageiro).cpf, B.bag_id, B.peso
from tb_passagem P, tb_compra C, tb_passageiro PG, table(PG.lista_bagagens) B
where DEREF(P.voo).codigo = '17942'
and C.id_compra = DEREF(P.compra).id_compra
and PG.cpf = DEREF(C.passageiro).cpf
/

-- consulta referente as bagagens dos passageiros de todos os voos
select P.passagem_id, DEREF(P.voo).codigo as voo, DEREF(P.compra).id_compra, C.id_compra, DEREF(C.passageiro).cpf, B.bag_id
from tb_passagem P, tb_compra C, tb_passageiro PG, table(PG.lista_bagagens) B
where C.id_compra = DEREF(P.compra).id_compra
and PG.cpf = DEREF(C.passageiro).cpf
/

-- consulta o totalde bagagens em cada voo
select DEREF(P.voo).codigo as voo, count(*)
from tb_passagem P, tb_compra C, tb_passageiro PG, table(PG.lista_bagagens) B
where C.id_compra = DEREF(P.compra).id_compra
and PG.cpf = DEREF(C.passageiro).cpf
group by DEREF(P.voo).codigo
/

-- ordena compras do menor pro maior id
SELECT C.valor, C.id_compra, C.passageiro.nome FROM tb_compra C ORDER BY C.compare_id() ASC;


-- order member function para comparar idade dos passageiros
DECLARE
    aux NUMBER;
    idade1 tp_passageiro;
    idade2 tp_passageiro;
BEGIN
    SELECT VALUE(P) INTO idade1 FROM tb_passageiro P WHERE cpf = '03757527062';
    SELECT VALUE(P) INTO idade2 FROM tb_passageiro P WHERE cpf = '64145381084';
    aux := idade1.func_order(idade2);
    IF aux = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ambos passageiros tem a mesma idade.');
    ELSIF aux = -1 THEN
        DBMS_OUTPUT.PUT_LINE('O passageiro ' || TO_CHAR(idade2.nome) || ' tem mais idade que o passageiro '|| TO_CHAR(idade1.nome) ||'.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O passageiro ' || TO_CHAR(idade2.nome) || ' tem mais idade que o passageiro '|| TO_CHAR(idade1.nome) ||'.');
    END IF;
END;
/

--compara o gasto antigo com o novo se tiver um aumento de 10% no salario dos pilotos 
DECLARE
    novo_valor number;
    antigo_valor number;
BEGIN
    SELECT sum(tr.salario) INTO antigo_valor FROM tb_tripulante tr WHERE tr.cargo = 'Piloto';
    SELECT sum(tr.calc_aumento_salario(10)) INTO novo_valor FROM tb_tripulante tr WHERE tr.cargo = 'Piloto';
    dbms_output.put_line('valor atual é ' || antigo_valor);
    dbms_output.put_line('novo valor será ' || novo_valor);
END;
/

