-- join

SELECT
	tm.menu_code ,
	tm.menu_name ,
	tm.menu_price ,
	tc.category_name 
  FROM tbl_menu tm
  JOIN tbl_category tc ON (tm.category_code = tc.category_code)
 WHERE tm.orderable_status = 'Y';
 
SELECT 
	category_code
  FROM tbl_menu tm ;
  
 SELECT 
 	category_code
   FROM tbl_category tc ;
   
-- inner join
-- on은 테이블 간의 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다. 
SELECT
	a.menu_name ,
	b.category_name
  FROM tbl_menu a
--   INNER JOIN tbl_category b ON (a.category_code = b.category_code);
  JOIN tbl_category b ON (a.category_code = b.category_code);
  
-- Right join
SELECT
	a.menu_name ,
	b.category_name
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
  
-- cross join
SELECT
	a.menu_name ,
	b.category_name
  FROM tbl_menu a
  CROSS JOIN tbl_category b;
  
-- outer join
 SELECT 
 	a.menu_name ,
 	b.category_name
   FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
  WHERE a.menu_name IS NULL;
  
 -- self join
SELECT
	b.category_code ,
 	a.category_code ,
 	a.category_name ,
 	b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON (a.category_code = b.ref_category_code);
SELECT * FROM tbl_category;

