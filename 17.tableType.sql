set serveroutput on;

declare
    tname varchar2(20);
    
    --����
    Type t_emp_name is table of
    employees.last_name%type
    index by binary_integer;  --�迭�����̹Ƿ� index�� �ʿ��ѵ� binary_integerŸ���� index�̴�
    
    --����
    v_name t_emp_name; -- v_name �� ���̺�Ÿ���� ����

begin
    
    select last_name into tname
    from employees 
    where employee_id = 100;
    
    v_name(0) := tname;    
    
    dbms_output.put_line(v_name(0));

end;

/


--�ݺ����� �̿��� �迭 ���

declare
    
    type tbl_type is table of
    employees.last_name%type
    index by binary_integer;
    
    vtbl_type tbl_type;
    
    --binary_integer ���� 0���� �ʱ�ȭ
    --i ��� ������ ���� �ʱ�ȭ
    i binary_integer := 0;
    
begin

    for emp_name in (select last_name from employees) loop
    i:= i+1;
    vtbl_type(i) := emp_name.last_name; 
    end loop;
    for j in 1..i loop -- ���� j�� 1���� i���� �����ڴ�
        dbms_output.put_line(vtbl_type(j));
    end loop;

end;

/

-- ����Ʈ ���� (�� PL/SQL ����)
-- ȣ��Ʈ ȯ�濡�� �����Ǿ� �����͸� �����ϱ⶧���� ȣ��Ʈ������� ���Ѵ� <- ������ ���������ʰ� �ٷλ�밡��
-- Ű���� VARIABLE�� �̿��ϸ�, SQL���̳� PL/SLQ��Ͽ����� ��밡��
-- PL/SQL ����� ����� �Ŀ��� �������� �����ϴ�
-- print ����� �̿��Ͽ� ����� �����ϴ�
-- :�� �ٿ� �̿��Ѵ�

set autoprint on;

begin
    select (salary*12+nvl(commission_pct*salary,0)) into :vsal 
    from employees
    where employee_id = 100;
    
end;
/

print vsal; 

-- �� �ȳ���...���..

    