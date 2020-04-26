CREATE TABLESPACE test_1
datafile 'C:\Users\sulki\Desktop\OracleSql\test_3.dbf' size 10M
default STORAGE ( initial 60M    -- ����ũ���� extent �� 60M
                  next 10M       -- �� ������ 10M
                  MINEXTENTS 1   -- �ּ� extent���� : 1
                  MAXEXTENTS 10  -- �ִ� extent���� : 10
                  PCTINCREASE 0  -- �ۼ�������increase : 60M�� �� ���� �� 
                                 -- ���� extent�� ������ �� pctincrease�� �ۼ��������� �ݿ��Ͽ� 
                                 -- ������ ���� pctincrease�� 50�̶�� 10M�� �����Ǵ°� �ƴ� 
                                 -- 10�� 50%�� 5M�� ������                 
                  );
                  
alter TABLESPACE test_1
    add datafile 'C:\Users\sulki\Desktop\OracleSql\test_2.dbf' size 10M;

create table aaa
(
    name varchar2(10)
)
TABLESPACE test_1;


drop TABLESPACE test_1
INCLUDING CONTENTS  -- �ȿ��ִ� �������� ������ �����ϴ� �ɼ�
and DATAFILES;      -- ��ο� ������ data���ϵ� ���� ������ �����ϴ� �ɼ�

-- size �ڵ� ����
alter tablespace test_1
add datafile 'C:\Users\sulki\Desktop\OracleSql\test_4.dbf' size 10M --test_4.dbf �� size�� 10M�� ����������
autoExtend on  -- 10M�� ���ڶ�ٸ� ������ų �� �ִ�
next 2M        -- 2M��
maxsize 200M;  -- �ִ� 200M����
               -- ���� test_1���� ����� �� �ִ� �ִ� size�� 210M
               
-- DBA�� size ���� ����
alter database datafile 'C:\Users\sulki\Desktop\OracleSql\test_3.dbf' resize 30M;


--DICTIONARY
select tablespace_name, initial_extent, next_extent, min_extents, max_extents, pct_increase, status, contents
from DBA_TABLESPACES;

select tablespace_name, file_name, file_id, blocks, status, autoextensible
from DBA_DATA_FILES;

select * from dba_free_space where tablespace_name = 'TEST_1';

select tablespace_name, total_extents, extents_coalesced, percent_extents_coalesced
from DBA_FREE_SPACE_coalesced;

desc DBA_FREE_SPACE_coalesced;

-- extent ���� (coalesced)
--alter tablespace �̸� coalesce;

