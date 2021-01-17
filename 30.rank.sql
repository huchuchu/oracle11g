/*
분석함수 : 데이터를 분석하는 기능을 가진 함수
순위함수 : rank(), dense_rank(), row_number()
          first, last를 사용한 분석법

분석함수를 사용하기위한 구문 형식
분석함수 (p1,p2,...)
over (partition by, order by)
*/

--rank()
-- 급여별 순위
select employee_id, salary,rank() over( order by salary desc) ranking_sal  from employees;