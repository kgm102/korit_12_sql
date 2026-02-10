SELECT * FROM users ORDER BY id DESC;
SELECT * FROM users ORDER BY created_at DESC;
SELECT * FROM users ORDER BY city DESC;
SELECT * FROM users ORDER BY 1 DESC;

SELECT username, phone, city, country, id
FROM users ORDER BY 1 ASC;

SELECT city, id
FROM users 
ORDER BY city DESC, id ASC;

SELECT * FROM products ORDER BY price DESC;
SELECT * FROM orders ORDER BY order_date DESC;
SELECT * FROM orderdetails ORDER BY product_id DESC, quantity ASC;

SELECT COUNT(*) FROM users;
SELECT COUNT(country) FROM users;

SELECT COUNT(DISTINCT country) AS countries FROM users;
SELECT DISTINCT country AS countries FROM users;

SELECT * FROM products;
SELECT MIN(price) FROM products;
SELECT MAX(discount_price) FROM products;
SELECT ROUND(SUM(price),2) FROM products;
SELECT ROUND(AVG(price),2) AS avgPrice
FROM products;

SELECT SUBSTR(created_at,1, 10) from users;

SELECT 
	SUBSTR(created_at, 1, 10) AS day, 
	SUBSTR(created_at, 1, 7) AS month, 
	created_at from users;

SELECT LENGTH(username) AS len FROM users ORDER BY username ASC;

SELECT SUM(price) AS 합계
	FROM products;

SELECT round(AVG(price),2) AS 평균
	FROM products
	WHERE id <= 30;

SELECT * FROM users;
	SELECT COUNT(DISTINCT id) AS 유저수
	FROM users
	WHERE created_at BETWEEN '2010-10' AND '2010-12';
	
SELECT * FROM users;
	SELECT COUNT(DISTINCT id) AS 유저수
	FROM users
	WHERE substr(created_at,1 ,7) BETWEEN '2010-10' AND '2010-12';

SELECT COUNT(DISTINCT id) AS 유저수  
	FROM users
	WHERE LENGTH(username) <= 17;
	
SELECT COUNT(id) AS Korea FROM users WHERE country = 'Korea';
SELECT COUNT(id) AS USA FROM users WHERE country = 'USA';

SELECT COUNT(id) AS USA FROM users WHERE country = 'USA' OR country = 'Korea';
SELECT COUNT(id) AS USA FROM users WHERE country IN('Korea','USA');

SELECT country, COUNT(DISTINCT id) AS '국가별유저수'
FROM users
GROUP BY country;

SELECT * FROM users;
SELECT COUNT(id) AS Korea  
FROM users WHERE country = 'Korea' AND is_marketing_agree = 1;

SELECT COUNT(id) AS UK  
FROM users WHERE country = 'UK' AND is_marketing_agree = 1;

SELECT * FROM users;
SELECT * FROM users WHERE country = 'Korea';

SELECT country, COUNT(is_marketing_agree = 1) AS 국가별_마케팅_수신_동의 , COUNT(is_marketing_agree = 0)
FROM users
-- WHERE is_marketing_agree = 1
GROUP BY country;

SELECT 
    country AS 국가,
    COUNT(CASE WHEN is_marketing_agree = 1 THEN 1 END) AS 동의_인원,
    COUNT(CASE WHEN is_marketing_agree = 0 THEN 1 END) AS 미동의_인원
FROM users
GROUP BY country;

SELECT country, is_marketing_agree AS 동의여부, COUNT(DISTINCT id) AS 동의사용자
  FROM users
  GROUP BY country, is_marketing_agree
  ORDER BY country, 동의사용자 DESC
  ;

