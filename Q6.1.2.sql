SET SERVEROUTPUT ON;

-- 1. Explicit Cursor Attribute Demo (%NOTFOUND)
DECLARE
    -- Explicitly define cursor to retrieve all Mercedes (MERC) vehicles
    CURSOR c_merc_vehicles IS
        SELECT VIN_NUMBER, VEHICLE_TYPE, MILEAGE
        FROM VEHICLE
        WHERE MANUFACTURER = 'MERC';
        
    v_vin     VEHICLE.VIN_NUMBER%TYPE;
    v_type    VEHICLE.VEHICLE_TYPE%TYPE;
    v_mileage VEHICLE.MILEAGE%TYPE;
BEGIN
    OPEN c_merc_vehicles;
    DBMS_OUTPUT.PUT_LINE('--- MERCEDES FLEET LIST ---');
    LOOP
        FETCH c_merc_vehicles INTO v_vin, v_type, v_mileage;
        -- Explicit cursor attribute: exit when no more records exist
        EXIT WHEN c_merc_vehicles%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('VIN: ' || v_vin || ' | Type: ' || v_type || ' | Mileage: ' || v_mileage);
    END LOOP;
    CLOSE c_merc_vehicles;
END;
/

-- 2. Implicit Cursor Attribute Demo (SQL%ROWCOUNT)
BEGIN
    -- Update vehicle mileage for testing
    UPDATE VEHICLE
    SET MILEAGE = MILEAGE + 500
    WHERE MANUFACTURER = 'TATA';

    -- Implicit cursor attribute: confirms how many rows were modified
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Update successful. Total vehicles updated (SQL%ROWCOUNT): ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No records matched update criteria.');
    END IF;
    
    -- Rollback test update to maintain baseline data
    ROLLBACK;
END;
/
