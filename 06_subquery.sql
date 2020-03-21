/* 서브쿼리 */

select round(avg(salary)) from employees ;

select round(avg(salary)) from employees 
where salary < round(avg(salary)); -- 에러, where절에서는 집계함수 사용불가

-- 서브쿼리를 사용하여 평균 급여보다 적은 급여를 받고있는 사람 출력
select employee_id, first_name, last_name, salary from employees 
where salary < (select round( avg(salary)) from employees );

-- null 값인 로케이션 아이디값으로 deparatment 정보 가져오기
select * from departments where location_id in (
select location_id from locations where state_province is null );

select * from departments where location_id  in (
select location_id from locations where country_id = 'US');

/* any, all */
-- any 하나조건만 만족하면 됨, all 조건들을 다 만족하면됨

select department_id, employee_id, salary
from employees
where salary > (select salary from employees  
                    where department_id = 20);


