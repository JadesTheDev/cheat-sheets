-- SQL syntax reference: common relational-database patterns.
-- Dialects differ. This file favors widely recognized ANSI-style SQL where practical.

-- ---------- CREATE TABLE ----------
CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255),
    age INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- ---------- INSERT ----------
INSERT INTO users (user_id, username, email, age)
VALUES (1, 'corbie', 'corbie@example.com', 28);

INSERT INTO orders (order_id, user_id, total, status)
VALUES
    (101, 1, 25.50, 'paid'),
    (102, 1, 12.00, 'pending');


-- ---------- SELECT ----------
SELECT *
FROM users;

SELECT username, email
FROM users
WHERE age >= 18
ORDER BY username ASC;


-- ---------- FILTERING ----------
SELECT *
FROM orders
WHERE total BETWEEN 10 AND 30
  AND status IN ('paid', 'pending');

SELECT *
FROM users
WHERE username LIKE 'cor%';

-- NULL uses IS NULL / IS NOT NULL, not = NULL.
SELECT *
FROM users
WHERE email IS NOT NULL;


-- ---------- UPDATE ----------
UPDATE users
SET email = 'new@example.com'
WHERE user_id = 1;


-- ---------- DELETE ----------
DELETE FROM orders
WHERE order_id = 102;


-- ---------- JOINS ----------
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


-- ---------- AGGREGATES / GROUP BY ----------
SELECT
    user_id,
    COUNT(*) AS order_count,
    SUM(total) AS total_spent,
    AVG(total) AS average_order
FROM orders
GROUP BY user_id
HAVING COUNT(*) >= 1;


-- ---------- SUBQUERY ----------
SELECT username
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
    WHERE total > 20
);


-- ---------- COMMON TABLE EXPRESSION (CTE) ----------
WITH paid_orders AS (
    SELECT user_id, total
    FROM orders
    WHERE status = 'paid'
)
SELECT user_id, SUM(total) AS paid_total
FROM paid_orders
GROUP BY user_id;


-- ---------- CASE ----------
SELECT
    order_id,
    total,
    CASE
        WHEN total >= 100 THEN 'large'
        WHEN total >= 25 THEN 'medium'
        ELSE 'small'
    END AS order_size
FROM orders;


-- ---------- TRANSACTIONS ----------
-- Syntax varies slightly by database.
-- START TRANSACTION;
-- UPDATE accounts SET balance = balance - 50 WHERE account_id = 1;
-- UPDATE accounts SET balance = balance + 50 WHERE account_id = 2;
-- COMMIT;
-- Use ROLLBACK instead of COMMIT if the transaction should be undone.


-- ---------- ALTER / INDEX ----------
-- ALTER TABLE users ADD COLUMN display_name VARCHAR(100);
-- CREATE INDEX idx_orders_user_id ON orders(user_id);


-- ---------- SAFETY REMINDERS ----------
-- Always preview the WHERE condition before UPDATE or DELETE.
-- Use parameterized queries in application code instead of concatenating user input.
-- Database-specific features (AUTO_INCREMENT, SERIAL, IDENTITY, LIMIT/TOP/FETCH, etc.) vary by dialect.
