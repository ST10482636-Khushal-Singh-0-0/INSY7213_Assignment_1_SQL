-- Switch to the pluggable database (Standard Oracle XE 18c/21c architecture)
ALTER SESSION SET CONTAINER = XEPDB1;

-- 1. Create User John
CREATE USER John IDENTIFIED BY Johnch2026
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

-- Grant Connection and SELECT ANY TABLE Privilege
GRANT CREATE SESSION TO John;
GRANT SELECT ANY TABLE TO John;

-- 2. Create User Hannah
CREATE USER Hannah IDENTIFIED BY Hannahch2026
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

-- Grant Connection and INSERT ANY TABLE Privilege
GRANT CREATE SESSION TO Hannah;
GRANT INSERT ANY TABLE TO Hannah;
