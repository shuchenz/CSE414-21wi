--- 1
CREATE TABLE Sales(
    name VARCHAR(24), 
    discount VARCHAR(12), 
    month VARCHAR(12), 
    price INT
);



--- 2
/* name → discount */
SELECT COUNT(*) 
FROM Sales AS s1, Sales AS s2
WHERE s1.name = s2.name
AND s1.discount != s2.discount;
/* count is 3286, so this is not a FD */


/* name → price */
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.name = s2.name
AND s1.price != s2.price;
/* count is 0, so this is a FD */

/* Then we could conclude that (any set that contains name) → price is a FD */
/* For example, name, month → price is a FD */


/* month → discount */
SELECT COUNT(*)
FROM Sales AS s1, Sales AS s2
WHERE s1.month = s2.month
AND s1.discount != s2.discount;
/* count is 0, so this is a FD*/

/* Then we could conclude that (any set that contains month) → discount is a FD */
/* For example, name, month → discount is a FD */

/* Also we could also conclude name, month → price, discount */


--- 3
CREATE TABLE S1 (
    name VARCHAR(24) PRIMARY KEY,
    price INT(10)
);

CREATE TABLE S2 (
    month VARCHAR(12) PRIMARY KEY,
    discount VARCHAR(12)
);

CREATE TABLE S3 (
    name VARCHAR(24) REFERENCES S1(name),
    month VARCHAR(12) REFERENCES S2(month),
    PRIMARY KEY(name, month)
);



--- 4
INSERT INTO S1 SELECT DISTINCT name, price
    FROM Sales;

INSERT INTO S2 SELECT DISTINCT month, discount
    FROM Sales;

INSERT INTO S3 SELECT name, month
    FROM Sales;

SELECT COUNT(*) FROM S1;    /* 36 */
SELECT COUNT(*) FROM S2;    /* 12 */
SELECT COUNT(*) FROM S3;    /* 426 */
