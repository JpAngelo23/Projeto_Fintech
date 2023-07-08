-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-05-29 11:07:14 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_compra (
    t_usuario_id_usuario NUMBER(6) NOT NULL,
    t_produto_cd_produto NUMBER(2) NOT NULL,
    dt_compra            DATE NOT NULL
);

CREATE TABLE t_controle (
    id_gasto             NUMBER(4) NOT NULL,
    t_usuario_id_usuario NUMBER(6) NOT NULL,
    vl_despesa           NUMBER(10, 2) NOT NULL,
    dt_despesa           DATE NOT NULL
);

ALTER TABLE t_controle ADD CONSTRAINT t_controle_pk PRIMARY KEY ( id_gasto,
                                                                  t_usuario_id_usuario );

CREATE TABLE t_cot_usuario (
    t_usuario_id_usuario  NUMBER(6) NOT NULL,
    t_cotacoes_id_cotacao NUMBER(3) NOT NULL,
    dt_visualizacao       DATE NOT NULL
);

CREATE TABLE t_cotacoes (
    id_cotacao    NUMBER(3) NOT NULL,
    nm_ativo      VARCHAR2(15) NOT NULL,
    ds_cotacao    VARCHAR2(40) NOT NULL,
    vl_atual      NUMBER(6, 2) NOT NULL,
    dt_hr_cotacao DATE NOT NULL
);

ALTER TABLE t_cotacoes ADD CONSTRAINT t_cotacoes_pk PRIMARY KEY ( id_cotacao );

CREATE TABLE t_interesses (
    t_usuario_id_usuario  NUMBER(6) NOT NULL,
    t_noticias_id_noticia NUMBER(5) NOT NULL,
    dt_visao              DATE NOT NULL
);

CREATE TABLE t_noticias (
    id_noticia  NUMBER(5) NOT NULL,
    ds_conteudo VARCHAR2(2000) NOT NULL,
    dt_noticia  DATE NOT NULL
);

ALTER TABLE t_noticias ADD CONSTRAINT t_noticias_pk PRIMARY KEY ( id_noticia );

CREATE TABLE t_perfilusuario (
    id_perfil            NUMBER(6) NOT NULL,
    t_usuario_id_usuario NUMBER(6) NOT NULL,
    tp_perfil            VARCHAR2(20) NOT NULL
);

CREATE UNIQUE INDEX t_perfilusuario__idx ON
    t_perfilusuario (
        t_usuario_id_usuario
    ASC );

ALTER TABLE t_perfilusuario ADD CONSTRAINT t_perfilusuario_pk PRIMARY KEY ( id_perfil,
                                                                            t_usuario_id_usuario );

CREATE TABLE t_prev (
    id_plano             NUMBER(4) NOT NULL,
    t_usuario_id_usuario NUMBER(6) NOT NULL,
    vl_mensal            NUMBER(10, 2) NOT NULL,
    pl_idade             NUMBER(3) NOT NULL,
    pl_retorno           NUMBER(15, 2) NOT NULL
);

ALTER TABLE t_prev ADD CONSTRAINT t_prev_pk PRIMARY KEY ( id_plano,
                                                          t_usuario_id_usuario );

CREATE TABLE t_produto (
    cd_produto NUMBER(2) NOT NULL,
    nm_produto VARCHAR2(20) NOT NULL,
    ds_produto VARCHAR2(40) NOT NULL,
    tp_produto VARCHAR2(20) NOT NULL,
    vl_produto NUMBER(6, 2) NOT NULL
);

ALTER TABLE t_produto ADD CONSTRAINT t_produto_pk PRIMARY KEY ( cd_produto );

CREATE TABLE t_usuario (
    id_usuario    NUMBER(6) NOT NULL,
    nm_usuario    VARCHAR2(30) NOT NULL,
    cd_senha      VARCHAR2(16) NOT NULL,
    dt_nasc       DATE NOT NULL,
    ds_interesses VARCHAR2(50) NOT NULL
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE t_compra
    ADD CONSTRAINT t_compra_t_produto_fk FOREIGN KEY ( t_produto_cd_produto )
        REFERENCES t_produto ( cd_produto );

ALTER TABLE t_compra
    ADD CONSTRAINT t_compra_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_controle
    ADD CONSTRAINT t_controle_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_cot_usuario
    ADD CONSTRAINT t_cot_usuario_t_cotacoes_fk FOREIGN KEY ( t_cotacoes_id_cotacao )
        REFERENCES t_cotacoes ( id_cotacao );

ALTER TABLE t_cot_usuario
    ADD CONSTRAINT t_cot_usuario_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_interesses
    ADD CONSTRAINT t_interesses_t_noticias_fk FOREIGN KEY ( t_noticias_id_noticia )
        REFERENCES t_noticias ( id_noticia );

ALTER TABLE t_interesses
    ADD CONSTRAINT t_interesses_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_perfilusuario
    ADD CONSTRAINT t_perfilusuario_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_prev
    ADD CONSTRAINT t_prev_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             1
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
