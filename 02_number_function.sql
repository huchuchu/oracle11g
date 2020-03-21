/* �հ� �Լ� sum() */
select sum(salary) from employees;

/* coutn() */
select count(*) from employees;
-- all ���� distincct �ߺ�����
select count(all employee_id), count(distinct employee_id) from employees;
select count(all first_name), count(distinct first_name) from employees;

-- �׷��Լ��� where���� ����� �� ����!!
-- ���������� ����ؾ���!
select employee_id, first_name from employee where salary = max(salary);


/* avg() */
select avg(salary) from employees where department_id = 50;

/* max() min() */
select max(salary) from employees;
select max(hire_date) from employees; -- ���� �ֱٿ� �Ի��� ���

select min(salary) from employees;
select min(hire_date) from employees; -- ���� �Ի����� �����Ȼ��

/* ������ �Լ�(number function) */
/* abs(), sign(), round(), trunc(), ceil() */
-- dual : ����Ŭ���� �������ִ� dummy���̺�
-- ���̺��� ������ ��� ������ ������������ ����Ŭ������ ���̺��� �������־���ϹǷ� dual�� ����Ѵ�
-- dual , sys.dual
select abs(-23) from dual;

-- sign() ����� 1 ������ -1 0�� 0�� ��ȯ�Ѵ�
select sign(23), sign(-23), sign(0) from dual;

-- �ݿø� round()
select round(0.123), round(0.543) from dual;
-- round(������, �ݿø� �Ǵ� �ڸ���)
select round(0.12345678, 6) , round(2.3423455, 4) from dual;

-- trunc(n1, n2) trunc(1234.1234567 , 0) = trunc(1234.1234567 )
select trunc(1234.1234567 , 0) from dual;
select trunc(1234.1234567 , 2) from dual;
select trunc(1234.1234, -1) from dual;
select trunc( avg(salary), 2) from employees;

-- ceil() �ø�
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

-- floor() ����
select floor(32.8) from dual;
select floor(32.3) from dual;

-- power() ����
select power(2,10) power from dual;

-- mod() ������ ��
select mod(7,4) mod1 from dual;

-- sqrt() ������ 
select sqrt(2), sqrt(3) from dual;

