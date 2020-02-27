DECLARE
    lref_clientes SYS_REFCURSOR;
    l_nomcliente cliente.n_nomcliente%type;
    l_apecliente cliente.n_apecliente%type;
BEGIN
    PR_LISTAR_CLIENTES(lref_clientes);
    LOOP
        FETCH lref_clientes INTO l_nomcliente,l_apecliente;
        EXIT WHEN lref_clientes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(l_nomcliente||' '||l_apecliente);
    END LOOP;
END;
/
