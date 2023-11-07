SHOW datavase;

CREATE USER 'menu'@'%' IDENTIFIED BY 'menu'; #user목록을 만들겠다. mene:유저이름, %:범위, mene:비밀번호 

SHOW DATABASES; #database 목록을 보여달라

USE mysql; #mysql 사용

SHOW TABLES; #table 목록 확인

SELECT * FROM USER; 

CREATE DATABASE menudb; #menedb 데이터베이스 생성

SHOW DATABASES;

GRANT ALL PRIVILEGES ON menudb.* TO 'menu'@'%'; #모든 권한 부여

SHOW GRANTS FOR 'menu'@'%'; #menu가 수여받은 목록 확인

USE menudb; #menudb 사용

SHOW TABLES;
