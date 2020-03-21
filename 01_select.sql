
SELECT * FROM employees;

SELECT employee_id, first_name, salary FROM employees WHERE last_name = 'Smith';

SELECT employee_id  "ID", salary  "SA" FROM employees;
SELECT first_name, last_name FROM employees WHERE salary >= 5000;

SELECT FIRST_NAME, LAST_NAME, job_id, department_id FROM employees WHERE department_id = 50 AND job_id LIKE '%CLERK%';
SELECT FIRST_NAME, LAST_NAME, job_id, department_id, manager_id FROM employees WHERE department_id = 50 OR manager_id = 124;

/*������ ���̺�� ������*/
SELECT * FROM TAB;
/*�ߺ�����*/
SELECT DISTINCT job_id FROM employees;
/*DATA ����?*/
SELECT FIRST_NAME , LAST_NAME, hire_date FROM employees WHERE hire_date >= '04/01/01';
/*NOT*/
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE department_id NOT IN 50;
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE NOT (department_id = 50);
SELECT FIRST_NAME, LAST_NAME, department_id FROM employees WHERE department_id <> 50;
/*���̰�*/
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary >= 4000 AND salary <=8000;
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary BETWEEN 4000 AND 8000;

SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary = 6500 OR salary = 7700 OR salary = 13000;
SELECT FIRST_NAME, LAST_NAME, salary FROM employees WHERE salary IN(6500, 7700, 13000);

SELECT FIRST_NAME, LAST_NAME FROM employees  WHERE first_name LIKE 'D%';
SELECT FIRST_NAME, LAST_NAME FROM employees  WHERE first_name LIKE '%d';

-- first_name �� �ι�° ���ڰ� a�� ������ �̸�
select first_name , last_name  from employees where first_name like '_a%'; 
-- first_name �� ����° ���ڰ� a�� ������ �̸�
select first_name , last_name  from employees where first_name like '__a%'; 

--Ŀ�̼��� �ִ� ����� ���� ����� �ִ�
--1. Ŀ�̼��� null �� ��� == Ŀ�̼��� ���»��
select first_name , last_name, commission_pct  from employees where commission_pct is null;
--2. Ŀ�̼��� null �� �ƴѻ�� == Ŀ�̼� �ִ� ���
select first_name , last_name, commission_pct  from employees where commission_pct is not null;

-- desc : ��������
-- asc : �������� , ��������(�⺻��)
SELECT employee_id, last_name FROM employees order by employee_id desc;







