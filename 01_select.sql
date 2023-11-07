SELECT MENU_NAME FROM TBL_MENU;

SELECT #선택하다 (실행순서2)
	menu_code , #tbl_menu 에서 menu_code column 선택
	menu_name ,
	menu_price
  FROM tbl_munu; #어느곳에서: 테이블 (실행순서1)

-- CODE, 이름, 가격, STATUS(상태), 카테고리를 조회해주세요
SELECT 
	menu_code ,
	munu_name ,
	menu_price ,
	category_code ,
	orderable_status
  FROM tbl_munu;
  
-- 전부 선택 : * (잘 사용안함) 
 SELECT 
 	*
  FROM tbl_munu;
  
-- 연산을 바로 실행함
SELECT 6 + 3;
SELECT 6 * 3;

-- 내장 함수를 사용함
SELECT NOW();
SELECT CONCAT('홍.', '   ', '길동'); #가상의 table에 concat column울 만듦

-- 별칭을 지정함
SELECT CONCAT('홍.', '   ', '길동') as 'NAME'; #가상의 column 이름을 NAME으로 정의
