set serveroutput on;

declare
    tname varchar2(20);
    
    type t_emp_name is table of
    employees.last_name%type
    index by binary_integer;
    
    v_name t_emp_name;

begin
    select last_name into tname
    from employees
    where employee_id = 100;
    
    v_name(0) := tname;
    dbms_output.put_line(v_name(0));
end;

/

declare
    type tbl_type is table of
    employees.last_name%type
    index by binary_integer;
    
    vtbl_type tbl_type;
    a binary_integer := 0;
    
begin
    for emp_name in(select last_name from employees) loop
        a:= a+1;
        vtbl_type(a) := emp_name.last_name;
    end loop;
    for i in 1..a loop
        dbms_output.put_line(vtbl_type(i));
    end loop;
end;

/
    
    
    
    
    