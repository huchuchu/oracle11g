/* DML (data manipulation language) ����Ÿ ���۾� 
    select , delete , insert , update , 
*/

create table sample (
    deptNo number(20),
    deptName varchar2(15),
    loc varchar2(15),
    depManager varchar2(10)
);

insert into sample (deptNo, deptName, loc, depManager) 
values (10, '�濵', '����', 'ȫ�浿');

alter table sample rename COLUMN deptNo to depNo;
alter table sample rename COLUMN deptName to depName;
alter table sample rename COLUMN loc to depLoc;

desc sample;

insert into sample values (30, '������', '����', null);
insert into sample values (20, '�����', '�λ�', '�踻��');

commit;
select * from sample;

update sample  set depLoc ='��õ' where depNo = 30;
delete  sample where depno = 20;

rollback;

delete sample;







