/*
WHIT절은 CTE(Common Table Expression)를 표현하기위한 구문이다.
CTE는 기존의 뷰, 파생테이블, 임시테이블 등으로 사용되던 것을 대신할 수 있으며, 더 간결한 식으로 보여지는 장점이 있다

CTE는 비재귀적(Non-Recusive)CTE, 재귀적(Recucive)CTE 두가지가 있다
*/

--[1] 비재귀적CTE

with abc(userid  , total)
as
(select userid, sum(amount*price) from buytbl group by userid) 
select userid "사용자", total "총금액" from abc ORDER by total desc;


with def (addr, height) 
as
( select addr,max(height) from usertbl group by addr)
select avg(height) "최고 키 평균" from def;

-- BBB는 AAA를 참조할 수 있고, CCC는 AAA와 BBB를 참조할 수 있지만, AAA는 BBB와 CCC모두 참조할 수 없다(정의되지않았기때문에)
with
AAA(userid, total)
    as
    (select userid, sum(amount*price) from buytbl group by userid),
BBB(sumtotal)
    as
    (select sum(total) from AAA),
CCC(sumavg)
    as
    (select sumtotal/(select count(*) from buytbl) from BBB) 
select round(sumavg, 2) from CCC;


--[2] 재귀적CTE
CREATE TABLE ernpTbl (emp NCHAR(3), manager NCHAR(3), department NCHAR(3)); 
alter table ernpTbl rename to empTbl;

INSERT INTO empTbl VALUES('나사장' , '없음' , '없음');
INSERT INTO empTbl VALUES('김재무' , '나사장' , '재무부');
INSERT INTO empTbl VALUES('김부장' , '김재무' , '재무부');
INSERT INTO empTbl VALUES('이부장' , '김재무' , '재무부');
INSERT INTO empTbl VALUES('우대리' , '이부장' , '재무부');
INSERT INTO empTbl VALUES('지사원' , '이부장' , '재무부');
INSERT INTO empTbl VALUES('이영업' , '나사장' , '영업부');
INSERT INTO empTbl VALUES('한과장' , '이영업' , '영업부');
INSERT INTO empTbl VALUES('최정보' , '나사장' , '정보부');
INSERT INTO empTbl VALUES('윤차장' , '최정보' , '정보부');
INSERT INTO empTbl VALUES('이주임' , '윤차장' , '정보부' ); 

select * from emptbl;

delete emptbl;
commit;


with empCTE(empname, mgrName, dept, empLevel)
as
(
    (select emp, manager, department, 0 from emptbl where manager = '없음')
    union all
    (select emptbl.emp, emptbl.manager, emptbl.department, empCTE.empLevel+1 from emptbl 
    inner join empCTE on emptbl.manager = empCTE.empName)
)
select* from empCTE order by dept, empLevel;
    
-- merge문은 하나의 문장에서 경우에 따라 insert, update, delete 를 수행할 수 있는 구문이다

create table memberTBL as
(select userid, username, addr from usertbl);

select * from membertbl;

create table changetbl (
userid char(8),
username nvarchar2(10),
addr nchar(2),
changeType nchar(4)
);
commit;

INSERT INTO changeTBL VALUES('TKV', '태권브이', '한국', '신규가입');
INSERT INTO changeTBL VALUES('LSG', null, '제주', '주소변경');
INSERT INTO changeTBL VALUES('LJB', null, '영국', '주소변경');
INSERT INTO changeTBL VALUES('BBK', null, '탈퇴', '회원탈퇴');
INSERT INTO changeTBL VALUES('SSK', null, '탈퇴', '회원탈퇴');

commit;

select * from changetbl;

merge into membertbl M -- target 테이블(변경 대상 테이블)
-- source 테이블 (변경할 기준이 되는 테이블)
using (select changetype, userid, username, addr from changetbl) C
on (M.userid = C.userid) -- userid를 기준으로 두 테이블을 비교한다
-- target테이블에 source 테이블의 행이 있으면 주소를 변경한다
when matched then
    update set M.addr = C.addr
    -- target 테이블에 source 테이블의 행이 있고, 사유가 '회원탈퇴'라면 행을 삭제한다
    delete where C.changetype = '회원탈퇴'
-- target 테이블에 source 테이블의 행이 없으면 새로운 행을 추가한다
when not matched then
    insert (userid, username, addr) values (C.userid, C.username, C.addr);
    
commit;


select * from memberTBL;


select rowid, username from usertbl;

