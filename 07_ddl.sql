/* DDL(data definition langeage :: creat, drop, alter, truncate */

-- varchar : 크기를 20으로 잡아도 4만큼 데이터 지정하면 크기가 4로 변경된다
-- char : 크기를 20으로 잡으면 변경되지않고 쭉 20

DESC employees; --테이블의 구조 
DESC member;

CREATE TABLE  employee2(
    employee_id number(10),
    name varchar2(20),
    salary number(7,2) -- 크기 7만큼 and 소숫점 두자리까지

);

desc employee2;

create table employee3 
as 
select * from employee2;  -- 같은테이블로 동일하게 만들겠다

-- alter 테이블의 무엇인가를 변경할 때
--컬럼추가
alter table employee2 add (
    manager_id varchar2(10)
);

-- 수정
alter table employee2 modify (
    manager_id varchar2(20)
);

-- 컬럼삭제
alter table employee2 drop column manager_id;

/* 문자형 데이터 */
-- char : 고정크기, 최대크기 : 2000byte
-- varchar : 가변크기(입력된 문자 수 만큼)
-- nchar  : 고정크기, 유니코드 형태의 문자형 데이터 최대 200byte
-- nvachar : 가변크기 , 유니코드 형태의 문자형 데이터 최대 200byte
-- long(2GB) : 가변크기

--drop : 테이블의 구조를 삭제
drop table employee2;

-- reaname : 테이블 이름 변경
rename member to member1;

-- truncat : 테이블 내의 모든 레코드 삭제
truncate table employee3;
select * from employee3;


