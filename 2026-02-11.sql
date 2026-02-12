SELECT u.id, u.username, u.phone, o.id, s.product_id
	FROM users u
	LEFT JOIN orders o ON u.id = o.user_id
	INNER JOIN orderdetails s ON u.id = s.product_id;
	
SELECT u.id, u.username, u.phone, o.id, od.product_id
	FROM users u LEFT JOIN orders o ON u.id = o.user_id
	INNER JOIN orderdetails od ON o.id = od.order_id;
	
SELECT *
	FROM users u RIGHT JOIN orders o
	ON u.id = o.user_id
	ORDER BY o.id
	; 
	
SELECT *
	FROM users u JOIN orders o
	ON u.id = o.user_id
	ORDER BY o.id
	; 
	
(SELECT * FROM users) UNION (SELECT * FROM users);

(SELECT id, phone, city, country
	FROM users u
	WHERE country = 'Korea')
UNION all
(SELECT id, phone, city, country
	FROM users u
	WHERE country = 'Mexico')
	ORDER BY country ASC;
	
SELECT * 
  FROM orders 
  WHERE order_date >='2015-10-01' AND order_date < '2015-11-01' 
  UNION ALL 
  SELECT * FROM orders 
  WHERE order_date >= '2015-12-01' AND order_date < '2016-01-01' 
  ORDER BY order_date DESC;
	
SELECT id AS 아이디, phone AS 전화번호, country AS 거주국가, city AS 거주도시, is_marketing_agree AS 동의여부
	FROM users
	WHERE is_marketing_agree = 1 AND country = 'USA'
	UNION all
SELECT id AS 아이디, phone AS 전화번호, country AS 거주국가, city AS 거주도시, is_marketing_agree AS 동의여부
	FROM users
	WHERE is_marketing_agree = 0 AND country = 'France'
	ORDER BY 거주국가;
	
SELECT * FROM orderdetails;
SELECT * FROM products;

SELECT *
	FROM orderdetails od
	left JOIN products p ON od.product_id = p.id
	union
SELECT *
	FROM orderdetails od
	right JOIN products p ON od.product_id = p.id;
	
SELECT city, COUNT(DISTINCT id) AS 회원수
	FROM users
	GROUP BY city
	HAVING 회원수 >= 3
	ORDER BY 회원수 DESC;
	
SELECT * 
	FROM(SELECT city, COUNT(DISTINCT id) AS 도시별회원수
	FROM users
	GROUP BY city) AS A
	WHERE 도시별회원수 >= 3
	ORDER BY 도시별회원수 DESC;
	
SELECT *
	FROM orders
	WHERE staff_id IN(SELECT id FROM staff WHERE last_name IN('Kyle', 'Scott')
	);
	
SELECT *
	FROM products
	ORDER BY discount_price desc
	LIMIT 1;
	
SELECT *
	FROM products
	WHERE discount_price = (SELECT MAX(discount_price) FROM products);
	
SELECT * FROM orderdetails;
SELECT * FROM orders;	
SELECT *
	FROM orders o
	JOIN orderdetails od ON o.id = od.order_id
	WHERE substr(order_date, 1, 7) = '2015-07' AND quantity >= 50;
	
SELECT * 
	FROM (
		SELECT * FROM orders 
		WHERE order_date > '2015-07-01' 
		AND order_date < '2015-08-01') o
		join
		(SELECT * FROM orderdetails WHERE quantity >= 50) od
		ON  o.id = od.order_id;
		
SELECT * 
	FROM (
		SELECT * FROM orders 
		WHERE substr(order_date, 1, 7) = '2015-07' ) o
		join
		(SELECT * FROM orderdetails WHERE quantity >= 50) od
		ON  o.id = od.order_id;
-- 1번
SELECT * FROM products;
SELECT NAME, ROUND((price-discount_price) / price * 100,3) AS ratioPerMaxPrc
	FROM products
	ORDER BY ratioPerMaxPrc DESC;
	
SELECT *, ROUND(discount_price / (SELECT MAX(discount_price) 
	FROM products), 3) AS ratioPerMaxPrc FROM products;
-- 서브쿼리는 우선 없이 해본다음 해본다
SELECT * FROM users;
SELECT * FROM staff;

-- 2번 
SELECT u.id AS 회원아이디 , u.phone AS 연락처 
,s.id AS 직원아이디, s.last_name AS 성 , s.first_name AS 이름, s.birth_date
	FROM users u
	JOIN staff s ON u.id = s.user_id
	WHERE (country = 'Korea' OR country = 'Italy') and s.birth_date < '1990-01-01';
	
SELECT u.회원아이디, u.연락처, s.직원아이디, s.성, s.이름
FROM (
    SELECT id AS 회원아이디, phone AS 연락처
    FROM users
    WHERE country IN ('Korea', 'Italy')
) u
JOIN (
    SELECT id AS 직원아이디, last_name AS 성, first_name AS 이름, user_id
    FROM staff
    WHERE birth_date < '1990-01-01'
) s ON u.회원아이디 = s.user_id;
-- 3번
	
SELECT country, COUNT(id) AS 국가별_회원_수
	FROM users
	GROUP BY country
	HAVING COUNT(id) >= 5
	ORDER BY 국가별_회원_수 DESC;
	
SELECT *
FROM (
    SELECT country, COUNT(id) AS 국가별_회원_수
    FROM users
    GROUP BY country
) AS t 
WHERE t.국가별_회원_수 >= 5
ORDER BY t.국가별_회원_수 DESC;

-- 4번 이건 서브쿼리씀
SELECT *
	FROM products
	WHERE price = (SELECT min(price) FROM products);

-- 5번 
SELECT *
	FROM orders o
	JOIN users u ON u.id = o.user_id
	WHERE  order_date BETWEEN '2016-01-01' AND '2016-12-31';
	
SELECT *
	FROM (
    SELECT * FROM orders 
    WHERE order_date BETWEEN '2016-01-01' AND '2016-12-31'
	) o
	JOIN users u ON u.id = o.user_id;
	