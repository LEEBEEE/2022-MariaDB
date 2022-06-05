-- dept_emp 테이블에서 dept_no 종류가 몇개가 있는지?
SELECT DISTINCT dept_no FROM dept_emp;

SELECT DISTINCT title FROM titles;

SELECT * FROM employees
LIMIT 30;

SELECT * FROM employees
LIMIT 0, 10;

SELECT * FROM employees
LIMIT 20, 10;

/* 가장 많은 연봉을 받은 금액 3개만 나오게 */

SELECT * FROM salaries
ORDER BY salary DESC 
LIMIT 3;

-- 5~10위만 나오도록
SELECT * FROM salaries
ORDER BY salary DESC 
LIMIT 4,6;

-- 테이블 컬럼, 데이터 타입, 레코드  복사
CREATE TABLE departments_temp as
SELECT * FROM departments;

-- 테이블 스키마 복사 (레코드x)
CREATE TABLE departments_2
LIKE departments;
-- 레코드도 이렇게 옮김
INSERT INTO departments_2
SELECT * FROM departments;

-- 그룹함수 min, max, sum, avg, count 
SELECT MIN(salary), MAX(salary), SUM(salary), AVG(salary), COUNT(emp_no)
, SUM(salary) / COUNT(*)
FROM salaries;


SELECT emp_no
, MIN(salary), MAX(salary), SUM(salary), AVG(salary), COUNT(*)
FROM salaries
GROUP BY emp_no;

-- 부서별 사원 수, 부서별 사원수가 20,000명 이상인 부서만 나오도록
SELECT dept_no , COUNT(*)
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(*) >= 20000
ORDER BY COUNT(*) DESC;

SELECT dept_no, COUNT(*)
FROM dept_emp
GROUP BY dept_no
WITH ROLLUP;

-- 가장 적은 salary를 받은 사람의 이름이 나오도록
SELECT emp_no
FROM salaries
ORDER BY salary
LIMIT 1;

SELECT first_name, last_name FROM employees
WHERE emp_no = (
SELECT emp_no
FROM salaries
ORDER BY salary
LIMIT 1
);


-- Best
SELECT * FROM employees
WHERE emp_no = (
	SELECT emp_no FROM employees.salaries ORDER BY salary LIMIT 1 );

SELECT * FROM employees
WHERE emp_no IN 
(
	SELECT emp_no FROM salaries
	WHERE salary = (SELECT MIN(salary) FROM salaries)
);



USE `test`;

CREATE TABLE t_hobby (
	i_hobby INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (i_hobby)
);

INSERT INTO t_hobby (nm)
VALUES ('농구');

INSERT INTO t_hobby (nm)
VALUES ('축구');

INSERT INTO t_hobby (nm)
VALUES ('배구');

SELECT * FROM t_hobby;


CREATE TABLE t_hobby_2
(
	hobby_id INT UNSIGNED PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

INSERT INTO t_hobby_2
(hobby_id, NAME)
VALUES
(1, '핸드볼');

INSERT INTO t_hobby_2
(hobby_id, NAME, created_at)
VALUES
(2, '등산', '2022-02-10');

INSERT INTO t_hobby_2
(hobby_id, NAME, created_at)
VALUES
(3, '독서', '2022-02-10 12:12:13');

SELECT * FROM t_hobby_2;

INSERT INTO t_hobby_2
(hobby_id, NAME)
SELECT i_hobby+3, nm FROM t_hobby;


-- 각 직업별 평균 급여
-- join 사용

SELECT title, AVG(salary) AS avg_salary
	FROM titles A
 INNER JOIN salaries B
  	ON A.emp_no = B.emp_no
 GROUP BY A.title;
 

-- emp_no: 10001의 모든 salary를 1000씩 올리고 싶다.
UPDATE salaries
SET salary = salary + 1000
WHERE emp_no = 10001;

SELECT * FROM salaries
WHERE emp_no = 10001;


-- insert ignore
SELECT * FROM t_hobby_2;

INSERT IGNORE INTO t_hobby_2 (hobby_id, NAME) VALUES (6, '탁구');
INSERT IGNORE INTO t_hobby_2 (hobby_id, NAME) VALUES (7, '스키');

INSERT INTO t_hobby_2 (hobby_id, NAME) VALUES (7, '탁구')
ON DUPLICATE KEY UPDATE NAME = '수영';

DROP TABLE t_board;

CREATE TABLE t_board (
	i_board INT UNSIGNED PRIMARY KEY,
	title VARCHAR(20) UNIQUE NOT NULL,
	hits INT UNSIGNED DEFAULT 0
);

-- 조회수
SELECT * FROM t_board;
INSERT INTO t_board (i_board, title, hits) VALUES (2, '안녕', 0)
ON DUPLICATE KEY UPDATE hits = hits + 1;


WITH dept_emp_d001(emp_no, from_date, to_date)
AS(
SELECT emp_no, from_date, to_date FROM dept_emp
WHERE dept_no = 'd001'
)
SELECT A. * FROM dept_emp_d001 AS A;


SELECT A. * FROM
(
	SELECT emp_no, from_date, to_date
	FROM dept_emp
	WHERE dept_no = 'd001'
) A ;


DROP TABLE t_order;
DROP TABLE t_customer;
SELECT * FROM t_order;

CREATE TABLE T_ORDER (
	o_no INT UNSIGNED PRIMARY KEY,
	cus_no INT UNSIGNED,
	o_date DATE DEFAULT CURRENT_TIMESTAMP,
	o_price INT DEFAULT 0,
	CONSTRAINT jjjjj FOREIGN KEY (`cus_no`) REFERENCES `t_customer`(`cus_no`)
);

CREATE TABLE T_CUSTOMER (
	cus_no INT UNSIGNED PRIMARY KEY,
	nm CHAR(10) NOT NULL
);


INSERT INTO t_customer
(cus_no, nm)
VALUES
(3, '홍길동'),
(5, '이순신');

SELECT * FROM t_customer;
SELECT * FROM t_order;

INSERT INTO t_order
(o_no, cus_no, o_price)
VALUES
(1, 3, 55000),
(2, 5, 70000),
(3, 3, 60000);

UPDATE t_customer
SET nm = '장보고'
WHERE cus_no = 5;

DELETE FROM t_order
WHERE o_no = 2;

SELECT o_no, o_price 
FROM t_order
WHERE cus_no = 3;