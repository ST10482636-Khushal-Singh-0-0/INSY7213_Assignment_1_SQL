-- Step 1: Create the view to calculate delivery totals per staff member
CREATE OR REPLACE VIEW VW_STAFF_DELIVERY_SUMMARY AS
SELECT 
    s.STAFF_ID,
    s.FIRST_NAME,
    s.SURNAME,
    -- Count every completed delivery handled by this staff member
    COUNT(dd.DRIVER_DELIVERY_ID) AS DELIVERIES_PROCESSED
FROM STAFF s
-- Connect the staff member to the delivery catalog items they arranged
JOIN DELIVERY_ITEMS di ON s.STAFF_ID = di.STAFF_ID
-- Connect those items to actual driver road deliveries
JOIN DRIVER_DELIVERIES dd ON di.DELIVERY_ITEM_ID = dd.DELIVERY_ITEM_ID
-- Group rows together so each staff member gets one combined total
GROUP BY s.STAFF_ID, s.FIRST_NAME, s.SURNAME;

-- Step 2: Query the view to find the highest-performing staff member
SELECT 
    STAFF_ID,
    FIRST_NAME,
    SURNAME,
    DELIVERIES_PROCESSED
FROM VW_STAFF_DELIVERY_SUMMARY
ORDER BY DELIVERIES_PROCESSED DESC
FETCH FIRST 1 ROW ONLY;
