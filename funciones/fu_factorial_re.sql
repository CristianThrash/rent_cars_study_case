CREATE OR REPLACE FUNCTION FU_FACTORIAL(pn INTEGER) RETURN INTEGER
AS
    l_fact INTEGER;
BEGIN
    IF pn=0 THEN
        l_fact:=1;
    ELSE
        l_fact:=FU_FACTORIAL(pn-1)*pn;
    END IF;
    RETURN l_fact;
END FU_FACTORIAL;
/