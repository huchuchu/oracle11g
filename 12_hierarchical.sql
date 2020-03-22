/* 계층형 쿼리 : 오라클에서만 제공! */

create table bom_sphone(
    item_id number(3) not null,
    parent_id number(3),
    item_name varchar2(20) not null,
    primary key(item_id)
);

insert into bom_sphone values(100, null, '스마트폰');
insert into bom_sphone values(101, 100, '메인pcb');
insert into bom_sphone values(102, 100, '배터리');
insert into bom_sphone values(103, 101, 'cpu');
insert into bom_sphone values(104, 101, '메모리');
insert into bom_sphone values(105, 101,'블루투스');

select * from bom_sphone;

-- self join :: 계층적으로는 보이지않음
select s1.item_id,s1.item_name, s2.item_name parent_name
from bom_sphone s1, bom_sphone s2
where s1.parent_id = s2.item_id (+)
order by s1.item_id;

-- start with , connect by 절을 이용한 계층형 쿼리
select lpad(' ', 2*(level -1)) || item_name itemnames
from bom_sphone
start with parent_id is null
connect by prior item_id = parent_id; -- prior: 부모의 노드를 찾아서 connect 하는것! 
--connect by parent_id = prior item_id ; -- 이렇게도 사용가능!
-- join을 이용해서도 여러가지 응용해볼 수 있다!... 예제도 주면 좋을텐데

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








