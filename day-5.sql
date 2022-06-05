-- 형변환 convert
SELECT '10';
SELECT CONVERT ('10', INT);

SELECT '10' + '10';
SELECT CONVERT('10', INT) + CONVERT('10', INT);

SELECT CONVERT('10.1', FLOAT);
SELECT CONVERT(10.1, FLOAT);

SELECT 10;
SELECT CONVERT(10, CHAR);

-- 형변환cast
SELECT CAST('10' AS INT);

SELECT -1 > 'a2ega';


-- 문자열 합치기 concat
SELECT 'A' + 'B';
SELECT CONCAT('A1', '2B2');
SELECT CONCAT('A1', '2B2', '가나다');

-- IF
SELECT if(100>200, '100은 200보다 크다', '100은 200보다 작다');

USE `employees`;

-- employees 테이블 조회 gender가 M이면 남자 F면 여자

SELECT *, if(gender='M', '남자', '여자') FROM employees;
SELECT emp_no, first_name, last_name, if(gender='F', '여자', '남자') FROM employees;

-- 응용
SELECT 'M', 'F', 'A';

SELECT IF('A' = 'M', '남자', if('A' = 'F', '여자', '에이'));

-- 배고파요
-- 응용2

SELECT *, 
if(nm = '축구', 'football', if(nm = '배구', 'valleyball', 'basketball')) 'eng'
FROM t_hobby
ORDER BY i_hobby;

SELECT nm, if(nm = '농구', CONCAT(nm, 'basketball'), if(nm = '축구', CONCAT(nm, 'football'), CONCAT(nm, 'valleyball')))
FROM t_hobby;

SELECT CONCAT (nm,
			if(nm = '농구', 'basketball', if(nm = '배구','valleyball', 'football'))
			)
FROM t_hobby;


-- ifnull (Oracle : nvl, SQL-Server : isnull )
DELETE FROM membertbl
WHERE memberID > 10;

SELECT *, IFNULL(memberaddress, '주소없음')
FROM membertbl;

-- nullif
SELECT NULLIF('안녕', '안녕');
-- 같으면 null 아니면 앞에 거
SELECT NULLIF('dksud', 'dkssudd');


-- case 값 when 비교값 then ...
SELECT *,
CASE nm WHEN '농구' THEN 'basketball'
		  WHEN '축구' THEN 'football'
		  WHEN '배구' THEN 'valleyball'
	END 'eng'
FROM t_hobby;

-- case when 조건식 then ...
SELECT *,
CASE WHEN nm = '농구' THEN 'basketball'
	  WHEN nm = '배구' THEN 'valleyball'
	  WHEN nm = '축구' THEN 'football'
	  ELSE '없음'
END
FROM t_hobby
ORDER BY i_hobby;

-- 아스키코드
SELECT ASCII('A'), CHAR(65);

-- 문자열 합치기 concat concat_ws
SELECT CONCAT('A', '_', 'B', '_', 'C');
SELECT CONCAT_WS(',', 'A', 'B', 'C');

-- format 천단위에 콤마, 실수 몇 자리까지 나타낼지 선택
SELECT FORMAT(11112222.624134266814, 0);

SELECT FORMAT(FLOOR(11112222.624134266814), 0);

SELECT FLOOR(11.5), CEIL(11.5), ROUND(11.5);
SELECT FLOOR(11.1), CEIL(11.1), ROUND(11.1);

SELECT FORMAT(CONVERT(1/3, FLOAT), 12), FORMAT(CONVERT(1/3, DOUBLE), 12);

-- format(1/3, 10)은 0.3333333300으로 나오는데
-- double(기본값), float 은 근사치 값을 저장한다


-- insert
SELECT INSERT('asdfdseg', 3, 4, '@!@!@!@') , INSERT('asdfdseg', 3, 0, '@@@@');

-- upper, Lower
SELECT 'aBc', 'AbC', 'aBc' = 'AbC', 
UPPER('aBc'), UPPER('AbC')
, UPPER('aBc') = UPPER('AbC');


SELECT '   a bc   ', TRIM('   a bc  ');
SELECT TRIM(BOTH 'z' FROM 'zzzzddfaswezzzzzzz');
SELECT TRIM(LEADING 'z' FROM 'zzzzddfaswezzzzzzz');
SELECT TRIM(TRAILING 'z' FROM 'zzzzddfaswezzzzzzz');

USE test;
-- date_format
SELECT *, DATE_FORMAT(created_at, '%Y/%m/%d %r') FROM t_hobby_2;
-- %m... %d... ...대문자 소문자 표기 방식 다름
SELECT STR_TO_DATE(created_at, '%l:%i %p' ) FROM t_hobby_2;

/*
WAS (Web Application Sever) .class > 실행
> html

Apache Server(웹서버) html
Php
MySQL, MariaDB
*/