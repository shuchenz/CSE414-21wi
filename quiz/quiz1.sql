DROP TABLE Lending
DROP TABLE Books
DROP TABLE Members

INSERT INTO Books VALUES
(123, 'hello', 'ben', 'fun', 'alex'),
(245, 'yolo', 'rick', 'fun', 'bill'),
(345, 'force', 'tim', 'play', 'rich'),
(456, 'try', 'megan', 'play', 'joe'),
(567, 'work', 'kelen', 'kill', 'nigel'),
(678,'Leaves of Grass', 'miller', 'kill', 'slid'),
(789, 'Harmonium', 'kim', 'chill', 'roger'),
(891, 'momo', 'park', 'chill', 'rach');

INSERT INTO Members VALUES
(1, 'kim'),
(2, 'ben'),
(3, 'alex'),
(4, 'nigel'),
(5, 'kim'),
(6, 'diva'),
(7, 'alex');

INSERT INTO Lending VALUES
(123, 1, '2020-05-03', '2020-06-03'),
(123, 1, '2020-06-05', null),
(123, 1, '2020-05-04', '2020-06-09'),
(245, 2, '2020-03-02', null),
(678, 4, '2020-04-05', null),
(789, 4, '2020-05-09', '2020-08-09'),
(678, 5, '2020-07-02', null),
(789, 5, '2020-08-09', null),
(891, 7, '2020-07-09', null),
(891, 7, '2020-08-05', '2020-09-05'),
(891, 3, '2020-07-09', null),
(891, 3, '2020-08-05', '2020-09-05'),
(891, 1, '2020-06-05', null),
(891, 1, '2020-05-04', '2020-06-09')
;

SELECT * FROM Lending

/* 1.1 */
CREATE TABLE Books (
    isbn INT PRIMARY KEY,
    title varchar(100),
    author varchar(100),
    genre varchar(100),
    publisher varchar(100)
);

CREATE TABLE Members (
    id INT PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE Lending (
    isbn INT FOREIGN KEY REFERENCES Books(isbn),
    id INT FOREIGN KEY REFERENCES Members(id),
    checkout DATETIME,
    returned DATETIME,
    PRIMARY KEY(isbn, id, checkout)
);

/* 1.2 */
SELECT M.name, B.title
FROM Members AS M, Books AS B, Lending AS L
WHERE M.id = L.id
AND B.isbn = L.isbn
AND L.returned IS NULL
ORDER BY M.name ASC, B.title ASC

/* 1.3 */
SELECT B.title, M.name, count(*)
FROM Members AS M, Books AS B, Lending AS L
WHERE M.id = L.id
AND B.isbn = L.isbn
GROUP BY B.title, M.name, M.id 
HAVING count(*) > 1;

/* 1.4 */
SELECT B.genre, ISNULL(COUNT(L.isbn), 0)
FROM Books AS B
LEFT JOIN Lending AS L
ON B.isbn = L.isbn
GROUP BY B.genre
ORDER BY COUNT(L.isbn) DESC

/* 1.5 */
SELECT M.id, M.name 
FROM Members AS M, Lending AS L, Books AS B 
WHERE M.id = L.id
AND B.isbn = L.isbn
AND B.title = 'Leaves of Grass'
AND M.id IN (
    SELECT M.id
    FROM Members AS M, Lending AS L, Books AS B
    WHERE M.id = L.id
    AND B.isbn = L.isbn
    AND B.title = 'Harmonium'
)

/* T F T F */