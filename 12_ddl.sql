-- DDL(Data Definition Lanhuage)

# create
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정
-- column_name data_type(length) [not null] [default value] [auto_increment] column_constraint;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk int PRIMARY KEY ,
	fk int ,
	coll varchar(255) ,
	check(coll IN ('Y', 'N')) #coll 은 'Y' 랑 'N' 만 허용
) ENGINE = INNODB;

DESCRIBE tb1;
INSERT INTO tb1 VALUES (1,10,"Y");

SELECT * FROM tb1;

# Auto_increment
-- insert 시 primary키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.
CREATE TABLE IF NOT EXISTS tb2 (
	pk int AUTO_INCREMENT PRIMARY KEY ,
	fk int ,
	col1 varchar(255) ,
	CHECK (col1 IN ('y', 'n'))
	) ENGINE = INNODB;

DESCRIBE tb2;
INSERT INTO tb2 VALUES (NULL, 10, 'Y');
INSERT INTO tb2 VALUES (10, 'n'); # PRIMARY KEY 누랑
INSERT INTO tb2 VALUES (30, 'f'); # CHECK 제약조건에 위배

SELECT * FROM tb2;

# alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다.

-- 테이블에 컬럼 추가
ALTER TABLE tb2
ADD col2 int NOT NULL; # tb2 테이블에 col2 컬럼 추가
DESCRIBE tb2;

-- 테이블에 컬럼 삭제
ALTER TABLE tb2
DROP column col2; # tb2 테이블의 col2컬럼 제거
DESCRIBE tb2;

-- 컬럼(열)의 이름 변경 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_ke int NOT NULL;
DESCRIBE tb2;

-- 컬럼 수정시 컬럼의 값을 덮어씌운다 생각을 해야함
ALTER TABLE tb2
CHANGE COLUMN change_ke fk; # 데이터 타입 누락

-- 컬럼(열)의 제약 조건 추가 및 삭제
-- 실행시 auto_increment로 인해 오류가 발생된다.
ALTER TABLE tb2
DROP PRIMARY KEY;

-- auto_increment가 걸려 있는 컬럼은 primary key 제거가 안되므로
-- auto_increment를 modify 명령으로 제거한다
ALTER TABLE tb2
MODIFY pk int;

-- auto_increment 옵션을 제거하여 primary key 제약 조건을 제거할 수 있다.
ALTER TABLE tb2
DROP PRIMARY KEY;
DESCRIBE tb2;

-- primary key 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY key(pk);
DESCRIBE tb2;

ALTER TABLE tb2
ADD col3 date NOT NULL ,
ADD col4 TINYINT NOT NULL;

DELETE FROM tb2;

-- date 형이 0으로 추가가 안 되는 것은 mysql 5.7 버전 이후 select @@Global.sql_mode 했을 때
-- 나온 결과 only_full_group, STRICT_TRANS_TABLES,NO_ZERO_IN_DATE, 
-- NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER, NO_ENGINE_SUBSTITUTION
-- 에서 NO_ZERE_DATE 때문이며 0으로 채워진 date 컬럼이 존재하면 안되기 때문이다.

SELECT @@global.SQL_mode;
SET GLOBAL sql_mode = '';

SELECT * FROM tb2;

# drop
-- 테이블을 삭제하기 위한 구문
-- IF EXISTS를 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- drop [TEMPORARY] table [IF EXISTS] table_name [, table_name] ....

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY key ,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

DROP TABLE IF EXISTS tb3; #존재하지 않더라도 에러가 발생하지 않고 넘어간다.
DROP TABLE tb3; #존재하지 않으면 에러 발생
SHOW tables;

-- 다중 삭제를 위해 여러개의 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY key ,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tb4(
	pk int AUTO_INCREMENT PRIMARY key ,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

SHOW tables;

-- 여러개의 테이블을 삭제하는 경우 아래와 같이 ,로 나열한다.
DROP TABLE IF EXISTS tb3, tb4;
SHOW tables;

-- 테이블을 초기화 하는 구문
CREATE TABLE IF NOT EXISTS tb5(
	pk int AUTO_INCREMENT PRIMARY key ,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
SELECT * FROM tb5;

DELETE
  FROM tb5
 WHERE pk = 4;
 
SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');

truncate tb5; # truncate : 테이블 초기화
SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');