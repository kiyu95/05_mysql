# where

SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	orderable_status 
  FROM TBL_MENU
WHERE orderable_status = 'Y'; # orderable_status의 값이 Y인 것만 출력

SELECT 
	menu_name,
	menu_price,
	orderable_status
  FROM tbl_menu
 WHERE menu_price = 13000;
 
-- 값이 같지 안흔 상태를 조회하는 방법 
SELECT 
	menu_code,
	menu_name,
	orderable_status
  FROM tbl_menu
 WHERE 
--  orderable_status <> 'Y';
 	orderable_status != 'Y';
 	
-- 가격이 20000원 이상인 메뉴를 조회해주세요
-- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순으로 정렬해주세요
SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu
 WHERE menu_price >= 20000
 ORDER BY menu_code DESC;
 
-- 가격이 5000원 이상이면서 판매중인 제품을 조회
-- 코드, 이름, 가격, 상태
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 5000 
   AND orderable_status = 'Y'; # AND 사용
   
-- 제품이 판매 중이거나 혹은 category_code가 10인 목록 조회
-- 코드, 이름, 가격, 카테고리, 상태
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code ,
	orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y'
    OR category_code = 10;
    
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	orderable_status
  FROM tbl_menu
 WHERE category_code = 4
 	OR menu_price = 9000
   AND menu_code > 10;
   
-- 범위를 조회하는 경우
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code ,
	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 10000
   AND menu_price <= 25000
 ORDER BY menu_price;
 
SELECT
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_price BETWEEN 10000 AND 25000;
 
-- 범위에 해당하지 않는 목록 조회
SELECT 
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000
 ORDER BY menu_price DESC;
 
-- 값이 포함되어 있는지 확인하는 방법
SELECT 
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%'
 ORDER BY menu_name;
 
-- 가격이 5000원 이상이고 카테고리 코드가 10인 녀석 중 갈치라는 이름이 포함된
-- 메뉴를 조회해주세요
-- code, name, category_code, price
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_name LIKE "%갈치%"
   AND menu_price >= 5000
   AND category_code = 10;
   
-- LIKE의 부정문
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_name NOT LIKE "%갈치%"
   AND menu_price >= 5000
   AND category_code = 10;
   
-- 카테고리 코드가 한식(4), 중식(5), 일식(6) 메뉴를 조회
SELECT 
	menu_name ,
	category_code
  FROM tbl_menu 
 WHERE category_code = 4
    OR category_code = 5
    OR category_code = 6;
    
-- in()
SELECT 
	menu_name ,
	category_code
  FROM tbl_menu 
 WHERE category_code IN (4,5,6);
 
-- 포함하지 않은 값을 조회
SELECT 
	menu_name ,
	category_code
  FROM tbl_menu 
 WHERE category_code NOT IN (4,5,6);
 
-- NULL인 목록 조회
SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category 
 WHERE ref_category_code IS NULL;
 
-- NULL이 아닌 목록 조회
SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category 
 WHERE ref_category_code IS NOT NULL;