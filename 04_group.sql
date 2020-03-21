/* group by 절 */

-- distinct로 중복제거
select distinct department_id from employees;

-- group by로 묶어서 출력
select department_id from employees group by department_id;

-- 부서별 급여 합계
select department_id, sum(salary) from employees group by department_id;
select distnict department_id, sum(salary) from employees; -- 에러

-- 부서별 급여 합계 인원수 평균
select department_id , sum(salary), count(salary), trunc(avg(salary),2) from employees group by department_id;
-- 부서별, 직급별 사원수와 평균 급여 
select department_id , job_id,sum(salary), count(salary), trunc(avg(salary),2) from employees group by department_id, job_id;

-- order by 추가
select department_id , job_id,sum(salary), count(salary), trunc(avg(salary),2) 
from employees 
group by department_id, job_id 
order by department_id, job_id;

select department_id, job_id, 
to_char(sum(salary), '999,999') 총급여,  -- 형식을 지정할 수 있다!!!
to_char(avg(salary), '999,999') 평균급여
from employees
where department_id = 80 
GROUP by department_id, job_id
order by department_id, job_id;


/* HAVING() 절 */
 
 -- 부서별 사원수
 select department_id, count(*)  from employees 
 where department_id is not null
 GROUP by department_id;

-- 사원수가 10명 이상인 부서
--(1) 에러
 select department_id, count(*)  from employees 
 where department_id is not null
         and count(*)>10          -- where 절에서는 집계함수를 사용할 수 없다
 GROUP by department_id;  

--(2) having 사용 (보통은 group by 절 뒤에 사용하지만 앞에와서 상관은없다)
 select department_id, count(*)  from employees 
 where department_id is not null       
 GROUP by department_id
 having count(*) >= 10 ;  
 
 /* rollup() 그룹별 합계 정보를 추가해서 보여줌 */
 SELECT l.city, d.department_name, e.job_id,
 count(*) 사원수, sum(e.salary) 총급여 
 from employees e, departments d, locations l
 where e.department_id = d.department_id
   and d.location_id = l.location_id
   group by ROLLUP( l.city, d.department_name, e.job_id) -- 부서별 합계(인원수/급여)가 출력된다
   order by l.city, d.department_name, e.job_id;
    
 
 