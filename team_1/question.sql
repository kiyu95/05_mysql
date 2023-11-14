SELECT * FROM application;
SELECT * FROM class;
SELECT * FROM criteria;
SELECT * FROM lecture;
SELECT * FROM professor;
SELECT * FROM score;
SELECT * FROM student;
SELECT * FROM report;

# Quiz.1
-- 수업에서 학점(grade)이 B0 보다 높은 학생들 중 출석점수(score_attend)가 80점 이상인 학생들에게 상장을 수여하려고 한다.
-- 제작해야 하는 학점 별 상장의 갯수를 알기 위한 쿼리를 작성 해 주세요.
-- 출력되는 컬럼명은 학점, 인원 으로 작성하고 학점이 높은 순서로 나열 해 주세요.
SELECT 
	a.grade AS 학점,
	count(*) AS 인원
  FROM score s
  JOIN application a ON s.application_code = a.application_code
 WHERE score_attend >= 80
   AND a.grade IN ('A+', 'A0', 'B+', 'B0')
 GROUP BY a.grade 
 ORDER BY grade;

# Quiz.2
-- 우리 학과에는 운동을 좋아하는 사람들을 위해 무에타이와 주짓수 클래스가 있다.
-- 이를 듣는 사람의 이름과 담당 교수와 수업 이름, 학점을 출력해주세요. 학점이 높은 순서대로 출력 해주세요.
SELECT 
	student_name ,
	professor_name ,
	class_name ,
	grade
  FROM application a
  JOIN student s ON a.student_code = s.student_code 
  JOIN lecture l ON a.lecture_code = l.lecture_code 
  JOIN professor p ON l.professor_code = p.professor_code 
  JOIN class c ON l.class_code = c.class_code
 WHERE c.class_name IN ('주짓수', '무에타이')
 ORDER BY grade;

# Quiz.3
-- 대학교에서 장학금을 지급하려고 한다. 듣는 강의 중에서 하나라도 A 이상을 받은 학생은 장학금을 받을 수 있다.
-- A 학점을 하나라도 받지 못한 학생은 평균 성적이 괜찮더라도 장학금을 받지 못한다.
-- 전화번호와 사는 지역 모두 입력이 안된 학생은 장학금을 받지 못하므로 A 학점을 받았더라도 제외한다.
-- 장학금을 받을 학생들의 이름과 A 학점 이상을 증명할 성적을 출력하세요.
SELECT 
	student_name ,
	min(grade) AS grade 
  FROM student s
  JOIN application a ON s.student_code = a.student_code 
  WHERE a.grade IN ('A+', 'A0') AND student_phone IS NOT NULL 
     OR a.grade IN ('A+', 'A0') AND student_address IS NOT NULL
  GROUP BY student_name
  ORDER BY grade, student_name;
 
# Quiz.4
-- 학생들의 학기 평균학점과 등수를 내림차순으로 정렬 해주세요
SELECT 
    d.student_name ,
    round(avg(grade_point), 2) AS '학점' ,
    RANK() OVER (ORDER BY round(avg(grade_point), 2) DESC) AS '등수' 
  FROM application a
	JOIN report b ON a.grade = b.grade 
    JOIN lecture c ON a.lecture_code = c.lecture_code 
    JOIN student d ON d.student_code = a.student_code 
    GROUP BY d.student_code 
    ORDER BY 학점 DESC;