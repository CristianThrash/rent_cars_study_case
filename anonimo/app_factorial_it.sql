DECLARE
    ln INTEGER:=&ln;
    lc_error INTEGER;
    lm_error VARCHAR(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Factorial('||ln||')='||FU_FACTORIAL(ln,lc_error,lm_error));
    DBMS_OUTPUT.PUT_LINE('resultado: '||lc_error||' '||lm_error);
END;
/
