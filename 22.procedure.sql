-- create or replace : 프로시저를 수정해거나, 수정하면서 새롭게 생성할 때 사용하는 키워드
create or replace procedure update_emp
is
begin
    update employees
    set first_name = '마이클'
    where department_id = 20 and job_id = 'MK_MAN';
end;

/

/*프로시저를 실행시키기 위한 구문
exec 또는 execute 프로시저명;

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
    
    dbms_output.put_line('사원명 : ' || emp_name);
    dbms_output.put_line('월급 : ' || emp_sal);
end;
/

set serveroutput on;

exec emp_name_sal(124); -- 매개변수 124가 서브프로그램 안으로 들어와서 사용된다 (in 모드)


--out 모드 사용 예

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
    dbms_output.put_line(emp_name || '사원의 급여는 ' || salary ||'입니다' );   
    
end;

/









