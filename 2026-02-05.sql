SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM staff;
SELECT * FROM users;

SELECT * "Hello SQL!";
-- SELECT * "Hello SQL!";

SELECT 12+7;
SELECT "Hello SQL!" AS 인사;

SELECT 'Find' AS 'First', 'Insight' AS 'Second','withSQL' AS 'Third';

SELECT 28+891;
SELECT 37+172 AS 'Plus', 25*78 AS 'Times','I love SQL!' AS 'Result';

SELECT * FROM users;
SELECT * 
	FROM users
	LIMIT 3
	;
	
SELECT * FROM users;
SELECT * FROM users WHERE country = 'Korea';
SELECT * FROM users WHERE country != 'Korea';
SELECT * FROM users WHERE country = 'Korea' AND id = 10;
SELECT * FROM users WHERE created_at BETWEEN '2010-01-01' AND '2011-01-01';
SELECT * FROM users WHERE created_at >= '2010-12-01' AND created_at <= '2011-01-01';


SELECT * FROM users WHERE country = 'Korea' OR country = 'UK' OR country = 'USA';
SELECT * FROM users WHERE country IN ('Korea', 'UK', 'USA');

SELECT * FROM users WHERE country NOT IN ('Korea', 'UK', 'USA');
SELECT * FROM users WHERE country != 'Korea' AND country != 'UK' AND country != 'USA';

SELECT * FROM users WHERE country NOT LIKE 'S%';
SELECT * FROM users WHERE created_at IS NULL;
SELECT * FROM users WHERE created_at IS NOT NULL;

SELECT * FROM users WHERE country = 'Mexico';


SELECT 
    created_at AS 가입일시, 
    phone AS 연락처, 
    city AS "거주 도시", 
    country AS "거주 국가"
FROM users
WHERE country = 'Mexico';

SELECT * FROM products;
SELECT * FROM products WHERE id <= 20 AND price >= 30;
SELECT *,
	(price-discount_price) AS discount_amount 
	FROM products 
	WHERE id <= 20 AND price >= 30;

SELECT * FROM users;
SELECT 
	* FROM users 
	WHERE country 
	NOT IN ('Korea', 'Canada', 'Belgium');
		
SELECT * FROM products;
SELECT
	id AS 제품아이디,
	name AS 제품명,
	price AS 정상가격
FROM products WHERE name LIKE 'N%';

SELECT * FROM orders;
SELECT *
	FROM orders 
	WHERE order_date not BETWEEN '2015-07-01' AND '2015-10-31';
