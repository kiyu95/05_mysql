-- subquery(서브쿼리)

SELECT 
	menu_code ,
	menu_price ,
	menu_name ,
	category_code ,
	orderable_status
  FROM tbl_menu 
 WHERE category_code = (
 		SELECT
 			category_code
 		  FROM tbl_menu
 		 WHERE menu_name = '민트미역국');
 		 
-- 가장 많은 메뉴가 포함된 카테고리
-- 서브쿼리
SELECT 
	category_code ,
	count(*) AS 'count'
  FROM tbl_menu 
 GROUP BY category_code ;
 
SELECT 
	max(count)
  FROM (
  	SELECT
  		count(*) AS 'count' # 별칭을 지정해줘야함
  	  FROM tbl_menu 
  	 GROUP BY category_code) AS countMenu; # 뷰의 별칭을 지정해줘야함
  	 
-- 카테고리 평균 가격보다 높은 가격의 메뉴 조회
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code ,
	orderable_status 
  FROM tbl_menu a
 WHERE menu_price > (
 			SELECT
 				avg(menu_price)
 			  FROM tbl_menu );
 			 
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code ,
	orderable_status 
  FROM tbl_menu a
 WHERE menu_price in ( # in을 사용해야 하는 이유 : 열이 여러개 이므로
 			SELECT
 				avg(menu_price)
 			  FROM tbl_menu 
 			 GROUP BY category_code);
 			 
SELECT 
	category_code
  FROM tbl_menu tm  
 WHERE TRUE;
 
SELECT 
	menu_name ,
	category_code
  FROM tbl_menu tm  
 WHERE TRUE
 	OR menu_name = '민트미역국';
 	
SELECT 
	category_code 
  FROM tbl_category tc  
 WHERE EXISTS (
 	SELECT
 		1
 	  FROM tbl_menu tm
 	 WHERE tm.category_code = tc.category_code);
 	 
-- common table
WITH menucate AS (
	SELECT
		menu_name ,
		category_name 
	  FROM tbl_menu a
	  JOIN tbl_category b ON (a.category_code = b.category_code)
	  )
SELECT 
	*
  FROM menucate
 ORDER BY menu_name;
 
WITH menucate AS (
	SELECT
		menu_name ,
		category_name 
	  FROM tbl_menu a
	  JOIN tbl_category b ON (a.category_code = b.category_code)
	  )
SELECT 
	category_name
  FROM menucate
 GROUP BY category_name;