USE `employees`;

SELECT * FROM departments;
/*
departments 테이블에 값을 입력해주세요.
dept_no : d010
dept_name : 'Business'
*/

INSERT INTO departments
(dept_no, dept_naem)
VALUES
('d010', 'Business');

INSERT INTO departments
(dept_no, dept_name)
VALUES
('d011', 'Business1');

INSERT INTO departments
(dept_no, dept_name)
VALUES
('d012', 'Webservice');


SELECT * FROM employees;

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
(500000, '1999-10-10', 'Gildong', 'Hong', 'M', '2022-03-29');

SELECT * FROM employees
WHERE emp_no = 500000;


-- employees에서 여자면서 lastname에 ch가 포함된 사람 select
SELECT * FROM employees
WHERE last_name LIKE '%ch%' AND gender = 'F';


/* 함수 사용 lefh right mid  // like 사용 시에는 언더바로 자리수 표시  */
SELECT * FROM employees
WHERE LEFT(birth_date, 4) = '1952';

SELECT * FROM employees
WHERE birth_date LIKE '____-07-__';

SELECT * FROM employees
WHERE LEFT(birth_date, 4) >= '1960';

SELECT birth_date
	, CAST(값 AS 변환하고 싶은 타입)
	, CAST(LEFT(birth_date, 4) AS INT)
	, LEFT(birth_date, 4) AS l4
	, RIGHT(birth_date, 2) AS r2
	, MID(birth_date, 6, 2) AS m2
FROM employees;

-- emp_no가 500000인 사원을 여성으로 바꾸고 이름을 jindong 고용일을 20210329로 변경
UPDATE employees
SET first_name = 'Jindong'
, gender = 'F'
, hire_date = '2021-03-29'
WHERE emp_no = 500000;

SELECT * FROM employees
WHERE emp_no = 500000;

--고용일자가 2020년 이후인 사람들 삭제
DELETE FROM employees
WHERE hire_date LIKE '202_-__-__';

DELETE FROM employees
WHERE LEFT(hire_date, 4) >= '2020';

SELECT emp_no AS my_no FROM employees
WHERE LEFT(hire_date, 4) >= '2020';

SELECT * FROM test.membertbl
WHERE memberaddress != '서울시'
OR memberaddress IS NULL ;

SELECT * FROM test.membertbl
WHERE memberaddress <> '서울시';

-- != 이랑 <>이랑 둘다 =/= 이건데 <>는 MySQL에서만 먹히니까  웬만하면 !=로 쓰기


/* emp_no가 499613인 사람과 birth_date가 똑같은 사람 찾기 */
SELECT * FROM employees
WHERE birth_date = '1953-06-09';

SELECT birth_date FROM employees
WHERE emp_no = 499613 ; 

SELECT * FROM employees
WHERE birth_date = (SELECT birth_date FROM employees WHERE emp_no = 499613 );

/* 
emp_no가 499619인 사람과 같은 성별을 가지고 있는 사람만
+ 499619는 안 나오게
 */
SELECT * FROM employees
WHERE gender = (SELECT gender FROM employees WHERE emp_no = 499619)
AND emp_no != 499619;

/* = 과 서브쿼리를 사용할 때는 서브쿼리가 스칼라값이어야 한다. 값이 하나여야 한단 뜻  */
-- some과 any는 동일
-- 786,848 결과물

SELECT * FROM salaries
WHERE salary = ANY (SELECT salary FROM salaries WHERE emp_no = 10010);

SELECT * FROM salaries
WHERE salary IN (SELECT salary FROM salaries WHERE emp_no = 10010);

-- 480,870 결과물
SELECT * FROM salaries
WHERE salary >= ALL (SELECT salary FROM salaries WHERE emp_no = 10010);

-- 오름차순 (위에서 아래로 값이 커진다.) ASC
-- 내림차순 (위에서 아래로 값이 작아진다.) DESC
;

SELECT * FROM salaries
WHERE emp_no IN (499988, 499987, 499986)
ORDER BY emp_no DESC, salary DESC;


SELECT * FROM employees
ORDER BY birth_date DESC, gender DESC;