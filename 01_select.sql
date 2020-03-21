
SELECT * FROM employees;

SELECT employee_id, first_name, salary FROM employees WHERE last_name = 'Smith';

SELECT employee_id  "ID", salary  "SA" FROM employees;
SELECT first_name, last_name FROM employees WHERE salary >= 5000;

SELECT FIRST_NAME, LAST_NAME, job_id, department_id FROM employees WHERE department_id = 50 AND job_id LIKE '%CLERK%';
SELECT FIRST_NAME, LAST_NAME, job_id, department_id, manager_id FROM employees WHERE department_id = 50 OR manager_id = 124;

/*계정의 테이블들 보여줌*/
SELECT * FROM TAB;
/*중복제거*/
SELECT DISTINCT job_id FROM employees;
/*DATA 연산?*/
SELECT FIRST_NAME , LAST_NAME, hire_date FROM employees WHERE hire_date >= '04/01/01';
/*NOT*/
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE department_id NOT IN 50;
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE NOT (department_id = 50);
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE department_id <> 50;
/*사이값*/
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary >= 4000 AND salary <=8000;
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary BETWEEN 4000 AND 8000;

SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary = 6500 OR salary = 7700 OR salary = 13000;
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary IN(6500, 7700, 13000);

SELECT FIRST_NAME, LAST_NAME FROM employees  WHERE first_name LIKE 'D%';
SELECT FIRST_NAME, LAST_NAME FROM employees  WHERE first_name LIKE '%d';

-- first_name 의 두번째 글자가 a로 끝나는 이름
select first_name , last_name  from employees where first_name like '_a%'; 
-- first_name 의 세번째 글자가 a로 끝나는 이름
select first_name , last_name  from employees where first_name like '__a%'; 

--커미션이 있는 사원과 없는 사원이 있다
--1. 커미션이 null 인 사원 == 커미션이 없는사원
select first_name , last_name, commission_pct  from employees where commission_pct is null;
--2. 커미션이 null 이 아닌사원 == 커미션 있는 사원
select first_name , last_name, commission_pct  from employees where commission_pct is not null;

-- desc : 내림차순
-- asc : 오름차순 , 생략가능(기본값)
SELECT employee_id, last_name FROM employees order by employee_id desc;







