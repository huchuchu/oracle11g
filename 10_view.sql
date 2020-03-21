/* View */

create view v_emp( emp_id, first_name, job_id, hiredate, dept_id )as 
select employee_id, first_name, job_id, hire_date,department_id -- 논리적인 집합 시작
from employees
where job_id = 'ST_CLERK';

--v_emp 의 데이터는 어느 물리적 공간에 존재하는게 아니라 논리적인 집합 형태로 존재한다...?!

create view v_emp1( emp_id, first_name, job_id, hiredate, dept_id )as 
select employee_id, first_name, job_id, hire_date,department_id 
from employees
where job_id = 'SH_CLERK';

-- 1) view 조회
select * from v_emp;

--2) view 제거
drop view v_emp1;

--3) view 수정
create or replace view v_emp( emp_id, first_name, job_id, hiredate, dept_id )as 
select employee_id, first_name, job_id, hire_date,department_id 
from employees
where job_id = 'SH_CLERK';

--4) 함수를 사용하여 값수정을 못하게
-- nvl(employee_id, null) :: 함수를 써서 수정할 수 없게 하겠다!!!
create or replace view v_emp3( emp_id, first_name, job_id, hiredate, dept_id )as 
select nvl(employee_id, null), nvl(first_name,null), job_id, hire_date,department_id 
from employees
where job_id = 'SH_CLERK';

desc v_emp3;

update v_emp3  set first_name = 'kim' where first_name = 'Julia'; --에러
-- SQL 오류: ORA-01733: virtual column not allowed here
-- 01733. 00000 -  "virtual column not allowed here"

update v_emp set first_name = 'kim' where first_name = 'Julia'; -- 실행


--5) 연산과정을 숨기고 결과값만 보이기
create view v_emp_salary (emp_id, last_namem, annual_sal) as
select employee_id, last_name, (salary + nvl (commission_pct, 0))*12
from employees;

select * from v_emp_salary;

--6) read only
create view v_emp_readonly (emp_id, last_namem, annual_sal) as
select employee_id, last_name, (salary + nvl (commission_pct, 0))*12
from employees
with read only;

desc v_emp_readonly;
select * from v_emp_readonly;

update v_emp_readonly set last_namem = 'KIM' where last_namem = 'Gietz';
--SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view
--42399.0000 - "cannot perform a DML operation on a read-only view"

--7) 사용자 편의성
create view v_sample1 as
select employee_id, last_name, department_id ,hire_date
from employees
where (salary + nvl( commission_pct, 0) ) *12 > 40000
and department_id = 50
and job_id = 'ST_CLERK'
and sysdate - 365 * 5 > hire_date;

select * from v_sample1;

create view 사원 ( 사번, 이름, 부서번호, 입사일 )as
select employee_id, first_name||' '||last_name, department_id, hire_date
from employees
where department_id = 50;

SELECT * from 사원;


create  view v_join(사번,이름, 부서번호, 부서명, 입사일) as
select emp.employee_id, emp.first_name||' '||emp.last_name, emp.department_id, -- 공백때문에 ||' '|| 사용!
       dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join;

create  view v_join2(사번,이름, 부서번호, 부서명, 입사일) as
select emp.employee_id, emp.first_name||emp.last_name, emp.department_id,
       dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join2;


