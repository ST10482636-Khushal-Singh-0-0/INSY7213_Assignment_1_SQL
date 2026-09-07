	
-- CREATE AND POPULATE STAFF & DELIVERY_ITEMS

CREATE TABLE STAFF (
    STAFF_ID    NUMBER(10) PRIMARY KEY,
    FIRST_NAME  VARCHAR2(50)  NOT NULL,
    SURNAME     VARCHAR2(50)  NOT NULL,
    POSITION    VARCHAR2(50),
    PHONE_NUM   VARCHAR2(20),
    ADDRESS     VARCHAR2(150),
    EMAIL       VARCHAR2(100)
);

INSERT INTO STAFF VALUES (51011, 'Sally', 'Du Toit', 'Logistics', '0825698547', '18 Main rd', 'sdut@isat.com');
INSERT INTO STAFF VALUES (51012, 'Mark', 'Wright', 'CRM', '0836984178', '12 Cape Way', 'mwright@isat.com');
INSERT INTO STAFF VALUES (51013, 'Harry', 'Sheen', 'Logistics', '0725648965', '15 Water Street', 'hsheen@isat.com');
INSERT INTO STAFF VALUES (51014, 'Jabu', 'Xolani', 'Logistics', '0823116598', '18 White Lane', 'jxo@isat.com');
INSERT INTO STAFF VALUES (51015, 'Roberto', 'Henry', 'Packaging', '0783521451', '55 Cape Street', 'rhenry@isat.com');
INSERT INTO STAFF VALUES (51016, 'Pat', 'Durant', 'Logistics', '0825698542', '1 Main rd', 'pd@isat.com');
INSERT INTO STAFF VALUES (51017, 'Steve', 'Maritz', 'CRM', '0836984173', '2 Cape Way', 'sm@isat.com');
INSERT INTO STAFF VALUES (51018, 'Maxwell', 'Dube', 'Logistics', '0725648964', '5 Water Street', 'max@isat.com');
INSERT INTO STAFF VALUES (51019, 'Shane', 'Mane', 'Logistics', '0823116595', '8 White Lane', 'smane@isat.com');
INSERT INTO STAFF VALUES (51111, 'Bob', 'Truth', 'Packaging', '0783521456', '35 Cape Street', 'btruth@isat.com');

CREATE TABLE DELIVERY_ITEMS (
    DELIVERY_ITEM_ID NUMBER(10) PRIMARY KEY,
    DESCRIPTION      VARCHAR2(150) NOT NULL,
    STAFF_ID         NUMBER(10) NOT NULL
);

INSERT INTO DELIVERY_ITEMS VALUES (71011, 'House relocation', 51011);
INSERT INTO DELIVERY_ITEMS VALUES (71012, 'Delivery of consignments', 51017);
INSERT INTO DELIVERY_ITEMS VALUES (71013, 'Delivery of specialized consignments', 51015);
INSERT INTO DELIVERY_ITEMS VALUES (71014, 'Office relocation', 51012);
INSERT INTO DELIVERY_ITEMS VALUES (71015, 'Delivery of specialized consignments', 51014);

COMMIT;
