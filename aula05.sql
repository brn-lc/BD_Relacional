create database bd_aula06;
\c bd_aula06
create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');
create table tbl_cliente (codigo_cliente integer PRIMARY KEY, nome text not null, cidade text, endereco text);
create table tbl_titulo (codigo_titulo integer primary key, titulo text not null, descricao text, categoria chk_categoria);
create table tbl_livros (cod_livro integer PRIMARY KEY, codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
create table tbl_emprestimo (numero_emprestimo integer PRIMARY KEY, codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), codigo_livro integer REFERENCES tbl_livros(cod_livro));
-- Inserção de dados na tabela tbl_cliente
INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'Joao Silva', 'Sao Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');
-- Inserção de dados na tabela tbl_titulo
INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmatico', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');
-- Inserção de dados na tabela tbl_livros
INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'ALUGADO'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'ALUGADO');
-- Inserção de dados na tabela tbl_emprestimo
INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5);

-------------------------------------------------------------------------------------------------------

--1 Liste os títulos e seus status, incluindo os que não têm status definido. (retorna 6 linhas)
SELECT tbl_titulo.titulo, tbl_livros.status 
FROM tbl_titulo 
LEFT JOIN tbl_livros 
ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo; 

--2 Liste os títulos e suas descrições dos livros alugados (retorna 4 linhas)
SELECT titulo, descricao 
FROM tbl_titulo 
INNER JOIN tbl_livros 
ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo 
WHERE tbl_livros.status = 'ALUGADO';

--3 Liste os nomes dos clientes que não têm livros alugados (retorna 1 linha)
SELECT nome 
	FROM tbl_cliente 
	LEFT JOIN tbl_emprestimo ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente 
    WHERE tbl_emprestimo.codigo_cliente IS NULL;
    
--4 Liste os títulos e suas categorias dos livros disponiveis (retorna 1 linha).
SELECT titulo, categoria FROM tbl_titulo NATURAL JOIN tbl_livros WHERE tbl_livros.status = 'DISPONIVEL';

--5 Liste os nomes dos clientes e os títulos dos livros que eles têm alugados (retorna 4 linhas).
SELECT c.nome, t.titulo
FROM tbl_cliente c
INNER JOIN tbl_emprestimo e ON c.codigo_cliente = e.codigo_cliente
INNER JOIN tbl_livros l ON e.codigo_livro = l.cod_livro
INNER JOIN tbl_titulo t ON l.codigo_titulo = t.codigo_titulo; 

--6 Retorne o nome, titulo do livro e o status do emprestimo do livro alugado pela Ana Oliveira (retorna 1 linha)
SELECT tbl_cliente.nome, tbl_titulo.titulo, tbl_livros.status
FROM tbl_cliente
JOIN tbl_emprestimo 
    ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente
JOIN tbl_livros 
    ON tbl_livros.cod_livro = tbl_emprestimo.codigo_livro
JOIN tbl_titulo 
    ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo
WHERE tbl_cliente.codigo_cliente = 4;
