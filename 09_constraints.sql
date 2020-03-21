/* �÷��Ӽ�(���Ἲ ��������)
    not null : �ΰ� �Էµ��� ���ϰ� �ϴ� ����
    unique : �ߺ��Ȱ��� �Էµ��� ���ϰ�, null ���
    primary key : not nul + unique :: ���ϼ�����
    foreign key : �ܷ�Ű, �ٸ� ���̺��� �ʵ�(�÷�)�� �����Ͽ� ���Ἲ�� �˻� (�ڽ����̺��� �θ����̺��� ����)
    check : �־��� ���� ����ϴ� ����
*/

/* not null */
create table null_test(
    col1 varchar2(20) not null,
    col2 varchar2(20) null,
    col3 varchar2(20) -- �⺻������ null ���
);

insert into null_test(col1, col2) values('aa', 'bb');
select * from null_test;

insert into null_test(col2, col3) values('cc', 'dd');-- ����
--> ORA-01400: cannot insert NULL into ("HR"."NULL_TEST"."COL1")

/* unique */
create table unique_test(
    col1 varchar2(20) unique not null,    
    col2 varchar2(20) unique,
    col3 varchar2(20) not null,
    col4 varchar2(20) not null,
    constraints tmep_unique unique (col1, col4) -- constraints : ������ �ɰڴٶ�� ��ɾ�
                                                -- col1 �� col4�� ���� �������� �� ������� unique�ؾ��Ѵ�?! 
);

insert into unique_test (col1, col2, col3, col4)
values ('aa', 'bb', 'cc', 'dd');
insert into unique_test (col1, col2, col3, col4)
values ('a2', 'b2', 'c2', 'd2');

select * from unique_test;

update unique_Test set col1 = 'aa' where col2 = 'b2'; --����
--> ORA-00001: unique constraint (HR.SYS_C008993) violated

insert into unique_test 
values ('a3', '', 'c3', 'd3');

insert into unique_test 
values ('a4', '', 'c4', 'd4'); -- null�� ���� ���⶧���� unique �񱳴�󿡼� ���ܵȴ�

-- �÷� �������� �߰�
alter table unique_test add unique (col3); 

desc unique_test;

/* primary key */

create table primary_test(
    student_id number(10) primary key, -- 1) �ζ��ι�� (pk�̸��� �����߱⶧���� ����Ŭ���� �ڵ����� ������ ���� sys~ ������)                                      
    name varchar2(20)
    constraints student_pk primary key(student_id) -- 2) �ƿ����� ���
);

-- 3) ���̺� ���� �� �������� ����
alter table primary_test
add constraints std_pk primary key (student_id);

/* foreign key */
-- �θ����̺��� ��������־�� �ڽ����̺��� ������ �� �ִ�

-- 1) �ζ��� ���
create table foreign_key(
    department_id constraints dept_fk
    references departments (department_id)
);

--2) �ƿ����� ���
create table foreign_key2(
    department_id,
    constraints dept_fk2 
    foreign key (department_id)
    references departments (department_id)
    on delete set null
);

create table foreign_key3(
department_id number(4)
);

alter table foreign_key3 
add constraints dept_fk3 foreign key (department_id)
references departments (department_id);

select * from foreign_key;

/* check */

create table check_test(
    gender varchar2(10) not null
    constraints check_gender check ( gender in ('M', 'F'))
);

insert into check_Test values('����');
-->ORA-02290: check constraint (HR.CHECK_GENDER) violated

insert into check_Test values('F');

