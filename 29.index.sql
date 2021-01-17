-- index

create table emp2 as select * from emp;
create table dept2 as select * from dept;

select rowid, empno, ename from emp2 where empno = 7369;

-- << B-tree index >> : ������ ���� ������ ���� �����Ͱ� ���� ��� �ַ� ���
-- 1) unique index
create unique index idx_dept2_dname on dept2(dname);

insert into dept2 values(90,'������','��������' );
insert into dept2(deptno, loc) values(90,'��������' );

select * from dept2;

-- 2) non unique
create index inx_emp2_ename on emp2(ename);

insert into emp2 (empno, ename) VALUES (8000, 'ȫ�浿');

select * from emp2;


-- FBI : �Լ���� index

create index idx_sal_fbi on emp(sal);
select ename from emp where sal+200 = 1000; -- �� ���ǿ�����  sal �ε����� ������� ���� ����
                                            -- �� ������ index suppressing error
create index idx_sal_fbi1 on emp(sal+200); 
select ename from emp where sal + 200 = 1000;-- �� ���ǿ� �´� �ε��� ��� 

-- descending �ε��� : �������� �ε����� �����ϴ°� 

create index idx_desc on emp2(hiredate desc);
select * from emp2;                          -- �ε����� ��� x
select * from emp2 where hiredate < sysdate; -- �ε����� �����߱⶧���� �ڵ�����

-- �����ε���(composit �ε���) : �ε����� ������ �� �ΰ� �̻��� �÷��� ���ļ� �ε����� ����°�
select ename, job , deptno from emp2 where job = 'MANAGER' and deptno = 20;

create index idx_job_deptno on emp2(deptno, job); -- ������ ������ �ſ� �߿��ϴ�
drop index idx_job_deptno;

select * from emp2 ;
select * from emp2 where job  > '0' and deptno > 0;

-- << Bitmap �ε��� >> : ������ ���� ������ ���� ������ �����Ͱ� ���� ��쿡 �ַ� ���
-- �ش� �����Ͱ� �ִ� �ڸ��� 1�� ǥ�� ������ ���� 0���� ǥ��
/* ����
create bitmap index �ε�����
on ���̺��(�÷���) 
*/

--<< ��ųʸ� >>
-- index ��ȸ
select * from user_indexes where table_name = 'DEPT2';

-- index rebuild : �ε��� ���� �� ���������� ���� ������ ���� �� ���⶧���� �׻� ������ ���־���Ѵ�
-- �� ����� rebuild

create table test_rebuild 
(no number);

begin

    for i in 1..1000 loop
        insert into test_rebuild values (i);
    end loop;
end ;
/
commit;

select * from test_rebuild; -- test_rebuild ���̺� ������ 1000���� �־���

create index idx_test on test_rebuild(no); -- �ε��� ����

-- �ε����� ���¸� ��ȸ�ϱ����� ��ɾ� 
analyze index idx_test validate structure;

select (del_lf_rows_len/lf_rows_len)*100 val -- �������� ����?�̾����⶧���� val = 0
from index_stats;

delete from test_rebuild where no BETWEEN 1 and 400; -- 400�� ����

select count(*) from test_rebuild; -- 400���� �����⶧���� 600���� ���´�

analyze index idx_test validate structure; -- �ε����� ���� �м�

select (del_lf_rows_len/lf_rows_len)*100 val from index_stats; 
-- delte ��ɾ �����ص� index������ ��������ʴ´ٴ� ���°��� ����Ǳ⶧���� val = 0

-- rebuild
alter index idx_test rebuild; -- index rebuild

analyze index idx_test validate structure; -- index �м�
select (del_lf_rows_len/lf_rows_len)*100 val from index_stats; -- rebuild �߱⶧���� val = 0

/*
�ε��� Ȱ�� ��
*/

create table emp3 
(
no number,
name varchar2(10),
salary number
);

insert into emp3 values(1, '��ȣ��' , 200);
insert into emp3 values(2, '�̰��' , 300);
insert into emp3 values(3, '�̰��' , 100);
insert into emp3 values(4, '���缮' , 400);
insert into emp3 values(5, 'ȫ�浿' , 150);
insert into emp3 values(6, '������' , 250);

select * from emp3;

create index idx_name
on emp3(name);

-- �ε����� Ȱ���Ͽ� ����
select name from emp3 where name>'0';


-- �ε��� Ȱ���Ͽ� �ִ밪 �ּҰ�

select min(name) from emp3; -- �ε��� ��������ʾƼ� �����ʿ�

select name from emp3
where name > '0'     -- �ε����� ����ϰ�
and rownum = 1;      -- ���� ���� ��

select max(name) from emp3; -- ���¹߻�

-- hint ��� : �����ͺ��̽����� �����ȹ�� �ִ�. hint�� ����Ͽ� ����ڰ� �����ȹ�� ����
select /*+ index_desc(emp3 idx_name)*/ name
from emp3
where name > '0'
and rownum = 1;

-- first_row max ���
select /*+ index_desc(emp3 idx_name)*/ max(name)
from emp3
where name > '0';
--and rownum = 1;

-- invisible �ε��� : �ε����� �����ϱ� ���� ������ ���·� ����� �׽�Ʈ �� �� �ִ� ���

create index idx_sal 
on emp3(salary);

select table_name, index_name, visibility
from user_indexes
where table_name= 'EMP3';

-- �ε����� �������ʴ� ���·� �ٲ㼭 ���� �����ȹ�� ���� �� ���� ���·� �����
alter index idx_sal invisible;

-- �ε����� �ٽ� visible ���·� ����
alter index idx_sal visible;




