CREATE OR REPLACE PROCEDURE PR_BUSCAR_CLIENTE(pk_reserva reserva.k_reserva%TYPE,
                                              pn_nomcompleto OUT cliente.n_nomcliente%TYPE,
                                              pc_error OUT INTEGER,
                                              pm_error OUT VARCHAR)
AS
BEGIN
	pc_error:=0;
	pm_error:=null;
	SELECT n_nomcliente||' '||n_apecliente INTO pn_nomcompleto
	FROM cliente c, reserva r
	WHERE c.k_nit=r.k_nit AND r.k_reserva=pk_reserva;
	pm_error:='Transacción OK';
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		pc_error:=1;
		pm_error:='Error: Cliente no encontrado. Intente más tarde';	
END PR_BUSCAR_CLIENTE;
/