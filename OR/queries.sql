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