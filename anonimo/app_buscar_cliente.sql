DECLARE
    lk_reserva reserva.k_reserva%TYPE:=&lk_reserva;
    ln_nomcompleto VARCHAR(50);
    lc_error INTEGER;
    lm_error VARCHAR(50);
BEGIN
    PR_BUSCAR_CLIENTE(lk_reserva, ln_nomcompleto);
    DBMS_OUTPUT.PUT_LINE(ln_nomcompleto);
    DBMS_OUTPUT.PUT_LINE(LPAD('Codigo:',10,' ')||lc_error);
    DBMS_OUTPUT.PUT_LINE(LPAD('Mensaje:',10,' ')||lm_error);
END;
/
