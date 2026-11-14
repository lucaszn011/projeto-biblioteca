# Projeto Biblioteca

Projeto de estudo para praticar a criação de um banco de dados de biblioteca e consultas SQL usando **PostgreSQL**.

O script cria as tabelas de leitores, livros e empréstimos, insere dados fictícios e apresenta consultas para analisar os empréstimos.

## Tecnologias

- PostgreSQL
- SQL
- pgAdmin

## Conceitos praticados

- Criação de tabelas com `CREATE TABLE`
- Chaves primárias e estrangeiras
- Inserção de dados com `INSERT INTO`
- Junção de tabelas com `JOIN`
- Agrupamento com `GROUP BY`
- Filtro de grupos com `HAVING`
- Ordenação com `ORDER BY`
- Filtro de valores nulos com `IS NULL`

## Estrutura do banco

- **leitores:** nome dos leitores.
- **livros:** título dos livros.
- **emprestimos:** leitor, livro e datas do empréstimo e devolução.

## Como executar

1. Abra o pgAdmin e conecte-se ao PostgreSQL.
2. Crie ou selecione um banco de dados de estudo vazio.
3. Abra o Query Tool.
4. Execute o arquivo `biblioteca.sql`.

O script cria as tabelas e insere dados fictícios. Execute-o uma única vez em um banco vazio para evitar conflitos com objetos já existentes.

Projeto de prática desenvolvido durante a graduação.