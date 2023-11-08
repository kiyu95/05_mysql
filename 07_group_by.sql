-- group by

-- count()
SELECT 
	category_code ,
	count(*) 
  FROM tbl_menu 
 GROUP BY category_code ;
 
SELECT 
	menu_code ,
	category_code
  FROM tbl_menu ;
  
-- sum()
SELECT 
	category_code ,
	menu_price 
  FROM tbl_menu; 
  
SELECT 
	category_code ,
	sum(menu_price) 
  FROM tbl_menu
 GROUP BY category_code;

-- avg()
SELECT 
	category_code ,
	avg(menu_price)
  FROM tbl_menu 
 GROUP BY category_code;
 
-- 다중열 묶음
SELECT 
	category_code ,
	menu_price ,
	count(*)  
  FROM tbl_menu 
 GROUP BY category_code , menu_price ; # category_code로 그룹하고 menu_price로 그룹한다
 
-- 그룹에 대한 조건을 걸때 having을 사용한다.
SELECT 
	category_code
  FROM tbl_menu 
-- WHERE menu_name NOT IN ('과메기커틀릿')
 GROUP BY category_code
 HAVING category_code BETWEEN 5 AND 8; # HAVING : group에 조건을 걸때 사용
 
-- Rollup
SELECT 
	category_code ,
	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code 
 WITH ROLLUP ;
 
SELECT 
	category_code ,
	orderable_status ,
	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code, orderable_status 
 WITH ROLLUP ;
 
