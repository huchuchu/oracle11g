set serveroutput on;

create table sample_dept (
    dept_id number,
    dept_name varchar2(15),
    loc varchar2(10)
);

create or replace trigger print_msg
after insert on sample_dept
begin
    dbms_output.put_line('�μ��� �߰��Ǿ����ϴ�');
end;
/

insert into sample_dept values (10, '�����ú�', '����');


--[ 2 ]
create table item (
    code char(6) primary key, --��ǰ�ڵ�
    name varchar2(15) not null, --��ǰ�̸�
    company varchar2(15) not null, --��ǰȸ��
    price number(8), --��ǰ����
    cnt number default 0 --����
);

create table warehouse (
    num number(6) primary key, --�԰��ȣ
    code char(6) references item(code),
    indate date default sysdate, --�԰�¥
    incnt number(6), --�԰����
    inprice number(6), --�ܰ�
    totalprice number(8) --�Ѽ��� 
);

-- warehouse�� �԰�� ��ǰ�� ����ϸ� item�� ������ �ڵ����� ����ǰ�

insert into item(code, name, company, price) values ('c001', '������', '�Ｚ', 1000000);
insert into item(code, name, company, price) values ('c002', '��ǳ��', '����', 50000);

select * from item;

--�������� ����(����)�ϱ����� Ʈ���� ���� 
-- new ������ insert��, update�������� ��� ����
create or replace trigger cnt_add
after insert on warehouse
    for each row
begin
        update item set cnt = cnt + :new.incnt
        where code =:new.code;
end;
/

insert into warehouse (num, code, incnt, inprice, totalprice) 
values (1, 'c001', 10, 900000, 9000000);

select * from item;

-- delte�� ���� old������ ����Ѵ�
create or replace trigger cnt_sub
after delete on warehouse
for each row
begin
    update item set cnt = cnt - :old.incnt
    where code = :old.code;
end;
/

delete from warehouse where code = 'c001';

select * from item;

-- insert�� delete�� ������ �ƴ� update�̱⶧���� ���� cnt - ���� cnt + new cnt�ؼ� update ���ִ� ����....!!
create or replace trigger cnt_update
after update on warehouse
for each row
begin
    update item set cnt = cnt +- :old.incnt +:new.incnt
    where code = :new.code;
end;
/


select * from warehouse;
update warehouse set incnt = 7, inprice = 800000 where code= 'c001';
select * from item;
