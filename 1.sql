DROP TABLE CONEXOES;
DROP TABLE CAMINHOS;
DROP TABLE FILA;
DROP TABLE ROTAS;

CREATE TABLE FILA(
  ORDEM NUMBER(15),
  ELEMENTO VARCHAR(10)
);

CREATE TABLE CAMINHOS(
  CAMINHOS VARCHAR(10),
  CUSTO NUMBER(15, 4)
);

CREATE TABLE CONEXOES(
  ORIGEM VARCHAR(10),
  DESTINO VARCHAR(10),
  CUSTO NUMBER(15, 4)
);

CREATE TABLE ROTAS(
  NR_NOTAFISCAL VARCHAR(20),
  CD_CLIENTE VARCHAR(5),
  DESTINO VARCHAR(2),
  ROTA1 VARCHAR(11),
  CUSTO1 NUMBER(15, 4),
  ROTA2 VARCHAR(11),
  CUSTO2 NUMBER(15, 4),
  CONSTRAINT FK_ROTAS_NF FOREIGN KEY(NR_NOTAFISCAL) REFERENCES PRNOTAFISCAL,
  CONSTRAINT FK_ROTAS_CLIENTE FOREIGN KEY(CD_CLIENTE) REFERENCES PRCLIENTE
);

--- FUNCTION NELEMENTOSFILA
CREATE OR REPLACE FUNCTION nelementosfila RETURN NUMBER
  AS VALOR NUMBER;
BEGIN
  SELECT COUNT(ORDEM) INTO VALOR
    FROM FILA;
    
  RETURN VALOR;
END;

--- PROCEDURE LIMPAFILA
CREATE OR REPLACE PROCEDURE limpafila
  AS
BEGIN
  DELETE FROM FILA;
END;

--- PROCEDURE RETIRAFILA
CREATE OR REPLACE PROCEDURE retirafila (PAR_ELEMENTO VARCHAR)
  AS
BEGIN
  DELETE FROM FILA WHERE ELEMENTO = PAR_ELEMENTO;
END;

--- PROCEDURE INSEREFILA
CREATE OR REPLACE PROCEDURE inserefila (PAR_ELEMENTO VARCHAR)
  AS
    SEQ NUMBER;
BEGIN
  SELECT MAX(COALESCE(ORDEM, 0)) + 1 INTO SEQ
    FROM FILA;
  INSERT INTO FILA VALUES (SEQ, PAR_ELEMENTO);
END;
