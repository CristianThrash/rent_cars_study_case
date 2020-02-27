CREATE OR REPLACE PROCEDURE PR_TABLAS(n_ini NUMERIC,
                                      n_fin NUMERIC,
                                      l_inf NUMERIC,
                                      l_sup NUMERIC)
AS
    j NUMERIC;
BEGIN
    FOR i IN l_inf..l_sup LOOP
        j:=n_ini;
        LOOP
            DBMS_OUTPUT.PUT(LPAD(' ',7,j||'X'||i||'='||j*i||'  '));
            j:=j+1;
            EXIT WHEN j > n_fin;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
EXCEPTION
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('Valores no válidos');
END PR_TABLAS;
/