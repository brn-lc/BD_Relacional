-- Criar banco de dados bd_sistema_bancario
CREATE DATABASE bd_sistema_bancario;

-- Criar 5 tabelas quaisquer
CREATE TABLE contaPessoaFisica (
    CPF INTEGER NOT NULL,
    nome TEXT NOT NULL,
    num_conta SERIAL NOT NULL,
    PRIMARY KEY (num_conta)
);

CREATE TABLE contaPessoaJuridica (
    CPF INTEGER NOT NULL,
    nome TEXT NOT NULL,
    num_conta SERIAL NOT NULL,
    PRIMARY KEY (num_conta)
);

CREATE TABLE contaPoupanca(
    CPF INTEGER NOT NULL,
    nome TEXT NOT NULL,
    num_conta SERIAL NOT NULL,
    PRIMARY KEY (num_conta)
);

CREATE TABLE contaUniversitario(
    CPF INTEGER NOT NULL,
    nome TEXT NOT NULL,
    num_conta SERIAL NOT NULL,
    PRIMARY KEY (num_conta)
);

CREATE TABLE contaConjunta(
    CPF INTEGER NOT NULL,
    nome TEXT NOT NULL,
    num_conta SERIAL NOT NULL,
    PRIMARY KEY (num_conta)
);
-- Criar tabelas conforme MER (Sistema Bancario):
CREATE TABLE cliente(
    NOME_CLIENTE TEXT,
    CIDADE_CLIENTE TEXT,
    ENDERECO_CLIENTE TEXT
);

CREATE TABLE emprestimo(
    NUMERO_EMPRESTIMO INTEGER,
    NOME_AGENCIA INTEGER,
    VALOR REAL
);

CREATE TABLE conta(
    NUMERO_CONTA INTEGER,
    NOME_AGENCIA TEXT,
    SALDO REAL
);

CREATE TABLE agencia(
    NOME_AGENCIA TEXT,
    CIDADE_AGENCIA TEXT,
    DEPOSITOS INTEGER
);
-- Deletar as 5 tabelas criadas aleatoriamente
DROP TABLE 
    contaPessoaFisica, contaConjunta, contaPessoaJuridica, 
    contaUniversitario, contaPoupanca
;

-- alterar as tabelas conforme o MER atualizado
ALTER TABLE cliente ADD COLUMN IDADE INTEGER;
ALTER TABLE cliente ADD COLUMN CPF INTEGER;
ALTER TABLE cliente RENAME TO tbl_cliente;

ALTER TABLE emprestimo RENAME TO tbl_emprestimo;

ALTER TABLE conta RENAME TO tbl_conta;

ALTER TABLE agencia RENAME TO tbl_agencia;
ALTER TABLE tbl_agencia RENAME COLUMN CIDADE_AGENCIA TO ENDERECO_AGENCIA;

-- Criar um esquema com o seu nome

CREATE SCHEMA Breno;
SET SEARCH_PATH=Breno;

SHOW SEARCH_PATH;