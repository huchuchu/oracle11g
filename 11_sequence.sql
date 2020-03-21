/* ������ : �������� ��ȣ�� ������ִ� ���
    create sequence �������̸�
    increment by n : �������� ���� ex) n�� 1�̸� 1�� ���� / �⺻���� 1
    start with n : ���۰� ���� / �⺻���� 1
    maxvalue n | nomaxvalue : ������ �ִ밪
    minvalue n | nominvalue : ������ �ּҰ� : cycle �ɼ��� ��� ���۰�
    cycle | nocycle : �������� ��ȯ ����� �� ����
    cache n | nocache : �������� �ӵ��� �����ϱ����� ĳ�̿��� ����
        
*/

--1) ������ ���� : ��ǰ��ȣ�� �����ϴ� ������ �����
create sequence seq_serial_no 
increment by 1
start with 100
maxvalue 110
minvalue 99
cycle
cache 2;

create table good(
    good_no number(3),
    good_name varchar2(10)
);

insert into good 
values(seq_serial_no.nextval, '��ǰ1'); -- ���� 100�� ��µƴµ� �ΰ��� 101�� ��µ�..����..-_-

select * from good;

insert into good values(seq_serial_no.currval, '��ǰ1'); 
insert into good values(seq_serial_no.nextval, '��ǰ2');

-- �������̸�.currval : ������ ���簪
-- �������̸�.nextval : ���� ������ ��

select seq_serial_no.currval from dual;

-- ������ 110������ ��� �����ϸ� 99������ �ٽ� ���ư� <-- cycle ��ɾ�� ��ȯ�� �����ϰ� �߱⶧����!

create table good2(
    good_no number(3),
    good_name varchar2(10)
);

create sequence seq_serial_no2 
increment by 1
start with 100
maxvalue 105
cache 2;

insert into good2 values(seq_serial_no2.nextval, '��ǰ1');
commit;

select * from good2;

-- ������ ���� : drop sequence ��������
-- ���̳ʽ����� ����Ͽ� �������� ���� ���ϼ����ִ�!





