-- 정렬 기능 알아보기
-- ORDER BY

-- 내림차순 정렬
SELECT 
	* #대상 컬럼 자리
  FROM TBL_MENU #대상 테이블 자리
 ORDER BY MENU_CODE DESC; #ORDER BY '기준' 정렬방식(기본값 ASC)
 
-- 오름차순 정렬
SELECT 
	*
  FROM TBL_MENU
 ORDER BY MENU_CODE ASC;
 
-- ORDER BY 절을 사용하여 결과 집합을 여러 열로 정렬
SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM TBL_MENU
 ORDER BY
 	menu_price DESC ,
 	menu_code ASC; #가격 내림순 정렬하고, 같은 가격이면 코드 오름차순으로 정렬
 	
-- 연산 결과 결과 집합 정렬
-- 아래의 결과는 두 번 연산이 진행되는 것으로 판단됨
-- 데이터의 값이 증가할 수록 성능이 저하한다.
 SELECT 
 	menu_code ,
 	menu_price ,
 	menu_code * MENU_PRICE
  FROM TBL_MENU
 ORDER BY
 	MENU_CODE * MENU_PRICE;
 	
-- 위의 연산의 경우 다음과 같이 사용하는 것이 좋다
 SELECT 
 	menu_code ,
 	menu_price ,
 	(menu_code * MENU_PRICE) AS 'TEST'
  FROM TBL_MENU
 ORDER BY
 	TEST;
 	
 SELECT FIELD('A','A','B','C');
 SELECT FIELD('B','A','B','C');
 
 SELECT 
 	MENU_CODE ,
 	MENU_NAME ,
 	ORDERABLE_STATUS ,
 	FIELD(orderable_status, 'N', 'Y')
   FROM TBL_MENU;
   
SELECT 
	MENU_NAME,
	ORDERABLE_STATUS
  FROM TBL_MENU
 ORDER BY FIELD(ORDERABLE_STATUS, 'N', 'Y') DESC;
 
-- null
-- 오름차순 시 null 처음으로(default)
SELECT 
	CATEGORY_CODE ,
	CATEGORY_NAME ,
	REF_CATEGORY_CODE 
  FROM TBL_CATEGORY
 ORDER BY
 	REF_CATEGORY_CODE;
 
-- 역순으로 정렬시
-- DESC
SELECT 
	CATEGORY_CODE ,
	CATEGORY_NAME ,
	REF_CATEGORY_CODE 
  FROM TBL_CATEGORY
 ORDER BY
 	REF_CATEGORY_CODE DESC;
 
-- 오름 차순시 마지막으로 정렬
SELECT 
	CATEGORY_CODE ,
	CATEGORY_NAME ,
	REF_CATEGORY_CODE 
  FROM TBL_CATEGORY
 ORDER BY
 	REF_CATEGORY_CODE IS NULL;
 
-- 내림 차순시 처음으로 정렬
SELECT 
	CATEGORY_CODE ,
	CATEGORY_NAME ,
	REF_CATEGORY_CODE 
  FROM TBL_CATEGORY
 ORDER BY
 	EF_CATEGORY_CODE IS NULL DESC;