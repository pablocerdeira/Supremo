/*
ATENÇÃO.
Antes de executar estas queries verifique
se a tabela gr_lei_lei existe no banco.
Em caso negativo, execute:
call cria_gr_lei_lei();

Observações:
  Os selects normais de PLSQL funcionam.
  A coluna latch indica o comando:
    - 0: retorna vértices
    - 1: Dijkstra's shortest path
    - 2: Breadth-first shortest path

Notas:
  - O algoritmo 2 parece melhor do que o 1
*/


/* 
Seleciona conteúdo da gr_lei_lei
*/
select * from gr_lei_lei;


/* 
Seleciona apenas os nós
Res:
  linkid: id dos nós.
*/
select * from gr_lei_lei
where latch = 0;


/* 
Seleciona apenas os nós e os
nós filhos a partir dele
Res:
  origid: id dos nós pais
  weight: peso
  seq: sequencia
  linkid: id dos filhos
*/
select * from gr_lei_lei
where latch = 0
  and origid = 1
order by seq;


/* 
Seleciona apenas os nós e os
nós pais a partir dele
Res:
  destid: id dos nós pais
  weight: peso
  seq: sequencia
  linkid: id dos pais
*/
select * from gr_lei_lei
where latch = 0
  and destid = 1
order by seq;


/* 
Seleciona o caminho mais curto entre
dois nós (origid e destid)
Alg: Dijkstra's
Res:
  origid: id do nó origem
  destid: id do nó destino
  weight: peso do passo atual
  seq: sequencia
  linkid: id do nó seguinte
Obs:
  Verificar se ele segue o caminho
  do menor peso (problema. inverter)
*/
select * from gr_lei_lei
where latch = 1
  and origid = 14000
  and destid = 18000
order by seq;


/* 
Encontra nós alcançáveis a partir
do nó de origem.
Res:
  ???
Obs:
  Não entendi este completamente.
*/
select * from gr_lei_lei
where latch = 1
  and origid = 14000
order by linkid;


/* 
Seleciona o caminho mais curto entre
dois nós (origid e destid)
Alg: Breadth-first
Res:
  origid: id do nó origem
  destid: id do nó destino
  weight: peso do passo atual
  seq: sequencia
  linkid: id do nó seguinte
Obs:
  Verificar se ele segue o caminho
  do menor peso (problema. inverter)
*/
select * from gr_lei_lei
where latch = 2
  and origid = 14000
  and destid = 18000
order by seq;

