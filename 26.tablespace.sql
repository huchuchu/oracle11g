CREATE TABLESPACE test_1
datafile 'C:\Users\sulki\Desktop\OracleSql\test_3.dbf' size 10M
default STORAGE ( initial 60M
                  next 10M
                  MINEXTENTS 1
                  MAXEXTENTS 10
                  PCTINCREASE 0
                  );
                  
alter TABLESPACE test_1
    add datafile 'C:\Users\sulki\Desktop\OracleSql\test_2.dbf' size 10M;

create table aaa
(
    name varchar2(10)
)
TABLESPACE test_1;


drop TABLESPACE test_1
INCLUDING CONTENTS  and DATAFILES;

