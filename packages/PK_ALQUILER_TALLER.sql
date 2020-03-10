/*-----------------------------------------------------------------------------------
  Proyecto   : Reservas de vehículos. Curso BDII
  Descripcion: Paquete que contiene las variables globales, funciones y procedimientos
               asociados al módulo de Reservas
  Autor: Alba Consuelo Nieto.
--------------------------------------------------------------------------------------*/
CREATE OR REPLACE PACKAGE PK_RESERVAS_TALLER AS 
   --Declaración del tipo registro con los datos básicos de un cliente
   TYPE gtr_cliente IS RECORD(
     k_nit          cliente.k_nit,
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
     Parametros de Entrada: pk_nit           Número de identificación del cliente a buscar
     Parametros de Salida: pr_cliente        Registro con los datos básicos del cliente
                           pc_error        = 1 si no existe,
                                             0, en caso contrario
                           pm_error         Mensaje de error si hay error o null en caso contrario
    */
    PROCEDURE PR_BUSCAR_CLIENTE(pk_nit        IN cliente.k_nit%TYPE,
                                  pr_cliente  OUT gtr_cliente,
                                  pc_error    OUT NUMBER,
                                  pm_error    OUT VARCHAR2(10));
                                  
     /*------------------------------------------------------------------------------
     Función para buscar el nombre del cliente
     Parametros de Entrada: pk_nit           Número de identificación del cliente a buscar
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
     Debe mostrar la identificación,
     nombre y apellido del cliente. Para cada reserva se debe mostrar el código, fecha y valor
     de la reserva, y para cada reserva se muestran los vehículos reservados: matrícula, fecha 
     de inicio y fin, y el indicador de si ya fue entregado.
     Parametros de Entrada: pk_nit           Número de identificación del cliente
     Parametros de Salida:  
                            pc_error       = 1 si no existe el cliente,
                                             0, en caso contrario
                            pm_error         Mensaje de error si hay error o null en caso contrario
   */
   PROCEDURE PR_LISTAR_RESERVAS(pk_nit IN cliente.k_nit%TYPE, pc_error OUT NUMBER, pm_error OUT VARCHAR);
   
   /* TODO Elaborar la documentación del procedimiento y completar el encabezado para validar si
      un vehículo está disponible para reservar en una fecha dada*/
   FUNCTION FU_VEHICULO_DISPONIBLE  RETURN BOOLEAN

END PK_RESERVAS_TALLER;