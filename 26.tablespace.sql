CREATE TABLESPACE test_1
datafile 'C:\Users\sulki\Desktop\OracleSql\test_3.dbf' size 10M
default STORAGE ( initial 60M    -- 최초크기의 extent 는 60M
                  next 10M       -- 그 다음은 10M
                  MINEXTENTS 1   -- 최소 extent갯수 : 1
                  MAXEXTENTS 10  -- 최대 extent갯수 : 10
                  PCTINCREASE 0  -- 퍼센테이지increase : 60M를 다 소진 후 
                                 -- 다음 extent가 생성될 때 pctincrease의 퍼센테이지를 반영하여 
                                 -- 생성됨 만약 pctincrease가 50이라면 10M가 생성되는게 아닌 
                                 -- 10의 50%인 5M가 생성됨                 
                  );
                  
alter TABLESPACE test_1
    add datafile 'C:\Users\sulki\Desktop\OracleSql\test_2.dbf' size 10M;

create table aaa
(
    name varchar2(10)
)
TABLESPACE test_1;


drop TABLESPACE test_1
INCLUDING CONTENTS  -- 안에있는 컨텐츠도 지울지 선택하는 옵션
and DATAFILES;      -- 경로에 생성된 data파일도 같이 지울지 선택하는 옵션

-- size 자동 조정
alter tablespace test_1
add datafile 'C:\Users\sulki\Desktop\OracleSql\test_4.dbf' size 10M --test_4.dbf 의 size를 10M로 지정하지만
autoExtend on  -- 10M가 모자라다면 증가시킬 수 있다
next 2M        -- 2M씩
maxsize 200M;  -- 최대 200M까지
               -- 따라서 test_1에서 사용할 수 있는 최대 size는 210M
               
-- DBA가 size 수동 조정
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

-- extent 수집 (coalesced)
--alter tablespace 이름 coalesce;

