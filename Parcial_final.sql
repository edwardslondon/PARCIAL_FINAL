
CREATE OR REPLACE FUNCTION FIND_OUTLIER( DATOS In number_array )
RETURN NUMBER IS
    cont_par integer := 0;
    cont_impar integer :=0;
    last_impar integer;
    last_par integer;
BEGIN
    
    FOR I IN 1..DATOS.COUNT LOOP
      IF (MOD(DATOS(I),2)) <> 0 THEN
        cont_impar := cont_impar +1;
        last_impar := DATOS(I);
      ELSE 
        cont_par := cont_par + 1;
        last_par := DATOS(I);
      END IF;
    END LOOP;
    
    IF cont_impar > cont_par then
        RETURN  last_par;
    ELSE 
        RETURN last_impar;
    end if;
    
RETURN 0;
END;

declare
  numbers number_array;
begin
  numbers := number_array(2, 4, 0, 100, 4, 11, 2602, 36);
  dbms_output.put_line(FIND_OUTLIER(numbers));
  numbers := number_array(160, 3, 1719, 19, 11, 13, -21);
  dbms_output.put_line(FIND_OUTLIER(numbers));
end;



CREATE OR REPLACE PROCEDURE CALCULAR_SIMULACION(
    tasa_efectiva_anual IN DECIMAL,
    numero_coutas IN DECIMAL,
    valor_prestamo IN DECIMAL,
    cuota_mensual IN DECIMAL
) AS
    tasa_nominal_mensual DECIMAL(15,4);
    tasa DECIMAL(15,4);
    BEGIN
        DELETE FROM amortizacion;
        tasa_nominal_mensual := power ( (1 + (tasa_efectiva_anual / 100)), (30 / 360)) - 1;
        tasa := (tasa_nominal_mensual / 100);
        cuota_mensual = ()
        DBMS_OUTPUT.PUT_LINE (tasa_nominal_mensual);
END;

DECLARE 
    tasa_anual_porcentaje DECIMAL(15,4) := 29.8407;
    total_coutas DECIMAL(15,2) := 72.0;
    valor_prestamo DECIMAL(15,2) := 6000000;
BEGIN
 CALCULAR_SIMULACION(tasa_anual_porcentaje,total_coutas,valor_prestamo);
END;
    
    
