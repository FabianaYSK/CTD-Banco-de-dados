/* 
Checkpoint_II - Banco de Dados 
Fabiana Yumi Sato Kayanoki
E-commerce de pão de mel artesanal com aplicativo próprio. 
Pelo produto ser perecível e pelo modelo de negócio inicial da empresa, o cliente poderá realizar o pedido e escolher a data e horário de entrega disponível. 
Os pedidos devem ser realizados até certo horário do dia e, somente, após a confirmação do pagamento, o pão de mel será produzido, evitando perdas e levando um produto mais fresco ao cliente.
Todas as tabelas apresentam relacionamentos muitos para muitos (N:N), ou seja, há a necessidade de uma tabela intermediária para relacionar as outras duas tabelas, uma vez que os registros de uma tabela se relacionam a vários registros de outra tabela.
*/

-- DDL --------------------

-- Criação do Banco de Dados 
CREATE DATABASE IF NOT EXISTS paodemel;
USE paodemel;

-- Criação das tabelas com chaves primárias e estrangeiras
CREATE TABLE pedidos(
cod_pedidos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_pedido DATE NOT NULL,
endereco_cobranca VARCHAR(200),
endereco_entrega VARCHAR(200),
valor_total DECIMAL(5,2) NOT NULL,
status VARCHAR(30) NOT NULL
);

CREATE TABLE clientes(
cod_clientes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL,
sobrenome VARCHAR(150) NOT NULL,
telefone VARCHAR(20),
email VARCHAR(100), 
endereco VARCHAR(200),
documento VARCHAR(15) NOT NULL
);

-- INTERMEDIÁRIA PEDIDOS X CLIENTES
CREATE TABLE pedidos_clientes(
cod_pedidos_clientes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_clientes INT NOT NULL,
CONSTRAINT fk_pedidos_clientes1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_clientes2 FOREIGN KEY (cod_clientes) REFERENCES clientes (cod_clientes)
);

CREATE TABLE formas_pagamentos(
cod_formas_pagamentos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipo VARCHAR(50),
parcelamento INT
);

-- INTERMEDIÁRIA PEDIDOS X FORMAS_PAGAMENTOS
CREATE TABLE pedidos_formas_pagamentos(
cod_pedidos_formas_pagamentos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_formas_pagamentos INT NOT NULL,
CONSTRAINT fk_pedidos_formas_pagamentos1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_formas_pagamentos2 FOREIGN KEY (cod_formas_pagamentos) REFERENCES formas_pagamentos (cod_formas_pagamentos)
);

CREATE TABLE fidelizacao(
cod_fidelizacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
promocoes VARCHAR(100), 
brindes VARCHAR(100), 
descontos VARCHAR(100)
);

-- INTERMEDIÁRIA CLIENTES X FIDELIZACAO
CREATE TABLE clientes_fidelizacao(
cod_clientes_fidelizacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_clientes INT NOT NULL,
cod_fidelizacao INT NOT NULL,
CONSTRAINT fk_clientes_fidelizacao1 FOREIGN KEY (cod_clientes) REFERENCES clientes (cod_clientes),
CONSTRAINT fk_clientes_fidelizacao2 FOREIGN KEY (cod_fidelizacao) REFERENCES fidelizacao (cod_fidelizacao)
);

-- INTERMEDIÁRIA FIDELIZACAO X FORMAS_PAGAMENTOS
CREATE TABLE fidelizacão_formas_pagamentos(
cod_fidelizacão_formas_pagamentos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_fidelizacao INT NOT NULL,
cod_formas_pagamentos INT NOT NULL,
CONSTRAINT fk_fidelizacão_formas_pagamentos1 FOREIGN KEY (cod_fidelizacao) REFERENCES fidelizacao (cod_fidelizacao),
CONSTRAINT fk_fidelizacão_formas_pagamentos2 FOREIGN KEY (cod_formas_pagamentos) REFERENCES formas_pagamentos (cod_formas_pagamentos)
);

CREATE TABLE confirmacao(
cod_confirmacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PEDIDOS X CONFIRMACAO
CREATE TABLE pedidos_confirmacao(
cod_pedidos_confirmacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_confirmacao INT NOT NULL,
CONSTRAINT fk_pedidos_confirmacao1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_confirmacao2 FOREIGN KEY (cod_confirmacao) REFERENCES confirmacao (cod_confirmacao)
);

CREATE TABLE caixa(
cod_caixa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
entrada DECIMAL(5,2) NOT NULL,
saida DECIMAL(5,2) NOT NULL,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA CONFIRMACAO X CAIXA
CREATE TABLE confirmacao_caixa(
cod_confirmacao_caixa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_confirmacao INT NOT NULL,
cod_caixa INT NOT NULL,
CONSTRAINT fk_confirmacao_caixa1 FOREIGN KEY (cod_confirmacao) REFERENCES confirmacao (cod_confirmacao),
CONSTRAINT fk_confirmacao_caixa2 FOREIGN KEY (cod_caixa) REFERENCES caixa (cod_caixa)
);

CREATE TABLE produtos(
cod_produtos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
ingredientes VARCHAR(300) NOT NULL,
peso INT,
quantidade INT,
data_fabricacao DATETIME NOT NULL,
prazo_validade DATETIME NOT NULL,
descricao MEDIUMTEXT,
imagem VARCHAR(300),
valor DECIMAL(5,2) NOT NULL
);

-- INTERMEDIÁRIA PEDIDOS X PRODUTOS
CREATE TABLE pedidos_produtos(
cod_pedidos_produtos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_produtos INT NOT NULL,
CONSTRAINT fk_pedidos_produtos1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_produtos2 FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos)
);

CREATE TABLE materia_prima(
cod_materia_prima INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
quantidade INT NOT NULL,
descricao MEDIUMTEXT,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PRODUTOS x MATERIA_PRIMA
CREATE TABLE produtos_materia_prima(
cod_produtos_materia_prima INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_produtos INT NOT NULL,
cod_materia_prima INT NOT NULL,
CONSTRAINT fk_produtos_materia_prima1 FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos),
CONSTRAINT fk_produtos_materia_prima2 FOREIGN KEY (cod_materia_prima) REFERENCES materia_prima (cod_materia_prima)
);

CREATE TABLE compras(
cod_compras INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
quantidade INT NOT NULL, 
data_pedido DATE NOT NULL,
endereco_entrega VARCHAR(200),
valor_total DECIMAL(5,2) NOT NULL,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA MATERIA_PRIMA x COMPRAS
CREATE TABLE materia_prima_compras(
cod_materia_prima_compras INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_materia_prima INT NOT NULL,
cod_compras INT NOT NULL,
CONSTRAINT fk_materia_prima_compras1 FOREIGN KEY (cod_materia_prima) REFERENCES materia_prima (cod_materia_prima),
CONSTRAINT fk_materia_prima_compras2 FOREIGN KEY (cod_compras) REFERENCES compras (cod_compras)
);

-- INTERMEDIÁRIA COMPRAS x CAIXA
CREATE TABLE compras_caixa(
cod_compras_caixa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_compras INT NOT NULL,
cod_caixa INT NOT NULL,
CONSTRAINT fk_compras_caixa1 FOREIGN KEY (cod_compras) REFERENCES compras (cod_compras),
CONSTRAINT fk_compras_caixa2 FOREIGN KEY (cod_caixa) REFERENCES caixa (cod_caixa)
);

CREATE TABLE fornecedores(
cod_fornecedores INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL,
sobrenome VARCHAR(150),
telefone VARCHAR(20),
endereco VARCHAR(200),
email VARCHAR(100),
cnpj VARCHAR(20) NOT NULL,
razao_social VARCHAR(200) NOT NULL
);

-- INTERMEDIÁRIA MATERIA_PRIMA x FORNECEDORES
CREATE TABLE materia_prima_fornecedores(
cod_materia_prima_fornecedores INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_materia_prima INT NOT NULL,
cod_fornecedores INT NOT NULL,
CONSTRAINT fk_materia_prima_fornecedores1 FOREIGN KEY (cod_materia_prima) REFERENCES materia_prima (cod_materia_prima),
CONSTRAINT fk_materia_prima_fornecedores2 FOREIGN KEY (cod_fornecedores) REFERENCES fornecedores (cod_fornecedores)
);

CREATE TABLE estoque_mp(
cod_estoque_mp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
quantidade INT NOT NULL,
entrada INT NOT NULL,
saida INT NOT NULL,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA MATERIA_PRIMA x ESTOQUE_MP
CREATE TABLE materia_prima_estoque_mp(
cod_materia_prima_estoque_mp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_materia_prima INT NOT NULL,
cod_estoque_mp INT NOT NULL,
CONSTRAINT fk_materia_prima_estoque_mp1 FOREIGN KEY (cod_materia_prima) REFERENCES materia_prima (cod_materia_prima),
CONSTRAINT fk_materia_prima_estoque_mp2 FOREIGN KEY (cod_estoque_mp) REFERENCES estoque_mp (cod_estoque_mp)
);

CREATE TABLE producao(
cod_producao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
numero_lote VARCHAR(50) NOT NULL,
qte_produzida INT,
custo_total DECIMAL(5,2),
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PRODUTOS x PRODUCAO
CREATE TABLE produtos_producao(
cod_produtos_producao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_produtos INT NOT NULL,
cod_producao INT NOT NULL,
CONSTRAINT fk_produtos_producao1 FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos),
CONSTRAINT fk_produtos_producao2 FOREIGN KEY (cod_producao) REFERENCES producao (cod_producao)
);

CREATE TABLE separacao(
cod_separacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
envio_nota_fiscal MEDIUMTEXT,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PRODUTOS x SEPARACAO
CREATE TABLE produtos_separacao(
cod_produtos_separacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_produtos INT NOT NULL,
cod_separacao INT NOT NULL,
CONSTRAINT fk_produtos_separacao1 FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos),
CONSTRAINT fk_produtos_separacao2 FOREIGN KEY (cod_separacao) REFERENCES separacao (cod_separacao)
);

CREATE TABLE estoque_p(
cod_estoque_p INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
quantidade INT NOT NULL,
entrada INT NOT NULL,
saida INT NOT NULL,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PRODUTOS x ESTOQUE_P
CREATE TABLE produtos_estoque_p(
cod_produtos_estoque_p INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_produtos INT NOT NULL,
cod_estoque_p INT NOT NULL,
CONSTRAINT fk_produtos_estoque_p1 FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos),
CONSTRAINT fk_produtos_estoque_p2 FOREIGN KEY (cod_estoque_p) REFERENCES estoque_p (cod_estoque_p)
);

CREATE TABLE rastreamentos(
cod_rastreamentos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao MEDIUMTEXT,
geolocalizacao_latitude VARCHAR(20),
geolocalizacao_longitude VARCHAR(20),
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PEDIDOS x RASTREAMENTOS
CREATE TABLE pedidos_rastreamentos(
cod_pedidos_rastreamentos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_rastreamentos INT NOT NULL,
CONSTRAINT fk_pedidos_rastreamentos1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_rastreamentos2 FOREIGN KEY (cod_rastreamentos) REFERENCES rastreamentos (cod_rastreamentos)
);

CREATE TABLE entregas(
cod_entregas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
previsto_para DATETIME,
status VARCHAR(30) NOT NULL
);

-- INTERMEDIÁRIA PEDIDOS x ENTREGAS
CREATE TABLE pedidos_entregas(
cod_pedidos_entregas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_pedidos INT NOT NULL,
cod_entregas INT NOT NULL,
CONSTRAINT fk_pedidos_entregas1 FOREIGN KEY (cod_pedidos) REFERENCES pedidos (cod_pedidos),
CONSTRAINT fk_pedidos_entregas2 FOREIGN KEY (cod_entregas) REFERENCES entregas (cod_entregas)
);