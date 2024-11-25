-- 1
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 2
INSERT INTO categories (category_name) VALUES
('Elektronika'),
('Kiyim-kechak'),
('Kitoblar'),
('Mebel'),
('O‘yinchoqlar');

-- 3
INSERT INTO products (product_name, category_id) VALUES
('Noutbuk', 1),
('Telefon', 1),
('Planshet', 1),
('Futbolka', 2),
('Shim', 2),
('Stol', 4),
('Stul', 4),
('Ruchka', NULL),
('Daftar', NULL),
('Kalit', NULL),
('Qo‘g‘irchoq', NULL),
('Mashina o‘yinchoq', NULL),
('Roman', 3),
('Jurnal', 3),
('Kitob javoni', NULL);

-- 4

-- 4.1
SELECT c.category_name, p.product_name
FROM categories c
JOIN products p ON c.category_id = p.category_id;

-- 4.2
SELECT c.category_name, p.product_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;

-- 4.3
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;

-- 4.4
SELECT product_name
FROM products
WHERE category_id IS NULL;

-- 4.5
SELECT category_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

-- 4.6
SELECT * FROM categories;
SELECT * FROM products;

-- 4.7
SELECT c.category_name, p.product_name
FROM categories c
FULL OUTER JOIN products p ON c.category_id = p.category_id
WHERE c.category_id IS NULL OR p.product_id IS NULL;

-- 4.8
SELECT c.category_name, p.product_name
FROM categories c
CROSS JOIN products p;

-- 4.9
SELECT *
FROM categories
NATURAL JOIN products;

-- 5
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id INT
);

INSERT INTO employees (name, manager_id) VALUES
('Ali', NULL),
('Vali', 1),
('Guli', 1),
('Sardor', 2),
('Nodira', 3);

SELECT e1.name AS Employee, e2.name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- 6
CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_name VARCHAR(255) NOT NULL
);

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL
);

CREATE TABLE actor_movie (
    actor_id INT,
    movie_id INT,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO actors (actor_name) VALUES
('Ali'),
('Vali'),
('Guli'),
('Sardor');

INSERT INTO movies (movie_name) VALUES
('Film 1'),
('Film 2'),
('Film 3');

INSERT INTO actor_movie (actor_id, movie_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);

SELECT a.actor_name, m.movie_name
FROM actors a
JOIN actor_movie am ON a.actor_id = am.actor_id
JOIN movies m ON am.movie_id = m.movie_id;
