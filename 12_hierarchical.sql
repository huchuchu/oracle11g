/* ������ ���� : ����Ŭ������ ����! */

create table bom_sphone(
    item_id number(3) not null,
    parent_id number(3),
    item_name varchar2(20) not null,
    primary key(item_id)
);

insert into bom_sphone values(100, null, '����Ʈ��');
insert into bom_sphone values(101, 100, '����pcb');
insert into bom_sphone values(102, 100, '���͸�');
insert into bom_sphone values(103, 101, 'cpu');
insert into bom_sphone values(104, 101, '�޸�');
insert into bom_sphone values(105, 101,'�������');

select * from bom_sphone;

-- self join :: ���������δ� ����������
select s1.item_id,s1.item_name, s2.item_name parent_name
from bom_sphone s1, bom_sphone s2
where s1.parent_id = s2.item_id (+)
order by s1.item_id;

-- start with , connect by ���� �̿��� ������ ����
select lpad(' ', 2*(level -1)) || item_name itemnames
from bom_sphone
start with parent_id is null
connect by prior item_id = parent_id; -- prior: �θ��� ��带 ã�Ƽ� connect �ϴ°�! 
--connect by parent_id = prior item_id ; -- �̷��Ե� ��밡��!
-- join�� �̿��ؼ��� �������� �����غ� �� �ִ�!... ������ �ָ� �����ٵ�

select level, lpad(' ', 4*(level-1)) || first_name || ' ' || last_name 
from employees
start with manager_id is null
connect by manager_id = prior employee_id;

select  jb.job_title,
        lpad(' ', 4*(level-1)) || emp.first_name || ' ' || emp.last_name 
from employees emp, jobs jb
where emp.job_id = jb.job_id
start with emp.manager_id is null
connect by emp.manager_id = prior emp.employee_id;








