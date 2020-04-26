set serveroutput on;

create table sample_dept (
    dept_id number,
    dept_name varchar2(15),
    loc varchar2(10)
);

create or replace trigger print_msg
after insert on sample_dept
begin
    dbms_output.put_line('부서가 추가되었습니다');
end;
/

insert into sample_dept values (10, '마케팅부', '서울');


--[ 2 ]
create table item (
    code char(6) primary key, --물품코드
    name varchar2(15) not null, --물품이름
    company varchar2(15) not null, --물품회사
    price number(8), --물품가격
    cnt number default 0 --수량
);

create table warehouse (
    num number(6) primary key, --입고번호
    code char(6) references item(code),
    indate date default sysdate, --입고날짜
    incnt number(6), --입고수량
    inprice number(6), --단가
    totalprice number(8) --총수량 
);

-- warehouse에 입고된 물품을 기록하면 item의 수량이 자동으로 변경되게

insert into item(code, name, company, price) values ('c001', '에어컨', '삼성', 1000000);
insert into item(code, name, company, price) values ('c002', '선풍기', '엘지', 50000);

select * from item;

--재고수량을 갱신(변경)하기위한 트리거 생성 
-- new 선언은 insert문, update문에서만 사용 가능
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

-- delte할 때는 old선언을 사용한다
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

-- insert나 delete의 개념이 아닌 update이기때문에 기존 cnt - 기존 cnt + new cnt해서 update 해주는 개념....!!
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
