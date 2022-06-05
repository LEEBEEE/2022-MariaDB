CREATE TABLE t_member_hobby (
	user_no CHAR(8) NOT NULL,
	hobby_no INT UNSIGNED AUTO_INCREMENT,
	PRIMARY KEY (user_no, hobby_no),
	CONSTRAINT hobby FOREIGN KEY (user_no) REFERENCES membertbl(memberID),
	FOREIGN KEY (hobby_no) REFERENCES t_hobby(i_hobby)
);
DROP TABLE t_member_hobby;


CREATE TABLE t_member_hobby (
	memberID CHAR(8) NOT NULL,
	hobby_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (memberID, hobby_id),
	FOREIGN KEY (memberID) REFERENCES membertbl(memberID),
	FOREIGN KEY (hobby_id) REFERENCES t_hobby_2(hobby_id)
);

SELECT * FROM t_member_hobby;

SELECT * FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 't_member_hobby';


INSERT INTO t_member_hobby (memberID, hobby_id) VALUES ('1', 1);
INSERT INTO t_member_hobby (memberID, hobby_id) VALUES ('1', 2);
INSERT INTO t_member_hobby (memberID, hobby_id) VALUES ('5', 3),('5', 6),('5', 7);
INSERT INTO t_member_hobby (memberID, hobby_id) VALUES ('7', 5);


SELECT B. membername, B. memberAddress, C. name 
FROM t_member_hobby A
INNER JOIN membertbl B
ON A.memberID = B.memberID
INNER JOIN t_hobby_2 C
ON A.hobby_id = C.hobby_id;


-- 사원번호, 사원명, 부서이름, 직책

SELECT A. emp_no, first_name, last_name, D.dept_name, B. title
  FROM employees A
 INNER JOIN  titles B
    ON A.emp_no = B.emp_no
 INNER JOIN dept_emp C
    ON A.emp_no = C.emp_no
 INNER JOIN departments D
    ON C.dept_no = D.dept_no;
    
    
-- 남녀 사원의 평균 연봉

SELECT B.gender, AVG(A.salary) AS avg_salary
FROM salaries A
INNER JOIN employees B
ON A.emp_no = B.emp_no
GROUP BY gender;


-- 부서별 가장 높은 개인 평균 연봉 값
-- 개인 연봉 평균 > 부서별 > 연봉이 가장 높은

SELECT Z.dept_no, T.dept_name, MAX(Z.avg_salary) AS max_salary
FROM (
SELECT B.dept_no, AVG(A.salary) AS avg_salary
FROM salaries A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
GROUP BY A.emp_no ) Z
INNER JOIN departments T
ON Z.dept_no = T.dept_no
GROUP BY Z.dept_no;


-- 부서별 연봉 평균값, max값, min값

SELECT B.dept_no, C.dept_name, AVG(A.salary), MAX(A.salary), MIN(A.salary)
FROM salaries A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no
GROUP BY B.dept_no; -- 여기에 원래 C.dept_name 있어야 하는데(안 묶여있는 거 셀렉트 하면 에러나서) mysql은 생략해도 가능함 oracle은 안됨


-- 직무별 연봉 평균값

SELECT B.title, AVG(A.salary)
FROM salaries A
INNER JOIN titles B
ON A.emp_no = B.emp_no
GROUP BY title;