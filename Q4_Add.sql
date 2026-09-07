SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_low_mileage IS
        SELECT 
            d.FIRST_NAME,
            d.SURNAME,
            d.DRIVER_CODE,
            dd.VIN_NUMBER,
            v.MILEAGE
        FROM DRIVER_DELIVERIES dd
        JOIN DRIVER d ON dd.DRIVER_ID = d.DRIVER_ID
        JOIN VEHICLE v ON dd.VIN_NUMBER = v.VIN_NUMBER
        WHERE v.MILEAGE < 80000;
BEGIN
    FOR rec IN c_low_mileage LOOP
        DBMS_OUTPUT.PUT_LINE('--------------------------');
        DBMS_OUTPUT.PUT_LINE('DRIVER: ' || rec.FIRST_NAME || ', ' || rec.SURNAME);
        DBMS_OUTPUT.PUT_LINE('CODE: ' || rec.DRIVER_CODE);
        DBMS_OUTPUT.PUT_LINE('VIN NUMBER: ' || rec.VIN_NUMBER);
        DBMS_OUTPUT.PUT_LINE('MILEAGE: ' || rec.MILEAGE);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('--------------------------');
END;
/
