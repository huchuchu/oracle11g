create table employees1 as 
select employee_id, salary, department_id
from employees;

select * from employees1;

set severoutput on;

declare
    empNo       employees1.EMPLOYEE_ID%TYPE ; 
    empSalary   employees1.SALARY%TYPE ;
 
begin
    select employee_id, salary into empNo , empSalary
    from employees1
    where department_id  = 10;

    dbms_output.put_line (empNo || ' '|| empSalary);
end;

/

-- ROWTYPE

declare
    emp_row employees1%RowType;
begin
    select * into emp_row
    from employees1
    where employee_id = 100;

    dbms_output.put_line(emp_row.employee_id ||' '|| emp_row.salary||' '||emp_row.department_id );
end;

/

--ROWTYPE 활용

create table row_test(
    no number,
    name varchar2(20),
    hdate date
);

create table row_test2 as select * from row_test;

insert into row_test values(1,'아무개',sysdate);
insert into row_test values(2, '홍길동', sysdate);
insert into row_Test values(3, '고길동',sysdate);

commit;
select * from row_Test;

declare
    c_rec row_test%RowType;
begin
    select * into c_rec
    from row_test
    where no = 3;

    insert into row_Test2 values c_rec;
end;

/


select * from row_test2;



