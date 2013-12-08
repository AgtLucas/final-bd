CREATE OR REPLACE PROCEDURE calculacaminhos
  AS
    ORDEM VARCHAR(1);
BEGIN
  limpafila;
    ORIGEM := 'A';
      inserefila(ORIGEM);
    WHILE nelementosfila > 0 LOOP
      ELEMENTO := retirafila;
        FOR CONL IN(
          SELECT * FROM CONEXOES WHERE ORIGEM = ELEMENTO
        ) LOOP
        
        -- TODO: New Path --
        
      END LOOP;
    SELECT * FROM PRMUNICIPIO;
  inserefila(--DESTINO--);
  END LOOP;
END CALCULACAMINHOS;  
