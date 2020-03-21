/* 컬럼속성(무결성 제약조건)
    not null : 널값 입력되지 못하게 하는 조건
    unique : 중복된값이 입력되지 못하게, null 허용
    primary key : not nul + unique :: 유일성보장
    foreign key : 외래키, 다른 테이블의 필드(컬럼)를 참조하여 무결성을 검사 (자식테이블이 부모테이블을 참조)
    check : 주어진 값만 허용하는 조건
*/

/* not null */
create table null_test(
    col1 varchar2(20) not null,
    col2 varchar2(20) null,
    col3 varchar2(20) -- 기본적으로 null 허용
);

insert into null_test(col1, col2) values('aa', 'bb');
select * from null_test;

insert into null_test(col2, col3) values('cc', 'dd');-- 에러
--> ORA-01400: cannot insert NULL into ("HR"."NULL_TEST"."COL1")

/* unique */
create table unique_test(
    col1 varchar2(20) unique not null,    
    col2 varchar2(20) unique,
    col3 varchar2(20) not null,
    col4 varchar2(20) not null,
    constraints tmep_unique unique (col1, col4) -- constraints : 제약을 걸겠다라는 명령어
                                                -- col1 과 col4의 값을 조합했을 때 결과값이 unique해야한다?! 
);

insert into unique_test (col1, col2, col3, col4)
values ('aa', 'bb', 'cc', 'dd');
insert into unique_test (col1, col2, col3, col4)
values ('a2', 'b2', 'c2', 'd2');

select * from unique_test;

update unique_Test set col1 = 'aa' where col2 = 'b2'; --오류
--> ORA-00001: unique constraint (HR.SYS_C008993) violated

insert into unique_test 
values ('a3', '', 'c3', 'd3');

insert into unique_test 
values ('a4', '', 'c4', 'd4'); -- null은 값이 없기때문에 unique 비교대상에서 제외된다

-- 컬럼 제약조건 추가
alter table unique_test add unique (col3); 

desc unique_test;

/* primary key */

create table primary_test(
    student_id number(10) primary key, -- 1) 인라인방식 (pk이름을 생략했기때문에 오라클에서 자동으로 지어줌 보통 sys~ 로지정)                                      
    name varchar2(20)
    constraints student_pk primary key(student_id) -- 2) 아웃라인 방식
);

-- 3) 테이블 생성 후 제약조건 생성
alter table primary_test
add constraints std_pk primary key (student_id);

/* foreign key */
-- 부모테이블이 만들어져있어야 자식테이블을 생성할 수 있다

-- 1) 인라인 방식
create table foreign_key(
    department_id constraints dept_fk
    references departments (department_id)
);

--2) 아웃라인 방식
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

insert into check_Test values('남자');
-->ORA-02290: check constraint (HR.CHECK_GENDER) violated

insert into check_Test values('F');

