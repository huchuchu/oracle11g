/* group by �� */

-- distinct�� �ߺ�����
select distinct department_id from employees;

-- group by�� ��� ���
select department_id from employees group by department_id;

-- �μ��� �޿� �հ�
select department_id, sum(salary) from employees group by department_id;
select distnict department_id, sum(salary) from employees; -- ����

-- �μ��� �޿� �հ� �ο��� ���
select department_id , sum(salary), count(salary), trunc(avg(salary),2) from employees group by department_id;
-- �μ���, ���޺� ������� ��� �޿� 
select department_id , job_id,sum(salary), count(salary), trunc(avg(salary),2) from employees group by department_id, job_id;

-- order by �߰�
select department_id , job_id,sum(salary), count(salary), trunc(avg(salary),2) 
from employees 
group by department_id, job_id 
order by department_id, job_id;

select department_id, job_id, 
to_char(sum(salary), '999,999') �ѱ޿�,  -- ������ ������ �� �ִ�!!!
to_char(avg(salary), '999,999') ��ձ޿�
from employees
where department_id = 80 
GROUP by department_id, job_id
order by department_id, job_id;


/* HAVING() �� */
 
 -- �μ��� �����
 select department_id, count(*)  from employees 
 where department_id is not null
 GROUP by department_id;

-- ������� 10�� �̻��� �μ�
--(1) ����
 select department_id, count(*)  from employees 
 where department_id is not null
         and count(*)>10          -- where �������� �����Լ��� ����� �� ����
 GROUP by department_id;  

--(2) having ��� (������ group by �� �ڿ� ��������� �տ��ͼ� ���������)
 select department_id, count(*)  from employees 
 where department_id is not null       
 GROUP by department_id
 having count(*) >= 10 ;  
 
 /* rollup() �׷캰 �հ� ������ �߰��ؼ� ������ */
 SELECT l.city, d.department_name, e.job_id,
 count(*) �����, sum(e.salary) �ѱ޿� 
 from employees e, departments d, locations l
 where e.department_id = d.department_id
   and d.location_id = l.location_id
   group by ROLLUP( l.city, d.department_name, e.job_id) -- �μ��� �հ�(�ο���/�޿�)�� ��µȴ�
   order by l.city, d.department_name, e.job_id;
    
 
 