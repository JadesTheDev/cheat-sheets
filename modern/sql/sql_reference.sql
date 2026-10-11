-- Modern SQL reference: practical relational-database patterns.
-- SQL is standardized (current published family: SQL:2023, with 2026 corrigenda),
-- but real databases use dialects. This file favors portable/common syntax and
-- clearly marks areas where PostgreSQL, MySQL, SQL Server, SQLite, Oracle, etc. differ.

-- ============================================================
-- 1. CREATE TABLE / CONSTRAINTS
-- ============================================================

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255),
    age INTEGER CHECK (age IS NULL OR age >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    total DECIMAL(10, 2) NOT NULL CHECK (total >= 0),
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);

-- Common constraints:
-- PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT

-- Identity / auto-number syntax is dialect-specific:
-- PostgreSQL: GENERATED ... AS IDENTITY
-- MySQL: AUTO_INCREMENT
-- SQL Server: IDENTITY(seed, increment)
-- SQLite: INTEGER PRIMARY KEY has special rowid behavior

-- ============================================================
-- 2. INSERT
-- ============================================================

INSERT INTO users (user_id, username, email, age)
VALUES (1, 'corbie', 'corbie@example.com', 28);

INSERT INTO users (user_id, username, email, age)
VALUES (2, 'mocha', NULL, 5);

INSERT INTO orders (order_id, user_id, total, status)
VALUES
    (101, 1, 25.50, 'paid'),
    (102, 1, 12.00, 'pending'),
    (103, 2, 9.99, 'paid');

-- ============================================================
-- 3. BASIC SELECT
-- ============================================================

SELECT *
FROM users;

SELECT username, email
FROM users
WHERE age >= 18
ORDER BY username ASC;

SELECT DISTINCT status
FROM orders;

-- Aliases:
SELECT
    u.username AS user_name,
    u.created_at AS joined_at
FROM users AS u;

-- ============================================================
-- 4. FILTERING / BOOLEAN LOGIC / NULL
-- ============================================================

SELECT *
FROM orders
WHERE total BETWEEN 10 AND 30
  AND status IN ('paid', 'pending');

SELECT *
FROM users
WHERE username LIKE 'cor%';

-- NULL means unknown/missing, so use IS NULL / IS NOT NULL.
SELECT *
FROM users
WHERE email IS NULL;

SELECT *
FROM users
WHERE email IS NOT NULL;

-- Never write: email = NULL

-- ============================================================
-- 5. UPDATE
-- ============================================================

UPDATE users
SET email = 'new@example.com'
WHERE user_id = 1;

-- Always verify the WHERE clause first. Without WHERE, every row is updated.

-- ============================================================
-- 6. DELETE
-- ============================================================

DELETE FROM orders
WHERE order_id = 102;

-- Without WHERE, DELETE removes every row in the table.

-- ============================================================
-- 7. JOINS
-- ============================================================

SELECT
    u.username,
    o.order_id,
    o.total,
    o.status
FROM users AS u
INNER JOIN orders AS o
    ON u.user_id = o.user_id;

SELECT
    u.username,
    o.order_id
FROM users AS u
LEFT JOIN orders AS o
    ON u.user_id = o.user_id;

-- RIGHT JOIN and FULL OUTER JOIN exist in the SQL standard but support varies.
-- SQLite supports RIGHT/FULL in modern releases, but older deployments may not.

-- Self join example:
-- SELECT e.name, m.name AS manager_name
-- FROM employees AS e
-- LEFT JOIN employees AS m ON e.manager_id = m.employee_id;

-- ============================================================
-- 8. AGGREGATES / GROUP BY / HAVING
-- ============================================================

SELECT
    user_id,
    COUNT(*) AS order_count,
    SUM(total) AS total_spent,
    AVG(total) AS average_order,
    MIN(total) AS smallest_order,
    MAX(total) AS largest_order
FROM orders
GROUP BY user_id
HAVING COUNT(*) >= 1;

-- WHERE filters rows before grouping.
-- HAVING filters groups after GROUP BY.

-- ============================================================
-- 9. CASE EXPRESSIONS
-- ============================================================

SELECT
    order_id,
    total,
    CASE
        WHEN total >= 100 THEN 'large'
        WHEN total >= 25 THEN 'medium'
        ELSE 'small'
    END AS order_size
FROM orders;

-- ============================================================
-- 10. SUBQUERIES
-- ============================================================

SELECT username
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
    WHERE total > 20
);

-- EXISTS is often useful for existence checks:
SELECT u.username
FROM users AS u
WHERE EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.user_id = u.user_id
      AND o.status = 'paid'
);

-- ============================================================
-- 11. COMMON TABLE EXPRESSIONS (CTEs)
-- ============================================================

WITH paid_orders AS (
    SELECT user_id, total
    FROM orders
    WHERE status = 'paid'
)
SELECT user_id, SUM(total) AS paid_total
FROM paid_orders
GROUP BY user_id;

-- Recursive CTE syntax is standardized, but practical details vary by database.
-- WITH RECURSIVE ... is common in PostgreSQL / SQLite / MySQL.

-- ============================================================
-- 12. WINDOW FUNCTIONS
-- ============================================================

SELECT
    order_id,
    user_id,
    total,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY total DESC
    ) AS order_rank,
    SUM(total) OVER (
        PARTITION BY user_id
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM orders;

-- Common window functions:
-- ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD(), SUM() OVER(...)

-- ============================================================
-- 13. SET OPERATIONS
-- ============================================================

SELECT username
FROM users
WHERE age >= 18
UNION
SELECT username
FROM users
WHERE email IS NOT NULL;

-- UNION removes duplicates; UNION ALL keeps them.
-- INTERSECT and EXCEPT are standard, but support/aliases vary by dialect.

-- ============================================================
-- 14. SORTING / PAGINATION
-- ============================================================

SELECT order_id, total
FROM orders
ORDER BY total DESC, order_id ASC;

-- Pagination differs by dialect.
-- Standard-ish:
-- SELECT ... ORDER BY ... OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;
-- PostgreSQL / MySQL / SQLite commonly use LIMIT 10 OFFSET 20.
-- SQL Server commonly uses OFFSET ... FETCH with ORDER BY.

-- ============================================================
-- 15. TRANSACTIONS
-- ============================================================

-- Transaction opening syntax varies slightly.
-- START TRANSACTION;
-- UPDATE accounts SET balance = balance - 50 WHERE account_id = 1;
-- UPDATE accounts SET balance = balance + 50 WHERE account_id = 2;
-- COMMIT;
-- Use ROLLBACK instead of COMMIT to undo the transaction.

-- ACID shorthand:
-- Atomicity, Consistency, Isolation, Durability

-- Isolation levels and locking behavior differ significantly by database.

-- ============================================================
-- 16. INDEXES
-- ============================================================

-- CREATE INDEX idx_orders_user_id ON orders(user_id);
-- CREATE INDEX idx_orders_status_total ON orders(status, total);

-- Indexes can speed reads but cost storage and write/update time.
-- Index foreign keys / frequent search, join, and sort columns when appropriate.

-- ============================================================
-- 17. ALTER TABLE
-- ============================================================

-- ALTER TABLE users ADD COLUMN display_name VARCHAR(100);
-- ALTER TABLE users DROP COLUMN display_name;

-- ALTER capabilities vary widely, especially on embedded databases.

-- ============================================================
-- 18. VIEWS
-- ============================================================

CREATE VIEW IF NOT EXISTS paid_order_summary AS
SELECT
    user_id,
    COUNT(*) AS paid_order_count,
    SUM(total) AS paid_total
FROM orders
WHERE status = 'paid'
GROUP BY user_id;

SELECT *
FROM paid_order_summary;

-- DROP VIEW paid_order_summary;

-- ============================================================
-- 19. NULL HANDLING / COALESCE
-- ============================================================

SELECT
    username,
    COALESCE(email, 'no-email@example.invalid') AS display_email
FROM users;

-- NULLIF(a, b) returns NULL when a = b; otherwise it returns a.
SELECT NULLIF(10, 10) AS becomes_null;

-- ============================================================
-- 20. STRING / DATE FUNCTIONS
-- ============================================================

-- Function names and date syntax vary by dialect.
-- Common/standard examples include:
SELECT UPPER(username) AS upper_name
FROM users;

SELECT LOWER(username) AS lower_name
FROM users;

-- String concatenation is dialect-sensitive:
-- Standard/PostgreSQL/SQLite: first_name || ' ' || last_name
-- MySQL: CONCAT(first_name, ' ', last_name)
-- SQL Server: first_name + ' ' + last_name (NULL behavior matters)

-- Date/time functions vary heavily. Always check your database's documentation.

-- ============================================================
-- 21. PARAMETERS / SQL INJECTION SAFETY
-- ============================================================

-- DO NOT build SQL by concatenating untrusted input:
-- "SELECT * FROM users WHERE username = '" + userInput + "'"

-- Use parameterized/prepared statements from application code instead.
-- Placeholder styles vary:
-- PostgreSQL drivers may use $1, $2...
-- SQLite / many APIs support ?
-- SQL Server commonly uses @name
-- Python DB-API placeholder style depends on the driver

-- ============================================================
-- 22. SCHEMA / DDL / DML / DQL / TCL QUICK MAP
-- ============================================================

-- DDL: CREATE, ALTER, DROP
-- DML: INSERT, UPDATE, DELETE, MERGE
-- Querying: SELECT
-- TCL: COMMIT, ROLLBACK, SAVEPOINT
-- DCL terms often include GRANT and REVOKE

-- ============================================================
-- 23. MERGE / UPSERT NOTES
-- ============================================================

-- MERGE is standardized SQL, but syntax/support differs among engines.
-- Native "upsert" syntax also differs:
-- PostgreSQL / SQLite: INSERT ... ON CONFLICT ...
-- MySQL: INSERT ... ON DUPLICATE KEY UPDATE ...
-- SQL Server: MERGE exists, but application guidance may prefer other patterns.

-- ============================================================
-- 24. COMMON SQL GOTCHAS
-- ============================================================

-- 1. NULL is not equal to anything, including NULL: use IS NULL.
-- 2. UPDATE / DELETE without WHERE affects every row.
-- 3. WHERE filters rows; HAVING filters grouped results.
-- 4. JOINs can multiply rows when relationships are one-to-many or many-to-many.
-- 5. SELECT * is convenient but fragile for production interfaces and unnecessary data transfer.
-- 6. Without ORDER BY, row order is not guaranteed.
-- 7. DECIMAL/NUMERIC is usually preferable to floating point for exact money values.
-- 8. Identifier quoting differs (`name`, "name", [name]) by dialect/settings.
-- 9. Date/time, JSON, regex, full-text, identity, and pagination syntax vary by database.
-- 10. Parameterization protects against SQL injection; escaping alone is not a substitute.

-- ============================================================
-- 25. CURRENT STANDARD NOTE (2026)
-- ============================================================

-- The current published ISO/IEC 9075 family is SQL:2023.
-- Technical corrigenda have also been published in 2026 for parts of that edition.
-- A successor edition is under development, so "current SQL" in practice still means:
-- learn portable relational SQL first, then consult the specific database dialect docs.
