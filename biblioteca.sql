-- Projeto Biblioteca - PostgreSQL
-- Execute este script em um banco de dados vazio.

CREATE TABLE leitores (
    id_leitor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_leitor INT NOT NULL REFERENCES leitores(id_leitor),
    id_livro INT NOT NULL REFERENCES livros(id_livro),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE
);

-- Dados fictícios para praticar as consultas.
INSERT INTO leitores (nome) VALUES
('Ana Souza'),
('Bruno Lima'),
('Carla Mendes');

INSERT INTO livros (titulo) VALUES
('O Pequeno Príncipe'),
('Dom Casmurro'),
('A Hora da Estrela');

INSERT INTO emprestimos (id_leitor, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2026-10-01', '2026-10-10'),
(1, 2, '2026-10-12', NULL),
(2, 3, '2026-10-05', '2026-10-15'),
(3, 1, '2026-10-08', NULL);

-- 1. Lista os empréstimos com o nome do leitor e o título do livro.
SELECT
    e.id_emprestimo,
    l.nome AS leitor,
    li.titulo AS livro,
    e.data_emprestimo,
    e.data_devolucao
FROM emprestimos e
JOIN leitores l ON e.id_leitor = l.id_leitor
JOIN livros li ON e.id_livro = li.id_livro
ORDER BY e.id_emprestimo;

-- 2. Conta quantos empréstimos cada leitor realizou.
SELECT
    l.nome AS leitor,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores l
LEFT JOIN emprestimos e ON e.id_leitor = l.id_leitor
GROUP BY l.id_leitor, l.nome
ORDER BY total_emprestimos DESC, l.nome;

-- 3. Mostra leitores com pelo menos dois empréstimos.
SELECT
    l.nome AS leitor,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitores l
JOIN emprestimos e ON e.id_leitor = l.id_leitor
GROUP BY l.id_leitor, l.nome
HAVING COUNT(e.id_emprestimo) >= 2
ORDER BY total_emprestimos DESC;

-- 4. Mostra somente os empréstimos que ainda não foram devolvidos.
SELECT
    l.nome AS leitor,
    li.titulo AS livro,
    e.data_emprestimo
FROM emprestimos e
JOIN leitores l ON e.id_leitor = l.id_leitor
JOIN livros li ON e.id_livro = li.id_livro
WHERE e.data_devolucao IS NULL
ORDER BY e.data_emprestimo;