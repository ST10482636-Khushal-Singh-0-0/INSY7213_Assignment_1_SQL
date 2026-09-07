SET SERVEROUTPUT ON;

DECLARE
    v_staff_id   STAFF.STAFF_ID%TYPE;
    v_first_name STAFF.FIRST_NAME%TYPE;
    v_surname    STAFF.SURNAME%TYPE;
    v_deliveries NUMBER;
BEGIN
    SELECT 
        s.STAFF_ID, 
        s.FIRST_NAME, 
        s.SURNAME, 
        COUNT(dd.DRIVER_DELIVERY_ID)
    INTO 
        v_staff_id, 
        v_first_name, 
        v_surname, 
        v_deliveries
    FROM STAFF s
    JOIN DELIVERY_ITEMS di ON s.STAFF_ID = di.STAFF_ID
    JOIN DRIVER_DELIVERIES dd ON di.DELIVERY_ITEM_ID = dd.DELIVERY_ITEM_ID
    GROUP BY s.STAFF_ID, s.FIRST_NAME, s.SURNAME
    ORDER BY COUNT(dd.DRIVER_DELIVERY_ID) DESC
    FETCH FIRST 1 ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('---------------------------');
    DBMS_OUTPUT.PUT_LINE('STAFF ID: ' || v_staff_id);
    DBMS_OUTPUT.PUT_LINE('FIRST NAME: ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('SURNAME: ' || v_surname);
    DBMS_OUTPUT.PUT_LINE('DELIVERIES PROCESSED: ' || v_deliveries);
    DBMS_OUTPUT.PUT_LINE('---------------------------');
END;
/
