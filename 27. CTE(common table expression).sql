/*
WHIT���� CTE(Common Table Expression)�� ǥ���ϱ����� �����̴�.
CTE�� ������ ��, �Ļ����̺�, �ӽ����̺� ������ ���Ǵ� ���� ����� �� ������, �� ������ ������ �������� ������ �ִ�

CTE�� �������(Non-Recusive)CTE, �����(Recucive)CTE �ΰ����� �ִ�
*/

--[1] �������CTE

with abc(userid  , total)
as
(select userid, sum(amount*price) from buytbl group by userid) 
select userid "�����", total "�ѱݾ�" from abc ORDER by total desc;


with def (addr, height) 
as
( select addr,max(height) from usertbl group by addr)
select avg(height) "�ְ� Ű ���" from def;

-- BBB�� AAA�� ������ �� �ְ�, CCC�� AAA�� BBB�� ������ �� ������, AAA�� BBB�� CCC��� ������ �� ����(���ǵ����ʾұ⶧����)
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


--[2] �����CTE
CREATE TABLE ernpTbl (emp NCHAR(3), manager NCHAR(3), department NCHAR(3)); 
alter table ernpTbl rename to empTbl;

INSERT INTO empTbl VALUES('������' , '����' , '����');
INSERT INTO empTbl VALUES('���繫' , '������' , '�繫��');
INSERT INTO empTbl VALUES('�����' , '���繫' , '�繫��');
INSERT INTO empTbl VALUES('�̺���' , '���繫' , '�繫��');
INSERT INTO empTbl VALUES('��븮' , '�̺���' , '�繫��');
INSERT INTO empTbl VALUES('�����' , '�̺���' , '�繫��');
INSERT INTO empTbl VALUES('�̿���' , '������' , '������');
INSERT INTO empTbl VALUES('�Ѱ���' , '�̿���' , '������');
INSERT INTO empTbl VALUES('������' , '������' , '������');
INSERT INTO empTbl VALUES('������' , '������' , '������');
INSERT INTO empTbl VALUES('������' , '������' , '������' ); 

select * from emptbl;

delete emptbl;
commit;


with empCTE(empname, mgrName, dept, empLevel)
as
(
    (select emp, manager, department, 0 from emptbl where manager = '����')
    union all
    (select emptbl.emp, emptbl.manager, emptbl.department, empCTE.empLevel+1 from emptbl 
    inner join empCTE on emptbl.manager = empCTE.empName)
)
select* from empCTE order by dept, empLevel;
    
-- merge���� �ϳ��� ���忡�� ��쿡 ���� insert, update, delete �� ������ �� �ִ� �����̴�

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

INSERT INTO changeTBL VALUES('TKV', '�±Ǻ���', '�ѱ�', '�ű԰���');
INSERT INTO changeTBL VALUES('LSG', null, '����', '�ּҺ���');
INSERT INTO changeTBL VALUES('LJB', null, '����', '�ּҺ���');
INSERT INTO changeTBL VALUES('BBK', null, 'Ż��', 'ȸ��Ż��');
INSERT INTO changeTBL VALUES('SSK', null, 'Ż��', 'ȸ��Ż��');

commit;

select * from changetbl;

merge into membertbl M -- target ���̺�(���� ��� ���̺�)
-- source ���̺� (������ ������ �Ǵ� ���̺�)
using (select changetype, userid, username, addr from changetbl) C
on (M.userid = C.userid) -- userid�� �������� �� ���̺��� ���Ѵ�
-- target���̺� source ���̺��� ���� ������ �ּҸ� �����Ѵ�
when matched then
    update set M.addr = C.addr
    -- target ���̺� source ���̺��� ���� �ְ�, ������ 'ȸ��Ż��'��� ���� �����Ѵ�
    delete where C.changetype = 'ȸ��Ż��'
-- target ���̺� source ���̺��� ���� ������ ���ο� ���� �߰��Ѵ�
when not matched then
    insert (userid, username, addr) values (C.userid, C.username, C.addr);
    
commit;


select * from memberTBL;


select rowid, username from usertbl;

