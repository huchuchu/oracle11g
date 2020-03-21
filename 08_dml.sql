/* DML (data manipulation language) 데이타 조작어 
    select , delete , insert , update , 
*/

create table sample (
    deptNo number(20),
    deptName varchar2(15),
    loc varchar2(15),
    depManager varchar2(10)
);

insert into sample (deptNo, deptName, loc, depManager) 
values (10, '경영', '서울', '홍길동');

alter table sample rename COLUMN deptNo to depNo;
alter table sample rename COLUMN deptName to depName;
alter table sample rename COLUMN loc to depLoc;

desc sample;

insert into sample values (30, '영업부', '광주', null);
insert into sample values (20, '전산실', '부산', '김말똥');

commit;
select * from sample;

update sample  set depLoc ='인천' where depNo = 30;
delete  sample where depno = 20;

rollback;

delete sample;







