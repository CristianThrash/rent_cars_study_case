CREATE OR REPLACE FUNCTION FU_FACTORIAL(pn INTEGER,
                                        pc_error OUT INTEGER,
                                        pm_error OUT VARCHAR) RETURN INTEGER
AS
    l_fact INTEGER:=1;
BEGIN
    pc_error:=0;
    pm_error:=null;
    IF pn>=0 THEN
        FOR l_cont IN 1..pn LOOP
            l_fact:=l_fact*l_cont;
        END LOOP;
        pm_error:='Ejecutado exitosamente';
    ELSE
        l_fact:=null;
        pc_error:=1;
        pm_error:='Error: Argumento negativo';
    END IF;
    RETURN l_fact;
END FU_FACTORIAL;
/
