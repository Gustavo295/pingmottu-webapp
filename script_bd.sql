SET SERVEROUTPUT ON;

-- DELETAR TABELAS CASO EXISTA ALGUMA
DROP TABLE condicao CASCADE CONSTRAINTS;

DROP TABLE endereco CASCADE CONSTRAINTS;

DROP TABLE filial CASCADE CONSTRAINTS;

DROP TABLE localizacao CASCADE CONSTRAINTS;

DROP TABLE moto CASCADE CONSTRAINTS;

DROP TABLE patio CASCADE CONSTRAINTS;

DROP TABLE uwb CASCADE CONSTRAINTS;

DROP TABLE auditoria CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------

-- CRIA��O DAS TABELAS
-- TABELA CONDI��O
CREATE TABLE condicao (
    id_condicao INTEGER NOT NULL,
    nome        VARCHAR2(15) NOT NULL,
    cor         VARCHAR2(15) NOT NULL
);

ALTER TABLE condicao ADD CONSTRAINT condicao_pk PRIMARY KEY ( id_condicao );

-- TABELA ENDERE�O
CREATE TABLE endereco (
    id_endereco INTEGER NOT NULL,
    numero      INTEGER NOT NULL,
    cep         VARCHAR2(9) NOT NULL,
    estado      VARCHAR2(20) NOT NULL,
    cidade      VARCHAR2(30) NOT NULL,
    bairro      VARCHAR2(50) NOT NULL,
    logradouro  VARCHAR2(60) NOT NULL
);

ALTER TABLE endereco ADD CONSTRAINT endereco_pk PRIMARY KEY ( id_endereco );

-- TABELA FILIAL
CREATE TABLE filial (
    id_filial            INTEGER NOT NULL,
    nome                 VARCHAR2(60) NOT NULL,
    cnpj                 VARCHAR2(18) NOT NULL,
    ano                  INTEGER NOT NULL,
    endereco_id_endereco INTEGER NOT NULL
);

CREATE UNIQUE INDEX filial__idx ON
    filial (
        endereco_id_endereco
    ASC );

ALTER TABLE filial ADD CONSTRAINT filial_pk PRIMARY KEY ( id_filial );

-- TABELA LOCALIZA��O (Inserts autom�ticos com o UWB)
CREATE TABLE localizacao (
    id_localizacao INTEGER NOT NULL,
    timestamp      DATE NOT NULL,
    x_coord        NUMBER NOT NULL,
    y_coord        NUMBER NOT NULL,
    uwb_id_uwb     INTEGER NOT NULL
);

CREATE UNIQUE INDEX localizacao__idx ON
    localizacao (
        uwb_id_uwb
    ASC );

ALTER TABLE localizacao ADD CONSTRAINT localizacao_pk PRIMARY KEY ( id_localizacao );

-- TABELA MOTO
CREATE TABLE moto (
    id_moto              INTEGER NOT NULL,
    placa                VARCHAR2(8) NOT NULL,
    modelo               VARCHAR2(11) NOT NULL,
    patio_id_patio       INTEGER NOT NULL,
    uwb_id_uwb           INTEGER NOT NULL,
    condicao_id_condicao INTEGER NOT NULL
);

CREATE UNIQUE INDEX moto__idx ON
    moto (
        uwb_id_uwb
    ASC );

ALTER TABLE moto ADD CONSTRAINT moto_pk PRIMARY KEY ( id_moto );

-- TABELA PATIO
CREATE TABLE patio (
    id_patio         INTEGER NOT NULL,
    qtd_moto         INTEGER NOT NULL,
    area_patio       INTEGER NOT NULL,
    capacidade_moto  INTEGER NOT NULL,
    filial_id_filial INTEGER NOT NULL
);

ALTER TABLE patio ADD CONSTRAINT patio_pk PRIMARY KEY ( id_patio );

-- TABELA UWB
CREATE TABLE uwb (
    id_uwb                     INTEGER NOT NULL,
    codigo                     VARCHAR2(40) NOT NULL,
    status                     VARCHAR2(15) NOT NULL,
    localizacao_id_localizacao INTEGER NOT NULL
);

CREATE UNIQUE INDEX uwb__idxv1 ON
    uwb (
        localizacao_id_localizacao
    ASC );

-- CONFIGURA��ES DE PRIMARY E FOREIGN KEY
ALTER TABLE uwb ADD CONSTRAINT uwb_pk PRIMARY KEY ( id_uwb );

ALTER TABLE filial
    ADD CONSTRAINT filial_endereco_fk FOREIGN KEY ( endereco_id_endereco )
        REFERENCES endereco ( id_endereco );

ALTER TABLE moto
    ADD CONSTRAINT moto_condicao_fk FOREIGN KEY ( condicao_id_condicao )
        REFERENCES condicao ( id_condicao );

ALTER TABLE moto
    ADD CONSTRAINT moto_patio_fk FOREIGN KEY ( patio_id_patio )
        REFERENCES patio ( id_patio );

ALTER TABLE moto
    ADD CONSTRAINT moto_uwb_fk FOREIGN KEY ( uwb_id_uwb )
        REFERENCES uwb ( id_uwb );

ALTER TABLE patio
    ADD CONSTRAINT patio_filial_fk FOREIGN KEY ( filial_id_filial )
        REFERENCES filial ( id_filial );

ALTER TABLE uwb
    ADD CONSTRAINT uwb_localizacao_fk FOREIGN KEY ( localizacao_id_localizacao )
        REFERENCES localizacao ( id_localizacao );

--------------------------------------------------------------------------------