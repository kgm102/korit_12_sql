SELECT * FROM users;

SELECT country, COUNT(distinct id) AS 국가별_회원수 
	FROM users 
	WHERE country IN ('Korea', 'Spain') 
	GROUP BY country;
	
SELECT country, count(distinct id) AS 한국동의자수
	FROM users
	WHERE country IN ('Korea', 'USA') AND is_marketing_agree = 1
	GROUP BY country;
	
SELECT country AS 국가, is_marketing_agree AS 마케팅_수신_동의, COUNT(DISTINCT id) AS 회원수
	FROM users
	GROUP BY country, 마케팅_수신_동의
	ORDER BY country, 회원수 desc
	;
	
SELECT country AS 국가, city AS 도시, COUNT(DISTINCT id) AS 회원수
	from users
	GROUP BY country, city
	ORDER BY country, 회원수 DESC, city;
	
SELECT substr(created_at,1 ,7) AS 월별, COUNT(DISTINCT id) AS 회원수
	FROM users
	GROUP BY 월별
	ORDER BY 월별 desc;
	
SELECT * FROM orderdetails;
SELECT order_id AS 주문아이디, SUM(quantity) AS 주문한갯수 
	FROM orderdetails
	GROUP BY order_id
	ORDER BY 주문한갯수 desc;

SELECT * FROM orders;
SELECT staff_id, user_id, COUNT(*) AS 주문건수
	FROM orders
	GROUP BY staff_id, user_id
	ORDER BY staff_id, 주문건수 desc;
	
SELECT substr(order_date, 1, 7) AS 월별, COUNT(DISTINCT user_id) AS 월별주문회원수
	FROM orders
	GROUP BY 월별
	ORDER BY 월별 desc;

SELECT * FROM users;
SELECT country AS 국가 , COUNT(DISTINCT id) AS 국가별회원수
	FROM users
	WHERE country IN ('Korea','France','USA')
	GROUP BY country;
	
SELECT country AS 국가 , COUNT(DISTINCT id) AS 국가별회원수
	FROM users 
	GROUP BY country
	HAVING COUNT(DISTINCT id) >= 8
	ORDER BY 국가별회원수 DESC;

SELECT * FROM orders;
SELECT staff_id AS 회원아이디 , COUNT(DISTINCT id) AS 주문건수, COUNT(distinct user_id) AS 주문회원수
	FROM orders
	GROUP BY staff_id
	HAVING 주문건수 > 9 AND 주문회원수 < 41
	ORDER BY 주문건수 DESC; -- 이거 틀린거임
	
SELECT user_id AS 회원아이디, COUNT(DISTINCT id) AS 회원별주문건수
	FROM orders
	GROUP BY user_id
	HAVING COUNT(DISTINCT id) >= 7
	ORDER BY 회원아이디, 회원별주문건수 DESC;
	
SELECT * FROM users;	

SELECT country, COUNT(DISTINCT city) AS 도시수, COUNT(DISTINCT id) as 회원수
	FROM users
	GROUP BY country
	HAVING COUNT(DISTINCT city) >= 5 AND COUNT(DISTINCT id) >= 3
	ORDER BY 도시수 DESC, 회원수 DESC;
	
SELECT country, COUNT(DISTINCT id) AS 회원수
	FROM users
	WHERE country IN('USA','Brazil', 'Korea', 'Argentina', 'Mexico')
	GROUP BY country
	HAVING 회원수 >= 5
	ORDER BY 회원수 DESC;
SELECT * FROM users;
SELECT * FROM orders;

SELECT 
	u.id, u.created_at, u.username, 
	u.phone, u.city, u.country, u.is_marketing_agree, 
	u.city, o.staff_id, o.order_date
	FROM users u
	inner JOIN orders o ON u.id = o.user_id;
	
SELECT *
	FROM users u LEFT JOIN orders o
	ON u.id = o.user_id
	WHERE u.id = 7;
	
SELECT * FROM orderdetails;
SELECT * FROM users;
SELECT * FROM orders;
SELECT *
	FROM users u
	LEFT JOIN orders o ON u.id = o.user_id
	WHERE o.id IS NULL;
	 
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
	 
	