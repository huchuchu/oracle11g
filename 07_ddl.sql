/* DDL(data definition langeage :: creat, drop, alter, truncate */

-- varchar : ũ�⸦ 20���� ��Ƶ� 4��ŭ ������ �����ϸ� ũ�Ⱑ 4�� ����ȴ�
-- char : ũ�⸦ 20���� ������ ��������ʰ� �� 20

DESC employees; --���̺��� ���� 
DESC member;

CREATE TABLE  employee2(
    employee_id number(10),
    name varchar2(20),
    salary number(7,2) -- ũ�� 7��ŭ and �Ҽ��� ���ڸ�����

);

desc employee2;

create table employee3 
as 
select * from employee2;  -- �������̺�� �����ϰ� ����ڴ�

-- alter ���̺��� �����ΰ��� ������ ��
--�÷��߰�
alter table employee2 add (
    manager_id varchar2(10)
);

-- ����
alter table employee2 modify (
    manager_id varchar2(20)
);

-- �÷�����
alter table employee2 drop column manager_id;

/* ������ ������ */
-- char : ����ũ��, �ִ�ũ�� : 2000byte
-- varchar : ����ũ��(�Էµ� ���� �� ��ŭ)
-- nchar  : ����ũ��, �����ڵ� ������ ������ ������ �ִ� 200byte
-- nvachar : ����ũ�� , �����ڵ� ������ ������ ������ �ִ� 200byte
-- long(2GB) : ����ũ��

--drop : ���̺��� ������ ����
drop table employee2;

-- reaname : ���̺� �̸� ����
rename member to member1;

-- truncat : ���̺� ���� ��� ���ڵ� ����
truncate table employee3;
select * from employee3;


