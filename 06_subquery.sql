/* �������� */

select round(avg(salary)) from employees ;

select round(avg(salary)) from employees 
where salary < round(avg(salary)); -- ����, where�������� �����Լ� ���Ұ�

-- ���������� ����Ͽ� ��� �޿����� ���� �޿��� �ް��ִ� ��� ���
select employee_id, first_name, last_name, salary from employees 
where salary < (select round( avg(salary)) from employees );

-- null ���� �����̼� ���̵����� deparatment ���� ��������
select * from departments where location_id in (
select location_id from locations where state_province is null );

select * from departments where location_id  in (
select location_id from locations where country_id = 'US');

/* any, all */
-- any �ϳ����Ǹ� �����ϸ� ��, all ���ǵ��� �� �����ϸ��

select department_id, employee_id, salary
from employees
where salary > (select salary from employees  
                    where department_id = 20);


