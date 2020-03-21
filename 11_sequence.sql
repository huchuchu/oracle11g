/* 시퀀스 : 연속적인 번호를 만들어주는 기능
    create sequence 시퀀스이름
    increment by n : 증가값을 설정 ex) n이 1이면 1씩 증가 / 기본값은 1
    start with n : 시작값 설정 / 기본값은 1
    maxvalue n | nomaxvalue : 시퀀스 최대값
    minvalue n | nominvalue : 시퀀스 최소값 : cycle 옵션일 경우 시작값
    cycle | nocycle : 시퀀스를 순환 사용할 지 설정
    cache n | nocache : 시퀀스의 속도를 개선하기위해 캐싱여부 지정
        
*/

--1) 시퀀스 생성 : 제품번호를 생성하는 시퀀스 만들기
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
values(seq_serial_no.nextval, '제품1'); -- 나는 100번 출력됐는데 인강은 101번 출력됨..뭐지..-_-

select * from good;

insert into good values(seq_serial_no.currval, '제품1'); 
insert into good values(seq_serial_no.nextval, '제품2');

-- 시퀀스이름.currval : 시퀀스 현재값
-- 시퀀스이름.nextval : 다음 시퀀스 값

select seq_serial_no.currval from dual;

-- 시퀀스 110번까지 모두 소진하면 99번으로 다시 돌아감 <-- cycle 명령어로 순환을 가능하게 했기때문에!

create table good2(
    good_no number(3),
    good_name varchar2(10)
);

create sequence seq_serial_no2 
increment by 1
start with 100
maxvalue 105
cache 2;

insert into good2 values(seq_serial_no2.nextval, '제품1');
commit;

select * from good2;

-- 시퀀스 삭제 : drop sequence 시퀀스명
-- 마이너스값을 사용하여 시퀀스의 값을 줄일수도있다!





