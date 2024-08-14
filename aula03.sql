-- criar banco de dados bd_aula03
CREATE DATABASE bd_aula03;


-- criar tabelas do MER 
CREATE TABLE tbl_cliente (
    codigo_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cidade TEXT,
    endereco TEXT
);

CREATE TABLE tbl_emprestimo (
    numero_emprestimo INTEGER PRIMARY KEY,
    codigo_cliente INTEGER,
    codigo_livro INTEGER
);

CREATE TABLE tbl_titulo (
    codigo_titulo INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    categoria TEXT
);

CREATE TABLE tbl_livros(
    cod_livro INTEGER PRIMARY KEY,
    codigo_titulo INTEGER,
    status TEXT DEFAULT 'DISPONIVEL'
);

-- criar domains
CREATE DOMAIN chk_categoria TEXT CHECK(
    VALUE IN ('DRAMA', 'COMEDIA')
    );

CREATE DOMAIN chk_status TEXT CHECK(
    VALUE IN('DISPONIVEL', 'ALUGADO'));


-- adicionar domain a tabela
ALTER TABLE tbl_titulo 
ALTER COLUMN categoria TYPE chk_categoria;

ALTER TABLE tbl_livros 
ALTER COLUMN status TYPE chk_status;


-- adicionar chaves estrangeiras
ALTER TABLE tbl_livros
ADD CONSTRAINT fk_codigo_titulo
FOREIGN KEY (codigo_titulo)
REFERENCES tbl_titulo(codigo_titulo);

ALTER TABLE tbl_emprestimo
ADD CONSTRAINT fk_numero_emprestimo
FOREIGN KEY (codigo_cliente)
REFERENCES tbl_cliente(codigo_cliente);

ALTER TABLE tbl_emprestimo
ADD CONSTRAINT fk_cod_livro
FOREIGN KEY (codigo_livro)
REFERENCES tbl_livros(cod_livro);


