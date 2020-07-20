--  Number of Titles Retiring
SELECT salaries.salary,
	   salaries.from_date,
       titles.emp_no,
	   titles.title,	
	   retirement_info.first_name,
	   retirement_info.last_name   

INTO Challenge_Part1
 FROM retirement_info
Right JOIN salaries
 ON (Salaries.emp_no = retirement_info.emp_no)
 Left Join titles
 ON (titles.emp_no = retirement_info.emp_no);



 --Only the Most Recent Titles

 SELECT
  challenge_part1.title,
  count(*)
  INTO Title_Freq
FROM Challenge_Part1
GROUP BY
  challenge_part1.title
HAVING count(*) > 1
   ORDER BY count DESC;

---Who’s Ready for a Mentor?
SELECT 
current_emp.emp_no,
current_emp.first_name,
current_emp.last_name,
titles.title,	
titles.to_date,
titles.from_date,
employees.birth_date,
employees.hire_date
--Into mentor1
From current_emp
inner join employees
on(current_emp.emp_no=employees.emp_no)

Right JOIN titles
ON (titles.emp_no = current_emp.emp_no)
;



SELECT 
first_name,
last_name,
emp_no,
title,
from_date,
to_date,
birth_date
into Mentor_Challenge
FROM mentor1
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31'
;