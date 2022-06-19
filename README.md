# CTD-Banco-de-dados

# Checkpoint I

📝 Objetivo: Criar um modelo lógico de um banco de dados, pode ser um negócio ou uma aplicação (exemplo: uma biblioteca). O modelo lógico deve ter, no mínimo, em sua estrutura básica: atributos, entidades e relacionamentos.

Proposta: E-commerce de pão de mel artesanal com aplicativo próprio. Pelo produto ser perecível e pelo modelo de negócio inicial da empresa, o cliente poderá realizar o pedido e escolher a data e horário de entrega disponível. Os pedidos devem ser realizados até certo horário do dia e, somente, após a confirmação do pagamento, o pão de mel será produzido, evitando perdas e levando um produto mais fresco ao cliente.

# Checkpoint II

📝 Objetivo: Fazer a criação do banco de dados no Workbench e deixar, ao menos, um exemplo de cada operação (CRUD), em pelo menos uma entidade do seu modelo, pronta para teste em um arquivo sql e especificar em um parágrafo o projeto e a utilização e suas regras. O arquivo de script da resposta deve conter (sem utilizar o código gerado do dump):

✔️Criação do banco de dados

✔️Criação das tabelas com chaves primárias e estrangeiras

✔️Inserção de dados em uma das tabelas

✔️Atualização de dados em uma das tabelas

✔️Exclusão de dados em uma das tabelas

✔️Seleção de dados de uma das tabelas

Observação: O modelo lógico do checkpoint I foi atualizado com as mudanças recomendadas pelo professor quanto aos relacionamentos das tabelas, uma vez que todas as chaves estrangeiras estavam como chaves primárias, podendo ocasionar problemas futuros na inserção de registros na base de dados ao gerar erros excessivos de violação de constraints. Assim, as chaves primárias foram modificadas a fim de apresentar um registro único nas tabelas. Além disso, há novas inserções de outros campos 'Not Null' essenciais para as tabelas, ou seja, que não podem ser armazenadas sem um valor definido a fim de explicar melhor o modelo de negócio proposto.


