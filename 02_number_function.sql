/* 합계 함수 sum() */
select sum(salary) from employees;

/* coutn() */
select count(*) from employees;
-- all 전부 distincct 중복제거
select count(all employee_id), count(distinct employee_id) from employees;
select count(all first_name), count(distinct first_name) from employees;

-- 그룹함수는 where절에 사용할 수 없다!!
-- 서브쿼리를 사용해야함!
select employee_id, first_name from employee where salary = max(salary);


/* avg() */
select avg(salary) from employees where department_id = 50;

/* max() min() */
select max(salary) from employees;
select max(hire_date) from employees; -- 가장 최근에 입사한 사람

select min(salary) from employees;
select min(hire_date) from employees; -- 가장 입사일이 오래된사람

/* 숫자형 함수(number function) */
/* abs(), sign(), round(), trunc(), ceil() */
-- dual : 오라클에서 제공해주는 dummy테이블
-- 테이블이 없더라도 사용 가능한 데이터이지만 오라클에서는 테이블값을 지정해주어야하므로 dual을 사용한다
-- dual , sys.dual
select abs(-23) from dual;

-- sign() 양수는 1 음수는 -1 0은 0을 반환한다
select sign(23), sign(-23), sign(0) from dual;

-- 반올림 round()
select round(0.123), round(0.543) from dual;
-- round(대상숫자, 반올림 되는 자릿수)
select round(0.12345678, 6) , round(2.3423455, 4) from dual;

-- trunc(n1, n2) trunc(1234.1234567 , 0) = trunc(1234.1234567 )
select trunc(1234.1234567 , 0) from dual;
select trunc(1234.1234567 , 2) from dual;
select trunc(1234.1234, -1) from dual;
select trunc( avg(salary), 2) from employees;

-- ceil() 올림
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

-- floor() 내림
select floor(32.8) from dual;
select floor(32.3) from dual;

-- power() 제곱
select power(2,10) power from dual;

-- mod() 나머지 값
select mod(7,4) mod1 from dual;

-- sqrt() 제곱근 
select sqrt(2), sqrt(3) from dual;

