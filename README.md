# INSY7213_Assignment_1_SQL
```markdown
# Cheetah Deliveries - Oracle Relational Database Implementation

## Project Overview
Cheetah Deliveries is a logistics and courier service provider facing operational challenges, including late deliveries and parcel handling issues. This project transitions the company from an error-prone flat-file data architecture to an enterprise-grade Oracle Relational Database Management System (RDBMS).

The relational design enforces referential integrity, eliminates data redundancy, manages secure role-based access control (RBAC), and provides analytical reporting through PL/SQL procedures, cursors, and SQL views.

---

## Key Features & Database Architecture

* **Third Normal Form (3NF) Relational Schema:** Tables structured across `CUSTOMERS`, `STAFF`, `DRIVER`, `VEHICLE`, `DELIVERY_ITEMS`, `DRIVER_DELIVERIES`, and `BILLING` with complete primary and foreign key constraint mapping.
* **Granular Security & Separation of Duties:** Role isolation separating read-only auditing (`SELECT ANY TABLE`) from entry personnel (`INSERT ANY TABLE`).
* **Automated Key Generation:** Oracle `SEQUENCE` objects to prevent primary key collisions during concurrent invoice and billing creation.
* **Procedural Logic & Cursor Operations:**
  * Explicit cursor routines filtering vehicle maintenance parameters by mileage thresholds.
  * Analytical queries determining operational throughput and top-performing logistics staff.
  * Cursor attribute implementations (`%NOTFOUND`, `SQL%ROWCOUNT`) for validation and flow control.
* **Reporting Abstraction:** SQL views simplifying multi-table operational metrics for management reporting.

---

## Schema & Entity Relationship

```text
CUSTOMERS (1) --------< BILLING (M) >-------- (1) STAFF
                                                 |
                                                 | (1)
                                                 v
                                          DELIVERY_ITEMS (M)
                                                 |
                                                 | (1)
                                                 v
VEHICLE (1) <------- DRIVER_DELIVERIES (M) ------+
                                ^
                                | (M)
                            DRIVER (1)

```

---

## Prerequisites

* **Database Engine:** Oracle Database Express Edition (XE) 18c, 19c, or 21c (PDB support enabled, e.g., `XEPDB1`).
* **Client / Interface:** Oracle SQL Developer, SQL*Plus, or DBeaver.

---

## Execution Guide

### 1. Schema Creation & Data Seeding

Open your SQL client, connect to your database user/schema (e.g., inside `XEPDB1`), and run the unified DDL/DML script:

```sql
@schema_setup.sql

```

> **Note:** This creates all relational tables, defines foreign keys, and seeds base operational data.

### 2. User Security & Permissions Configuration

Log in as a user with administrative rights (`SYSDBA` or `SYSTEM`) to execute user creation scripts:

```sql
@user_security.sql

```

### 3. Procedural Logic & Reports

To run the PL/SQL blocks and cursor routines, enable console output in your session:

```sql
SET SERVEROUTPUT ON;

```

Run individual scripts for mileage reports, staff volume analysis, and sequence demonstrations:

* **Mileage Analysis:** Run `question4.sql`
* **Performance Analysis:** Run `question5.sql`
* **Cursor & Sequence Validations:** Run `question6.sql`

---

## Repository Structure

```text
├── sql/
│   ├── 01_schema_and_data.sql     # Table definitions, constraints, and data inserts
│   ├── 02_user_management.sql    # RBAC configuration and permission grants
│   ├── 03_vehicle_mileage.sql    # PL/SQL cursor report for vehicle operations
│   ├── 04_staff_performance.sql  # Aggregation queries, procedures, and views
│   └── 05_cursors_sequences.sql  # Cursor attributes and billing sequence implementation
├── docs/
│   └── ERD_Diagram.png           # Entity-Relationship diagram
└── README.md

```

---

**Author:** Khushal Singh

**Student Number:** ST10482636

```

```
