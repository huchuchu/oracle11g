/* PL/SQL (procedual language /SQL) */

declare  
    cnt integer;  -- ��������
begin
    cnt := cnt+1;  -- ������ �� ���� �� = �� �ƴ϶� := ���!!
    if cnt is null then 
        dbms_output.put_line('��� : cnt�� ���̴�');
    end if;
end;

/ 

set serveroutput on;
set serveroutput off;

-- �͸����� �Ϸ�Ǿ����ϴ� �� �ȶ��.. ����

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





