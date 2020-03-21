/* JOIN */

-- 내부조인 (일반적인 조인)
select e.first_name, e.last_name, e.email, d.department_name, d.department_id 
from employees e, departments d 
where e.department_id = d.department_id  -- JOIN조건이 필요하다!
order by e.first_name;

SELECT * FROM employees;
SELECT * FROM jobs;

SELECT emp.first_name, emp.last_name, emp.email, 
       dep.department_id, dep.department_name, 
       job.job_id, job.job_title,
       loc.city
FROM employees emp , departments dep ,jobs job, locations loc
where emp.department_id = dep.department_id
  and emp.job_id = job.job_id
  and dep.location_id = loc.location_id
  and loc.city = 'Seattle'; -- join 조건과 일반조건이 같이있을 경우 일반조건을 먼저 검색한 후 join으로 넘어간다
  
-- 셀프조인(내부조인) : 자신의 테이블에서 자신의 컬럼을 조인..?!
select emp1.employee_id , emp1.first_name,
       emp2.employee_id 상사ID, emp2.first_name 상사이름
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id ;

-- 외부조인
SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id; -- 총 106개

select * from employees; -- 107명

SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id (+); -- 총 107개


SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name,
       loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
and dep.location_id = loc.location_id; -- 총 106개


SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name,
       loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
and dep.location_id = loc.location_id(+); -- 총 107개 
                                          -- 조건이 일치하지않아도 출력하기위해선? 조건마다 (+)설정해두기



