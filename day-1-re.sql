/*
A < B : A는 B 미만
A <= : A는 B 이하
A > B : A는 B 초과
A >= B : A는 B 이상
*/


SELECT * FROM employees
WHERE emp_no >= 10010 AND emp_no <= 10020 AND gender = 'F';

SELECT * FROM employees
WHERE emp_no between 10010 AND 10020 ;


SELECT * FROM test.membertbl
WHERE memberid btween '1' AND '10'
AND memberaddress = '서울시';

SELECT *, CONVERT(memberid, INT), CAST(memberid AS INT)
FROM test.membertbl;

SELECT '1' + '11' AS num;
SELECT CONCAT('1', ' ', '11', '안녕');

SELECT CONCAT('1', 	CONCAT(' ', 	CONCAT('11', '안녕')	)	);
-- 안쪽에서 바깥쪽으로 순서대로 처리 

-- d001 d003 d005

SELECT * FROM departments
WHERE dept_no = 'd001' 
or dept_no = 'd003' 
or dept_no = 'd005';

SELECT * FROM departments
WHERE dept_no IN ('d001', 'd003', 'd005');

SELECT * FROM employees
WHERE emp_no % 2 = 1 ;

SELECT * FROM employees
WHERE emp_no % 2 = 0 ;

SELECT * FROM departments
WHERE CONVERT(SUBSTR(dept_no, 2), INT) % 2 = 0;

SELECT @rownum:=@rownum+1, A. *
FROM employees A
WHERE (@rownum:=0)=0;

SET @rownum:=0;
SELECT (@rownum:=@rownum+1) AS my_no, A. *
FROM employees A;