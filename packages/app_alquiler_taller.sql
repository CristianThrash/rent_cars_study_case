DECLARE
	pk_nit      cliente.k_nit%TYPE := &k_nit;
    lr_cliente  PK_RESERVAS_TALLER.gtr_cliente;
    lc_error    NUMBER;
    lm_error    VARCHAR2(50);
BEGIN
	PK_RESERVAS_TALLER.PR_BUSCAR_CLIENTE(pk_nit,lr_cliente,lc_error,lm_error);
	DBMS_OUTPUT.PUT_LINE(lr_cliente.k_nit||' '||lr_cliente.n_nomcliente||' '||lr_cliente.n_apecliente);
	IF lc_error<>0 THEN
		DBMS_OUTPUT.PUT_LINE('Error No: '||lc_error);
		DBMS_OUTPUT.PUT_LINE('Mensaje: '||lm_error);
	END IF;
	DBMS_OUTPUT.PUT_LINE(PK_RESERVAS_TALLER.FU_BUSCAR_CLIENTE(pk_nit,lc_error,lm_error));
	IF lc_error<>0 THEN
		DBMS_OUTPUT.PUT_LINE('Error No: '||lc_error);
		DBMS_OUTPUT.PUT_LINE('Mensaje: '||lm_error);
	END IF;
END;
/

DECLARE
	pk_matricula vehiculo.k_matricula%TYPE := '&k_matricula';
    pf_reserva date := TO_DATE('&f_reserva','DD/MM/YYYY');
    lc_error    NUMBER;
    lm_error    VARCHAR2(50);
BEGIN
	IF PK_RESERVAS_TALLER.FU_VEHICULO_DISPONIBLE(pk_matricula,pf_reserva,lc_error,lm_error) THEN
		DBMS_OUTPUT.PUT_LINE('Disponible');
	ELSE
		DBMS_OUTPUT.PUT_LINE('No disponible');
	END IF;
END;
/