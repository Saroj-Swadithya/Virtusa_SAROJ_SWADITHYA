# Digital Library Management System - SQL Project

## Overview

This project implements a relational database system for a community college library to track book loans, manage student borrowing records, and generate analytical reports for library operations.

## Problem Statement

A local community college has a database of books and student borrows. They are struggling to track **"Overdue"** books and want to know which categories of books are most popular to decide what to buy next.

### Business Objectives

1. Track books issued to students with issue and return dates
2. Identify overdue books (not returned within 14 days)
3. Analyze book popularity by category to inform purchasing decisions
4. Maintain data hygiene by removing inactive student accounts

---

## Database Schema

### Tables

| Table | Description |
|-------|-------------|
| `BOOKS` | Stores book catalog information |
| `STUDENTS` | Stores student enrollment details |
| `ISSUEDBOOKS` | Tracks book issuance transactions |

### Entity Relationship Diagram

```
BOOKS                    ISSUEDBOOKS                STUDENTS
─────────────────────    ──────────────────────    ──────────────────────
PK  BK_ID        ───────────> FK  BOOK_ID
    TITLE                      FK  STUDENT_ID  <────────── PK  STU_ID
    AUTHOR                     ISSUE_DATE
    CATEGORY                   RETURN_DATE           STU_NAME
                                                     DEPT
                                                     JOIN_DATE
```

---

## Files Description

| File | Purpose |
|------|---------|
| `Library_Table_Creation.sql` | DDL statements for creating tables with foreign key constraints |
| `data.sql` | Sample data insertion for testing and demonstration |
| `queries.sql` | Analytical queries solving the 4 required tasks |
| `SQL output.pdf` | Output results of query execution |

---

## Implementation Details

### Task 1: Table Creation

Three tables are created with proper relationships:

- **BOOKS**: `BK_ID` (Primary Key), `TITLE`, `AUTHOR`, `CATEGORY`
- **STUDENTS**: `STU_ID` (Primary Key), `STU_NAME`, `DEPT`, `JOIN_DATE`
- **ISSUEDBOOKS**: Links books and students with `ISSUE_DATE` and `RETURN_DATE`

Foreign key constraints ensure referential integrity between tables.

### Task 2: Overdue Book Detection

Identifies all students who haven't returned a book beyond the 14-day lending period.

```sql
SELECT S.STU_ID, S.STU_NAME, B.TITLE, I.ISSUE_DATE
FROM ISSUEDBOOKS I
JOIN STUDENTS S ON I.STUDENT_ID = S.STU_ID
JOIN BOOKS B ON I.BOOK_ID = B.BK_ID
WHERE I.RETURN_DATE IS NULL
AND I.ISSUE_DATE < CURRENT_DATE - INTERVAL 14 DAY;
```

**Logic**: Books with `RETURN_DATE` as `NULL` issued more than 14 days ago are considered overdue.

### Task 3: Popularity Index (Category Analysis)

Determines which book categories are most borrowed to assist in collection development.

```sql
SELECT B.CATEGORY, COUNT(*) AS BORROW_COUNT
FROM ISSUEDBOOKS I
JOIN BOOKS B ON I.BOOK_ID = B.BK_ID
GROUP BY B.CATEGORY
ORDER BY BORROW_COUNT DESC;
```

**Output**: Categories ranked by borrow count — highest count indicates most popular genre.

### Task 4: Data Cleanup (Inactive Accounts)

Removes student records who haven't borrowed any book in the last 3 years.

```sql
DELETE FROM STUDENTS
WHERE STU_ID NOT IN (
    SELECT DISTINCT STUDENT_ID
    FROM ISSUEDBOOKS
    WHERE ISSUE_DATE >= CURRENT_DATE - INTERVAL 3 YEAR
);
```

**Purpose**: Maintains database performance and data relevance by archiving inactive users.

---

## How to Run

### Prerequisites
- MySQL 8.0+ or PostgreSQL (queries use standard SQL with `INTERVAL` syntax)


## Key SQL Concepts Used

| Concept | Application |
|---------|-------------|
| **DDL** | `CREATE TABLE` with constraints |
| **DML** | `INSERT`, `DELETE` operations |
| **JOINS** | Inner joins for combining related data |
| **Aggregation** | `COUNT()`, `GROUP BY` for analytics |
| **Date Functions** | `CURRENT_DATE - INTERVAL` for time-based logic |
| **Subqueries** | Nested `SELECT` for cleanup operations |
| **Constraints** | Foreign keys for referential integrity |

---

## Assignment Deliverables

- [x] Table Creation (DDL)
- [x] Overdue Detection Query
- [x] Popularity Index Query
- [x] Data Cleanup Statement
- [x] Sample Test Data

---

*Assignment submitted by Saroj Swadithya M for Virtusa Training Program*
