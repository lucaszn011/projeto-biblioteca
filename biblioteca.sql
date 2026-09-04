SELECT
    e.id_emprestimo,
    l.nome AS leitor,
    li.titulo,
    e.data_emprestimo,
    e.data_devolucao
FROM emprestimos e
JOIN leitores l ON e.id_leitor = l.id_leitor
JOIN livros li ON e.id_livro = li.id_livro
ORDER BY e.id_emprestimo;