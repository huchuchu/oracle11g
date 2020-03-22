/* PL/SQL (procedual language /SQL) */

declare  
    cnt integer;  -- 변수선언
begin
    cnt := cnt+1;  -- 변수에 값 넣을 때 = 가 아니라 := 사용!!
    if cnt is null then 
        dbms_output.put_line('결과 : cnt는 널이다');
    end if;
end;

/ 

set serveroutput on;
set serveroutput off;

-- 익명블록이 완료되었습니다 는 안뜬당.. 뭐지

declare
    empNo number(20);
    empName varchar2(10);
begin
    select employee_id, first_name into empNo, empName
    from employees
    where employee_id = 124;
    
    dbms_output.put_line(empNo || ' ' || empName);
end;

/





