SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE PROCEDURE PR_MAYOR_NUMERO(a NUMERIC,
                                            b NUMERIC,
                                            c NUMERIC)
AS

BEGIN
    DBMS_OUTPUT.PUT_LINE('Valores ingresados: '||a||' '||b||' '||c);
    IF a>b and a>c THEN
        DBMS_OUTPUT.PUT_LINE(a||' es el mayor');
    ELSIF b>a and b>c THEN
        DBMS_OUTPUT.PUT_LINE(b||' es el mayor');
    ELSIF c>a and c>b THEN
        DBMS_OUTPUT.PUT_LINE(c||' es el mayor');
    END IF;
EXCEPTION
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('Valores no válidos');
END PR_MAYOR_NUMERO;
/