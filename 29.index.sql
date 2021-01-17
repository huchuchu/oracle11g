-- index

create table emp2 as select * from emp;
create table dept2 as select * from dept;

select rowid, empno, ename from emp2 where empno = 7369;

-- << B-tree index >> : 데이터 값의 종류가 많고 데이터가 적을 경우 주로 사용
-- 1) unique index
create unique index idx_dept2_dname on dept2(dname);

insert into dept2 values(90,'영업부','서울지점' );
insert into dept2(deptno, loc) values(90,'서울지점' );

select * from dept2;

-- 2) non unique
create index inx_emp2_ename on emp2(ename);

insert into emp2 (empno, ename) VALUES (8000, '홍길동');

select * from emp2;


-- FBI : 함수기반 index

create index idx_sal_fbi on emp(sal);
select ename from emp where sal+200 = 1000; -- 이 조건에서는  sal 인덱스를 사용하지 않은 조건
                                            -- 위 현상을 index suppressing error
create index idx_sal_fbi1 on emp(sal+200); 
select ename from emp where sal + 200 = 1000;-- 이 조건에 맞는 인덱스 사용 

-- descending 인덱스 : 내림차수 인덱스를 생성하는것 

create index idx_desc on emp2(hiredate desc);
select * from emp2;                          -- 인덱스를 사용 x
select * from emp2 where hiredate < sysdate; -- 인덱스를 생성했기때문에 자동정렬

-- 결합인덱스(composit 인덱스) : 인덱스를 생성할 때 두개 이상의 컬럼을 합쳐서 인덱스를 만드는것
select ename, job , deptno from emp2 where job = 'MANAGER' and deptno = 20;

create index idx_job_deptno on emp2(deptno, job); -- 결합의 순서가 매우 중요하다
drop index idx_job_deptno;

select * from emp2 ;
select * from emp2 where job  > '0' and deptno > 0;

-- << Bitmap 인덱스 >> : 데이터 값이 종류가 적고 동일한 데이터가 많은 경우에 주로 사용
-- 해당 데이터가 있는 자리만 1로 표시 나머지 행은 0으로 표시
/* 형식
create bitmap index 인덱스명
on 테이블명(컬럼명) 
*/

--<< 딕셔너리 >>
-- index 조회
select * from user_indexes where table_name = 'DEPT2';

-- index rebuild : 인덱스 생성 후 영구적으로 좋은 성능을 가질 수 없기때문에 항상 관리를 해주어야한다
-- 그 방법이 rebuild

create table test_rebuild 
(no number);

begin

    for i in 1..1000 loop
        insert into test_rebuild values (i);
    end loop;
end ;
/
commit;

select * from test_rebuild; -- test_rebuild 테이블에 데이터 1000개를 넣어줌

create index idx_test on test_rebuild(no); -- 인덱스 생성

-- 인덱스의 상태를 조회하기위한 명령어 
analyze index idx_test validate structure;

select (del_lf_rows_len/lf_rows_len)*100 val -- 데이터의 개입?이없었기때문에 val = 0
from index_stats;

delete from test_rebuild where no BETWEEN 1 and 400; -- 400개 지움

select count(*) from test_rebuild; -- 400개를 지웠기때문에 600개만 나온다

analyze index idx_test validate structure; -- 인덱스의 상태 분석

select (del_lf_rows_len/lf_rows_len)*100 val from index_stats; 
-- delte 명령어를 실행해도 index에서는 사용하지않는다는 상태값만 변경되기때문에 val = 0

-- rebuild
alter index idx_test rebuild; -- index rebuild

analyze index idx_test validate structure; -- index 분석
select (del_lf_rows_len/lf_rows_len)*100 val from index_stats; -- rebuild 했기때문에 val = 0

/*
인덱스 활용 예
*/

create table emp3 
(
no number,
name varchar2(10),
salary number
);

insert into emp3 values(1, '강호동' , 200);
insert into emp3 values(2, '이경규' , 300);
insert into emp3 values(3, '이경실' , 100);
insert into emp3 values(4, '유재석' , 400);
insert into emp3 values(5, '홍길동' , 150);
insert into emp3 values(6, '정형돈' , 250);

select * from emp3;

create index idx_name
on emp3(name);

-- 인덱스를 활용하여 정렬
select name from emp3 where name>'0';


-- 인덱스 활용하여 최대값 최소값

select min(name) from emp3; -- 인덱스 사용하지않아서 정렬필요

select name from emp3
where name > '0'     -- 인덱스를 사용하고
and rownum = 1;      -- 가장 작은 값

select max(name) from emp3; -- 정력발생

-- hint 사용 : 데이터베이스에는 실행계획이 있다. hint를 사용하여 사용자가 실행계획에 개입
select /*+ index_desc(emp3 idx_name)*/ name
from emp3
where name > '0'
and rownum = 1;

-- first_row max 방법
select /*+ index_desc(emp3 idx_name)*/ max(name)
from emp3
where name > '0';
--and rownum = 1;

-- invisible 인덱스 : 인덱스를 삭제하기 전에 사용안함 상태로 만들어 테스트 할 수 있는 기능

create index idx_sal 
on emp3(salary);

select table_name, index_name, visibility
from user_indexes
where table_name= 'EMP3';

-- 인덱스를 보이지않는 상태로 바꿔서 실제 실행계획을 세울 때 없는 상태로 세운다
alter index idx_sal invisible;

-- 인덱스를 다시 visible 상태로 변경
alter index idx_sal visible;




