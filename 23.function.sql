create or replace function dept_max_sal
    ( dept_id employees.department_id%type)

return number
is
    max_sal employees.salary%type;
begin
    select max(salary) into max_sal
    from employees
    where department_id = dept_id;
    return max_sal;
end;
/

select dept_max_sal(50) from dual;


create or replace function cnt_member
    (cnt number)
return number
is
    total_cnt number;
begin
    select count(*) into total_cnt
    from employees
    where department_id = cnt;
    return total_cnt;
end;
/

select cnt_member(50) from employees;
select DISTINCT cnt_member(50) from employees;
select count(*) from employees where department_id = 50;
select * from employees where department_id = 50;

select DISTINCT department_id, cnt_member(department_id) from employees order by department_id;

create or replace function avg_sal
(dept_id employees.department_id%type)
return number
is
avg_sal number;
begin
select round( avg(salary),2) into avg_sal
from employees 
where department_id = dept_id;
return avg_sal;
end;
/  

select DISTINCT department_id, avg_sal(department_id) from employees;


create or replace function emp_deptname
(emp_id employees.employee_id%type)
return varchar2
is
dept_name departments.department_name%type;
begin
    select department_name into dept_name
    from departments
    where department_id = (select department_id from employees where employee_id = emp_id);
    return dept_name;
end;
/

select last_name, department_id, emp_deptname(employee_id)
from employees;

