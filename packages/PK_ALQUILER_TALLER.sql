/*-----------------------------------------------------------------------------------
  Proyecto   : Reservas de veh�culos. Curso BDII
  Descripcion: Paquete que contiene las variables globales, funciones y procedimientos
               asociados al m�dulo de Reservas
  Autor: Alba Consuelo Nieto.
--------------------------------------------------------------------------------------*/
CREATE OR REPLACE PACKAGE PK_RESERVAS_TALLER AS 
   --Declaraci�n del tipo registro con los datos b�sicos de un cliente
   TYPE gtr_cliente IS RECORD(
     k_nit          cliente.k_nit%TYPE,
     n_nomcliente   cliente.n_nomcliente%TYPE,
     n_apecliente   cliente.n_apecliente%TYPE
     );
     -- Variable global de tipo registro cliente
     gr_cliente gtr_cliente;
     --Variables globales: Estado de la reserva
     gv_cancelada   CONSTANT CHAR(1)  := 'C'; 
     gv_activa      CONSTANT CHAR(1)  := 'A';
     gv_pagada      CONSTANT CHAR(1)  := 'P';

     /*------------------------------------------------------------------------------
     Procedimiento para buscar un cliente
     Parametros de Entrada: pk_nit           N�mero de identificaci�n del cliente a buscar
     Parametros de Salida: pr_cliente        Registro con los datos b�sicos del cliente
                           pc_error        = 1 si no existe,
                                             0, en caso contrario
                           pm_error         Mensaje de error si hay error o null en caso contrario
    */
    PROCEDURE PR_BUSCAR_CLIENTE(pk_nit        IN cliente.k_nit%TYPE,
                                  pr_cliente  OUT gtr_cliente,
                                  pc_error    OUT NUMBER,
                                  pm_error    OUT VARCHAR2);
                                  
     /*------------------------------------------------------------------------------
     Funci�n para buscar el nombre del cliente
     Parametros de Entrada: pk_nit           N�mero de identificaci�n del cliente a buscar
     Parametros de Salida: pc_error        = 1 si no existe,
                                             0, en caso contrario
                           pm_error         Mensaje de error si hay error o null en caso contrario
     Retorna : Nombre completo del cliente de tipo VARCHAR
    */
    FUNCTION FU_BUSCAR_CLIENTE(pk_nit        IN cliente.k_nit%TYPE,
                               pc_error    OUT NUMBER,
                               pm_error    OUT VARCHAR2) RETURN VARCHAR;
                                  
    /*-----------------------------------------------------------------------------------------
     Procedimiento para listar las reservas de un cliente.
     Debe mostrar la identificaci�n,
     nombre y apellido del cliente. Para cada reserva se debe mostrar el c�digo, fecha y valor
     de la reserva, y para cada reserva se muestran los veh�culos reservados: matr�cula, fecha 
     de inicio y fin, y el indicador de si ya fue entregado.
     Parametros de Entrada: pk_nit           N�mero de identificaci�n del cliente
     Parametros de Salida:  
                            pc_error       = 1 si no existe el cliente,
                                             0, en caso contrario
                            pm_error         Mensaje de error si hay error o null en caso contrario
   */
   PROCEDURE PR_LISTAR_RESERVAS(pk_nit IN cliente.k_nit%TYPE, pc_error OUT NUMBER, pm_error OUT VARCHAR);
   
    /*-----------------------------------------------------------------------------------------
     Funci�n que determina  si un veh�culo est� disponible para reserva en una fecha dada.

     Parametros de Entrada: pk_matricula    N�mero de matr�cula del veh�culo solicitado
     						pf_reserva		Fecha para la que se solicita saber la consulta.
     Parametros de Salida:  
                            pc_error       = 1 si no existe el veh�culo,
                                             0, en caso contrario
                            pm_error         Mensaje de error si hay error o null en caso contrario
   */
    FUNCTION FU_VEHICULO_DISPONIBLE (pk_matricula vehiculo.k_matricula%TYPE,
   									pf_reserva date,
   									pc_error OUT NUMBER, 
   		 						 	pm_error OUT VARCHAR)  RETURN BOOLEAN;

END PK_RESERVAS_TALLER;