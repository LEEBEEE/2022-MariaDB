-- DCL (데이터 제어어) (유저만들고 유저 권한주기)

-- DDL (데이터 정의어) create drop alter truncate
CREATE DATABASE test;
DROP DATABASE test;

CREATE TABLE memberTBL (
	memberID CHAR(8) NOT NULL PRIMARY KEY,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20) NULL
);
-- 주석은 이렇게 이건 싱글라인
/*
이것도 되는데 
이건 멀티라인도 됨
*/
/*
	제약조건 중복X: unique, 뭐라도입력: not null, index
*/

DROP TABLE membertbl;

CREATE TABLE productTBL(
	productName CHAR(4) PRIMARY KEY,
	cost INT NOT NULL,
	MAKEDATE DATE,
	company CHAR(5),
	amount INT NOT NULL
);
DROP TABLE producttbl;
-- 컴퓨터는 정수와 실수만 구분

-- CRUD , DML (데이터 조작어) insert select update delete

-- CREATE (insert문)
/*
INSERT INTO 테이블명
(값을 넣고 싶은 컬럼명)
VALUES
(값들)
*/
INSERT INTO membertbl
(memberid, membername, memberaddress)
VALUES
('1', '홍길동', '서울시');

INSERT INTO membertbl
(memberid, membername, memberaddress)
VALUES
('2', '홍길동', '서울시');

INSERT INTO membertbl
(memberid, membername)
VALUES
('3', '홍길동');

-- membername은 not null이기 때문에 에러가 발생
INSERT INTO membertbl
(memberid)
VALUES
('4');


INSERT INTO membertbl
(memberid, membername)
VALUES
('5', '신사임당'),
('6', '김철수'),
('7', '이영희');


INSERT INTO membertbl
(membername, memberid)
VALUES
('신짱구', '9');

INSERT INTO membertbl
VALUES
('8', '사나이', '부산');

INSERT INTO membertbl
(memberid, membername, memberaddress)
VALUES
('10', '맹구', '부산');

INSERT INTO membertbl
(memberid, membername, memberaddress)
VALUES
('11', '철수', '서울시');

-- Read (select문)
/* (문법) 
SELECT 보고 싶은 컬럼명들 FROM 테이블명
[ JOIN 테이블 연결 ] 
[ WHERE 보고싶은 조건 ]
[ GROUP BY 그룹으로 묶는 조건 ]
[ HAVING 그룹으로 묶는 조건에서의 조건 ]
[ ORDER BY 레코드 순서 지정 ]
[ LIMIT 보고싶은 레코드 수 ]
*/
SELECT memberid, membername, memberaddress
FROM membertbl;
-- 전체 *
SELECT * FROM membertbl
WHERE memberid = '1';

SELECT membername FROM membertbl;

SELECT * FROM membertbl
WHERE memberaddress != '서울시';

SELECT * FROM membertbl
WHERE memberaddress IS NULL;

SELECT * FROM membertbl
WHERE memberaddress != '서울시'
OR memberaddress IS NULL;

SELECT * FROM membertbl
WHERE memberaddress = '부산시'
AND membername = '사나이';

SELECT * FROM membertbl
WHERE membername = '철수';
-- WHERE PK = '값' 일 경우 나오거나/안나오거나 두가지경우의수밖에없다

-- LIKE 문은 문자열 포함된 레코드를 찾을 때
SELECT * FROM membertbl
WHERE membername LIKE '%이%';
-- 이가 들어간 거 양쪽다 %%

SELECT * FROM membertbl
WHERE membername LIKE '이%';
-- 이로 시작하는 거 뒤에만 %
-- 끝나는 건 앞에만 %

SELECT * FROM membertbl
WHERE membername LIKE '%일';

-- Update (update문)
/*
	UPDATE 테이블명
	SET 수정하고 싶은 컬럼명 = 변경하고 싶은 값
	WHERE 레코드 선택
*/

UPDATE membertbl
SET membername = '게일'
WHERE memberid = '7';

UPDATE membertbl
SET membername = '사나이',
memberaddress = '부산'
WHERE memberid = '9';

UPDATE membertbl
SET membername = '111'
, memberaddress = '222'
WHERE memberid = '0';

-- Delete (delete문)  
/* DELETE FROM 테이블명 WHERE 절 */
-- 주소가 null인 레코드 전부 삭제

DELETE FROM membertbl
WHERE memberaddress IS NULL;

DELETE FROM membertbl
WHERE memberid = '11';

/*
my name is hong

camel case	: myNameIsHong
pascal case	: MyNameIsHong
snake case	: my_name_is_hong
cabob case	: my-name-is-hong
*/


-- d001 d003 d005

SELECT * FROM departments
WHERE dept_no = 'd001' or dept_no = 'd003' or dept_no = 'd005';

SELECT * FROM departments
WHERE dept_no IN ('d001', 'd003', 'd005');

SELECT * FROM employees
WHERE emp_no % 2 = 1 ;

SELECT * FROM employees
WHERE emp_no % 2 = 0 ;