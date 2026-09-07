```markdown
# Cheetah Deliveries - Oracle Relational Database Implementation

## Project Overview
Cheetah Deliveries operates in the courier and logistics sector, facing operational challenges with delivery timelines and parcel condition tracking. This project implements an Oracle Relational Database Management System (RDBMS) to replace legacy flat-file records.

The solution establishes referential integrity, eliminates data redundancy, configures role-based access security, and provides operational reporting using PL/SQL procedural blocks, cursors, sequences, and database views.

---

## Key Features & Architecture

* **Relational Schema Design:** Normalized structure encompassing `CUSTOMERS`, `STAFF`, `DRIVER`, `VEHICLE`, `DELIVERY_ITEMS`, `DRIVER_DELIVERIES`, and `BILLING` with complete primary and foreign key constraints[cite: 1].
* **Role-Based Access Control (RBAC):** Implementation of separation of duties via individual user permissions (`SELECT ANY TABLE` vs. `INSERT ANY TABLE`)[cite: 3].
* **Automated Key Generation:** Database `SEQUENCE` generation for primary key assignment during billing transactions[cite: 10].
* **Procedural Logic & Cursors:**
  * Explicit cursor reports filtering fleet vehicles by mileage thresholds[cite: 4].
  * Aggregation queries identifying staff delivery volumes[cite: 6].
  * Implicit (`SQL%ROWCOUNT`) and explicit (`%NOTFOUND`) cursor attribute implementations[cite: 8].
* **Reporting Views:** Pre-compiled SQL views designed for operational metric retrieval[cite: 7].

---

## Prerequisites

* **Database Engine:** Oracle Database Express Edition (XE) 18c, 19c, or 21c (Pluggable Database container `XEPDB1`)[cite: 3].
* **Client / Interface:** Oracle SQL Developer, SQL*Plus, or equivalent IDE.

---

## Execution Guide

### 1. Schema Definition & Data Population
Connect to the target database container (`XEPDB1`) and execute the base DDL and DML statements to create and populate all core tables[cite: 1, 3]:

```sql
@01_schema_and_data.sql

```

### 2. User Security & Privilege Configuration

Connect with administrative privileges (`SYSDBA` / `SYSTEM`) to create users and assign access roles:

```sql
@02_user_management.sql

```

### 3. Procedural Reports & Analysis

Enable server output before executing the PL/SQL blocks:

```sql
SET SERVEROUTPUT ON;


---


**Author:** Khushal Singh

**Student Number:** ST10482636

**NOTE THAT AI WAS USED TO GET THIS FORMATING FOR GITHUB**
```

```
