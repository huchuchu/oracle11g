/* JOIN */

-- �������� (�Ϲ����� ����)
select e.first_name, e.last_name, e.email, d.department_name, d.department_id 
from employees e, departments d 
where e.department_id = d.department_id  -- JOIN������ �ʿ��ϴ�!
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
  and loc.city = 'Seattle'; -- join ���ǰ� �Ϲ������� �������� ��� �Ϲ������� ���� �˻��� �� join���� �Ѿ��
  
-- ��������(��������) : �ڽ��� ���̺��� �ڽ��� �÷��� ����..?!
select emp1.employee_id , emp1.first_name,
       emp2.employee_id ���ID, emp2.first_name ����̸�
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id ;

-- �ܺ�����
SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id; -- �� 106��

select * from employees; -- 107��

SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id (+); -- �� 107��


SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name,
       loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
and dep.location_id = loc.location_id; -- �� 106��


SELECT emp.employee_id, emp.first_name,
       dep.department_id, dep.department_name,
       loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
and dep.location_id = loc.location_id(+); -- �� 107�� 
                                          -- ������ ��ġ�����ʾƵ� ����ϱ����ؼ�? ���Ǹ��� (+)�����صα�



