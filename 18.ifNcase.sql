set serverout on;



declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    emp_dept employees.department_id%type;
    dept_name varchar2(20);
    
begin
    select employee_id, last_name,department_id
    into emp_id, emp_name, emp_dept
    from employees
    where employee_id = 103;
    
    if( emp_dept = 50 ) then dept_name :='shipping';
    end if;
    if( emp_dept = 60 ) then dept_name :='IT';
    end if;
    if( emp_dept = 70 ) then dept_name :='P/L';
    end if;
    if( emp_dept = 80 ) then dept_name :='sales';
    end if;
    
    dbms_output.put_line(emp_id||' '|| emp_name ||' '|| emp_dept||' '|| dept_name);
    
end;

/

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    emp_dept employees.department_id%type;
    dept_name varchar2(20);
    
begin
    select employee_id, last_name,department_id
    into emp_id, emp_name, emp_dept
    from employees
    where employee_id = 103;

    if( emp_dept = 50 ) then dept_name :='shipping';
    elsif( emp_dept = 60 ) then dept_name :='IT';    --else if �� �ƴϴ�!!elsif�� �Ϳ�
    elsif( emp_dept = 70 ) then dept_name :='P/L';
    elsif( emp_dept = 80 ) then dept_name :='sales';
    end if;
    
    dbms_output.put_line(emp_id||' '|| emp_name ||' '|| emp_dept||' '|| dept_name);
end;

/

-- ������ �ΰ�, case

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    emp_comm employees.COMMISSION_PCT%type := null; -- �����ϸ鼭 �ʱ�ȭ
begin
    select employee_id, last_name, commission_pct
    into emp_id, emp_name, emp_comm
    from employees
    where employee_id = 155;
    
    -- �̶��� �׳� else
    if (emp_comm > 0) then 
    dbms_output.put_line(emp_name || '�� ���ʽ��� '|| emp_comm);
    else
    dbms_output.put_line(emp_name || '�� ���ʽ��� �����ϴ�');
    end if;
end;

/

--case

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    emp_dept employees.department_id%type;
    dept_name varchar2(20);
    
begin
    select employee_id, last_name, department_id
    into emp_id, emp_name, emp_dept
    from employees
    where employee_id = &empno;
    
    dept_name := case emp_dept
                            when 50 then 'shipping'
                            when 60 then 'IT'
                            when 70 then 'P/L'
                            when 80 then 'sales'
                            end;
dbms_output.put_line(emp_id||' '|| emp_name ||' '|| emp_dept||' '|| dept_name);
end;

/

    
