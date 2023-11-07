-- LIMIT

SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu 
 ORDER BY menu_price DESC;
 
SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu  
 ORDER BY menu_code
 LIMIT 1,4; #1번쨰 인덱스부터 4개 출력 (1번째~4번째 인덱스가 아님)
 
SELECT 
	menu_code ,
	menu_name ,
	menu_price 
  FROM tbl_menu 
 ORDER BY 
 	menu_price DESC ,
	menu_name ASC
 LIMIT 5;