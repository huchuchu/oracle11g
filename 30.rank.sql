/*
�м��Լ� : �����͸� �м��ϴ� ����� ���� �Լ�
�����Լ� : rank(), dense_rank(), row_number()
          first, last�� ����� �м���

�м��Լ��� ����ϱ����� ���� ����
�м��Լ� (p1,p2,...)
over (partition by, order by)
*/

--rank()
-- �޿��� ����
select employee_id, salary,rank() over( order by salary desc) ranking_sal  from employees;