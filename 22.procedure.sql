-- create or replace : ���ν����� �����ذų�, �����ϸ鼭 ���Ӱ� ������ �� ����ϴ� Ű����
create or replace procedure update_emp
is
begin
    update employees
    set first_name = '����Ŭ'
    where department_id = 20 and job_id = 'MK_MAN';
end;

/

/*���ν����� �����Ű�� ���� ����
exec �Ǵ� execute ���ν�����;

*/
execute update_emp;

create or replace procedure up_sal
(emp_id employees.employee_id%type)
is
begin
    update employees set salary = 3500
    where employee_id = emp_id;
end;
/

SELECT salary from employees where employee_id = 130;

exec up_sal(130);


create or replace procedure emp_name_sal
    (emp_id employees.employee_id%type)
is
    emp_name employees.first_name%type;
    emp_sal employees.salary%type;
begin
    select last_name, salary into emp_name, emp_sal
    from employees
    where employee_id = emp_id;
    
    dbms_output.put_line('����� : ' || emp_name);
    dbms_output.put_line('���� : ' || emp_sal);
end;
/

set serveroutput on;

exec emp_name_sal(124); -- �Ű����� 124�� �������α׷� ������ ���ͼ� ���ȴ� (in ���)


--out ��� ��� ��

create or replace procedure emp_info
    (emp_id in employees.employee_id%type,
     emp_name out employees.last_name%type,
     emp_salary out employees.salary%type)
is
begin
    select last_name, salary into emp_name, emp_salary
    from employees
    where employee_id = emp_id;   
end;
/

declare 
    emp_name employees.last_name%type;
    salary employees.salary%type;
begin
    emp_info(124, emp_name, salary);
    dbms_output.put_line(emp_name || '����� �޿��� ' || salary ||'�Դϴ�' );   
    
end;

/









