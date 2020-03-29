set serveroutput on;

declare
    emp_id number;
    emp_name varchar2(20);
    emp_salary number(20);
    cnt number;
    
    -- 명시적 커서 선언
    Cursor cu1 is 
    select employee_id, last_name, salary
    from employees
    where department_id = 50;
    
begin
    -- 명시적 커서 오픈
    open cu1;
    dbms_output.put_line (cnt);
    dbms_output.put_line ('사번   이름  급여');
    
    loop
    -- 커서에서 데이터 추출
    fetch cu1 into emp_id, emp_name, emp_salary;
    
    -- 조건 ( notFound : 변수에 할당 할 값이 없을 때 loop를 빠져나가겠다)
    exit when cu1%notFound; 
   dbms_output.put_line (emp_id ||' '||emp_name || ' ' || emp_salary );

    
    end loop;
    
    -- 커서 닫기
    close cu1;
    
end;
/

-- 커서와 반복문(for문)

declare
    Cursor emp_cur is
    select employee_id, last_name
    from employees;
begin
    for emp_rec in emp_cur loop
       dbms_output.put_line (emp_rec.employee_id || ' ' || emp_rec.last_name);
    end loop;
end;
/

--rowType변수

declare
    emp employees%rowtype;
    
    cursor cur1 is
    select employee_id, last_name, salary
    from employees;
    
begin
    for emp in cur1 loop
    exit when cur1%notfound;

    end loop;
end;

/


-- 커서를 선언하지않고사용

declare
begin
    for emp in (select employee_id, last_name, salary from employees)
    loop
    dbms_output.put_line (emp.employee_id || ' ' || emp.last_name || ' '|| emp.salary );
    end loop;

end;
/


-- 묵시적커서

declare
 cnt1 number;
 cnt2 number;
 
begin
    select count(*) into cnt1
    from employees
    where department_id = 20;
    
    cnt2 := sql%rowcount;
    dbms_output.put_line ('cnt1의 값 : '||cnt1 );
    dbms_output.put_line ('cnt2의 값 : '||cnt2 );

end;    
/



