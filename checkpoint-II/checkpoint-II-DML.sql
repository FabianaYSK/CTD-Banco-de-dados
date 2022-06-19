/* 
Checkpoint_II - Banco de Dados 
Fabiana Yumi Sato Kayanoki
E-commerce de pão de mel artesanal com aplicativo próprio. 
Pelo produto ser perecível e pelo modelo de negócio inicial da empresa, o cliente poderá realizar o pedido e escolher a data e horário de entrega disponível. 
Os pedidos devem ser realizados até certo horário do dia e, somente, após a confirmação do pagamento, o pão de mel será produzido, evitando perdas e levando um produto mais fresco ao cliente.
Todas as tabelas apresentam relacionamentos muitos para muitos (N:N), ou seja, há a necessidade de uma tabela intermediária para relacionar as outras duas tabelas, uma vez que os registros de uma tabela se relacionam a vários registros de outra tabela.
*/

-- DML --------------------

/* 
Contexto para CRUD: 
Cinco clientes com os mesmos dados foram inseridos no banco de dados (INSERT/CREATE).
Descobriu-se que duas das entradas são, na verdade, da mãe e do pai da cliente (cod = 1), devido, provavelemte, à confusão com os sobrenomes. Dessa forma, essas entradas foram atualizadas (UPDATE/UPDATE).
Por fim, a quarta e a quinta entradas estavam realmente repetidas, sendo excluídas da tabela clientes (DELETE/DELETE).
Assim, pedimos ao banco de dados retornar a tabela de clientes e, posteriormente, os dados da cliente que apresentava várias entradas no banco de dados ('Juliana Santos Leite') a fim de verificar se há replicação de dados (SELECT/READ).
*/

USE paodemel;

-- Inserção de dados em uma das tabelas (INSERT/CREATE)
INSERT INTO clientes (cod_clientes, nome, sobrenome, telefone, email, endereco, documento)
VALUES (DEFAULT, 'Juliana', 'Santos Leite', '(11)11111-1111', 'juli@email.com', 'Rua Juliana, 111', '111.111.111-11');

INSERT INTO clientes (cod_clientes, nome, sobrenome, telefone, email, endereco, documento)
VALUES (DEFAULT, 'Juliana', 'Santos Leite', '(11)11111-1111', 'juli@email.com', 'Rua Juliana, 111', '111.111.111-11'); 

INSERT INTO clientes (cod_clientes, nome, sobrenome, telefone, email, endereco, documento)
VALUES (DEFAULT, 'Juliana', 'Santos Leite', '(11)11111-1111', 'juli@email.com', 'Rua Juliana, 111', '111.111.111-11'); 

INSERT INTO clientes (cod_clientes, nome, sobrenome, telefone, email, endereco, documento)
VALUES (DEFAULT, 'Juliana', 'Santos Leite', '(11)11111-1111', 'juli@email.com', 'Rua Juliana, 111', '111.111.111-11');
 
INSERT INTO clientes (cod_clientes, nome, sobrenome, telefone, email, endereco, documento)
VALUES(DEFAULT, 'Juliana', 'Santos Leite', '(11)11111-1111', 'juli@email.com', 'Rua Juliana, 111', '111.111.111-11'); 

-- Atualização de dados em uma das tabelas (UPDATE/UPDATE)
UPDATE  clientes 
SET nome = 'Nina',
	sobrenome = 'Santos', 
	telefone = '(22)22222-2222',
	email = 'nina@email.com',
	endereco = 'Rua Nina, 222', 
    documento = '222.222.222-22'
WHERE cod_clientes = 2;

UPDATE  clientes 
SET nome = 'Fábio',
	sobrenome = 'Leite', 
	telefone = '(33)33333-3333',
	email = 'fabio@email.com',
	endereco = 'Rua Fábio, 333', 
    documento = '333.333.333-33'
WHERE cod_clientes = 3;

-- Exclusão de dados em uma das tabelas (DELETE/DELETE)
DELETE FROM clientes
WHERE cod_clientes = 4;

DELETE FROM clientes
WHERE cod_clientes = 5;

-- Seleção de dados de uma das tabelas (SELECT/READ)
SELECT cl.cod_clientes, cl.nome, cl.sobrenome 
FROM clientes cl;

SELECT * 
FROM clientes
WHERE nome = 'Juliana' AND sobrenome = 'Santos Leite';
